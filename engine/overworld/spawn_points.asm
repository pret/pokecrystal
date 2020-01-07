INCLUDE "data/maps/spawn_points.asm"

EnterMapSpawnPoint:
	; loads the spawn point in wDefaultSpawnpoint
	push hl
	push de
	ld a, [wDefaultSpawnpoint]
	cp SPAWN_N_A
	jr z, .spawn_n_a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, SpawnPoints
	add hl, de
	ld a, [hli]
	ld [wMapGroup], a
	ld a, [hli]
	ld [wMapNumber], a
	ld a, [hli]
	ld [wXCoord], a
	ld a, [hli]
	ld [wYCoord], a
.spawn_n_a
	pop de
	pop hl
	ret

IsSpawnPoint:
; Checks if the map loaded in de is a spawn point.  Returns carry if it's a spawn point.
	ld hl, SpawnPoints
	ld c, 0
.loop
	ld a, [hl]
	cp SPAWN_N_A
	jr z, .nope
	cp d
	jr nz, .next
	inc hl
	ld a, [hld]
	cp e
	jr z, .yes

.next
	push bc
	ld bc, 4 ; length of a spawn table entry
	add hl, bc
	pop bc
	inc c
	jr .loop

.nope
	and a
	ret

.yes
	scf
	ret
