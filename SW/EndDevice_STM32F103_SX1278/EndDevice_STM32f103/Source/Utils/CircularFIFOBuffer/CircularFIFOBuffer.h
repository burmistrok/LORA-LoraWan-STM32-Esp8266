/*
 * CircularFIFOBuffer.h
 *
 *  Created on: Apr 14, 2020
 *      Author: ok
 */

#ifndef UTILS_CIRCULARFIFOBUFFER_CIRCULARFIFOBUFFER_H_
#define UTILS_CIRCULARFIFOBUFFER_CIRCULARFIFOBUFFER_H_


#include "Std_types.h"




#define BUFFER_SIZE 255u


typedef struct{
	uint16_t u16_BufferSize;
	uint8_t Buffer[BUFFER_SIZE];
	uint16_t next;
	uint16_t first;

}TS_CircularFIFOBuffer;


// Get the first element from the FIFO queue
bool bCircularFIFOBuffer_getElement(TS_CircularFIFOBuffer* rg_Buffer, uint8_t* theElement);

// Add an element to the FIFO queue
bool bCircularFIFOBuffer_addElement(TS_CircularFIFOBuffer* rg_Buffer, uint8_t data);

#endif /* UTILS_CIRCULARFIFOBUFFER_CIRCULARFIFOBUFFER_H_ */
