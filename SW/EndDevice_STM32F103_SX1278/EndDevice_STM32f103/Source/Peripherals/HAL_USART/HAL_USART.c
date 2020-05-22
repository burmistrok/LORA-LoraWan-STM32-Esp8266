/*
 * USART.c
 *
 *  Created on: Apr 14, 2020
 *      Author: ok
 */


#include "HAL_USART.h"
#include "CircularFIFOBuffer.h"

#define SET_RTS()	GPIOB->ODR |= GPIO_ODR_ODR5
#define RESET_RTS()	GPIOB->ODR &= ~GPIO_ODR_ODR5


static bool bUSARTInit = false;
static TS_CircularFIFOBuffer TX_Buffer;
static TS_CircularFIFOBuffer RX_Buffer;


static void vLL_USART_Init(void);


/****************************************************************************************
 * Funtion:
 * @brief:
 * Parameters:
 * Return:
 */
void vUSART_Init(const void* configPtr())
{

	bUSARTInit = true;
	(void)configPtr();
	memset(TX_Buffer.Buffer, 0, BUFFER_SIZE);
	memset(RX_Buffer.Buffer, 0, BUFFER_SIZE);
	vLL_USART_Init();
}

/****************************************************************************************
 * Funtion:
 * @brief:
 * Parameters:
 * Return:
 */
void vUSART_DeInit(void)
{
	bUSARTInit = false;

}

/****************************************************************************************
 * Funtion:
 * @brief:
 * Parameters:
 * Return:
 */
void vUSART_MainFunction(void)
{

	//uint16_t u16_len;
	//uint8_t tmp_Buffer[BUFFER_SIZE];

	if ( bUSARTInit == false)
	{
		return;
	}
	else
	{
		//HAL_USART_SendBuffer(USART1, (uint8_t*)&"URA\r\n", 5, &u16_len);
		//HAL_USART_ReceiveBuffer(USART1, &tmp_Buffer[0], BUFFER_SIZE, &u16_len);
		//if (u16_len != 0u)
		//{
			//HAL_USART_SendBuffer(USART1, &tmp_Buffer[0], u16_len, &u16_len);

		//}

	}


}

/****************************************************************************************
 * Funtion:
 * @brief:
 * Parameters:
 * Return:
 */
void vUSART_ITCallBack(void)
{
	volatile uint8_t u8_Data = 0;

	if ((USART1->SR & USART_SR_RXNE_Msk) == USART_SR_RXNE)
	{
		bCircularFIFOBuffer_addElement(&RX_Buffer, LL_USART_ReceiveData8(USART1));
	}


	if ((USART1->SR & USART_SR_TC_Msk) == USART_SR_TC)
	{
		if (bCircularFIFOBuffer_getElement(&TX_Buffer, (uint8_t*) &u8_Data) == false )
		{
			if ((USART1->CR1 & USART_CR1_TCIE_Msk) == USART_CR1_TCIE)
			{
				LL_USART_DisableIT_TC(USART1);
				RESET_RTS();
			}
		}
		else
		{
			LL_USART_TransmitData8(USART1, u8_Data);
		}
	}



}

static void vLL_USART_Init(void)
{
	LL_USART_EnableIT_RXNE(USART1);

	//Enable clock for GPIOA
	RCC->APB2ENR |=  RCC_APB2ENR_IOPBEN;

	//Configured PIN
	GPIOB->CRL &= ~GPIO_CRL_CNF5;
	GPIOB->CRL |= GPIO_CRL_MODE5;
}



TE_ERROR HAL_USART_GetChar(TS_USART* USARTx, uint8_t* Data)
{
	uint8_t u8_Data = 0;
	if (bCircularFIFOBuffer_getElement(&RX_Buffer, (uint8_t*) &u8_Data) == true )
	{
		*Data = u8_Data;
		return ERR_OK;
	}
	else
	{
		return ERR_NOK;
	}


}


TE_ERROR HAL_USART_SendChar(TS_USART* USARTx, uint8_t Data)
{



	if (bCircularFIFOBuffer_addElement(&TX_Buffer, Data) == true )
	{
		if ( (USART1->CR1 & USART_CR1_TCIE_Msk) != USART_CR1_TCIE )
		{
			SET_RTS();
			LL_USART_EnableIT_TC(USART1);
		}
		return ERR_OK;
	}
	else
	{
		return ERR_BUFFER_FULL;
	}

}



TE_ERROR HAL_USART_SendBuffer(TS_USART* USARTx, uint8_t* Data, uint16_t Len, uint16_t* RecievedLen)
{
	uint16_t u16_Len = 0u;
	*RecievedLen = 0u;

	while (Len > u16_Len)
	{
		if (ERR_OK == HAL_USART_SendChar( USART1, *Data))
		{
			Data++;
			u16_Len++;
			(*RecievedLen)++;
		}
		else
		{
			return ERR_BUFFER_FULL;
		}
	}

	return ERR_OK;

}

TE_ERROR HAL_USART_ReceiveBuffer(TS_USART* USARTx, uint8_t* Data, uint16_t Len, uint16_t* RecievedLen)
{


	uint16_t u16_Len = 0u;
	*RecievedLen = 0u;

	while (Len > u16_Len)
	{
		if (ERR_OK == HAL_USART_GetChar( USART1, Data))
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

