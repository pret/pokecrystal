CorrectNickErrors::
; error-check monster nick before use
; must be a peace offering to gamesharkers

; input: de = nick location

	push bc
	push de
	ld b, MON_NAME_LENGTH

.checkchar
; end of nick?
	ld a, [de]
	cp '@' ; terminator
	jr z, .end

; check if this char is a text command
	ld hl, .textcommands
	dec hl
.loop
; next entry
	inc hl
; reached end of commands table?
	ld a, [hl]
	cp -1
	jr z, .done

; is the current char between this value (inclusive)...
	ld a, [de]
	cp [hl]
	inc hl
	jr c, .loop
; ...and this one?
	cp [hl]
	jr nc, .loop

; replace it with a '?'
	ld a, '?'
	ld [de], a
	jr .loop

.done
; next char
	inc de
; reached end of nick without finding a terminator?
	dec b
	jr nz, .checkchar

; change nick to "?@"
	pop de
	push de
	ld a, '?'
	ld [de], a
	inc de
	ld a, '@'
	ld [de], a
.end
; if the nick has any errors at this point it's out of our hands
	pop de
	pop bc
	ret

; Valid character ranges:
; $05 - $13, $19 - $1c, $26 - $34, $3a - $3e, $40 - $48, $5d, $7f - $ff

; Similar to CheckStringForErrors (mobile/mobile_5f.asm),
; but there are some differences in which characters are considered valid.
; In this list:
; • $00 is treated as invalid
; • $5d is treated as valid (since it appears in OT names)
; • $60 - $7e are treated as invalid

.textcommands
; table defining which characters are not valid characters in names

; format:
	;  ≥    <
	db $00, $04 + 1 ; '<NULL>'   to 'オ゙'
	db $14, $18 + 1 ; '<PLAY_G>' to '<JP_18>' (ノ゙)
	db $1d, $25 + 1 ; '<NI>'     to '<NO>'
	db $35, $39 + 1 ; '<ROUTE>'  to '<GREEN>'
	db $3f, $3f + 1 ; '<ENEMY>'
	db $49, $5c + 1 ; '<MOM>'    to '<TM>'
	db $5e, $7e + 1 ; '<ROCKET>' to '┘'
	db -1 ; end
