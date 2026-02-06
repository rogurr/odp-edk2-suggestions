#!/usr/bin/env bash

# Setup environment variables
#
export WORKSPACE=$PWD
export PACKAGES_PATH=$WORKSPACE/edk2:$WORKSPACE/Platform

# UEFI specific build steps
#
make -C $WORKSPACE/edk2/BaseTools
source $WORKSPACE/edk2/edksetup.sh
build -b DEBUG -a AARCH64 -t GCC5 -p $WORKSPACE/edk2-platforms/Platform/Qemu/SbsaQemu/SbsaQemu.dsc
