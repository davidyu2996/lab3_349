/**
 * @file   i2c.c
 *
 * @brief  I2C implementation on rpi 2
 *
 * @date   10/4/17
 * @author David Yu <davidyu@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <BCM2836.h>
#include <i2c.h>
#include <gpio.h>

/** @brief BCS1 master  physical address */
#define BCS1_MASTER (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0x804000)

/** @brief BCS1 control  physical address */
#define BCS1_C (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0x804000)

/** @brief BCS1 status physical address */
#define BCS1_S (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0x804004)

/** @brief BCS1 data length physical address */
#define BCS1_DLEN (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0x804008)

/** @brief BCS1 slave address hysical address */
#define BCS1_A (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0x80400c)

/** @brief BCS1 data FIFO physical address */
#define BCS1_FIFO (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0x804010)

void i2c_master_init(uint16_t clk) {

    gpio_set_pull(I2C1_SDA, GPIO_PULL_DISABLE);
    gpio_set_pull(I2C1_SCL, GPIO_PULL_DISABLE);
    gpio_config(I2C1_SDA, GPIO_FUN_ALT0);
    gpio_config(I2C1_SCL, GPIO_FUN_ALT0);


    *BCS1_C = 0x8000;//enable BCS and clear FIFO
    *BCS1_C = *BCS1_C | 0x30;
}

uint8_t i2c_master_write(uint8_t *buf, uint16_t len, uint8_t addr) {
    if (len > 16) { //FIFO size is only 16 so can't be bigger
        return -1;
    }
    if (addr > 0x7f) { //A reg can only take 8 bits
        return -1;
    }
    *BCS1_DLEN = len;
    *BCS1_A = addr;

    *BCS1_C = *BCS1_C | 0x30;//clear the fifo
    int i;
    for(i = 0; i < len; i++) { //write into the reg to move to fifo
        *BCS1_FIFO = buf[i];
    }
    *BCS1_C = 0x8080; //start transfer as write

    while((*BCS1_S & 0x2) == 0x0) {}
    //wait for transfer to be finished

    *BCS1_S = *BCS1_S | 0x2; //clear
    return 0;
}
  
uint8_t i2c_master_read(uint8_t *buf, uint16_t len, uint8_t addr) {
    if (len > 16) { //FIFO size is 16 so len can't be bigger
        return -1;
    }
    if (addr > 0x7f) { //A reg can only take 8 bits
        return -1;
    }

    *BCS1_DLEN = len;
    *BCS1_A = addr;

    *BCS1_C = *BCS1_C | 0x30; //clear fifo

    *BCS1_C = 0x8081; // start transfer as read

    while((*BCS1_S & 0x2) == 0x0) {}
    //wait for transfer to be finished
    
    int i;
    for (i = 0; i < len; i++) {
        buf[i] = *BCS1_FIFO;
    }

    *BCS1_S = *BCS1_S | 0x2; //clear

    return len;
}
