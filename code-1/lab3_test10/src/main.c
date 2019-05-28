/**
 * @file   main.c
 *
 * @brief Test to check PCP priority changing only on resource request
 *
 */

#include <stdlib.h>
#include <stdio.h>
#include <mutex_type.h>
#include <syscall_thread.h>

/** @brief thread user space stack size - 4KB */
#define USR_STACK_WORDS 1024

uint32_t idle_stack[USR_STACK_WORDS];
uint32_t thread1_stack[USR_STACK_WORDS];
uint32_t thread2_stack[USR_STACK_WORDS];
uint32_t thread3_stack[USR_STACK_WORDS];
mutex_t mutex1;
mutex_t mutex2;

/** @brief Prints basic status information of a thread
 *
 *  @param name   the thread's base priority
 *  @param count  the thread's counter variable
 */
void print_status(int name, int counter) {
  printf("t = %d --- Task: %d Count: %d, Curr_Prio; %d\n",
        get_time(), name, counter, get_priority());
}

/** @brief Default idle thread which just loops infinitely
 */
void idle_thread(void) {
  while(1);
}

/** @brief Basic thread which just increments a counter
 */
void thread_1(void) {
  int cnt = 0;
  while(1) {
    print_status(1, cnt++);
    mutex_lock(&mutex1);
    print_status(1, cnt++);
    spin_wait(75);
    mutex_unlock(&mutex1);
    wait_until_next_period();
  }
}

/** @brief Basic thread which just increments a counter
 */
void thread_2(void) {
  int cnt = 0;
  while(1) {
    print_status(2, cnt++);
    mutex_lock(&mutex2);
    print_status(2, cnt++);
    spin_wait(75);
    mutex_unlock(&mutex2);
    wait_until_next_period();
  }
}

void thread_3(void) {
    int cnt = 0;
    print_status(3, cnt++);
    mutex_lock(&mutex2);
    mutex_lock(&mutex1);
    print_status(3, cnt++);
    spin_wait(350); // Interrupted by T1
    print_status(3, cnt++);
    mutex_unlock(&mutex1);
    spin_wait(5);
    print_status(3, cnt++);
    spin_wait(190); // interrupted by T2
    print_status(3, cnt++);
    mutex_unlock(&mutex2);
    spin_wait(1);
    print_status(3, cnt++);
    exit(0);
}

int main(void) {
  int status;
  status = thread_init(&idle_thread, &idle_stack[USR_STACK_WORDS-1]);
  if (status) {
    printf("Failed to initialize thread library: %d\n", status);
    return 1;
  }

  status = thread_create(&thread_1, &thread1_stack[USR_STACK_WORDS-1],
          1, 100, 500);
  if (status) {
    printf("Failed to create thread 1: %d\n", status);
    return 1;
  }

  status = thread_create(&thread_2, &thread2_stack[USR_STACK_WORDS-1],
          2, 100, 500);
  if (status) {
    printf("Failed to create thread 2: %d\n", status);
    return 1;
  }

  status = thread_create(&thread_3, &thread3_stack[USR_STACK_WORDS-1],
          3, 750, 2000);
  if (status) {
    printf("Failed to create thread 3: %d\n", status);
    return 1;
  }

  status = mutex_init(&mutex1, 1);
  if (status) {
    printf("Mutex 1 initialization failed: %d\n", status);
    return 1;
  }

  status = mutex_init(&mutex2, 2);
  if (status) {
    printf("Mutex 2 initialization failed: %d\n", status);
    return 1;
  }

  printf("Successfully created threads! Starting scheduler...\n");

  status = scheduler_start();
  if (status) {
    printf("Threads are unschedulable! %d\n", status);
    return 1;
  }

  // Should never get here.
  return 2;
}
