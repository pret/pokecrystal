SetHPPal:: ; 334e
; Set palette for hp bar pixel length e at hl.
	call GetHPPal
	ld [hl], d
	ret
; 3353

GetHPPal:: ; 3353
; Get palette for hp bar pixel length e in d.
	ld d, HP_GREEN
	ld a, e
	cp (50 * 48 / 100)
	ret nc
	inc d ; HP_YELLOW
	cp (21 * 48 / 100)
	ret nc
	inc d ; HP_RED
	ret
; 335f
