ConvertMon_2to1:
; Takes the Gen 2 Pokemon number stored in wTempSpecies,
; finds it in the Pokered_MonIndices table,
; and returns its index in wTempSpecies.
	push bc
	push hl
	ld a, [wTempSpecies]
	ld b, a
	ld c, 0
	ld hl, Pokered_MonIndices
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop
	ld a, c
	ld [wTempSpecies], a
	pop hl
	pop bc
	ret

ConvertMon_1to2:
; Takes the Gen 1 Pokemon number stored in wTempSpecies
; and returns the corresponding value from Pokered_MonIndices in wTempSpecies.
	push bc
	push hl
	ld a, [wTempSpecies]
	dec a
	ld hl, Pokered_MonIndices
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wTempSpecies], a
	pop hl
	pop bc
	ret

INCLUDE "data/pokemon/gen1_order.asm"
