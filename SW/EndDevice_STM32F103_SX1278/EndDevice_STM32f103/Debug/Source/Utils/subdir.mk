################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Source/Utils/Utils.c 

OBJS += \
./Source/Utils/Utils.o 

C_DEPS += \
./Source/Utils/Utils.d 


# Each subdirectory must supply rules for building sources it contributes
Source/Utils/Utils.o: ../Source/Utils/Utils.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-DVDD_VALUE=3300' '-DHSE_VALUE=8000000' -DSTM32F103xB '-DLSI_VALUE=40000' '-DHSI_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' -DUSE_FULL_LL_DRIVER -DDEBUG '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DPREFETCH_ENABLE=1' -c -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Common" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Core/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_USART" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils/CircularFIFOBuffer" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/SchM" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Include" -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_SPI" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Inlude" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/SX1208" -I../Drivers/CMSIS/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/Led" -I../Core/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Com/ModBus" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Kernel" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Source/Utils/Utils.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

