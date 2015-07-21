SEER_INTRO      EQU 0
SEER_CANT_TELL  EQU 1
SEER_MET_AT     EQU 2
SEER_TIME_LEVEL EQU 3
SEER_TRADED     EQU 4
SEER_CANCEL     EQU 5
SEER_EGG        EQU 6
SEER_LEVEL_ONLY EQU 7


SpecialPokeSeer: ; 4f0bc
	ld a, SEER_INTRO
	call PrintSeerText
	call Functiona36

	ld b, $6
	callba SelectMonFromParty
	jr c, .cancel

	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg

	call IsAPokemon
	jr c, .no_mon

	call ReadCaughtData
	call SeerAction
	ret

.cancel
	ld a, SEER_CANCEL
	call PrintSeerText
	ret

.no_mon
	ret

.egg
	ld a, SEER_EGG
	call PrintSeerText
	ret
; 4f0ee


SeerAction: ; 4f0ee
	ld a, [wd002]
	ld hl, SeerActions
	rst JumpTable
	ret
; 4f0f6

SeerActions: ; 4f0f6
	dw SeerAction0
	dw SeerAction1
	dw SeerAction2
	dw SeerAction3
	dw SeerAction4
; 4f100

SeerAction0: ; 4f100
	ld a, SEER_MET_AT
	call PrintSeerText
	ld a, SEER_TIME_LEVEL
	call PrintSeerText
	call SeerAdvice
	ret
; 4f10e

SeerAction1: ; 4f10e
	call GetCaughtOT
	ld a, SEER_TRADED
	call PrintSeerText
	ld a, SEER_TIME_LEVEL
	call PrintSeerText
	call SeerAdvice
	ret
; 4f11f

SeerAction2: ; 4f11f
	ld a, SEER_CANT_TELL
	call PrintSeerText
	ret
; 4f125

SeerAction3: ; 4f125
	ld a, SEER_CANT_TELL
	call PrintSeerText
	ret
; 4f12b

SeerAction4: ; 4f12b
	ld a, SEER_LEVEL_ONLY
	call PrintSeerText
	call SeerAdvice
	ret
; 4f134

ReadCaughtData: ; 4f134
	ld a, PartyMon1CaughtData - PartyMon1
	call GetPartyParamLocation
	ld a, [hli]
	ld [wd03b], a
	ld a, [hld]
	ld [wd03b + 1], a
	or [hl]
	jr z, .asm_4f170

	ld a, 1
	ld [wd002], a

	ld a, PartyMon1ID - PartyMon1
	call GetPartyParamLocation
	ld a, [PlayerID]
	cp [hl]
	jr nz, .asm_4f15f

	inc hl
	ld a, [PlayerID + 1]
	jr nz, .asm_4f15f

	ld a, 0
	ld [wd002], a

.asm_4f15f
	call GetCaughtLevel
	call GetCaughtOT
	call GetCaughtName
	call GetCaughtTime
	call GetCaughtLocation
	and a
	ret

.asm_4f170
	ld a, 2
	ld [wd002], a
	ret
; 4f176

GetCaughtName: ; 4f176
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call AddNTimes
	ld de, wd003
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ret
; 4f18c

GetCaughtLevel: ; 4f18c
	ld a, "@"
	ld hl, wd036
	ld bc, 4
	call ByteFill

	; caught level
	ld a, [wd03b]
	and $3f
	jr z, .unknown
	cp 1 ; hatched from an egg
	jr nz, .print
	ld a, 5 ; egg hatch level

.print
	ld [wd038 + 2], a
	ld hl, wd036
	ld de, wd038 + 2
	ld bc, $4103
	call PrintNum
	ret

.unknown
	ld de, wd036
	ld hl, .unknown_level
	ld bc, 4
	call CopyBytes
	ret
; 4f1c1

.unknown_level ; 4f1c1
	db "???@"
; 4f1c5

GetCaughtTime: ; 4f1c5
	ld a, [wd03b]
	and $c0
	jr z, .none

	rlca
	rlca
	dec a
	ld hl, .times
	call GetNthString
	ld d, h
	ld e, l
	ld hl, wd01f
	call CopyName2
	and a
	ret

.none
	ld de, wd01f
	call UnknownCaughtData
	ret
; 4f1e6

.times ; 4f1e6
	db "Morning@"
	db "Day@"
	db "Night@"
; 4f1f8

UnknownCaughtData: ; 4f1f8
	ld hl, .unknown
	ld bc, $000b
	call CopyBytes
	ret
; 4f202

.unknown ; 4f202
	db "Unknown@"
; 4f20a

GetCaughtLocation: ; 4f20a
	ld a, [wd03b + 1]
	and $7f
	jr z, .asm_4f22e
	cp $7f
	jr z, .asm_4f234
	cp $7e
	jr z, .asm_4f23b
	ld e, a
	callba GetLandmarkName
	ld hl, StringBuffer1
	ld de, wd00e
	ld bc, $0011
	call CopyBytes
	and a
	ret

.asm_4f22e
	ld de, wd00e
	jp UnknownCaughtData

.asm_4f234
	ld a, $4
	ld [wd002], a
	scf
	ret

.asm_4f23b
	ld a, $3
	ld [wd002], a
	scf
	ret
; 4f242

GetCaughtOT: ; 4f242
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	call AddNTimes
	ld de, wd02a
	ld bc, $000b
	call CopyBytes
	ld hl, .male
	ld a, [wd03b + 1]
	bit 7, a
	jr z, .asm_4f264
	ld hl, .female

.asm_4f264
	ld de, wd034 + 1
	ld a, "@"
	ld [de], a
	ret
; 4f26b

.male ; 4f26b
	db "@"
.female ; 4f26c
	db "@"
; 4f26d

PrintSeerText: ; 4f26d
	ld e, a
	ld d, 0
	ld hl, SeerTexts
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret
; 4f27c

SeerTexts: ; 4f27c
	dw SeerIntroText
	dw SeerCantTellText
	dw SeerMetAtText
	dw SeerTimeLevelText
	dw SeerTradedText
	dw SeerCancelText
	dw SeerEggText
	dw SeerLevelOnlyText
; 4f28c

SeerIntroText: ; 0x4f28c
	; I see all. I know all… Certainly, I know of your #MON!
	text_jump UnknownText_0x1c475f
	db "@"
; 0x4f291

SeerCantTellText: ; 0x4f291
	; Whaaaat? I can't tell a thing! How could I not know of this?
	text_jump UnknownText_0x1c4797
	db "@"
; 0x4f296

SeerMetAtText: ; 0x4f296
	; Hm… I see you met @  here: @ !
	text_jump UnknownText_0x1c47d4
	db "@"
; 0x4f29b

SeerTimeLevelText: ; 0x4f29b
	; The time was @ ! Its level was @ ! Am I good or what?
	text_jump UnknownText_0x1c47fa
	db "@"
; 0x4f2a0

SeerTradedText: ; 0x4f2a0
	; Hm… @ came from @ in a trade? @ was where @ met @ !
	text_jump UnknownText_0x1c4837
	db "@"
; 0x4f2a5

SeerLevelOnlyText: ; 0x4f2a5
	; What!? Incredible! I don't understand how, but it is incredible! You are special. I can't tell where you met it, but it was at level @ . Am I good or what?
	text_jump UnknownText_0x1c487f
	db "@"
; 0x4f2aa

SeerEggText: ; 0x4f2aa
	; Hey! That's an EGG! You can't say that you've met it yet…
	text_jump UnknownText_0x1c491d
	db "@"
; 0x4f2af

SeerCancelText: ; 0x4f2af
	; Fufufu! I saw that you'd do nothing!
	text_jump UnknownText_0x1c4955
	db "@"
; 0x4f2b4


SeerAdvice: ; 4f2b4
	ld a, PartyMon1Level - PartyMon1
	call GetPartyParamLocation
	ld a, [wd038 + 2]
	ld c, a
	ld a, [hl]
	sub c
	ld c, a

	ld hl, SeerAdviceTexts
	ld de, 3
.next
	cp [hl]
	jr c, .print
	jr z, .print
	add hl, de
	jr .next

.print
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret
; 4f2d6

SeerAdviceTexts: ; 4f2d6
; level, text
	dbw 9,   SeerAdvice1
	dbw 29,  SeerAdvice2
	dbw 59,  SeerAdvice3
	dbw 89,  SeerAdvice4
	dbw 100, SeerAdvice5
	dbw 255, SeerAdvice1
; 4f2e8

SeerAdvice1: ; 0x4f2e8
	; Incidentally… It would be wise to raise your #MON with a little more care.
	text_jump UnknownText_0x1c497a
	db "@"
; 0x4f2ed

SeerAdvice2: ; 0x4f2ed
	; Incidentally… It seems to have grown a little. @  seems to be becoming more confident.
	text_jump UnknownText_0x1c49c6
	db "@"
; 0x4f2f2

SeerAdvice3: ; 0x4f2f2
	; Incidentally… @  has grown. It's gained much strength.
	text_jump UnknownText_0x1c4a21
	db "@"
; 0x4f2f7

SeerAdvice4: ; 0x4f2f7
	; Incidentally… It certainly has grown mighty! This @ must have come through numerous #MON battles. It looks brimming with confidence.
	text_jump UnknownText_0x1c4a5b
	db "@"
; 0x4f2fc

SeerAdvice5: ; 0x4f2fc
	; Incidentally… I'm impressed by your dedication. It's been a long time since I've seen a #MON as mighty as this @ . I'm sure that seeing @ in battle would excite anyone.
	text_jump UnknownText_0x1c4ae5
	db "@"
; 0x4f301


GetCaughtGender: ; 4f301
	ld hl, PartyMon1CaughtGender - PartyMon1
	add hl, bc

	ld a, [hl]
	and $7f
	jr z, .genderless
	cp $7f
	jr z, .genderless

	ld a, [hl]
	and $80
	jr nz, .male
	ld c, 1
	ret

.male
	ld c, 2
	ret

.genderless
	ld c, 0
	ret
; 4f31c
