/**
 * @file   syscalls.c
 *
 * @brief  Implementation of syscalls needed for newlib and 349 custom syscalls
 *
 * @date   10/17/17
 * @author James Zhang <jameszha@andrew.cmu.edu>
 */

#include <arm.h>
#include <kstdint.h>
#include <printk.h>
#include <uart.h>
#include <syscalls.h>



/** @brief Global variable to keep track of where our heap ends */
char *heap_end = 0;


void syscall_exit(int status) {
  disable_interrupts();
  while(1){}
  return;
}


int syscall_write(int file, char *ptr, int len) {
  if (file != STDOUT_FILENO) return -1;
  int i;
  for (i = 0; i < len; i++){
    uart_put_byte(ptr[i]);
  }
  return len;
}


/**
 * Reads until all len bytes are read or newline/return is found.
 * Detects backspace and EOL characters and handles them appropriately.
 *
 * The idea is to mimic normal terminal reading input, that is,
 * if the user hits backspace it should erase the previously read character.
 */
int syscall_read(int file, char *ptr, int len) {
  if (file != STDIN_FILENO) return -1;
  int num_read = 0;
  uint8_t new_char;
  while(((new_char = uart_get_byte()) != 4) && (num_read < len)){
    //check for backspace char or delete char
    if ((new_char == 8) || (new_char == 127)){
      if (num_read > 0) {
        num_read--;
        uart_put_byte('\b');uart_put_byte(' ');uart_put_byte('\b');
      }
    }
    //check for Windows or Unix return
    else if ((new_char == 10) || ((new_char == 13) && uart_get_byte() == 10)){
      ptr[num_read++] = '\n';
      uart_put_byte('\n');
      break;
    }
    //normal char
    else{
      ptr[num_read++] = new_char;
      uart_put_byte(new_char);
    }
    
  }
  ptr[num_read] = '\0';
  return num_read;
}

int thread_init(thread_fn idle_fn, uint32_t *idle_stack_start){
  runnable_BV = 0;
  waiting_BV = 0;
  running_index = NO_RUNNING_TASKS;
  printk("THREAD INIT = %d\n", running_index);
  return thread_create(idle_fn, idle_stack_start, 31, -1, -1);
}

int thread_create(thread_fn fn, uint32_t *stack_start, unsigned int prio, 
                    unsigned int C, unsigned int T){
  if (fn == NULL || stack_start == NULL) return -1;
  if (runnable_BV & (1 << prio)) return -1; 
  //if there is already a task of the given priority

  runnable_BV |= (1 << prio);

  //initialize status
  TCBs[prio].status = RUNNABLE;
  TCBs[prio].priority = prio;
  TCBs[prio].current_priority = prio;
  TCBs[prio].execution_time = C;
  TCBs[prio].period = T;
  TCBs[prio].next_wakeup = 0;
  TCBs[prio].next_sleep;
  TCBs[prio].runTime = 0;
  TCBs[prio].spin_wait_time = 0;

  //initialize context
  TCBs[prio].fn = (uint32_t) fn;
  TCBs[prio].irq_lr = (uint32_t) fn;
  TCBs[prio].irq_spsr = 0x10;
  TCBs[prio].user_sp = (uint32_t) (stack_start);
  return 0;
}

int mutex_init(mutex_t *mutex, unsigned int max_prio){
  if (mutex_count >= 32) return -1; //already too many mutexes
  
  mutex->locked = 0;
  mutex->max_prio = max_prio;
  mutex->mutex_ID = mutex_count;
  mutex->blocking_BV = 0;

  mutexes[mutex_count] = mutex;
  mutex_count++;
  return 0;
}


void mutex_lock(mutex_t *mutex){
  uint32_t current_priority = TCBs[running_index].current_priority;

  uint32_t i = 0;
  //search through each mutex and determine if the current thread's priority
  //is greater than the mutex's priority ceiling
  while(i < mutex_count || mutex->locked){
    mutex_t *temp_mutex = mutexes[i];

    //the mutex is held by the current thread. Skip over it
    if (temp_mutex->locked && temp_mutex->holder == running_index){
      i++;
      continue;
    }

    //thread is blocked by the mutex
    if (temp_mutex->locked && temp_mutex->max_prio <= current_priority) {
      disable_interrupts();

      //priority inheritance
      if (TCBs[temp_mutex->holder].current_priority > current_priority) {
        TCBs[temp_mutex->holder].current_priority = current_priority;
      }
      //place the thread on the mutex's blocked bitvector
      temp_mutex->blocking_BV |= (1 << running_index); 
      enable_interrupts();
      i = 0;
    }

    //thread is not blocked by the mutex
    else {
      //remove thread from the mutex's blocked bitvector
      temp_mutex->blocking_BV &= ~(1 << running_index);
      i++;
    }
  }

  disable_interrupts();
  mutex->holder = running_index;
  mutex->locked = 1;
  enable_interrupts();
}

void mutex_unlock(mutex_t *mutex){
  disable_interrupts();
  mutex->locked = 0;
  uint32_t next_highest_priority = TCBs[running_index].priority;
  uint32_t i;
  for (i = 0; i < mutex_count; i++){
    mutex_t *temp_mutex = mutexes[i];
    if (temp_mutex->locked && temp_mutex->holder == running_index){ 
    //if the mutex is being held by current running task
      uint32_t thread;
      for(thread = 0; thread < 32; thread++){            
      //find the highest blocked thread from each mutex
        if (temp_mutex->blocking_BV & (1 << thread)){
          uint32_t thread_priority = TCBs[thread].current_priority;
          if (thread_priority < next_highest_priority) 
            next_highest_priority = thread_priority;
        }
      }
    }
  }
  TCBs[running_index].current_priority = next_highest_priority;
  enable_interrupts();
}

int scheduler_start(void){

  gpio_set_pull(CENTER, GPIO_PULL_UP);
  gpio_set_pull(DOWN, GPIO_PULL_UP);
  gpio_set_pull(LEFT, GPIO_PULL_UP);
  gpio_config(CENTER, GPIO_FUN_INPUT);
  gpio_config(DOWN, GPIO_FUN_INPUT);
  gpio_config(LEFT, GPIO_FUN_INPUT);


  UBTest[1] =  1;
  UBTest[2] =  0.82842;
  UBTest[3] =  0.77976;
  UBTest[4] =  0.75682;
  UBTest[5] =  0.74349;
  UBTest[6] =  0.73477;
  UBTest[7] =  0.72862;
  UBTest[8] =  0.72406;
  UBTest[9] =  0.72053;
  UBTest[10] = 0.71773;
  UBTest[11] = 0.71545;
  UBTest[12] = 0.71355;
  UBTest[13] = 0.71195;
  UBTest[14] = 0.71059;
  UBTest[15] = 0.70941;
  UBTest[16] = 0.70838;
  UBTest[17] = 0.70747;
  UBTest[18] = 0.70666;
  UBTest[19] = 0.70594;
  UBTest[20] = 0.70529;
  UBTest[21] = 0.70471;
  UBTest[22] = 0.70418;
  UBTest[23] = 0.70369;
  UBTest[24] = 0.70325;
  UBTest[25] = 0.70284;
  UBTest[26] = 0.70246;
  UBTest[27] = 0.70212;
  UBTest[28] = 0.70179;
  UBTest[29] = 0.70149;
  UBTest[30] = 0.70121;
  UBTest[31] = 0.70095;
  UBTest[32] = 0.70070;

  int i;
  int runCnt = 0;

  double cpuUtil = 0;
  for(i = 0; i < IDLE_NUM; i++ ) {
    if(runnable_BV & (1 << i)) {
      runCnt += 1;
      cpuUtil += ((double)(TCBs[runCnt].execution_time))
                    /((double)(TCBs[runCnt].period));
    }
  }
  if(cpuUtil > UBTest[runCnt]) {
    return -1; 
  }

  system_time = 0;
  TCBs[IDLE_NUM].status = RUNNING;
  running_index = IDLE_NUM;
  enable_interrupts();
  timer_start(1000);
  while(1);
  return 0;
}

void wait_until_next_period(void) {
  //printk("Thread %d waiting until next period\n", running_index);
  TCBs[running_index].status = WAITING;
  while(TCBs[running_index].status == WAITING);
}

unsigned int get_time(void){
  return system_time;
}

unsigned int get_priority(void){
  return TCBs[running_index].current_priority;
}

void spin_wait(unsigned ms) {
  TCBs[running_index].spin_wait_time = ms;
  while(TCBs[running_index].spin_wait_time > 0);
}

/*****************************************************************************/
/* TA system call implementations:                                           */
/*****************************************************************************/

void *syscall_sbrk(int incr) {
  extern char __heap_low; // Defined by the linker
  extern char __heap_top; // Defined by the linker
  char *prev_heap_end;

  if (heap_end == 0) {
    // Initialize heap_end if this is the first time sbrk was called
    heap_end = &__heap_low;
  }

  prev_heap_end = heap_end;
  if (heap_end + incr > &__heap_top) {
    // Heap and stack collision, return error
    return (void *) -1;
  }

  // update heap_end and return old heap_end
  heap_end += incr;
  return (void *) prev_heap_end;
}

int syscall_close(int file) {
  return -1;
}

int syscall_fstat(int file, void *st) {
  return 0;
}

int syscall_isatty(int file) {
  return 1;
}

int syscall_lseek(int file, int ptr, int dir) {
  return 0;
}
