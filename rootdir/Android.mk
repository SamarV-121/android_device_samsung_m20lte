LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE        := fstab.exynos7904
LOCAL_MODULE_TAGS   := optional
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES     := etc/fstab.exynos7904
LOCAL_MODULE_PATH   := $(TARGET_OUT_PRODUCT)/vendor_overlay/29/etc
include $(BUILD_PREBUILT)
