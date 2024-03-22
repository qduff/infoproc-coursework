/*
 * MPU6050.h
 *
 *  Created on: 29 Feb 2024
 *      Author: rahul
 */

#ifndef MPU6050_H_
#define MPU6050_H_

#include <altera_avalon_i2c.h>
#include <stdio.h>
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include <string.h>
#include "i2c.h"

#define MPU_I2C_ADDR 0x68

#define MPU_REG_PWRMGMT_1 107
#define MPU_REG_ACCEL_X 59
#define MPU_REG_ACCEL_Y 61
#define MPU_REG_ACCEL_Z 63
#define MPU_REG_GYRO_X 67
#define MPU_REG_GYRO_Y 69
#define MPU_REG_GYRO_Z 71


ALT_AVALON_I2C_STATUS_CODE init_MPU();
/*

ALT_AVALON_I2C_STATUS_CODE read_byte_MPU(alt_u8 reg, alt_u8 * ret);
ALT_AVALON_I2C_STATUS_CODE write_byte_MPU(alt_u8 reg, alt_u8 * byte_in);
ALT_AVALON_I2C_STATUS_CODE write_reg_MPU(alt_u8 reg, alt_u8 * buf, alt_u32 len);
ALT_AVALON_I2C_STATUS_CODE read_reg_MPU(alt_u8 reg, alt_u8 * ret_buf, alt_u32 len);
*/


alt_16 get_x_accel_MPU();
alt_16 get_y_accel_MPU();
alt_16 get_z_accel_MPU();

alt_16 get_x_gyro_MPU();
alt_16 get_y_gyro_MPU();
alt_16 get_z_gyro_MPU();


#endif /* MPU6050_H_ */
