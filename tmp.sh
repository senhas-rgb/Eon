i686-elf-as boot.s -o boot.o
i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-gcc -T linker.ld -o eonos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
if grub-file --is-x86-multiboot eonos.bin; then
  echo multiboot confirmed
else
  echo the file is not multiboot
fi
mkdir -p isodir/boot/grub
cp eonos.bin isodir/boot/eonos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o eonos.iso isodir
qemu-system-i386 -cdrom eonos.iso
