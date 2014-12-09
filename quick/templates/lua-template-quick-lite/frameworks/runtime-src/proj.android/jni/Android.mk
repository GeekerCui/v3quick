LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dlua_shared

LOCAL_MODULE_FILENAME := libcocos2dlua

LOCAL_SRC_FILES := hellolua/main.cpp \
../../Classes/VisibleRect.cpp \
../../Classes/AppDelegate.cpp \
../../Classes/ConfigParser.cpp

ifeq ($(NDK_DEBUG),1)
LOCAL_SRC_FILES += \
hellolua/Runtime_android.cpp \
../../Classes/runtime/Landscape_png.cpp \
../../Classes/runtime/PlayDisable_png.cpp \
../../Classes/runtime/PlayEnable_png.cpp \
../../Classes/runtime/Portrait_png.cpp \
../../Classes/runtime/Shine_png.cpp \
../../Classes/runtime/Runtime.cpp \
../../Classes/runtime/Protos.pb.cc \
../../Classes/runtime/lua_debugger.c
endif

#anysdk
LOCAL_SRC_FILES += \
../../Classes/anysdkbindings.cpp \
../../Classes/anysdk_manual_bindings.cpp

LOCAL_C_INCLUDES := \
$(LOCAL_PATH)/../../Classes/runtime \
$(LOCAL_PATH)/../../Classes \
$(COCOS2DX_ROOT)/external \
$(COCOS2DX_ROOT)/quick/lib/quick-src \
$(COCOS2DX_ROOT)/quick/lib/quick-src/extra

#anysdk
LOCAL_C_INCLUDES +=	\
$(LOCAL_PATH)/../protocols/android \
$(LOCAL_PATH)/../protocols/include

#anysdk
LOCAL_WHOLE_STATIC_LIBRARIES += PluginProtocolStatic

LOCAL_STATIC_LIBRARIES := cocos2d_lua_static
LOCAL_STATIC_LIBRARIES += lua_extensions_static
LOCAL_STATIC_LIBRARIES += extra_static
LOCAL_STATIC_LIBRARIES += cocos_protobuf-lite_static

include $(BUILD_SHARED_LIBRARY)

$(call import-module,scripting/lua-bindings/proj.android)

$(call import-module, quick-src/lua_extensions)
$(call import-module, quick-src/extra)

#anysdk
$(call import-module,protocols/android)
