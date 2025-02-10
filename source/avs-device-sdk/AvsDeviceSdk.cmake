# 配置 ARM 交叉编译
set(CMAKE_SYSTEM_NAME Linux)    #设置目标系统名字
set(CMAKE_SYSTEM_PROCESSOR arm) #设置目标处理器架构

# 指定编译器的 sysroot 路径
#set(TOOLCHAIN_DIR /mnt/newdisk/liuxinxin/toolchains/rk3566_v1.2.4_openssl)
set(TOOLCHAIN_DIR /mnt/newdisk/liuxinxin/toolchains/rk3326_v1.7.0_openssl_v2)
set(CMAKE_SYSROOT ${TOOLCHAIN_DIR}/aarch64-buildroot-linux-gnu/sysroot)

set(CMAKE_CROSSCOMPILING TRUE)
 
# 指定交叉编译器 arm-gcc 和 arm-g++
set(CMAKE_C_COMPILER            ${TOOLCHAIN_DIR}/bin/aarch64-buildroot-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER          ${TOOLCHAIN_DIR}/bin/aarch64-buildroot-linux-gnu-g++)

SET(CMAKE_FIND_ROOT_PATH  ${TOOLCHAIN_DIR}/aarch64-buildroot-linux-gnu/sysroot)
 
# 为编译器添加编译选项
#set(CMAKE_C_FLAGS "")
#set(CMAKE_CXX_FLAGS "-L/home/newdisk/toolchains/rk3326_v1.3.0/aarch64-buildroot-linux-gnu/sysroot/usr/lib -L/home/product/AVS/project/third-party-arm/portaudio/lib/.libs")


message(WARNING "lxx old CMAKE_CXX_FLAGS is ${CMAKE_CXX_FLAGS}")

set(CMAKE_PREFIX_PATH ${CMAKE_SYSROOT}/usr)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -I${CMAKE_SYSROOT}/usr/lib/glib-2.0/include -I${CMAKE_SYSROOT}/usr/include/gstreamer-1.0")

message(WARNING "lxx CMAKE_PREFIX_PATH is ${CMAKE_PREFIX_PATH}")
message(WARNING "lxx CMAKE_CXX_FLAGS is ${CMAKE_CXX_FLAGS}")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
