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

PokeSeer:
	ld a, SEER_INTRO
	call PrintSeerText
	call JoyWaitAorB

	ld b, PARTY_LENGTH
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
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

SeerAction:
	ld a, [wSeerAction]
	ld hl, SeerActions
	rst JumpTable
	ret

SeerActions:
	dw SeerAction0
	dw SeerAction1
	dw SeerAction2
	dw SeerAction3
	dw SeerAction4

SeerAction0:
	ld a, SEER_MET_AT
	call PrintSeerText
	ld a, SEER_TIME_LEVEL
	call PrintSeerText
	call SeerAdvice
	ret

SeerAction1:
	call GetCaughtOT
	ld a, SEER_TRADED
	call PrintSeerText
	ld a, SEER_TIME_LEVEL
	call PrintSeerText
	call SeerAdvice
	ret

SeerAction2:
	ld a, SEER_CANT_TELL
	call PrintSeerText
	ret

SeerAction3:
	ld a, SEER_CANT_TELL
	call PrintSeerText
	ret

SeerAction4:
	ld a, SEER_LEVEL_ONLY
	call PrintSeerText
	call SeerAdvice
	ret

ReadCaughtData:
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
	ld a, [wPlayerID]
	cp [hl]
	jr nz, .traded

	inc hl
	ld a, [wPlayerID + 1]
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

GetCaughtName:
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld de, wSeerNickname
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ret

GetCaughtLevel:
	ld a, "@"
	ld hl, wSeerCaughtLevelString
	ld bc, 4
	call ByteFill

	; caught level
	; Limited to between 1 and 63 since it's a 6-bit quantity.
	ld a, [wSeerCaughtData]
	and CAUGHT_LEVEL_MASK
	jr z, .unknown
	cp CAUGHT_EGG_LEVEL ; egg marker value
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

.unknown_level
	db "???@"

GetCaughtTime:
	ld a, [wSeerCaughtData]
	and CAUGHT_TIME_MASK
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

.times
	db "Morning@"
	db "Day@"
	db "Night@"

UnknownCaughtData:
	ld hl, .unknown
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

.unknown
	db "Unknown@"

GetCaughtLocation:
	ld a, [wSeerCaughtGender]
	and CAUGHT_LOCATION_MASK
	jr z, .Unknown
	cp EVENT_LOCATION
	jr z, .event
	cp GIFT_LOCATION
	jr z, .fail
	ld e, a
	farcall GetLandmarkName
	ld hl, wStringBuffer1
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

GetCaughtOT:
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOT
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

.male
	db "@"
.female
	db "@"

PrintSeerText:
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

SeerTexts:
	dw SeerIntroText
	dw SeerCantTellText
	dw SeerMetAtText
	dw SeerTimeLevelText
	dw SeerTradedText
	dw SeerCancelText
	dw SeerEggText
	dw SeerLevelOnlyText

SeerIntroText:
	; I see all. I know all… Certainly, I know of your #MON!
	text_far UnknownText_0x1c475f
	text_end

SeerCantTellText:
	; Whaaaat? I can't tell a thing! How could I not know of this?
	text_far UnknownText_0x1c4797
	text_end

SeerMetAtText:
	; Hm… I see you met @  here: @ !
	text_far UnknownText_0x1c47d4
	text_end

SeerTimeLevelText:
	; The time was @ ! Its level was @ ! Am I good or what?
	text_far UnknownText_0x1c47fa
	text_end

SeerTradedText:
	; Hm… @ came from @ in a trade? @ was where @ met @ !
	text_far UnknownText_0x1c4837
	text_end

SeerLevelOnlyText:
	; What!? Incredible! I don't understand how, but it is incredible! You are special. I can't tell where you met it, but it was at level @ . Am I good or what?
	text_far UnknownText_0x1c487f
	text_end

SeerEggText:
	; Hey! That's an EGG! You can't say that you've met it yet…
	text_far UnknownText_0x1c491d
	text_end

SeerCancelText:
	; Fufufu! I saw that you'd do nothing!
	text_far UnknownText_0x1c4955
	text_end

SeerAdvice:
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

SeerAdviceTexts:
; level, text
	dbw 9,   SeerAdvice1
	dbw 29,  SeerAdvice2
	dbw 59,  SeerAdvice3
	dbw 89,  SeerAdvice4
	dbw 100, SeerAdvice5
	dbw 255, SeerAdvice1

SeerAdvice1:
	; Incidentally… It would be wise to raise your #MON with a little more care.
	text_far UnknownText_0x1c497a
	text_end

SeerAdvice2:
	; Incidentally… It seems to have grown a little. @  seems to be becoming more confident.
	text_far UnknownText_0x1c49c6
	text_end

SeerAdvice3:
	; Incidentally… @  has grown. It's gained much strength.
	text_far UnknownText_0x1c4a21
	text_end

SeerAdvice4:
	; Incidentally… It certainly has grown mighty! This @ must have come through numerous #MON battles. It looks brimming with confidence.
	text_far UnknownText_0x1c4a5b
	text_end

SeerAdvice5:
	; Incidentally… I'm impressed by your dedication. It's been a long time since I've seen a #MON as mighty as this @ . I'm sure that seeing @ in battle would excite anyone.
	text_far UnknownText_0x1c4ae5
	text_end

GetCaughtGender:
	ld hl, MON_CAUGHTGENDER
	add hl, bc

	ld a, [hl]
	and CAUGHT_LOCATION_MASK
	jr z, .genderless
	cp EVENT_LOCATION
	jr z, .genderless

	ld a, [hl]
	and CAUGHT_GENDER_MASK
	jr nz, .male
	ld c, CAUGHT_BY_GIRL
	ret

.male
	ld c, CAUGHT_BY_BOY
	ret

.genderless
	ld c, CAUGHT_BY_UNKNOWN
	ret
