MANIA_OT_ID EQU 00518

Special_GiveShuckle: ; 7305

; Adding to the party.
	xor a
	ld [wMonType], a

; Level 15 Shuckle.
	ld a, SHUCKLE
	ld [wCurPartySpecies], a
	ld a, 15
	ld [wCurPartyLevel], a

	predef TryAddMonToParty
	jr nc, .NotGiven

; Caught data.
	ld b, 0
	farcall SetGiftPartyMonCaughtData

; Holding a Berry.
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	dec a
	push af
	push bc
	ld hl, wPartyMon1Item
	call AddNTimes
	ld [hl], BERRY
	pop bc
	pop af

; OT ID.
	ld hl, wPartyMon1ID
	call AddNTimes
	ld a, HIGH(MANIA_OT_ID)
	ld [hli], a
	ld [hl], LOW(MANIA_OT_ID)

; Nickname.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld de, SpecialShuckleNick
	call CopyName2

; OT.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonOT
	call SkipNames
	ld de, SpecialShuckleOT
	call CopyName2

; Engine flag for this event.
	ld hl, wDailyFlags
	set 5, [hl] ; ENGINE_SHUCKLE_GIVEN
	ld a, 1
	ld [wScriptVar], a
	ret

.NotGiven:
	xor a
	ld [wScriptVar], a
	ret

SpecialShuckleOT:
	db "MANIA@"
SpecialShuckleNick:
	db "SHUCKIE@"

Special_ReturnShuckle: ; 737e
	farcall SelectMonFromParty
	jr c, .refused

	ld a, [wCurPartySpecies]
	cp SHUCKLE
	jr nz, .DontReturn

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

; OT ID
	ld a, [hli]
	cp HIGH(MANIA_OT_ID)
	jr nz, .DontReturn
	ld a, [hl]
	cp LOW(MANIA_OT_ID)
	jr nz, .DontReturn

; OT
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOT
	call SkipNames
	ld de, SpecialShuckleOT
.CheckOT:
	ld a, [de]
	cp [hl]
	jr nz, .DontReturn
	cp "@"
	jr z, .done
	inc de
	inc hl
	jr .CheckOT

.done
	farcall CheckCurPartyMonFainted
	jr c, .fainted
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp 150
	ld a, SHUCKIE_HAPPY
	jr nc, .HappyToStayWithYou
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	callfar RemoveMonFromPartyOrBox
	ld a, SHUCKIE_RETURNED
.HappyToStayWithYou:
	ld [wScriptVar], a
	ret

.refused
	ld a, SHUCKIE_REFUSED
	ld [wScriptVar], a
	ret

.DontReturn:
	xor a ; SHUCKIE_WRONG_MON
	ld [wScriptVar], a
	ret

.fainted
	ld a, SHUCKIE_FAINTED
	ld [wScriptVar], a
	ret

Special_BillsGrandfather: ; 73f7
	farcall SelectMonFromParty
	jr c, .cancel
	ld a, [wCurPartySpecies]
	ld [wScriptVar], a
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3

.cancel
	xor a
	ld [wScriptVar], a
	ret

Special_YoungerHaircutBrother: ; 7413
	ld hl, Data_YoungerHaircutBrother
	jr MassageOrHaircut

Special_OlderHaircutBrother: ; 7418
	ld hl, Data_OlderHaircutBrother
	jr MassageOrHaircut

Special_DaisyMassage: ; 741d
	ld hl, Data_DaisyMassage

MassageOrHaircut: ; 7420
	push hl
	farcall SelectMonFromParty
	pop hl
	jr c, .nope
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	push hl
	call GetCurNick
	call CopyPokemonName_Buffer1_Buffer3
	pop hl
	call Random
; Bug: Subtracting $ff from $ff fails to set c.
; This can result in overflow into the next data array.
; In the case of getting a massage from Daisy, we bleed
; into CopyPokemonName_Buffer1_Buffer3, which passes
; $d0 to ChangeHappiness and returns $73 to the script.
; The end result is that there is a 0.4% chance your
; Pokemon's happiness will not change at all.
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	inc hl
	jr .loop

.ok
	inc hl
	ld a, [hli]
	ld [wScriptVar], a
	ld c, [hl]
	call ChangeHappiness
	ret

.nope
	xor a
	ld [wScriptVar], a
	ret

.egg
	ld a, 1
	ld [wScriptVar], a
	ret

Data_YoungerHaircutBrother: ; 7459
	db $4c, 2, HAPPINESS_YOUNGCUT1 ; 30% chance
	db $80, 3, HAPPINESS_YOUNGCUT2 ; 20% chance
	db $ff, 4, HAPPINESS_YOUNGCUT3 ; 50% chance

Data_OlderHaircutBrother: ; 7462
	db $9a, 2, HAPPINESS_OLDERCUT1 ; 60% chance
	db $4c, 3, HAPPINESS_OLDERCUT2 ; 10% chance
	db $ff, 4, HAPPINESS_OLDERCUT3 ; 30% chance

Data_DaisyMassage: ; 746b
	db $ff, 2, HAPPINESS_MASSAGE ; 99.6% chance

CopyPokemonName_Buffer1_Buffer3: ; 746e
	ld hl, wStringBuffer1
	ld de, wStringBuffer3
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

DummyPredef1: ; 747a
	ret
