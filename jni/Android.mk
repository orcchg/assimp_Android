LOCAL_PATH := $(call my-dir)
CONTRIB_PATH := ../contrib
HEADER_PATH := ../include/assimp
SOURCE_PATH := ../code

# -----------------------------------------------------------------------------
COMPILER_HEADERS := $(HEADER_PATH)/Compiler

# -----------------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := irrXML
LOCAL_ARM_MODE := thumb
LOCAL_ARM_NEON := true
LOCAL_CLANG    := true
LOCAL_C_INCLUDES := $(CONTRIB_PATH)/irrXML $(SOURCE_PATH)

LS_CPP := $(subst $(LOCAL_PATH)/$(CONTRIB_PATH)/irrXML,$(CONTRIB_PATH)/irrXML,$(wildcard $(LOCAL_PATH)/$(CONTRIB_PATH)/irrXML/*.cpp))
LOCAL_SRC_FILES := $(call LS_CPP,$(LOCAL_PATH))

LOCAL_LDLIBS += -llog
LOCAL_CFLAGS +=

include $(BUILD_SHARED_LIBRARY)
include $(CLEAR_VARS)

# -----------------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := ConvertUTF
LOCAL_ARM_MODE := thumb
LOCAL_ARM_NEON := true
LOCAL_CLANG    := true
LOCAL_C_INCLUDES := $(CONTRIB_PATH)/ConvertUTF $(SOURCE_PATH)

LS_CPP := $(subst $(LOCAL_PATH)/$(CONTRIB_PATH)/ConvertUTF,$(CONTRIB_PATH)/ConvertUTF,$(wildcard $(LOCAL_PATH)/$(CONTRIB_PATH)/ConvertUTF/*.c))
LOCAL_SRC_FILES := $(call LS_CPP,$(LOCAL_PATH))

LOCAL_LDLIBS += -llog
LOCAL_CFLAGS +=

include $(BUILD_SHARED_LIBRARY)
include $(CLEAR_VARS)

# -----------------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := clipper
LOCAL_ARM_MODE := thumb
LOCAL_ARM_NEON := true
LOCAL_CLANG    := true
LOCAL_C_INCLUDES := $(CONTRIB_PATH)/clipper $(SOURCE_PATH)

LS_CPP := $(subst $(LOCAL_PATH)/$(CONTRIB_PATH)/clipper,$(CONTRIB_PATH)/clipper,$(wildcard $(LOCAL_PATH)/$(CONTRIB_PATH)/clipper/*.cpp))
LOCAL_SRC_FILES := $(call LS_CPP,$(LOCAL_PATH))

LOCAL_LDLIBS += -llog
LOCAL_CFLAGS +=

include $(BUILD_SHARED_LIBRARY)
include $(CLEAR_VARS)

# -----------------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := poly2tri
LOCAL_ARM_MODE := thumb
LOCAL_ARM_NEON := true
LOCAL_CLANG    := true
LOCAL_C_INCLUDES := $(CONTRIB_PATH)/poly2tri/poly2tri/common \
		    $(CONTRIB_PATH)/poly2tri/poly2tri/sweep $(SOURCE_PATH)

LS_CPP := $(subst $(LOCAL_PATH)/$(CONTRIB_PATH)/poly2tri/poly2tri/common,$(CONTRIB_PATH)/poly2tri/poly2tri/common,$(wildcard $(LOCAL_PATH)/$(CONTRIB_PATH)/poly2tri/poly2tri/common/*.cc))
LS_CPP_EXT := $(subst $(LOCAL_PATH)/$(CONTRIB_PATH)/poly2tri/poly2tri/sweep,$(CONTRIB_PATH)/poly2tri/poly2tri/sweep,$(wildcard $(LOCAL_PATH)/$(CONTRIB_PATH)/poly2tri/poly2tri/sweep/*.cc))
LOCAL_SRC_FILES := $(call LS_CPP,$(LOCAL_PATH)) $(call LS_CPP_EXT,$(LOCAL_PATH))

LOCAL_LDLIBS += -llog
LOCAL_CFLAGS +=

include $(BUILD_SHARED_LIBRARY)
include $(CLEAR_VARS)

# -----------------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := unzip
LOCAL_ARM_MODE := thumb
LOCAL_ARM_NEON := true
LOCAL_CLANG    := true
LOCAL_C_INCLUDES := $(CONTRIB_PATH)/unzip $(SOURCE_PATH)

LS_CPP := $(subst $(LOCAL_PATH)/$(CONTRIB_PATH)/unzip,$(CONTRIB_PATH)/unzip,$(wildcard $(LOCAL_PATH)/$(CONTRIB_PATH)/unzip/*.c))
LOCAL_SRC_FILES := $(call LS_CPP,$(LOCAL_PATH))

LOCAL_LDLIBS += -llog
LOCAL_CFLAGS +=
LOCAL_SHARED_LIBRARIES += zlib

include $(BUILD_SHARED_LIBRARY)
include $(CLEAR_VARS)

# -----------------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := zlib
LOCAL_ARM_MODE := thumb
LOCAL_ARM_NEON := true
LOCAL_CLANG    := true
LOCAL_C_INCLUDES := $(CONTRIB_PATH)/zlib $(SOURCE_PATH)

LS_CPP := $(subst $(LOCAL_PATH)/$(CONTRIB_PATH)/zlib,$(CONTRIB_PATH)/zlib,$(wildcard $(LOCAL_PATH)/$(CONTRIB_PATH)/zlib/*.c))
LOCAL_SRC_FILES := $(call LS_CPP,$(LOCAL_PATH))

LOCAL_LDLIBS += -llog
LOCAL_CFLAGS +=

include $(BUILD_SHARED_LIBRARY)
include $(CLEAR_VARS)

# -----------------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE := assimp
LOCAL_ARM_MODE := thumb
LOCAL_ARM_NEON := true
LOCAL_CLANG    := true
LOCAL_C_INCLUDES := $(HEADER_PATH) $(COMPILER_HEADERS) $(SOURCE_PATH)

LS_CPP := $(subst $(LOCAL_PATH)/$(SOURCE_PATH),$(SOURCE_PATH),$(wildcard $(LOCAL_PATH)/$(SOURCE_PATH)/*.cpp))
LOCAL_SRC_FILES := $(call LS_CPP,$(LOCAL_PATH))

LOCAL_LDLIBS += -llog
LOCAL_CFLAGS += -Wc++11-narrowing
LOCAL_SHARED_LIBRARIES += irrXML ConvertUTF clipper poly2tri unzip zlib

include $(BUILD_SHARED_LIBRARY)
include $(CLEAR_VARS)

