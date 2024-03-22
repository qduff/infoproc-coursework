

#include "sys/alt_stdio.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <math.h>


int main()
{
	alt_putstr("Hello from Nios II!\n");

	usleep(2000000);


	alt_u32 old = IORD_ALTERA_AVALON_PIO_DATA(IN_L_BASE);

	//float retFloat = (atan2(0.5f, 1.0f));

	float a = 0.5f;
	float b = 1.0f;
	alt_u32 a_param = *(alt_u32*) &a;
	alt_u32 b_param = *(alt_u32*) &b;
	IOWR_ALTERA_AVALON_PIO_DATA(ATAN2_A_BASE, a_param);
	IOWR_ALTERA_AVALON_PIO_DATA(ATAN2_B_BASE, b_param);
	float retFloat;
	alt_u32 ret = IORD_ALTERA_AVALON_PIO_DATA(ATAN2_Q_BASE);
	retFloat = *(float*) &ret;

	int new = IORD_ALTERA_AVALON_PIO_DATA(IN_L_BASE);
	int dt = new - old;
	old = new;
	printf("%d, %d\n", (int) (retFloat * 10000.f), dt);



	return 0;
}
