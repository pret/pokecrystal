Function8b1e1: ; 8b1e1
	ld de, Unknown_8b1ed
	call Function8b25b
	ret z
	call Function8b231
	scf
	ret
; 8b1ed

Unknown_8b1ed: ; 8b1ed
	db 2
	dw Unknown_8b1f2
	dw Unknown_8b1f6

Unknown_8b1f2: ; 8b1f2
	dw Function8b2bb
	dw Function8b2c1
; 8b1f6

Unknown_8b1f6: ; 8b1f6
	dw UnknownText_0x8b1fc
	dw UnknownText_0x8b23d
	dw UnknownText_0x8b242
; 8b1fc

UnknownText_0x8b1fc: ; 0x8b1fc
	; Excuse me!
	text_jump UnknownText_0x1c5937
	db "@"
; 0x8b201

CheckForBattleTowerRules: ; 8b201
	ld hl, StringBuffer2
	ld [hl], "3"
	inc hl
	ld [hl], "@"
	ld de, CheckForBattleTowerRules_FunctionsText
	call Function8b25b
	ret z
	call Function8b231
	scf
	ret
; 8b215

CheckForBattleTowerRules_FunctionsText: ; 8b215
	db 4
	dw CheckForBattleTowerRules_Functions
	dw CheckForBattleTowerRules_Text

CheckForBattleTowerRules_Functions: ; 8b21a
	dw Function_PartyCountEq3
	dw Function_PartySpeciesAreUnique
	dw Function_PartyItemsAreUnique
	dw Function_HasPartyAnEgg
; 8b222

CheckForBattleTowerRules_Text: ; 8b222
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

Function8b231: ; 8b231
	ld hl, UnknownText_0x8b238
	call PrintText
	ret
; 8b238

UnknownText_0x8b238: ; 0x8b238
	; Please return when you're ready.
	text_jump UnknownText_0x1c5962
	db "@"
; 0x8b23d

UnknownText_0x8b23d: ; 0x8b23d
	; You need at least three #MON.
	text_jump UnknownText_0x1c5983
	db "@"
; 0x8b242

UnknownText_0x8b242: ; 0x8b242
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

Function8b25b: ; 8b25b
	ld bc, $0000
.asm_8b25e
	call Function8b26c
	call c, Function8b28e
	call Function8b276
	jr nz, .asm_8b25e
	ld a, b
	and a
	ret
; 8b26c

Function8b26c: ; 8b26c
	push de
	push bc
	call Function8b27a
	ld a, c
	rst JumpTable
	pop bc
	pop de
	ret
; 8b276

Function8b276: ; 8b276
	inc c
	ld a, [de]
	cp c
	ret
; 8b27a

Function8b27a: ; 8b27a
	inc de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	ret
; 8b281

Function8b281: ; 8b281
rept 3
	inc de
endr
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	ret
; 8b28a

Function8b28a: ; 8b28a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 8b28e

Function8b28e: ; 8b28e
	push de
	push bc
	ld a, b
	and a
	call z, Function8b29d
	pop bc
	call Function8b2a9
	ld b, $1
	pop de
	ret
; 8b29d

Function8b29d: ; 8b29d
	push de
	call Function8b281
	call Function8b28a
	call PrintText
	pop de
	ret
; 8b2a9

Function8b2a9: ; 8b2a9
	push bc
	call Function8b281
rept 2
	inc hl
endr
	ld b, $0
rept 2
	add hl, bc
endr
	call Function8b28a
	call PrintText
	pop bc
	ret
; 8b2bb

Function8b2bb: ; 8b2bb
	ld a, [PartyCount]
	cp 3
	ret
; 8b2c1

Function8b2c1: ; 8b2c1
	ld hl, PartyCount
	ld a, [hli]
	ld b, $0
	ld c, a
.asm_8b2c8
	ld a, [hli]
	cp EGG
	jr z, .asm_8b2ce
	inc b

.asm_8b2ce
	dec c
	jr nz, .asm_8b2c8
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

.nextmon: ; 8b31a
	push bc
	ld bc, PartyMon2 - PartyMon1
	add hl, bc
	inc de
	pop bc
	ret
; 8b322

.isegg: ; 8b322
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
