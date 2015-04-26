ifeq ($(TARGET_PROVIDES_CAMERA_HAL),true)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(TARGET_IS_DERP2),true)
    LOCAL_CFLAGS += -DDERP2
endif

ifeq ($(TARGET_NEED_PREVIEW_SIZE_FIXUP),true)
    LOCAL_CFLAGS += -DPREVIEW_SIZE_FIXUP
endif

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware liblog libcamera_client libutils

LOCAL_C_INCLUDES += \
    system/media/camera/include

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.msm8960
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

endif
