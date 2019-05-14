INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "constants/collision_constants.inc"
INCLUDE "constants/std_constants.inc"


SECTION "engine/events/std_collision.asm", ROMX

CheckFacingTileForStdScript::
; Checks to see if the tile you're facing has a std script associated with it.  If so, executes the script and returns carry.
	ld a, c
	ld de, 3
	ld hl, TileCollisionStdScripts
	call IsInArray
	jr nc, .notintable

	ld a, jumpstd_command
	ld [wJumpStdScriptBuffer], a
	inc hl
	ld a, [hli]
	ld [wJumpStdScriptBuffer + 1], a
	ld a, [hli]
	ld [wJumpStdScriptBuffer + 2], a
	ld a, BANK(Script_JumpStdFromRAM)
	ld hl, Script_JumpStdFromRAM
	call CallScript
	scf
	ret

.notintable
	xor a
	ret

INCLUDE "data/events/collision_stdscripts.inc"

Script_JumpStdFromRAM:
	sjump wJumpStdScriptBuffer
