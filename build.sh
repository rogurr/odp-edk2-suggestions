#!/usr/bin/env bash

# Global environment variables
#
export GCC5_AARCH64_PREFIX=/usr/bin/aarch64-linux-gnu-

# Component builds
#
./uefi/build.sh
./ec/build.sh
./tf-a/build.sh
./common/build.sh          <= Qemu is unique in that we need to build the environment

# Prepare output directory, stitch binary, and run QEMU
#
mkdir -p $PLATFORM_ROOT/output
cp ./uefi/Build/...
cp ./ec/Build/...
cp ./tf-a/Build/...
cp ./common/Build/...
truncate -s 256M $PLATFORM_ROOT/output/SBSA_FLASH[01].fd
$QEMU_ROOT/build/qemu-system-aarch64 -machine sbsa-ref -cpu max -m 4G -drive if=pflash,format=raw,file=$PLATFORM_ROOT/output/SBSA_FLASH0.fd -drive if=pflash,format=raw,file=$PLATFORM_ROOT/output/SBSA_FLASH1.fd -serial stdio

