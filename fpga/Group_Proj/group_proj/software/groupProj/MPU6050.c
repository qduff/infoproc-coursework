/*
 * MPU6050.c
 *
 *  Created on: 29 Feb 2024
 *      Author: rahul
 */

#include "MPU6050.h"

/*
#define WR_BUF_LEN 20

ALT_AVALON_I2C_DEV_t *i2c_dev; //pointer to instance structure

alt_u8 wr_buf[WR_BUF_LEN];



ALT_AVALON_I2C_STATUS_CODE check_MPU(){
	alt_u8 buff_nil = 0;
	ALT_AVALON_I2C_STATUS_CODE ret = alt_avalon_i2c_master_tx(i2c_dev, &buff_nil, 0, ALT_AVALON_I2C_NO_INTERRUPTS);
	return ret;
}

ALT_AVALON_I2C_STATUS_CODE read_reg_MPU(alt_u8 reg, alt_u8 * ret_buf, alt_u32 len){
	return alt_avalon_i2c_master_tx_rx(i2c_dev, &reg, 1, ret_buf, len, ALT_AVALON_I2C_NO_INTERRUPTS);
}

ALT_AVALON_I2C_STATUS_CODE read_byte_MPU(alt_u8 reg, alt_u8 * ret){
	return read_reg_MPU(reg, ret, 1);
}

ALT_AVALON_I2C_STATUS_CODE write_reg_MPU(alt_u8 reg, alt_u8 * buf, alt_u32 len){
	wr_buf[0] = reg;
	memcpy(&wr_buf+sizeof(alt_u8), buf, (len > WR_BUF_LEN ? WR_BUF_LEN : len));
	return alt_avalon_i2c_master_tx(i2c_dev, wr_buf, (len > WR_BUF_LEN ? WR_BUF_LEN : len+1), ALT_AVALON_I2C_NO_INTERRUPTS);
}

ALT_AVALON_I2C_STATUS_CODE write_byte_MPU(alt_u8 reg, alt_u8 * byte_in){
	//printf("Sending Byte %d\n", *byte_in);
	return write_reg_MPU(reg, byte_in, 1);
}


ALT_AVALON_I2C_STATUS_CODE init_MPU(){
	i2c_dev = alt_avalon_i2c_open("/dev/i2c_0");
	if (NULL==i2c_dev)
	{
		printf("Error: Cannot find /dev/i2c_0\n");
		return 1;
	}
	alt_avalon_i2c_master_target_set(i2c_dev,MPU_I2C_ADDR);
	alt_u8 buf = 0x00;
	if (check_MPU() < 0){
		printf("Device Not Found\n");
		return 1;
	}else{
		printf("Device Found\n");
	}if (check_MPU() < 0){
		printf("Device Not Found\n");
		return 1;
	}else{
		printf("Device Found\n");
	}
	if (check_MPU() < 0){
			printf("Device Not Found\n");
			return 1;
		}else{
			printf("Device Found\n");
		}


	read_reg_MPU(117, &buf, 1);

	if (buf == 0x68){
		printf("WhoAmI Passed\n");
	}else{
		printf("WhoAmI Failed: %x\n", buf);

		return -1;
	}




	alt_u8 clear = 0;
	write_byte_MPU(MPU_REG_PWRMGMT_1, &clear);//Turn off sleep mode
	alt_u8 sleep;
	read_byte_MPU(MPU_REG_PWRMGMT_1, &sleep);
	read_byte_MPU(MPU_REG_PWRMGMT_1, &sleep);
	printf("Sleep Status: %x\n", sleep);
	if ((sleep & 0x20)!=0){
		printf("It's Sleeping\n");
	}

	write_byte_MPU(28, &clear);
	write_byte_MPU(27, &clear);
	return 0;
}
*/

ALT_AVALON_I2C_STATUS_CODE init_MPU(){
	init_I2C();
	alt_u8 buf = 0x00;

	read_byte_MPU(117, &buf);

	if (buf == 0x68){
		printf("WhoAmI Passed\n");
	}else{
		printf("WhoAmI Failed: %x\n", buf);

		return -1;
	}

	alt_u8 clear = 0;
	write_byte_MPU(MPU_REG_PWRMGMT_1, &clear);//Turn off sleep mode
	alt_u8 sleep;
	read_byte_MPU(MPU_REG_PWRMGMT_1, &sleep);
	read_byte_MPU(MPU_REG_PWRMGMT_1, &sleep);
	printf("Sleep Status: %x\n", sleep);
	if ((sleep & 0x20)!=0){
		printf("It's Sleeping\n");
	}

	write_byte_MPU(28, &clear);
	write_byte_MPU(27, &clear);
	return 0;

}

alt_16 get_x_accel_MPU(){
	alt_u8 lsb, msb;
	alt_u8 buf[2];
	//read_reg_MPU(MPU_REG_ACCEL_X, &ret, 2);
	read_byte_MPU(MPU_REG_ACCEL_X, &msb);
	read_byte_MPU(MPU_REG_ACCEL_X + 1, &lsb);
	alt_u16 ret = (msb << 8)|lsb;
	return *(alt_16 *) &ret;
}

alt_16 get_y_accel_MPU(){
	alt_u8 lsb, msb;
	alt_u8 buf[2];
	//read_reg_MPU(MPU_REG_ACCEL_X, &ret, 2);
	read_byte_MPU(MPU_REG_ACCEL_Y, &msb);
	read_byte_MPU(MPU_REG_ACCEL_Y + 1, &lsb);
	alt_u16 ret = (msb << 8)|lsb;
	return *(alt_16 *) &ret;
}

alt_16 get_z_accel_MPU(){
	alt_u8 lsb, msb;
	alt_u8 buf[2];
	//read_reg_MPU(MPU_REG_ACCEL_X, &ret, 2);
	read_byte_MPU(MPU_REG_ACCEL_Z, &msb);
	read_byte_MPU(MPU_REG_ACCEL_Z + 1, &lsb);
	alt_u16 ret = (msb << 8)|lsb;
	//printf("msb, lsb = %u , %u \n", msb, lsb);
	return *(alt_16 *) &ret;
}


alt_16 get_x_gyro_MPU(){
	alt_u8 lsb, msb;
	alt_u8 buf[2];
	//read_reg_MPU(MPU_REG_ACCEL_X, &ret, 2);
	read_byte_MPU(MPU_REG_GYRO_X, &msb);
	read_byte_MPU(MPU_REG_GYRO_X + 1, &lsb);
	alt_u16 ret = (msb << 8)|lsb;
	return *(alt_16 *) &ret;
}

alt_16 get_y_gyro_MPU(){
	alt_u8 lsb, msb;
	alt_u8 buf[2];
	//read_reg_MPU(MPU_REG_ACCEL_X, &ret, 2);
	read_byte_MPU(MPU_REG_GYRO_Y, &msb);
	read_byte_MPU(MPU_REG_GYRO_Y + 1, &lsb);
	alt_u16 ret = (msb << 8)|lsb;
	return *(alt_16 *) &ret;
}

alt_16 get_z_gyro_MPU(){
	alt_u8 lsb, msb;
	alt_u8 buf[2];
	//read_reg_MPU(MPU_REG_ACCEL_X, &ret, 2);
	read_byte_MPU(MPU_REG_GYRO_Z, &msb);
	read_byte_MPU(MPU_REG_GYRO_Z + 1, &lsb);
	alt_u16 ret = (msb << 8)|lsb;
	return *(alt_16 *) &ret;
}
