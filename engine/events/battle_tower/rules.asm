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
	dw .BTExcuseMeText
	dw NeedAtLeastThreeMonText
	dw EggDoesNotQualifyText

.BTExcuseMeText:
	text_far _BTExcuseMeText
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
	dw CheckBTRule_PartyCountEq3
	dw CheckBTRule_PartySpeciesAreUnique
	dw CheckBTRule_PartyItemsAreUnique
	dw CheckBTRule_HasPartyAnEgg

.TextPointers:
	dw ExcuseMeYoureNotReadyText
	dw OnlyThreeMonMayBeEnteredText
	dw TheMonMustAllBeDifferentKindsText
	dw TheMonMustNotHoldTheSameItemsText
	dw YouCantTakeAnEggText

ExcuseMeYoureNotReadyText:
	text_far _ExcuseMeYoureNotReadyText
	text_end

BattleTower_PleaseReturnWhenReady:
	ld hl, .BattleTowerReturnWhenReadyText
	call PrintText
	ret

.BattleTowerReturnWhenReadyText:
	text_far _BattleTowerReturnWhenReadyText
	text_end

NeedAtLeastThreeMonText:
	text_far _NeedAtLeastThreeMonText
	text_end

EggDoesNotQualifyText:
	text_far _EggDoesNotQualifyText
	text_end

OnlyThreeMonMayBeEnteredText:
	text_far _OnlyThreeMonMayBeEnteredText
	text_end

TheMonMustAllBeDifferentKindsText:
	text_far _TheMonMustAllBeDifferentKindsText
	text_end

TheMonMustNotHoldTheSameItemsText:
	text_far _TheMonMustNotHoldTheSameItemsText
	text_end

YouCantTakeAnEggText:
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

CheckBTRule_PartyCountEq3:
	ld a, [wPartyCount]
	cp BATTLETOWER_PARTY_LENGTH
	ret z
	scf
	ret

CheckBTRule_PartySpeciesAreUnique:
	ld hl, wPartyMon1Species
	call CheckPartyValueIsUnique
	ret

CheckPartyValueIsUnique:
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

CheckBTRule_PartyItemsAreUnique:
	ld hl, wPartyMon1Item
	call CheckPartyValueIsUnique
	ret

CheckBTRule_HasPartyAnEgg:
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
