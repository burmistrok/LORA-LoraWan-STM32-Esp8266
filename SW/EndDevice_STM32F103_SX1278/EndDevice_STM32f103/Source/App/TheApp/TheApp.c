/*
 * TheApp.c
 *
 *  Created on: May 10, 2020
 *      Author: ok
 */

#include "TheApp.h"
#include "SX1278.h"
#include "HAL_USART.h"


static bool bTheAppInit = false;
static uint16_t lu16_Delay;

void vTheApp_Init			(const void* configPtr)
{
	lu16_Delay = 0u;
	bTheAppInit = true;
	(void)configPtr;
}


void vTheApp_DeInit			(void)
{
	bTheAppInit = false;

}
void vTheApp_MainFunction	(void)
{

	uint16_t u16_len;
	uint8_t tmp_Buffer[MAX_PKT_LENGTH];

	if (bTheAppInit != true)
	{
		return;
	}
	else
	{

		if (0u < lu16_Delay--)
		{
			return;
		}
		else
		{
			HAL_USART_ReceiveBuffer(USART1, &tmp_Buffer[0], MAX_PKT_LENGTH, &u16_len);
			if (u16_len != 0u)
			{
				vSX1278_SendBufer(&tmp_Buffer[0], u16_len);

			}
			lu16_Delay = 10;
		}




	}

}
