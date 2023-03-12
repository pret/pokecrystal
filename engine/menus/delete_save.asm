_DeleteSaveData:
	farcall BlankScreen
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_MAIN_MENU
	call PlayMusic
	ld hl, .ClearAllSaveDataText
	call PrintText
	call NoYesBox
	ret c
	farcall EmptyAllSRAMBanks
	ret

.ClearAllSaveDataText:
	text_far _ClearAllSaveDataText
	text_end
