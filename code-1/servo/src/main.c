/**
 * @file   main.c
 *
 * @brief  User Servo Interface
 *
 * @date   10/17/17
 * @author James Zhang <jameszha@andrew.cmu.edu>
 */

// #include <arm.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <349libc.h>
#include <string.h>

/** @brief Buffer size */
#define BUF_SIZE 128

/**
 * @brief User main function.
 * 
 */
int main(void) {
  thread_init(thread_fn idle_fn, uint32_t *idle_stack_start)
  return 0;
}

void idle_thread(void){
  while(1);
}