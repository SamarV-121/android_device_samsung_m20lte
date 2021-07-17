DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit common device configuration
$(call inherit-product, device/samsung/universal7904-common/universal7904-common.mk)

$(call inherit-product, vendor/samsung/m20lte/m20lte-vendor.mk)

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@3.0-impl \
    libkeymaster3device

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/android.hardware.keymaster@3.0-service.xml:$(TARGET_COPY_OUT_VENDOR)/etc/vintf/manifest/android.hardware.keymaster@3.0-service.xml

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/libnfc-sec-vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-sec-vendor.conf

# Rootdir
PRODUCT_PACKAGES += \
	fstab.exynos7904 \
	init.target.rc \
	init.baseband.rc
