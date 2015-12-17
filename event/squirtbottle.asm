_Squirtbottle: ; 50730
	ld hl, UnknownScript_0x5073c
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret
; 5073c

UnknownScript_0x5073c: ; 0x5073c
	reloadmappart
	special UpdateTimePals
	callasm Function50753
	iffalse UnknownScript_0x5074b
	farjump WateredWeirdTreeScript
; 0x5074b

UnknownScript_0x5074b: ; 0x5074b
	jumptext UnknownText_0x5074e
; 0x5074e

UnknownText_0x5074e: ; 0x5074e
	; sprinkled water. But nothing happened…
	text_jump UnknownText_0x1c0b3b
	db "@"
; 0x50753

Function50753: ; 50753
	ld a, [MapGroup]
	cp GROUP_ROUTE_36
	jr nz, .asm_50774

	ld a, [MapNumber]
	cp MAP_ROUTE_36
	jr nz, .asm_50774

	callba GetFacingObject
	jr c, .asm_50774

	ld a, d
	cp $17
	jr nz, .asm_50774

	ld a, $1
	ld [ScriptVar], a
	ret

.asm_50774
	xor a
	ld [ScriptVar], a
	ret
; 50779
