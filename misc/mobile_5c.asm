Function170000: ; 170000
	ld a, [$c62b]
	ld [$c6d0], a
	ld hl, $c62e
	ld de, $c6e7
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $c663
	ld de, $c6f2
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $c648
	ld a, [hli]
	ld [$c6fd], a
	ld a, [hl]
	ld [$c6fe], a
	ld hl, $c639
	ld a, [hli]
	ld [$c6ff], a
	ld a, [hl]
	ld [wc700], a
	ld bc, $c633
	callba GetCaughtGender
	ld a, c
	ld [wc701], a
	ld a, [wcd81]
	ld [wc74e], a
	ld hl, $c608
	ld de, $d800
	ld bc, $008f
	call CopyBytes
	ret
; 17005a

Function17005a: ; 17005a
	ld a, $5
	call GetSRAMBank
	ld a, [$a824]
	ld [wc702], a
	ld hl, $a827
	ld de, wc719
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $a85c
	ld de, wc724
	ld bc, $0005
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, $a841
	ld a, [hli]
	ld [wEnemyTrappingMove], a
	ld a, [hl]
	ld [wPlayerWrapCount], a
	ld hl, $a832
	ld a, [hli]
	ld [wEnemyWrapCount], a
	ld a, [hl]
	ld [wPlayerCharging], a
	ld bc, $a82c
	callba GetCaughtGender
	ld a, c
	ld [wEnemyCharging], a
	ld a, [wcd81]
	ld [wc74e], a
	call CloseSRAM
	ret
; 1700b0

Function1700b0: ; 1700b0
	call Function17021e
	callba Function118121
	ret
; 1700ba

Function1700ba: ; 1700ba
	call Function17021e
	callba Function11811a
	ret
; 1700c4

Function1700c4: ; 1700c4
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a

	call Function17042c
	ld a, $5
	call GetSRAMBank
	ld a, $1
	ld [$be45], a
	xor a
	ld [$be46], a
	ld hl, $dffc
	ld de, $aa41
	ld bc, $0004
	call CopyBytes
	ld hl, $d202
	ld de, $aa8e
	ld bc, $0594
	call CopyBytes
	ld hl, $aa5d
	ld a, [hl]
	inc [hl]
	inc hl
	sla a
	sla a
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld hl, $dffc
	ld bc, $0004
	call CopyBytes
	call CloseSRAM
	pop af
	ld [rSVBK], a
	ret
; 170114

Function170114: ; 170114
	call Function17021e
	call Function170121
	callba Function11805f
	ret
; 170121

Function170121: ; 170121
	ld a, $5
	call GetSRAMBank
	ld hl, $a948
	ld de, $c608
	ld bc, $00f6
	call CopyBytes
	call CloseSRAM
	call Function170c8b
	ret
; 170139

Function170139: ; 170139
	ld a, $5
	call GetSRAMBank
	ld de, $aa41
	ld h, $0
	ld l, h
	ld bc, $03e8
	call Function17020c
	ld bc, $0064
	call Function17020c
	ld bc, $000a
	call Function17020c
	ld a, [de]
	ld c, a
	ld b, $0
	add hl, bc
	call CloseSRAM
	ld a, h
	ld [$c608], a
	ld a, l
	ld [$c608 + 1], a
	ld hl, $c628
	ld a, [PlayerID]
	ld [hli], a
	ld a, [PlayerID + 1]
	ld [hli], a
	ld a, [wSecretID]
	ld [hli], a
	ld a, [wSecretID + 1]
	ld [hli], a
	ld e, l
	ld d, h
	ld hl, PlayerName
	ld bc, $0005 ; Japanese name length
	call CopyBytes
	ld bc, PlayerID
	ld de, PlayerGender
	callba Function4e929
	ld de, $c62c + 5
	ld a, c
	ld [de], a
	inc de
	ld a, $df
	ld [wcd49], a
	ld a, $dc
	ld [wcd4a], a
	ld a, $41
	ld [wcd4b], a
	ld a, $de
	ld [wcd4c], a
	ld a, $3
.asm_1701ac
	push af
	ld a, [wcd49]
	ld l, a
	ld a, [wcd4a]
	ld h, a
	ld bc, $0030
	call CopyBytes
	ld a, l
	ld [wcd49], a
	ld a, h
	ld [wcd4a], a
	ld a, [wcd4b]
	ld l, a
	ld a, [wcd4c]
	ld h, a
	ld bc, $0006
	call CopyBytes
	ld a, l
	ld [wcd4b], a
	ld a, h
	ld [wcd4c], a
	pop af
	dec a
	jr nz, .asm_1701ac
	ld a, $4
	call GetSRAMBank
	ld hl, $a013
	ld bc, $0024
	call CopyBytes
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	ld hl, $a894
	ld bc, $0006
	call CopyBytes
	ld hl, $c608
	ld de, $a948
	ld bc, $00f6
	call CopyBytes
	call CloseSRAM
	ret
; 17020c

Function17020c: ; 17020c
	ld a, [de]
	inc de
	and a
	ret z

.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
; 170215

INCLUDE "misc/battle_tower_5c.asm"


Function17042c: ; 17042c
	ld hl, w3_d2be
	ld a, 7
.loop
	push af
	push hl
	ld c, 18
.loop2
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jr z, .empty
	cp $f
	jr nc, .exit_inner_loop
	push hl
	ld hl, Unknown_170470
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	pop hl
	cp b
	jr c, .exit_inner_loop
	jr z, .exit_inner_loop
	jr .next_iteration

.empty
	ld a, b
	cp $fc
	jr nc, .exit_inner_loop

.next_iteration
	dec c
	jr nz, .loop2
	jr .dont_copy

.exit_inner_loop
	pop de
	push de
	ld hl, Unknown_17047e
	ld bc, BATTLETOWER_TRAINERDATALENGTH
	call CopyBytes

.dont_copy
	pop hl
	ld de, $00e0
	add hl, de
	pop af
	dec a
	jr nz, .loop
	ret
; 170470

Unknown_170470:
	db $12, $24, $45, $45, $42, $42, $45, $42, $27, $27, $45, $27, $42, $24

Unknown_17047e:
	db $03, $04, $05, $08
	db $03, $05, $0e, $06
	db $03, $02, $00, $00
	db $39, $07, $07, $04
	db $00, $05, $04, $07
	db $01, $05, $00, $00
	db $0f, $05, $14, $07
	db $05, $05, $11, $0c
	db $0c, $06, $06, $04


CopyBTTrainer_FromBT_OT_TowBT_OTTemp: ; 1704a2
; copy the BattleTower-Trainer data that lies at 'BT_OTTrainer' to 'wBT_OTTemp'
	ld a, [rSVBK]
	push af
	ld a, $3 ; BANK(BT_OTTrainer)
	ld [rSVBK], a

	ld hl, BT_OTTrainer ; $d100
	ld de, wBT_OTTemp ; $c608
	ld bc, BATTLE_TOWER_STRUCT_LENGTH
	call CopyBytes

	pop af
	ld [rSVBK], a

	ld a, BANK(sSaveType)
	call GetSRAMBank
	ld a, $2
	ld [sSaveType], a
	ld hl, sNrOfBeatenBattleTowerTrainers
	inc [hl]
	call CloseSRAM
SkipBattleTowerTrainer: ; 1704c9
	ret
; 1704ca

Function1704ca: ; 1704ca
	ld a, [$be46]
	cp $7
	jr c, .asm_1704d3
	ld a, $6

.asm_1704d3
	ld hl, $afce
	ld de, -$e0
.asm_1704d9
	and a
	jr z, .asm_1704e0
	add hl, de
	dec a
	jr .asm_1704d9

.asm_1704e0
	ret
; 1704e1

Function1704e1: ; 1704e1
	call SpeechTextBox
	call FadeToMenu
	call Function17021e
	call Function1704f1
	call ReturnToCallingMenu
	ret
; 1704f1

Function1704f1: ; 1704f1
	call ClearBGPalettes
	call ClearSprites
	call ClearScreen
.asm_1704fa
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_17050f
	call Function170510
	callba ReloadMapPart
	jr .asm_1704fa

.asm_17050f
	ret
; 170510

Function170510: ; 170510
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_17051f
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 17051f

Jumptable_17051f: ; 17051f
	dw Function170525
	dw Function170571
	dw Function170577
; 170525

Function170525: ; 170525
	ld a, $5
	call GetSRAMBank

	ld hl, $a89c
	ld de, StringBuffer3
	ld bc, $0016
	call CopyBytes

	ld hl, $a8b2
	ld de, $c608
	ld bc, $0096
	call CopyBytes

	call CloseSRAM
	hlcoord 1, 1
	ld de, StringBuffer3
	call PlaceString
	hlcoord 1, 3
	ld de, String_170676
	call PlaceString
	hlcoord 4, 3
	ld de, StringBuffer4
	call PlaceString
	hlcoord 8, 3
	ld de, String_17067a
	call PlaceString
	call Function1705b7
	call Function1705f0
	jr Function1705b2


Function170571:
	call SetPalettes
	call Function1705b2


Function170577:
	ld hl, hJoyPressed
	ld a, [hl]
	and $1
	jr nz, .asm_1705ac
	ld a, [hl]
	and $2
	jr nz, .asm_1705ac
	ld a, [hl]
	and $40
	jr nz, .asm_17058f
	ld a, [hl]
	and $80
	jr nz, .asm_17059d
	ret

.asm_17058f
	ld a, [wcf64]
	and a
	ret z
	sub $f
	ld [wcf64], a
	call Function1705f0
	ret

.asm_17059d
	ld a, [wcf64]
	cp $3c
	ret z
	add $f
	ld [wcf64], a
	call Function1705f0
	ret

.asm_1705ac
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function1705b2:
	ld hl, wJumptableIndex
	inc [hl]
	ret
; 1705b7

Function1705b7: ; 1705b7
	hlcoord 0, 4
	ld a, $79
	ld [hli], a
	ld c, $12
.asm_1705bf
	ld a, $7a
	ld [hli], a
	dec c
	jr nz, .asm_1705bf
	ld a, $7b
	ld [hli], a
	ld de, $0014
	ld c, $c
.asm_1705cd
	ld a, $7c
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_1705cd
	ld a, $7d
	ld [hli], a
	ld c, $12
.asm_1705d9
	ld a, $7a
	ld [hli], a
	dec c
	jr nz, .asm_1705d9
	ld a, $7e
	ld [hl], a
	ld de, $ffec
	add hl, de
	ld c, $c
.asm_1705e8
	ld a, $7c
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_1705e8
	ret
; 1705f0

Function1705f0: ; 1705f0
	call Function17064b
	call Function17065d
	ld a, $50
	ld [wcd4e], a
	ld hl, $c608
	ld a, [wcf64]
	ld c, a
	xor a
	ld b, a
	add hl, bc
	push hl
	pop bc
	hlcoord 1, 6
	ld a, $6
.asm_17060c
	push af
	push hl
	ld a, $3
.asm_170610
	push af
	ld de, wcd49
	ld a, [bc]
	and a
	jr z, .asm_170625
	ld a, $5
.asm_17061a
	push af
	ld a, [bc]
	ld [de], a
	inc bc
	inc de
	pop af
	dec a
	jr nz, .asm_17061a
	jr .asm_170631

.asm_170625
	ld a, $5
.asm_170627
	push af
	ld a, $e3
	ld [de], a
	inc de
	inc bc
	pop af
	dec a
	jr nz, .asm_170627

.asm_170631
	ld de, wcd49
	push bc
	call PlaceString
	ld de, $0006
	add hl, de
	pop bc
	pop af
	dec a
	jr nz, .asm_170610
	pop hl
	ld de, $0028
	add hl, de
	pop af
	dec a
	jr nz, .asm_17060c
	ret
; 17064b

Function17064b: ; 17064b
	hlcoord 1, 5
	xor a
	ld b, $c
.asm_170651
	ld c, $12
.asm_170653
	ld [hli], a
	dec c
	jr nz, .asm_170653
rept 2
	inc hl
endr
	dec b
	jr nz, .asm_170651
	ret
; 17065d

Function17065d: ; 17065d
	ld a, [wcf64]
	and a
	jr z, .asm_170669
	hlcoord 18, 5
	ld a, $61
	ld [hl], a

.asm_170669
	ld a, [wcf64]
	cp $3c
	ret z
	hlcoord 18, 16
	ld a, $ee
	ld [hl], a
	ret
; 170676

String_170676: ; 170676
	db "ルーム@"
; 17067a

String_17067a: ; 17067a
	db "れきだいりーダーいちらん@"
; 170687

BattleTowerAction: ; 170687
	ld a, [ScriptVar]
	ld e, a
	ld d, 0
	ld hl, .jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 170696


.jumptable: ; 170696 (5c:4696)
	dw Function17075f ; 0x00
	dw Function170788 ; 0x01
	dw Function170778 ; 0x02
	dw Function170799 ; 0x03
	dw Function17079d ; 0x04
	dw Function1707ac ; 0x05
	dw Function1707f4 ; 0x06
	dw Function170868 ; 0x07
	dw Function170881 ; 0x08
	dw Function17089a ; 0x09
	dw Function1708b1 ; 0x0a
	dw CheckMobileEventIndex ; 0x0b
	dw Function1708c8 ; 0x0c
	dw Function1708f0 ; 0x0d
	dw Function17093c ; 0x0e
	dw Function1709aa ; 0x0f
	dw Function1709bb ; 0x10
	dw Function170a9c ; 0x11
	dw Function170aa0 ; 0x12
	dw Function170aaf ; 0x13
	dw Function170abe ; 0x14
	dw Function170ad7 ; 0x15
	dw Function170807 ; 0x16
	dw Function17081d ; 0x17
	dw Function170ae8 ; 0x18
	dw Function170b16 ; 0x19
	dw ResetBattleTowerTrainersSRAM ; 0x1a
	dw Function1706ee ; 0x1b
	dw Function17071b ; 0x1c
	dw Function170729 ; 0x1d
	dw Function17073e ; 0x1e
	dw Function170737 ; 0x1f


; Reset the save memory for BattleTower-Trainers (Counter and all 7 TrainerBytes)
ResetBattleTowerTrainersSRAM: ; 1706d6 (5c:46d6) BattleTowerAction $1a
	ld a, BANK(sBTTrainers)
	call GetSRAMBank

	ld a, $ff
	ld hl, sBTTrainers
	ld bc, BATTLETOWER_NROFTRAINERS
	call ByteFill

	xor a
	ld [sNrOfBeatenBattleTowerTrainers], a

	call CloseSRAM

	ret

Function1706ee: ; 1706ee (5c:46ee)
	ld a, BANK(sbe50)
	call GetSRAMBank

	ld a, [sbe50]
	call CloseSRAM
	ld [ScriptVar], a
	ld hl, NumItems
	ld a, [hli]
	cp $14
	ret c
	ld b, $14
	ld a, [ScriptVar]
	ld c, a
.asm_170709
	ld a, [hli]
	cp c
	jr nz, .asm_170711
	ld a, [hl]
	cp $5f
	ret c
.asm_170711
	inc hl
	dec b
	jr nz, .asm_170709
	ld a, $12
	ld [ScriptVar], a
	ret

Function17071b: ; 17071b (5c:471b)
	ld a, BANK(sSaveType)
	call GetSRAMBank
	ld a, $3
	ld [sSaveType], a
	call CloseSRAM
	ret

Function170729: ; 170729 (5c:4729)
	ld a, BANK(sSaveType)
	call GetSRAMBank
	ld a, $4
	ld [sSaveType], a
	call CloseSRAM
	ret

Function170737: ; 170737 (5c:4737)
	callba SaveOptions
	ret

Function17073e: ; 17073e (5c:473e)
	call Random
	ld a, [hRandomAdd]
	and $7
	cp $6
	jr c, .asm_17074b
	sub $6
.asm_17074b
	add $1a
	cp $1e
	jr z, Function17073e
	push af
	ld a, BANK(sbe50)
	call GetSRAMBank
	pop af
	ld [sbe50], a
	call CloseSRAM
	ret

Function17075f: ; 17075f (5c:475f)
	call Function17089a
	ld a, [ScriptVar]
	and a
	ret z
	ld a, BANK(sbe4f)
	call GetSRAMBank
	ld a, [sbe4f]
	and $2
	ld [ScriptVar], a
	call CloseSRAM
	ret

Function170778: ; 170778 (5c:4778)
	ld hl, sSaveType
	ld a, BANK(sSaveType)
	call GetSRAMBank
	ld a, [hl]
	ld [ScriptVar], a
	call CloseSRAM
	ret

Function170788: ; 170788 (5c:4788)
	ld a, BANK(sbe4f)
	call GetSRAMBank
	ld a, [sbe4f]
	or $2
	ld [sbe4f], a
	call CloseSRAM
	ret

Function170799: ; 170799 (5c:4799)
	ld c, $1
	jr asm_17079f

Function17079d: ; 17079d (5c:479d)
	ld c, $0
asm_17079f: ; 17079f (5c:479f)
	ld a, BANK(sSaveType)
	call GetSRAMBank
	ld a, c
	ld [sSaveType], a
	call CloseSRAM
	ret

Function1707ac: ; 1707ac (5c:47ac)
	ld a, $5
	call GetSRAMBank
	ld a, [$aa8c]
	ld b, a
	ld a, [$be46]
	ld [ScriptVar], a
	call CloseSRAM
	and a
	ret z
	ld a, b
	cp $2
	jr nc, .asm_1707ef
	push bc
	call UpdateTime
	pop bc
	ld a, $5
	call GetSRAMBank
	ld a, [$aa8b]
	call CloseSRAM
	ld c, a
	ld a, [CurDay]
	sub c
	jr c, .asm_1707e5
	cp $8
	jr nc, .asm_1707ef
	ld a, b
	and a
	jr nz, .asm_1707ef
	ret
.asm_1707e5
	ld hl, CurDay
	ld a, $8c
	sub c
	add [hl]
	cp $8
	ret c
.asm_1707ef
	ld a, $8
	ld [ScriptVar], a

Function1707f4: ; 1707f4 (5c:47f4)
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$be46], a
	ld [$aa8b], a
	ld [$aa8c], a
	call CloseSRAM
	ret

Function170807: ; 170807 (5c:4807)
	call UpdateTime
	ld a, $5
	call GetSRAMBank
	ld a, [CurDay]
	ld [$b2f9], a
	xor a
	ld [$b2fa], a
	call CloseSRAM
	ret

Function17081d: ; 17081d (5c:481d)
	xor a
	ld [ScriptVar], a
	ld a, $5
	call GetSRAMBank
	ld a, [$b2f9]
	ld c, a
	ld a, [$b2fa]
	ld b, a
	call CloseSRAM
	cp $2
	jr nc, .asm_170853
	push bc
	call UpdateTime
	pop bc
	ld a, [CurDay]
	sub c
	jr c, .asm_170849
	cp $b
	jr nc, .asm_170853
	ld a, b
	and a
	jr nz, .asm_170853
	ret
.asm_170849
	ld hl, CurDay
	ld a, $8c
	sub c
	add [hl]
	cp $b
	ret c
.asm_170853
	ld a, $1
	ld [ScriptVar], a
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$b2f9], a
	ld [$b2fa], a
	call CloseSRAM
	ret

Function170868: ; 170868 (5c:4868)
	ld a, BANK(sbe47)
	call GetSRAMBank
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, [wd000 + $800]
	ld [sbe47], a
	pop af
	ld [rSVBK], a
	call CloseSRAM
	ret

Function170881: ; 170881 (5c:4881)
	ld a, BANK(sbe47)
	call GetSRAMBank
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld a, [sbe47]
	ld [wd000 + $800], a
	pop af
	ld [rSVBK], a
	call CloseSRAM
	ret

Function17089a: ; 17089a
	ld a, [wSaveFileExists]
	and a
	jr z, .asm_1708ad
	callba Function14bcb
	jr z, .asm_1708ab
	xor a
	jr .asm_1708ad

.asm_1708ab
	ld a, $1

.asm_1708ad
	ld [ScriptVar], a
	ret
; 1708b1


Function1708b1: ; 1708b1 (5c:48b1)
	xor a
	ld [MusicFade], a
	call MaxVolume
	ret

CheckMobileEventIndex: ; 1708b9 (5c:48b9) something to do with GS Ball
	ld a, BANK(sMobileEventIndex)
	call GetSRAMBank
	ld a, [sMobileEventIndex]
	ld [ScriptVar], a
	call CloseSRAM
	ret

Function1708c8: ; 1708c8 (5c:48c8)
	call UpdateTime
	ld a, $5
	call GetSRAMBank
	ld a, [CurDay]
	ld [$aa8b], a
	xor a
	ld [$aa8c], a
	ld a, [$aa5d]
	cp $2
	jr nc, .asm_1708ec
	ld a, [CurDay]
	ld [$aa48], a
	ld a, $1
	ld [$aa47], a
.asm_1708ec
	call CloseSRAM
	ret

Function1708f0: ; 1708f0 (5c:48f0)
	xor a
	ld [ScriptVar], a
	call UpdateTime
	ld a, $5
	call GetSRAMBank
	ld a, [$aa48]
	ld c, a
	ld a, [$aa47]
	call CloseSRAM
	and a
	ret z
	ld hl, CurDay
	ld a, c
	cp [hl]
	jr nz, Function170923
	ld a, $5
	call GetSRAMBank
	ld a, [$aa5d]
	call CloseSRAM
	cp $5
	ret c
	ld a, $1
	ld [ScriptVar], a
	ret


Function170923: ; 170923
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$aa48], a
	ld [$aa47], a
	ld hl, $aa5d
	ld bc, $0011
	call ByteFill
	call CloseSRAM
	ret
; 17093c


Function17093c: ; 17093c (5c:493c)
	xor a
	ld [ScriptVar], a
	ld a, EGG_TICKET
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	ret nc
	ld a, [PartyCount]
	ld b, 0
	ld c, a
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp EGG
	jr nz, .not_egg
	push hl
	ld hl, PartyMonOT ; wddff (aliases: PartyMonOT)
	ld de, $6
	ld a, b
	and a
	jr z, .skip
.loop2
	add hl, de
	dec a
	jr nz, .loop2
.skip
	ld de, String_1709a4
	ld a, $6
.asm_17096e
	push af
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	jr nz, .asm_17099d
	pop af
	dec a
	jr nz, .asm_17096e
rept 4
	dec hl
endr
	ld a, $50
rept 2
	ld [hli], a
endr
	pop hl
	ld a, EGG_TICKET
	ld [CurItem], a
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	ld a, $ff
	ld [wd107], a
	ld hl, NumItems
	call TossItem
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_17099d
	pop af
	pop hl
.not_egg
	inc b
	dec c
	jr nz, .loop
	ret
; 1709a4 (5c:49a4)

String_1709a4: ; 1709a4
	db "なぞナゾ@@"

Function1709aa: ; 1709aa (5c:49aa)
	ld a, [rSVBK]
	push af
	ld a, BANK(w3_d090)
	ld [rSVBK], a
	ld a, [w3_d090]
	ld [ScriptVar], a
	pop af
	ld [rSVBK], a
	ret

Function1709bb: ; 1709bb (5c:49bb)
	xor a
	ld [ScriptVar], a
	ld a, $5
	call GetSRAMBank
	ld a, [$a800]
	call CloseSRAM
	cp 6
	jr nc, .invalid
	ld e, a
	ld d, 0
	ld hl, Jumptable_1709e7
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.invalid
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$a800], a
	call CloseSRAM
	ret
; 1709e7 (5c:49e7)

Jumptable_1709e7: ; 1709e7
	dw Function170a00
	dw Function170a00
	dw Function1709f3
	dw Function1709f3
	dw Function170a01
	dw Function170a33
; 1709f3

Function1709f3: ; 1709f3
	ld a, $5
	call GetSRAMBank
	ld a, $1
	ld [$a800], a
	call CloseSRAM

Function170a00: ; 170a00
	ret
; 170a01

Function170a01: ; 170a01
	ld a, $5
	call GetSRAMBank
	ld hl, $b023
	ld de, $c608
	ld bc, $0069
	call CopyBytes
	ld a, [$a825]
	ld [wcd30], a
	ld a, [$a826]
	ld [wcd31], a
	call CloseSRAM
	callba Function11b6b4
	callba Function17d0f3
	ld a, $1
	ld [ScriptVar], a
	ret
; 170a33

Function170a33: ; 170a33
	ld a, $0
	call GetSRAMBank
	ld hl, wRTC
	ld de, $c608
	ld bc, $0004
	call CopyBytes
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	ld hl, $b08c
	ld de, $c608
	ld c, $4
.asm_170a54
	ld a, [de]
	inc de
	cp [hl]
	jr nz, .asm_170a78
	inc hl
	dec c
	jr nz, .asm_170a54
	call CloseSRAM
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetMapTrigger
	ld a, d
	or e
	jr z, .asm_170a72
	ld a, [de]
	and a
	ret nz

.asm_170a72
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_170a78
	call CloseSRAM
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$a800], a
	call CloseSRAM
	ld [ScriptVar], a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetMapTrigger
	ld a, d
	or e
	jr z, .asm_170a9b
	xor a
	ld [de], a

.asm_170a9b
	ret
; 170a9c

Function170a9c: ; 170a9c (5c:4a9c)
	ld c, $0
	jr asm_170aa2

Function170aa0: ; 170aa0 (5c:4aa0)
	ld c, $1
asm_170aa2: ; 170aa2 (5c:4aa2)
	ld a, $5
	call GetSRAMBank
	ld a, c
	ld [$aa8d], a
	call CloseSRAM
	ret

Function170aaf: ; 170aaf (5c:4aaf)
	ld a, $5
	call GetSRAMBank
	ld a, [$aa8d]
	ld [ScriptVar], a
	call CloseSRAM
	ret

Function170abe: ; 170abe (5c:4abe)
	call Function17089a
	ld a, [ScriptVar]
	and a
	ret z
	ld a, BANK(sbe4f)
	call GetSRAMBank
	ld a, [sbe4f]
	and $1
	ld [ScriptVar], a
	call CloseSRAM
	ret

Function170ad7: ; 170ad7 (5c:4ad7)
	ld a, BANK(sbe4f)
	call GetSRAMBank
	ld a, [sbe4f]
	or $1
	ld [sbe4f], a
	call CloseSRAM
	ret

Function170ae8: ; 170ae8 (5c:4ae8)
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb]
	call CloseSRAM
	ld c, $a
	call SimpleDivide
	ld a, b
	ld [wcd4f], a
	xor a
	ld [ScriptVar], a
	callba Function119d93
	ret nc
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb]
	call CloseSRAM
	ld [ScriptVar], a
	ret

Function170b16: ; 170b16 (5c:4b16)
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb]
	call CloseSRAM
	ld c, 10
	call SimpleDivide
	ld a, b
	ld [wcd4f], a
	xor a
	ld [ScriptVar], a
	callba Function119dd1
	ret nc
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb]
	call CloseSRAM
	ld [ScriptVar], a
	ret

Function_LoadOpponentTrainerAndPokemonsWithOTSprite: ; 0x170b44
	callba Function_LoadOpponentTrainerAndPokemons
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, wd10a
	ld a, [hl]
	dec a
	ld c, a
	ld b, $0
	pop af
	ld [rSVBK], a
	ld hl, Unknown_170b90
	add hl, bc
	ld a, [hl]
	ld [wcd49], a

; Load sprite of the opponent trainer
; because s/he is chosen randomly and appears out of nowhere
	ld a, [ScriptVar]
	dec a
	sla a
	ld e, a
	sla a
	sla a
	sla a
	ld c, a
	ld b, $0
	ld d, $0
	ld hl, MapObjects
	add hl, bc
	inc hl
	ld a, [wcd49]
	ld [hl], a
	ld hl, UsedSprites
	add hl, de
	ld [hli], a
	ld [hUsedSpriteIndex], a
	ld a, [hl]
	ld [hUsedSpriteTile], a
	callba GetUsedSprite
	ret
; 170b90

Unknown_170b90:
	db $12, $13, $14, $15, $18, $17
	db $16, $19, $04, $05, $11, $01
	db $1c, $1b, $21, $1e, $1a, $1d
	db $1f, $3c, $20, $27, $27, $27
	db $28, $0a, $23, $24, $2a, $2b
	db $35, $40, $2a, $29, $22, $25
	db $3a, $2b, $24, $49, $2b, $07
	db $2c, $2d, $4a, $0d, $4b, $3a
	db $2b, $41, $35, $27, $28, $27
	db $36, $3e, $30, $2c, $2d, $3d
	db $26, $2e, $06, $07, $43, $36

Function170bd2: ; 170bd2
	ret
; 170bd3

SpecialCheckForBattleTowerRules: ; 170bd3
	callba CheckForBattleTowerRules
	jr c, .asm_170bde
	xor a
	jr .asm_170be0

.asm_170bde
	ld a, $1

.asm_170be0
	ld [ScriptVar], a
	ret
; 170be4
Function170be4: ; 170be4
	ld a, $5
	call GetSRAMBank
	xor a
	ld hl, $a894
	ld bc, $0008
	call ByteFill
	call CloseSRAM
	ret
; 170bf7

Clears5_a89a: ; 170bf7
	ld a, $5
	call GetSRAMBank
	ld hl, $a89a
	xor a
	ld [hli], a
	ld [hl], a
	call CloseSRAM
	ret
; 170c06

Function170c06: ; 170c06
	ld a, $5
	call GetSRAMBank
	ld hl, $a894
	ld a, [wBattleResult]
	and a
	jr nz, .asm_170c15
	inc [hl]

.asm_170c15
rept 2
	inc hl
endr
	ld a, [$a89b]
	add [hl]
	ld [hld], a
	ld a, [$a89a]
	adc [hl]
	ld [hli], a
	jr nc, .asm_170c27
	ld a, $ff
	ld [hld], a
	ld [hli], a

.asm_170c27
	inc hl
	push hl
	ld de, 0
	xor a
	ld [wd265], a
.asm_170c30
	ld hl, PartyMon1HP
	ld a, [wd265]
	call GetPartyLocation
	ld a, [hli]
	ld b, a
	ld c, [hl]
rept 2
	inc hl
endr
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	push de
	pop hl
	add hl, bc
	push hl
	pop de
	jr c, .asm_170c58
	ld a, [wd265]
	inc a
	ld [wd265], a
	cp $3
	jr c, .asm_170c30
	jr .asm_170c5b

.asm_170c58
	ld de, -1

.asm_170c5b
	pop hl
	inc hl
	ld a, e
	add [hl]
	ld [hld], a
	ld a, d
	adc [hl]
	ld [hli], a
	jr nc, .asm_170c69
	ld a, $ff
	ld [hld], a
	ld [hli], a

.asm_170c69
	inc hl
	push hl
	ld b, $0
	ld c, $0
.asm_170c6f
	ld hl, PartyMon1HP
	ld a, b
	push bc
	call GetPartyLocation
	pop bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_170c7d
	inc c

.asm_170c7d
	inc b
	ld a, b
	cp $3
	jr c, .asm_170c6f
	pop hl
	ld a, [hl]
	add c
	ld [hl], a
	call CloseSRAM
	ret
; 170c8b

Function170c8b: ; 170c8b
	ld hl, LastPlayerCounterMove
	ld b, $5
.asm_170c90
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec b
	jr nz, .asm_170c90
	ret
; 170c98

CheckBTMonMovesForErrors: ; 170c98
	ld c, BATTLETOWER_NROFPKMNS
	ld hl, wBT_OTTempPkmn1Moves
.loop
	push hl
	ld a, [hl]
	cp NUM_ATTACKS + 1
	jr c, .okay
	ld a, POUND
	ld [hl], a

.okay
	inc hl
	ld b, NUM_MOVES - 1
.loop2
	ld a, [hl]
	and a
	jr z, .loop3
	cp NUM_ATTACKS + 1
	jr c, .next

.loop3
	xor a
	ld [hl], a
	inc hl
	dec b
	jr nz, .loop3
	jr .done

.next
	inc hl
	dec b
	jr nz, .loop2

.done
	pop hl
	ld de, PARTYMON_STRUCT_LENGTH + PKMN_NAME_LENGTH
	add hl, de
	dec c
	jr nz, .loop
	ret
; 170cc6

Function170cc6: ; 170cc6
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, LZ_170d16
	ld de, wd000
	call Decompress
	ld a, $1
	ld [rVBK], a
	ld de, wd000
	ld hl, VTiles0
	lb bc, $6, $c1
	call Get2bpp
	xor a
	ld [rVBK], a
	ld hl, LZ_1715a4
	ld de, wd000
	call Decompress
	ld de, wMapPals
	ld hl, VTiles0
	lb bc, $6, $53
	call Get2bpp
	pop af
	ld [rSVBK], a
	ret
; 170d02

Function170d02: ; 170d02
	ld a, $1
	ld [rVBK], a
	ld de, GFX_171848
	ld hl, VTiles1 tile $41
	lb bc, BANK(GFX_171848), $18
	call Get2bpp
	xor a
	ld [rVBK], a
	ret
; 170d16

LZ_170d16:
INCBIN "gfx/unknown/170d16.2bpp.lz"

LZ_1715a4:
INCBIN "gfx/unknown/1715a4.2bpp.lz"

GFX_171848:
INCBIN "gfx/unknown/171848.2bpp"

Function1719c8: ; 1719c8 (5c:59c8)
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function1719d6
	pop af
	ld [hInMenu], a
	ret

Function1719d6: ; 1719d6 (5c:59d6)
	callba Function1183cb
	call Function1719ed
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	call Function171a11
	pop af
	ld [rSVBK], a
	ret

Function1719ed: ; 1719ed (5c:59ed)
	xor a
	ld [wcd49], a
	ld [wcd4a], a
	dec a
	ld [wcd4b], a
	call ClearBGPalettes
	call ClearSprites
	callba Function171d2b
	callba ReloadMapPart
	callba Function8cf53
	ret

Function171a11: ; 171a11 (5c:5a11)
	call JoyTextDelay
	ld a, [wcd49]
	bit 7, a
	jr nz, .asm_171a2c
	call Function171a36
	callba Function8cf69
	callba ReloadMapPart
	jr Function171a11
.asm_171a2c
	callba Function8cf53
	call ClearSprites
	ret

Function171a36: ; 171a36 (5c:5a36)
	ld a, [wcd49]
	ld e, a
	ld d, 0
	ld hl, Jumptable_171a45
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_171a45: ; 171a45 (5c:5a45)
	dw Function171a95
	dw Function171ac9
	dw Function171a5d
	dw Function171ad7
	dw Function171a5d
	dw Function171aec
	dw Function171b4b
	dw Function171b85
	dw Function171bcc
	dw Function171c2c
	dw Function171c39
	dw Function171c41


Function171a5d: ; 171a5d (5c:5a5d)
	ld a, [wc821]
	bit 1, a
	jr nz, .asm_171a6a
	bit 0, a
	ret nz
	jp Function171c66
.asm_171a6a
	ld a, $0
	call Function3e32
	ld [wc300], a
	ld a, l
	ld [wc301], a
	ld a, h
	ld [wc302], a
	ld a, $a
	call Function3e32
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba Function118452
	pop af
	ld [rSVBK], a
	ld a, $a
	ld [wcd49], a
	ret

Function171a95: ; 171a95 (5c:5a95)
	callba Function171ccd
	hlcoord 2, 8
	ld de, String_171aa7
	call PlaceString
	jp Function171c66
; 171aa7 (5c:5aa7)

String_171aa7: ; 171aa7
	db   "モバイルアダプタに"
	next "せつぞく しています"
	next "しばらく おまちください"
	db   "@"
; 171ac9

Function171ac9: ; 171ac9 (5c:5ac9)
	ld de, wcd81
	ld hl, $5c
	ld a, $2
	call Function3e32
	jp Function171c66

Function171ad7: ; 171ad7 (5c:5ad7)
	xor a
	ld hl, $c608
	ld bc, $66
	call ByteFill
	ld de, $c608
	ld a, $c
	call Function3e32
	jp Function171c66

Function171aec: ; 171aec (5c:5aec)
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba Function118452
	pop af
	ld [rSVBK], a
	hlcoord 2, 6
	ld a, $8
.asm_171b01
	push af
	push hl
	xor a
	ld bc, $10
	call ByteFill
	pop hl
	ld de, $14
	add hl, de
	pop af
	dec a
	jr nz, .asm_171b01
	hlcoord 2, 7
	ld a, $3
	ld de, $c608
.asm_171b1b
	push af
	push hl
	ld a, [de]
	and a
	jr z, .asm_171b34
	ld a, [wcd4b]
	inc a
	ld [wcd4b], a
	push hl
	call Function171b42
	pop hl
	ld bc, $ffec
	add hl, bc
	call Function171b42
.asm_171b34
	pop hl
	ld bc, $14
rept 3
	add hl, bc
endr
	pop af
	dec a
	jr nz, .asm_171b1b
	jp Function171c66

Function171b42: ; 171b42 (5c:5b42)
	ld a, [de]
	inc de
	and a
	ret z
	sub $20
	ld [hli], a
	jr Function171b42

Function171b4b: ; 171b4b (5c:5b4b)
	depixel 8, 2
	ld a, SPRITE_ANIM_INDEX_1D
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld a, $8
	ld [hl], a
	depixel 8, 19
	ld a, SPRITE_ANIM_INDEX_1D
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld a, $9
	ld [hl], a
	depixel 17, 14, 2, 0
	ld a, SPRITE_ANIM_INDEX_1D
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld a, $a
	ld [hl], a
	ld a, $4
	ld [wcd23], a
	ld a, $8
	ld [wcd24], a
	jp Function171c66

Function171b85: ; 171b85 (5c:5b85)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and $2
	jp nz, Function171b9f
	ld a, [hl]
	and $1
	jp nz, Function171bbd
	ld a, [hl]
	and $40
	jr nz, asm_171ba5
	ld a, [hl]
	and $80
	jr nz, asm_171baf
	ret

Function171b9f: ; 171b9f (5c:5b9f)
	ld a, $80
	ld [wcd49], a
	ret
asm_171ba5: ; 171ba5 (5c:5ba5)
	ld a, [wcd4a]
	and a
	ret z
	dec a
	ld [wcd4a], a
	ret
asm_171baf: ; 171baf (5c:5baf)
	ld a, [wcd4b]
	ld c, a
	ld a, [wcd4a]
	cp c
	ret z
	inc a
	ld [wcd4a], a
	ret

Function171bbd: ; 171bbd (5c:5bbd)
	call PlayClickSFX
	ld a, $8
	ld [wcd23], a
	xor a
	ld [wcd24], a
	jp Function171c66

Function171bcc: ; 171bcc (5c:5bcc)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and $2
	jp nz, Function171bdc
	ld a, [hl]
	and $1
	jp nz, Function171beb
	ret

Function171bdc: ; 171bdc (5c:5bdc)
	ld a, $4
	ld [wcd23], a
	ld a, $8
	ld [wcd24], a
	ld hl, wcd49
	dec [hl]
	ret

Function171beb: ; 171beb (5c:5beb)
	ld a, $5
	call GetSRAMBank
	ld a, [wcd4a]
	ld [$aa4a], a
	call CloseSRAM
	ld hl, MenuDataHeader_171c6b
	call LoadMenuDataHeader
	call MenuBox
	call MenuBoxCoord2Tile
	callba ReloadMapPart
	hlcoord 1, 14
	ld de, String_171c73
	call PlaceString
	ld a, [wcd4a]
	cp $2
	jr z, .asm_171c1f
	ld a, $8
	jr .asm_171c21
.asm_171c1f
	ld a, $c
.asm_171c21
	ld [wcd24], a
	ld a, $1e
	ld [wcd4c], a
	call Function171c66

Function171c2c: ; 171c2c (5c:5c2c)
	ld hl, wcd4c
	dec [hl]
	ret nz
	call ExitMenu
	call ClearBGPalettes
	jr asm_171c60

Function171c39: ; 171c39 (5c:5c39)
	ld a, $28
	ld [wcd4c], a
	call Function171c66

Function171c41: ; 171c41 (5c:5c41)
	ld hl, wcd4c
	dec [hl]
	ret nz
	call ClearBGPalettes
	callba Function106462
	callba Function106464
	ld a, $2
	ld [wc303], a
	callba Function17f555
asm_171c60: ; 171c60 (5c:5c60)
	ld a, $80
	ld [wcd49], a
	ret

Function171c66: ; 171c66 (5c:5c66)
	ld hl, wcd49
	inc [hl]
	ret
; 171c6b (5c:5c6b)

MenuDataHeader_171c6b: ; 171c6b
	db $40 ; flags
	db 12,  0 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 0 ; default option
; 171c73

String_171c73: ; 171c73
	db   "モバイルセンターを けってい"
	next "しました@"
; 171c87

Function171c87: ; 171c87 (5c:5c87)
	call DisableLCD
	ld hl, GFX_171db1
	ld de, VTiles2 tile $00
	ld bc, $6e0
	call CopyBytes
	ld hl, LZ_172abd
	ld de, VTiles0 tile $00
	call Decompress
	call EnableLCD
	ld hl, Tilemap_172491
	decoord 0, 0
	ld bc, $168
	call CopyBytes
	ld hl, Attrmap_1727ed
	decoord 0, 0, AttrMap
	ld bc, $168
	call CopyBytes
	hlcoord 3, 2
	ld de, String_172e31
	call PlaceString
	hlcoord 3, 16
	ld de, String_172e3f
	call PlaceString
	ret

Function171ccd: ; 171ccd (5c:5ccd)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_171d71
	ld de, wMapPals
	ld bc, $40
	call CopyBytes
	ld hl, EngineBuffer5
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hl], a
	call SetPalettes
	pop af
	ld [rSVBK], a
	ret

Function171cf0: ; 171cf0 (5c:5cf0)
	xor a
	hlcoord 4, 15
rept 2
	ld [hli], a
endr
	ld a, [wcd4b]
	xor $1
	ld [wcd4b], a
	and a
	jr nz, .asm_171d16
	ld hl, Tilemap_17251d
	decoord 0, 7
	ld bc, $8c
	call CopyBytes
	hlcoord 3, 16
	ld de, String_172e3f
	jp PlaceString
.asm_171d16
	ld hl, Tilemap_1725f9
	decoord 0, 7
	ld bc, $8c
	call CopyBytes
	hlcoord 3, 16
	ld de, String_172e4e
	jp PlaceString

Function171d2b: ; 171d2b (5c:5d2b)
	call DisableLCD
	ld hl, GFX_171db1
	ld de, VTiles2 tile $00
	ld bc, $6e0
	call CopyBytes
	ld hl, LZ_172abd
	ld de, VTiles0 tile $00
	call Decompress
	call EnableLCD
	ld hl, Tilemap_172685
	decoord 0, 0
	ld bc, $168
	call CopyBytes
	ld hl, Attrmap_172955
	decoord 0, 0, AttrMap
	ld bc, $168
	call CopyBytes
	hlcoord 2, 2
	ld de, String_172e5d
	call PlaceString
	hlcoord 14, 16
	ld de, String_172e58
	call PlaceString
	ret
; 171d71 (5c:5d71)

Palette_171d71:
	RGB  0,  0,  0
	RGB  3,  0,  0
	RGB  5,  0,  0
	RGB 31, 31, 29
	RGB  0,  2, 10
	RGB  2, 10, 21
	RGB  0,  0,  0
	RGB 10, 26, 31
	RGB  0,  0,  0
	RGB  0,  7,  8
	RGB 31,  8,  0
	RGB  1, 17, 15
	RGB 31, 16,  0
	RGB 31, 22,  0
	RGB 31, 27,  0
	RGB 31, 31,  0
	RGB 31, 18,  6
	RGB  0,  3,  0
	RGB  0,  9,  0
	RGB  0, 12,  0
	RGB  0, 16,  0
	RGB  0, 22,  0
	RGB  0, 25,  0
	RGB  0, 27,  0
	RGB  5,  5, 16
	RGB  8, 19, 28
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 31, 29
	RGB 21, 21, 20
	RGB 11, 11, 10
	RGB  0,  0,  0
GFX_171db1:
INCBIN "gfx/unknown/171db1.2bpp"
Tilemap_172491:
INCBIN "gfx/unknown/172491.tilemap"
Tilemap_17251d:
INCBIN "gfx/unknown/17251d.tilemap"
Tilemap_1725f9:
INCBIN "gfx/unknown/1725f9.tilemap"
Tilemap_172685:
INCBIN "gfx/unknown/172685.tilemap"
Attrmap_1727ed:
INCBIN "gfx/unknown/1727ed.attrmap"
Attrmap_172955:
INCBIN "gfx/unknown/172955.attrmap"
LZ_172abd:
INCBIN "gfx/pokedex/slowpoke.2bpp.lz"

String_172e31: ; 172e31
	db "パスワード", $1f, "いれてください@"
String_172e3f: ; 172e3f
	db "きりかえ やめる  けってい@"
String_172e4e: ; 172e4e
	db "きりかえ やめる  "
String_172e58:
	db "けってい@"
String_172e5d: ; 172e5d
	db "せつぞくする モバイルセンターを"
	next "えらんで ください@"
; 172e78


Function172e78: ; 172e78 (5c:6e78)
	ld a, $7f
	hlcoord 0, 0
	ld bc, $168
	call ByteFill
	ld a, $7
	hlcoord 0, 0, AttrMap
	ld bc, $168
	call ByteFill
	call DisableLCD
	ld hl, GFX_172f1f
	ld de, VTiles2 tile $00
	ld bc, $610
	call CopyBytes
	call EnableLCD
	ld hl, Tilemap_1733af
	decoord 0, 0
	ld bc, $168
	call CopyBytes
	ld hl, Attrmap_173517
	decoord 0, 0, AttrMap
	ld bc, $168
	call CopyBytes
	ret
; 172eb9 (5c:6eb9)

Function172eb9:
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_172edf
	ld de, wMapPals
	ld bc, $40
	call CopyBytes
	ld hl, Palette_172edf
	ld de, BGPals
	ld bc, $40
	call CopyBytes
	call SetPalettes
	pop af
	ld [rSVBK], a
	ret
; 172edf (5c:6edf)

Palette_172edf:
	RGB  5, 12, 17
	RGB 31, 31, 31
	RGB 18, 25, 28
	RGB 10, 17, 21
	RGB  6, 13, 18
	RGB 31, 31, 31
	RGB 20, 26, 28
	RGB 12, 19, 23
	RGB  3, 10, 16
	RGB 31, 31, 31
	RGB  6, 13, 18
	RGB 20, 26, 28
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  5,  5, 16
	RGB  8, 19, 28
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

GFX_172f1f:
INCBIN "gfx/unknown/172f1f.2bpp"

Tilemap_1733af:
IF DEF(CORRUPT_TILES)
INCBIN "gfx/unknown/1733af_corrupt.tilemap"
ELSE
INCBIN "gfx/unknown/1733af.tilemap"
ENDC

Attrmap_173517:
INCBIN "gfx/unknown/173517.attrmap"
