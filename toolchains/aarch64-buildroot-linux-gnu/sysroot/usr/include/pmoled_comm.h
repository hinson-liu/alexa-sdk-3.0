#ifndef __PMOLED_COMM_H__
#define __PMOLED_COMM_H__

#include "pmoled_def.h"

/** IIC注册函数，即将实现的iic接口函数传输注册到本SDK中 */
void PMOLED_RegisteredIICApi(
        int32_t(*I2C_WriteNBytesFunc)(uint8_t, uint8_t, uint8_t *, uint8_t len),
        int32_t(*I2C_ReadNBytesFunc)(uint8_t, uint8_t, uint8_t *, uint8_t len)
    );
    
/** 寄存器写1个字节 */
int32_t PMOLED_WriteByte(PMOLED_Dev_t *pNxDevice, uint8_t index, uint8_t addr, uint8_t wdata);

#endif

