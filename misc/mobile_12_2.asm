MobileCheckOwnMonAnywhere: ; 4a843
; Like CheckOwnMonAnywhere, but only check for species.
; OT/ID don't matter.

	ld a, [PartyCount]
	and a
	ret z

	ld d, a
	ld e, 0
	ld hl, PartyMon1Species
	ld bc, PartyMonOT
.asm_4a851
	call .CheckMatch
	ret c
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call .CopyName
	dec d
	jr nz, .asm_4a851
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld a, [sBoxCount]
	and a
	jr z, .asm_4a888
	ld d, a
	ld hl, sBoxMon1Species
	ld bc, sBoxMonOT
.asm_4a873
	call .CheckMatch
	jr nc, .asm_4a87c
	call CloseSRAM
	ret

.asm_4a87c
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call .CopyName
	dec d
	jr nz, .asm_4a873

.asm_4a888
	call CloseSRAM
	ld c, 0
.asm_4a88d
	ld a, [wCurBox]
	and $f
	cp c
	jr z, .asm_4a8d1
	ld hl, .BoxAddrs
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	and a
	jr z, .asm_4a8d1
	push bc
	push hl
	ld de, sBoxMons - sBoxCount
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push de
	ld de, sBoxMonOT - sBoxCount
	add hl, de
	ld b, h
	ld c, l
	pop hl
	ld d, a
.asm_4a8ba
	call .CheckMatch
	jr nc, .asm_4a8c4
	pop bc
	call CloseSRAM
	ret

.asm_4a8c4
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call .CopyName
	dec d
	jr nz, .asm_4a8ba
	pop bc

.asm_4a8d1
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .asm_4a88d
	call CloseSRAM
	and a
	ret
; 4a8dc

.CheckMatch: ; 4a8dc
	push bc
	push hl
	push de
	ld d, b
	ld e, c
	ld a, [ScriptVar]
	ld b, [hl]
	cp b
	jr nz, .no_match
	jr .match

.no_match
	pop de
	pop hl
	pop bc
	and a
	ret

.match
	pop de
	pop hl
	pop bc
	scf
	ret
; 4a8f4

.BoxAddrs: ; 4a8f4
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
; 4a91e

.CopyName: ; 4a91e
	push hl
	ld hl, NAME_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ret
; 4a927

FindItemInPCOrBag: ; 4a927
	ld a, [ScriptVar]
	ld [CurItem], a
	ld hl, PCItems
	call CheckItem
	jr c, .found

	ld a, [ScriptVar]
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	jr c, .found

	xor a
	ld [ScriptVar], a
	ret

.found
	ld a, 1
	ld [ScriptVar], a
	ret
; 4a94e

Function4a94e: ; 4a94e
	call FadeToMenu
	ld a, -1
	ld hl, wd002
	ld bc, 3
	call ByteFill
	xor a
	ld [wd018], a
	ld [wd019], a
	ld b, SCGB_PACKPALS
	call GetSGBLayout
	call SetPalettes
	call Function4aa22
	jr c, .asm_4a985
	jr z, .asm_4a9a1
	jr .asm_4a97b

.asm_4a974
	call Function4aa25
	jr c, .asm_4a985
	jr z, .asm_4a9a1

.asm_4a97b
	call Function4ac58
	ld hl, wd019
	res 1, [hl]
	jr .asm_4a974

.asm_4a985
	ld a, [wd018]
	and a
	jr nz, .asm_4a990
	call Function4aba8
	jr c, .asm_4a974

.asm_4a990
	call CloseSubmenu
	ld hl, wd002
	ld a, -1
	ld bc, 3
	call ByteFill
	scf
	jr .asm_4a9af

.asm_4a9a1
	call Function4a9c3
	jr c, .asm_4a9b0
	call Function4a9d7
	jr c, .asm_4a974
	call CloseSubmenu
	and a

.asm_4a9af
	ret

.asm_4a9b0
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, UnknownText_0x4a9be
	call PrintText
	jr .asm_4a974
; 4a9be

UnknownText_0x4a9be: ; 0x4a9be
	; Pick three #MON for battle.
	text_jump UnknownText_0x1c51d7
	db "@"
; 0x4a9c3

Function4a9c3: ; 4a9c3
	ld hl, wd002
	ld a, $ff
	cp [hl]
	jr z, .asm_4a9d5
	inc hl
	cp [hl]
	jr z, .asm_4a9d5
	inc hl
	cp [hl]
	jr z, .asm_4a9d5
	and a
	ret

.asm_4a9d5
	scf
	ret
; 4a9d7

Function4a9d7: ; 4a9d7
	ld a, [wd002]
	ld hl, PartyMonNicknames
	call GetNick
	ld h, d
	ld l, e
	ld de, EndFlypoint
	ld bc, 6
	call CopyBytes
	ld a, [wd003]
	ld hl, PartyMonNicknames
	call GetNick
	ld h, d
	ld l, e
	ld de, wd00c
	ld bc, 6
	call CopyBytes
	ld a, [wd004]
	ld hl, PartyMonNicknames
	call GetNick
	ld h, d
	ld l, e
	ld de, wd012
	ld bc, 6
	call CopyBytes
	ld hl, UnknownText_0x4aa1d
	call PrintText
	call YesNoBox
	ret
; 4aa1d

UnknownText_0x4aa1d: ; 0x4aa1d
	; , @  and @ . Use these three?
	text_jump UnknownText_0x1c51f4
	db "@"
; 0x4aa22

Function4aa22: ; 4aa22
	call ClearBGPalettes

Function4aa25: ; 4aa25
	callba LoadPartyMenuGFX
	callba InitPartyMenuWithCancel
	call Function4aad3

Function4aa34: ; 4aa34
	ld a, $9
	ld [PartyMenuActionText], a
	callba WritePartyMenuTilemap
	xor a
	ld [PartyMenuActionText], a
	callba PrintPartyMenuText
	call Function4aab6
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	call Function4ab1a
	jr z, .asm_4aa66
	push af
	call Function4aafb
	jr c, .asm_4aa67
	call Function4ab06
	jr c, .asm_4aa67
	pop af

.asm_4aa66
	ret

.asm_4aa67
	ld hl, wd019
	set 1, [hl]
	pop af
	ret
; 4aa6e

Function4aa6e: ; 4aa6e
	pop af
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	jr Function4aa34
; 4aa7a

Function4aa7a: ; 4aa7a
	ld hl, wd002
	ld d, $3
.loop
	ld e, PARTY_LENGTH
	ld a, [hli]
	push de
	push hl
	cp -1
	jr z, .done
	ld hl, wSpriteAnimationStructs
	inc a
	ld d, a
.inner_loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .same_as_d
	jr .next

	ld a, $3
	jr .proceed

.same_as_d
	ld a, $2

.proceed
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .inner_loop
	pop hl
	pop de
	dec d
	jr nz, .loop
	jr .finished

.done
	pop hl
	pop de

.finished
	ret
; 4aab6

Function4aab6: ; 4aab6
	ld hl, wd002
	ld d, $3
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	push de
	push hl
	hlcoord 0, 1
	ld bc, $28
	call AddNTimes
	ld [hl], $ec
	pop hl
	pop de
	dec d
	jr nz, .loop

.done
	ret
; 4aad3

Function4aad3: ; 4aad3
	ld hl, PartyCount
	ld a, [hli]
	and a
	ret z ; Nothing in your party

	ld c, a
	xor a
	ld [hObjectStructIndexBuffer], a
.loop
	push bc
	push hl
	ld e, 0
	callba LoadMenuMonIcon
	ld a, [hObjectStructIndexBuffer]
	inc a
	ld [hObjectStructIndexBuffer], a
	pop hl
	pop bc
	dec c
	jr nz, .loop

	call Function4aa7a
	callba PlaySpriteAnimations
	ret
; 4aafb

Function4aafb: ; 4aafb
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	and a
	ret

.egg
	scf
	ret
; 4ab06

Function4ab06: ; 4ab06
	ld a, [CurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, PartyMon1HP
	call AddNTimes
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr nz, .NotFainted
	scf

.NotFainted:
	ret
; 4ab1a

Function4ab1a: ; 4ab1a
.asm_4ab1a
	ld a, $fb
	ld [wMenuJoypadFilter], a
	ld a, $26
	ld [w2DMenuCursorOffsets], a
	ld a, $2
	ld [w2DMenuNumCols], a
	call Function4adf7
	call StaticMenuJoypad
	call Function4abc3
	jr c, .asm_4ab1a
	push af
	call Function4ab99
	call nc, PlaceHollowCursor
	pop af
	bit 1, a
	jr nz, .asm_4ab6d
	ld a, [PartyCount]
	inc a
	ld b, a
	ld a, [wMenuCursorY]
	ld [wPartyMenuCursor], a
	cp b
	jr z, .asm_4ab7e
	ld a, [wMenuCursorY]
	dec a
	ld [CurPartyMon], a
	ld c, a
	ld b, $0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	ld a, $1
	and a
	ret

.asm_4ab6d
	ld a, [wMenuCursorY]
	ld [wPartyMenuCursor], a
.asm_4ab73
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	scf
	ret

.asm_4ab7e
	ld a, $1
	ld [wd018], a
	ld a, [wMenuCursorX]
	cp $2
	jr z, .asm_4ab73
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	xor a
	ld [wd018], a
	and a
	ret
; 4ab99

Function4ab99: ; 4ab99
	bit 1, a
	jr z, .asm_4aba6
	ld a, [wd002]
	cp $ff
	jr z, .asm_4aba6
	scf
	ret

.asm_4aba6
	and a
	ret
; 4aba8

Function4aba8: ; 4aba8
	ld hl, wd004
	ld a, [hl]
	cp $ff
	jr nz, .asm_4abbe
	dec hl
	ld a, [hl]
	cp $ff
	jr nz, .asm_4abbe
	dec hl
	ld a, [hl]
	cp $ff
	jr nz, .asm_4abbe
	and a
	ret

.asm_4abbe
	ld a, $ff
	ld [hl], a
	scf
	ret
; 4abc3

Function4abc3: ; 4abc3
	bit 3, a
	jr z, .asm_4abd5
	ld a, [PartyCount]
	inc a
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	jr .asm_4ac29

.asm_4abd5
	bit 6, a
	jr z, .asm_4abeb
	ld a, [wMenuCursorY]
	ld [wMenuCursorY], a
	and a
	jr nz, .asm_4ac29
	ld a, [PartyCount]
	inc a
	ld [wMenuCursorY], a
	jr .asm_4ac29

.asm_4abeb
	bit 7, a
	jr z, .asm_4ac08
	ld a, [wMenuCursorY]
	ld [wMenuCursorY], a
	ld a, [PartyCount]
	inc a
	inc a
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr nz, .asm_4ac29
	ld a, $1
	ld [wMenuCursorY], a
	jr .asm_4ac29

.asm_4ac08
	bit 4, a
	jr nz, .asm_4ac10
	bit 5, a
	jr z, .asm_4ac56

.asm_4ac10
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [PartyCount]
	inc a
	cp b
	jr nz, .asm_4ac29
	ld a, [wMenuCursorX]
	cp $1
	jr z, .asm_4ac26
	ld a, $1
	jr .asm_4ac29

.asm_4ac26
	ld [wMenuCursorX], a

.asm_4ac29
	hlcoord 0, 1
	lb bc, 13, 1
	call ClearBox
	call Function4aab6
	ld a, [PartyCount]
	hlcoord 6, 1
.asm_4ac3b
	ld bc, $28
	add hl, bc
	dec a
	jr nz, .asm_4ac3b
	ld [hl], $7f
	ld a, [wMenuCursorY]
	ld b, a
	ld a, [PartyCount]
	inc a
	cp b
	jr z, .asm_4ac54
	ld a, $1
	ld [wMenuCursorX], a

.asm_4ac54
	scf
	ret

.asm_4ac56
	and a
	ret
; 4ac58

Function4ac58: ; 4ac58
	lb bc, 2, 18
	hlcoord 1, 15
	call ClearBox
	callba FreezeMonIcons
	ld hl, MenuDataHeader_0x4aca2
	call LoadMenuDataHeader
	ld hl, wd019
	bit 1, [hl]
	jr z, .asm_4ac89
	hlcoord 11, 13
	ld b, $3
	ld c, $7
	call TextBox
	hlcoord 13, 14
	ld de, String_4ada7
	call PlaceString
	jr .asm_4ac96

.asm_4ac89
	hlcoord 11, 9
	ld b, $7
	ld c, $7
	call TextBox
	call Function4ad68

.asm_4ac96
	ld a, $1
	ld [hBGMapMode], a
	call Function4acaa
	call ExitMenu
	and a
	ret
; 4aca2

MenuDataHeader_0x4aca2: ; 0x4aca2
	db $40 ; flags
	db 09, 11 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 1 ; default option
; 0x4acaa

Function4acaa: ; 4acaa
.asm_4acaa
	ld a, $a0
	ld [wMenuData2Flags], a
	ld a, [wd019]
	bit 1, a
	jr z, .asm_4acc2
	ld a, $2
	ld [wMenuData2Items], a
	ld a, $c
	ld [wMenuBorderTopCoord], a
	jr .asm_4accc

.asm_4acc2
	ld a, $4
	ld [wMenuData2Items], a
	ld a, $8
	ld [wMenuBorderTopCoord], a

.asm_4accc
	ld a, $b
	ld [wMenuBorderLeftCoord], a
	ld a, $1
	ld [wMenuCursorBuffer], a
	call InitVerticalMenuCursor
	ld hl, w2DMenuFlags1
	set 6, [hl]
	call StaticMenuJoypad
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [hJoyPressed]
	bit 0, a
	jr nz, .asm_4acf4
	bit 1, a
	jr nz, .asm_4acf3
	jr .asm_4acaa

.asm_4acf3
	ret

.asm_4acf4
	ld a, [wd019]
	bit 1, a
	jr nz, .asm_4ad0e
	ld a, [wMenuCursorY]
	cp $1
	jr z, Function4ad17
	cp $2
	jp z, Function4ad56
	cp $3
	jp z, Function4ad60
	jr .asm_4acf3

.asm_4ad0e
	ld a, [wMenuCursorY]
	cp $1
	jr z, Function4ad56
	jr .asm_4acf3

Function4ad17: ; 4ad17
	call Function4adb2
	jr z, .asm_4ad4a
	ld hl, wd002
	ld a, $ff
	cp [hl]
	jr z, .asm_4ad39
	inc hl
	cp [hl]
	jr z, .asm_4ad39
	inc hl
	cp [hl]
	jr z, .asm_4ad39
	ld de, SFX_WRONG
	call WaitPlaySFX
	ld hl, UnknownText_0x4ad51
	call PrintText
	ret

.asm_4ad39
	ld a, [CurPartyMon]
	ld [hl], a
	call Function4a9c3
	ret c
	ld a, [wd019]
	set 0, a
	ld [wd019], a
	ret

.asm_4ad4a
	ld a, $ff
	ld [hl], a
	call Function4adc2
	ret

UnknownText_0x4ad51: ; 0x4ad51
	; Only three #MON may enter.
	text_jump UnknownText_0x1c521c
	db "@"
; 0x4ad56

Function4ad56: ; 4ad56
	callba OpenPartyStats
	call WaitBGMap2
	ret
; 4ad60

Function4ad60: ; 4ad60
	callba ManagePokemonMoves
	ret
; 4ad67

Function4ad67: ; 4ad67
	ret
; 4ad68

Function4ad68: ; 4ad68
	hlcoord 13, 12
	ld de, String_4ad88
	call PlaceString
	call Function4adb2
	jr c, .asm_4ad7e
	hlcoord 13, 10
	ld de, String_4ada0
	jr .asm_4ad84

.asm_4ad7e
	hlcoord 13, 10
	ld de, String_4ad9a

.asm_4ad84
	call PlaceString
	ret
; 4ad88

String_4ad88: ; 4ad88
	db   "つよさをみる"
	next "つかえるわざ"
	next "もどる@"
; 4ad9a

String_4ad9a: ; 4ad9a
	db   "さんかする@"
; 4ada0

String_4ada0: ; 4ada0
	db   "さんかしない@"
; 4ada7

String_4ada7: ; 4ada7
	db   "つよさをみる"
	next "もどる@" ; BACK
; 4adb2

Function4adb2: ; 4adb2
	ld hl, wd002
	ld a, [CurPartyMon]
	cp [hl]
	ret z
	inc hl
	cp [hl]
	ret z
	inc hl
	cp [hl]
	ret z
	scf
	ret
; 4adc2

Function4adc2: ; 4adc2
	ld a, [wd002]
	cp $ff
	jr nz, .skip
	ld a, [wd003]
	cp $ff
	jr nz, .skip2
	ld a, [wd004]
	ld [wd002], a
	ld a, $ff
	ld [wd004], a
	jr .skip

.skip2
	ld [wd002], a
	ld a, $ff
	ld [wd003], a

.skip
	ld a, [wd003]
	cp $ff
	ret nz
	ld b, a
	ld a, [wd004]
	ld [wd003], a
	ld a, b
	ld [wd004], a
	ret
; 4adf7

Function4adf7: ; 4adf7
	ld a, [wd019]
	bit 0, a
	ret z
	ld a, [PartyCount]
	inc a
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	ld a, [wd019]
	res 0, a
	ld [wd019], a
	ret
; 4ae12
