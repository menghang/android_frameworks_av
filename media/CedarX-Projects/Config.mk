#this file is used for Android compile configuration

############################################################################
CEDARX_EXT_CFLAGS :=
# manually config CEDARX_ADAPTER_VERSION according to internal version. now default set to v1.5release(V15).
CEDARX_ADAPTER_VERSION := V15


CEDARX_PRODUCTOR := GENERIC
CEDARX_DEBUG_ENABLE := N
ifeq ($(CEDARX_DEBUG_ENABLE), Y)
CEDARX_DEBUG_FRAMEWORK := Y
CEDARX_DEBUG_CEDARV := Y
CEDARX_DEBUG_DEMUXER := Y
else
CEDARX_DEBUG_FRAMEWORK := N
CEDARX_DEBUG_CEDARV := N
CEDARX_DEBUG_DEMUXER := N
endif

############################################################################
ifeq ($(PLATFORM_VERSION),4.1.1)
AV_BASE_PATH := av
TEMP_COMPILE_DISABLE := true
else
AV_BASE_PATH := base
TEMP_COMPILE_DISABLE := false
endif


ifeq ($(PLATFORM_VERSION),2.3.4)
CEDARX_ANDROID_VERSION := 4
CEDARX_ANDROID_CODE := GIN
CEDARX_RTSP_VERSION := 2
CEDARX_USE_SFTDEMUX := N
CEDARX_TOP := $(TOP)/frameworks/${AV_BASE_PATH}/media/CedarX-Projects/CedarX
CEDARX_EXT_CFLAGS += -DCEDARX_ANDROID_VERSION=4
endif
ifeq ($(PLATFORM_VERSION),4.0.1)
CEDARX_ANDROID_VERSION := 6
CEDARX_ANDROID_CODE := ICS
CEDARX_RTSP_VERSION := 3
CEDARX_USE_SFTDEMUX := N
CEDARX_TOP := $(TOP)/frameworks/${AV_BASE_PATH}/media/CedarX-Projects/CedarX
CEDARX_EXT_CFLAGS += -DCEDARX_ANDROID_VERSION=6
endif
ifeq ($(PLATFORM_VERSION),4.0.3)
CEDARX_ANDROID_VERSION := 6
CEDARX_ANDROID_CODE := ICS
CEDARX_RTSP_VERSION := 4
CEDARX_USE_SFTDEMUX := Y
CEDARX_TOP := $(TOP)/frameworks/${AV_BASE_PATH}/media/CedarX-Projects/CedarX
CEDARX_EXT_CFLAGS += -DCEDARX_ANDROID_VERSION=6
endif
ifeq ($(PLATFORM_VERSION),4.0.4)
CEDARX_ANDROID_VERSION := 6
CEDARX_ANDROID_CODE := ICS
CEDARX_RTSP_VERSION := 4
CEDARX_USE_SFTDEMUX := Y
CEDARX_TOP := $(TOP)/frameworks/${AV_BASE_PATH}/media/CedarX-Projects/CedarX
CEDARX_EXT_CFLAGS += -DCEDARX_ANDROID_VERSION=6
endif
ifeq ($(PLATFORM_VERSION),4.1.1)
CEDARX_ANDROID_VERSION := 7
CEDARX_ANDROID_CODE := JB
CEDARX_RTSP_VERSION := 4
CEDARX_USE_SFTDEMUX := Y
CEDARX_TOP := $(TOP)/frameworks/av/media/CedarX-Projects/CedarX
CEDARX_EXT_CFLAGS += -DCEDARX_ANDROID_VERSION=7
endif

CEDARX_PREBUILD_LIB_PATH := LIB_$(CEDARX_ANDROID_CODE)_$(CEDARX_CHIP_VERSION)

############################################################################

CEDARM_TOP := ${CEDARX_TOP}/libexternal/CedarM
CEDARX_ENABLE_MEMWATCH := N

ifeq ($(CEDARX_CHIP_VERSION), F25)
CEDAR_ENCODER_VERSION := F23
else
CEDAR_ENCODER_VERSION := $(CEDARX_CHIP_VERSION)
endif

CEDARX_EXT_CFLAGS +=-D__OS_ANDROID -D__CHIP_VERSION_$(CEDARX_CHIP_VERSION)
CEDARX_EXT_CFLAGS +=-D__CDX_ENABLE_SUBTITLE 
CEDARX_EXT_CFLAGS +=-D__CDX_ENABLE_DRM

ifeq ($(CEDARX_ENABLE_MEMWATCH),Y)
CEDARX_EXT_CFLAGS +=-DMEMWATCH -DMEMWATCH_STDIO -D__CDX_MEMWATCH -I${CEDARX_TOP}/libexternal/memwatch-2.71
endif

ifeq ($(CEDARX_PRODUCTOR),TVD_001)
# no use! CEDARX_EXT_CFLAGS += -D__ENABLE_SWA_PLUGIN
endif
