/*
 * HAL_SPI.h
 *
 *  Created on: 14 апр. 2020 г.
 *      Author: ok
 */

#ifndef PERIPHERALS_HAL_SPI_HAL_SPI_H_
#define PERIPHERALS_HAL_SPI_HAL_SPI_H_

#include "Std_types.h"


void vSPI_Init			(const void* configPtr());
void vSPI_DeInit		(void);
void vSPI_MainFunction	(void);
void vSPI_IT_CallBack	(void);

TE_ERROR HAL_SPI_SendChar(TS_SPI* SPIx, uint8_t Data);

TE_ERROR HAL_SPI_SendRecieveChar(TS_SPI* SPIx, uint8_t SData, uint8_t* RData);

void vHAL_SPI_SendRequestToReceive(TS_SPI* SPIx, uint16_t Len);

TE_ERROR HAL_SPI_ReceiveBuffer(TS_SPI* SPIx, uint8_t* Data, uint16_t Len, uint16_t* RecievedLen);


#endif /* PERIPHERALS_HAL_SPI_HAL_SPI_H_ */
