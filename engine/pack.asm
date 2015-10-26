
Pack: ; 10000
	ld hl, Options
	set 4, [hl]
	call Function1068a
.loop
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call Function10026
	call DelayFrame
	jr .loop

.done
	ld a, [wcf65]
	ld [wd0d6], a
	ld hl, Options
	res 4, [hl]
	ret
; 10026

Function10026: ; 10026
	ld a, [wJumptableIndex]
	ld hl, Jumptable_10030
	call Function1086b
	jp [hl]
; 10030


Jumptable_10030: ; 10030 (4:4030)
	dw Function10046
	dw Function10056
	dw Function10067
	dw Function10186
	dw Function10198
	dw Function10094
	dw Function100a6
	dw Function100d3
	dw Function100e8
	dw Function10874
	dw Function1087e


Function10046: ; 10046 (4:4046)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call Function10955
	ld a, [wcf64]
	ld [wJumptableIndex], a
	call Function10a40
	ret

Function10056: ; 10056 (4:4056)
	xor a
	ld [wcf65], a
	call ClearPocketList
	call DrawPocketName
	call WaitBGMap_DrawPackGFX
	call Function10866
	ret

Function10067: ; 10067 (4:4067)
	ld hl, MenuDataHeader_0x10a4f
	call CopyMenuDataHeader
	ld a, [wItemsPocketCursor]
	ld [wPocketCursorBuffer], a
	ld a, [wd0df]
	ld [wd0e4], a
	call Function350c
	ld a, [wd0e4]
	ld [wd0df], a
	ld a, [wcfa9]
	ld [wItemsPocketCursor], a
	ld b, $7
	ld c, $3
	call Function108d4
	ret c
	call Function101c5
	ret

Function10094: ; 10094 (4:4094)
	ld a, $2
	ld [wcf65], a
	call ClearPocketList
	call DrawPocketName
	call WaitBGMap_DrawPackGFX
	call Function10866
	ret

Function100a6: ; 100a6 (4:40a6)
	ld hl, MenuDataHeader_0x10a7f
	call CopyMenuDataHeader
	ld a, [wKeyItemsPocketCursor]
	ld [wPocketCursorBuffer], a
	ld a, [wd0e0]
	ld [wd0e4], a
	call Function350c
	ld a, [wd0e4]
	ld [wd0e0], a
	ld a, [wcfa9]
	ld [wKeyItemsPocketCursor], a
	ld b, $3
	ld c, $7
	call Function108d4
	ret c
	call Function101c5
	ret

Function100d3: ; 100d3 (4:40d3)
	ld a, $3
	ld [wcf65], a
	call ClearPocketList
	call DrawPocketName
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call WaitBGMap_DrawPackGFX
	call Function10866
	ret

Function100e8: ; 100e8 (4:40e8)
	callba Function2c76f
	ld b, $5
	ld c, $1
	call Function108d4
	ret c
	callba _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .asm_1010a
	ld hl, MenuDataHeader_0x1013b
	ld de, Jumptable_10153
	jr .asm_10110
.asm_1010a
	ld hl, MenuDataHeader_0x10124
	ld de, Jumptable_10137
.asm_10110
	push de
	call LoadMenuDataHeader
	call InterpretMenu2
	call ExitMenu
	pop hl
	ret c
	ld a, [wcfa9]
	dec a
	call Function1086b
	jp [hl]
; 10124 (4:4124)

MenuDataHeader_0x10124: ; 0x10124
	db $40 ; flags
	db 07, 13 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x1012c
	db 1 ; default option
; 0x1012c

MenuData2_0x1012c: ; 0x1012c
	db $c0 ; flags
	db 2 ; items
	db "USE@"
	db "QUIT@"
; 0x10137

Jumptable_10137: ; 10137
	dw Function10159
	dw Function10492_ret
; 1013b

MenuDataHeader_0x1013b: ; 0x1013b
	db $40 ; flags
	db 05, 13 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x10143
	db 1 ; default option
; 0x10143

MenuData2_0x10143: ; 0x10143
	db $c0 ; flags
	db 3 ; items
	db "USE@"
	db "GIVE@"
	db "QUIT@"
; 0x10153

Jumptable_10153: ; 10153
	dw Function10159
	dw Function103fd
	dw Function10492_ret
; 10159

Function10159: ; 10159
	callba Function2c7bf
	ret c
	callba Function2c7fb
	jr c, .asm_10179
	ld hl, Options
	ld a, [hl]
	push af
	res 4, [hl]
	callba Function2c867
	pop af
	ld [Options], a
.asm_10179
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call Function10955
	call WaitBGMap_DrawPackGFX
	call Function10a40
	ret

Function10186: ; 10186 (4:4186)
	ld a, $1
	ld [wcf65], a
	call ClearPocketList
	call DrawPocketName
	call WaitBGMap_DrawPackGFX
	call Function10866
	ret

Function10198: ; 10198 (4:4198)
	ld hl, MenuDataHeader_0x10aaf
	call CopyMenuDataHeader
	ld a, [wBallsPocketCursor]
	ld [wPocketCursorBuffer], a
	ld a, [wd0e1]
	ld [wd0e4], a
	call Function350c
	ld a, [wd0e4]
	ld [wd0e1], a
	ld a, [wcfa9]
	ld [wBallsPocketCursor], a
	ld b, $1
	ld c, $5
	call Function108d4
	ret c
	call Function101c5
	ret

Function101c5: ; 101c5 (4:41c5)
	callba _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .tossable
	callba CheckSelectableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .selectable
	callba CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .usable
	jr .unusable

.selectable
	callba CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .selectable_usable
	jr .selectable_unusable

.tossable
	callba CheckSelectableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .tossable_selectable
	jr .tossable_unselectable

.usable
	ld hl, MenuDataHeader_0x10249
	ld de, Jumptable_1026a
	jr .build_menu

.selectable_usable
	ld hl, MenuDataHeader_0x10274
	ld de, Jumptable_10291
	jr .build_menu

.tossable_selectable
	ld hl, MenuDataHeader_0x10299
	ld de, Jumptable_102ac
	jr .build_menu

.tossable_unselectable
	ld hl, MenuDataHeader_0x102b0
	ld de, Jumptable_102c7
	jr .build_menu

.unusable
	ld hl, MenuDataHeader_0x102cd
	ld de, Jumptable_102ea
	jr .build_menu

.selectable_unusable
	ld hl, MenuDataHeader_0x102f2
	ld de, Jumptable_1030b
.build_menu
	push de
	call LoadMenuDataHeader
	call InterpretMenu2
	call ExitMenu
	pop hl
	ret c
	ld a, [wcfa9]
	dec a
	call Function1086b
	jp [hl]
; 10249 (4:4249)

MenuDataHeader_0x10249: ; 0x10249
	db $40 ; flags
	db 01, 13 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x10251
	db 1 ; default option
; 0x10251

MenuData2_0x10251: ; 0x10251
	db $c0 ; flags
	db 5 ; items
	db "USE@"
	db "GIVE@"
	db "TOSS@"
	db "SEL@"
	db "QUIT@"
; 0x1026a

Jumptable_1026a: ; 1026a
	dw Function10311
	dw Function103fd
	dw Function10364
	dw Function103c2
	dw Function10492_ret
; 10274

MenuDataHeader_0x10274: ; 0x10274
	db $40 ; flags
	db 03, 13 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x1027c
	db 1 ; default option
; 0x1027c

MenuData2_0x1027c: ; 0x1027c
	db $c0 ; flags
	db 4 ; items
	db "USE@"
	db "GIVE@"
	db "TOSS@"
	db "QUIT@"
; 0x10291

Jumptable_10291: ; 10291
	dw Function10311
	dw Function103fd
	dw Function10364
	dw Function10492_ret
; 10299

MenuDataHeader_0x10299: ; 0x10299
	db %01000000 ; flags
	db 07, 13 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x102a1
	db 1 ; default option
; 0x102a1

MenuData2_0x102a1: ; 0x102a1
	db $c0 ; flags
	db 2 ; items
	db "USE@"
	db "QUIT@"
; 0x102ac

Jumptable_102ac: ; 102ac
	dw Function10311
	dw Function10492_ret
; 102b0

MenuDataHeader_0x102b0: ; 0x102b0
	db %01000000 ; flags
	db 05, 13 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x102b8
	db 1 ; default option
; 0x102b8

MenuData2_0x102b8: ; 0x102b8
	db $c0 ; flags
	db 3 ; items
	db "USE@"
	db "SEL@"
	db "QUIT@"
; 0x102c7

Jumptable_102c7: ; 102c7
	dw Function10311
	dw Function103c2
	dw Function10492_ret
; 102cd

MenuDataHeader_0x102cd: ; 0x102cd
	db $40 ; flags
	db 03, 13 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x102d5
	db 1 ; default option
; 0x102d5

MenuData2_0x102d5: ; 0x102d5
	db $c0 ; flags
	db 4 ; items
	db "GIVE@"
	db "TOSS@"
	db "SEL@"
	db "QUIT@"
; 0x102ea

Jumptable_102ea: ; 102ea
	dw Function103fd
	dw Function10364
	dw Function103c2
	dw Function10492_ret
; 102f2

MenuDataHeader_0x102f2: ; 0x102f2
	db $40 ; flags
	db 05, 13 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x102fa
	db 1 ; default option
; 0x102fa

MenuData2_0x102fa: ; 0x102fa
	db $c0 ; flags
	db 3 ; items
	db "GIVE@"
	db "TOSS@"
	db "QUIT@"
; 0x1030b

Jumptable_1030b: ; 1030b
	dw Function103fd
	dw Function10364
	dw Function10492_ret
; 10311

Function10311: ; 10311
	callba CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .jumptable
	rst JumpTable
	ret
; 1031f

.jumptable: ; 1031f (4:431f)
	dw .Oak
	dw .Oak
	dw .Oak
	dw .Oak
	dw .Current
	dw .Party
	dw .Field
; 1035c

.Oak: ; 1032d (4:432d)
	ld hl, UnknownText_0x10af3
	call Function10889
	ret

.Current: ; 10334 (4:4334)
	call DoItemEffect
	ret

.Party: ; 10338 (4:4338)
	ld a, [PartyCount]
	and a
	jr z, .NoPokemon
	call DoItemEffect
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call Function10955
	call WaitBGMap_DrawPackGFX
	call Function10a40
	ret
.NoPokemon
	ld hl, TextJump_YouDontHaveAPkmn
	call Function10889
	ret

.Field: ; 10355 (4:4355)
	call DoItemEffect
	ld a, [wd0ec]
	and a
	jr z, .Oak
	ld a, $a
	ld [wJumptableIndex], a
	ret
; 10364 (4:4364)

Function10364: ; 10364
	ld hl, UnknownText_0x10ae4
	call Function10889
	callba Function24fbf
	push af
	call ExitMenu
	pop af
	jr c, .asm_1039c
	call Function10a1d
	ld hl, UnknownText_0x10ae9
	call MenuTextBox
	call YesNoBox
	push af
	call ExitMenu
	pop af
	jr c, .asm_1039c
	ld hl, NumItems
	ld a, [wd107]
	call TossItem
	call Function10a1d
	ld hl, UnknownText_0x10aee
	call Function10889

.asm_1039c
	ret
; 1039d

Function1039d: ; 1039d
	ld a, [wcf65]
	and a
	jr z, .asm_103b2
	dec a
	jr z, .asm_103aa
	dec a
	jr z, .asm_103ba
	ret

.asm_103aa
	xor a
	ld [wBallsPocketCursor], a
	ld [wd0e1], a
	ret

.asm_103b2
	xor a
	ld [wItemsPocketCursor], a
	ld [wd0df], a
	ret

.asm_103ba
	xor a
	ld [wKeyItemsPocketCursor], a
	ld [wd0e0], a
	ret
; 103c2

Function103c2: ; 103c2
	callba CheckSelectableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .asm_103f6
	ld a, [wcf65]
	rrca
	rrca
	and $c0
	ld b, a
	ld a, [wd107]
	inc a
	and $3f
	or b
	ld [WhichRegisteredItem], a
	ld a, [CurItem]
	ld [RegisteredItem], a
	call Function10a1d
	ld de, SFX_FULL_HEAL
	call WaitPlaySFX
	ld hl, UnknownText_0x10afd
	call Function10889
	ret

.asm_103f6
	ld hl, UnknownText_0x10b02
	call Function10889
	ret
; 103fd

Function103fd: ; 103fd
	ld a, [PartyCount]
	and a
	jp z, Function10486
	ld a, [Options]
	push af
	res 4, a
	ld [Options], a
	ld a, $8
	ld [PartyMenuActionText], a
	call WhiteBGMap
	callba Function5004f
	callba Function50405
	callba Function503e0
.asm_10427
	callba WritePartyMenuTilemap
	callba PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	callba PartyMenuSelect
	jr c, .asm_10475

	ld a, [CurPartySpecies]
	cp EGG
	jr nz, .asm_10453

	ld hl, TextJump_AnEGGCantHoldAnItem
	call PrintText
	jr .asm_10427

.asm_10453
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	call GetCurNick
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call Function12bd9
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
.asm_10475
	pop af
	ld [Options], a
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call Function10955
	call WaitBGMap_DrawPackGFX
	call Function10a40
	ret

Function10486: ; 10486 (4:4486)
	ld hl, TextJump_YouDontHaveAPkmn
	call Function10889
	ret
; 1048d (4:448d)

TextJump_AnEGGCantHoldAnItem: ; 0x1048d
	; An EGG can't hold an item.
	text_jump Text_AnEGGCantHoldAnItem
	db "@"
; 0x10492

Function10492_ret: ; 10492
	ret
; 10493


BattlePack: ; 10493
	ld hl, Options
	set 4, [hl]
	call Function1068a
.asm_1049b
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_104ad
	call Function104b9
	call DelayFrame
	jr .asm_1049b

.asm_104ad
	ld a, [wcf65]
	ld [wd0d6], a
	ld hl, Options
	res 4, [hl]
	ret
; 104b9

Function104b9: ; 104b9
	ld a, [wJumptableIndex]
	ld hl, Jumptable_104c3
	call Function1086b
	jp [hl]
; 104c3


Jumptable_104c3: ; 104c3 (4:44c3)
	dw Function104d9
	dw Function104e9
	dw Function104fa
	dw Function10594
	dw Function105a6
	dw Function10527
	dw Function10539
	dw Function10566
	dw Function10581
	dw Function10874
	dw Function1087e


Function104d9: ; 104d9 (4:44d9)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call Function10955
	ld a, [wcf64]
	ld [wJumptableIndex], a
	call Function10a40
	ret

Function104e9: ; 104e9 (4:44e9)
	xor a
	ld [wcf65], a
	call ClearPocketList
	call DrawPocketName
	call WaitBGMap_DrawPackGFX
	call Function10866
	ret

Function104fa: ; 104fa (4:44fa)
	ld hl, MenuDataHeader_0x10a4f
	call CopyMenuDataHeader
	ld a, [wItemsPocketCursor]
	ld [wPocketCursorBuffer], a
	ld a, [wd0df]
	ld [wd0e4], a
	call Function350c
	ld a, [wd0e4]
	ld [wd0df], a
	ld a, [wcfa9]
	ld [wItemsPocketCursor], a
	ld b, $7
	ld c, $3
	call Function108d4
	ret c
	call Function105d3
	ret

Function10527: ; 10527 (4:4527)
	ld a, $2
	ld [wcf65], a
	call ClearPocketList
	call DrawPocketName
	call WaitBGMap_DrawPackGFX
	call Function10866
	ret

Function10539: ; 10539 (4:4539)
	ld hl, MenuDataHeader_0x10a7f
	call CopyMenuDataHeader
	ld a, [wKeyItemsPocketCursor]
	ld [wPocketCursorBuffer], a
	ld a, [wd0e0]
	ld [wd0e4], a
	call Function350c
	ld a, [wd0e4]
	ld [wd0e0], a
	ld a, [wcfa9]
	ld [wKeyItemsPocketCursor], a
	ld b, $3
	ld c, $7
	call Function108d4
	ret c
	call Function105d3
	ret

Function10566: ; 10566 (4:4566)
	ld a, $3
	ld [wcf65], a
	call ClearPocketList
	call DrawPocketName
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call WaitBGMap_DrawPackGFX
	ld hl, UnknownText_0x10b0c
	call Function10889
	call Function10866
	ret

Function10581: ; 10581 (4:4581)
	callba Function2c76f
	ld b, $5
	ld c, $1
	call Function108d4
	ret c
	xor a
	call Function105dc
	ret

Function10594: ; 10594 (4:4594)
	ld a, $1
	ld [wcf65], a
	call ClearPocketList
	call DrawPocketName
	call WaitBGMap_DrawPackGFX
	call Function10866
	ret

Function105a6: ; 105a6 (4:45a6)
	ld hl, MenuDataHeader_0x10aaf
	call CopyMenuDataHeader
	ld a, [wBallsPocketCursor]
	ld [wPocketCursorBuffer], a
	ld a, [wd0e1]
	ld [wd0e4], a
	call Function350c
	ld a, [wd0e4]
	ld [wd0e1], a
	ld a, [wcfa9]
	ld [wBallsPocketCursor], a
	ld b, $1
	ld c, $5
	call Function108d4
	ret c
	call Function105d3
	ret

Function105d3: ; 105d3 (4:45d3)
	callba CheckItemContext
	ld a, [wItemAttributeParamBuffer]

Function105dc: ; 105dc (4:45dc)
	and a
	jr z, .NoUse
	ld hl, .UsableMenuDataHeader
	ld de, .UsableJumptable
	jr .proceed
.NoUse
	ld hl, .UnusableMenuDataHeader
	ld de, .UnusableJumptable
.proceed
	push de
	call LoadMenuDataHeader
	call InterpretMenu2
	call ExitMenu
	pop hl
	ret c
	ld a, [wcfa9]
	dec a
	call Function1086b
	jp [hl]
; 10601 (4:4601)

.UsableMenuDataHeader: ; 0x10601
	db $40 ; flags
	db 07, 13 ; start coords
	db 11, 19 ; end coords
	dw .UsableMenuData2
	db 1 ; default option
; 0x10609

.UsableMenuData2: ; 0x10609
	db $c0 ; flags
	db 2 ; items
	db "USE@"
	db "QUIT@"
; 0x10614

.UsableJumptable: ; 10614
	dw .Use
	dw .Quit
; 10618

.UnusableMenuDataHeader: ; 0x10618
	db $40 ; flags
	db 09, 13 ; start coords
	db 11, 19 ; end coords
	dw .UnusableMenuData2
	db 1 ; default option
; 0x10620

.UnusableMenuData2: ; 0x10620
	db $c0 ; flags
	db 1 ; items
	db "QUIT@"
; 0x10627

.UnusableJumptable: ; 10627
	dw .Quit
; 10629

.Use: ; 10629
	callba CheckItemContext
	ld a, [wItemAttributeParamBuffer]
	ld hl, .ItemFunctionJumptable
	rst JumpTable
	ret

.ItemFunctionJumptable: ; 10637 (4:4637)
	dw .Oak
	dw .Oak
	dw .Oak
	dw .Oak
	dw .Unused
	dw .BattleField
	dw .BattleOnly


.Oak: ; 10645 (4:4645)
	ld hl, UnknownText_0x10af3
	call Function10889
	ret

.Unused: ; 1064c (4:464c)
	call DoItemEffect
	ld a, [wd0ec]
	and a
	jr nz, .asm_1066c
	ret

.BattleField: ; 10656 (4:4656)
	call DoItemEffect
	ld a, [wd0ec]
	and a
	jr nz, .asm_1067e
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	call Function10955
	call WaitBGMap_DrawPackGFX
	call Function10a40
	ret

.asm_1066c: ; 1066c (4:466c)
	call WhiteBGMap
	jr .asm_1067e

.BattleOnly: ; 10671 (4:4671)
	call DoItemEffect
	ld a, [wd0ec]
	and a
	jr z, .Oak
	cp $2
	jr z, .asm_10684
.asm_1067e: ; 1067e (4:467e)
	ld a, $a
	ld [wJumptableIndex], a
	ret

.asm_10684: ; 10684 (4:4684)
	xor a
	ld [wd0ec], a
	ret
; 10689 (4:4689)

.Quit: ; 10689
	ret
; 1068a


Function1068a: ; 1068a
	xor a
	ld [wJumptableIndex], a
	ld a, [wd0d6]
	and $3
	ld [wcf65], a
	inc a
	add a
	dec a
	ld [wcf64], a
	xor a
	ld [wcf66], a
	xor a
	ld [wd0e3], a
	ret
; 106a5

Function106a5: ; 106a5
	xor a
	ld [hBGMapMode], a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wd0e3], a
	call Function10955
	call Function10a40
	ret
; 106be

Function106be: ; 106be
.asm_106be
	call Function106c7
	call Function1076f
	jr c, .asm_106be
	ret
; 106c7

Function106c7: ; 106c7
	ld a, [wJumptableIndex]
	ld hl, Jumptable_106d1
	call Function1086b
	jp [hl]
; 106d1


Jumptable_106d1: ; 106d1 (4:46d1)
	dw .ItemsPocket
	dw .BallsPocket
	dw .KeyItemsPocket
	dw .TMHMPocket


.ItemsPocket: ; 106d9 (4:46d9)
	xor a
	call InitPocket
	ld hl, MenuDataHeader_0x10a67
	call CopyMenuDataHeader
	ld a, [wItemsPocketCursor]
	ld [wPocketCursorBuffer], a
	ld a, [wd0df]
	ld [wd0e4], a
	call Function350c
	ld a, [wd0e4]
	ld [wd0df], a
	ld a, [wcfa9]
	ld [wItemsPocketCursor], a
	ret

.KeyItemsPocket: ; 106ff (4:46ff)
	ld a, $2
	call InitPocket
	ld hl, MenuDataHeader_0x10a97
	call CopyMenuDataHeader
	ld a, [wKeyItemsPocketCursor]
	ld [wPocketCursorBuffer], a
	ld a, [wd0e0]
	ld [wd0e4], a
	call Function350c
	ld a, [wd0e4]
	ld [wd0e0], a
	ld a, [wcfa9]
	ld [wKeyItemsPocketCursor], a
	ret

.TMHMPocket: ; 10726 (4:4726)
	ld a, $3
	call InitPocket
	call WaitBGMap_DrawPackGFX
	callba Function2c76f
	ld a, [CurItem]
	ld [CurItem], a
	ret

.BallsPocket: ; 1073b (4:473b)
	ld a, $1
	call InitPocket
	ld hl, MenuDataHeader_0x10ac7
	call CopyMenuDataHeader
	ld a, [wBallsPocketCursor]
	ld [wPocketCursorBuffer], a
	ld a, [wd0e1]
	ld [wd0e4], a
	call Function350c
	ld a, [wd0e4]
	ld [wd0e1], a
	ld a, [wcfa9]
	ld [wBallsPocketCursor], a
	ret

InitPocket: ; 10762 (4:4762)
	ld [wcf65], a
	call ClearPocketList
	call DrawPocketName
	call WaitBGMap_DrawPackGFX
	ret


Function1076f: ; 1076f
	ld hl, wcf73
	ld a, [hl]
	and $1
	jr nz, .asm_10788
	ld a, [hl]
	and $2
	jr nz, .asm_1078f
	ld a, [hl]
	and $20
	jr nz, .asm_10795
	ld a, [hl]
	and $10
	jr nz, .asm_107a8
	scf
	ret

.asm_10788
	ld a, $1
	ld [wcf66], a
	and a
	ret

.asm_1078f
	xor a
	ld [wcf66], a
	and a
	ret

.asm_10795
	ld a, [wJumptableIndex]
	dec a
	and $3
	ld [wJumptableIndex], a
	push de
	ld de, SFX_UNKNOWN_62
	call PlaySFX
	pop de
	scf
	ret

.asm_107a8
	ld a, [wJumptableIndex]
	inc a
	and $3
	ld [wJumptableIndex], a
	push de
	ld de, SFX_UNKNOWN_62
	call PlaySFX
	pop de
	scf
	ret
; 107bb

Function107bb: ; 107bb
	call Function106a5
	ld a, [InputType]
	or a
	jr z, .asm_107ca
	callba _DudeAutoInput_RightA

.asm_107ca
	call Function107d7
	call Function1076f
	jr c, .asm_107ca
	xor a
	ld [wcf66], a
	ret
; 107d7

Function107d7: ; 107d7
	ld a, [wJumptableIndex]
	ld hl, Jumptable_107e1
	call Function1086b
	jp [hl]
; 107e1


Jumptable_107e1: ; 107e1 (4:47e1)
	dw Function107e9
	dw Function1083b
	dw Function10807
	dw Function10826


Function107e9: ; 107e9 (4:47e9)
	xor a
	ld hl, MenuDataHeader_0x107ef
	jr Function1085a
; 107ef (4:47ef)

MenuDataHeader_0x107ef: ; 0x107ef
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x107f7
	db 1 ; default option
; 0x107f7

MenuData2_0x107f7: ; 0x107f7
	db $ae ; flags
	db 5, 8 ; rows, columns
	db 2 ; horizontal spacing
	dbw 0, OTPartyMons
	dbw BANK(PlaceMenuItemName), PlaceMenuItemName
	dbw BANK(PlaceMenuItemQuantity), PlaceMenuItemQuantity
	dbw BANK(Function244c3), Function244c3
; 10807

Function10807: ; 10807 (4:4807)
	ld a, $2
	ld hl, MenuDataHeader_0x1080e
	jr Function1085a
; 1080e (4:480e)

MenuDataHeader_0x1080e: ; 0x1080e
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x10816
	db 1 ; default option
; 0x10816

MenuData2_0x10816: ; 0x10816
	db $ae ; flags
	db 5, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, OTPartyMon1Exp + 2
	dbw BANK(PlaceMenuItemName), PlaceMenuItemName
	dbw BANK(PlaceMenuItemQuantity), PlaceMenuItemQuantity
	dbw BANK(Function244c3), Function244c3
; 10826

Function10826: ; 10826 (4:4826)
	ld a, $3
	call InitPocket
	call WaitBGMap_DrawPackGFX
	callba Function2c76f
	ld a, [CurItem]
	ld [CurItem], a
	ret

Function1083b: ; 1083b (4:483b)
	ld a, $1
	ld hl, MenuDataHeader_0x10842
	jr Function1085a
; 10842 (4:4842)

MenuDataHeader_0x10842: ; 0x10842
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x1084a
	db 1 ; default option
; 0x1084a

MenuData2_0x1084a: ; 0x1084a
	db $ae ; flags
	db 5, 8 ; rows, columns
	db 2 ; horizontal spacing
	dbw 0, OTPartyMon1CaughtGender
	dbw BANK(PlaceMenuItemName), PlaceMenuItemName
	dbw BANK(PlaceMenuItemQuantity), PlaceMenuItemQuantity
	dbw BANK(Function244c3), Function244c3
; 1085a

Function1085a: ; 1085a (4:485a)
	push hl
	call InitPocket
	pop hl
	call CopyMenuDataHeader
	call Function350c
	ret

Function10866: ; 10866 (4:4866)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function1086b: ; 1086b
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 10874

Function10874: ; 10874 (4:4874)
	ld hl, wJumptableIndex
	set 7, [hl]
	xor a
	ld [wcf66], a
	ret

Function1087e: ; 1087e (4:487e)
	ld hl, wJumptableIndex
	set 7, [hl]
	ld a, $1
	ld [wcf66], a
	ret

Function10889: ; 10889 (4:4889)
	ld a, [Options]
	push af
	set 4, a
	ld [Options], a
	call PrintText
	pop af
	ld [Options], a
	ret

WaitBGMap_DrawPackGFX: ; 1089a (4:489a)
	call WaitBGMap


DrawPackGFX: ; 1089d
	ld a, [wcf65]
	and $3
	ld e, a
	ld d, $0
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .male_dude
	ld a, [PlayerGender]
	bit 0, a
	jr nz, .female

.male_dude
	ld hl, PackGFXPointers
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, VTiles2 tile $50
	lb bc, BANK(PackGFX), 15
	call Request2bpp
	ret

.female
	callba DrawKrisPackGFX
	ret
; 108cc

PackGFXPointers: ; 108cc
	dw PackGFX + $f0 * 1
	dw PackGFX + $f0 * 3
	dw PackGFX + $f0 * 0
	dw PackGFX + $f0 * 2
; 108d4

Function108d4: ; 108d4 (4:48d4)
	ld hl, wcf73
	ld a, [wd0e3]
	and a
	jr nz, .asm_10931
	ld a, [hl]
	and $1
	jr nz, .asm_108f8
	ld a, [hl]
	and $2
	jr nz, .asm_108fa
	ld a, [hl]
	and $20
	jr nz, .asm_10901
	ld a, [hl]
	and $10
	jr nz, .asm_10912
	ld a, [hl]
	and $4
	jr nz, .asm_10923
	scf
	ret
.asm_108f8
	and a
	ret
.asm_108fa
	ld a, $9
	ld [wJumptableIndex], a
	scf
	ret
.asm_10901
	ld a, b
	ld [wJumptableIndex], a
	ld [wcf64], a
	push de
	ld de, SFX_UNKNOWN_62
	call PlaySFX
	pop de
	scf
	ret
.asm_10912
	ld a, c
	ld [wJumptableIndex], a
	ld [wcf64], a
	push de
	ld de, SFX_UNKNOWN_62
	call PlaySFX
	pop de
	scf
	ret
.asm_10923
	callba Function2490c
	ld hl, UnknownText_0x10b07
	call Function10889
	scf
	ret
.asm_10931
	ld a, [hl]
	and $5
	jr nz, .asm_1093d
	ld a, [hl]
	and $2
	jr nz, .asm_1094f
	scf
	ret
.asm_1093d
	callba Function2490c
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
.asm_1094f
	xor a
	ld [wd0e3], a
	scf
	ret


Function10955: ; 10955
	call WhiteBGMap
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	ld hl, PackMenuGFX
	ld de, VTiles2
	ld bc, $0600
	ld a, BANK(PackMenuGFX)
	call FarCopyBytes
	hlcoord 0, 1
	ld bc, $00dc
	ld a, $24
	call ByteFill
	hlcoord 5, 1
	lb bc, 11, 15
	call ClearBox
	hlcoord 0, 0
	ld a, $28
	ld c, $14
.asm_1098a
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_1098a
	call DrawPocketName
	call Function109a5
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	call EnableLCD
	call DrawPackGFX
	ret
; 109a5

Function109a5: ; 109a5
	hlcoord 0, 3
	ld a, $50
	ld de, 15
	ld b, 3
.asm_109af
	ld c, 5
.asm_109b1
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_109b1
	add hl, de
	dec b
	jr nz, .asm_109af
	ret
; 109bb

DrawPocketName: ; 109bb
	ld a, [wcf65]

	; * 15
	ld d, a
	swap a
	sub d

	ld d, 0
	ld e, a
	ld hl, .tilemap
	add hl, de
	ld d, h
	ld e, l
	hlcoord 0, 7
	ld c, 3
.row
	ld b, 5
.col
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .col
	ld a, c
	ld c, SCREEN_WIDTH - 5
	add hl, bc
	ld c, a
	dec c
	jr nz, .row
	ret
; 109e1

.tilemap: ; 109e1
	db $00, $04, $04, $04, $01,  $06, $07, $08, $09, $0a,  $02, $05, $05, $05, $03
	db $00, $04, $04, $04, $01,  $15, $16, $17, $18, $19,  $02, $05, $05, $05, $03
	db $00, $04, $04, $04, $01,  $0b, $0c, $0d, $0e, $0f,  $02, $05, $05, $05, $03
	db $00, $04, $04, $04, $01,  $10, $11, $12, $13, $14,  $02, $05, $05, $05, $03
; 10a1d

Function10a1d: ; 10a1d
	ld a, [CurItem]
	ld [wd265], a
	call GetItemName
	call CopyName1
	ret
; 10a2a

Function10a2a: ; 10a2a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ret
; 10a36

ClearPocketList: ; 10a36 (4:4a36)
	hlcoord 5, 2
	lb bc, 10, SCREEN_WIDTH - 5
	call ClearBox
	ret


Function10a40: ; 10a40
	call WaitBGMap
	ld b, SCREEN_WIDTH
	call GetSGBLayout
	call SetPalettes
	call DelayFrame
	ret
; 10a4f

MenuDataHeader_0x10a4f: ; 0x10a4f
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x10a57
	db 1 ; default option
; 0x10a57

MenuData2_0x10a57: ; 0x10a57
	db $ae ; flags
	db 5, 8 ; rows, columns
	db 2 ; horizontal spacing
	dbw 0, NumItems
	dbw BANK(PlaceMenuItemName), PlaceMenuItemName
	dbw BANK(PlaceMenuItemQuantity), PlaceMenuItemQuantity
	dbw BANK(Function244c3), Function244c3
; 10a67

MenuDataHeader_0x10a67: ; 0x10a67
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x10a6f
	db 1 ; default option
; 0x10a6f

MenuData2_0x10a6f: ; 0x10a6f
	db $2e ; flags
	db 5, 8 ; rows, columns
	db 2 ; horizontal spacing
	dbw 0, NumItems
	dbw BANK(PlaceMenuItemName), PlaceMenuItemName
	dbw BANK(PlaceMenuItemQuantity), PlaceMenuItemQuantity
	dbw BANK(Function244c3), Function244c3
; 10a7f

MenuDataHeader_0x10a7f: ; 0x10a7f
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x10a87
	db 1 ; default option
; 0x10a87

MenuData2_0x10a87: ; 0x10a87
	db $ae ; flags
	db 5, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, NumKeyItems
	dbw BANK(PlaceMenuItemName), PlaceMenuItemName
	dbw BANK(PlaceMenuItemQuantity), PlaceMenuItemQuantity
	dbw BANK(Function244c3), Function244c3
; 10a97

MenuDataHeader_0x10a97: ; 0x10a97
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x10a9f
	db 1 ; default option
; 0x10a9f

MenuData2_0x10a9f: ; 0x10a9f
	db $2e ; flags
	db 5, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, NumKeyItems
	dbw BANK(PlaceMenuItemName), PlaceMenuItemName
	dbw BANK(PlaceMenuItemQuantity), PlaceMenuItemQuantity
	dbw BANK(Function244c3), Function244c3
; 10aaf

MenuDataHeader_0x10aaf: ; 0x10aaf
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x10ab7
	db 1 ; default option
; 0x10ab7

MenuData2_0x10ab7: ; 0x10ab7
	db $ae ; flags
	db 5, 8 ; rows, columns
	db 2 ; horizontal spacing
	dbw 0, NumBalls
	dbw BANK(PlaceMenuItemName), PlaceMenuItemName
	dbw BANK(PlaceMenuItemQuantity), PlaceMenuItemQuantity
	dbw BANK(Function244c3), Function244c3
; 10ac7

MenuDataHeader_0x10ac7: ; 0x10ac7
	db $40 ; flags
	db 01, 07 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x10acf
	db 1 ; default option
; 0x10acf

MenuData2_0x10acf: ; 0x10acf
	db $2e ; flags
	db 5, 8 ; rows, columns
	db 2 ; horizontal spacing
	dbw 0, NumBalls
	dbw BANK(PlaceMenuItemName), PlaceMenuItemName
	dbw BANK(PlaceMenuItemQuantity), PlaceMenuItemQuantity
	dbw BANK(Function244c3), Function244c3
; 10adf

UnknownText_0x10adf: ; 0x10adf
	; No items.
	text_jump UnknownText_0x1c0b9a
	db "@"
; 0x10ae4

UnknownText_0x10ae4: ; 0x10ae4
	; Throw away how many?
	text_jump UnknownText_0x1c0ba5
	db "@"
; 0x10ae9

UnknownText_0x10ae9: ; 0x10ae9
	; Throw away @ @ (S)?
	text_jump UnknownText_0x1c0bbb
	db "@"
; 0x10aee

UnknownText_0x10aee: ; 0x10aee
	; Threw away @ (S).
	text_jump UnknownText_0x1c0bd8
	db "@"
; 0x10af3

UnknownText_0x10af3: ; 0x10af3
	; OAK:  ! This isn't the time to use that!
	text_jump UnknownText_0x1c0bee
	db "@"
; 0x10af8

TextJump_YouDontHaveAPkmn: ; 0x10af8
	; You don't have a #MON!
	text_jump Text_YouDontHaveAPkmn
	db "@"
; 0x10afd

UnknownText_0x10afd: ; 0x10afd
	; Registered the @ .
	text_jump UnknownText_0x1c0c2e
	db "@"
; 0x10b02

UnknownText_0x10b02: ; 0x10b02
	; You can't register that item.
	text_jump UnknownText_0x1c0c45
	db "@"
; 0x10b07

UnknownText_0x10b07: ; 0x10b07
	; Where should this be moved to?
	text_jump UnknownText_0x1c0c63
	db "@"
; 0x10b0c

UnknownText_0x10b0c: ; 0x10b0c
	;
	text_jump UnknownText_0x1c0c83
	db "@"
; 0x10b11

TextJump_YouCantUseItInABattle: ; 0x10b11
	; Doesn't seem to be used anywhere
	; "You can't use it in a battle."
	text_jump Text_YouCantUseItInABattle
	db "@"
; 0x10b16

PackMenuGFX:
INCBIN "gfx/misc/pack_menu.2bpp"

PackGFX:
INCBIN "gfx/misc/pack.2bpp"
