HINSON_PORTAUDIO=/mnt/newdisk/liuxinxin/toolchains/rk3566_v1.2.4_openssl

./configure --prefix=$PREFIX \
    --host=arm-linux-gnu \
    --with-sysroot=${HINSON_PORTAUDIO}/aarch64-buildroot-linux-gnu/sysroot \
    CC=${HINSON_PORTAUDIO}/bin/aarch64-buildroot-linux-gnu-gcc \
    CXX=${HINSON_PORTAUDIO}/bin/aarch64-buildroot-linux-gnu-g++ \
    CFLAGS=-I${HINSON_PORTAUDIO}/aarch64-buildroot-linux-gnu/sysroot \
    LDFLAGS=-L${HINSON_PORTAUDIO}/aarch64-buildroot-linux-gnu/sysroot/usr/lib \
    GLIB_CFLAGS="-I${HINSON_PORTAUDIO}/usr/include/glib-2.0 -I${HINSON_PORTAUDIO}/usr/lib/glib-2.0/include" \
    GIO_CFLAGS=-I${HINSON_PORTAUDIO}/usr/include
