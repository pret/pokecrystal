PlaceAbilityNameInBuffer:
  
    push bc
    push de
    push hl
    
    xor a
    ld e,a
    ld d,a

    ld a, [wBaseAbility] ; load value of ability in a
    ld hl, AbilityNames ;; load the address of first char in table nto 16 bit register
    ;find correct ability
.loop
    cp a, 0
    jr z, .done
    ld b,a ; store index counter 
.loop2
    ;find @ 
    ld a, [hli]
    cp a, "@"
    jr nz, .loop2

    ld a, b; restore index counter
    dec a; a = a -1
    jr .loop



.done

	; HL should now be pointing at the correct area, so we should just copy into wStringBuffer

    ld de, wStringBuffer2
	ld bc, ABILITY_NAME_LENGTH
	; push de ; this would restore DE to its original position pre-copy, but that doesn't matter
	call CopyBytes
	; pop de 
	
    pop hl
    pop de
    pop bc
    ret

; .Print:
; 	ld b, a
; 	jr PrintAbility


; PrintAbility:
; ; Print type b at hl.
;     ld a, b

;     push hl
;     add a
;     ld hl, AbilityNames
;     ld e, a
;     ld d, 0
;     add hl, de
;     ld a, [hli]
;     ld e, a
;     ld d, [hl]
;     pop hl

;     jp PlaceString

