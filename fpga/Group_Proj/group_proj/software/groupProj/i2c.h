/*
 * i2c.h
 *
 *  Created on: 11 Mar 2024
 *      Author: rahul
 */

#ifndef I2C_H_
#define I2C_H_

#include "altera_avalon_pio_regs.h"

alt_u8 dev_addr;

int init_I2C();
int read_byte_MPU(alt_u8 reg, alt_u8 * ret);
int write_byte_MPU(alt_u8 reg, alt_u8 * byte_in);


#endif /* I2C_H_ */
