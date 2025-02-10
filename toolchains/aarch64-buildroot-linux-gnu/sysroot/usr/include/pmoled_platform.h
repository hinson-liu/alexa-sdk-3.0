#ifndef __PMOLED_PLATFORM__H__
#define __PMOLED_PLATFORM__H__

#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <string.h>
#include <linux/i2c.h>
#include <linux/i2c-dev.h>

#include "pmoled_def.h"

#define msleep(x)      usleep((x)*1000)

#define gpio2_a4        68
#define gpio2_a3        67
#define RESET_GPIO_0    gpio2_a4
#define RESET_GPIO_1    gpio2_a3

#define I2C_DEVICE "/dev/i2c-2"

//int i2c_fd = -1;

int32_t i2c_init(int *i2cid);
int32_t i2c_release(int *i2cid);


/**
 * brief   I2C读一个字节
 * 
 * param   i2c_addr       从机设备地址
 * param   i2c_read_addr  读寄存器地址
 * param   i2c_read_data  读数据
 * return  int32_t   
 * retval  0:成功, 其他:失败
 */
int32_t i2c_read_nbytes(uint8_t i2c_addr, uint8_t i2c_read_addr, uint8_t *i2c_read_data, uint8_t len);

/**
 * brief   I2C写一个字节
 * 
 * param   i2c_addr        从机设备地址
 * param   i2c_write_addr  写寄存器地址
 * param   i2c_write_data  写数据
 * return  int32_t   
 * retval  0:成功, 其他:失败
 */
int32_t i2c_write_nbytes(uint8_t i2c_addr, uint8_t i2c_write_addr, uint8_t *i2c_write_data, uint8_t len);


/**
 * brief 延时count毫秒
 *
 * param   count  输入需要延时时长  
 * return  void   
 */
void delay_1ms(uint32_t count);

/**
 * brief 延时10*count微秒
 *
 * param   count  输入需要延时时长
 * return  void   
 */
void delay_10us(uint32_t count);


/**
 * brief 设置PMOLED reset引脚电平
 *
 * param   level  引脚电平，0为低电平，1为高电平
 * return  void
 */
void set_reset_pin_level(uint32_t level);

#endif

