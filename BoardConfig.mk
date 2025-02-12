# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from pxa1908-common
-include device/samsung/pxa1908-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/coreprimevelte/BoardConfigVendor.mk

DEVICE_PATH := device/samsung/coreprimevelte

TARGET_OTA_ASSERT_DEVICE := coreprimevelte

# Init
#TARGET_LIBINIT_PXA1908_DEFINES_FILE := $(DEVICE_PATH)/init/init_grandprimevelte.cpp

# Bootimage
BOARD_PROVIDES_MKBOOTIMG := false
MKBOOTIMG := hardware/marvell/bootimage/mkbootimg/mkbootimg
BOARD_CUSTOM_MKBOOTIMG := $(MKBOOTIMG)
MKBOOTIMG_PXA := $(MKBOOTIMG)
export MKBOOTIMG

# Properties
#TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.mrvl

# Disable keymaster HAL
TARGET_PROVIDES_KEYMASTER := true

# RIL
BOARD_PROVIDES_LIBRIL := true
#ANDROID_MULTI_SIM := true
#ANDROID_SIM_COUNT_2 := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/coreprimevelte
TARGET_KERNEL_CONFIG := pxa1908_coreprimevelte_eur_defconfig
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/

BOARD_KERNEL_BASE         := 0x10000000
BOARD_KERNEL_CMDLINE      := android.mavaleur=test androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE     := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_IMAGE_NAME   := Image.gz
BOARD_DTBTOOL_ARGS        :=
BOARD_MKBOOTIMG_ARGS      := --unknown 0x3000000 --tags_offset 0x00000100 --seandroidenforce
BOARD_MKRECOVERYIMG_ARGS  := --unknown 0x3000000 --tags_offset 0x00000100 --seandroidenforce
BOARD_UBOOT_ARGS          := -A arm64 -O linux -T kernel -C gzip -a 01000000 -e 01000000 -n "pxa1928dkb linux"
BOARD_UBOOT_IMAGE_NAME    := uImage

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1932525568
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5518655488
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_FLASH_BLOCK_SIZE             := 131072

# Filesystems
TARGET_USERIMAGES_USE_EXT4         := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE  := ext4

# Screen
TARGET_SCREEN_WIDTH := 480
TARHET_SCREEN_HEIGHT := 800

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab
#TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/twrp.fstab

# TWRP Recovery
#RECOVERY_VARIANT := twrp
TW_THEME := portrait_mdpi
#PRODUCT_COPY_FILES += $(DEVICE_PATH)/rootdir/etc/twrp.fstab:recovery/root/etc/twrp.fstab
#RECOVERY_FSTAB_VERSION := 2
#HAVE_SELINUX := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_HAS_DOWNLOAD_MODE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_MTP_DEVICE := /dev/mtp_usb

#TW_EXCLUDE_SUPERSU := true
#TW_EXCLUDE_MTP := true
#TW_EXCLUDE_DEFAULT_USB_INIT := true
#TW_HAS_DOWNLOAD_MODE := true
#TW_INCLUDE_CRYPTO := true
#TW_BRIGHTNESS_PATH := "/sys/devices/platform/ktd3102-bl.24/backlight/panel/brightness"
#TW_MAX_BRIGHTNESS := 255
#TW_DEFAULT_BRIGHTNESS := 137
#TW_EXTRA_LANGUAGES := true
