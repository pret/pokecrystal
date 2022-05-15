Mobile_PrintOpponentBattleMessage:
	ld a, c
	push af
	call SpeechTextbox
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

	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a

	ld bc, wMobileOpponentBattleMessage
	decoord 1, 14
	farcall PrintEZChatBattleMessage

	pop af
	ldh [rSVBK], a

	ld c, 180
	call DelayFrames
	ret
