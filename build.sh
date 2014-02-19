#!/bin/sh

if [ ! -d lib -o ! -d include ]; then
	mkdir -p lib include 2> /dev/null
	cp jconfig.h jerror.h jmorecfg.h jpeglib.h include/
fi

ndk-build \
	APP_BUILD_SCRIPT=./Android.mk NDK_PROJECT_PATH=. \
	LOCAL_ARM_MODE=arm APP_ABI=armeabi-v7a \
	LOCAL_ARM_NEON=true ARCH_ARM_HAVE_NEON=true \
	obj/local/armeabi-v7a/libjpeg.a

cp obj/local/armeabi-v7a/libjpeg.a lib
