#!/bin/bash

if [ -d "build" ]; then
   rm -rf build/*
   rm -rf install/*
else
   mkdir build install
fi

cd build

#sysroot_path=/mnt/newdisk/liuxinxin/toolchains/rk3566_v1.2.4_openssl/aarch64-buildroot-linux-gnu/sysroot
sysroot_path=/mnt/newdisk/liuxinxin/toolchains/rk3326_v1.7.0_openssl_v2/aarch64-buildroot-linux-gnu/sysroot

#pkg_config_path="${PKG_CONFIG_PATH}:${sysroot_path}/usr/lib/pkgconfig"
avs_project_path=/mnt/newdisk/liuxinxin/alexa-sdk-3.0
avs_source_path=${avs_project_path}/source/avs-device-sdk
portaudio_path=${sysroot_path}/lib/portaudio

platform="rk3566"
if [[ "${sysroot_path}" =~ "rk3566" ]]; then
  platform="rk3566"
elif [[ "${sysroot_path}" =~ "rk3326" ]]; then
  platform="rk3326"
else
  echo "sysroot_path does not contain rk3566 or rk3326."
fi

orig_portaudio_path=${avs_project_path}/third-party-lib/${platform}/portaudio


if [[ "${sysroot_path}" =~ "v2" ]]; then
	echo "orvibo v2 toolchain no need copy portaudio libs to sysroot"
	portaudio_path=${sysroot_path}/usr/lib
	orig_portaudio_path=${sysroot_path}/usr
else
	[ ! -d "${portaudio_path}" ] && {
		mkdir ${portaudio_path}
		cp -rf ${orig_portaudio_path}/lib/.libs/* ${portaudio_path}
		echo "orvibo copy portaudio libs to sysroot"
	}
fi

echo "start building"

export PKG_CONFIG_PATH="${sysroot_path}/usr/lib/pkgconfig"
export PREFIX="${sysroot_path}/usr"

cmake ${avs_source_path} \
	-DCMAKE_TOOLCHAIN_FILE=${avs_source_path}/AvsDeviceSdk.cmake \
	-DCMAKE_BUILD_TYPE=DEBUG \
	-DBUILD_TESTING=Off \
	-DGSTREAMER_MEDIA_PLAYER=ON \
	-DCRYPTO_INCLUDE_DIR=$sysroot_path/usr/include \
 	-DCRYPTO_LIBRARY=$sysroot_path/usr/lib/libcrypto.so \
	-DCURL_INCLUDE_DIR=$sysroot_path/usr/include \
 	-DCURL_LIBRARY=$sysroot_path/usr/lib/libcurl.so \
 	-DSQLITE_INCLUDE_DIR=$sysroot_path/usr/include \
 	-DSQLITE_LIBRARY=$sysroot_path/usr/lib/libsqlite3.so \
	-DGLIB_INCLUDE_DIR=$sysroot_path/usr/include/glib-2.0 \
 	-DGLIB_LIBRARY=$sysroot_path/usr/lib/libglib-2.0.so \
	-DPORTAUDIO=ON \
	-DPKCS11=OFF \
	-DPORTAUDIO_LIB_PATH=${portaudio_path}/libportaudio.so \
	-DPORTAUDIO_INCLUDE_DIR=${orig_portaudio_path}/include \
	-DCMAKE_INSTALL_PREFIX=${avs_project_path}/install 

	#-DCUSTOM_MEDIA_PLAYER=ON \
	#-DPORTAUDIO_LIB_PATH=${sysroot_path}/lib/portaudio \
	#-DPORTAUDIO_LIB_PATH=/mnt/newdisk/liuxinxin/Alexa/project/third-party-arm/portaudio/lib/.libs/libportaudio.so \
	#-DPORTAUDIO_LIBRARY=/mnt/newdisk/liuxinxin/Alexa/project/third-party-arm/portaudio/lib/.libs/libportaudio.so 
make VERBOSE=1 SampleApp -j8

make install -j8

#make all integration

#make all test

#mkdir Integration/database

cd -
cp -f ${avs_project_path}/run.sh ${avs_project_path}/install/
cp -f ${avs_project_path}/build/SampleApplications/ConsoleSampleApplication/src/SampleApp ${avs_project_path}/install
cp -f ${avs_project_path}/build/SampleApplications/Common/LibSampleApp/src/libacsdkSampleApp.so ${avs_project_path}/install/lib
find ${avs_project_path}/build/SampleApplications -type f -name "*.so*" -exec cp -f {} ${avs_project_path}/install/lib \;

./gen.sh
cp -f ${avs_project_path}/build/Integration/AlexaClientSDKConfig.json ${avs_project_path}/install

cd ${avs_project_path}/install/lib
find ./ -type f -name "*.so*" -exec ${sysroot_path}/../../bin/aarch64-buildroot-linux-gnu-strip --strip-all {} \;
cd -
