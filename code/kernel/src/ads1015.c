/**
 * @file   ads1015.c
 *
 * @brief  I2C driver for ads1015
 *
 * @date   10/4/17
 * @author David Yu <davidyu@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <ads1015.h>
#include <i2c.h>

/** @brief the value of the slave address */
#define SLAVE_ADDR 0x49

/** @brief the value of the config red address */
#define CONFIG_ADDR 0x1

/** @brief the least significant bits of config reg to set for */
#define CONFIG_LSB 0x83

/** @brief the value of the conversion reg address */
#define CONVERSION_ADDR 0x0

/** @brief the value of the pin for light detector */
#define LIGHT_MSB 0xF0

/** @brief the value of pin for mic */
#define SOUND_MSB 0x64


void adc_init(void) {
    i2c_master_init(I2C_CLK_100KHZ);
}

uint16_t adc_read(uint8_t channel) {
    
    if(channel == 0) { //for light write to config reg AIN3
        uint8_t config_data[3] = {CONFIG_ADDR, LIGHT_MSB, CONFIG_LSB};
        i2c_master_write(config_data, 3, SLAVE_ADDR);

    }
    else if(channel == 1) { //for audio write to config reg AIN2
        uint8_t config_data[3] = {CONFIG_ADDR, SOUND_MSB, CONFIG_LSB};
        i2c_master_write(config_data, 3, SLAVE_ADDR);
    }
    else {
        return -1;
    }

    uint8_t conversion_data[1] = {CONVERSION_ADDR};
    //write to pointer register
    i2c_master_write(conversion_data, 1, SLAVE_ADDR);

    uint8_t read_value[2];
    //read conversion register
    i2c_master_read(read_value, 2, SLAVE_ADDR);

    //configure the read values to be used
    uint16_t value = (read_value[1] >> 4) + (read_value[0] << 4);
    
    return value;
}

