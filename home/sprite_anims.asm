PushLYOverrides::
	ldh a, [hLCDCPointer]
	and a
	ret z

	ld a, LOW(wLYOverridesBackup)
	ld [wRequested2bppSource], a
	ld a, HIGH(wLYOverridesBackup)
	ld [wRequested2bppSource + 1], a

	ld a, LOW(wLYOverrides)
	ld [wRequested2bppDest], a
	ld a, HIGH(wLYOverrides)
	ld [wRequested2bppDest + 1], a

	ld a, (wLYOverridesEnd - wLYOverrides) / 16
	ld [wRequested2bpp], a
	ret

_InitSpriteAnimStruct::
	ld [wSpriteAnimIDBuffer], a
	ldh a, [hROMBank]
	push af

	ld a, BANK(InitSpriteAnimStruct)
	rst Bankswitch
	ld a, [wSpriteAnimIDBuffer]

	call InitSpriteAnimStruct

	pop af
	rst Bankswitch

	ret

ReinitSpriteAnimFrame::
	ld [wSpriteAnimIDBuffer], a
	ldh a, [hROMBank]
	push af

	ld a, BANK(_ReinitSpriteAnimFrame)
	rst Bankswitch
	ld a, [wSpriteAnimIDBuffer]

	call _ReinitSpriteAnimFrame

	pop af
	rst Bankswitch

	ret
