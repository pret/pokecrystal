; Syntactic sugar macros

lb: MACRO ; r, hi, lo
	ld \1, (\2 & $ff) << 8 + (\3 & $ff)
ENDM

ln: MACRO ; r, hi, lo
	ld \1, (\2 & $f) << 4 + (\3 & $f)
ENDM

ldpixel: MACRO
if _NARG >= 5
	lb \1, \2 * 8 + \4, \3 * 8 + \5
else
	lb \1, \2 * 8, \3 * 8
endc
ENDM

depixel EQUS "ldpixel de,"
bcpixel EQUS "ldpixel bc,"


; Design patterns

jumptable: MACRO
	ld a, [\2]
	ld e, a
	ld d, 0
	ld hl, \1
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
ENDM

maskbits: MACRO
; masks just enough bits to cover the argument
; e.g. "maskbits 26" becomes "and %00011111" (since 26 - 1 = %00011001)
; example usage in rejection sampling:
; .loop
; 	call Random
; 	maskbits 30
; 	cp 30
; 	jr nc, .loop
x = 1
rept 8
if x + 1 < (\1)
x = x << 1 | 1
endc
endr
	and x
ENDM
