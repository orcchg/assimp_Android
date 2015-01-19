APP_MODULE              := irrXML ConvertUTF clipper poly2tri unzip zlib assimp
APP_OPTIM               := release
NDK_TOOLCHAIN_VERSION   := clang3.4
APP_STL                 := gnustl_static
APP_CFLAGS              := -pthread -frtti -fexceptions -O3 -mfloat-abi=softfp -mfpu=neon -ftemplate-backtrace-limit=0 -w # -Wall
APP_CPPFLAGS            := -std=c++11
APP_CXXFLAGS            := -std=c++11
APP_ABI                 := armeabi-v7a
APP_PLATFORM            := android-19
LOCAL_ARM_NEON          := true
#LOCAL_CLANG             := true
