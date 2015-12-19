ItemFinder: ; 12580
	callba CheckForHiddenItems
	jr c, .found_something
	ld hl, .Script_FoundNothing
	jr .resume

.found_something
	ld hl, .Script_FoundSomething

.resume
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret
; 12599

.ItemfinderSound: ; 12599
	ld c, 4
.sfx_loop
	push bc
	ld de, SFX_SECOND_PART_OF_ITEMFINDER
	call WaitPlaySFX
	ld de, SFX_TRANSACTION
	call WaitPlaySFX
	pop bc
	dec c
	jr nz, .sfx_loop
	ret
; 125ad

.Script_FoundSomething: ; 0x125ad
	reloadmappart
	special UpdateTimePals
	callasm .ItemfinderSound
	writetext .Text_FoundSomething
	closetext
	end
; 0x125ba

.Script_FoundNothing: ; 0x125ba
	reloadmappart
	special UpdateTimePals
	writetext .Text_FoundNothing
	closetext
	end
; 0x125c3

.Text_FoundSomething: ; 0x125c3
	; Yes! ITEMFINDER indicates there's an item nearby.
	text_jump UnknownText_0x1c0a77
	db "@"
; 0x125c8

.Text_FoundNothing: ; 0x125c8
	; Nope! ITEMFINDER isn't responding.
	text_jump UnknownText_0x1c0aa9
	db "@"
; 0x125cd
