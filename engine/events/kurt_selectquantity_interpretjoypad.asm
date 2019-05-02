INCLUDE "constants.inc"


SECTION "engine/events/kurt_selectquantity_interpretjoypad.asm", ROMX, BANK[BANK_BUY_SELL_TOSS]

Kurt_SelectQuantity_InterpretJoypad::
	call BuySellToss_InterpretJoypad
	ld b, a
	ret
