Script_BattleWhiteout::
	callasm BattleBGMap
	sjump Script_Whiteout

OverworldWhiteoutScript::
	refreshscreen
	callasm OverworldBGMap

Script_Whiteout:
    checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .bug_contest
	callasm LoseWhiteOutMoney
	iffalse .plain_whiteout_text
	callasm CheckWildBattlePanic
	iffalse .wild_whiteout_text
	writetext .WhitedOutToTrainerText
	sjump .text_done
.wild_whiteout_text
	writetext .WhitedOutToWildMonText
	sjump .text_done
.plain_whiteout_text
	writetext .WhitedOutText
.text_done
	waitbutton
	special FadeOutPalettes
	pause 40
	special HealParty
	callasm GetWhiteoutSpawn
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	newloadmap MAPSETUP_WARP
	endall

.bug_contest
    writetext .WhitedOutText
	waitbutton
	special FadeOutPalettes
	pause 40
	special HealParty
	jumpstd BugContestResultsWarpScript

.WhitedOutText:
	text_far _WhitedOutText
	text_end
	
.WhitedOutToWildMonText:
	text_far _WhitedOutToWildMonText
	text_end

.WhitedOutToTrainerText:
	text_far _WhitedOutToTrainerText
	text_end

OverworldBGMap:
	call ClearPalettes
	call ClearScreen
	call WaitBGMap2
	call HideSprites
	call RotateThreePalettesLeft
	ret

BattleBGMap:
	ld b, SCGB_BATTLE_GRAYSCALE
	call GetSGBLayout
	call SetPalettes
	ret

LoseWhiteOutMoney:
; Lose money proportional to your badges and highest-level Pokémon.
	ld hl, wMoney
; Check if you have any money
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, .done
; Count your badges (capped at 8)
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	cp 9
	jr c, .got_badge_count
	ld c, 8
.got_badge_count
; Get the payout factor for your badge count
	ld b, 0
	ld hl, .PayoutBadgeFactors
	add hl, bc
	ld a, [hl]
	ldh [hMultiplier], a
; Get your highest party mon level
	ld a, [wPartyCount]
	ld c, a
	ld hl, wPartyMon1Level
	ld de, PARTYMON_STRUCT_LENGTH
.loop
	ld a, [hl]
	cp b
	jr c, .next
	ld b, a
.next
	add hl, de
	dec c
	jr nz, .loop
; Multiply the badge factor by the max level
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, b
	ldh [hMultiplicand + 2], a
	call Multiply
; Save the amount (capped at your total) in hMoneyTemp to print
	ld de, hMoneyTemp
	ld hl, hProduct + 1
	ld bc, 3
	call CopyBytes
	ld de, wMoney
	ld bc, hMoneyTemp
	push bc
	push de
	farcall CompareMoney
	jr nc, .not_enough
	ld hl, wMoney
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
.not_enough
	pop de
	pop bc
	farcall TakeMoney
; Return TRUE in [wScriptVar] if you had any money to lose
	ld a, TRUE
.done
	ld [wScriptVar], a
	ret

.PayoutBadgeFactors:
	db   8 ; 0
	db  16 ; 1
	db  24 ; 2
	db  36 ; 3
	db  48 ; 4
	db  64 ; 5
	db  80 ; 6
	db 100 ; 7
	db 120 ; 8+

CheckWildBattlePanic:
	ld hl, wWildBattlePanic
	ld a, [hl]
	and 1
	ld [wScriptVar], a
	xor a
	ld [hl], a
	ret

GetWhiteoutSpawn:
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	farcall IsSpawnPoint
	ld a, c
	jr c, .yes
	xor a ; SPAWN_HOME

.yes
	ld [wDefaultSpawnpoint], a
	ret
