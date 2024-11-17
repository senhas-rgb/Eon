#include <stdint.h>
#include <vga.h>

size_t terminal_row;
size_t terminal_column;
uint8_t terminal_color;
uint16_t* terminal_buffer;

void kernel_main(void) {
	/* initialize terminal*/
	terminal_initialize();
	terminal_setfontcolor(VGA_COLOR_WHITE);
	terminal_writestring("Hello, kernel World!\n");
	new_line();
	terminal_setcolor(VGA_COLOR_GREEN, VGA_COLOR_MAGENTA);
	terminal_writestring("You are a sigma\n");
}
