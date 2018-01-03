DefaultOptions: ; 14f7c
; Options: med text speed
	db TEXT_DELAY_MED
; wSaveFileExists: no
	db $00
; TextBoxFrame: frame 1
	db FRAME_1
; TextBoxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; GBPrinter: normal brightness
	db GBPRINTER_NORMAL
; Options2: menu account on
	db 1 << MENU_ACCOUNT
	
	db $00
	db $00
; 14f84
