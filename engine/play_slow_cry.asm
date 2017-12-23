PlaySlowCry: ; fb841
	ld a, [ScriptVar]
	call LoadCryHeader
	jr c, .done

	ld hl, CryPitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, -$140
	add hl, bc
	ld a, l
	ld [CryPitch], a
	ld a, h
	ld [CryPitch + 1], a
	ld hl, CryLength
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $60
	add hl, bc
	ld a, l
	ld [CryLength], a
	ld a, h
	ld [CryLength + 1], a
	callba _PlayCryHeader
	call WaitSFX

.done
	ret
; fb877
