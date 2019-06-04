InitString::
; Init a string of length c.
	push hl
	jr _InitString

InitName::
; Intended for names, so this function is limited to ten characters.
	push hl
	ld c, NAME_LENGTH - 1
_InitString::
; if the string pointed to by hl is empty (defined as "zero or more spaces
; followed by a null"), then initialize it to the string pointed to by de.
	push bc
.loop
	ld a, [hli]
	cp "@"
	jr z, .blank
	cp " "
	jr nz, .notblank
	dec c
	jr nz, .loop
.blank
	pop bc
	ld l, e
	ld h, d
	pop de
	ld b, 0
	inc c
	call CopyBytes
	ret

.notblank
	pop bc
	pop hl
	ret
