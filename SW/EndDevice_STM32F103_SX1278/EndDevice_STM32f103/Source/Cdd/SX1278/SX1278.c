/*
 * SX1278.c
 *
 *  Created on: 16 апр. 2020 г.
 *      Author: ok
 */


#include "SX1278.h"
#include "HAL_USART.h"
#include "HAL_SPI.h"



// registers
#define REG_FIFO                 0x00u
#define REG_OP_MODE              0x01u
#define REG_FRF_MSB              0x06u
#define REG_FRF_MID              0x07u
#define REG_FRF_LSB              0x08u
#define REG_PA_CONFIG            0x09u
#define REG_OCP                  0x0b
#define REG_LNA                  0x0cu
#define REG_FIFO_ADDR_PTR        0x0du
#define REG_FIFO_TX_BASE_ADDR    0x0eu
#define REG_FIFO_RX_BASE_ADDR    0x0fu
#define REG_FIFO_RX_CURRENT_ADDR 0x10u
#define REG_IRQ_FLAGS            0x12u
#define REG_RX_NB_BYTES          0x13u
#define REG_PKT_SNR_VALUE        0x19u
#define REG_PKT_RSSI_VALUE       0x1au
#define REG_MODEM_CONFIG_1       0x1du
#define REG_MODEM_CONFIG_2       0x1eu
#define REG_PREAMBLE_MSB         0x20u
#define REG_PREAMBLE_LSB         0x21u
#define REG_PAYLOAD_LENGTH       0x22u
#define REG_MODEM_CONFIG_3       0x26u
#define REG_FREQ_ERROR_MSB       0x28u
#define REG_FREQ_ERROR_MID       0x29u
#define REG_FREQ_ERROR_LSB       0x2au
#define REG_RSSI_WIDEBAND        0x2cu
#define REG_DETECTION_OPTIMIZE   0x31u
#define REG_DETECTION_THRESHOLD  0x37u
#define REG_SYNC_WORD            0x39u
#define REG_DIO_MAPPING_1        0x40u
#define REG_VERSION              0x42u
#define REG_PA_DAC               0x4d

// modes
#define MODE_LONG_RANGE_MODE     0x80u
#define MODE_SLEEP               0x00u
#define MODE_STDBY               0x01u
#define MODE_TX                  0x03u
#define MODE_RX_CONTINUOUS       0x05u
#define MODE_RX_SINGLE           0x06u

// PA config
#define PA_BOOST                 0x80u



// IRQ masks
#define IRQ_TX_DONE_MASK           0x08u
#define IRQ_PAYLOAD_CRC_ERROR_MASK 0x20u
#define IRQ_RX_DONE_MASK           0x40u

#define SET_RESET_PIN()		GPIOB->ODR |= GPIO_ODR_ODR11
#define RESET_RESET_PIN()	GPIOB->ODR &= ~GPIO_ODR_ODR11

#define SPI_SEND(arg1)					HAL_SPI_SendChar(SPI1, arg1)
#define SPI_SEND_RECIEVE(arg1, arg2)	HAL_SPI_SendRecieveChar(SPI1, arg1, arg2)

static void vLL_SX1278_Init(void);

static bool bSX1278ReadRegister(uint8_t Register, uint8_t* Data);
static bool bSX1278WriteRegister(uint8_t Register, uint8_t Data);
static bool bSX1278_SetFrequency(uint64_t frequency);
static bool bSX1278_DivideBuffer(uint8_t TXBasAddr, uint8_t RXBasAdr);
static bool bSX1278_EnBoost(void);
static bool bSX1278_SetExplicitHeaderMode(void);
static bool bSX1278_ResetFIFO(void);
static bool bSX1278_UploadTX_Buffer(uint8_t* Data, uint16_t Len);
static bool bSX1278_SetTXPower(void);

static bool bSX1278Init = false;
static TE_StateSX1278 enStateSX1278;
static uint16_t lu16_Delay;
static uint8_t su8_ModemMode;

static bool sbStateRdRg = false;
static bool sbStateWrRg = false;
static bool sbInitDone = false;
static bool sb_isTXModeCheckDone = false;

static ST_SX127xBuffer sDataBuffer;
/****************************************************************************************
 * Funtion:
 * @brief:
 * Parameters:
 * Return:
 */
void vSX1278_Init(const void* configPtr)
{
	vLL_SX1278_Init();
	SET_RESET_PIN();
	enStateSX1278 = RESET_LOW;
	lu16_Delay = 0u;
	bSX1278Init = true;
	(void)configPtr;
	sDataBuffer.Len = 0u;

}

/****************************************************************************************
 * Funtion:
 * @brief:
 * Parameters:
 * Return:
 */
void vSX1278_DeInit(void)
{
	bSX1278Init = false;

}

/****************************************************************************************
 * Funtion:
 * @brief:
 * Parameters:
 * Return:
 */
void vSX1278_MainFunction(void)
{
	static bool sb_IdleTriger = true;
	uint8_t u8_tmpData = 0u;
	bool  bResponse;
	uint8_t rg_Buffer[100];
	uint16_t u16_tmpData;
	uint16_t u16_tmpData1;

	if (bSX1278Init != true)
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
		switch (enStateSX1278)
		{

		case READ_VERSION:
			bResponse = bSX1278ReadRegister(REG_VERSION, &u8_tmpData);
			if (true == bResponse)
			{
				if (u8_tmpData == 0x12u)
				{
					u16_tmpData = sprintf((char*) &rg_Buffer[0], (char*)&"Version is :%x\n\r", u8_tmpData);
					HAL_USART_SendBuffer(USART1, &rg_Buffer[0], u16_tmpData, &u16_tmpData1);
					enStateSX1278 = SLEEP;
				}
				else
				{
					enStateSX1278 = ERROR_HANDLER;
				}
			}
			else
			{
				;//do nothing
			}
			lu16_Delay = 0u;
			break;

		case SLEEP:
			bResponse = bSX1278WriteRegister(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_SLEEP);
			if (true == bResponse)
			{
				if (sbInitDone == false)
				{
					enStateSX1278 = SET_FREQUENCY;
				}
			}
			lu16_Delay = 0u;
			break;

		case SET_FREQUENCY:
			bResponse = bSX1278_SetFrequency(433E6);
			if  (true == bResponse)
			{
				enStateSX1278 = DEVIDE_BUFFER;
			}
			lu16_Delay = 0u;
			break;

		case DEVIDE_BUFFER:
			bResponse = bSX1278_DivideBuffer(0u, 0u);
			if  (true == bResponse)
			{
				enStateSX1278 = CMD_BOOST_ON;
			}
			lu16_Delay = 0u;
			break;

		case CMD_BOOST_ON:
			bResponse = bSX1278_EnBoost();
			if (true == bResponse)
			{
				enStateSX1278 = CMD_EN_AUTO_GAIN_FOR_LNA;
			}
			lu16_Delay = 0u;
			break;


		case CMD_EN_AUTO_GAIN_FOR_LNA:
			bResponse = bSX1278WriteRegister(REG_MODEM_CONFIG_3, 0x04u);
			if (true == bResponse)
			{
				enStateSX1278 = SET_TX_POWER;
			}
			lu16_Delay = 0u;
			break;

		case SET_TX_POWER:
			//set max power;

			bResponse = bSX1278_SetTXPower();
			if (true == bResponse)
			{
				enStateSX1278 = IDLE;
				sbInitDone = true;
			}
			lu16_Delay = 0u;
			break;

		case RESET_LOW:
			RESET_RESET_PIN();
			lu16_Delay = 10u;
			enStateSX1278 = RESET_HIGH;
			break;

		case RESET_HIGH:
			SET_RESET_PIN();
			lu16_Delay = 10u;
			enStateSX1278 = READ_VERSION;
			break;

		case IDLE:
			if (sb_IdleTriger == true)
			{
				bResponse = bSX1278WriteRegister(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_STDBY);
				if ( true == bResponse)
				{
				sb_IdleTriger = false;
				}
			}
			else
			{
				if (sDataBuffer.Len > 0u)
				{
					if ( false == sb_isTXModeCheckDone )
					{
						bResponse = bSX1278ReadRegister(REG_OP_MODE, &su8_ModemMode);
						if (true == bResponse )
						{
							enStateSX1278 = IRQ_HANDLER;
							sb_isTXModeCheckDone = true;
							sb_IdleTriger = true;
						}
						else
						{
							; //do nothing
						}
					}
					else
					{
							enStateSX1278 = CMD_SET_EXP_MOD;
							sb_isTXModeCheckDone = false;
							sb_IdleTriger = true;
					}
				}
				else
				{
					;//do nothing
				}
			}
			lu16_Delay = 0u;
			break;

		case CMD_SET_EXP_MOD:
			bResponse = bSX1278_SetExplicitHeaderMode();
			if (true == bResponse)
			{
				enStateSX1278 = RESET_FIFO;
			}
			lu16_Delay = 0u;
			break;

		case RESET_FIFO:
			bResponse = bSX1278_ResetFIFO();
			if (true == bResponse)
			{
				enStateSX1278 = UPLOAD_TX_BUFFER;
			}
			lu16_Delay = 0u;
			break;

		case UPLOAD_TX_BUFFER:
			bResponse = bSX1278_UploadTX_Buffer( &sDataBuffer.Data[0], sDataBuffer.Len);
			if (true == bResponse )
			{
				enStateSX1278 = SET_TX_MODE;
			}
			lu16_Delay = 0u;
			break;

		case SET_TX_MODE:
			bResponse = bSX1278WriteRegister(REG_OP_MODE, MODE_LONG_RANGE_MODE | MODE_TX);
			if (true == bResponse )
			{
				enStateSX1278 = IRQ_HANDLER;
				sDataBuffer.Len = 0u;
			}
			lu16_Delay = 0u;
			break;

		case IRQ_HANDLER:
			bResponse = bSX1278ReadRegister(REG_IRQ_FLAGS, &u8_tmpData);
			if (true == bResponse)
			{
				if ( (u8_tmpData & IRQ_TX_DONE_MASK) == IRQ_TX_DONE_MASK)
				{
					enStateSX1278 = CLEAR_IRQ_FLAGS;
				}
				else
				{
					if (sDataBuffer.Len > 0u)
					{
						enStateSX1278 = IDLE;

					}
					else
					{
						;//do nothing
					}
				}

			}
			else
			{
				;//do nothing
			}

			lu16_Delay = 0u;
			break;

		case CLEAR_IRQ_FLAGS:
			bResponse = bSX1278WriteRegister(REG_IRQ_FLAGS, IRQ_TX_DONE_MASK);
			if (true == bResponse )
			{
				enStateSX1278 = IDLE;
			}
			lu16_Delay = 0u;
			break;

		case ERROR_HANDLER:
			HAL_USART_SendBuffer(USART1,(uint8_t*) &"ERROR\n\r", 7u, &u16_tmpData1);
			lu16_Delay = 10000u;
			break;

		default:
			break;
		}
		}
	}

}


static void vLL_SX1278_Init(void)
{
	//Enable clock for GPIOA
	RCC->APB2ENR |=  RCC_APB2ENR_IOPBEN;

	//Configured PIN
	GPIOB->CRH &= ~GPIO_CRH_CNF11;
	GPIOA->CRH |= GPIO_CRH_MODE11;
}


static bool bSX1278ReadRegister(uint8_t Register, uint8_t* Data)
{
	if (sbStateRdRg == false)
	{
		vSPI_SetCS(0u);
		SPI_SEND(Register & 0x7f);
		sbStateRdRg = true;
		return false;
	}
	else
	{
		SPI_SEND_RECIEVE((uint8_t) 0x00, Data);
		vSPI_ResetCS(0u);
		sbStateRdRg = false;
		return true;
	}
}

static bool bSX1278WriteRegister(uint8_t Register, uint8_t Data)
{
	if (sbStateWrRg == false)
	{
		vSPI_SetCS(0u);
		SPI_SEND(Register | 0x80);
		sbStateWrRg = true;
		return false;
	}
	else
	{
		SPI_SEND(Data);
		vSPI_ResetCS(0u);
		sbStateWrRg = false;
		return true;
	}
}



static bool bSX1278_SetFrequency(uint64_t frequency){

	static uint8_t lu8_State = 0u;
	bool  bResponse;
	uint8_t u8_Data;
	uint64_t frf = ((uint64_t)frequency << 19) / 32000000;


	switch (lu8_State)
	{
	case 0:

		u8_Data = (uint8_t)(frf >> 16);
		bResponse = bSX1278WriteRegister(REG_FRF_MSB, u8_Data);
		if (true == bResponse)
		{
			lu8_State++;
		}

	break;

	case 1:

		u8_Data = (uint8_t)(frf >> 8);
		bResponse = bSX1278WriteRegister(REG_FRF_MID, u8_Data);
		if (true == bResponse)
		{
			lu8_State++;
		}

	break;

	case 2:

		u8_Data = (uint8_t)(frf >> 0);
		bResponse = bSX1278WriteRegister(REG_FRF_LSB, u8_Data);
		if (true == bResponse)
		{
			lu8_State = 0u;
			return true;
		}
		break;

	default:
		;
	  }
	return false;
}

static bool bSX1278_DivideBuffer(uint8_t TXBasAddr, uint8_t RXBasAdr)
{
	static uint8_t lu8_State = 0u;
	bool  bResponse;

	switch (lu8_State)
	{
	case 0:
		bResponse = bSX1278WriteRegister(REG_FIFO_TX_BASE_ADDR, TXBasAddr);
			if (true == bResponse)
			{
				lu8_State++;
			}
		break;

	case 1:
		bResponse = bSX1278WriteRegister(REG_FIFO_RX_BASE_ADDR, RXBasAdr);
			if (true == bResponse)
			{
				lu8_State = 0u;
				return true;
			}
		break;

	default:
		;
	}

	return false;

}


static bool bSX1278_EnBoost(void)
{
	static uint8_t lu8_State = 0u;
	static uint8_t lu8_response;
	bool  bResponse;

	switch (lu8_State)
	{

	case 0:
		bResponse = bSX1278ReadRegister(REG_LNA, &lu8_response);
		if (true == bResponse)
		{

			lu8_State++;
		}
		break;

	case 1:
		lu8_response |= 0x03u;
		bResponse = bSX1278WriteRegister(REG_LNA, lu8_response);
		if (true == bResponse)
			{
				lu8_State = 0u;
				return true;
			}

	break;

	default:
		break;
	}

	return false;
}


static bool bSX1278_SetExplicitHeaderMode(void)
{

	static uint8_t lu8_State = 0u;
	static uint8_t lu8_response;
	bool  bResponse;

	switch (lu8_State)
	{

	case 0:
		bResponse = bSX1278ReadRegister(REG_MODEM_CONFIG_1, &lu8_response);
		if (true == bResponse)
		{

			lu8_State++;
		}
		break;

	case 1:
		lu8_response &= 0xFE;
		bResponse = bSX1278WriteRegister(REG_MODEM_CONFIG_1, lu8_response);
		if (true == bResponse)
			{
				lu8_State = 0u;
				return true;
			}

	break;

	default:
		break;
	}

	return false;
}

static bool bSX1278_ResetFIFO(void)
{
	static uint8_t lu8_State = 0u;
	bool  bResponse;

	switch (lu8_State)
	{
	case 0:
		bResponse = bSX1278WriteRegister(REG_FIFO_ADDR_PTR, 0u);
			if (true == bResponse)
			{
				lu8_State++;
			}
		break;

	case 1:
		bResponse = bSX1278WriteRegister(REG_PAYLOAD_LENGTH, 0u);
			if (true == bResponse)
			{
				lu8_State = 0u;
				return true;
			}
		break;

	default:
		;
	}

	return false;
}

static bool bSX1278_SetTXPower(void)
{
	static uint8_t lu8_State = 0u;
	bool  bResponse;

	switch (lu8_State)
	{
	case 0:
		bResponse = bSX1278WriteRegister(REG_PA_DAC, 0x84u);
			if (true == bResponse)
			{
				lu8_State++;
			}
		break;

	case 1:
		bResponse = bSX1278WriteRegister(REG_OCP, 0x2Bu);
			if (true == bResponse)
			{
				lu8_State++;
			}
		break;

	case 2:
		bResponse = bSX1278WriteRegister(REG_PA_CONFIG,  PA_BOOST | 15u);
			if (true == bResponse)
			{
				lu8_State = 0u;
				return true;
			}
		break;

	default:
		;
	}

	return false;
}

static bool bSX1278_UploadTX_Buffer(uint8_t* Data, uint16_t Len)
{
	static uint8_t lu8_State = 0u;
	static uint8_t lu8_PrevPoz = 0u;
	static uint16_t lu16_Len = 0u;
	uint16_t u16_CurPoz;
	bool  bResponse;


	switch (lu8_State)
	{
		case 0:
			bResponse = bSX1278ReadRegister(REG_PAYLOAD_LENGTH, &lu8_PrevPoz);
				if (true == bResponse)
				{
					lu8_State++;
				}
			break;

		case 1:

			bResponse = bSX1278WriteRegister(REG_FIFO, Data[lu16_Len]);
			if (true == bResponse)
			{
				if ((Len > lu16_Len) && ((lu8_PrevPoz + lu16_Len ) < MAX_PKT_LENGTH))
				{
					lu16_Len++;
				}
				else
				{
					lu8_State++;
				}
			}
			else
			{
				;//do nothing
			}

			break;

		case 2:
			u16_CurPoz = lu16_Len + lu8_PrevPoz;
			bResponse = bSX1278WriteRegister(REG_PAYLOAD_LENGTH, u16_CurPoz);
			if (true == bResponse)
			{
				lu16_Len = 0u;
				lu8_State = 0u;
				return true;
			}
		break;

		default:
			;
	}

	return false;

}

void vSX1278_SendBufer(uint8_t* Data, uint16_t Len)
{
	if (sDataBuffer.Len == 0u)
	{
		uint16_t u16_Len = 0u;
		while ( (Len > u16_Len) && (u16_Len < MAX_PKT_LENGTH) )
		{
			sDataBuffer.Data[u16_Len] = *Data ;
			sDataBuffer.Len++;
			u16_Len++;
			Data++;
		}
	}
}


