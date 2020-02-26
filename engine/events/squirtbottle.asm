INCLUDE "macros/data.inc"
INCLUDE "macros/rst.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/map_constants.inc"
INCLUDE "constants/map_object_constants.inc"


SECTION "engine/events/squirtbottle", ROMX

_Squirtbottle::
	ld hl, .SquirtbottleScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.SquirtbottleScript:
	reloadmappart
	special UpdateTimePals
	callasm .CheckCanUseSquirtbottle
	iffalse .SquirtbottleNothingScript
	farsjump WateredWeirdTreeScript

.SquirtbottleNothingScript:
	jumptext .SquirtbottleNothingText

.SquirtbottleNothingText:
	text_far _SquirtbottleNothingText
	text_end

.CheckCanUseSquirtbottle:
	ld a, [wMapGroup]
	cp GROUP_ROUTE_36
	jr nz, .nope

	ld a, [wMapNumber]
	cp MAP_ROUTE_36
	jr nz, .nope

	farcall GetFacingObject
	jr c, .nope

	ld a, d
	cp SPRITEMOVEDATA_SUDOWOODO
	jr nz, .nope

	ld a, 1
	ld [wScriptVar], a
	ret

.nope
	xor a
	ld [wScriptVar], a
	ret
