CC = gcc
CFLAGS = -m32 -ffreestanding -fno-stack-protector -nostdlib -g -I src/kernel/
ASSE = as

all:
	mkdir -p build
	$(ASSE) --32 src/boot/boot.s -o build/boot.o
	$(CC) $(CFLAGS) -c src/kernel/kernel.c -o build/kernel.o
	$(CC) $(CFLAGS) -c src/kernel/vga.c -o build/vga.o
	ld -T linker.ld -m elf_i386 build/boot.o build/kernel.o build/vga.o -o src/boot/eonkernel
	mkdir -p iso_root/boot/grub
	cp src/boot/eonkernel iso_root/boot/
	cp src/boot/grub/grub.cfg iso_root/boot/grub/
	grub-mkrescue -o eon.iso iso_root/
	qemu-system-x86_64 -cdrom eon.iso
