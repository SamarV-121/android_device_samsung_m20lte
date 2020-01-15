DEVICE_PATH := device/samsung/m20lte

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/m20lte
TARGET_KERNEL_CONFIG := m20lte_defconfig

# Inherit common board flags
include device/samsung/universal7885-common/BoardConfigCommon.mk
