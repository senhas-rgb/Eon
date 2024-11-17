KERNEL = build/eonkernel.elf

CC = gcc
LD = ld
AS = as
CFLAGS = -m32 -ffreestanding -fno-stack-protector -nostdlib -g -I inc/
LDFLAGS = -T linker.ld -m elf_i386
ASFLAGS = --32

$(KERNEL): compile link run clean
	
compile:
	mkdir -p build
	$(AS) $(ASFLAGS) src/kernel/boot.s -o build/boot.o
	$(CC) $(CFLAGS) -c src/kernel/kernel.c -o build/kernel.o
	$(CC) $(CFLAGS) -c src/kernel/vga.c -o build/vga.o

link:
	$(LD) $(LDFLAGS) build/boot.o build/kernel.o build/vga.o -o $(KERNEL)
	grub-mkrescue -o eon.iso grub.cfg

run:
	qemu-system-x86_64 eon.iso

clean:
