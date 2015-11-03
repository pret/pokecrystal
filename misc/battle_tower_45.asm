BattleTowerBattle: ; 170215
	xor a
	ld [wJumptableIndex], a
	call Function17022c
	ret
; 17021d

Function17021d: ; 17021d
	ret
; 17021e

Function17021e: ; 17021e
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ret
; 17022c

Function17022c: ; 17022c
.loop
	call Jumpto_BattleTowerBattleFunction
	call DelayFrame
	ld a, [wJumptableIndex]
	cp $1
	jr nz, .loop
	ret
; 17023a

Jumpto_BattleTowerBattleFunction: ; 17023a
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_BattleTowerBattleFunctions
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 170249

Jumptable_BattleTowerBattleFunctions: ; 170249
	dw RunBattleTowerBattle
	dw SkipBattleTowerBattle
; 17024d

RunBattleTowerBattle: ; 17024d
	ld a, [Options]
	push af
	ld hl, Options
	set 6, [hl]
	ld a, [InBattleTowerBattle]
	push af
	or $1
	ld [InBattleTowerBattle], a
	xor a
	ld [wLinkMode], a
	callba Mobile_HealParty
	callba HealParty
	call Function1702b7
	call Function170bf7
	predef StartBattle
	callba LoadPokemonData
	callba HealParty
	ld a, [wBattleResult]
	ld [ScriptVar], a
	and a
	jr nz, .lost
	ld a, BANK(sNrOfBeatenBattleTowerTrainers)
	call GetSRAMBank
	ld a, [sNrOfBeatenBattleTowerTrainers]
	ld [wNrOfBeatenBattleTowerTrainers], a ; wcf64
	call CloseSRAM
	ld hl, StringBuffer3
	ld a, [wNrOfBeatenBattleTowerTrainers] ; wcf64
	add $f7
	ld [hli], a
	ld a, $50
	ld [hl], a

.lost
	pop af
	ld [InBattleTowerBattle], a
	pop af
	ld [Options], a
	ld a, $1
	ld [wJumptableIndex], a
	ret


Function1702b7: ; 1702b7
; Initialise the BattleTower-Trainer and his Pkmn
	call CopyBTTrainer_FromBT_OTrainer_TowBT_OTTempCopy
	ld de, wBT_OTTempCopy + wBT_OTTempCopy_Pkmn1Name ; $c643
	ld c, PKMN_NAME_LENGTH
	callba Function17d073
	jr nc, .asm_1702db

	ld a, [wBT_OTTempCopy + wBT_OTTempCopy_Pkmn1]
	ld [wd265], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, wBT_OTTempCopy + wBT_OTTempCopy_Pkmn1Name ; $c643
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.asm_1702db
	ld de, wBT_OTTempCopy + wBT_OTTempCopy_Pkmn2Name ; $c67e
	ld c, PKMN_NAME_LENGTH
	callba Function17d073
	jr nc, .asm_1702fc
	ld a, [wBT_OTTempCopy + wBT_OTTempCopy_Pkmn2] ; [$c64e]
	ld [wd265], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, wBT_OTTempCopy + wBT_OTTempCopy_Pkmn2Name ; $c67e
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.asm_1702fc
	ld de, wBT_OTTempCopy + wBT_OTTempCopy_Pkmn3Name ; $c686 + 51 = $c6b9
	ld c, PKMN_NAME_LENGTH
	callba Function17d073
	jr nc, .asm_17031d
	ld a, [wBT_OTTempCopy + wBT_OTTempCopy_Pkmn3] ; [$c689]
	ld [wd265], a
	call GetPokemonName
	ld l, e
	ld h, d
	ld de, wBT_OTTempCopy + wBT_OTTempCopy_Pkmn3Name ; $c686 + 51 = $c6b9
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.asm_17031d
	ld a, $50
	ld [wBT_OTTempCopy + wBT_OTTempCopy_45], a ; $c64d
	ld [wBT_OTTempCopy + wBT_OTTempCopy_80], a ; $c688
	ld [wBT_OTTempCopy + wBT_OTTempCopy_BB], a ; $c68a + 57 = $c6c3
	call Function170c98
	ld de, wBT_OTTempCopy
	ld c, $a
	callba Function17d073
	jr nc, .asm_17033d
	ld hl, String_170426
	jr .asm_170340

.asm_17033d
	ld hl, wBT_OTTempCopy ; 0xc608

.asm_170340
	ld de, wd26b
	ld bc, $000a
	call CopyBytes
	ld a, $50
	ld [de], a
	ld hl, wBT_OTTempCopy + wBT_OTTempCopy_TrainerClass
	ld a, [hli]
	ld [OtherTrainerClass], a
	ld a, $ea
	ld [BGMapBuffer], a
	ld a, $d3
	ld [wcd21], a

	; Copy Pkmn into Memory from the address in hl
	ld de, OTPartyMon1Species
	ld bc, OTPartyCount
	ld a, BATTLETOWER_NROFPKMNS		; Number of Pkmn the BattleTower-Trainer has
	ld [bc], a
	inc bc
.asm_170367
	push af
	ld a, [hl]
	ld [bc], a
	inc bc
	push bc
	ld bc, party_struct_length
	call CopyBytes
	push de
	ld a, [BGMapBuffer]
	ld e, a
	ld a, [wcd21]
	ld d, a
	ld bc, $000b
	call CopyBytes
	ld a, e
	ld [BGMapBuffer], a
	ld a, d
	ld [wcd21], a
	pop de
	pop bc
	pop af
	dec a
	and a
	jr nz, .asm_170367
	ld a, $ff
	ld [bc], a
	ret
; 170394

Function170394: ; 170394
	ld hl, $c608 + 11
	ld d, $3
.asm_170399
	push de
	push hl
	ld b, h
	ld c, l
	ld a, [hl]
	and a
	jr z, .asm_1703b1
	cp $ff
	jr z, .asm_1703b1
	cp $fe
	jr z, .asm_1703b1
	cp $fd
	jr z, .asm_1703b1
	cp $fc
	jr nz, .asm_1703b4

.asm_1703b1
	ld a, $eb
	ld [hl], a

.asm_1703b4
	ld [CurSpecies], a
	call GetBaseData
	ld a, $5
	call GetSRAMBank
	ld a, [$b2fb]
	call CloseSRAM
	ld e, a
	ld hl, $001f
	add hl, bc
	ld a, [hl]
	cp $2
	ld a, $2
	jr c, .asm_1703d6
	ld a, [hl]
	cp e
	jr c, .asm_1703d7
	ld a, e

.asm_1703d6
	ld [hl], a

.asm_1703d7
	ld [CurPartyLevel], a
	ld hl, $0002
	add hl, bc
	ld d, $3
	ld a, [hli]
	and a
	jr z, .asm_1703ea
	cp $fc
	jr nc, .asm_1703ea
	jr .asm_1703f4

.asm_1703ea
	dec hl
	ld a, $1
	ld [hli], a
	xor a
rept 2
	ld [hli], a
endr
	ld [hl], a
	jr .asm_1703ff

.asm_1703f4
	ld a, [hl]
	cp $fc
	jr c, .asm_1703fb
	ld [hl], $0

.asm_1703fb
	inc hl
	dec d
	jr nz, .asm_1703f4

.asm_1703ff
	ld hl, $0024
	add hl, bc
	ld d, h
	ld e, l
	push hl
	push de
	ld hl, $000a
	add hl, bc
	ld b, $1
	predef CalcPkmnStats
	pop de
	pop hl
rept 2
	dec de
endr
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	pop hl
	ld bc, $003b
	add hl, bc
	pop de
	dec d
	jp nz, .asm_170399
	ret
; 170426

String_170426: ; 170426
	db "CHRIS@"
; 17042c

Function17042c: ; 17042c
	ld hl, OTPartyMon2ID
	ld a, $7
.asm_170431
	push af
	push hl
	ld c, $12
.asm_170435
	ld a, [hli]
	ld b, a
	ld a, [hli]
	and a
	jr z, .asm_170451
	cp $f
	jr nc, .asm_17045b
	push hl
	ld hl, Unknown_170470
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	pop hl
	cp b
	jr c, .asm_17045b
	jr z, .asm_17045b
	jr .asm_170456

.asm_170451
	ld a, b
	cp $fc
	jr nc, .asm_17045b

.asm_170456
	dec c
	jr nz, .asm_170435
	jr .asm_170466

.asm_17045b
	pop de
	push de
	ld hl, Unknown_17047e
	ld bc, $0024
	call CopyBytes

.asm_170466
	pop hl
	ld de, $00e0
	add hl, de
	pop af
	dec a
	jr nz, .asm_170431
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


CopyBTTrainer_FromBT_OTrainer_TowBT_OTTempCopy: ; 1704a2
; copy the BattleTower-Trainer data that lies at 'BT_OTrainer' to 'wBT_OTTempCopy'
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, BT_OTrainer ; $d100
	ld de, wBT_OTTempCopy ; $c608
	ld bc, BT_OTrainerEnd - BT_OTrainer ; $e0 = $a + $1 + 3*$3b + $24
                                        ;	  = $a + $1 + BATTLETOWER_NROFPKMNS * (party_struct_length + PKMN_NAME_LENGTH) + BATTLETOWER_TRAINERDATALENGTH
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, BANK(s1_be45)
	call GetSRAMBank
	ld a, $2
	ld [s1_be45], a
	ld hl, sNrOfBeatenBattleTowerTrainers
	inc [hl]
	call CloseSRAM
SkipBattleTowerBattle: ; 1704c9
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
	call Function2b3c
	ret
; 1704f1

Function1704f1: ; 1704f1
	call WhiteBGMap
	call ClearSprites
	call ClearScreen
.asm_1704fa
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_17050f
	call Function170510
	callba Function104061
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
	dw Function1708b9 ; 0x0b
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
	ld a, BANK(s1_be45)
	call GetSRAMBank
	ld a, $3
	ld [s1_be45], a
	call CloseSRAM
	ret

Function170729: ; 170729 (5c:4729)
	ld a, BANK(s1_be45)
	call GetSRAMBank
	ld a, $4
	ld [s1_be45], a
	call CloseSRAM
	ret

Function170737: ; 170737 (5c:4737)
	callba SaveOptions
	ret

Function17073e: ; 17073e (5c:473e)
	call Random
	ld a, [hRandomAdd] ; $ff00+$e1
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
	ld hl, s1_be45
	ld a, BANK(s1_be45)
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
	ld a, BANK(s1_be45)
	call GetSRAMBank
	ld a, c
	ld [s1_be45], a
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
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $3
	ld [rSVBK], a ; $ff00+$70
	ld a, [wd000 + $800]
	ld [sbe47], a
	pop af
	ld [rSVBK], a ; $ff00+$70
	call CloseSRAM
	ret

Function170881: ; 170881 (5c:4881)
	ld a, BANK(sbe47)
	call GetSRAMBank
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $3
	ld [rSVBK], a ; $ff00+$70
	ld a, [sbe47]
	ld [wd000 + $800], a
	pop af
	ld [rSVBK], a ; $ff00+$70
	call CloseSRAM
	ret

Function17089a: ; 17089a
	ld a, [wcfcd]
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

Function1708b9: ; 1708b9 (5c:48b9)
	ld a, BANK(s1_be3c)
	call GetSRAMBank
	ld a, [s1_be3c]
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
.asm_170955
	ld a, [hli]
	cp EGG
	jr nz, .asm_17099f
	push hl
	ld hl, PartyMonOT ; wddff (aliases: PartyMonOT)
	ld de, $6
	ld a, b
	and a
	jr z, .asm_170969
.asm_170965
	add hl, de
	dec a
	jr nz, .asm_170965
.asm_170969
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
.asm_17099f
	inc b
	dec c
	jr nz, .asm_170955
	ret
; 1709a4 (5c:49a4)

String_1709a4: ; 1709a4
	db "なぞナゾ@@"

Function1709aa: ; 1709aa (5c:49aa)
	ld a, [rSVBK] ; $ff00+$70
	push af
	ld a, $3
	ld [rSVBK], a ; $ff00+$70
	ld a, [StringBuffer2 + 10]
	ld [ScriptVar], a
	pop af
	ld [rSVBK], a ; $ff00+$70
	ret

Function1709bb: ; 1709bb (5c:49bb)
	xor a
	ld [ScriptVar], a
	ld a, $5
	call GetSRAMBank
	ld a, [$a800]
	call CloseSRAM
	cp 6
	jr nc, .asm_1709da
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
.asm_1709da
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
	callba Function143c8
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
