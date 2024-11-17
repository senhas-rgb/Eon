#ifndef __VGA_H__
#define __VGA_H__

#include <stdint.h>

#define VGA_WIDTH 80
#define VGA_HEIGHT 25

/* Hardware text mode color constants. */
enum vga_color {
	VGA_COLOR_BLACK = 0,
	VGA_COLOR_BLUE = 1,
	VGA_COLOR_GREEN = 2,
	VGA_COLOR_CYAN = 3,
	VGA_COLOR_RED = 4,
	VGA_COLOR_MAGENTA = 5,
	VGA_COLOR_BROWN = 6,
	VGA_COLOR_LIGHT_GREY = 7,
	VGA_COLOR_DARK_GREY = 8,
	VGA_COLOR_LIGHT_BLUE = 9,
	VGA_COLOR_LIGHT_GREEN = 10,
	VGA_COLOR_LIGHT_CYAN = 11,
	VGA_COLOR_LIGHT_RED = 12,
	VGA_COLOR_LIGHT_MAGENTA = 13,
	VGA_COLOR_LIGHT_BROWN = 14,
	VGA_COLOR_WHITE = 15,
};

inline uint8_t vga_entry_color(enum vga_color fg, enum vga_color bg);
inline uint16_t vga_entry(unsigned char uc, enum vga_color color);
size_t strlen(const char* str); // TODO : move this into string.h
// TODO : add functions for manipulating the cursor
void terminal_initialize(void);
void terminal_setfontcolor(enum vga_color color);
void terminal_setcolor(enum vga_color color1, enum vga_color color2);
void terminal_new_line(void);
void terminal_putchar(char c);
void terminal_putentryat(char c, enum vga_color color, size_t x, size_t y);
void terminal_write(const char* data, size_t size);
void terminal_writestring(const char* data);

#endif
