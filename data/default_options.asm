DefaultOptions:
; wOptions: med text speed
	db TEXT_DELAY_MED
; wSaveFileExists: no
	db FALSE
; wTextBoxFrame: frame 1
	db FRAME_1
; wTextBoxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wGBPrinter: normal brightness
	db GBPRINTER_NORMAL
; wOptions2: menu account on
	db 1 << MENU_ACCOUNT

	db $00
	db $00
