/**
 * @file   uart.h
 *
 * @brief  hardware interaction for UART on pi
 *
 * @date   July 25th 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#ifndef _UART_H_
#define _UART_H_

#include <BCM2836.h>
#include <kstdint.h>

//GPIO
/** @brief GPIO UART RX pin */
#define RX_PIN 15
/** @brief GPIO UART TX pin */
#define TX_PIN 14

//Register Addresses
/** @brief Auxiliary Enables */
#define AUX_ENB_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215004)
/** @brief Mini Uart I/O Data */
#define AUX_MU_IO_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215040)
/** @brief Mini Uart Interrupt Enable */
#define AUX_MU_IER_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215044)
/** @brief Mini Uart Interrupt Identify */
#define AUX_MU_IIR_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215048)
/** @brief Mini Uart Line Control */
#define AUX_MU_LCR_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x21504C)
/** @brief Mini Uart Line Status */
#define AUX_MU_LSR_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215054)
/** @brief Mini Uart Extra Control */
#define AUX_MU_CNTL_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215060)
/** @brief Mini Uart Baudrate */
#define AUX_MU_BAUD_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215068)

//System Constants
/** @brief System Clock Frequency */
#define SYS_CLK_FREQ 250000000
/** @brief Baudrate */
#define BAUDRATE 115200

/**
 * @brief initializes UART to 115200 baud in 8-bit mode
 */
void uart_init(void);

/**
 * @brief closes UART
 */
void uart_close(void);

/**
 * @brief sends a byte over UART
 *
 * @param byte the byte to send
 */
void uart_put_byte(uint8_t byte);

/**
 * @brief reads a byte over UART
 *
 * @return the byte received
 */
uint8_t uart_get_byte(void);

#endif /* _UART_H_ */