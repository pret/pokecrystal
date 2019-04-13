CheckForMobileBattleRules:
	ld de, .PointerTables
	call BattleTower_ExecuteJumptable
	ret z
	call BattleTower_PleaseReturnWhenReady
	scf
	ret

.PointerTables:
	db 2
	dw .Functions
	dw .TextPointers

.Functions:
	dw BattleTower_CheckPartyLengthIs3
	dw BattleTower_CheckPartyHasThreeMonsThatAreNotEggs

.TextPointers:
	dw .ExcuseMeText
	dw NeedAtLeastThreeMonText
	dw EggDoesNotQualifyText

.ExcuseMeText:
	; Excuse me!
	text_far UnknownText_0x1c5937
	text_end

_CheckForBattleTowerRules:
	ld hl, wStringBuffer2
	ld [hl], "3"
	inc hl
	ld [hl], "@"
	ld de, .PointerTables
	call BattleTower_ExecuteJumptable
	ret z
	call BattleTower_PleaseReturnWhenReady
	scf
	ret

.PointerTables:
	db 4
	dw .Functions
	dw .TextPointers

.Functions:
	dw Function_PartyCountEq3
	dw Function_PartySpeciesAreUnique
	dw Function_PartyItemsAreUnique
	dw Function_HasPartyAnEgg

.TextPointers:
	dw JumpText_ExcuseMeYoureNotReady
	dw OnlyThreeMonMayBeEnteredText
	dw TheMonMustAllBeDifferentKindsText
	dw TheMonMustNotHoldTheSameItemsText
	dw YouCantTakeAnEggText

JumpText_ExcuseMeYoureNotReady:
	; Excuse me. You're not ready.
	text_far Text_ExcuseMeYoureNotReady
	text_end

BattleTower_PleaseReturnWhenReady:
	ld hl, .PleaseReturnWhenReady
	call PrintText
	ret

.PleaseReturnWhenReady:
	; Please return when you're ready.
	text_far UnknownText_0x1c5962
	text_end

NeedAtLeastThreeMonText:
	; You need at least three #MON.
	text_far _NeedAtLeastThreeMonText
	text_end

EggDoesNotQualifyText:
	; Sorry, an EGG doesn't qualify.
	text_far _EggDoesNotQualifyText
	text_end

OnlyThreeMonMayBeEnteredText:
	; Only three #MON may be entered.
	text_far _OnlyThreeMonMayBeEnteredText
	text_end

TheMonMustAllBeDifferentKindsText:
	; The @  #MON must all be different kinds.
	text_far _TheMonMustAllBeDifferentKindsText
	text_end

TheMonMustNotHoldTheSameItemsText:
	; The @  #MON must not hold the same items.
	text_far _TheMonMustNotHoldTheSameItemsText
	text_end

YouCantTakeAnEggText:
	; You can't take an EGG!
	text_far _YouCantTakeAnEggText
	text_end

BattleTower_ExecuteJumptable:
	ld bc, 0
.loop
	call .DoJumptableFunction
	call c, .PrintFailureText
	call .Next_CheckReachedEnd
	jr nz, .loop
	ld a, b
	and a
	ret

.DoJumptableFunction:
	push de
	push bc
	call .GetFunctionPointer
	ld a, c
	rst JumpTable
	pop bc
	pop de
	ret

.Next_CheckReachedEnd:
	inc c
	ld a, [de]
	cp c
	ret

.GetFunctionPointer:
	inc de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	ret

.GetTextPointers:
	inc de
	inc de
	inc de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	ret

.LoadTextPointer:
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.PrintFailureText:
	push de
	push bc
	ld a, b
	and a
	call z, .PrintFirstText
	pop bc
	call .PrintNthText
	ld b, 1
	pop de
	ret

.PrintFirstText:
	push de
	call .GetTextPointers
	call .LoadTextPointer
	call PrintText
	pop de
	ret

.PrintNthText:
	push bc
	call .GetTextPointers
	inc hl
	inc hl
	ld b, 0
	add hl, bc
	add hl, bc
	call .LoadTextPointer
	call PrintText
	pop bc
	ret

BattleTower_CheckPartyLengthIs3:
	ld a, [wPartyCount]
	cp BATTLETOWER_PARTY_LENGTH
	ret

BattleTower_CheckPartyHasThreeMonsThatAreNotEggs:
	ld hl, wPartyCount
	ld a, [hli]
	ld b, 0
	ld c, a
.loop
	ld a, [hli]
	cp EGG
	jr z, .egg
	inc b

.egg
	dec c
	jr nz, .loop
	ld a, [wPartyCount]
	cp b
	ret z
	ld a, b
	cp BATTLETOWER_PARTY_LENGTH
	ret

Function_PartyCountEq3:
	ld a, [wPartyCount]
	cp BATTLETOWER_PARTY_LENGTH
	ret z
	scf
	ret

Function_PartySpeciesAreUnique:
	ld hl, wPartyMon1Species
	call VerifyUniqueness
	ret

VerifyUniqueness:
	ld de, wPartyCount
	ld a, [de]
	inc de
	dec a
	jr z, .done
	ld b, a
.loop
	push hl
	push de
	ld c, b
	call .isegg
	jr z, .next
	ld a, [hl]
	and a
	jr z, .next
.loop2
	call .nextmon
	call .isegg
	jr z, .next2
	cp [hl]
	jr z, .gotcha

.next2
	dec c
	jr nz, .loop2

.next
	pop de
	pop hl
	call .nextmon
	dec b
	jr nz, .loop

.done
	and a
	ret

.gotcha
	pop de
	pop hl
	scf
	ret

.nextmon
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	inc de
	pop bc
	ret

.isegg
	push bc
	ld b, a
	ld a, [de]
	cp EGG
	ld a, b
	pop bc
	ret

Function_PartyItemsAreUnique:
	ld hl, wPartyMon1Item
	call VerifyUniqueness
	ret

Function_HasPartyAnEgg:
	ld hl, wPartyCount
	ld a, [hli]
	ld c, a
.loop
	ld a, [hli]
	cp EGG
	jr z, .found
	dec c
	jr nz, .loop
	and a
	ret

.found
	scf
	ret
