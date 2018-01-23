Mobile_PrintOpponentBattleMessage: ; 4ea0a
	ld a, c
	push af
	call SpeechTextBox
	call MobileTextBorder
	pop af
	dec a
	ld bc, $c
	ld hl, w5_MobileOpponentBattleMessages
	call AddNTimes
	ld de, wMobileOpponentBattleMessage
	ld bc, $c
	ld a, BANK(w5_MobileOpponentBattleMessages)
	call FarCopyWRAM

	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a

	ld bc, wMobileOpponentBattleMessage
	decoord 1, 14
	farcall PrintEZChatBattleMessage

	pop af
	ld [rSVBK], a

	ld c, 180
	call DelayFrames
	ret
