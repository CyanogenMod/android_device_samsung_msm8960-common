# Copyright (C) 2014 The CyanogenMod Project
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

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_CPU_VARIANT := krait

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 zcache androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_BASE := 0x80200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01500000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_SOURCE := kernel/samsung/d2

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
QCOM_ADSP_SSR_ENABLED := false
QCOM_ANC_HEADSET_ENABLED := false
QCOM_FLUENCE_ENABLED := false

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP_CAMERA_ABI_HACK
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE
TARGET_RELEASE_CPPFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGING_CMDLINE_NAME := "androidboot.bootchg"
BOARD_CHARGING_CMDLINE_VALUE := "true"

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/msm8960-common/cmhw

# Display
BOARD_EGL_CFG := device/samsung/msm8960-common/configs/egl.cfg
BOARD_USES_LEGACY_MMAP := true
COMMON_GLOBAL_CFLAGS += -DNEW_ION_API
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_DISPLAY_INSECURE_MM_HEAP := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_NO_ADAPTIVE_PLAYBACK := true
TARGET_NO_INITLOGO := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Includes
TARGET_SPECIFIC_HEADER_PATH += device/samsung/msm8960-common/include

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Logging
TARGET_USES_LOGD := false

# Power
TARGET_POWERHAL_VARIANT := qcom

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/samsung/msm8960-common/sepolicy

BOARD_SEPOLICY_UNION += \
    bluetooth.te \
    bootanim.te \
    device.te \
    file.te \
    file_contexts \
    gamma_dev.te \
    genfs_contexts \
    init_shell.te \
    kernel.te \
    keypad_dev.te \
    macloader.te \
    mediaserver.te \
    mm-qcamerad.te \
    mpdecision.te \
    netmgrd.te \
    orientationd.te \
    panel_dev.te \
    platform_app.te \
    power_dev.te \
    qmuxd.te \
    rild.te \
    rmt_storage.te \
    surfaceflinger.te \
    sysinit.te \
    system_app.te \
    system_server.te \
    thermal-engine.te \
    thermald.te \
    ueventd.te \
    vold.te \
    wpa.te

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
