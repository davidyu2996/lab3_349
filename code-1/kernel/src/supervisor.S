/**
 * @file   supervisor.S
 *
 * @brief  Assembly implementation to setup interrupts and enter/exit user mode
 *
 * @date   ???
 * @author ??? <???@andrew.cmu.edu>
 */

.section ".text"

/**
 * vector table that is loaded by install_vector_table to address 0x0
 */
interrupt_vector_table:
  // ARM core does the following on interrupt:
  // 1) save cpsr into spsr
  // 2) set mode bits in current cpsr
  // 3) disable further interrupts of lower/same priority
  // 4) store return address in lr
  // 5) set pc to correct vector table entry below
  ldr pc, _reset_asm_handler                 // priority: 1st
  ldr pc, _undefined_instruction_asm_handler // priority: 6th
  ldr pc, _swi_asm_handler                   // priority: 6th
  ldr pc, _prefetch_abort_asm_handler        // priority: 5th
  ldr pc, _data_abort_asm_handler            // priority: 2nd
  ldr pc, _reset_asm_handler                 // priority: undefined
  ldr pc, _irq_asm_handler                   // priority: 4th
  ldr pc, _fiq_asm_handler                   // priority: 3rd

/**
 * SOFT vector table that is loaded by install_vector_table ABOVE
 * interrupt_vector_table
 */
// to make sure the addresses are aligned this must follow the
// actual vector table above!
_reset_asm_handler:                 .word reset_asm_handler
_undefined_instruction_asm_handler: .word undefined_instruction_asm_handler
_swi_asm_handler:                   .word swi_asm_handler
_prefetch_abort_asm_handler:        .word prefetch_abort_asm_handler
_data_abort_asm_handler:            .word data_abort_asm_handler
_irq_asm_handler:                   .word irq_asm_handler
_fiq_asm_handler:                   .word fiq_asm_handler

/**
 * called to install the vector table at address 0x0
 */
.global install_interrupt_table
install_interrupt_table:
  stmfd sp!, {r0-r12, lr}
  ldr r0, =interrupt_vector_table
  mov r1, #0
  //copy vector table
  ldm r0!, {r2-r9}
  stm r1!, {r2-r9}
  //copy soft vector table
  ldm r0!, {r2-r8}
  stm r1!, {r2-r8}
  ldmfd sp!, {r0-r12, lr}
  bx lr

/************************************************************/
/* Assembly handlers for interrupts in the vector table     */
/************************************************************/

/* SWI asm handler that uses the system/user stack.
 *    This allows us to not have to worry about allocating a new supervisor stack
 *    for each thread.
 *    Done and tested on servo.
 */
swi_asm_handler:
  //save gp regs and user lr
  msr cpsr_c, #0xDF              //enter system mode
  sub sp, sp, #8                 //make space for supervisor spsr and lr
  stmfd sp!, {r0-r12, lr}
  mov r1, sp

  //save supervisor lr and spsr, and place SWI num into r0
  msr cpsr_c, #0xD3              //return to supervisor
  mrs r2, spsr
  str r2, [r1, #14*4]            //store supervisor spsr on user stack
  str lr, [r1, #15*4]            //store supervisor lr on user stack
  ldr r0, [lr, #-4]              //pull SWI number from usermode pc-4
  bic r0, r0, #0xff000000

  //branch to C handler
  msr cpsr_c, #0xDF              //enter system mode
  bl swi_c_handler               //void *swi_c_handler(int swi_num, int *args)

  //restore supervisor lr and spsr
  mov r1, sp
  msr cpsr_c, #0xD3              //return to supervisor
  ldr lr, [r1, #15*4]            //pull supervisor lr from user stack
  ldr r2, [r1, #14*4]            //pull supervisor spsr from user stack
  msr spsr, r2

  //restore gp regs and user lr
  msr cpsr_c, #0xDF              //enter system mode
  add sp, sp, #4                 //ignore r0
  ldmfd sp!, {r1-r12, lr}
  add sp, sp, #8                 //remove space used for supervisor spsr and lr

  //return back to user mode
  msr cpsr_c, #0xD3              //return to supervisor
  movs pc, lr

// Store everything on IRQ stack
/* 19  user_lr
 * 18  user_sp
 * 17  r12
 * 16  r11
 *     .
 *     .
 *     .
 * 5   r0
 * 4   svc_lr
 * 3   svc_sp  (UNNECESSARY)
 * 2   svc_spsr
 * 1   irq_lr
 * 0   irq_spsr <-- irq_sp (r0)
 *
 */
irq_asm_handler:
  ldr sp, =__irq_stack_top

  //store user mode registers
  stmfd sp, {r0-r12, sp, lr}^
  sub sp, sp, #15*4

  //store supervisor mode registers
  msr cpsr_c, #0xD3              //enter supervisor
  mrs r0, spsr                   //place supervisor registers in gp registers
  mov r1, sp
  mov r2, lr
  msr cpsr_c, #0xD2              //return to IRQ
  stmfd sp!, {r0-r2}

  //store irq mode registers
  mrs r0, spsr
  sub lr, lr, #4
  stmfd sp!, {r0, lr}

  //branch to C handler
  mov r0, sp
  //msr cpsr_c, #0xD1              //enter supervisor
  bl irq_c_handler
  //msr cpsr_c, #0xD2              //return to IRQ

  //restore irq mode registers
  ldmfd sp!, {r0, lr}
  msr spsr, r0

  //restore supervisor mode registers
  ldmfd sp!, {r0-r2}
  msr cpsr_c, #0xD3              //enter supervisor
  msr spsr, r0
  mov sp, r1
  mov lr, r2
  msr cpsr_c, #0xD2              //return to IRQ

  //restore user mode registers
  ldmfd sp, {r0-r12, sp, lr}^
  add sp, sp, #15*4
  movs pc, lr

  ; ldr sp, =__irq_stack_top
  ; msr cpsr_c, #0xDF              //enter system mode
  ; stmfd sp!, {r0-r12, lr}        //save user mode registers
  ; mov r0, sp
  ; msr cpsr_c, #0xD3              //enter supervisor
  ; mrs r1, spsr
  ; stmfd r0!, {lr, r1}            //save supervisor registers
  ; msr cpsr_c, #0xD2              //enter IRQ
  ; sub lr, lr, #4
  ; mrs r1, spsr
  ; stmfd r0!, {r1}                //save IRQ spsr

  ; stmfd sp!, {lr}
  ; mov r1, sp
  ; //Enter C handler
  ; //r0 is old user sp, r1 points to old pc
  ; bl irq_c_handler
  ; //Return from C handler 
  ; ldmfd sp!, {lr}
  ; //lr is new pc, r0 is new user sp
  
  ; ldmfd r0!, {r1}                //restore IRQ spsr
  ; msr spsr, r1
  ; msr cpsr_c, #0xD3              //enter supervisor
  ; ldmfd r0!, {lr, r1}            //restore supervisor registers
  ; msr spsr, r1
  ; msr cpsr_c, #0xDF              //enter system mode
  ; mov sp, r0
  ; ldmfd sp!, {r0-r12, lr}        //restore user registers
  ; msr cpsr_c, #0xD2              //enter IRQ
  ; movs pc, lr


reset_asm_handler:
  b _start // just reset the kernel


/************************************************************
 * If you fall into one of these handlers something bad is
 * happening. bkpt will drop back into gdb so you can debug.
 ************************************************************/
undefined_instruction_asm_handler:
  bkpt

prefetch_abort_asm_handler:
  bkpt

data_abort_asm_handler:
  bkpt

fiq_asm_handler:
  bkpt


/************************************************************/
/* Initializes cpsr for user mode and jumps to user program */
/************************************************************/
.global enter_user_mode
enter_user_mode:
  stmfd sp!, {r0-r12, lr}

  //set cpsr to user mode
  mrs     r0, cpsr
  bic     r0, r0, #0xff
  orr     r0, r0, #0xD0
  msr     cpsr_c, r0
  //set stack pointer to user stack
  ldr sp, =__user_stack_top

  b __user_program
