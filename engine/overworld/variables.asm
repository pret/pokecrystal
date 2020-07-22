_GetVarAction::
	ld a, c
	cp NUM_VARS
	jr c, .valid
	xor a
.valid
	ld c, a
	ld b, 0
	ld hl, VarActionTable
	add hl, bc
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld b, [hl]
	ld a, b
	and RETVAR_EXECUTE
	jr nz, .call_de
	ld a, b
	and RETVAR_ADDR_DE
	ret nz
	ld a, [de]
	jr LoadStringBuffer2

.call_de
	call _de_
	ret

LoadStringBuffer2:
	ld de, wStringBuffer2
	ld [de], a
	ret

INCLUDE "data/overworld/variables.asm"

Var_CountCaughtMons:
; Caught mons.
	ld hl, wPokedexCaught
	ld b, wEndPokedexCaught - wPokedexCaught
	call CountSetBits
	ld a, [wNumSetBits]
	jp LoadStringBuffer2

Var_CountSeenMons:
; Seen mons.
	ld hl, wPokedexSeen
	ld b, wEndPokedexSeen - wPokedexSeen
	call CountSetBits
	ld a, [wNumSetBits]
	jp LoadStringBuffer2

Var_CountBadges:
; Number of owned badges.
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	ld a, [wNumSetBits]
	jp LoadStringBuffer2

Var_PlayerFacing:
; The direction the player is facing.
	ld a, [wPlayerDirection]
	and $c
	rrca
	rrca
	jp LoadStringBuffer2

Var_DayOfWeek:
; The day of the week.
	call GetWeekday
	jp LoadStringBuffer2

Var_UnownCaught:
; Number of unique Unown caught.
	call .count_unown
	ld a, b
	jp LoadStringBuffer2

.count_unown:
	ld hl, wUnownDex
	ld b, 0
.loop
	ld a, [hli]
	and a
	ret z
	inc b
	ld a, b
	cp NUM_UNOWN
	jr c, .loop
	ret

Var_BoxFreeSpace:
; Remaining slots in the current box.
	ld a, BANK(sBoxCount)
	call OpenSRAM
	ld hl, sBoxCount
	ld a, MONS_PER_BOX
	sub [hl]
	ld b, a
	call CloseSRAM
	ld a, b
	jp LoadStringBuffer2

Var_BattleResult:
; Outcome of the last battle.
	ld a, [wBattleResult]
	and $ff ^ BATTLERESULT_BITMASK
	jp LoadStringBuffer2
