/*
 * Utils.c
 *
 *  Created on: Apr 13, 2020
 *      Author: ok
 */


#include "Utils.h"


/*******************************
 * Funtion:		u16Calculate_CRC16Modbus
 * @brief:
 * Parameters:	u8Data
 * 				u16Len
 * Return:		lu16_crc
 */


uint16_t u16Calculate_CRC16Modbus(uint8_t* u8Data, uint16_t u16Len)
{
	 uint16_t lu16_crc = 0xFFFF;
	 uint16_t lu16_counter, lu16_pos;

	 for (lu16_pos = 0; lu16_pos < u16Len; lu16_pos++)
	 {
		 lu16_crc ^= (uint16_t)u8Data[lu16_pos];
		 for (lu16_counter = 0; lu16_counter < 8; ++lu16_counter)
		 {
			 if (lu16_crc & 1)
				 lu16_crc = (lu16_crc >> 1) ^ 0xA001;
			 else
				 lu16_crc = (lu16_crc >> 1);
		 }
	 }
  return lu16_crc;
}
