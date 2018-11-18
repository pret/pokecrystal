BugContest_SetCaughtContestMon:
	ld a, [wContestMon]
	and a
	jr z, .firstcatch
	ld [wNamedObjectIndexBuffer], a
	farcall DisplayAlreadyCaughtText
	farcall DisplayCaughtContestMonStats
	lb bc, 14, 7
	call PlaceYesNoBox
	ret c

.firstcatch
	call .generatestats
	ld a, [wTempEnemyMonSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, .caughttext
	call PrintText
	ret

.generatestats
	ld a, [wTempEnemyMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wContestMon
	call ByteFill
	xor a
	ld [wMonType], a
	ld hl, wContestMon
	jp GeneratePartyMonStats

.caughttext
	; Caught @ !
	text_far UnknownText_0x1c10c0
	text_end
