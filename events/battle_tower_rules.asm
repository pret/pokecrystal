CheckForMobileBattleRules: ; 8b1e1
	ld de, .PointerTables
	call BattleTower_ExecuteJumptable
	ret z
	call BattleTower_PleaseReturnWhenReady
	scf
	ret
; 8b1ed

.PointerTables: ; 8b1ed
	db 2
	dw .Functions
	dw .TextPointers

.Functions: ; 8b1f2
	dw BattleTower_CheckPartyLengthIs3
	dw BattleTower_CheckPartyHasThreeMonsThatAreNotEggs
; 8b1f6

.TextPointers: ; 8b1f6
	dw .ExcuseMeText
	dw JumpText_NeedAtLeastThreeMon
	dw JumpText_EggDoesNotQualify
; 8b1fc

.ExcuseMeText: ; 0x8b1fc
	; Excuse me!
	text_jump UnknownText_0x1c5937
	db "@"
; 0x8b201

CheckForBattleTowerRules: ; 8b201
	ld hl, StringBuffer2
	ld [hl], "3"
	inc hl
	ld [hl], "@"
	ld de, .PointerTables
	call BattleTower_ExecuteJumptable
	ret z
	call BattleTower_PleaseReturnWhenReady
	scf
	ret
; 8b215

.PointerTables: ; 8b215
	db 4
	dw .Functions
	dw .TextPointers

.Functions: ; 8b21a
	dw Function_PartyCountEq3
	dw Function_PartySpeciesAreUnique
	dw Function_PartyItemsAreUnique
	dw Function_HasPartyAnEgg
; 8b222

.TextPointers: ; 8b222
	dw JumpText_ExcuseMeYoureNotReady
	dw JumpText_OnlyThreePkmnMayBeEntered
	dw JumpText_ThePkmnMustAllBeDifferentKinds
	dw JumpText_ThePkmnMustNotHoldTheSameItems
	dw JumpText_YouCantTakeAnEgg
; 8b22c

JumpText_ExcuseMeYoureNotReady: ; 0x8b22c
	; Excuse me. You're not ready.
	text_jump Text_ExcuseMeYoureNotReady
	db "@"
; 0x8b231

BattleTower_PleaseReturnWhenReady: ; 8b231
	ld hl, .PleaseReturnWhenReady
	call PrintText
	ret
; 8b238

.PleaseReturnWhenReady: ; 0x8b238
	; Please return when you're ready.
	text_jump UnknownText_0x1c5962
	db "@"
; 0x8b23d

JumpText_NeedAtLeastThreeMon: ; 0x8b23d
	; You need at least three #MON.
	text_jump UnknownText_0x1c5983
	db "@"
; 0x8b242

JumpText_EggDoesNotQualify: ; 0x8b242
	; Sorry, an EGG doesn't qualify.
	text_jump UnknownText_0x1c59a3
	db "@"
; 0x8b247

JumpText_OnlyThreePkmnMayBeEntered: ; 0x8b247
	; Only three #MON may be entered.
	text_jump Text_OnlyThreePkmnMayBeEntered
	db "@"
; 0x8b24c

JumpText_ThePkmnMustAllBeDifferentKinds: ; 0x8b24c
	; The @  #MON must all be different kinds.
	text_jump Text_ThePkmnMustAllBeDifferentKinds
	db "@"
; 0x8b251

JumpText_ThePkmnMustNotHoldTheSameItems: ; 0x8b251
	; The @  #MON must not hold the same items.
	text_jump Text_ThePkmnMustNotHoldTheSameItems
	db "@"
; 0x8b256

JumpText_YouCantTakeAnEgg: ; 0x8b256
	; You can't take an EGG!
	text_jump Text_YouCantTakeAnEgg
	db "@"
; 0x8b25b

BattleTower_ExecuteJumptable: ; 8b25b
	ld bc, 0
.loop
	call .DoJumptableFunction
	call c, .PrintFailureText
	call .Next_CheckReachedEnd
	jr nz, .loop
	ld a, b
	and a
	ret
; 8b26c

.DoJumptableFunction: ; 8b26c
	push de
	push bc
	call .GetFunctionPointer
	ld a, c
	rst JumpTable
	pop bc
	pop de
	ret
; 8b276

.Next_CheckReachedEnd: ; 8b276
	inc c
	ld a, [de]
	cp c
	ret
; 8b27a

.GetFunctionPointer: ; 8b27a
	inc de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	ret
; 8b281

.GetTextPointers: ; 8b281
	inc de
	inc de
	inc de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	ret
; 8b28a

.LoadTextPointer: ; 8b28a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 8b28e

.PrintFailureText: ; 8b28e
	push de
	push bc
	ld a, b
	and a
	call z, .PrintFirstText
	pop bc
	call .PrintNthText
	ld b, $1
	pop de
	ret
; 8b29d

.PrintFirstText: ; 8b29d
	push de
	call .GetTextPointers
	call .LoadTextPointer
	call PrintText
	pop de
	ret
; 8b2a9

.PrintNthText: ; 8b2a9
	push bc
	call .GetTextPointers
	inc hl
	inc hl
	ld b, $0
	add hl, bc
	add hl, bc
	call .LoadTextPointer
	call PrintText
	pop bc
	ret
; 8b2bb

BattleTower_CheckPartyLengthIs3: ; 8b2bb
	ld a, [PartyCount]
	cp 3
	ret
; 8b2c1

BattleTower_CheckPartyHasThreeMonsThatAreNotEggs: ; 8b2c1
	ld hl, PartyCount
	ld a, [hli]
	ld b, $0
	ld c, a
.loop
	ld a, [hli]
	cp EGG
	jr z, .egg
	inc b

.egg
	dec c
	jr nz, .loop
	ld a, [PartyCount]
	cp b
	ret z
	ld a, b
	cp 3
	ret
; 8b2da

Function_PartyCountEq3: ; 8b2da
	ld a, [PartyCount]
	cp 3
	ret z
	scf
	ret
; 8b2e2

Function_PartySpeciesAreUnique: ; 8b2e2
	ld hl, PartyMon1Species
	call VerifyUniqueness
	ret
; 8b2e9

VerifyUniqueness: ; 8b2e9
	ld de, PartyCount
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
; 8b31a

.nextmon ; 8b31a
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	inc de
	pop bc
	ret
; 8b322

.isegg ; 8b322
	push bc
	ld b, a
	ld a, [de]
	cp EGG
	ld a, b
	pop bc
	ret
; 8b32a

Function_PartyItemsAreUnique: ; 8b32a
	ld hl, PartyMon1Item
	call VerifyUniqueness
	ret
; 8b331

Function_HasPartyAnEgg: ; 8b331
	ld hl, PartyCount
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
; 8b342
