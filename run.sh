echo Starting to compile...
r686-elf-as core/boot/boot.s -o core/boot/boot.o
i686-elf-gcc -c core/kernel/kernel.c -o core/kernel/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-gcc -T core/linker.ld -o core/eon.bin -ffreestanding -O2 -nostdlib core/boot/boot.o core/kernel/kernel.o -lgcc
if grub-file --is-x86-multiboot core/eon.bin; then
  echo multiboot confirmed
else
  echo the file is not multiboot
fi
cp core/eon.bin core/boot/eon.bin
rm core/eon.bin
echo Running in qemu...
grub-mkrescue -o eon.iso core
qemu-system-i386 -cdrom eon.iso
