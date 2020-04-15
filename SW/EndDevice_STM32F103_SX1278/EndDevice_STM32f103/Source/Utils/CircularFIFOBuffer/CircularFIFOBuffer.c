/*
 * CircularFIFOBuffer.c
 *
 *  Created on: Apr 14, 2020
 *      Author: ok
 */

#include "CircularFIFOBuffer.h"

//***********************************************************************************************

static uint8_t CircularFIFOBuffer_isFull( TS_CircularFIFOBuffer* rg_Buffer);

static uint8_t CircularFIFOBuffer_isEmpty(TS_CircularFIFOBuffer* rg_Buffer);

static uint16_t CircularFIFOBuffer_getNumberOfElements(TS_CircularFIFOBuffer* rg_Buffer);




static uint8_t CircularFIFOBuffer_isFull(TS_CircularFIFOBuffer* rg_Buffer){
  if (CircularFIFOBuffer_getNumberOfElements(rg_Buffer) == BUFFER_SIZE){
    return true ;
  }else{
    return false;
  }
}

static uint8_t CircularFIFOBuffer_isEmpty(TS_CircularFIFOBuffer* rg_Buffer){

  if ( rg_Buffer->next == rg_Buffer->first ){
    return true ;
  }else{
    return false;
  }
}



static uint16_t CircularFIFOBuffer_getNumberOfElements(TS_CircularFIFOBuffer* rg_Buffer){
  if (rg_Buffer->next >= rg_Buffer->first){
    return (uint16_t) (rg_Buffer->next - rg_Buffer->first);
  }else{
    return (uint16_t) (BUFFER_SIZE - rg_Buffer->next + rg_Buffer->first);
  }
}
//***********************************************************************************************


// Get the first element from the FIFO queue
bool bCircularFIFOBuffer_getElement(TS_CircularFIFOBuffer* rg_Buffer, uint8_t* theElement)
{
	  if ( CircularFIFOBuffer_isEmpty(rg_Buffer) != true){
	    *theElement = rg_Buffer->Buffer[rg_Buffer->first];
	    if ( rg_Buffer->first != BUFFER_SIZE ){
	      rg_Buffer->first++;
	    }else{
	      rg_Buffer->first = 0;
	    }
	  }else{
	    return false;
	  }

	  return true;// Return !0 always if it is not empty
}

// Add an element to the FIFO queue
bool bCircularFIFOBuffer_addElement(TS_CircularFIFOBuffer* rg_Buffer, uint8_t data)
{
	  if (CircularFIFOBuffer_isFull(rg_Buffer) != true){
	     rg_Buffer->Buffer[rg_Buffer->next] = data;
	     if ( rg_Buffer->next != BUFFER_SIZE ){
	      rg_Buffer->next++;
	     }else{
	      rg_Buffer->next = 0;
	     }
	    return true;
	  }else{
	    return false;
	  }
}
