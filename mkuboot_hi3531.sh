#!/bin/sh
#jiangjx added 2014.02.08	
export BUILD_DIR="obj/build"
export CROSS_COMPILE=arm-hisiv100nptl-linux-
export ARCH=arm

find ../hisi_u-boot-2010.06 | xargs touch

make distclean
make godnet_config
make
make env

echo "--------------------------------------------------------------------------"

export UBOOT_REG_BIN=reg_info_930_310_620_ddr0_ddr1_slow.bin
export UBOOT=u-boot-Hi3531.bin

echo "cp $BUILD_DIR/u-boot.bin ./uboot_tools"
cp $BUILD_DIR/u-boot.bin ./uboot_tools

pushd uboot_tools
./mkboot.sh $UBOOT_REG_BIN $UBOOT
popd

echo "cp uboot_tools/$UBOOT $tftp_dir"
cp uboot_tools/$UBOOT $tftp_dir


