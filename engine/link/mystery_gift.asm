DoMysteryGift:
	call ClearTileMap
	call ClearSprites
	call WaitBGMap
	call InitMysteryGiftLayout
	hlcoord 3, 8
	ld de, .String_PressAToLink_BToCancel
	call PlaceString
	call WaitBGMap
	farcall PrepMysteryGiftDataToSend
	call MysteryGift_ClearTrainerData
	ld a, $2
	ld [wca01], a
	ld a, $14
	ld [wca02], a
	ldh a, [rIE]
	push af

	call Function104a95

	ld d, a
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	push de
	call ClearTileMap
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	pop de
	hlcoord 2, 8
	ld a, d
	ld de, .Text_LinkCanceled ; Link has been canceled
	cp $10
	jp z, .LinkCanceled
	cp $6c
	jp nz, .CommunicationError
	ld a, [wc900]
	cp 3
	jr z, .skip_checks
	call .CheckAlreadyGotFiveGiftsToday
	ld hl, .Text_MaxFiveGifts ; Only 5 gifts a day
	jp nc, .PrintTextAndExit
	call .CheckAlreadyGotAGiftFromThatPerson
	ld hl, .Text_MaxOneGiftPerPerson ; Only one gift a day per person
	jp c, .PrintTextAndExit
.skip_checks
	ld a, [wMysteryGiftPlayerBackupItem]
	and a
	jp nz, .GiftWaiting
	ld a, [wMysteryGiftPartnerBackupItem]
	and a
	jp nz, .FriendNotReady
	ld a, [wc900]
	cp 3
	jr z, .skip_append_save
	call .AddMysteryGiftPartnerID
	ld a, [wc900]
	cp 4
	jr z, .skip_append_save
	call .SaveMysteryGiftTrainerName
	farcall RestoreMobileEventIndex
	farcall StubbedTrainerRankings_MysteryGift
	farcall BackupMobileEventIndex
.skip_append_save
	ld a, [wMysteryGiftPartnerSentDeco]
	and a
	jr z, .item
	ld a, [wMysteryGiftPartnerWhichDeco]
	ld c, a
	farcall MysteryGiftGetDecoration
	push bc
	call MysteryGift_CheckAndSetDecorationAlreadyReceived
	pop bc
	jr nz, .item
	callfar GetDecorationName_c
	ld h, d
	ld l, e
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	ld hl, .Text_SentToHome ; sent decoration to home
	jr .PrintTextAndExit

.item
	call GetMysteryGiftBank
	ld a, [wMysteryGiftPartnerWhichItem]
	ld c, a
	farcall MysteryGiftGetItemHeldEffect
	ld a, c
	ld [sBackupMysteryGiftItem], a
	ld [wNamedObjectIndexBuffer], a
	call CloseSRAM
	call GetItemName
	ld hl, .Text_Sent ; sent item
	jr .PrintTextAndExit

.LinkCanceled:
	ld hl, .Text_LinkCanceled ; Link has been canceled
	jr .PrintTextAndExit

.CommunicationError:
	ld hl, .Text_CommunicationError ; Communication error
	call PrintText
	jp DoMysteryGift

.GiftWaiting:
	ld hl, .Text_ReceiveGiftAtCounter ; receive gift at counter
	jr .PrintTextAndExit

.FriendNotReady:
	ld hl, .Text_FriendNotReady ; friend not ready

.PrintTextAndExit:
	call PrintText
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ret

.String_PressAToLink_BToCancel:
	db   "Press A to"
	next "link IR-Device"
	next "Press B to"
	next "cancel it."
	db   "@"

.Text_LinkCanceled:
	text_far UnknownText_0x1c0436
	text_end

.Text_CommunicationError:
	text_far UnknownText_0x1c0454
	text_end

.Text_ReceiveGiftAtCounter:
	text_far UnknownText_0x1c046a
	text_end

.Text_FriendNotReady:
	text_far UnknownText_0x1c048e
	text_end

.Text_MaxFiveGifts:
	text_far UnknownText_0x1c04a7
	text_end

.Text_MaxOneGiftPerPerson:
	text_far UnknownText_0x1c04c6
	text_end

.Text_Sent:
	text_far UnknownText_0x1c04e9
	text_end

.Text_SentToHome:
	text_far UnknownText_0x1c04fa
	text_end

.CheckAlreadyGotFiveGiftsToday:
	call GetMysteryGiftBank
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	cp $5
	jp CloseSRAM

.CheckAlreadyGotAGiftFromThatPerson:
	call GetMysteryGiftBank
	ld a, [wMysteryGiftPartnerID]
	ld b, a
	ld a, [wMysteryGiftPartnerID + 1]
	ld c, a
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	ld d, a
	ld hl, sDailyMysteryGiftPartnerIDs
.loop
	ld a, d
	and a
	jr z, .No
	ld a, [hli]
	cp b
	jr nz, .skip
	ld a, [hl]
	cp c
	jr z, .Yes
.skip
	inc hl
	dec d
	jr .loop
.Yes:
	scf
.No:
	jp CloseSRAM

.AddMysteryGiftPartnerID:
	call GetMysteryGiftBank
	ld hl, sNumDailyMysteryGiftPartnerIDs
	ld a, [hl]
	inc [hl]
	ld hl, sDailyMysteryGiftPartnerIDs ; inc hl
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [wMysteryGiftPartnerID]
	ld [hli], a
	ld a, [wMysteryGiftPartnerID + 1]
	ld [hl], a
	jp CloseSRAM

.SaveMysteryGiftTrainerName:
	call GetMysteryGiftBank
	ld a, $1
	ld [sMysteryGiftTrainerHouseFlag], a
	ld hl, wMysteryGiftPartnerName
	ld de, sMysteryGiftPartnerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, $1
	ld [de], a
	inc de
	ld hl, wMysteryGiftTrainerData
	ld bc, (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 2
	call CopyBytes
	jp CloseSRAM

Function104a95:
	di
	farcall ClearChannels
	call Function104d5e

.loop2
	call Function104d96
	call Function104ddd
	ldh a, [hMGStatusFlags]
	cp $10
	jp z, Function104bd0
	cp $6c
	jr nz, .loop2

	ldh a, [hPrintNumBuffer + 8]
	cp $2
	jr z, Function104b22
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function104d56
	jr nz, .ly_loop
	call Function104b49
	jp nz, Function104bd0
	jr Function104b0a
	; Delay frame
.ly_loop
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .ly_loop
	ld c, LOW(rRP)
	ld a, $c0
	ldh [c], a
	ld b, 240 ; This might have been intended as a 4-second timeout buffer.
	          ; However, it is reset with each frame.
.loop3
	push bc
	call MysteryGift_ReadJoypad

	ld b, $2
	ld c, LOW(rRP)
	; Delay frame
.ly_loop2
	ldh a, [c]
	and b
	ld b, a
	ldh a, [rLY]
	cp LY_VBLANK
	jr nc, .ly_loop2
.ly_loop3
	ldh a, [c]
	and b
	ld b, a
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .ly_loop3

	ld a, b
	pop bc
	dec b
	jr z, .loop2 ; we never jump here
	or a
	jr nz, .loop2
	; Check if we've pressed the B button
	ldh a, [hMGJoypadReleased]
	bit B_BUTTON_F, a
	jr z, .loop3
	ld a, $10
	ldh [hMGStatusFlags], a
	jp Function104bd0

Function104b04:
	call Function104b40
	jp nz, Function104bd0
Function104b0a:
	call Function104d38
	jp nz, Function104bd0
	call Function104b88
	jp nz, Function104bd0
	call Function104d43
	jp nz, Function104bd0
	call Function105033
	jp Function104bd0

Function104b22:
	call Function104b88
	jp nz, Function104bd0
	call Function104d43
	jp nz, Function104bd0
	call Function104b40
	jp nz, Function104bd0
	call Function104d38
	jp nz, Function104bd0
	call Function10502e
	jp Function104bd0

Function104b40:
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function104d56
	ret nz

Function104b49:
	call Function105033
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	ldh a, [hPrintNumBuffer]
	cp $96
	jp nz, Function104d32
	ld a, $90
	ldh [hPrintNumBuffer], a
	call Function104d38
	ret nz
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function104d4e
	ret nz
	call Function10502e
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	call Function104d43
	ret nz
	ld hl, wMysteryGiftTrainerData
	ld a, [wca02]
	ld b, a
	call Function104d56
	ret nz
	call Function105033
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function104b88:
	ld a, $96
	ldh [hPrintNumBuffer], a
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function104d4e
	ret nz
	call Function10502e
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	call Function104d43
	ret nz
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function104d56
	ret nz
	call Function105033
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	ldh a, [hPrintNumBuffer]
	cp $90
	jp nz, Function104d32
	call Function104d38
	ret nz
	ld hl, wLinkData
	ld a, [wca02]
	ld b, a
	call Function104d4e
	ret nz
	call Function10502e
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function104bd0:
	nop
	ldh a, [hMGStatusFlags]
	cp $10
	jr z, .quit
	cp $6c
	jr nz, .quit
	ld hl, wca01
	dec [hl]
	jr z, .quit
	ld hl, wMysteryGiftTrainerData
	ld de, wMysteryGiftPartnerData
	ld bc, wMysteryGiftPartnerDataEnd - wMysteryGiftPartnerData
	call CopyBytes
	ld a, [wMysteryGiftTrainerData]
	cp $3
	jr nc, .quit
	farcall StagePartyDataForMysteryGift
	call MysteryGift_ClearTrainerData
	ld a, $26
	ld [wca02], a
	ldh a, [hPrintNumBuffer + 8]
	cp $2
	jr z, .asm_104c10
	call Function104d43
	jr nz, Function104bd0
	jp Function104b04

.asm_104c10
	call Function104d38
	jr nz, Function104bd0
	jp Function104b22

.quit
	ldh a, [hMGStatusFlags]
	push af
	call Function104da0
	xor a
	ldh [rIF], a
	ldh a, [rIE]
	or 1 << VBLANK
	ldh [rIE], a
	ei
	call DelayFrame
	pop af
	ret

Function104c2d:
	di
	farcall ClearChannels
	call Function104d5e
.asm_104c37
	call Function104d96
	call Function104ddd
	ldh a, [hMGStatusFlags]
	cp $10
	jp z, Function104d1c
	cp $6c
	jr nz, .asm_104c37
	ldh a, [hPrintNumBuffer + 8]
	cp $2
	jr z, .asm_104c6c
	call Function104c8a
	jp nz, Function104d1c
	call Function104d38
	jp nz, Function104d1c
	call Function104cd2
	jp nz, Function104d1c
	call Function104d43
	jp nz, Function104d1c
	call Function105033
	jp Function104d1c
.asm_104c6c
	call Function104cd2
	jp nz, Function104d1c
	call Function104d43
	jp nz, Function104d1c
	call Function104c8a
	jp nz, Function104d1c
	call Function104d38
	jp nz, Function104d1c
	call Function10502e
	jp Function104d1c

Function104c8a:
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function104d56
	ret nz
	call Function105033
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	ldh a, [hPrintNumBuffer]
	cp $3c
	jp nz, Function104d32
	swap a
	ldh [hPrintNumBuffer], a
	call Function104d38
	ret nz
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function104d4e
	ret nz
	call Function10502e
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	call Function104d43
	ret nz
	ld hl, wMysteryGiftTrainerData
	ld a, [wca02]
	ld b, a
	call Function104d56
	ret nz
	call Function105033
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function104cd2:
	ld a, $3c
	ldh [hPrintNumBuffer], a
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function104d4e
	ret nz
	call Function10502e
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	call Function104d43
	ret nz
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function104d56
	ret nz
	call Function105033
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	ldh a, [hPrintNumBuffer]
	swap a
	cp $3c
	jp nz, Function104d32
	call Function104d38
	ret nz
	ld hl, wLinkData
	ld a, [wca02]
	ld b, a
	call Function104d4e
	ret nz
	call Function10502e
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function104d1c:
	nop
	ldh a, [hMGStatusFlags]
	push af
	call Function104da0
	xor a
	ldh [rIF], a
	ldh a, [rIE]
	or 1 << VBLANK
	ldh [rIE], a
	ei
	call DelayFrame
	pop af
	ret

Function104d32:
	ld a, $80
	ldh [hMGStatusFlags], a
	and a
	ret

Function104d38:
	call Function104d96
	call Function104e46
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function104d43:
	call Function104d96
	call Function104dfe
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function104d4e:
	call Function104e93
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function104d56:
	call Function104f57
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function104d5e:
	call Function104d74
	ld a, 1 << TIMER
	ldh [rIE], a
	xor a
	ldh [rIF], a
	call Function104d96
	xor a
	ld b, a
.asm_104d6d
	inc a
	jr nz, .asm_104d6d
	inc b
	jr nz, .asm_104d6d
	ret

Function104d74:
	xor a
	ldh [rTAC], a
	ld a, $fe
	ldh [rTMA], a
	ldh [rTIMA], a
	ld a, $2
	ldh [rTAC], a
	or $4
	ldh [rTAC], a
	ret

Function104d86:
	xor a
	ldh [rTAC], a
	ldh [rTMA], a
	ldh [rTIMA], a
	ld a, $2
	ldh [rTAC], a
	or $4
	ldh [rTAC], a
	ret

Function104d96:
	ld a, $c0
	call Function104e8c
	ld a, $1
	ldh [hPrintNumBuffer + 8], a
	ret

Function104da0:
	xor a
	call Function104e8c
	ld a, $2
	ldh [rTAC], a
	ret

Function104da9:
	inc d
	ret z
	xor a
	ldh [rIF], a
	halt
	ldh a, [c]
	bit 1, a
	jr z, Function104da9
	or a
	ret

Function104db7:
	inc d
	ret z
	xor a
	ldh [rIF], a
	halt
	ldh a, [c]
	bit 1, a
	jr nz, Function104db7
	or a
	ret

Function104dc5:
	ld a, $c1
	ldh [c], a
.wait
	dec d
	ret z
	xor a
	ldh [rIF], a
	halt
	jr .wait

Function104dd1:
	ld a, $c0
	ldh [c], a
.wait
	dec d
	ret z
	xor a
	ldh [rIF], a
	halt
	jr .wait

Function104ddd:
	ld d, $0
	ld e, d
	ld a, $1
	ldh [hPrintNumBuffer + 8], a
.loop
	call MysteryGift_ReadJoypad
	ld b, $2
	ld c, LOW(rRP)
	ldh a, [hMGJoypadReleased]
	bit B_BUTTON_F, a
	jr z, .next
	ld a, $10
	ldh [hMGStatusFlags], a
	ret

.next
	bit 0, a
	jr nz, Function104e3a
	ldh a, [c]
	and b
	jr nz, .loop

Function104dfe:
	ld c, LOW(rRP)
	ld d, $0
	ld e, d
	call Function104db7
	jp z, Function104f42
	ld d, e
	call Function104da9
	jp z, Function104f42
	call Function104db7
	jp z, Function104f42
	call Function104da9
	jp z, Function104f42
	ld a, $6c
	ldh [hMGStatusFlags], a
	ld d, $3d
	call Function104dd1
	ld d, $5
	call Function104dc5
	ld d, $15
	call Function104dd1
	ld d, $5
	call Function104dc5
	ld d, $5
	call Function104dd1
	ret

Function104e3a:
	; Wait a random amount of time
	call Random
	ld e, a
	and $f
	ld d, a
.loop
	dec de
	ld a, d
	or e
	jr nz, .loop
Function104e46:
	ld a, $2
	ldh [hPrintNumBuffer + 8], a
	ld c, LOW(rRP)
	ld d, $0
	ld e, d
	ld d, $3d
	call Function104dd1
	ld d, $5
	call Function104dc5
	ld d, $15
	call Function104dd1
	ld d, $5
	call Function104dc5
	ld d, $5
	call Function104dd1
	ld d, e
	call Function104db7
	jp z, Function104f42
	ld d, e
	call Function104da9
	jp z, Function104f42
	call Function104db7
	jp z, Function104f42
	call Function104da9
	jp z, Function104f42
	ld d, $3d
	call Function104dd1
	ld a, $6c
	ldh [hMGStatusFlags], a
	ret

Function104e8c:
	ldh [rRP], a
	ld a, $ff
	ldh [hMGStatusFlags], a
	ret

Function104e93:
	xor a
	ldh [hPrintNumBuffer + 4], a
	ldh [hPrintNumBuffer + 5], a
	push hl
	push bc
	ld c, LOW(rRP)
	ld d, $3d
	call Function104dd1
	ld hl, hPrintNumBuffer + 1
	ld a, $5a
	ld [hli], a
	ld [hl], b
	dec hl
	ld b, $2
	call Function104ed6
	pop bc
	pop hl
	call Function104ed6
	ldh a, [hPrintNumBuffer + 4]
	ldh [hPrintNumBuffer + 1], a
	ldh a, [hPrintNumBuffer + 5]
	ldh [hPrintNumBuffer + 2], a
	push hl
	ld hl, hPrintNumBuffer + 1
	ld b, $2
	call Function104ed6
	ld hl, hMGStatusFlags
	ld b, $1
	call Function104faf
	ldh a, [hPrintNumBuffer + 1]
	ldh [hPrintNumBuffer + 4], a
	ldh a, [hPrintNumBuffer + 2]
	ldh [hPrintNumBuffer + 5], a
	pop hl
	ret

Function104ed6:
	ld c, LOW(rRP)
	ld d, $5
	call Function104dd1
	ld d, $5
	call Function104dc5
	ld d, $15
	call Function104dd1
	ld a, b
	cpl
	ld b, a
	ld a, $f4
	ldh [rTMA], a
.asm_104eee
	inc b
	jr z, .asm_104f2e
	ld a, $8
	ldh [hPrintNumBuffer + 3], a
	ld a, [hli]
	ld e, a
	ldh a, [hPrintNumBuffer + 4]
	add e
	ldh [hPrintNumBuffer + 4], a
	ldh a, [hPrintNumBuffer + 5]
	adc 0
	ldh [hPrintNumBuffer + 5], a
.asm_104f02
	xor a
	ldh [rIF], a
	halt
	ld a, $c1
	ldh [rRP], a
	ld d, $1
	ld a, e
	rlca
	ld e, a
	jr nc, .asm_104f13
	inc d
.asm_104f13
	ldh a, [rTIMA]
	cp $f8
	jr c, .asm_104f13
	ld a, $c0
	ldh [rRP], a
	dec d
	jr z, .asm_104f25
	xor a
	ldh [rIF], a
	halt
.asm_104f25
	ldh a, [hPrintNumBuffer + 3]
	dec a
	jr z, .asm_104eee
	ldh [hPrintNumBuffer + 3], a
	jr .asm_104f02
.asm_104f2e
	ld a, $fe
	ldh [rTMA], a
	xor a
	ldh [rIF], a
	halt
	ld d, $5
	call Function104dc5
	ld d, $11
	call Function104dd1
	ret

Function104f42:
	ldh a, [hMGStatusFlags]
	or $2
	ldh [hMGStatusFlags], a
	ret

Function104f49:
	ldh a, [hMGStatusFlags]
	or $1
	ldh [hMGStatusFlags], a
	ret

Function104f50:
	ldh a, [hMGStatusFlags]
	or $80
	ldh [hMGStatusFlags], a
	ret

Function104f57:
	xor a
	ldh [hPrintNumBuffer + 4], a
	ldh [hPrintNumBuffer + 5], a
	push bc
	push hl
	ld hl, hPrintNumBuffer + 1
	ld b, $2
	call Function104faf
	ldh a, [hPrintNumBuffer + 2]
	ldh [hPrintNumBuffer + 7], a
	ld b, a
	pop hl
	pop af
	cp b
	jp c, Function104f50
	ldh a, [hPrintNumBuffer + 1]
	cp $5a
	jp nz, Function104f50
	call Function104faf
	ldh a, [hPrintNumBuffer + 4]
	ld d, a
	ldh a, [hPrintNumBuffer + 5]
	ld e, a
	push hl
	push de
	ld hl, hPrintNumBuffer + 1
	ld b, $2
	call Function104faf
	pop de
	ld hl, hPrintNumBuffer + 1
	ld a, [hli]
	xor d
	ld b, a
	ld a, [hl]
	xor e
	or b
	call nz, Function104f49
	push de
	ld d, $3d
	call Function104dd1
	ld hl, hMGStatusFlags
	ld b, $1
	call Function104ed6
	pop de
	pop hl
	ld a, d
	ldh [hPrintNumBuffer + 4], a
	ld a, e
	ldh [hPrintNumBuffer + 5], a
	ret

Function104faf:
	ld c, LOW(rRP)
	ld d, $0
	call Function104db7
	jp z, Function104f42
	ld d, $0
	call Function104da9
	jp z, Function104f42
	ld d, $0
	call Function104db7
	jp z, Function104f42
	ld a, b
	cpl
	ld b, a
	xor a
	ldh [hMGJoypadPressed + 2], a
	call Function104d86
.asm_104fd2
	inc b
	jr z, .asm_10501a
	ld a, $8
	ldh [hPrintNumBuffer + 3], a
.asm_104fd9
	ld d, $0
.asm_104fdb
	inc d
	jr z, .asm_104fe5
	ldh a, [c]
	bit 1, a
	jr z, .asm_104fdb
	ld d, $0
.asm_104fe5
	inc d
	jr z, .asm_104fed
	ldh a, [c]
	bit 1, a
	jr nz, .asm_104fe5
.asm_104fed
	ldh a, [hMGJoypadPressed + 2]
	ld d, a
	ldh a, [rTIMA]
	ldh [hMGJoypadPressed + 2], a
	sub d
	cp $12
	jr c, .asm_104ffd
	set 0, e
	jr .asm_104fff
.asm_104ffd
	res 0, e
.asm_104fff
	ldh a, [hPrintNumBuffer + 3]
	dec a
	ldh [hPrintNumBuffer + 3], a
	jr z, .asm_10500b
	ld a, e
	rlca
	ld e, a
	jr .asm_104fd9
.asm_10500b
	ld a, e
	ld [hli], a
	ldh a, [hPrintNumBuffer + 4]
	add e
	ldh [hPrintNumBuffer + 4], a
	ldh a, [hPrintNumBuffer + 5]
	adc 0
	ldh [hPrintNumBuffer + 5], a
	jr .asm_104fd2
.asm_10501a
	call Function104d74
	xor a
	ldh [rIF], a
	ld d, $0
	call Function104da9
	jp z, Function104f42
	ld d, $10
	call Function104dd1
	ret

Function10502e:
	ld b, $0
	jp Function104e93

Function105033:
	ld b, $0
	jp Function104f57

MysteryGift_ReadJoypad:
; We can only get four inputs at a time.
; We take d-pad first for no particular reason.
	ld a, R_DPAD
	ldh [rJOYP], a
; Read twice to give the request time to take.
	ldh a, [rJOYP]
	ldh a, [rJOYP]

; The Joypad register output is in the lo nybble (inversed).
; We make the hi nybble of our new container d-pad input.
	cpl
	and $f
	swap a

; We'll keep this in b for now.
	ld b, a

; Buttons make 8 total inputs (A, B, Select, Start).
; We can fit this into one byte.
	ld a, R_BUTTONS
	ldh [rJOYP], a
; Wait for input to stabilize.
rept 6
	ldh a, [rJOYP]
endr
; Buttons take the lo nybble.
	cpl
	and $f
	or b
	ld c, a
; To get the delta we xor the last frame's input with the new one.
	ldh a, [hMGJoypadPressed]
	xor c
; Released this frame:
	and c
	ldh [hMGJoypadReleased], a
; Pressed this frame:
	ld a, c
	ldh [hMGJoypadPressed], a
	ld a, $30
; Reset the joypad register since we're done with it.
	ldh [rJOYP], a
	ret

MysteryGift_CheckAndSetDecorationAlreadyReceived:
	call GetMysteryGiftBank
	ld d, $0
	ld b, CHECK_FLAG
	ld hl, sMysteryGiftDecorationsReceived
	predef_id SmallFarFlagAction
	push hl
	push bc
	call Predef
	call CloseSRAM
	ld a, c
	and a
	pop bc
	pop hl
	ret nz
	call GetMysteryGiftBank
	ld b, SET_FLAG
	predef SmallFarFlagAction
	call CloseSRAM
	xor a
	ret

MysteryGift_CopyReceivedDecosToPC:
	call GetMysteryGiftBank
	ld c, $0
.loop
	push bc
	ld d, $0
	ld b, CHECK_FLAG
	ld hl, sMysteryGiftDecorationsReceived
	predef SmallFarFlagAction
	ld a, c
	and a
	pop bc
	jr z, .skip
	push bc
	callfar SetSpecificDecorationFlag
	pop bc
.skip
	inc c
	ld a, c
	cp TrophyIDs - DecorationIDs
	jr c, .loop
	jp CloseSRAM

UnlockMysteryGift:
	call GetMysteryGiftBank
	ld hl, sMysteryGiftUnlocked
	ld a, [hl]
	inc a
	jr nz, .ok
	ld [hld], a
	ld [hl], a
.ok
	jp CloseSRAM

Function1050c8:
	call GetMysteryGiftBank
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	cp $ff
	jr z, .okay
	xor a
	ld [sNumDailyMysteryGiftPartnerIDs], a
.okay
	jp CloseSRAM

BackupMysteryGift:
	call GetMysteryGiftBank
	ld hl, sMysteryGiftItem
	ld de, sBackupMysteryGiftItem
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp CloseSRAM

RestoreMysteryGift:
	call GetMysteryGiftBank
	ld hl, sBackupMysteryGiftItem
	ld de, sMysteryGiftItem
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp CloseSRAM

MysteryGift_ClearTrainerData:
	ld hl, wMysteryGiftTrainerData
	xor a
	ld b, wMysteryGiftTrainerDataEnd - wMysteryGiftTrainerData
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

GetMysteryGiftBank:
	ld a, BANK(sBackupMysteryGiftItem)
	jp GetSRAMBank

StagePartyDataForMysteryGift:
; You will be sending this data to your mystery gift partner.
; Structure is the same as a trainer with species and moves
; defined.
	ld a, BANK(sPokemonData)
	call GetSRAMBank
	ld de, wMysteryGiftStaging
	ld bc, sPokemonData + wPartyMons - wPokemonData
	ld hl, sPokemonData + wPartySpecies - wPokemonData
.loop
	ld a, [hli]
	cp -1
	jr z, .party_end
	cp EGG
	jr z, .next
	push hl
	; copy level
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de
	; copy species
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de
	; copy moves
	ld hl, MON_MOVES
	add hl, bc
	push bc
	ld bc, NUM_MOVES
	call CopyBytes
	pop bc
	pop hl
.next
	push hl
	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	jr .loop
.party_end
	ld a, -1
	ld [de], a
	ld a, $26
	ld [wca00], a
	jp CloseSRAM

InitMysteryGiftLayout:
	call ClearBGPalettes
	call DisableLCD
	ld hl, MysteryGiftGFX
	ld de, vTiles2 tile $00
	ld a, BANK(MysteryGiftGFX)
	ld bc, MysteryGiftGFX.End - MysteryGiftGFX
	call FarCopyBytes
	hlcoord 0, 0
	ld a, $42
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call ByteFill
	hlcoord 3, 7
	lb bc, 9, 15
	call ClearBox
	hlcoord 0, 0
	ld a, $0
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 0, 1
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 7, 1
	ld a, $12
	call .Load5GFX
	hlcoord 2, 2
	ld a, $17
	call .Load16GFX
	hlcoord 2, 3
	ld a, $27
	call .Load16GFX
	hlcoord 9, 4
	ld a, $37
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 1, 2
	ld [hl], $4
	hlcoord 1, 3
	ld a, $5
	call .Load14Column
	ld a, $9
	hlcoord 18, 5
	call .Load11Column
	hlcoord 2, 5
	ld a, $b
	call .Load16Row
	hlcoord 2, 16
	ld a, $7
	call .Load16Row
	hlcoord 2, 5
	ld a, $d
	call .Load5GFX
	hlcoord 7, 5
	ld [hl], $c
	hlcoord 18, 5
	ld [hl], $a
	hlcoord 18, 16
	ld [hl], $8
	hlcoord 1, 16
	ld [hl], $6
	hlcoord 2, 6
	ld a, $3a
	call .Load16Row
	hlcoord 2, 15
	ld a, $40
	call .Load16Row
	hlcoord 2, 6
	ld a, $3c
	call .Load9Column
	hlcoord 17, 6
	ld a, $3e
	call .Load9Column
	hlcoord 2, 6
	ld [hl], $39
	hlcoord 17, 6
	ld [hl], $3b
	hlcoord 2, 15
	ld [hl], $3f
	hlcoord 17, 15
	ld [hl], $41
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_MYSTERY_GIFT
	call GetSGBLayout
	call SetPalettes
	ret

.Load5GFX:
	ld b,  5
	jr .gfx_loop

.Unreferenced_Load6GFX:
	ld b,  6
	jr .gfx_loop

.Load16GFX:
	ld b, 16

.gfx_loop
	ld [hli], a
	inc a
	dec b
	jr nz, .gfx_loop
	ret

.Load9Column:
	ld b,  9
	jr .col_loop

.Load11Column:
	ld b, 11
	jr .col_loop

.Load14Column:
	ld b, 14

.col_loop
	ld [hl], a
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .col_loop
	ret

.Load16Row:
	ld b, 16
.row_loop
	ld [hli], a
	dec b
	jr nz, .row_loop
	ret

MysteryGiftGFX:
INCBIN "gfx/mystery_gift/mystery_gift.2bpp"
.End

Function105688:
	call ClearTileMap
	call ClearSprites
	call WaitBGMap
	call Function1057d7
	hlcoord 3, 8
	ld de, String_PressAToLink_BToCancel_JP
	call PlaceString
	call WaitBGMap
	call Function10578c
	call MysteryGift_ClearTrainerData
	ld a, $24
	ld [wca02], a
	ldh a, [rIE]
	push af
	call Function104c2d
	ld d, a
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	ld a, d
	cp $10
	jp z, Function105712
	cp $6c
	jp nz, Function10571a
	call Function1056eb
	ld c, 60
	call DelayFrames
	call Function105777
	ld hl, Text_ReceivedCard
	call PrintText
	ld de, wMysteryGiftTrainerData
	farcall Function8ac70
	ld a, c
	ld [wDeciramBuffer], a
	ld hl, Text_CardNotRegistered
	jr c, PrintTextAndExit_JP
	ld hl, Text_ListedCardAsNumber
	jr PrintTextAndExit_JP

Function1056eb:
	ld c, 16
.loop
	ld hl, wVirtualOAMSprite00YCoord
	ld b, 8
.dec_y_loop
	dec [hl]
rept SPRITEOAMSTRUCT_LENGTH
	inc hl
endr
	dec b
	jr nz, .dec_y_loop
	ld hl, wVirtualOAMSprite08YCoord
	ld b, 8
.inc_y_loop
	inc [hl]
rept SPRITEOAMSTRUCT_LENGTH
	inc hl
endr
	dec b
	jr nz, .inc_y_loop
	dec c
	ret z
	push bc
	ld c, 4
	call DelayFrames
	pop bc
	jr .loop

Function105712:
	call Function105777
	ld hl, Text_MGLinkCanceled
	jr PrintTextAndExit_JP

Function10571a:
	call Function105777
	ld hl, Text_MGCommError
	call PrintText
	jp Function105688

PrintTextAndExit_JP:
	call PrintText
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ret

String_PressAToLink_BToCancel_JP:
	db   "エーボタン<WO>おすと"
	next "つうしん<PKMN>おこなわれるよ！"
	next "ビーボタン<WO>おすと"
	next "つうしん<WO>ちゅうし　します"
	db   "@"

Text_ReceivedCard:
	text_far UnknownText_0x1c051a
	text_end

Text_ListedCardAsNumber:
	text_far UnknownText_0x1c0531
	text_end

Text_CardNotRegistered:
	text_far UnknownText_0x1c0555
	text_end

Text_MGLinkCanceled:
	text_far UnknownText_0x1c0573
	text_end

Text_MGCommError:
	text_far UnknownText_0x1c0591
	text_end

Function105777:
	call ClearSprites
	call ClearTileMap
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ret

Function10578c:
	ld de, wLinkData
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld hl, sPlayerData + wPlayerName - wPlayerData
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, sPlayerData + wPlayerID - wPlayerData
	ld bc, 2
	call CopyBytes
	ld hl, sPlayerData + wSecretID - wPlayerData
	ld bc, 2
	call CopyBytes
	call CloseSRAM
	ld a, BANK(sCrystalData)
	call GetSRAMBank
	ld a, [sCrystalData + 0]
	ld [de], a
	inc de
	ld a, 4 ; MBC30 bank used by JP Crystal; inaccessible by MBC3
	call GetSRAMBank
	ld hl, $a603 ; address of MBC30 bank
	ld bc, $8
	call CopyBytes
	ld hl, $a007 ; address of MBC30 bank
	ld bc, $c
	call CopyBytes
	call CloseSRAM
	ret

Function1057d7:
	call ClearBGPalettes
	call DisableLCD
	ld hl, MysteryGiftJP_GFX
	ld de, vTiles2 tile $00
	ld a, BANK(MysteryGiftJP_GFX)
	lb bc, 4, 0
	call FarCopyBytes
	ld hl, MysteryGiftJP_GFX + $40 tiles
	ld de, vTiles0 tile $00
	ld a, BANK(MysteryGiftJP_GFX)
	ld bc, $80
	call FarCopyBytes
	hlcoord 0, 0
	ld a, $3f
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call ByteFill
	hlcoord 3, 7
	lb bc, 9, 15
	call ClearBox
	hlcoord 0, 0
	ld a, $0
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 0, 1
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 4, 2
	ld a, $13
	call .Load11Row
	hlcoord 4, 3
	ld a, $1e
	call .Load12Row
	hlcoord 4, 4
	ld a, $2a
	call .Load12Row
	hlcoord 1, 2
	ld [hl], $4
	hlcoord 1, 3
	ld a, $5
	call .Load14Column
	ld a, $9
	hlcoord 18, 5
	call .Load11Column
	hlcoord 2, 5
	ld a, $b
	call .Load16Row
	hlcoord 2, 16
	ld a, $7
	call .Load16Row
	hlcoord 2, 5
	ld a, $d
	call .Load6Row
	hlcoord 8, 5
	ld [hl], $c
	hlcoord 18, 5
	ld [hl], $a
	hlcoord 18, 16
	ld [hl], $8
	hlcoord 1, 16
	ld [hl], $6
	hlcoord 2, 6
	ld a, $37
	call .Load16Row
	hlcoord 2, 15
	ld a, $3d
	call .Load16Row
	hlcoord 2, 6
	ld a, $39
	call .Load9Column
	hlcoord 17, 6
	ld a, $3b
	call .Load9Column
	hlcoord 2, 6
	ld [hl], $36
	hlcoord 17, 6
	ld [hl], $38
	hlcoord 2, 15
	ld [hl], $3c
	hlcoord 17, 15
	ld [hl], $3e
	ld de, wVirtualOAMSprite00
	ld hl, .OAM_data
	ld bc, 16 * SPRITEOAMSTRUCT_LENGTH
	call CopyBytes
	call EnableLCD
	call WaitBGMap
	ld b, $2
	farcall GetMysteryGift_MobileAdapterLayout
	jp SetPalettes

.Load6Row:
	ld b,  6
	jr .row_loop

.Load11Row:
	ld b, 11
	jr .row_loop

.Load12Row:
	ld b, 12

.row_loop
	ld [hli], a
	inc a
	dec b
	jr nz, .row_loop
	ret

.Load9Column:
	ld b,  9
	jr .column_loop

.Load11Column:
	ld b, 11
	jr .column_loop

.Load14Column:
	ld b, 14

.column_loop
	ld [hl], a
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .column_loop
	ret

.Load16Row:
	ld b, 16
.row_loop_no_inc
	ld [hli], a
	dec b
	jr nz, .row_loop_no_inc
	ret

.OAM_data:
	dsprite  2, 1,  6, 4, $00, 0
	dsprite  2, 1,  7, 4, $01, 0
	dsprite  2, 1,  8, 4, $02, 0
	dsprite  2, 1,  9, 4, $03, 0
	dsprite  3, 1,  6, 4, $04, 0
	dsprite  3, 1,  7, 4, $05, 0
	dsprite  3, 1,  8, 4, $06, 0
	dsprite  3, 1,  9, 4, $07, 0
	dsprite  0, 1, 11, 4, $00, 0
	dsprite  0, 1, 12, 4, $01, 0
	dsprite  0, 1, 13, 4, $02, 0
	dsprite  0, 1, 14, 4, $03, 0
	dsprite  1, 1, 11, 4, $04, 0
	dsprite  1, 1, 12, 4, $05, 0
	dsprite  1, 1, 13, 4, $06, 0
	dsprite  1, 1, 14, 4, $07, 0

; japanese mystery gift gfx
MysteryGiftJP_GFX:
INCBIN "gfx/mystery_gift/mystery_gift_jp.2bpp"
