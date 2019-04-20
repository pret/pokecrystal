; FLOAT: Must be in the same bank as BuySellToss_InterpretJoypad
SECTION "Kurt_SelectQuantity_InterpretJoypad", ROMX, BANK[$09]

Kurt_SelectQuantity_InterpretJoypad:
	call BuySellToss_InterpretJoypad
	ld b, a
	ret
