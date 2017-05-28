_FindGreaterThanThatLevel: ; 4dbd2
	ld hl, PartyMon1Level
	call FindGreaterThanThatLevel
	ret

_FindAtLeastThatHappy: ; 4dbd9
	ld hl, PartyMon1Happiness
	call FindAtLeastThatHappy
	ret

_FindThatSpecies: ; 4dbe0
	ld hl, PartyMon1Species
	jp FindThatSpecies

_FindThatSpeciesYourTrainerID: ; 4dbe6
	ld hl, PartyMon1Species
	call FindThatSpecies
	ret z
	ld a, c
	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [PlayerID]
	cp [hl]
	jr nz, .nope
	inc hl
	ld a, [PlayerID + 1]
	cp [hl]
	jr nz, .nope
	ld a, $1
	and a
	ret

.nope
	xor a
	ret

FindAtLeastThatHappy: ; 4dc0a
; Sets the bits for the Pokemon that have a happiness greater than or equal to b.
; The lowest bits are used.  Sets z if no Pokemon in your party is at least that happy.
	ld c, $0
	ld a, [PartyCount]
	ld d, a
.loop
	ld a, d
	dec a
	push hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, b
	cp [hl]
	pop hl
	jr z, .greater_equal
	jr nc, .lower

.greater_equal
	ld a, c
	or $1
	ld c, a

.lower
	sla c
	dec d
	jr nz, .loop
	call RetroactivelyIgnoreEggs
	ld a, c
	and a
	ret

FindGreaterThanThatLevel: ; 4dc31
	ld c, $0
	ld a, [PartyCount]
	ld d, a
.loop
	ld a, d
	dec a
	push hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, b
	cp [hl]
	pop hl
	jr c, .greater
	ld a, c
	or $1
	ld c, a

.greater
	sla c
	dec d
	jr nz, .loop
	call RetroactivelyIgnoreEggs
	ld a, c
	and a
	ret

FindThatSpecies: ; 4dc56
; Find species b in your party.
; If you have no Pokemon, returns c = -1 and z.
; If that species is in your party, returns its location in c, and nz.
; Otherwise, returns z.
	ld c, -1
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp -1
	ret z
	inc c
	cp b
	jr nz, .loop
	ld a, $1
	and a
	ret

RetroactivelyIgnoreEggs: ; 4dc67
	ld e, -2
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp -1
	ret z
	cp EGG
	jr nz, .skip_notegg
	ld a, c
	and e
	ld c, a

.skip_notegg
	rlc e
	jr .loop
