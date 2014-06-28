PrintMonTypes: ; 5090d
; Print both types of CurSpecies on the stats screen at hl.

	push hl
	call GetBaseData
	pop hl

	push hl
	ld a, [BaseType1]
	call .PrintType

	ld a, [BaseType1]
	ld b, a
	ld a, [BaseType2]
	cp b
	pop hl
	jr z, .HideSecondType

; Next row
	ld bc, 20
	add hl, bc

.PrintType
	ld b, a
	jr PrintType

.HideSecondType
; This doesn't actually do anything.
	ld a, " "
	ld bc, 20 - 3
	add hl, bc
	ld [hl], a
	inc bc
	add hl, bc
	ld bc, 5
	jp ByteFill
; 5093a

PrintMoveType: ; 5093a
; Print the type of move b at hl.

	push hl
	ld a, b
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves
	call AddNTimes
	ld de, StringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	ld a, [StringBuffer1 + MOVE_TYPE]
	pop hl

	ld b, a
; 50953

PrintType: ; 50953
; Print type b at hl.
	ld a, b

	push hl
	add a
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	jp PlaceString
; 50964


GetTypeName: ; 50964
; Copy the name of type $d265 to StringBuffer1.
	ld a, [$d265]
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
	ld bc, $000d
	jp CopyBytes
; 5097b


TypeNames: ; 5097b
	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bird
	dw Bug
	dw Ghost
	dw Steel
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw Normal
	dw UnknownType
	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark

Normal:
	db "NORMAL@"
Fighting:
	db "FIGHTING@"
Flying:
	db "FLYING@"
Poison:
	db "POISON@"
UnknownType:
	db "???@"
Fire:
	db "FIRE@"
Water:
	db "WATER@"
Grass:
	db "GRASS@"
Electric:
	db "ELECTRIC@"
Psychic:
	db "PSYCHIC@"
Ice:
	db "ICE@"
Ground:
	db "GROUND@"
Rock:
	db "ROCK@"
Bird:
	db "BIRD@"
Bug:
	db "BUG@"
Ghost:
	db "GHOST@"
Steel:
	db "STEEL@"
Dragon:
	db "DRAGON@"
Dark:
	db "DARK@"
; 50a28

