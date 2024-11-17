#include <stdint.h>
#include <vga.h>

void kernel_main(void) {
	/* initialize terminal*/
	terminal_initialize();
	terminal_setfontcolor(VGA_COLOR_WHITE);
	terminal_writestring("Hello, kernel World!\n");
	terminal_setcolor(VGA_COLOR_GREEN, VGA_COLOR_MAGENTA);
	terminal_writestring("You are a sigma\n");
}
