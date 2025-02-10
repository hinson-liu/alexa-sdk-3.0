#ifndef __PMOLED__DEF__H__
#define __PMOLED__DEF__H__

#include <stdint.h>
#include <stdio.h>

#define DEBUG_INFO 1 /** 调试信息打印开关 */
#define pmoled_debug(fmt, args...) \
  do                            \
  {                             \
    if (DEBUG_INFO)             \
      printf(fmt, ##args);      \
  } while (0)               /** 调试接口，默认使用printf */


#define PMOLED_ERROR_NONE 0         /** 成功 */
#define PMOLED_ERROR_I2C -1         /** IIC通讯错误 */
#define PMOLED_ERROR_DATA -2        /** 数据格式错误 */

#define ST7315_MODE_CMD 0x00
#define ST7315_MODE_DATA 0x40

#define PMOLED_SLAVE_ADDR_A 0x3C    // PMOLED 左屏, index 0
#define PMOLED_SLAVE_ADDR_B 0x3D    // PMOLED 右屏, index 1


typedef enum
{
  PMOLED_LEFT = 0,    // 左屏
  PMOLED_RIGHT = 1,   // 右屏
  PMOLED_BOTH = 2     // 左右屏同时
} PMOLED_Select_e;


typedef enum
{
  PMOLED_DISABLE = 0,  // 关闭状态
  PMOLED_ENABLE = 1    // 使能状态
} PMOLED_Status_e;


/**
 * struct    PMOLED_DevConfig_t
 * brief     PMOLED模组配置数据
 */
typedef struct
{
  uint32_t display_mode;
} PMOLED_DevConfig_t;

/**
 * struct    PMOLED_Dev_t
 * brief     设备类型结构体
 */
typedef struct
{
  void (*SetResetPinLevelFunc)(uint32_t);  // 设置Reset电平函数指针，参数值为0，则输出低电平，否则输出高电平
  PMOLED_DevConfig_t config;               // 模组配置信息
  uint8_t i2c_dev_addr_a;                  // i2c设备地址(左屏)
  uint8_t i2c_dev_addr_b;                  // i2c设备地址(右屏)
  uint32_t dev_pwr_state;                  // 设备的当前状态, 就绪模式或者睡眠模式
} PMOLED_Dev_t;

/**
 * struct    PMOLED_Func_Ptr_t
 * brief     链接平台的API
 */
typedef struct
{
  int32_t (*I2C_WriteNBytesFunc)(uint8_t, uint8_t, uint8_t *, uint8_t); // i2c写函数
  int32_t (*I2C_ReadNBytesFunc)(uint8_t, uint8_t, uint8_t *, uint8_t);  // i2c读函数
  void (*Delay1msFunc)(uint32_t);                                       // 延时1ms函数
  void (*Delay10usFunc)(uint32_t);                                      // 延时10us函数
} PMOLED_Func_Ptr_t;

#endif
