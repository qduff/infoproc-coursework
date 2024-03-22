#include "system.h"
#include "altera_up_avalon_accelerometer_spi.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include <stdlib.h>

#include "alt_types.h"
#include "sys/times.h"

#define OFFSET -32
#define PWM_PERIOD 16
#define TAPS (sizeof(mem)/sizeof(alt_32))

alt_8 pwm = 0;
alt_u8 led;
int level;


//Quantised
#define EXP_COEFFICIENT_GAIN 12


alt_32 mem[49];
int ind;

//Timing
clock_t exec_t1, exec_t2;

void led_write(alt_u8 led_pattern) {
	IOWR(LED_BASE, 0, led_pattern);
}

void convert_read(alt_32 acc_read, int * level, alt_u8 * led) {
	//acc_read += OFFSET;
	alt_u8 val = (acc_read >> 6) & 0x07;
	*led = (8 >> val) | (8 << (8 - val));
	*level = (acc_read >> 1) & 0x1f;
}




void convert_data_HW(alt_64 in, int * level, alt_u8 * led){
	alt_32 filt_read = (in >> EXP_COEFFICIENT_GAIN);
	alt_u8 val = (filt_read >> 6) & 0x07;
	*led = (8 >> val) | (8 << (8 - val));
	*level = (filt_read >> 1) & 0x1f;
}

void sys_timer_isr() {
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_BASE, 0);

	if (pwm < abs(level)) {

		if (level < 0) {
			led_write(led << 1);
		} else {
			led_write(led >> 1);
		}

	} else {
		led_write(led);
	}

	if (pwm > PWM_PERIOD) {
		pwm = 0;
	} else {
		pwm++;
	}

}

void timer_init(void * isr) {

	IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_BASE, 0x0003);
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_BASE, 0);
	IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_BASE, 0x0900);
	IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_BASE, 0x0000);
	alt_irq_register(TIMER_IRQ, 0, isr);
	IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_BASE, 0x0007);

}

int main() {
	printf("Start");
	ind = 0;
	alt_32 x_read;
	alt_up_accelerometer_spi_dev * acc_dev;
	acc_dev = alt_up_accelerometer_spi_open_dev("/dev/accelerometer_spi");
	if (acc_dev == NULL) { // if return 1, check if the spi ip name is "accelerometer_spi"
		printf("Acc Fail\n");
		return 1;
	}

	timer_init(sys_timer_isr);
	printf("1");
	exec_t1 = times(NULL); // get system time before starting the process

	while (1) {
	//for (int j = 0; j < 10;j++) {

		alt_up_accelerometer_spi_read_x_axis(acc_dev, &x_read);
		// alt_printf("raw data: %x\n", x_read);
		/*
		mem[ind] = x_read + OFFSET;
		ind++;
		ind = ind % TAPS;
		*/
		IOWR_ALTERA_AVALON_PIO_DATA(OUT0_BASE, x_read + OFFSET);
		IOWR_ALTERA_AVALON_PIO_DATA(SAMPLE_CLK_BASE, 0xFFFFFFFF);
		IOWR_ALTERA_AVALON_PIO_DATA(SAMPLE_CLK_BASE, 0x00000000);
		//convert_read(x_read, & level, & led);
		//convert_data(&level, &led);
		//convert_data_quant(&level, &led);
		for (int i = 0; i < 200; i++){
			(void)0; //B-Tech NOP
		}



		alt_u32 word_h, word_l;
		alt_u64 word;
		alt_64 res;
		word_h = IORD_ALTERA_AVALON_PIO_DATA(IN_H_BASE);
		word_l = IORD_ALTERA_AVALON_PIO_DATA(IN_L_BASE);
		word = ((word_h << 32)|word_l);
		res = * (alt_64 *) &word;//Undefined cast to concatenate h and l word
		convert_data_HW(res, &level, &led);

		exec_t2 = times(NULL); // get system time after finishing the process
		int step = (int) (exec_t2 - exec_t1);
		printf("proc time = %d ticks \n", step);
		printf("%d\n", res);
		//printf("time = %d ticks \n", (int) exec_t2);
		exec_t1 = exec_t2;
	}

	return 0;
}

