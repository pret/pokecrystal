ItemFinder:
	farcall CheckForHiddenItems
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

.ItemfinderSound:
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

.Script_FoundSomething:
	reloadmappart
	special UpdateTimePals
	callasm .ItemfinderSound
	writetext .Text_FoundSomething
	closetext
	end

.Script_FoundNothing:
	reloadmappart
	special UpdateTimePals
	writetext .Text_FoundNothing
	closetext
	end

.Text_FoundSomething:
	; Yes! ITEMFINDER indicates there's an item nearby.
	text_far UnknownText_0x1c0a77
	text_end

.Text_FoundNothing:
	; Nope! ITEMFINDER isn't responding.
	text_far UnknownText_0x1c0aa9
	text_end
