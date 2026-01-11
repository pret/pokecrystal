GiveRandomNickname::
; Gives the Pokemon at de a random nickname from the list.
; Inputs:
;   de = pointer to nickname destination

	push de
	
	; Check if auto-nickname is enabled
	ld a, [wAutoNickname]
	and a
	jr z, .no_auto_nickname
	
	; Get a random name index from the list
	ld a, NUM_RANDOM_NAMES
	call RandomRange
	; a now contains a random index from 0 to NUM_RANDOM_NAMES-1
	
	; Calculate offset using AddNTimes: hl = RandomPokemonNames + (a * MON_NAME_LENGTH)
	ld hl, RandomPokemonNames
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	
	; hl now points to the random name
	pop de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	and a ; clear carry to indicate success
	ret

.no_auto_nickname
	pop de
	scf ; set carry to indicate failure
	ret
