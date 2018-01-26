BattleCommand_BeatUp: ; 35461
; beatup

	call ResetDamage
	ld a, [hBattleTurn]
	and a
	jp nz, .enemy_beats_up
	ld a, [PlayerSubStatus3]
	bit SUBSTATUS_IN_LOOP, a
	jr nz, .next_mon
	ld c, 20
	call DelayFrames
	xor a
	ld [PlayerRolloutCount], a
	ld [wd002], a
	ld [wBeatUpHitAtLeastOnce], a
	jr .got_mon

.next_mon
	ld a, [PlayerRolloutCount]
	ld b, a
	ld a, [PartyCount]
	sub b
	ld [wd002], a

.got_mon
	ld a, [wd002]
	ld hl, PartyMonNicknames
	call GetNick
	ld a, MON_HP
	call GetBeatupMonLocation
	ld a, [hli]
	or [hl]
	jp z, .beatup_fail ; fainted
	ld a, [wd002]
	ld c, a
	ld a, [CurBattleMon]
	; BUG: this can desynchronize link battles
	; Change "cp [hl]" to "cp c" to fix
	cp [hl]
	ld hl, BattleMonStatus
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
	call StdBattleTextBox
	ld a, [EnemyMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseDefense]
	ld c, a
	push bc
	ld a, MON_SPECIES
	call GetBeatupMonLocation
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseAttack]
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
	ld a, [EnemySubStatus3]
	bit SUBSTATUS_IN_LOOP, a
	jr nz, .not_first_enemy_beatup

	xor a
	ld [EnemyRolloutCount], a
	ld [wd002], a
	ld [wBeatUpHitAtLeastOnce], a
	jr .enemy_continue

.not_first_enemy_beatup
	ld a, [EnemyRolloutCount]
	ld b, a
	ld a, [OTPartyCount]
	sub b
	ld [wd002], a
.enemy_continue
	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld a, [wLinkMode]
	and a
	jr nz, .link_or_tower

	ld a, [InBattleTowerBattle]
	and a
	jr nz, .link_or_tower

	ld a, [wd002]
	ld c, a
	ld b, 0
	ld hl, OTPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	jr .got_enemy_nick

.link_or_tower
	ld a, [wd002]
	ld hl, OTPartyMonNicknames
	ld bc, NAME_LENGTH
	call AddNTimes
	ld de, StringBuffer1
	call CopyBytes
.got_enemy_nick
	ld a, MON_HP
	call GetBeatupMonLocation
	ld a, [hli]
	or [hl]
	jp z, .beatup_fail
	ld a, [wd002]
	ld b, a
	ld a, [CurOTMon]
	cp b
	ld hl, EnemyMonStatus
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
	ld a, [EnemyMonSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, BeatUpAttackText
	call StdBattleTextBox
	jp EnemyAttackDamage

.finish_beatup
	ld hl, BeatUpAttackText
	call StdBattleTextBox
	ld a, [BattleMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseDefense]
	ld c, a
	push bc
	ld a, MON_SPECIES
	call GetBeatupMonLocation
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseAttack]
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

; 355b0


.beatup_fail ; 355b0
	ld b, buildopponentrage_command
	jp SkipToBattleCommand

; 355b5


BattleCommanda8: ; 355b5
	ld a, [wBeatUpHitAtLeastOnce]
	and a
	ret nz

	jp PrintButItFailed

; 355bd


GetBeatupMonLocation: ; 355bd
	push bc
	ld c, a
	ld b, 0
	ld a, [hBattleTurn]
	and a
	ld hl, PartyMon1Species
	jr z, .got_species
	ld hl, OTPartyMon1Species

.got_species
	ld a, [wd002]
	add hl, bc
	call GetPartyLocation
	pop bc
	ret
