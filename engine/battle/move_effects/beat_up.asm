BattleCommand_BeatUp:
	call ResetDamage
	ldh a, [hBattleTurn]
	and a
	jp nz, .enemy_beats_up

	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_IN_LOOP, a
	jr nz, .next_mon

	ld c, 20
	call DelayFrames
	xor a
	ld [wPlayerRolloutCount], a
	ld [wCurBeatUpPartyMon], a
	ld [wBeatUpHitAtLeastOnce], a
	jr .got_mon

.next_mon
	ld a, [wPlayerRolloutCount]
	ld b, a
	ld a, [wPartyCount]
	sub b
	ld [wCurBeatUpPartyMon], a

.got_mon
; BUG: Beat Up can desynchronize link battles (see docs/bugs_and_glitches.md)
	ld a, [wCurBeatUpPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld a, MON_HP
	call GetBeatupMonLocation
	ld a, [hli]
	or [hl]
	jp z, .beatup_fail ; fainted
	ld a, [wCurBeatUpPartyMon]
	ld c, a
	ld a, [wCurBattleMon]
	cp [hl]
	ld hl, wBattleMonStatus
	jr z, .active_mon
	ld a, MON_STATUS
	call GetBeatupMonLocation
.active_mon
	ld a, [hl]
	and a
	jp nz, .beatup_fail

	ld a, $1
	ld [wBeatUpHitAtLeastOnce], a
	ld hl, BeatUpAttackText
	call StdBattleTextbox

	ld a, [wEnemyMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseDefense]
	ld c, a

	push bc
	ld a, MON_SPECIES
	call GetBeatupMonLocation
	ld a, [hl]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseAttack]
	pop bc
	ld b, a

	push bc
	ld a, MON_LEVEL
	call GetBeatupMonLocation
	ld a, [hl]
	ld e, a
	pop bc

	ld a, [wPlayerMoveStructPower]
	ld d, a
	ret

.enemy_beats_up
	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_IN_LOOP, a
	jr nz, .enemy_next_mon

	xor a
	ld [wEnemyRolloutCount], a
	ld [wCurBeatUpPartyMon], a
	ld [wBeatUpHitAtLeastOnce], a
	jr .enemy_got_mon

.enemy_next_mon
	ld a, [wEnemyRolloutCount]
	ld b, a
	ld a, [wOTPartyCount]
	sub b
	ld [wCurBeatUpPartyMon], a

.enemy_got_mon
	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld a, [wLinkMode]
	and a
	jr nz, .link_or_tower

	ld a, [wInBattleTowerBattle]
	and a
	jr nz, .link_or_tower

	ld a, [wCurBeatUpPartyMon]
	ld c, a
	ld b, 0
	ld hl, wOTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	jr .got_enemy_nick

.link_or_tower
	ld a, [wCurBeatUpPartyMon]
	ld hl, wOTPartyMonNicknames
	ld bc, NAME_LENGTH
	call AddNTimes
	ld de, wStringBuffer1
	call CopyBytes

.got_enemy_nick
	ld a, MON_HP
	call GetBeatupMonLocation
	ld a, [hli]
	or [hl]
	jp z, .beatup_fail

	ld a, [wCurBeatUpPartyMon]
	ld b, a
	ld a, [wCurOTMon]
	cp b
	ld hl, wEnemyMonStatus
	jr z, .active_enemy
	ld a, MON_STATUS
	call GetBeatupMonLocation
.active_enemy
	ld a, [hl]
	and a
	jr nz, .beatup_fail

	ld a, $1
	ld [wBeatUpHitAtLeastOnce], a
	jr .finish_beatup

.wild
	ld a, [wEnemyMonSpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld hl, BeatUpAttackText
	call StdBattleTextbox
	jp EnemyAttackDamage

.finish_beatup
	ld hl, BeatUpAttackText
	call StdBattleTextbox

	ld a, [wBattleMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseDefense]
	ld c, a

	push bc
	ld a, MON_SPECIES
	call GetBeatupMonLocation
	ld a, [hl]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseAttack]
	pop bc
	ld b, a

	push bc
	ld a, MON_LEVEL
	call GetBeatupMonLocation
	ld a, [hl]
	ld e, a
	pop bc

	ld a, [wEnemyMoveStructPower]
	ld d, a
	ret

.beatup_fail
	ld b, buildopponentrage_command
	jp SkipToBattleCommand

BattleCommand_BeatUpFailText:
; BUG: Beat Up may trigger King's Rock even if it failed (see docs/bugs_and_glitches.md)
	ld a, [wBeatUpHitAtLeastOnce]
	and a
	ret nz

	jp PrintButItFailed

GetBeatupMonLocation:
	push bc
	ld c, a
	ld b, 0
	ldh a, [hBattleTurn]
	and a
	ld hl, wPartyMon1Species
	jr z, .got_species
	ld hl, wOTPartyMon1Species

.got_species
	ld a, [wCurBeatUpPartyMon]
	add hl, bc
	call GetPartyLocation
	pop bc
	ret
