	const_def
	const SEER_INTRO
	const SEER_CANT_TELL
	const SEER_MET_AT
	const SEER_TIME_LEVEL
	const SEER_TRADED
	const SEER_CANCEL
	const SEER_EGG
	const SEER_LEVEL_ONLY

	const_def
	const SEERACTION_MET
	const SEERACTION_TRADED
	const SEERACTION_CANT_TELL_1
	const SEERACTION_CANT_TELL_2
	const SEERACTION_LEVEL_ONLY

SpecialPokeSeer: ; 4f0bc
	ld a, SEER_INTRO
	call PrintSeerText
	call JoyWaitAorB

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
	ld a, [wSeerAction]
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
	ld a, MON_CAUGHTDATA
	call GetPartyParamLocation
	ld a, [hli]
	ld [wSeerCaughtData], a
	ld a, [hld]
	ld [wSeerCaughtGender], a
	or [hl]
	jr z, .error

	ld a, SEERACTION_TRADED
	ld [wSeerAction], a

	ld a, MON_ID
	call GetPartyParamLocation
	ld a, [PlayerID]
	cp [hl]
	jr nz, .traded

	inc hl
	ld a, [PlayerID + 1]
	; cp [hl]
	jr nz, .traded

	ld a, SEERACTION_MET
	ld [wSeerAction], a

.traded
	call GetCaughtLevel
	call GetCaughtOT
	call GetCaughtName
	call GetCaughtTime
	call GetCaughtLocation
	and a
	ret

.error
	ld a, SEERACTION_CANT_TELL_1
	ld [wSeerAction], a
	ret
; 4f176

GetCaughtName: ; 4f176
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call AddNTimes
	ld de, wSeerNickname
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ret
; 4f18c

GetCaughtLevel: ; 4f18c
	ld a, "@"
	ld hl, wSeerCaughtLevelString
	ld bc, 4
	call ByteFill

	; caught level
	; Limited to between 1 and 63 for some reason.
	ld a, [wSeerCaughtData]
	and $3f
	jr z, .unknown
	cp 1 ; hatched from an egg
	jr nz, .print
	ld a, EGG_LEVEL ; egg hatch level

.print
	ld [wSeerCaughtLevel], a
	ld hl, wSeerCaughtLevelString
	ld de, wSeerCaughtLevel
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	ret

.unknown
	ld de, wSeerCaughtLevelString
	ld hl, .unknown_level
	ld bc, 4
	call CopyBytes
	ret
; 4f1c1

.unknown_level ; 4f1c1
	db "???@"
; 4f1c5

GetCaughtTime: ; 4f1c5
	ld a, [wSeerCaughtData]
	and $c0
	jr z, .none

	rlca
	rlca
	dec a
	ld hl, .times
	call GetNthString
	ld d, h
	ld e, l
	ld hl, wSeerTimeOfDay
	call CopyName2
	and a
	ret

.none
	ld de, wSeerTimeOfDay
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
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
; 4f202

.unknown ; 4f202
	db "Unknown@"
; 4f20a

GetCaughtLocation: ; 4f20a
	ld a, [wSeerCaughtGender]
	and $7f
	jr z, .Unknown
	cp $7f
	jr z, .event
	cp $7e
	jr z, .fail
	ld e, a
	callba GetLandmarkName
	ld hl, StringBuffer1
	ld de, wSeerCaughtLocation
	ld bc, 17
	call CopyBytes
	and a
	ret

.Unknown:
	ld de, wSeerCaughtLocation
	jp UnknownCaughtData

.event
	ld a, SEERACTION_LEVEL_ONLY
	ld [wSeerAction], a
	scf
	ret

.fail
	ld a, SEERACTION_CANT_TELL_2
	ld [wSeerAction], a
	scf
	ret
; 4f242

GetCaughtOT: ; 4f242
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	call AddNTimes
	ld de, wSeerOTName
	ld bc, NAME_LENGTH
	call CopyBytes

; this routine is useless in Western localizations
	ld hl, .male
	ld a, [wSeerCaughtGender]
	bit 7, a
	jr z, .got_grammar
	ld hl, .female

.got_grammar
	ld de, wSeerOTNameGrammar
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
	add hl, de
	add hl, de
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
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [wSeerCaughtLevel]
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
	ld hl, MON_CAUGHTGENDER
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
