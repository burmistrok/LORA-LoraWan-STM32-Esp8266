################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Source/Utils/CircularFIFOBuffer/subdir.mk
-include Source/Utils/subdir.mk
-include Source/Services/SchM/subdir.mk
-include Source/Services/Kernel/subdir.mk
-include Source/Peripherals/HAL_USART/subdir.mk
-include Source/Peripherals/HAL_SPI/subdir.mk
-include Source/Cdd/SX1278/subdir.mk
-include Source/Cdd/Led/subdir.mk
-include Source/App/TheApp/subdir.mk
-include Drivers/STM32F1xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
EndDevice_STM32f103.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
EndDevice_STM32f103.list \

OBJCOPY_BIN += \
EndDevice_STM32f103.bin \


# All Target
all: EndDevice_STM32f103.elf secondary-outputs

dependents:
	-cd D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Release && $(MAKE) all

# Tool invocations
EndDevice_STM32f103.elf: $(OBJS) $(USER_OBJS) D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Release/EndDevice_STM32f103.elf D:\oleg\scris\utm\Proiect_de_diploma\Repositorie\LORA-LoraWan-STM32-Esp8266\SW\EndDevice_STM32F103_SX1278\EndDevice_STM32f103\STM32F103C8TX_FLASH.ld
	arm-none-eabi-gcc -o "EndDevice_STM32f103.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m3 -T"D:\oleg\scris\utm\Proiect_de_diploma\Repositorie\LORA-LoraWan-STM32-Esp8266\SW\EndDevice_STM32F103_SX1278\EndDevice_STM32f103\STM32F103C8TX_FLASH.ld" --specs=nosys.specs -Wl,-Map="EndDevice_STM32f103.map" -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

EndDevice_STM32f103.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "EndDevice_STM32f103.list"
	@echo 'Finished building: $@'
	@echo ' '

EndDevice_STM32f103.bin: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "EndDevice_STM32f103.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

.PHONY: all clean dependents
.SECONDARY:
D:/oleg/scris/utm/Proiect_de_diploma/Repositorie/LORA-LoraWan-STM32-Esp8266/SW/EndDevice_STM32F103_SX1278/EndDevice_STM32f103/Release/EndDevice_STM32f103.elf:

-include ../makefile.targets
