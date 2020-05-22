################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/adc.c \
../Core/Src/gpio.c \
../Core/Src/main.c \
../Core/Src/spi.c \
../Core/Src/stm32f1xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32f1xx.c \
../Core/Src/usart.c 

OBJS += \
./Core/Src/adc.o \
./Core/Src/gpio.o \
./Core/Src/main.o \
./Core/Src/spi.o \
./Core/Src/stm32f1xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32f1xx.o \
./Core/Src/usart.o 

C_DEPS += \
./Core/Src/adc.d \
./Core/Src/gpio.d \
./Core/Src/main.d \
./Core/Src/spi.d \
./Core/Src/stm32f1xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32f1xx.d \
./Core/Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/adc.o: ../Core/Src/adc.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-DVDD_VALUE=3300' '-DHSE_VALUE=8000000' -DSTM32F103xB '-DLSI_VALUE=40000' '-DHSI_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' -DUSE_FULL_LL_DRIVER -DDEBUG '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DPREFETCH_ENABLE=1' -c -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Common" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Core/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/App/TheApp" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_USART" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils/CircularFIFOBuffer" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/SchM" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Include" -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_SPI" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Inlude" -I../Drivers/CMSIS/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/Led" -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Com/ModBus" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/SX1278" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Kernel" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/adc.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/gpio.o: ../Core/Src/gpio.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-DVDD_VALUE=3300' '-DHSE_VALUE=8000000' -DSTM32F103xB '-DLSI_VALUE=40000' '-DHSI_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' -DUSE_FULL_LL_DRIVER -DDEBUG '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DPREFETCH_ENABLE=1' -c -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Common" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Core/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/App/TheApp" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_USART" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils/CircularFIFOBuffer" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/SchM" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Include" -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_SPI" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Inlude" -I../Drivers/CMSIS/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/Led" -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Com/ModBus" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/SX1278" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Kernel" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/gpio.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/main.o: ../Core/Src/main.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-DVDD_VALUE=3300' '-DHSE_VALUE=8000000' -DSTM32F103xB '-DLSI_VALUE=40000' '-DHSI_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' -DUSE_FULL_LL_DRIVER -DDEBUG '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DPREFETCH_ENABLE=1' -c -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Common" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Core/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/App/TheApp" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_USART" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils/CircularFIFOBuffer" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/SchM" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Include" -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_SPI" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Inlude" -I../Drivers/CMSIS/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/Led" -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Com/ModBus" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/SX1278" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Kernel" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/main.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/spi.o: ../Core/Src/spi.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-DVDD_VALUE=3300' '-DHSE_VALUE=8000000' -DSTM32F103xB '-DLSI_VALUE=40000' '-DHSI_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' -DUSE_FULL_LL_DRIVER -DDEBUG '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DPREFETCH_ENABLE=1' -c -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Common" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Core/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/App/TheApp" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_USART" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils/CircularFIFOBuffer" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/SchM" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Include" -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_SPI" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Inlude" -I../Drivers/CMSIS/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/Led" -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Com/ModBus" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/SX1278" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Kernel" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/spi.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/stm32f1xx_it.o: ../Core/Src/stm32f1xx_it.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-DVDD_VALUE=3300' '-DHSE_VALUE=8000000' -DSTM32F103xB '-DLSI_VALUE=40000' '-DHSI_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' -DUSE_FULL_LL_DRIVER -DDEBUG '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DPREFETCH_ENABLE=1' -c -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Common" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Core/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/App/TheApp" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_USART" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils/CircularFIFOBuffer" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/SchM" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Include" -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_SPI" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Inlude" -I../Drivers/CMSIS/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/Led" -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Com/ModBus" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/SX1278" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Kernel" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/stm32f1xx_it.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/syscalls.o: ../Core/Src/syscalls.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-DVDD_VALUE=3300' '-DHSE_VALUE=8000000' -DSTM32F103xB '-DLSI_VALUE=40000' '-DHSI_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' -DUSE_FULL_LL_DRIVER -DDEBUG '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DPREFETCH_ENABLE=1' -c -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Common" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Core/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/App/TheApp" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_USART" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils/CircularFIFOBuffer" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/SchM" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Include" -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_SPI" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Inlude" -I../Drivers/CMSIS/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/Led" -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Com/ModBus" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/SX1278" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Kernel" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/syscalls.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/sysmem.o: ../Core/Src/sysmem.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-DVDD_VALUE=3300' '-DHSE_VALUE=8000000' -DSTM32F103xB '-DLSI_VALUE=40000' '-DHSI_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' -DUSE_FULL_LL_DRIVER -DDEBUG '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DPREFETCH_ENABLE=1' -c -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Common" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Core/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/App/TheApp" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_USART" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils/CircularFIFOBuffer" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/SchM" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Include" -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_SPI" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Inlude" -I../Drivers/CMSIS/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/Led" -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Com/ModBus" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/SX1278" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Kernel" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/sysmem.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/system_stm32f1xx.o: ../Core/Src/system_stm32f1xx.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-DVDD_VALUE=3300' '-DHSE_VALUE=8000000' -DSTM32F103xB '-DLSI_VALUE=40000' '-DHSI_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' -DUSE_FULL_LL_DRIVER -DDEBUG '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DPREFETCH_ENABLE=1' -c -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Common" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Core/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/App/TheApp" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_USART" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils/CircularFIFOBuffer" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/SchM" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Include" -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_SPI" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Inlude" -I../Drivers/CMSIS/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/Led" -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Com/ModBus" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/SX1278" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Kernel" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/system_stm32f1xx.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/usart.o: ../Core/Src/usart.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 '-DVDD_VALUE=3300' '-DHSE_VALUE=8000000' -DSTM32F103xB '-DLSI_VALUE=40000' '-DHSI_VALUE=8000000' '-DHSE_STARTUP_TIMEOUT=100' -DUSE_FULL_LL_DRIVER -DDEBUG '-DLSE_STARTUP_TIMEOUT=5000' '-DLSE_VALUE=32768' '-DPREFETCH_ENABLE=1' -c -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Common" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Core/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/App/TheApp" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_USART" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Utils/CircularFIFOBuffer" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/SchM" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Drivers/CMSIS/Include" -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Peripherals/HAL_SPI" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Inlude" -I../Drivers/CMSIS/Include -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/Led" -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Com/ModBus" -I../Drivers/STM32F1xx_HAL_Driver/Inc -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Cdd/SX1278" -I"D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Source/Services/Kernel" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/usart.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

