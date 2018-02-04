NamesPointers:: ; 33ab
; entries correspond to GetName constants (see constants/text_constants.asm)
	dba PokemonNames        ; MON_NAME (not used; jumps to GetPokemonName)
	dba MoveNames           ; MOVE_NAME
	dbw 0, NULL             ; DUMMY_NAME
	dba ItemNames           ; ITEM_NAME
	dbw 0, wPartyMonOT       ; PARTY_OT_NAME
	dbw 0, wOTPartyMonOT     ; ENEMY_OT_NAME
	dba TrainerClassNames   ; TRAINER_NAME
	dbw 4, MoveDescriptions ; MOVE_DESC_NAME_BROKEN (wrong bank)
; 33c3

GetName:: ; 33c3
; Return name wCurSpecies from name list wNamedObjectTypeBuffer in wStringBuffer1.

	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	ld a, [wNamedObjectTypeBuffer]
	cp MON_NAME
	jr nz, .NotPokeName

	ld a, [wCurSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, MON_NAME_LENGTH
	add hl, de
	ld e, l
	ld d, h
	jr .done

.NotPokeName:
	ld a, [wNamedObjectTypeBuffer]
	dec a
	ld e, a
	ld d, 0
	ld hl, NamesPointers
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wCurSpecies]
	dec a
	call GetNthString

	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes

.done
	ld a, e
	ld [wUnusedD102], a
	ld a, d
	ld [wUnusedD102 + 1], a

	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
; 3411

GetNthString:: ; 3411
; Return the address of the
; ath string starting from hl.

	and a
	ret z

	push bc
	ld b, a
	ld c, "@"
.readChar
	ld a, [hli]
	cp c
	jr nz, .readChar
	dec b
	jr nz, .readChar
	pop bc
	ret
; 3420

GetBasePokemonName:: ; 3420
; Discards gender (Nidoran).

	push hl
	call GetPokemonName

	ld hl, wStringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .quit
	cp "♂"
	jr z, .end
	cp "♀"
	jr z, .end
	inc hl
	jr .loop
.end
	ld [hl], "@"
.quit
	pop hl
	ret

; 343b

GetPokemonName:: ; 343b
; Get Pokemon name wd265.

	ld a, [hROMBank]
	push af
	push hl
	ld a, BANK(PokemonNames)
	rst Bankswitch

; Each name is ten characters
	ld a, [wd265]
	dec a
	ld d, 0
	ld e, a
	ld h, 0
	ld l, a
	add hl, hl ; hl = hl * 4
	add hl, hl ; hl = hl * 4
	add hl, de ; hl = (hl*4) + de
	add hl, hl ; hl = (5*hl) + (5*hl)
	ld de, PokemonNames
	add hl, de

; Terminator
	ld de, wStringBuffer1
	push de
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld hl, wStringBuffer1 + MON_NAME_LENGTH - 1
	ld [hl], "@"
	pop de

	pop hl
	pop af
	rst Bankswitch
	ret
; 3468

GetItemName:: ; 3468
; Get item name wd265.

	push hl
	push bc
	ld a, [wd265]

	cp TM01
	jr nc, .TM

	ld [wCurSpecies], a
	ld a, ITEM_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	jr .Copied
.TM:
	call GetTMHMName
.Copied:
	ld de, wStringBuffer1
	pop bc
	pop hl
	ret
; 3487

GetTMHMName:: ; 3487
; Get TM/HM name by item id wd265.

	push hl
	push de
	push bc
	ld a, [wd265]
	push af

; TM/HM prefix
	cp HM01
	push af
	jr c, .TM

	ld hl, .HMText
	ld bc, .HMTextEnd - .HMText
	jr .asm_34a1

.TM:
	ld hl, .TMText
	ld bc, .TMTextEnd - .TMText

.asm_34a1
	ld de, wStringBuffer1
	call CopyBytes

; TM/HM number
	push de
	ld a, [wd265]
	ld c, a
	callfar GetTMHMNumber
	pop de

; HM numbers start from 51, not 1
	pop af
	ld a, c
	jr c, .asm_34b9
	sub NUM_TMS
.asm_34b9

; Divide and mod by 10 to get the top and bottom digits respectively
	ld b, "0"
.mod10
	sub 10
	jr c, .asm_34c2
	inc b
	jr .mod10
.asm_34c2
	add 10

	push af
	ld a, b
	ld [de], a
	inc de
	pop af

	ld b, "0"
	add b
	ld [de], a

; End the string
	inc de
	ld a, "@"
	ld [de], a

	pop af
	ld [wd265], a
	pop bc
	pop de
	pop hl
	ret

.TMText:
	db "TM"
.TMTextEnd:
	db "@"

.HMText:
	db "HM"
.HMTextEnd:
	db "@"
; 34df

INCLUDE "home/hm_moves.asm"

GetMoveName:: ; 34f8
	push hl

	ld a, MOVE_NAME
	ld [wNamedObjectTypeBuffer], a

	ld a, [wNamedObjectIndexBuffer] ; move id
	ld [wCurSpecies], a

	call GetName
	ld de, wStringBuffer1

	pop hl
	ret
; 350c
