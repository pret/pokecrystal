# Bugs and Glitches

These are known bugs and glitches in the original Pokémon Crystal game: code that clearly does not work as intended, or that only works in limited circumstances but has the possibility to fail or crash.


## Contents

- [Thick Club and Light Ball can decrease damage done with boosted (Special) Attack](#thick-club-and-light-ball-can-decrease-damage-done-with-boosted-special-attack)
- [Metal Powder can increase damage taken with boosted (Special) Defense](#metal-powder-can-increase-damage-taken-with-boosted-special-defense)
- [Belly Drum sharply boosts Attack even with under 50% HP](#belly-drum-sharply-boosts-attack-even-with-under-50-hp)
- [Confusion damage is affected by type-boosting items and Explosion/Self-Destruct doubling](#confusion-damage-is-affected-by-type-boosting-items-and-explosionself-destruct-doubling)
- [Moves that lower Defense can do so after breaking a Substitute](#moves-that-lower-defense-can-do-so-after-breaking-a-substitute)
- [Counter and Mirror Coat still work if the opponent uses an item](#counter-and-mirror-coat-still-work-if-the-opponent-uses-an-item)
- [A Disabled but PP Up–enhanced move may not trigger Struggle](#a-disabled-but-pp-upenhanced-move-may-not-trigger-struggle)
- [A Pokémon that fainted from Pursuit will have its old status condition when revived](#a-pokémon-that-fainted-from-pursuit-will-have-its-old-status-condition-when-revived)
- [Lock-On and Mind Reader don't always bypass Fly and Dig](#lock-on-and-mind-reader-dont-always-bypass-fly-and-dig)
- [Beat Up can desynchronize link battles](#beat-up-can-desynchronize-link-battles)
- [Beat Up may fail to raise substitute](#beat-up-may-fail-to-raise-substitute)
- [Beat Up may trigger King's Rock even if it failed](#beat-up-may-trigger-kings-rock-even-if-it-failed)
- [Present damage is incorrect in link battles](#present-damage-is-incorrect-in-link-battles)
- ["Smart" AI encourages Mean Look if its own Pokémon is badly poisoned](#smart-ai-encourages-mean-look-if-its-own-pokémon-is-badly-poisoned)
- [AI makes a false assumption about `CheckTypeMatchup`](#ai-makes-a-false-assumption-about-checktypematchup)
- [NPC use of Full Heal or Full Restore does not cure Nightmare status](#npc-use-of-full-heal-or-full-restore-does-not-cure-nightmare-status)
- [HP bar animation is slow for high HP](#hp-bar-animation-is-slow-for-high-hp)
- [HP bar animation off-by-one error for low HP](#hp-bar-animation-off-by-one-error-for-low-hp)
- [Experience underflow for level 1 Pokémon with Medium-Slow growth rate](#experience-underflow-for-level-1-pokémon-with-medium-slow-growth-rate)
- [Five-digit experience gain is printed incorrectly](#five-digit-experience-gain-is-printed-incorrectly)
- [BRN/PSN/PAR do not affect catch rate](#brnpsnpar-do-not-affect-catch-rate)
- [Moon Ball does not boost catch rate](#moon-ball-does-not-boost-catch-rate)
- [Love Ball boosts catch rate for the wrong gender](#love-ball-boosts-catch-rate-for-the-wrong-gender)
- [Fast Ball only boosts catch rate for three Pokémon](#fast-ball-only-boosts-catch-rate-for-three-pokémon)
- [Dragon Scale, not Dragon Fang, boosts Dragon-type moves](#dragon-scale-not-dragon-fang-boosts-dragon-type-moves)
- [Daisy's grooming doesn't always increase happiness](#daisys-grooming-doesnt-always-increase-happiness)
- [Magikarp in Lake of Rage are shorter, not longer](#magikarp-in-lake-of-rage-are-shorter-not-longer)
- [Magikarp length limits have a unit conversion error](#magikarp-length-limits-have-a-unit-conversion-error)
- [Magikarp lengths can be miscalculated](#magikarp-lengths-can-be-miscalculated)
- [Battle transitions fail to account for the enemy's level](#battle-transitions-fail-to-account-for-the-enemys-level)
- [A "HOF Master!" title for 200-Time Famers is defined but inaccessible](#a-hof-master-title-for-200-time-famers-is-defined-but-inaccessible)
- [Slot machine payout sound effects cut each other off](#slot-machine-payout-sound-effects-cut-each-other-off)
- [Team Rocket battle music is not used for Executives or Scientists](#team-rocket-battle-music-is-not-used-for-executives-or-scientists)
- [No bump noise if standing on tile `$3E`](#no-bump-noise-if-standing-on-tile-3e)
- [Playing Entei's Pokédex cry can distort Raikou's and Suicune's](#playing-enteis-pokédex-cry-can-distort-raikous-and-suicunes)
- [In-battle “`…`” ellipsis is too high](#in-battle--ellipsis-is-too-high)
- [Two tiles in the `port` tileset are drawn incorrectly](#two-tiles-in-the-port-tileset-are-drawn-incorrectly)
- [`LoadMetatiles` wraps around past 128 blocks](#loadmetatiles-wraps-around-past-128-blocks)
- [Surfing directly across a map connection does not load the new map](#surfing-directly-across-a-map-connection-does-not-load-the-new-map)
- [Swimming NPCs aren't limited by their movement radius](#swimming-npcs-arent-limited-by-their-movement-radius)
- [`CheckOwnMon` only checks the first five letters of OT names](#checkownmon-only-checks-the-first-five-letters-of-ot-names)
- [Catching a Transformed Pokémon always catches a Ditto](#catching-a-transformed-pokémon-always-catches-a-ditto)
- [Using a Park Ball in normal battles has a corrupt animation](#using-a-park-ball-in-normal-battles-has-a-corrupt-animation)
- [`HELD_CATCH_CHANCE` has no effect](#held_catch_chance-has-no-effect)
- [Only the first three evolution entries can have Stone compatibility reported correctly](#only-the-first-three-evolution-entries-can-have-stone-compatibility-reported-correctly)
- [`EVOLVE_STAT` can break Stone compatibility reporting](#evolve_stat-can-break-stone-compatibility-reporting)
- [`ScriptCall` can overflow `wScriptStack` and crash](#scriptcall-can-overflow-wscriptstack-and-crash)
- [`LoadSpriteGFX` does not limit the capacity of `UsedSprites`](#loadspritegfx-does-not-limit-the-capacity-of-usedsprites)
- [`ChooseWildEncounter` doesn't really validate the wild Pokémon species](#choosewildencounter-doesnt-really-validate-the-wild-pokémon-species)
- [`TryObjectEvent` arbitrary code execution](#tryobjectevent-arbitrary-code-execution)
- [`CheckBugContestContestantFlag` can read beyond its data table](#checkbugcontestcontestantflag-can-read-beyond-its-data-table)
- [`ClearWRAM` only clears WRAM bank 1](#clearwram-only-clears-wram-bank-1)


## Thick Club and Light Ball can decrease damage done with boosted (Special) Attack

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=rGqu3d3pdok&t=450))

This is a bug with `SpeciesItemBoost` in [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm):


**Fix:**

```diff
; Double the stat
	sla l
	rl h
+
+	ld a, HIGH(MAX_STAT_VALUE)
+	cp h
+	jr c, .cap
+	ld a, LOW(MAX_STAT_VALUE)
+	cp l
+	ret nc
+
+.cap
+	ld h, HIGH(MAX_STAT_VALUE)
+	ld l, LOW(MAX_STAT_VALUE)
	ret
```


## Metal Powder can increase damage taken with boosted (Special) Defense

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=rGqu3d3pdok&t=450))

This is a bug with `DittoMetalPowder` in [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm):


**Fix:**

```diff
	ld a, c
	srl a
	add c
	ld c, a
	ret nc

	srl b
	ld a, b
	and a
	jr nz, .done
	inc b
.done
	scf
	rr c
+
+	ld a, HIGH(MAX_STAT_VALUE)
+	cp b
+	jr c, .cap
+	ld a, LOW(MAX_STAT_VALUE)
+	cp c
+	ret nc
+
+.cap
+	ld b, HIGH(MAX_STAT_VALUE)
+	ld c, LOW(MAX_STAT_VALUE)
	ret
```


## Belly Drum sharply boosts Attack even with under 50% HP

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=zuCLMikWo4Y))

This is a bug with `BattleCommand_BellyDrum` in [engine/battle/move_effects/belly_drum.asm](/engine/battle/move_effects/belly_drum.asm):


**Fix:**

```diff
BattleCommand_BellyDrum:
; bellydrum
-; This command is buggy because it raises the user's attack
-; before checking that it has enough HP to use the move.
-; Swap the order of these two blocks to fix.
+	callfar GetHalfMaxHP
+	callfar CheckUserHasEnoughHP
+	jr nc, .failed
+
	call BattleCommand_AttackUp2
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
-
-	callfar GetHalfMaxHP
-	callfar CheckUserHasEnoughHP
-	jr nc, .failed
```


## Confusion damage is affected by type-boosting items and Explosion/Self-Destruct doubling

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://twitter.com/crystal_rby/status/874626362287562752))

*To do:* Identify specific code causing this bug and fix it.


## Moves that lower Defense can do so after breaking a Substitute

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=OGwKPRJLaaI))

This bug affects Acid, Iron Tail, and Rock Smash.

This is a bug with `DefenseDownHit` in [data/moves/effects.asm](/data/moves/effects.asm):


**Fix:**

```asm
DefenseDownHit:
	checkobedience
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	hittarget
	failuretext
	checkfaint
	criticaltext
	supereffectivetext
	checkdestinybond
	buildopponentrage
-	effectchance ; bug: duplicate effectchance shouldn't be here
	defensedown
	statdownmessage
	endmove
```


## Counter and Mirror Coat still work if the opponent uses an item

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=uRYyzKRatFk))

This is a bug with `BattleCommand_Counter` in [engine/battle/move_effects/counter.asm](/engine/battle/move_effects/counter.asm) and `BattleCommand_MirrorCoat` in [engine/battle/move_effects/mirror_coat.asm](/engine/battle/move_effects/mirror_coat.asm):


**Fix:**

```diff
-	; BUG: Move should fail with all non-damaging battle actions
	ld hl, wCurDamage
	ld a, [hli]
	or [hl]
-	ret z
+	jp z, .failed
```

Add this to the end of each file:

```diff
+.failed
+	ld a, 1
+	ld [wEffectFailed], a
+	and a
+	ret
```


## A Disabled but PP Up–enhanced move may not trigger Struggle

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=1v9x4SgMggs))

This is a bug with `CheckPlayerHasUsableMoves` in [engine/battle/core.asm](/engine/battle/core.asm):


**Fix:**

```diff
.done
-	; Bug: this will result in a move with PP Up confusing the game.
-	and a ; should be "and PP_MASK"
+	and PP_MASK
	ret nz

.force_struggle
	ld hl, BattleText_MonHasNoMovesLeft
	call StdBattleTextBox
	ld c, 60
	call DelayFrames
	xor a
	ret
```


## A Pokémon that fainted from Pursuit will have its old status condition when revived

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=tiRvw-Nb2ME))

*To do:* Identify specific code causing this bug and fix it.


## Lock-On and Mind Reader don't always bypass Fly and Dig

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

This bug affects Attract, Curse, Foresight, Mean Look, Mimic, Nightmare, Spider Web, Transform, and stat-lowering effects of moves like String Shot or Bubble during the semi-invulnerable turn of Fly or Dig.

This is a bug with `CheckHiddenOpponent` in [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm):


**Fix:**

```diff
CheckHiddenOpponent:
-; BUG: This routine is completely redundant and introduces a bug, since BattleCommand_CheckHit does these checks properly.
-	ld a, BATTLE_VARS_SUBSTATUS3_OPP
-	call GetBattleVar
-	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret
```

The code in `CheckHiddenOpponent` is completely redundant as `BattleCommand_CheckHit` already does what this code is doing. Another option is to remove `CheckHiddenOpponent` completely, the calls to `CheckHiddenOpponent`, and the jump afterwards.


## Beat Up can desynchronize link battles

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=202-iAsrIa8))

This is a bug with `BattleCommand_BeatUp` in [engine/battle/move_effects/beat_up.asm](/engine/battle/move_effects/beat_up.asm):


**Fix:**

```diff
.got_mon
	ld a, [wd002]
	ld hl, wPartyMonNicknames
	call GetNick
	ld a, MON_HP
	call GetBeatupMonLocation
	ld a, [hli]
	or [hl]
	jp z, .beatup_fail ; fainted
	ld a, [wd002]
	ld c, a
	ld a, [wCurBattleMon]
-	; BUG: this can desynchronize link battles
-	; Change "cp [hl]" to "cp c" to fix
-	cp [hl]
+	cp c
	ld hl, wBattleMonStatus
	jr z, .active_mon
	ld a, MON_STATUS
	call GetBeatupMonLocation
.active_mon
	ld a, [hl]
	and a
	jp nz, .beatup_fail
```


## Beat Up may fail to raise substitute

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*  
(Only the fixes denoted with "breaking" will actually break compatibility, the others just affect what's shown on the screen with the patched game)

This is a bug in `BattleCommand_EndLoop` in [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm) that prevents the rest of the move's effect from being executed if the player or enemy only has one mon in their party while using Beat Up.

It prevents the substitute from being raised and the King's Rock from working.


**Fix (breaking):**

```diff
.only_one_beatup
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]
-	call BattleCommand_BeatUpFailText
-	jp EndMoveEffect
+	ret
```

**Fix (cosmetics):**

```diff
.only_one_beatup
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]
	call BattleCommand_BeatUpFailText
+	call BattleCommand_RaiseSub
	jp EndMoveEffect
```


There's a similar oversight in `BattleCommand_FailureText` in [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm) that will prevent the substitute from being raised if Beat Up is protected against.


**Fix (cosmetics):**

```asm
	cp EFFECT_MULTI_HIT
	jr z, .multihit
	cp EFFECT_DOUBLE_HIT
	jr z, .multihit
	cp EFFECT_POISON_MULTI_HIT
	jr z, .multihit
+	cp EFFECT_BEAT_UP
+	jr z, .multihit
	jp EndMoveEffect

.multihit
	call BattleCommand_RaiseSub
	jp EndMoveEffect
```


## Beat Up may trigger King's Rock even if it failed

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

This is a bug in how `wAttackMissed` is never set by BeatUp, even when none of the 'mon have been able to attack (due to being fainted or having a status effect), the King's Rock may activate.

This bug can be fixed in a plethora of ways, but the most straight-forward would be in `BattleCommand_BeatUpFailText` in [engine/battle/move_effects/beat_up.asm](/engine/battle/move_effects/beat_up.asm), as that's always ran before the king's rock effect.


**Fix:**

```diff
BattleCommand_BeatUpFailText:
; beatupfailtext

	ld a, [wBeatUpHitAtLeastOnce]
	and a
	ret nz
+
+	inc a
+	ld [wAttackMissed], a

	jp PrintButItFailed
```


## Present damage is incorrect in link battles

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=XJaQoKtrEuw))

This bug existed for all battles in Gold and Silver, and was only fixed for single-player battles in Crystal to preserve link compatibility.

This is a bug with `BattleCommand_Present` in [engine/battle/move_effects/present.asm](/engine/battle/move_effects/present.asm):


**Fix:**

```diff
BattleCommand_Present:
; present

-	ld a, [wLinkMode]
-	cp LINK_COLOSSEUM
-	jr z, .colosseum_skippush
	push bc
	push de
-.colosseum_skippush
-
	call BattleCommand_Stab
-
-	ld a, [wLinkMode]
-	cp LINK_COLOSSEUM
-	jr z, .colosseum_skippop
	pop de
	pop bc
-.colosseum_skippop
```


## "Smart" AI encourages Mean Look if its own Pokémon is badly poisoned

([Video](https://www.youtube.com/watch?v=cygMO-zHTls))

This is a bug with `AI_Smart_MeanLook` in [engine/battle/ai/scoring.asm](/engine/battle/ai/scoring.asm):


**Fix:**

```diff
-; 80% chance to greatly encourage this move if the enemy is badly poisoned (buggy).
-; Should check wPlayerSubStatus5 instead.
-	ld a, [wEnemySubStatus5]
+; 80% chance to greatly encourage this move if the player is badly poisoned
+	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_38e26
```


## AI makes a false assumption about `CheckTypeMatchup`

In [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm):

```asm
BattleCheckTypeMatchup:
	ld hl, wEnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, CheckTypeMatchup
	ld hl, wBattleMonType1
CheckTypeMatchup:
; There is an incorrect assumption about this function made in the AI related code: when
; the AI calls CheckTypeMatchup (not BattleCheckTypeMatchup), it assumes that placing the
; offensive type in a will make this function do the right thing. Since a is overwritten,
; this assumption is incorrect. A simple fix would be to load the move type for the
; current move into a in BattleCheckTypeMatchup, before falling through, which is
; consistent with how the rest of the code assumes this code works like.
	push hl
	push de
	push bc
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	ld d, a
```

*To do:* Fix this bug.


## NPC use of Full Heal or Full Restore does not cure Nightmare status

([Video](https://www.youtube.com/watch?v=rGqu3d3pdok&t=322))

This is a bug with `AI_HealStatus` in [engine/battle/ai/items.asm](/engine/battle/ai/items.asm):


**Fix:**

```diff
AI_HealStatus:
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hl], a
	ld [wEnemyMonStatus], a
-	; Bug: this should reset SUBSTATUS_NIGHTMARE too
-	; Uncomment the lines below to fix
-	; ld hl, wEnemySubStatus1
-	; res SUBSTATUS_NIGHTMARE, [hl]
+	ld hl, wEnemySubStatus1
+	res SUBSTATUS_NIGHTMARE, [hl]
	ld hl, wEnemySubStatus5
	res SUBSTATUS_TOXIC, [hl]
	ret
```


## HP bar animation is slow for high HP

([Video](https://www.youtube.com/watch?v=SE-BfsFgZVM))

This is a bug with `LongAnim_UpdateVariables` in [engine/battle/anim_hp_bar.asm](/engine/battle/anim_hp_bar.asm):


**Fix:**

```diff
-	; This routine is buggy. The result from ComputeHPBarPixels is stored
-	; in e. However, the pop de opcode deletes this result before it is even
-	; used. The game then proceeds as though it never deleted that output.
-	; To fix, uncomment the line below.
	call ComputeHPBarPixels
-	; ld a, e
+	ld a, e
	pop bc
	pop de
	pop hl
-	ld a, e ; Comment or delete this line to fix the above bug.
	ld hl, wCurHPBarPixels
	cp [hl]
	jr z, .loop
	ld [hl], a
	and a
	ret
```


## HP bar animation off-by-one error for low HP

([Video](https://www.youtube.com/watch?v=9KyNVIZxJvI))

This is a bug with `ShortHPBar_CalcPixelFrame` in [engine/battle/anim_hp_bar.asm](/engine/battle/anim_hp_bar.asm):


**Fix:**

```diff
	ld b, 0
-; This routine is buggy. If [wCurHPAnimMaxHP] * [wCurHPBarPixels] is
-; divisible by HP_BAR_LENGTH_PX, the loop runs one extra time.
-; To fix, uncomment the line below.
.loop
	ld a, l
	sub HP_BAR_LENGTH_PX
	ld l, a
	ld a, h
	sbc $0
	ld h, a
-	; jr z, .done
+	jr z, .done
	jr c, .done
	inc b
	jr .loop
```


## Experience underflow for level 1 Pokémon with Medium-Slow growth rate

([Video](https://www.youtube.com/watch?v=SXH8u0plHrE))

This can bring Pokémon straight from level 1 to 100 by gaining just a few experience points.

This is a bug with `CalcExpAtLevel` in [engine/pokemon/experience.asm](/engine/pokemon/experience.asm):


**Fix:**

```diff
CalcExpAtLevel:
; (a/b)*n**3 + c*n**2 + d*n - e
+	ld a, d
+	cp 1
+	jr nz, .UseExpFormula
+; Pokémon have 0 experience at level 1
+	xor a
+	ld hl, hProduct
+	ld [hli], a
+	ld [hli], a
+	ld [hli], a
+	ld [hl], a
+	ret
+
+.UseExpFormula
	ld a, [wBaseGrowthRate]
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, GrowthRates
	add hl, bc
```


## Five-digit experience gain is printed incorrectly

([Video](https://www.youtube.com/watch?v=o54VjpAEoO8))

This is a bug with `Text_ABoostedStringBuffer2ExpPoints` and `Text_StringBuffer2ExpPoints` in [data/text/common_2.asm](/data/text/common_2.asm):


**Fix:**

```diff
Text_ABoostedStringBuffer2ExpPoints::
	text_start
	line "a boosted"
	cont "@"
-	deciram wStringBuffer2, 2, 4
+	deciram wStringBuffer2, 2, 5
	text " EXP. Points!"
	prompt

Text_StringBuffer2ExpPoints::
	text_start
	line "@"
-	deciram wStringBuffer2, 2, 4
+	deciram wStringBuffer2, 2, 5
	text " EXP. Points!"
	prompt
```


## BRN/PSN/PAR do not affect catch rate

This is a bug with `PokeBallEffect` in [engine/items/item_effects.asm](/engine/items/item_effects.asm):


**Fix:**

```diff
-; This routine is buggy. It was intended that SLP and FRZ provide a higher
-; catch rate than BRN/PSN/PAR, which in turn provide a higher catch rate than
-; no status effect at all. But instead, it makes BRN/PSN/PAR provide no
-; benefit.
-; Uncomment the line below to fix this.
	ld b, a
	ld a, [wEnemyMonStatus]
	and 1 << FRZ | SLP
	ld c, 10
	jr nz, .addstatus
-	; ld a, [wEnemyMonStatus]
+	ld a, [wEnemyMonStatus]
	and a
	ld c, 5
	jr nz, .addstatus
	ld c, 0
.addstatus
	ld a, b
	add c
	jr nc, .max_1
	ld a, $ff
.max_1
```


## Moon Ball does not boost catch rate

This is a bug with `MoonBallMultiplier` in [items/item_effects.asm](/items/item_effects.asm):


**Fix:**

```diff
-; Moon Stone's constant from Pokémon Red is used.
-; No Pokémon evolve with Burn Heal,
-; so Moon Balls always have a catch rate of 1×.
	push bc
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
-	cp MOON_STONE_RED ; BURN_HEAL
+	cp MOON_STONE
	pop bc
	ret nz
```


## Love Ball boosts catch rate for the wrong gender

This is a bug with `LoveBallMultiplier` in [items/item_effects.asm](/items/item_effects.asm):


**Fix:**

```diff
.wildmale

	ld a, d
	pop de
	cp d
	pop bc
-	ret nz ; for the intended effect, this should be "ret z"
+	ret z
```


## Fast Ball only boosts catch rate for three Pokémon

This is a bug with `FastBallMultiplier` in [items/item_effects.asm](/items/item_effects.asm):


**Fix:**

```diff
.loop
	ld a, BANK(FleeMons)
	call GetFarByte

	inc hl
	cp -1
	jr z, .next
	cp c
-	jr nz, .next ; for the intended effect, this should be "jr nz, .loop"
+	jr nz, .loop
	sla b
	jr c, .max
```


## Dragon Scale, not Dragon Fang, boosts Dragon-type moves

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

This is a bug with `ItemAttributes` in [data/items/attributes.asm](/data/items/attributes.asm):


**Fix:**

```diff
; DRAGON_FANG
-	item_attribute 100, HELD_NONE, 0, CANT_SELECT, ITEM, ITEMMENU_NOUSE, ITEMMENU_NOUSE
+	item_attribute 100, HELD_DRAGON_BOOST, 0, CANT_SELECT, ITEM, ITEMMENU_NOUSE, ITEMMENU_NOUSE
```

And:

```diff
; DRAGON_SCALE
-	item_attribute 2100, HELD_DRAGON_BOOST, 10, CANT_SELECT, ITEM, ITEMMENU_NOUSE, ITEMMENU_NOUSE
+	item_attribute 2100, HELD_NONE, 10, CANT_SELECT, ITEM, ITEMMENU_NOUSE, ITEMMENU_NOUSE
```


## Daisy's grooming doesn't always increase happiness

This is a bug with `HaircutOrGrooming` in [engine/events/haircut.asm](/engine/events/haircut.asm):

```asm
; Bug: Subtracting $ff from $ff fails to set c.
; This can result in overflow into the next data array.
; In the case of getting a grooming from Daisy, we bleed
; into CopyPokemonName_Buffer1_Buffer3, which passes
; $d0 to ChangeHappiness and returns $73 to the script.
; The end result is that there is a 0.4% chance your
; Pokemon's happiness will not change at all.
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	inc hl
	jr .loop

.ok
	inc hl
	ld a, [hli]
	ld [wScriptVar], a
	ld c, [hl]
	call ChangeHappiness
	ret

...

INCLUDE "data/events/happiness_probabilities.asm"

CopyPokemonName_Buffer1_Buffer3:
	ld hl, wStringBuffer1
	ld de, wStringBuffer3
	ld bc, MON_NAME_LENGTH
	jp CopyBytes
```

In [data/events/happiness_probabilities.asm](/data/events/happiness_probabilities.asm):


**Fix:**

```diff
HappinessData_DaisysGrooming:
-	db $ff, 2, HAPPINESS_GROOMING ; 99.6% chance
+	db $80, 2, HAPPINESS_GROOMING ; 50% chance
+	db $ff, 2, HAPPINESS_GROOMING ; 50% chance
```


## Magikarp in Lake of Rage are shorter, not longer

This is a bug with `LoadEnemyMon.CheckMagikarpArea` in [engine/battle/core.asm](/engine/battle/core.asm):


**Fix:**

```diff
.CheckMagikarpArea:
-; The "jr z" checks are supposed to be "jr nz".
-
-; Instead, all maps in GROUP_LAKE_OF_RAGE (Mahogany area)
-; and Routes 20 and 44 are treated as Lake of Rage.
-
-; This also means Lake of Rage Magikarp can be smaller than ones
-; caught elsewhere rather than the other way around.
-
-; Intended behavior enforces a minimum size at Lake of Rage.
-; The real behavior prevents a minimum size in the Lake of Rage area.
-
-; Moreover, due to the check not being translated to feet+inches, all Magikarp
-; smaller than 4'0" may be caught by the filter, a lot more than intended.
	ld a, [wMapGroup]
	cp GROUP_LAKE_OF_RAGE
-	jr z, .Happiness
+	jr nz, .Happiness
	ld a, [wMapNumber]
	cp MAP_LAKE_OF_RAGE
-	jr z, .Happiness
+	jr nz, .Happiness
```


## Magikarp length limits have a unit conversion error

This is a bug with `LoadEnemyMon.CheckMagikarpArea` in [engine/battle/core.asm](/engine/battle/core.asm):


**Fix:**

```diff
; Get Magikarp's length
	ld de, wEnemyMonDVs
	ld bc, wPlayerID
	callfar CalcMagikarpLength

; No reason to keep going if length > 1536 mm (i.e. if HIGH(length) > 6 feet)
	ld a, [wMagikarpLength]
-	cp HIGH(1536) ; should be "cp 5", since 1536 mm = 5'0", but HIGH(1536) = 6
+	cp 5
	jr nz, .CheckMagikarpArea

; 5% chance of skipping both size checks
	call Random
	cp 5 percent
	jr c, .CheckMagikarpArea
; Try again if length >= 1616 mm (i.e. if LOW(length) >= 3 inches)
	ld a, [wMagikarpLength + 1]
-	cp LOW(1616) ; should be "cp 3", since 1616 mm = 5'3", but LOW(1616) = 80
+	cp 3
	jr nc, .GenerateDVs

; 20% chance of skipping this check
	call Random
	cp 20 percent - 1
	jr c, .CheckMagikarpArea
; Try again if length >= 1600 mm (i.e. if LOW(length) >= 2 inches)
	ld a, [wMagikarpLength + 1]
-	cp LOW(1600) ; should be "cp 2", since 1600 mm = 5'2", but LOW(1600) = 64
+	cp 2
	jr nc, .GenerateDVs
```


## Magikarp lengths can be miscalculated

This is a bug with `CalcMagikarpLength.BCLessThanDE` in [engine/events/magikarp.asm](/engine/events/magikarp.asm):


**Fix:**

```diff
.BCLessThanDE:
-; Intention: Return bc < de.
-; Reality: Return b < d.
	ld a, b
	cp d
	ret c
-	ret nc ; whoops
	ld a, c
	cp e
	ret
```


## Battle transitions fail to account for the enemy's level

([Video](https://www.youtube.com/watch?v=eij_1060SMc))

This is a bug with `StartTrainerBattle_DetermineWhichAnimation` in [engine/battle/battle_transition.asm](/engine/battle/battle_transition.asm):

```asm
StartTrainerBattle_DetermineWhichAnimation:
; The screen flashes a different number of times depending on the level of
; your lead Pokemon relative to the opponent's.
; BUG: wBattleMonLevel and wEnemyMonLevel are not set at this point, so whatever
; values happen to be there will determine the animation.
	ld de, 0
	ld a, [wBattleMonLevel]
	add 3
	ld hl, wEnemyMonLevel
	cp [hl]
	jr nc, .not_stronger
	set TRANS_STRONGER_F, e
.not_stronger
	ld a, [wEnvironment]
	cp CAVE
	jr z, .cave
	cp ENVIRONMENT_5
	jr z, .cave
	cp DUNGEON
	jr z, .cave
	set TRANS_NO_CAVE_F, e
.cave
	ld hl, .StartingPoints
	add hl, de
	ld a, [hl]
	ld [wJumptableIndex], a
	ret

.StartingPoints:
; entries correspond to TRANS_* constants
	db BATTLETRANSITION_CAVE
	db BATTLETRANSITION_CAVE_STRONGER
	db BATTLETRANSITION_NO_CAVE
	db BATTLETRANSITION_NO_CAVE_STRONGER
```

*To do:* Fix this bug.


## A "HOF Master!" title for 200-Time Famers is defined but inaccessible

([Video](https://www.youtube.com/watch?v=iHkWubvxmSg))

This is a bug with `_HallOfFamePC.DisplayMonAndStrings` in [engine/events/halloffame.asm](/engine/events/halloffame.asm):


**Fix:**

```diff
	ld a, [wHallOfFameTempWinCount]
-	cp HOF_MASTER_COUNT + 1 ; should be HOF_MASTER_COUNT
+	cp HOF_MASTER_COUNT
	jr c, .print_num_hof
	ld de, .HOFMaster
	hlcoord 1, 2
	call PlaceString
	hlcoord 13, 2
	jr .finish
```


## Slot machine payout sound effects cut each other off

([Video](https://www.youtube.com/watch?v=ojq3xqfRF6I))

This is a bug with `Slots_PayoutAnim` in [engine/games/slot_machine.asm](/engine/games/slot_machine.asm):


**Fix:**

```diff
.okay
	ld [hl], e
	dec hl
	ld [hl], d
	ld a, [wSlotsDelay]
	and $7
-	ret z ; ret nz would be more appropriate
+	ret nz
	ld de, SFX_GET_COIN_FROM_SLOTS
	call PlaySFX
	ret
```


## Team Rocket battle music is not used for Executives or Scientists

This is a bug with `PlayBattleMusic` in [engine/battle/start_battle.asm](/engine/battle/start_battle.asm):


**Fix:**

```diff
	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jr z, .done
	cp GRUNTF
	jr z, .done
+	cp EXECUTIVEM
+	jr z, .done
+	cp EXECUTIVEF
+	jr z, .done
+	cp SCIENTIST
+	jr z, .done
```


## No bump noise if standing on tile `$3E`

This is a bug with `DoPlayerMovement.CheckWarp` in [engine/overworld/player_movement.asm](/engine/overworld/player_movement.asm):


**Fix:**

```diff
.CheckWarp:
-; Bug: Since no case is made for STANDING here, it will check
-; [.edgewarps + $ff]. This resolves to $3e at $8035a.
-; This causes wd041 to be nonzero when standing on tile $3e,
-; making bumps silent.
-
	ld a, [wWalkingDirection]
-	; cp STANDING
-	; jr z, .not_warp
+	cp STANDING
+	jr z, .not_warp
	ld e, a
	ld d, 0
	ld hl, .EdgeWarps
	add hl, de
	ld a, [wPlayerStandingTile]
	cp [hl]
	jr nz, .not_warp

	ld a, 1
	ld [wd041], a
	ld a, [wWalkingDirection]
-	; This is in the wrong place.
-	cp STANDING
-	jr z, .not_warp
```


## Playing Entei's Pokédex cry can distort Raikou's and Suicune's

([Video](https://www.youtube.com/watch?v=z305e4sIO24))

The exact cause is unknown, but a workaround exists for `DexEntryScreen_MenuActionJumptable.Cry` in [engine/pokedex/pokedex.asm](/engine/pokedex/pokedex.asm):


**Workaround:**

```diff
.Cry:
-	call Pokedex_GetSelectedMon
-	ld a, [wd265]
-	call GetCryIndex
-	ld e, c
-	ld d, b
-	call PlayCry
+	ld a, [wCurPartySpecies]
+	call PlayMonCry
	ret
```


## In-battle “`…`” ellipsis is too high

This is a mistake with the “`…`” tile in [gfx/battle/hp_exp_bar_border.png](/gfx/battle/hp_exp_bar_border.png):

![image](/docs/images/hp_exp_bar_border.png)

**Fix:** Lower the ellipsis by two pixels:

![image](/docs/images/hp_exp_bar_border_fix.png)


## Two tiles in the `port` tileset are drawn incorrectly

This is a mistake with the left-hand warp carpet corner tiles in [gfx/tilesets/port.png](/gfx/tilesets/port.png):

![image](/docs/images/port.png)

**Fix:** Adjust them to match the right-hand corner tiles:

![image](/docs/images/port_fix.png)


## `LoadMetatiles` wraps around past 128 blocks

This bug prevents you from using blocksets with more than 128 blocks.

In [home/map.asm](/home/map.asm):


**Fix:**

```diff
	; Set hl to the address of the current metatile data ([wTilesetBlocksAddress] + (a) tiles).
-	; This is buggy; it wraps around past 128 blocks.
-	; To fix, uncomment the line below.
-	add a ; Comment or delete this line to fix the above bug.
	ld l, a
	ld h, 0
-	; add hl, hl
+	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, [wTilesetBlocksAddress]
	add l
	ld l, a
	ld a, [wTilesetBlocksAddress + 1]
	adc h
	ld h, a
```


## Surfing directly across a map connection does not load the new map

([Video](https://www.youtube.com/watch?v=XFOWvMNG-zw))

*To do:* Identify specific code causing this bug and fix it.


## Swimming NPCs aren't limited by their movement radius

This bug is why the Lapras in [maps/UnionCaveB2F.asm](/maps/UnionCaveB2F.asm), which uses `SPRITEMOVEDATA_SWIM_WANDER`, is not restricted by its `1, 1` movement radius.

This is a bug with `CanObjectMoveInDirection` in [engine/overworld/npc_movement.asm](/engine/overworld/npc_movement.asm):


**Fix:**

```diff
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit NOCLIP_TILES_F, [hl] ; lost, uncomment next line to fix
-	; jr nz, .noclip_tiles
+	jr nz, .noclip_tiles
```


## `CheckOwnMon` only checks the first five letters of OT names

([Video](https://www.youtube.com/watch?v=GVTTmReM4nQ))

This bug can allow you to talk to Eusine in Celadon City and encounter Ho-Oh with only traded legendary beasts.

In [engine/pokemon/search.asm](/engine/pokemon/search.asm):


**Fix:**

```diff
; check OT
-; This only checks five characters, which is fine for the Japanese version,
-; but in the English version the player name is 7 characters, so this is wrong.

	ld hl, wPlayerName

-rept NAME_LENGTH_JAPANESE + -2 ; should be PLAYER_NAME_LENGTH + -2
+rept PLAYER_NAME_LENGTH + -2
	ld a, [de]
	cp [hl]
	jr nz, .notfound
	cp "@"
	jr z, .found ; reached end of string
	inc hl
	inc de
endr

	ld a, [de]
	cp [hl]
	jr z, .found
```


## Catching a Transformed Pokémon always catches a Ditto

This bug can affect Mew or Pokémon other than Ditto that used Transform via Mirror Move or Sketch.

This is a bug with `PokeBallEffect` in [engine/items/item_effects.asm](/engine/items/item_effects.asm):


**Fix:**

```diff
	ld hl, wEnemySubStatus5
	ld a, [hl]
	push af
	set SUBSTATUS_TRANSFORMED, [hl]

-; This code is buggy. Any wild Pokémon that has Transformed will be
-; caught as a Ditto, even if it was something else like Mew.
-; To fix, do not set [wTempEnemyMonSpecies] to DITTO.
	bit SUBSTATUS_TRANSFORMED, a
-	jr nz, .ditto
-	jr .not_ditto
+	jr nz, .load_data

-.ditto
-	ld a, DITTO
-	ld [wTempEnemyMonSpecies], a
-	jr .load_data
-
-.not_ditto
-	set SUBSTATUS_TRANSFORMED, [hl]
	ld hl, wEnemyBackupDVs
	ld a, [wEnemyMonDVs]
	ld [hli], a
	ld a, [wEnemyMonDVs + 1]
	ld [hl], a

.load_data
	ld a, [wTempEnemyMonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wEnemyMonLevel]
	ld [wCurPartyLevel], a
	farcall LoadEnemyMon

	pop af
	ld [wEnemySubStatus5], a
```


## Using a Park Ball in normal battles has a corrupt animation

([Video](https://www.youtube.com/watch?v=v1ErZdLCIyU))

This is a bug with `PokeBallEffect` in [engine/items/item_effects.asm](/engine/items/item_effects.asm):


**Fix:**

```diff
.room_in_party
	xor a
	ld [wWildMon], a
-	ld a, [wCurItem]
-	cp PARK_BALL
+	ld a, [wBattleType]
+	cp BATTLETYPE_CONTEST
	call nz, ReturnToBattle_UseBall
```


## `HELD_CATCH_CHANCE` has no effect

This is a bug with `PokeBallEffect` in [engine/items/item_effects.asm](/engine/items/item_effects.asm):


**Fix:**

```diff
-	; BUG: farcall overwrites a, and GetItemHeldEffect takes b anyway.
-	; This is probably the reason the HELD_CATCH_CHANCE effect is never used.
-	; Uncomment the line below to fix.
	ld d, a
	push de
	ld a, [wBattleMonItem]
-	; ld b, a
+	ld b, a
	farcall GetItemHeldEffect
	ld a, b
	cp HELD_CATCH_CHANCE
	pop de
	ld a, d
	jr nz, .max_2
	add c
	jr nc, .max_2
	ld a, $ff
.max_2
```


## Only the first three evolution entries can have Stone compatibility reported correctly

This is a bug with `PlacePartyMonEvoStoneCompatibility.DetermineCompatibility` in [engine/pokemon/party_menu.asm](/engine/pokemon/party_menu.asm):


**Workaround (supports up to six entries):**

```diff
.DetermineCompatibility:
	ld de, wStringBuffer1
	ld a, BANK(EvosAttacksPointers)
	ld bc, 2
	call FarCopyBytes
	ld hl, wStringBuffer1
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer1
	ld a, BANK("Evolutions and Attacks")
-	ld bc, 10
+	ld bc, wStringBuffer2 - wStringBuffer1
	call FarCopyBytes
```


## `EVOLVE_STAT` can break Stone compatibility reporting

This is a bug with `PlacePartyMonEvoStoneCompatibility.DetermineCompatibility` in [engine/pokemon/party_menu.asm](/engine/pokemon/party_menu.asm):


**Fix:**

```asm
.loop2
	ld a, [hli]
	and a
	jr z, .nope
+	cp EVOLVE_STAT
+	jr nz, .not_four_bytes
+	inc hl
+.not_four_bytes
	inc hl
	inc hl
	cp EVOLVE_ITEM
	jr nz, .loop2
```


## `ScriptCall` can overflow `wScriptStack` and crash

In [engine/overworld/scripting.asm](/engine/overworld/scripting.asm):

```asm
ScriptCall:
; Bug: The script stack has a capacity of 5 scripts, yet there is
; nothing to stop you from pushing a sixth script.  The high part
; of the script address can then be overwritten by modifications
; to wScriptDelay, causing the script to return to the rst/interrupt
; space.

	push de
	ld hl, wScriptStackSize
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, wScriptStack
	add hl, de
	add hl, de
	add hl, de
	pop de
	ld a, [wScriptBank]
	ld [hli], a
	ld a, [wScriptPos]
	ld [hli], a
	ld a, [wScriptPos + 1]
	ld [hl], a
	ld a, b
	ld [wScriptBank], a
	ld a, e
	ld [wScriptPos], a
	ld a, d
	ld [wScriptPos + 1], a
	ret
```

*To do:* Fix this bug.


## `LoadSpriteGFX` does not limit the capacity of `UsedSprites`

In [engine/overworld/overworld.asm](/engine/overworld/overworld.asm):


**Fix:**

```diff
LoadSpriteGFX:
-; Bug: b is not preserved, so it's useless as a next count.
-; Uncomment the lines below to fix.
-
	ld hl, wUsedSprites
	ld b, SPRITE_GFX_LIST_CAPACITY
.loop
	ld a, [hli]
	and a
	jr z, .done
	push hl
	call .LoadSprite
	pop hl
	ld [hli], a
	dec b
	jr nz, .loop

.done
	ret

.LoadSprite:
-	; push bc
+	push bc
	call GetSprite
-	; pop bc
+	pop bc
	ld a, l
	ret
```


## `ChooseWildEncounter` doesn't really validate the wild Pokémon species

In [engine/overworld/wildmons.asm](/engine/overworld/wildmons.asm):


**Fix:**

```diff
.ok
	ld a, b
	ld [wCurPartyLevel], a
	ld b, [hl]
-	; ld a, b
+	ld a, b
	call ValidateTempWildMonSpecies
	jr c, .nowildbattle

	cp UNOWN
	jr nz, .done
```


## `TryObjectEvent` arbitrary code execution

In [engine/overworld/events.asm](/engine/overworld/events.asm):


**Fix:**

```diff
-; Bug: If IsInArray returns nc, data at bc will be executed as code.
	push bc
	ld de, 3
	ld hl, .pointers
	call IsInArray
	jr nc, .nope_bugged
	pop bc

	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.nope_bugged
-	; pop bc
+	pop bc
	xor a
	ret
```


## `CheckBugContestContestantFlag` can read beyond its data table

In [engine/events/bug_contest/contest_2.asm](/engine/events/bug_contest/contest_2.asm):

```asm
CheckBugContestContestantFlag:
; Checks the flag of the Bug Catching Contestant whose index is loaded in a.

; Bug: If a >= NUM_BUG_CONTESTANTS when this is called,
; it will read beyond the table.

	ld hl, BugCatchingContestantEventFlagTable
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, CHECK_FLAG
	call EventFlagAction
	ret

INCLUDE "data/events/bug_contest_flags.asm"
```

However, `a < NUM_BUG_CONTESTANTS` should always be true, so in practice this is not a problem.


## `ClearWRAM` only clears WRAM bank 1

In [home/init.asm](/home/init.asm):


**Fix:**

```diff
ClearWRAM::
; Wipe swappable WRAM banks (1-7)
; Assumes CGB or AGB

	ld a, 1
.bank_loop
	push af
	ld [rSVBK], a
	xor a
	ld hl, WRAM1_Begin
	ld bc, WRAM1_End - WRAM1_Begin
	call ByteFill
	pop af
	inc a
	cp 8
-	jr nc, .bank_loop ; Should be jr c
+	jr c, .bank_loop
	ret
```
