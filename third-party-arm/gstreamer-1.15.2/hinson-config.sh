HINSON_PORTAUDIO=/mnt/newdisk/liuxinxin/toolchains/rk3566_v1.2.4_openssl

./configure --prefix=$PREFIX \
    --host=arm-linux-gnu \
    CC=${HINSON_PORTAUDIO}/bin/aarch64-buildroot-linux-gnu-gcc \
    CXX=${HINSON_PORTAUDIO}/bin/aarch64-buildroot-linux-gnu-g++ \
    LDFLAGS=-L${HINSON_PORTAUDIO}/aarch64-buildroot-linux-gnu/sysroot/usr/lib

