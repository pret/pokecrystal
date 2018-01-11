CheckPartyFullAfterContest: ; 4d9e5
	ld a, [wContestMon]
	and a
	jp z, .DidntCatchAnything
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jp nc, .TryAddToBox
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wContestMon]
	ld [hli], a
	ld [CurSpecies], a
	ld a, -1
	ld [hl], a
	ld hl, PartyMon1Species
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	ld hl, PlayerName
	call CopyBytes
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call GiveANickname_YesNo
	jr c, .Party_SkipNickname
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	xor a
	ld [MonType], a
	ld de, wMonOrItemNameBuffer
	callfar InitNickname

.Party_SkipNickname:
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wMonOrItemNameBuffer
	call CopyBytes
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Level
	call GetPartyLocation
	ld a, [hl]
	ld [CurPartyLevel], a
	call SetCaughtData
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and CAUGHT_GENDER_MASK
	ld b, NATIONAL_PARK
	or b
	ld [hl], a
	xor a
	ld [wContestMon], a
	and a
	ld [ScriptVar], a
	ret

.TryAddToBox: ; 4daa3
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	call CloseSRAM
	jr nc, .BoxFull
	xor a
	ld [CurPartyMon], a
	ld hl, wContestMon
	ld de, wBufferMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, PlayerName
	ld de, wBufferMonOT
	ld bc, NAME_LENGTH
	call CopyBytes
	callfar InsertPokemonIntoBox
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	call GiveANickname_YesNo
	ld hl, StringBuffer1
	jr c, .Box_SkipNickname
	ld a, BOXMON
	ld [MonType], a
	ld de, wMonOrItemNameBuffer
	callfar InitNickname
	ld hl, wMonOrItemNameBuffer

.Box_SkipNickname:
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld de, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call CloseSRAM

.BoxFull:
	ld a, BANK(sBoxMon1Level)
	call GetSRAMBank
	ld a, [sBoxMon1Level]
	ld [CurPartyLevel], a
	call CloseSRAM
	call SetBoxMonCaughtData
	ld a, BANK(sBoxMon1CaughtLocation)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLocation
	ld a, [hl]
	and CAUGHT_GENDER_MASK
	ld b, NATIONAL_PARK
	or b
	ld [hl], a
	call CloseSRAM
	xor a
	ld [wContestMon], a
	ld a, $1
	ld [ScriptVar], a
	ret

.DidntCatchAnything: ; 4db35
	ld a, $2
	ld [ScriptVar], a
	ret

GiveANickname_YesNo: ; 4db3b
	ld hl, TextJump_GiveANickname
	call PrintText
	jp YesNoBox

TextJump_GiveANickname: ; 0x4db44
	; Give a nickname to the @  you received?
	text_jump UnknownText_0x1c12fc
	db "@"

SetCaughtData: ; 4db49
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLevel
	call GetPartyLocation
SetBoxmonOrEggmonCaughtData: ; 4db53
	ld a, [TimeOfDay]
	inc a
	rrca
	rrca
	ld b, a
	ld a, [CurPartyLevel]
	or b
	ld [hli], a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	cp MAP_POKECENTER_2F
	jr nz, .NotPokecenter2F
	ld a, b
	cp GROUP_POKECENTER_2F
	jr nz, .NotPokecenter2F

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a

.NotPokecenter2F:
	call GetWorldMapLocation
	ld b, a
	ld a, [wPlayerGender]
	rrca
	or b
	ld [hl], a
	ret

SetBoxMonCaughtData: ; 4db83
	ld a, BANK(sBoxMon1CaughtLevel)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLevel
	call SetBoxmonOrEggmonCaughtData
	call CloseSRAM
	ret

SetGiftBoxMonCaughtData: ; 4db92
	push bc
	ld a, BANK(sBoxMon1CaughtLevel)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLevel
	pop bc
	call SetGiftMonCaughtData
	call CloseSRAM
	ret

SetGiftPartyMonCaughtData: ; 4dba3
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLevel
	push bc
	call GetPartyLocation
	pop bc
SetGiftMonCaughtData: ; 4dbaf
	xor a
	ld [hli], a
	ld a, GIFT_LOCATION
	rrc b
	or b
	ld [hl], a
	ret

SetEggMonCaughtData: ; 4dbb8 (13:5bb8)
	ld a, [CurPartyMon]
	ld hl, PartyMon1CaughtLevel
	call GetPartyLocation
	ld a, [CurPartyLevel]
	push af
	ld a, CAUGHT_EGG_LEVEL
	ld [CurPartyLevel], a
	call SetBoxmonOrEggmonCaughtData
	pop af
	ld [CurPartyLevel], a
	ret
