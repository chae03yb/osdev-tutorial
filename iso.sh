#!/bin/sh
set -e 
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/sharpos.kernel isodir/boot/sharpos.kernel

cat > isodir/boot/grub/grub.cfg << EOF
menuentry "sharpos" {
    multiboot /boot/sharpos.kernel
}
EOF
grub-mkrescue -o sharpos.iso isodir
