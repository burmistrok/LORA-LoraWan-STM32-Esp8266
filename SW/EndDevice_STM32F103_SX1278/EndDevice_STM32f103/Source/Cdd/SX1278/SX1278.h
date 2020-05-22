/*
 * SX1278.h
 *
 *  Created on: 16 апр. 2020 г.
 *      Author: ok
 */

#ifndef CDD_SX1278_SX1278_H_
#define CDD_SX1278_SX1278_H_

#include "Std_types.h"


#define MAX_PKT_LENGTH           255



void vSX1278_Init			(const void* configPtr);
void vSX1278_DeInit		(void);
void vSX1278_MainFunction	(void);


void vSX1278_SendBufer(uint8_t* Data, uint16_t Len);




typedef enum
{
	READ_VERSION = 0u,
	RESET_LOW,
	RESET_HIGH,
	SLEEP,
	IDLE,
	IS_MODEM_TX_MODE,
	UPLOAD_TX_BUFFER,
	CMD_SEND_BUFFER,
	ERROR_HANDLER,
	SET_FREQUENCY,
	DEVIDE_BUFFER,
	SET_TX_POWER,
	CMD_BOOST_ON,
	CMD_EN_AUTO_GAIN_FOR_LNA,
	CMD_SET_EXP_MOD,
	IRQ_HANDLER,
	CLEAR_IRQ_FLAGS,
	RESET_FIFO,
	SET_TX_MODE,





}TE_StateSX1278;


typedef struct
{
	uint8_t Data[MAX_PKT_LENGTH];
	uint16_t Len;
}ST_SX127xBuffer;

#endif /* CDD_SX1278_SX1278_H_ */
