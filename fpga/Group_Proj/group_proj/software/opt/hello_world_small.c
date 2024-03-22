#include "system.h"
#include "altera_up_avalon_accelerometer_spi.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include <stdlib.h>

#include "alt_types.h"
#include "sys/times.h"





int main() {

	alt_u32 word_h, word_l;
	alt_u64 word;
	alt_64 res;
	IOWR_ALTERA_AVALON_PIO_DATA(OUT0_BASE, -50000);
	IOWR_ALTERA_AVALON_PIO_DATA(OUT1_BASE, 5);
	word_h = IORD_ALTERA_AVALON_PIO_DATA(IN_H_BASE);
	word_l = IORD_ALTERA_AVALON_PIO_DATA(IN_L_BASE);
	word = ((word_h << 32)|word_l);
	res = * (alt_64 *) &word;//Undefined cast to concatenate h and l word
	printf("%d\n", res);



	return 0;
}
