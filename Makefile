KERNEL = build/eonkernel.elf
ISO = eon.iso

CC = gcc
LD = ld
AS = as
CFLAGS = -Wall -Werror -Wextra -m32 -ffreestanding -fno-stack-protector -nostdlib -g -I inc/
LDFLAGS = -T linker.ld -m elf_i386
ASFLAGS = --32

all: compile link iso run clean

compile:
	mkdir -p build
	$(AS) $(ASFLAGS) src/kernel/boot.s -o build/boot.o
	$(CC) $(CFLAGS) -c src/kernel/kernel.c -o build/kernel.o
	$(CC) $(CFLAGS) -c src/kernel/vga.c -o build/vga.o

link:
	$(LD) $(LDFLAGS) build/boot.o build/kernel.o build/vga.o -o $(KERNEL)

iso:
	mkdir -p build/iso/grub
	cp grub.cfg build/iso/grub
	cp $(KERNEL) build/iso
	grub-mkrescue -o $(ISO) build/iso

run:
	qemu-system-x86_64 $(ISO)

clean:
	rm -r build
	rm $(ISO)