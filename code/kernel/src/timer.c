/**
 * @file   timer.c
 *
 * @brief  Implementation of routines for interacting with ARM timer
 *
 * @date   10/17/17
 * @author James Zhang <jameszha@andrew.cmu.edu>
 */

#include <timer.h>



void timer_start(int freq) {
  *TIMER_LOAD = freq;       //load freq into timer
  *TIMER_CONTROL |= 0x2;    //set 32-bit mode
  *TIMER_CONTROL &= ~0xC;   //set prescaler of 1
  *TIMER_CONTROL |= 0x20;   //enable timer interrupt
  *IRQ_BASIC_ENABLE |= 0x1; //enable ARM timer IRQ
  *TIMER_CONTROL |= 0x80;   //enable
  return;
}

void timer_stop(void) {
  *IRQ_BASIC_DISABLE |= 0x1; //disable ARM timer IRQ
  *TIMER_CONTROL &= ~0x20;   //disable timer interrupt
  *TIMER_CONTROL &= ~0x80;   //disable
  return;
}


int timer_is_pending(void) {
  if (*IRQ_BASIC_PENDING & 0x1) return 1;
  return 0;
}


void timer_clear_pending(void) {
  *TIMER_CLEAR_IRQ |= 0x1; //clear timer irq
  return;
}
