#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

sh -c curl -sfL https://patch-diff.githubusercontent.com/raw/openwrt/openwrt/pull/11542.patch | git apply -p1

sed -i "s/^TARGET_DEVICES /# TARGET_DEVICES /" target/linux/bcm53xx/image/Makefile
sed -i "s/# TARGET_DEVICES += netgear_r7000/TARGET_DEVICES += netgear_r7000/" target/linux/bcm53xx/image/Makefile
sed -i "s/DEVICE_PACKAGES := \$(BRCMFMAC_4366C0) \$(USB3_PACKAGES)/DEVICE_PACKAGES := \$(BRCMFMAC_4366C0) \$(USB3_PACKAGES) k3screenctrl/" target/linux/bcm53xx/image/Makefile
