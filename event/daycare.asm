Special_DayCareMan: ; 166d6
	ld hl, wDaycareMan
	bit 0, [hl]
	jr nz, .asm_166fe
	ld hl, wDaycareMan
	ld a, $0
	call Function1678f
	jr c, .asm_16724
	call Function16798
	jr c, .asm_16721
	callba Functionde2a
	ld hl, wDaycareMan
	set 0, [hl]
	call Function167f6
	call Function16a3b
	ret

.asm_166fe
	callba Functione698
	ld hl, wBreedMon1Nick
	call Function1686d
	call Function16807
	jr c, .asm_16721
	callba Functiondd21
	call Function16850
	ld hl, wDaycareMan
	res 0, [hl]
	res 5, [hl]
	jr .asm_16724

.asm_16721
	call Function1689b

.asm_16724
	ld a, $13
	call Function1689b
	ret
; 1672a

Special_DayCareLady: ; 1672a
	ld hl, wDaycareLady
	bit 0, [hl]
	jr nz, .asm_16752
	ld hl, wDaycareLady
	ld a, $2
	call Function16781
	jr c, .asm_1677b
	call Function16798
	jr c, .asm_16778
	callba Functionde37
	ld hl, wDaycareLady
	set 0, [hl]
	call Function167f6
	call Function16a3b
	ret

.asm_16752
	callba Functione6b3
	ld hl, wBreedMon2Nick
	call Function1686d
	call Function16807
	jr c, .asm_16778
	callba Functiondd42
	call Function16850
	ld hl, wDaycareLady
	res 0, [hl]
	ld hl, wDaycareMan
	res 5, [hl]
	jr .asm_1677b

.asm_16778
	call Function1689b

.asm_1677b
	ld a, $13
	call Function1689b
	ret
; 16781

Function16781: ; 16781
	bit 7, [hl]
	jr nz, .asm_16788
	set 7, [hl]
	inc a

.asm_16788
	call Function1689b
	call YesNoBox
	ret
; 1678f

Function1678f: ; 1678f
	set 7, [hl]
	call Function1689b
	call YesNoBox
	ret
; 16798

Function16798: ; 16798
	ld a, [PartyCount]
	cp 2
	jr c, .asm_167e5
	ld a, 4
	call Function1689b
	ld b, 6
	callba Function5001d
	jr c, .asm_167dd
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_167e1
	callba CheckCurPartyMonFainted
	jr c, .asm_167e9
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, [hl]
	callba ItemIsMail
	jr c, .asm_167ed
	ld hl, PartyMonNicknames
	ld a, [CurPartyMon]
	call GetNick
	and a
	ret

.asm_167dd
	ld a, $12
	scf
	ret

.asm_167e1
	ld a, $6
	scf
	ret

.asm_167e5
	ld a, $7
	scf
	ret

.asm_167e9
	ld a, $8
	scf
	ret

.asm_167ed
	ld a, $a
	scf
	ret
; 167f1

UnknownText_0x167f1: ; 0x167f1
	;
	text_jump UnknownText_0x1bdaa7
	db "@"
; 0x167f6

Function167f6: ; 167f6
	ld a, $5
	call Function1689b
	ld a, [CurPartySpecies]
	call PlayCry
	ld a, $9
	call Function1689b
	ret
; 16807

Function16807: ; 16807
	ld a, [StringBuffer2 + 1]
	and a
	jr nz, .asm_16819
	ld a, $f
	call Function1689b
	call YesNoBox
	jr c, .asm_16844
	jr .asm_1682d

.asm_16819
	ld a, $b
	call Function1689b
	call YesNoBox
	jr c, .asm_16844
	ld a, $c
	call Function1689b
	call YesNoBox
	jr c, .asm_16844

.asm_1682d
	ld de, Money
	ld bc, StringBuffer2 + 2
	callba CompareMoney
	jr c, .asm_16848
	ld a, [PartyCount]
	cp $6
	jr nc, .asm_1684c
	and a
	ret

.asm_16844
	ld a, $12
	scf
	ret

.asm_16848
	ld a, $11
	scf
	ret

.asm_1684c
	ld a, $10
	scf
	ret
; 16850

Function16850: ; 16850
	ld bc, StringBuffer2 + 2
	ld de, Money
	callba TakeMoney
	ld a, $d
	call Function1689b
	ld a, [CurPartySpecies]
	call PlayCry
	ld a, $e
	call Function1689b
	ret
; 1686d

Function1686d: ; 1686d
	ld a, b
	ld [StringBuffer2], a
	ld a, d
	ld [StringBuffer2 + 1], a
	ld de, StringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, 0
	ld bc, $64
	ld a, [StringBuffer2 + 1]
	call AddNTimes
	ld de, $64
	add hl, de
	xor a
	ld [StringBuffer2 + 2], a
	ld a, h
	ld [StringBuffer2 + 3], a
	ld a, l
	ld [StringBuffer2 + 4], a
	ret
; 1689b

Function1689b: ; 1689b
	ld e, a
	ld d, 0
	ld hl, TextTable_168aa
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret
; 168aa

TextTable_168aa: ; 168aa
	dw UnknownText_0x168d2
	dw UnknownText_0x168d7
	dw UnknownText_0x168dc
	dw UnknownText_0x168e1
	dw UnknownText_0x168e6
	dw UnknownText_0x168ff
	dw UnknownText_0x168f0
	dw UnknownText_0x168eb
	dw UnknownText_0x168fa
	dw UnknownText_0x16904
	dw UnknownText_0x168f5
	dw UnknownText_0x16909
	dw UnknownText_0x1690e
	dw UnknownText_0x16913
	dw UnknownText_0x16918
	dw UnknownText_0x1691d
	dw UnknownText_0x16922
	dw UnknownText_0x16927
	dw UnknownText_0x1692c
	dw UnknownText_0x16931
; 168d2

UnknownText_0x168d2: ; 0x168d2
	; I'm the DAY-CARE MAN. Want me to raise a #MON?
	text_jump UnknownText_0x1bdaa9
	db "@"
; 0x168d7

UnknownText_0x168d7: ; 0x168d7
	; I'm the DAY-CARE MAN. Do you know about EGGS? I was raising #MON with my wife, you see. We were shocked to find an EGG! How incredible is that? So, want me to raise a #MON?
	text_jump UnknownText_0x1bdad8
	db "@"
; 0x168dc

UnknownText_0x168dc: ; 0x168dc
	; I'm the DAY-CARE LADY. Should I raise a #MON for you?
	text_jump UnknownText_0x1bdb85
	db "@"
; 0x168e1

UnknownText_0x168e1: ; 0x168e1
	; I'm the DAY-CARE LADY. Do you know about EGGS? My husband and I were raising some #MON, you see. We were shocked to find an EGG! How incredible could that be? Should I raise a #MON for you?
	text_jump UnknownText_0x1bdbbb
	db "@"
; 0x168e6

UnknownText_0x168e6: ; 0x168e6
	; What should I raise for you?
	text_jump UnknownText_0x1bdc79
	db "@"
; 0x168eb

UnknownText_0x168eb: ; 0x168eb
	; Oh? But you have just one #MON.
	text_jump UnknownText_0x1bdc97
	db "@"
; 0x168f0

UnknownText_0x168f0: ; 0x168f0
	; Sorry, but I can't accept an EGG.
	text_jump UnknownText_0x1bdcb8
	db "@"
; 0x168f5

UnknownText_0x168f5: ; 0x168f5
	; Remove MAIL before you come see me.
	text_jump UnknownText_0x1bdcda
	db "@"
; 0x168fa

UnknownText_0x168fa: ; 0x168fa
	; If you give me that, what will you battle with?
	text_jump UnknownText_0x1bdcff
	db "@"
; 0x168ff

UnknownText_0x168ff: ; 0x168ff
	; OK. I'll raise your @ .
	text_jump UnknownText_0x1bdd30
	db "@"
; 0x16904

UnknownText_0x16904: ; 0x16904
	; Come back for it later.
	text_jump UnknownText_0x1bdd4b
	db "@"
; 0x16909

UnknownText_0x16909: ; 0x16909
	; Are we geniuses or what? Want to see your @ ?
	text_jump UnknownText_0x1bdd64
	db "@"
; 0x1690e

UnknownText_0x1690e: ; 0x1690e
	; Your @ has grown a lot. By level, it's grown by @ . If you want your #MON back, it will cost ¥@ .
	text_jump UnknownText_0x1bdd96
	db "@"
; 0x16913

UnknownText_0x16913: ; 0x16913
	; Perfect! Here's your #MON.
	text_jump UnknownText_0x1bde04
	db "@"
; 0x16918

UnknownText_0x16918: ; 0x16918
	; got back @ .
	text_jump UnknownText_0x1bde1f
	db "@"
; 0x1691d

UnknownText_0x1691d: ; 0x1691d
	; Huh? Back already? Your @ needs a little more time with us. If you want your #MON back, it will cost ¥100.
	text_jump UnknownText_0x1bde32
	db "@"
; 0x16922

UnknownText_0x16922: ; 0x16922
	; You have no room for it.
	text_jump UnknownText_0x1bdea2
	db "@"
; 0x16927

UnknownText_0x16927: ; 0x16927
	; You don't have enough money.
	text_jump UnknownText_0x1bdebc
	db "@"
; 0x1692c

UnknownText_0x1692c: ; 0x1692c
	; Oh, fine then.
	text_jump UnknownText_0x1bded9
	db "@"
; 0x16931

UnknownText_0x16931: ; 0x16931
	; Come again.
	text_jump UnknownText_0x1bdee9
	db "@"
; 0x16936

Special_DayCareManOutside: ; 16936
	ld hl, wDaycareMan
	bit 6, [hl]
	jr nz, Function16949
	ld hl, UnknownText_0x16944
	call PrintText
	ret

UnknownText_0x16944: ; 0x16944
	; Not yet…
	text_jump UnknownText_0x1bdef6
	db "@"
; 0x16949

Function16949: ; 16949
	ld hl, UnknownText_0x16993
	call PrintText
	call YesNoBox
	jr c, .asm_1697c
	ld a, [PartyCount]
	cp PARTY_LENGTH
	jr nc, .asm_16987
	call Function169ac
	ld hl, wDaycareMan
	res 6, [hl]
	call Function16a3b
	ld hl, UnknownText_0x16998
	call PrintText
	ld de, SFX_GET_EGG_FROM_DAYCARE_LADY
	call PlaySFX
	ld c, 120
	call DelayFrames
	ld hl, UnknownText_0x1699d
	jr .asm_1697f

.asm_1697c
	ld hl, UnknownText_0x169a2

.asm_1697f
	call PrintText
	xor a
	ld [ScriptVar], a
	ret

.asm_16987
	ld hl, UnknownText_0x169a7
	call PrintText
	ld a, $1
	ld [ScriptVar], a
	ret
; 16993

UnknownText_0x16993: ; 0x16993
	; Ah, it's you! We were raising your #MON, and my goodness, were we surprised! Your #MON had an EGG! We don't know how it got there, but your #MON had it. You want it?
	text_jump UnknownText_0x1bdf00
	db "@"
; 0x16998

UnknownText_0x16998: ; 0x16998
	; received the EGG!
	text_jump UnknownText_0x1bdfa5
	db "@"
; 0x1699d

UnknownText_0x1699d: ; 0x1699d
	; Take good care of it.
	text_jump UnknownText_0x1bdfba
	db "@"
; 0x169a2

UnknownText_0x169a2: ; 0x169a2
	; Well then, I'll keep it. Thanks!
	text_jump UnknownText_0x1bdfd1
	db "@"
; 0x169a7

UnknownText_0x169a7: ; 0x169a7
	; You have no room in your party. Come back later.
	text_jump UnknownText_0x1bdff2
	db "@"
; 0x169ac

Function169ac: ; 169ac
	ld a, [wEggMonLevel]
	ld [CurPartyLevel], a
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nc, .asm_16a2f
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, EGG
	ld [hli], a
	ld a, [wEggMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	ld a, $ff
	ld [hl], a
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call Function16a31
	ld hl, wEggNick
	call CopyBytes
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	call Function16a31
	ld hl, wEggOT
	call CopyBytes
	ld hl, PartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call Function16a31
	ld hl, wEggMon
	ld bc, wEggMonEnd - wEggMon
	call CopyBytes
	call GetBaseData
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, MON_ID + 1
	add hl, bc
	push hl
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	push bc
	ld b, $0
	predef CalcPkmnStats
	pop bc
	ld hl, MON_HP
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	and a
	ret

.asm_16a2f
	scf
	ret
; 16a31

Function16a31: ; 16a31
	ld a, [PartyCount]
	dec a
	call AddNTimes
	ld d, h
	ld e, l
	ret
; 16a3b

Function16a3b: ; 16a3b
	ld a, [wDaycareLady]
	bit 0, a
	ret z
	ld a, [wDaycareMan]
	bit 0, a
	ret z
	callab Function16e1d
	ld a, [wd265]
	and a
	ret z
	inc a
	ret z
	ld hl, wDaycareMan
	set 5, [hl]
.asm_16a59
	call Random
	cp 150
	jr c, .asm_16a59
	ld [wStepsToEgg], a
	jp Function16a66
; 16a66

Function16a66: ; 16a66
	xor a
	ld hl, wEggMon
	ld bc, wEggMonEnd - wEggMon
	call ByteFill
	ld hl, wEggNick
	ld bc, PKMN_NAME_LENGTH
	call ByteFill
	ld hl, wEggOT
	ld bc, NAME_LENGTH
	call ByteFill
	ld a, [wBreedMon1DVs]
	ld [TempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [TempMonDVs + 1], a
	ld a, [wBreedMon1Species]
	ld [CurPartySpecies], a
	ld a, $3
	ld [MonType], a
	ld a, [wBreedMon1Species]
	cp DITTO
	ld a, $1
	jr z, .asm_16ab6
	ld a, [wBreedMon2Species]
	cp DITTO
	ld a, $0
	jr z, .asm_16ab6
	callba GetGender
	ld a, $0
	jr z, .asm_16ab6
	inc a

.asm_16ab6
	ld [wDittoInDaycare], a
	and a
	ld a, [wBreedMon1Species]
	jr z, .asm_16ac2
	ld a, [wBreedMon2Species]

.asm_16ac2
	ld [CurPartySpecies], a
	callab GetPreEvolution
	callab GetPreEvolution
	ld a, EGG_LEVEL
	ld [CurPartyLevel], a

	ld a, [CurPartySpecies]
	cp NIDORAN_F
	jr nz, .asm_16ae8
	call Random
	cp $80
	ld a, NIDORAN_F
	jr c, .asm_16ae8
	ld a, NIDORAN_M
.asm_16ae8
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	ld [wEggMonSpecies], a

	call GetBaseData
	ld hl, wEggNick
	ld de, String_16be0
	call CopyName2
	ld hl, PlayerName
	ld de, wEggOT
	ld bc, NAME_LENGTH
	call CopyBytes
	xor a
	ld [wEggMonItem], a
	ld de, wEggMonMoves
	xor a
	ld [Buffer1], a
	predef FillMoves
	callba Function170bf
	ld hl, wEggMonID
	ld a, [PlayerID]
	ld [hli], a
	ld a, [PlayerID + 1]
	ld [hl], a
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	ld hl, wEggMonExp
	ld a, [hMultiplicand]
	ld [hli], a
	ld a, [$ffb5]
	ld [hli], a
	ld a, [$ffb6]
	ld [hl], a
	xor a
	ld b, $a
	ld hl, wEggMonStatExp
.asm_16b46
	ld [hli], a
	dec b
	jr nz, .asm_16b46
	ld hl, wEggMonDVs
	call Random
	ld [hli], a
	ld [TempMonDVs], a
	call Random
	ld [hld], a
	ld [TempMonDVs + 1], a
	ld de, wBreedMon1DVs
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .asm_16b98
	ld de, wBreedMon2DVs
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .asm_16b98
	ld a, $3
	ld [MonType], a
	push hl
	callba GetGender
	pop hl
	ld de, wBreedMon1DVs
	ld bc, wBreedMon2DVs
	jr c, .asm_16bab
	jr z, .asm_16b90
	ld a, [wDittoInDaycare]
	and a
	jr z, .asm_16b98
	ld d, b
	ld e, c
	jr .asm_16b98

.asm_16b90
	ld a, [wDittoInDaycare]
	and a
	jr nz, .asm_16b98
	ld d, b
	ld e, c

.asm_16b98
	ld a, [de]
	inc de
	and $f
	ld b, a
	ld a, [hl]
	and $f0
	add b
	ld [hli], a
	ld a, [de]
	and $7
	ld b, a
	ld a, [hl]
	and $f8
	add b
	ld [hl], a

.asm_16bab
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, wEggMonMoves
	ld de, wEggMonPP
	predef FillPP
	ld hl, wd050
	ld de, StringBuffer1
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [BaseEggSteps]
	ld hl, wEggMonHappiness
	ld [hli], a
	xor a
rept 2
	ld [hli], a
endr
	ld [hl], a
	ld a, [CurPartyLevel]
	ld [wEggMonLevel], a
	ret
; 16be0

String_16be0: ; 16be0
	db "EGG@"
; 16be4
