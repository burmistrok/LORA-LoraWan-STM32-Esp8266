/*
 * HAL_SPI.c
 *
 *  Created on: 14 апр. 2020 г.
 *      Author: ok
 */

#include "HAL_SPI.h"
#include "HAL_USART.h"
#include "CircularFIFOBuffer.h"


#define SET_CS()	GPIOB->ODR &= ~GPIO_ODR_ODR0
#define RESET_CS()	GPIOB->ODR |= GPIO_ODR_ODR0

static bool bSPIInit = false;
volatile static bool vReceiveData = false;
static TS_CircularFIFOBuffer TX_Buffer;
static TS_CircularFIFOBuffer RX_Buffer;


static void vLL_SPI_Init(void);


/****************************************************************************************
 * Funtion:
 * @brief:
 * Parameters:
 * Return:
 */
void vSPI_Init(const void* configPtr())
{

	bSPIInit = true;
	(void)configPtr();
	memset(TX_Buffer.Buffer, 0, BUFFER_SIZE);
	memset(RX_Buffer.Buffer, 0, BUFFER_SIZE);
	vLL_SPI_Init();

}

/****************************************************************************************
 * Funtion:
 * @brief:
 * Parameters:
 * Return:
 */
void vSPI_DeInit(void)
{
	bSPIInit = false;

}

/****************************************************************************************
 * Funtion:
 * @brief:
 * Parameters:
 * Return:
 */
void vSPI_MainFunction(void)
{



	if ( bSPIInit == false)
	{
		return;
	}
	else
	{


	}


}

static void vLL_SPI_Init(void)
{
	//LL_SPI_EnableIT_TXE(SPI1);
	//LL_SPI_EnableIT_RXNE(SPI1);
	//LL_SPI_EnableIT_ERR(SPI1);
	LL_SPI_Enable(SPI1);

	//Enable clock for GPIOA
	RCC->APB2ENR |=  RCC_APB2ENR_IOPBEN;

	//Configured PIN
	RESET_CS();
	GPIOB->CRL &= ~GPIO_CRL_CNF0;
	GPIOB->CRL |= GPIO_CRL_MODE0;
}


void vSPI_IT_CallBack(void)
{

	volatile uint8_t u8_Data = 0;

	if (LL_SPI_IsActiveFlag_TXE(SPI1))
	{
		if (bCircularFIFOBuffer_getElement(&TX_Buffer, (uint8_t*) &u8_Data) == false )
		{
			if (LL_SPI_IsEnabledIT_TXE(SPI1))
			{
				LL_SPI_DisableIT_TXE(SPI1);
			}
		}
		else
		{
			LL_SPI_TransmitData8(SPI1, u8_Data);
		}



	}
	if (LL_SPI_IsActiveFlag_RXNE(SPI1))
	{
		if (vReceiveData == true)
		{
			bCircularFIFOBuffer_addElement(&RX_Buffer, LL_SPI_ReceiveData8(SPI1));
		}
		else
		{
			LL_SPI_ReceiveData8(SPI1);
		}

	}

	if(LL_SPI_IsActiveFlag_OVR(SPI1))
	{

		LL_SPI_ReceiveData8(SPI1);
		LL_SPI_IsActiveFlag_OVR(SPI1);
	}
}


TE_ERROR HAL_SPI_SendChar(TS_SPI* SPIx, uint8_t Data)
{
	uint16_t u16_TimeOut;
	if (LL_SPI_IsActiveFlag_TXE(SPIx))
	{
		LL_SPI_TransmitData8(SPI1, Data);
		for (u16_TimeOut = 0u; u16_TimeOut <= 100u; u16_TimeOut++)
		{
			if (LL_SPI_IsActiveFlag_RXNE(SPIx))
			{
				LL_SPI_ReceiveData8(SPIx);
				return ERR_OK;
			}
		}
		return ERR_TIMEOUT;
	}
	return ERR_BUFFER_FULL;
}

TE_ERROR HAL_SPI_SendRecieveChar(TS_SPI* SPIx, uint8_t SData, uint8_t* RData)
{
	uint16_t u16_TimeOut;
	if (LL_SPI_IsActiveFlag_TXE(SPIx))
	{
		LL_SPI_TransmitData8(SPI1, SData);
		for (u16_TimeOut = 0u; u16_TimeOut <= 100u; u16_TimeOut++)
		{
			if (LL_SPI_IsActiveFlag_RXNE(SPIx))
			{
				*RData = LL_SPI_ReceiveData8(SPIx);
				return ERR_OK;
			}
		}
		return ERR_TIMEOUT;
	}
	return ERR_BUFFER_FULL;
}






TE_ERROR HAL_SPI_IT_SendChar(TS_SPI* SPIx, uint8_t Data)
{
	//SET_CS();
	if (bCircularFIFOBuffer_addElement(&TX_Buffer, Data) == true )
	{
		if ( !LL_SPI_IsEnabledIT_TXE(SPI1)  )
		{
			LL_SPI_EnableIT_TXE(SPI1);
		}
		return ERR_OK;
	}
	else
	{
		return ERR_BUFFER_FULL;
	}
}
TE_ERROR HAL_SPI_IT_SendRecieveChar(TS_SPI* SPIx, uint8_t SData, uint8_t* RData)
{
	uint8_t u8_Data = 0;
	uint16_t u16_TimeOut;
	vReceiveData = true;
	if (bCircularFIFOBuffer_addElement(&TX_Buffer, SData) == true )
	{
		if ( !LL_SPI_IsEnabledIT_TXE(SPI1)  )
		{
			LL_SPI_EnableIT_TXE(SPI1);
		}

		for (u16_TimeOut = 0u; u16_TimeOut <= 10u; u16_TimeOut++)
		if (bCircularFIFOBuffer_getElement(&RX_Buffer, (uint8_t*) &u8_Data) == true )
		{
			*RData = u8_Data;
			vReceiveData = false;
			return ERR_OK;
		}
		vReceiveData = false;
		return ERR_TIMEOUT;

	}
	else
	{
		vReceiveData = false;
		return ERR_BUFFER_FULL;
	}
}



TE_ERROR HAL_SPI_IT_ReceiveBuffer(TS_SPI* SPIx, uint8_t* Data, uint16_t Len, uint16_t* RecievedLen)
{
	uint16_t u16_Len = 0u;
	*RecievedLen = 0u;

	while (Len > u16_Len)
	{
		if (bCircularFIFOBuffer_getElement(&RX_Buffer, (uint8_t*) Data) == true )
		{
			Data++;
			u16_Len++;
			(*RecievedLen)++;
		}
		else
		{
			return ERR_BUFFER_EMPTY;
		}
	}

	return ERR_OK;
}

void vHAL_SPI_IT_SendRequestToReceive(TS_SPI* SPIx, uint16_t Len)
{
	uint16_t u16_Len = 0u;
	vReceiveData = true;
	while (Len > u16_Len)
	{
		u16_Len++;
		if (bCircularFIFOBuffer_addElement(&TX_Buffer, 0x00) == true )
		{

		}
	}
	if ( !LL_SPI_IsEnabledIT_TXE(SPI1)  )
	{
		LL_SPI_EnableIT_TXE(SPI1);
	}
}



void vSPI_SetCS(uint8_t Chip)
{


#if 0
	switch(Chip)
	{


	default:
		SET_CS();
	}

#else
	SET_CS();

#endif
}

void vSPI_ResetCS(uint8_t Chip)
{

#if 0
	switch(Chip)
	{


	default:
		RESET_CS();
	}

#else
	RESET_CS();
#endif
}


