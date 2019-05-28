/**
 * @file   kernel.c
 *
 * @brief  entry point to the raspberry pi kernel
 *
 * @date   10/17/17
 * @author James Zhang <jameszha@andrew.cmu.edu>
 */

#include <arm.h>
#include <kstdint.h>
#include <uart.h>
#include <printk.h>
#include <timer.h>
#include <supervisor.h>
#include <swi_num.h>
#include <syscalls.h>
#include <screen.h>
#include <ads1015.h>
#include <gpio.h>

/** @brief value to indicate screen should not keep drawing (0 or 1)*/
int stop = 0;
/** @brief value to see when reset button press is complete (0 or 1)*/
uint8_t prevReset =0;
/** @brief value to see when toggle button press is complete (0 or 1)*/
uint8_t prevToggle = 0;

/** @brief indicate which visualizer mode should be running (0 or 1)*/
int screenMode =1;

/**
 * @brief The kernel entry point
 */
void kernel_main(void) {
  timer_stop();
  disable_interrupts();
  timer_clear_pending();

  install_interrupt_table();
  uart_init();
  mutex_count = 0;

  oled_init();
  oled_clear_screen();
  oled_buf_clr();

  enter_user_mode();
  while (1) {
  }
}

uint32_t get_top_priority(void){ //fixed to handle dynamic priority
  uint32_t i;
  uint32_t top_index = 32;
  uint32_t top_priority = 32; 
  for (i = 0; i < NUM_THREADS; i++){
    if (TCBs[i].current_priority <= top_priority && (runnable_BV & (1 << i))) {
      top_index = i;
      top_priority = TCBs[i].current_priority;
    }
  }
  return top_index;
}

void store_current_task(uint32_t* args){
  if (running_index == NO_RUNNING_TASKS) return;
  if (TCBs[running_index].status == RUNNING) {
    TCBs[running_index].status = RUNNABLE;
  }
  else if (TCBs[running_index].status == WAITING) {
    runnable_BV &= ~(1 << running_index);
    waiting_BV |= (1 << running_index);
    TCBs[running_index].next_wakeup += TCBs[running_index].period;
  }
  TCBs[running_index].user_lr = args[19];
  TCBs[running_index].user_sp = args[18];
  TCBs[running_index].r12 = args[17];
  TCBs[running_index].r11 = args[16];
  TCBs[running_index].r10 = args[15];
  TCBs[running_index].r9 = args[14];
  TCBs[running_index].r8 = args[13];
  TCBs[running_index].r7 = args[12];
  TCBs[running_index].r6 = args[11];
  TCBs[running_index].r5 = args[10];
  TCBs[running_index].r4 = args[9];
  TCBs[running_index].r3 = args[8];
  TCBs[running_index].r2 = args[7];
  TCBs[running_index].r1 = args[6];
  TCBs[running_index].r0 = args[5];
  TCBs[running_index].svc_lr = args[4];
  TCBs[running_index].svc_sp = args[3];
  TCBs[running_index].svc_spsr = args[2];
  TCBs[running_index].irq_lr = args[1];
  TCBs[running_index].irq_spsr = args[0];
}

void restore_next_task(uint32_t* args){
  if (TCBs[running_index].status == RUNNABLE) {
    TCBs[running_index].status = RUNNING;
  }
  args[19] = TCBs[running_index].user_lr;
  args[18] = TCBs[running_index].user_sp;
  args[17] = TCBs[running_index].r12;
  args[16] = TCBs[running_index].r11;
  args[15] = TCBs[running_index].r10;
  args[14] = TCBs[running_index].r9;
  args[13] = TCBs[running_index].r8;
  args[12] = TCBs[running_index].r7;
  args[11] = TCBs[running_index].r6;
  args[10] = TCBs[running_index].r5;
  args[9] = TCBs[running_index].r4;
  args[8] = TCBs[running_index].r3;
  args[7] = TCBs[running_index].r2;
  args[6] = TCBs[running_index].r1;
  args[5] = TCBs[running_index].r0;
  args[4] = TCBs[running_index].svc_lr;
  args[3] = TCBs[running_index].svc_sp;
  args[2] = TCBs[running_index].svc_spsr;
  args[1] = TCBs[running_index].irq_lr;
  args[0] = TCBs[running_index].irq_spsr;
  return;
}

void enforce(void){
  if(running_index != IDLE_NUM) { 
    TCBs[running_index].runTime += 1;
    
    if(TCBs[running_index].runTime > TCBs[running_index].execution_time) {
      TCBs[running_index].status = WAITING;
    }

    if (TCBs[running_index].spin_wait_time != 0) {
        TCBs[running_index].spin_wait_time -= 1;
    }
  }

}

void wakeup(void){
  uint32_t i;
  for (i = 0; i < NUM_THREADS; i++){
    if ((waiting_BV & (1 << i)) && (system_time > TCBs[i].next_wakeup)){
      TCBs[i].status = RUNNABLE;
      TCBs[i].runTime = 0;
      waiting_BV &= ~(1 << i);
      runnable_BV |= (1 << i);
    }
  }
}

/**
 *@brief function to blank out and reset the OLED screen 
 */
void resetScreen() {
  stop = 0;
  oled_clear_screen();
  oled_buf_clr();
  int i;
  for(i = 0; i < IDLE_NUM; i++) {
    TCBs[i].timeConsumption = 0;
  }
}

/**
 * @brief To control the OLED screen and switch modes and reset
 */
void visualizer() {
  /* Visualizer code*/
  if(running_index != IDLE_NUM) {
    TCBs[running_index].timeConsumption++;
  }
  int8_t toggleButton = gpio_get_level(CENTER);
  int8_t resetButton = gpio_get_level(DOWN);


  if(resetButton == 1) {
    prevReset = 1;
  }
  if(toggleButton == 1){
    prevToggle = 1;
  }
  if(toggleButton ==0 && prevToggle ==1) {
    prevToggle = 0;
    screenMode = 1-screenMode; 
    resetScreen();
  }
  int column = 0;
  if(screenMode) {
    column = (system_time/UP_TIME) % TOTAL_COL; 
    if(column == 0) {
        oled_clear_screen();
        oled_buf_clr();
    }
    oled_buf_pixel_set(running_index, column);
    if((system_time%DRAW_TIME) == 0) {
        oled_buf_draw();
    }
  }
  else {
    if(resetButton == 0 && prevReset == 1){
      resetScreen();
      prevReset= 0;
    }
    column = (TCBs[running_index].timeConsumption/DRAW_TIME)%TOTAL_COL;
    if(running_index != IDLE_NUM) {
        oled_buf_pixel_set(running_index, column);
    }
    if((!stop) && (system_time%DRAW_TIME) == 0) {
        if(column == TOTAL_COL-1) {
            stop = 1 ;
        }
        oled_buf_draw();
    }
  }
 /* Visualizer end*/

}

/**
 * @brief Handler called when an IRQ occurs
 */
void *irq_c_handler(uint32_t* args) {
  if(timer_is_pending()) timer_clear_pending();

  system_time++;


  enforce();
  store_current_task(args);
  
  wakeup();
  //uint32_t old_index = running_index;
  running_index = get_top_priority();
  //if(old_index != running_index) printk("t:%d | %d -> %d\n", system_time, 
  //old_index, running_index);

  visualizer();

  restore_next_task(args);
  return args;
}



/**
 * @brief Handles the given swi_num
 *
 * @param swi_num the swi number passed in from swi_asm_handler
 * @param args pointer to arguments array, set up by the swi_asm_handler
 *
 * @return the return result of the syscall
 */
void *swi_c_handler(int swi_num, int *args) {
  enable_interrupts();
  void *result = NULL;
  switch(swi_num){
    case SWI_SBRK:
      result = (void*) syscall_sbrk(args[0]);
      break;
    case  SWI_WRITE: 
      result = (void*) syscall_write(args[0], (char*)args[1], args[2]);
      break;
    case  SWI_CLOSE:
      result = (void*) syscall_close(args[0]);
      break;
    case  SWI_FSTAT:
      result = (void*) syscall_fstat(args[0], (void*)args[1]);
      break;
    case  SWI_ISATTY:
      result = (void*) syscall_isatty(args[0]);
      break;
    case  SWI_LSEEK:
      result = (void*) syscall_lseek(args[0], args[1], args[2]);
      break;
    case  SWI_READ:
      result = (void*) syscall_read(args[0], (char*)args[1], args[2]);
      break;
    case  SWI_EXIT: 
      syscall_exit(args[0]);
      break;
    case  SWI_THR_INIT:
      result = (void*) thread_init((thread_fn)args[0], (uint32_t*)args[1]);
      break;
    case  SWI_THR_CREATE:
      result = (void*) thread_create((thread_fn)args[0], (uint32_t*)args[1],
      (unsigned int)args[2], (unsigned int)args[3], (unsigned int)args[16]);
      break;
    case  SWI_MUT_INIT:
      result = (void*) mutex_init((mutex_t*)args[0], (unsigned int) args[1]);
      break;
    case  SWI_MUT_LOK:
      mutex_lock((mutex_t*)args[0]);
      break;
    case  SWI_MUT_ULK:
      mutex_unlock((mutex_t*)args[0]);
      break;
    case  SWI_WAIT:
      wait_until_next_period();
      break;
    case  SWI_TIME:
      result = (void*) get_time();
      break;
    case  SWI_SCHD_START:  
      result = (void*) scheduler_start();
      break;
    case  SWI_PRIORITY:  
      result = (void*) get_priority();
      break;
    case  SWI_SPIN_WAIT:
      spin_wait((unsigned) args[0]);
      break;
    default: break;
  }
  disable_interrupts();
  return result;
}
