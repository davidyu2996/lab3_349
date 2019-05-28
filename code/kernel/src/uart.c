/**
 * @file   uart.c
 *
 * @brief  lower level hardware interactions for uart on pi
 *
 * @date   10/3/17
 * @author James Zhang <jameszha@andrew.cmu.edu>
 */

#include <BCM2836.h>
#include <kstdint.h>
#include <uart.h>
#include <gpio.h>

void uart_init(void) {
    //configure GPIO pullups
    gpio_set_pull(RX_PIN, GPIO_PULL_DISABLE);
    gpio_set_pull(TX_PIN, GPIO_PULL_DISABLE);
    //set GPIO pins to correct function on pg 102 of BCM2835 peripherals
    gpio_config(RX_PIN, GPIO_FUN_ALT5);
    gpio_config(TX_PIN, GPIO_FUN_ALT5);

    *AUX_ENB_REG |= 0x1;    //enable
    *AUX_MU_IER_REG = 0x0;  //ignore interrupts
    *AUX_MU_IIR_REG |= 0x6; //clear transmit and receive FIFOs
    *AUX_MU_LCR_REG |= 0x3; //set 8-bit mode
    uint32_t baudrate_reg = SYS_CLK_FREQ / (BAUDRATE * 8) - 1;
    *AUX_MU_BAUD_REG = baudrate_reg; //set baudrate

}

void uart_close(void) {
    *AUX_ENB_REG &= ~0x1; //disable
}

void uart_put_byte(uint8_t byte) {
    while(! (*AUX_MU_LSR_REG & (0x1 << 6))) {} //wait for transmitter idle
    *AUX_MU_IO_REG = byte;
}

uint8_t uart_get_byte(void) {
    while (! (*AUX_MU_LSR_REG & (0x1))) {} //wait for data ready
    return (uint8_t) *AUX_MU_IO_REG;
}
