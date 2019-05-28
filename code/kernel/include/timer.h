/**
 * @file   timer.h
 *
 * @brief  Routines for interacting with the ARM timer.
 *
 * @date   September 26, 2015
 * @author Kenneth Li <kyli@andrew.cmu.edu>
 */

#ifndef _TIMER_H_
#define _TIMER_H_

//Register Addresses
/** @brief Timer Load Register */
#define TIMER_LOAD (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B400)
/** @brief Timer Value Register */
#define TIMER_VALUE (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B404)
/** @brief Timer Control Register */
#define TIMER_CONTROL (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B408)
/** @brief Timer Clear IRQ Register */
#define TIMER_CLEAR_IRQ (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B40C)
/** @brief Basic pending IRQ register address */
#define IRQ_BASIC_PENDING (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B200)
/** @brief Basic enable IRQ register address */
#define IRQ_BASIC_ENABLE (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B218)
/** @brief Basic disable IRQ register address */
#define IRQ_BASIC_DISABLE (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x00B224)


#include <BCM2836.h>
#include <kstdint.h>
 
/**
 * @brief Configures the arm timer to start running with the given frequency. The Timer
 *        should run in 32 bit mode, with a prescaler of 1, and with interrupts enabled.
 *
 * @param freq  frequency at which to run the timer
 */
void timer_start(int freq);

/**
 * @brief Disables timer IRQs
 */
void timer_stop(void);

/**
 * @brief Determines if there is currently a pending timer interrupt
 *
 * @return 1 if timer interrupt is pending, 0 if not.
 */
int timer_is_pending(void);

/**
 * @brief Should be called to acknowledge that a timer interrupt occurred and has been
 *        appropriately handled. Will clear the pending bit in the timer's MMIO registers.
 */
void timer_clear_pending(void);

#endif /* _TIMER_H_ */