#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "system.h"
#include "altera_up_avalon_accelerometer_spi.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_jtag_uart_regs.h"
#include "sys/alt_irq.h"
#include <stdlib.h>
#define CHARLIM 2048    // Maximum character length of what the user places in memory.  Increase to allow longer sequences
#define QUITLETTER '~' // Letter to kill all processing

#define OFFSET -32
#define PWM_PERIOD 16
#define TAPS (sizeof(mem)/sizeof(alt_32))

alt_8 pwm = 0;
alt_u8 led;
int level;
alt_32 raw;

//Quantised
#define EXP_COEFFICIENT_GAIN 12
alt_32 a_quant[] = { 19, 30, -10, -29, 13, 0, -38, 16, 18, -55, 12, 47, -73, -4,
		91, -92, -45, 162, -108, -138, 308, -118, -493, 1179, 2609, 1179, -493,
		-118, 308, -138, -108, 162, -45, -92, 91, -4, -73, 47, 12, -55, 18, 16,
		-38, 0, 13, -29, -10, 30, 19 };

alt_32 mem[49];
int ind;
int filt;
int printing;
int numSamples;
int samplesPrinted;
//Timing
clock_t exec_t1, exec_t2;

alt_32 x_read;
alt_up_accelerometer_spi_dev * acc_dev;

void print_text(char *text, const int length)
{
	for (int i = 0; i < length;i++){
		if (text[i] == 'P'){
			char numSampleschar[10];
			int ind_numSamples = 0;
			while(i < length){
				printf("1\n");
				if (isdigit(text[i])){
					break;
				}
				i++;
			}
			while(isdigit(text[i])){
				printf("2\n");
				numSampleschar[ind_numSamples] = text[i];
				ind_numSamples ++;
				i++;
			}
			numSamples = atoi(numSampleschar);
			printing = 1;
			samplesPrinted = 0;
			printf("{\n");
			return;
		}
		if (text[i]=='C'){
			i=(i+1)%length;
			filt = text[i] - '0';
			if (filt != 0){
				printf("Filtering On\n");
			}else{
				printf("Filtering Off\n");
			}
		}else if(text[i] == 'T'){
			char tapNum[2], coeff[10];
			int ind_tapNum = 0;
			int ind_coeff = 0;
			i++;
			while(i < length){
				printf("1\n");
				if (isdigit(text[i])){
					break;
				}
				i++;
			}
			while(isdigit(text[i])){
				printf("2\n");
				tapNum[ind_tapNum] = text[i];
				ind_tapNum ++;
				i++;
			}
			while(i < length){
				printf("4\n");
				if (isdigit(text[i])){
					break;
				}
				i++;
			}
			while(isdigit(text[i])||(text[i]=='-')){
				printf("3\n");
				coeff[ind_coeff] = text[i];
				ind_coeff++;
				i++;
			}
			a_quant[atoi(tapNum)] = atoi(coeff);
			printf("filt coeff: %d %d\n", atoi(tapNum), atoi(coeff));
			printf("filt coeff: %s %s\n", tapNum, coeff);
		}

	}
    char *printMsg;
    asprintf(&printMsg, "<--> Detected %d characters: %s <--> \n %c", length, text, 0x4); // Print out the strings
    alt_putstr(printMsg);
    free(printMsg);
    memset(text, 0, 2 * CHARLIM); // Empty the text buffer for next input
}

char generate_text(char curr, int *length, char *text, int *running)
{
    if (curr == '\n')
        return curr; // If the line is empty, return nothing.
    int idx = 0;     // Keep track of how many characters have been sent down for later printing
    char newCurr = curr;

    while (newCurr != EOF && newCurr != '\n')
    { // Keep reading characters until we get to the end of the line
        if (newCurr == QUITLETTER)
        {
            //*running = 0;
            printf("%s\n", 0x4);
        }                        // If quitting letter is encountered, setting running to 0
        text[idx] = newCurr;     // Add the next letter to the text buffer
        idx++;                   // Keep track of the number of characters read
        newCurr = alt_getchar(); // Get the next character
    }
    *length = idx;

    return newCurr;
}

void convert_data_quant(int * level, alt_u8 * led, alt_32 * raw_dat) {
	int i;
	alt_64 res = 0;
	for (i = 0; i < TAPS; i++) {
		res += (alt_64) mem[(ind + i) % TAPS] * a_quant[i];
	}
	//printf("%d", res);
	alt_32 filt_read = (res >> EXP_COEFFICIENT_GAIN);
	* raw_dat = filt_read;
	alt_u8 val = (filt_read >> 6) & 0x07;
	*led = (8 >> val) | (8 << (8 - val));
	*level = (filt_read >> 1) & 0x1f;
}

void convert_read(alt_32 acc_read, int * level, alt_u8 * led) {
	//acc_read += OFFSET;
	alt_u8 val = (acc_read >> 6) & 0x07;
	*led = (8 >> val) | (8 << (8 - val));
	*level = (acc_read >> 1) & 0x1f;
}

int read_chars()
{
    char text[2 * CHARLIM]; // The buffer for the printing text
    char prevLetter = '!';
    int length = 0;
    int running = 1;



    while (running)
    {
    	alt_up_accelerometer_spi_read_x_axis(acc_dev, &x_read);
		// alt_printf("raw data: %x\n", x_read);
		mem[ind] = x_read + OFFSET;
		ind++;
		ind = ind % TAPS;
		if (filt){
			convert_data_quant(&level, &led, &raw);
		}else{
			convert_read(x_read, & level, & led);
		}
		//
		//convert_data(&level, &led);
		exec_t2 = times(NULL); // get system time after finishing the process
		int step = (int) (exec_t2 - exec_t1);
		//printf("proc time = %d ticks \n", step);
		//printf("time = %d ticks \n", (int) exec_t2);
		exec_t1 = exec_t2;
		if(printing){
			printf("Value: %d,\n", raw);
			samplesPrinted++;
			if (samplesPrinted > numSamples){
				printf("\n %c", 0x4);
				printing = 0;
				printf("}\n");
			}
		}

		char c = IORD_ALTERA_AVALON_JTAG_UART_DATA(JTAG_UART_BASE);
		//printf("%d\n", c);
		if (c != 10){
			// Keep running until QUITLETTER is encountered
			prevLetter = c;                                      // Extract the first character (and create a hold until one arrives)
			prevLetter = generate_text(prevLetter, &length, text, &running); // Process input text
			print_text(text, length);
		}


    }

    return 0;
}

void led_write(alt_u8 led_pattern) {
    IOWR(LED_BASE, 0, led_pattern);
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

int main()
{

	ind = 0;
	printing = 0;
	acc_dev = alt_up_accelerometer_spi_open_dev("/dev/accelerometer_spi");
	if (acc_dev == NULL) { // if return 1, check if the spi ip name is "accelerometer_spi"
		return 1;
	}
	timer_init(sys_timer_isr);

    return read_chars();
}
