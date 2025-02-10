#ifndef __PMOLED_DATA_H__
#define __PMOLED_DATA_H__

#include "pmoled_def.h"

/** index: 0-左屏, 1-右屏, 2或其他-两个屏同时操作 */
int32_t PMOLED_FillScreen(PMOLED_Dev_t *pNxDevice, uint8_t index, uint8_t data);

int32_t PMOLED_DrawBitmap(PMOLED_Dev_t *pNxDevice, uint8_t index, uint8_t *bmp, uint32_t bytes);

#endif

