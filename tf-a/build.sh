#!/usr/bin/env bash

# Setup environment variables
#

# TF-A specific build steps
#
make PLAT=qemu_sbsa all fip
cp build/qemu_sbsa/release/bl1.bin $WORKSPACE/edk2-non-osi/Platform/Qemu/Sbsa/
cp build/qemu_sbsa/release/fip.bin $WORKSPACE/edk2-non-osi/Platform/Qemu/Sbsa/

# Regenerate UEFI SBSA image
build -b DEBUG -a AARCH64 -t GCC5 -p $WORKSPACE/edk2-platforms/Platform/Qemu/SbsaQemu/SbsaQemu.dsc
