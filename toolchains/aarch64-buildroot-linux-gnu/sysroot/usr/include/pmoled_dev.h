#ifndef __PMOLED_DEV_H__
#define __PMOLED_DEV_H__

#include "pmoled_def.h"

/** 获取SDK版本号 */
uint32_t PMOLED_GetSdkVersion(void);

/** 初始化PMOLED库的API */
void PMOLED_RegisteredPlatformApi(PMOLED_Func_Ptr_t dev_op);

/** 延时时间（ms） */
void PMOLED_Delay1ms(uint32_t ms);
/** 延时时间（10us） */
void PMOLED_Delay10us(uint32_t us);

/** 设置Reset引脚的电平 */
void SetResetPinLevel(PMOLED_Dev_t *pNxDevice, uint32_t level);

/** 获取当前显示模式 */
uint32_t PMOLED_GetDisplayMode(PMOLED_Dev_t *pNxDevice);

/** 获取设备当前信息 */
int32_t PMOLED_GetDevInfo(PMOLED_Dev_t *pNxDevice);

int32_t PMOLED_SendCmd(PMOLED_Dev_t *pNxDevice, uint8_t index, uint8_t cmd);
int32_t PMOLED_SendData(PMOLED_Dev_t *pNxDevice, uint8_t index, uint8_t data);

/** 初始化PMOLED设备 */
int32_t PMOLED_InitDevice(PMOLED_Dev_t *pNxDevice);

#endif

