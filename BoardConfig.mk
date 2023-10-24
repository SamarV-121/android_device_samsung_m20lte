DEVICE_PATH := device/samsung/m20lte

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_m20lte

# Kernel
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_CONFIG := m20lte_defconfig
BOARD_CUSTOM_BOOTIMG_MK := hardware/samsung/mkbootimg.mk
TARGET_CUSTOM_DTBTOOL := dtbhtoolExynos.universal7904

# Partitions
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3565158400
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 39845888
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_VENDORIMAGE_PARTITION_SIZE   := 452984832
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/efs:/efs \
    /mnt/vendor/efs:/factory

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.exynos7904

# Sepolicy
BOARD_SEPOLICY_TEE_FLAVOR := mobicore

# SPL
VENDOR_SECURITY_PATCH := 2023-02-01

# Inherit common board flags
include device/samsung/universal7904-common/BoardConfigCommon.mk

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/android.hardware.keymaster@3.0-service.xml
