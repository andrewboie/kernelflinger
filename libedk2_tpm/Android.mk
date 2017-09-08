LIBEDK2_LOCAL_PATH := $(call my-dir)
include $(call all-subdir-makefiles)
LOCAL_PATH := $(LIBEDK2_LOCAL_PATH)

include $(CLEAR_VARS)

LOCAL_MODULE := libedk2_tpm
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include \
                               $(LOCAL_PATH)/../include/libkernelflinger
LOCAL_CFLAGS := -Wall -Wextra -Werror -mrdrnd \
                -DTARGET_BOOTLOADER_BOARD_NAME=\"$(TARGET_BOOTLOADER_BOARD_NAME)\"
LOCAL_STATIC_LIBRARIES := libgnuefi \
                          libefi

LOCAL_SRC_FILES := \
        Tpm2NVStorage.c \
        Tpm2Random.c \
        Tpm2DeviceLib.c \
        Tpm2Help.c

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include \
                    $(LOCAL_PATH)/../include/libkernelflinger \
                    $(res_intermediates)

include $(BUILD_EFI_STATIC_LIBRARY)
