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
- [Slot machine payout sound effects cut each other off](#slot-machine-payout-sound-effects-cut-each-other-off)
- [Team Rocket battle music is not used for Executives or Scientists](#team-rocket-battle-music-is-not-used-for-executives-or-scientists)
- [No bump noise if standing on tile `$3E`](#no-bump-noise-if-standing-on-tile-3e)
- [Playing Entei's Pokédex cry can distort Raikou's and Suicune's](#playing-enteis-pokédex-cry-can-distort-raikous-and-suicunes)
- [In-battle “`…`” ellipsis is too high](#in-battle--ellipsis-is-too-high)
- [Two tiles in the `port` tileset are drawn incorrectly](#two-tiles-in-the-port-tileset-are-drawn-incorrectly)
- [`LoadMetatiles` wraps around past 128 blocks](#loadmetatiles-wraps-around-past-128-blocks)
- [Surfing directly across a map connection does not load the new map](#surfing-directly-across-a-map-connection-does-not-load-the-new-map)
- [`Function6ec1` does not correctly limit object movement](#function6ec1-does-not-correctly-limit-object-movement)
- [`CheckOwnMon` only checks the first five letters of OT names](#checkownmon-only-checks-the-first-five-letters-of-ot-names)
- [Catching a Transformed Pokémon always catches a Ditto](#catching-a-transformed-pokémon-always-catches-a-ditto)
- [Using a Park Ball in normal battles has a corrupt animation](#using-a-park-ball-in-normal-battles-has-a-corrupt-animation)
- [`HELD_CATCH_CHANCE` has no effect](#held_catch_chance-has-no-effect)
- [Only the first three `EvosAttacks` evolution entries can have Stone compatibility reported correctly](#only-the-first-three-evosattacks-evolution-entries-can-have-stone-compatibility-reported-correctly)
- [`ScriptCall` can overflow `wScriptStack` and crash](#scriptcall-can-overflow-wscriptstack-and-crash)
- [`LoadSpriteGFX` does not limit the capacity of `UsedSprites`](#loadspritegfx-does-not-limit-the-capacity-of-usedsprites)
- [`ChooseWildEncounter` doesn't really validate the wild Pokémon species](#choosewildencounter-doesnt-really-validate-the-wild-pokémon-species)
- [`TryObjectEvent` arbitrary code execution](#tryobjectevent-arbitrary-code-execution)
- [`Special_CheckBugContestContestantFlag` can read beyond its data table](#special_checkbugcontestcontestantflag-can-read-beyond-its-data-table)
- [`ClearWRAM` only clears WRAM bank 1](#clearwram-only-clears-wram-bank-1)


## Thick Club and Light Ball can decrease damage done with boosted (Special) Attack

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=rGqu3d3pdok&t=450))

This is a bug with `SpeciesItemBoost` in [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm):

```asm
; Double the stat
	sla l
	rl h
	ret
```

**Fix:**

```asm
; Double the stat
	sla l
	rl h

	ld a, HIGH(MAX_STAT_VALUE)
	cp h
	jr c, .cap
	ld a, LOW(MAX_STAT_VALUE)
	cp l
	ret nc

.cap
	ld h, HIGH(MAX_STAT_VALUE)
	ld l, LOW(MAX_STAT_VALUE)
	ret
```


## Metal Powder can increase damage taken with boosted (Special) Defense

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=rGqu3d3pdok&t=450))

This is a bug with `DittoMetalPowder` in [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm):

```asm
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
	ret
```

**Fix:**

```asm
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

	ld a, HIGH(MAX_STAT_VALUE)
	cp b
	jr c, .cap
	ld a, LOW(MAX_STAT_VALUE)
	cp c
	ret nc

.cap
	ld b, HIGH(MAX_STAT_VALUE)
	ld c, LOW(MAX_STAT_VALUE)
	ret
```


## Belly Drum sharply boosts Attack even with under 50% HP

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=zuCLMikWo4Y))

This is a bug with `BattleCommand_BellyDrum` in [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm):

```asm
BattleCommand_BellyDrum: ; 37c1a
; bellydrum
; This command is buggy because it raises the user's attack
; before checking that it has enough HP to use the move.
; Swap the order of these two blocks to fix.
	call BattleCommand_AttackUp2
	ld a, [AttackMissed]
	and a
	jr nz, .failed

	callab GetHalfMaxHP
	callab CheckUserHasEnoughHP
	jr nc, .failed
```

**Fix:**

```asm
BattleCommand_BellyDrum: ; 37c1a
; bellydrum
	callab GetHalfMaxHP
	callab CheckUserHasEnoughHP
	jr nc, .failed

	call BattleCommand_AttackUp2
	ld a, [AttackMissed]
	and a
	jr nz, .failed
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
	effectchance ; bug: duplicate effectchance shouldn't be here
	defensedown
	statdownmessage
	endmove
```

**Fix:** Delete the second `effectchance`.


## Counter and Mirror Coat still work if the opponent uses an item

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=uRYyzKRatFk))

*To do:* Identify specific code causing this bug and fix it.


## A Disabled but PP Up–enhanced move may not trigger Struggle

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=1v9x4SgMggs))

This is a bug with `CheckPlayerHasUsableMoves` in [engine/battle/core.asm](/engine/battle/core.asm):

```asm
.done
	; Bug: this will result in a move with PP Up confusing the game.
	; Replace with "and $3f" to fix.
	and a
	ret nz

.force_struggle
	ld hl, BattleText_PkmnHasNoMovesLeft
	call StdBattleTextBox
	ld c, 60
	call DelayFrames
	xor a
	ret
```

**Fix:** Change `and a` to `and $3f`.


## A Pokémon that fainted from Pursuit will have its old status condition when revived

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=tiRvw-Nb2ME))

*To do:* Identify specific code causing this bug and fix it.


## Lock-On and Mind Reader don't always bypass Fly and Dig

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

This bug affects Attract, Curse, Foresight, Mean Look, Mimic, Nightmare, Spider Web, Transform, and stat-lowering effects of moves like String Shot or Bubble during the semi-invulnerable turn of Fly or Dig.

This is a bug with `CheckHiddenOpponent` in [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm):

```asm
CheckHiddenOpponent: ; 37daa
; BUG: This routine should account for Lock-On and Mind Reader.
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret
```

*To do:* Fix this bug.


## Beat Up can desynchronize link battles

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=202-iAsrIa8))

This is a bug with `BattleCommand_BeatUp` in [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm):

```asm
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
```

**Fix:** Change `cp [hl]` to `cp c`.


## Present damage is incorrect in link battles

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

([Video](https://www.youtube.com/watch?v=XJaQoKtrEuw))

This bug existed for all battles in Gold and Silver, and was only fixed for single-player battles in Crystal to preserve link compatibility.

This is a bug with `BattleCommand_Present` in [engine/battle/effect_commands/present.asm](/engine/battle/effect_commands/present.asm):

```asm
BattleCommand_Present: ; 37874
; present

	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .colosseum_skippush
	push bc
	push de
.colosseum_skippush

	call BattleCommand_Stab

	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .colosseum_skippop
	pop de
	pop bc
.colosseum_skippop
```

**Fix:**

```asm
BattleCommand_Present: ; 37874
; present

	push bc
	push de
	call BattleCommand_Stab
	pop de
	pop bc
```


## "Smart" AI encourages Mean Look if its own Pokémon is badly poisoned

([Video](https://www.youtube.com/watch?v=cygMO-zHTls))

This is a bug with `AI_Smart_MeanLook` in [engine/battle/ai/scoring.asm](/engine/battle/ai/scoring.asm):

```asm
; 80% chance to greatly encourage this move if the enemy is badly poisoned (buggy).
; Should check PlayerSubStatus5 instead.
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TOXIC, a
	jr nz, .asm_38e26
```

**Fix:** Change `EnemySubStatus5` to `PlayerSubStatus5`.


## AI makes a false assumption about `CheckTypeMatchup`

In [engine/battle/effect_commands.asm](/engine/battle/effect_commands.asm):

```asm
BattleCheckTypeMatchup: ; 347c8
	ld hl, EnemyMonType1
	ld a, [hBattleTurn]
	and a
	jr z, CheckTypeMatchup
	ld hl, BattleMonType1
CheckTypeMatchup: ; 347d3
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

```asm
AI_HealStatus: ; 384e0
	ld a, [CurOTMon]
	ld hl, OTPartyMon1Status
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hl], a
	ld [EnemyMonStatus], a
	; Bug: this should reset SUBSTATUS_NIGHTMARE too
	; Uncomment the lines below to fix
	; ld hl, EnemySubStatus1
	; res SUBSTATUS_NIGHTMARE, [hl]
	ld hl, EnemySubStatus5
	res SUBSTATUS_TOXIC, [hl]
	ret
; 384f7
```

**Fix:** Uncomment `ld hl, EnemySubStatus1` and `res SUBSTATUS_NIGHTMARE, [hl]`.


## HP bar animation is slow for high HP

([Video](https://www.youtube.com/watch?v=SE-BfsFgZVM))

This is a bug with `LongAnim_UpdateVariables` in [engine/battle/anim_hp_bar.asm](/engine/battle/anim_hp_bar.asm):

```asm
	; This routine is buggy. The result from ComputeHPBarPixels is stored
	; in e. However, the pop de opcode deletes this result before it is even
	; used. The game then proceeds as though it never deleted that output.
	; To fix, uncomment the line below.
	call ComputeHPBarPixels
	; ld a, e
	pop bc
	pop de
	pop hl
	ld a, e ; Comment or delete this line to fix the above bug.
	ld hl, wCurHPBarPixels
	cp [hl]
	jr z, .loop
	ld [hl], a
	and a
	ret
```

**Fix:** Move `ld a, e` to right after `call ComputeHPBarPixels`.


## HP bar animation off-by-one error for low HP

([Video](https://www.youtube.com/watch?v=9KyNVIZxJvI))

This is a bug with `ShortHPBar_CalcPixelFrame` in [engine/anim_hp_bar.asm](/engine/anim_hp_bar.asm):

```asm
	ld b, 0
; This routine is buggy. If [wCurHPAnimMaxHP] * [wCurHPBarPixels] is divisible
; by 48, the loop runs one extra time. To fix, uncomment the line below.
.loop
	ld a, l
	sub 6 * 8
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	; jr z, .done
	jr c, .done
	inc b
	jr .loop
```

**Fix:** Uncomment `jr z, .done`.


## Experience underflow for level 1 Pokémon with Medium-Slow growth rate

([Video](https://www.youtube.com/watch?v=SXH8u0plHrE))

This can bring Pokémon straight from level 1 to 100 by gaining just a few experience points.

This is a bug with `CalcExpAtLevel` in [main.asm](/main.asm):

```asm
CalcExpAtLevel: ; 50e47
; (a/b)*n**3 + c*n**2 + d*n - e
	ld a, [BaseGrowthRate]
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, GrowthRates
	add hl, bc
```

**Fix:**

```asm
CalcExpAtLevel: ; 50e47
; (a/b)*n**3 + c*n**2 + d*n - e
	ld a, d
	cp 1
	jr nz, .UseExpFormula
; Pokémon have 0 experience at level 1
	xor a
	ld hl, hProduct
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

.UseExpFormula
	ld a, [BaseGrowthRate]
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, GrowthRates
	add hl, bc
```


## Five-digit experience gain is printed incorrectly

([Video](https://www.youtube.com/watch?v=o54VjpAEoO8))

This is a bug with `Text_ABoostedStringBuffer2ExpPoints` and `Text_StringBuffer2ExpPoints` in [text/common_2.asm](/text/common_2.asm):

```asm
Text_ABoostedStringBuffer2ExpPoints::
	text_start
	line "a boosted"
	cont "@"
	deciram StringBuffer2, 2, 4
	text " EXP. Points!"
	prompt

Text_StringBuffer2ExpPoints::
	text_start
	line "@"
	deciram StringBuffer2, 2, 4
	text " EXP. Points!"
	prompt
```

**Fix:** Change both `deciram StringBuffer2, 2, 4` to `deciram StringBuffer2, 2, 5`.


## BRN/PSN/PAR do not affect catch rate

This is a bug with `PokeBall` in [items/item_effects.asm](/items/item_effects.asm):

```asm
.statuscheck
; This routine is buggy. It was intended that SLP and FRZ provide a higher
; catch rate than BRN/PSN/PAR, which in turn provide a higher catch rate than
; no status effect at all. But instead, it makes BRN/PSN/PAR provide no
; benefit.
; Uncomment the line below to fix this.
	ld b, a
	ld a, [EnemyMonStatus]
	and 1 << FRZ | SLP
	ld c, 10
	jr nz, .addstatus
	; ld a, [EnemyMonStatus]
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

**Fix:** Uncomment `ld a, [EnemyMonStatus]`.


## Moon Ball does not boost catch rate

This is a bug with `MoonBallMultiplier` in [items/item_effects.asm](/items/item_effects.asm):

```asm
MoonBallMultiplier:
; This function is buggy.
; Intent:  multiply catch rate by 4 if mon evolves with moon stone
; Reality: no boost

...

; Moon Stone's constant from Pokémon Red is used.
; No Pokémon evolve with Burn Heal,
; so Moon Balls always have a catch rate of 1×.
	push bc
	ld a, BANK(EvosAttacks)
	call GetFarByte
	cp MOON_STONE_RED ; BURN_HEAL
	pop bc
	ret nz
```

**Fix:** Change `MOON_STONE_RED` to `MOON_STONE`.


## Love Ball boosts catch rate for the wrong gender

This is a bug with `LoveBallMultiplier` in [items/item_effects.asm](/items/item_effects.asm):

```asm
LoveBallMultiplier:
; This function is buggy.
; Intent:  multiply catch rate by 8 if mons are of same species, different sex
; Reality: multiply catch rate by 8 if mons are of same species, same sex

...

	ld a, d
	pop de
	cp d
	pop bc
	ret nz ; for the intended effect, this should be "ret z"
```

**Fix:** Change `ret nz` to `ret z`.


## Fast Ball only boosts catch rate for three Pokémon

This is a bug with `FastBallMultiplier` in [items/item_effects.asm](/items/item_effects.asm):

```asm
FastBallMultiplier:
; This function is buggy.
; Intent:  multiply catch rate by 4 if enemy mon is in one of the three
;          FleeMons tables.
; Reality: multiply catch rate by 4 if enemy mon is one of the first three in
;          the first FleeMons table.

...

	inc hl
	cp -1
	jr z, .next
	cp c
	jr nz, .next ; for the intended effect, this should be "jr nz, .loop"
	sla b
	jr c, .max
```

**Fix:** Change `jr nz, .next` to `jr nz, .loop`.


## Dragon Scale, not Dragon Fang, boosts Dragon-type moves

*Fixing this bug will break compatibility with standard Pokémon Crystal for link battles.*

This is a bug with `ItemAttributes` in [items/attributes.asm](/items/attributes.asm):

```asm
; DRAGON FANG
	item_attribute 100, 0, 0, CANT_SELECT, ITEM, ITEMMENU_NOUSE, ITEMMENU_NOUSE

...

; DRAGON SCALE
	item_attribute 2100, HELD_DRAGON_BOOST, 10, CANT_SELECT, ITEM, ITEMMENU_NOUSE, ITEMMENU_NOUSE
```

**Fix:** Move `HELD_DRAGON_BOOST` to the `DRAGON FANG` attributes and `0` to `DRAGON SCALE`.


## Daisy's grooming doesn't always increase happiness

This is a bug with `MassageOrHaircut` in [engine/events/special.asm](/engine/events/special.asm):

```asm
; Bug: Subtracting $ff from $ff fails to set c.
; This can result in overflow into the next data array.
; In the case of getting a massage from Daisy, we bleed
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
	ld [ScriptVar], a
	ld c, [hl]
	call ChangeHappiness
	ret

...

Data_DaisyMassage: ; 746b
	db $ff, 2, HAPPINESS_MASSAGE ; 99.6% chance

CopyPokemonName_Buffer1_Buffer3: ; 746e
	ld hl, StringBuffer1
	ld de, StringBuffer3
	ld bc, MON_NAME_LENGTH
	jp CopyBytes
```

**Fix:**

```asm
Data_DaisyMassage: ; 746b
	db $80, 2, HAPPINESS_MASSAGE ; 50% chance
	db $ff, 2, HAPPINESS_MASSAGE ; 50% chance
```


## Magikarp in Lake of Rage are shorter, not longer

This is a bug with `LoadEnemyMon.CheckMagikarpArea` in [engine/battle/core.asm](/engine/battle/core.asm):

```asm
.CheckMagikarpArea:
; The z checks are supposed to be nz
; Instead, all maps in GROUP_LAKE_OF_RAGE (mahogany area)
; and routes 20 and 44 are treated as Lake of Rage

; This also means Lake of Rage Magikarp can be smaller than ones
; caught elsewhere rather than the other way around

; Intended behavior enforces a minimum size at Lake of Rage
; The real behavior prevents size flooring in the Lake of Rage area
	ld a, [MapGroup]
	cp GROUP_LAKE_OF_RAGE
	jr z, .Happiness
	ld a, [MapNumber]
	cp MAP_LAKE_OF_RAGE
	jr z, .Happiness
```

**Fix:** Change both `jr z, .Happiness` to `jr nz, .Happiness`.


## Magikarp length limits have a unit conversion error

This is a bug with `LoadEnemyMon.CheckMagikarpArea` in [engine/battle/core.asm](/engine/battle/core.asm):

```asm
; Get Magikarp's length
	ld de, EnemyMonDVs
	ld bc, PlayerID
	callfar CalcMagikarpLength

; No reason to keep going if length > 1536 (i.e. if length / 256 != 6)
	ld a, [wMagikarpLength]
	cp HIGH(1536) ; this compares to 6'0'', should be cp 5
	jr nz, .CheckMagikarpArea

; 5% chance of skipping both size checks
	call Random
	cp 5 percent
	jr c, .CheckMagikarpArea
; Try again if length > 1615
	ld a, [wMagikarpLength + 1]
	cp LOW(1616) ; this compares to 6'80'', should be cp 3
	jr nc, .GenerateDVs

; 20% chance of skipping this check
	call Random
	cp 20 percent - 1
	jr c, .CheckMagikarpArea
; Try again if length > 1599
	ld a, [wMagikarpLength + 1]
	cp LOW(1600) ; this compares to 6'64'', should be cp 2
	jr nc, .GenerateDVs
```

**Fix:** Change the three `cp` instructions to use their commented values.


## Magikarp lengths can be miscalculated

This is a bug with `CalcMagikarpLength.BCLessThanDE` in [engine/events/magikarp.asm](/engine/events/magikarp.asm):

```asm
.BCLessThanDE: ; fbc9a
; Intention: Return bc < de.
; Reality: Return b < d.
	ld a, b
	cp d
	ret c
	ret nc ; whoops
	ld a, c
	cp e
	ret
; fbca1
```

**Fix:** Delete `ret nc`.


## Battle transitions fail to account for the enemy's level

([Video](https://www.youtube.com/watch?v=eij_1060SMc))

This is a bug with `StartTrainerBattle_DetermineWhichAnimation` in [engine/battle_start.asm](/engine/battle_start.asm):

```asm
StartTrainerBattle_DetermineWhichAnimation: ; 8c365 (23:4365)
; The screen flashes a different number of times depending on the level of
; your lead Pokemon relative to the opponent's.
; BUG: BattleMonLevel and EnemyMonLevel are not set at this point, so whatever
; values happen to be there will determine the animation.
	ld de, 0
	ld a, [BattleMonLevel]
	add 3
	ld hl, EnemyMonLevel
	cp [hl]
	jr nc, .okay
	set 0, e
.okay
	ld a, [wPermission]
	cp CAVE
	jr z, .okay2
	cp PERM_5
	jr z, .okay2
	cp DUNGEON
	jr z, .okay2
	set 1, e
.okay2
	ld hl, .StartingPoints
	add hl, de
	ld a, [hl]
	ld [wJumptableIndex], a
	ret
; 8c38f (23:438f)

.StartingPoints: ; 8c38f
	db 1,  9
	db 16, 24
; 8c393
```

*To do:* Fix this bug.


## Slot machine payout sound effects cut each other off

([Video](https://www.youtube.com/watch?v=ojq3xqfRF6I))

This is a bug with `Slots_PayoutAnim` in [engine/slot_machine.asm](/engine/slot_machine.asm):

```asm
.okay
	ld [hl], e
	dec hl
	ld [hl], d
	ld a, [wcf64]
	and $7
	ret z ; ret nz would be more appropriate
	ld de, SFX_GET_COIN_FROM_SLOTS
	call PlaySFX
	ret
```

**Fix:** Change `ret z` to `ret nz`.


## Team Rocket battle music is not used for Executives or Scientists

This is a bug with `PlayBattleMusic` in [main.asm](/main.asm):

```asm
	; really, they should have included admins and scientists here too...
	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jr z, .done
	cp GRUNTF
	jr z, .done
```

**Fix:**

```asm
	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jr z, .done
	cp GRUNTF
	jr z, .done
	cp EXECUTIVEM
	jr z, .done
	cp EXECUTIVEF
	jr z, .done
	cp SCIENTIST
	jr z, .done
```


## No bump noise if standing on tile `$3E`

This is a bug with `DoPlayerMovement.CheckWarp` in [engine/player_movement.asm](/engine/player_movement.asm):

```asm
; Bug: Since no case is made for STANDING here, it will check
; [.edgewarps + $ff]. This resolves to $3e at $8035a.
; This causes wd041 to be nonzero when standing on tile $3e,
; making bumps silent.

	ld a, [WalkingDirection]
	; cp STANDING
	; jr z, .not_warp
	ld e, a
	ld d, 0
	ld hl, .EdgeWarps
	add hl, de
	ld a, [PlayerStandingTile]
	cp [hl]
	jr nz, .not_warp

	ld a, 1
	ld [wd041], a
	ld a, [WalkingDirection]
	; This is in the wrong place.
	cp STANDING
	jr z, .not_warp
```

**Fix:**

```asm
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .not_warp
	ld e, a
	ld d, 0
	ld hl, .EdgeWarps
	add hl, de
	ld a, [PlayerStandingTile]
	cp [hl]
	jr nz, .not_warp

	ld a, 1
	ld [wd041], a
	ld a, [WalkingDirection]
```


## Playing Entei's Pokédex cry can distort Raikou's and Suicune's

([Video](https://www.youtube.com/watch?v=z305e4sIO24))

The exact cause is unknown, but a workaround exists for `DexEntryScreen_MenuActionJumptable.Cry` in [engine/pokedex/pokedex.asm](/engine/pokedex/pokedex.asm):

```asm
.Cry: ; 40340
	call Pokedex_GetSelectedMon
	ld a, [wd265]
	call GetCryIndex
	ld e, c
	ld d, b
	call PlayCry
	ret
```

**Workaround:**

```asm
.Cry: ; 40340
	ld a, [CurPartySpecies]
	call PlayMonCry
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

```asm
	; Set hl to the address of the current metatile data ([TilesetBlocksAddress] + (a) tiles).
	; This is buggy; it wraps around past 128 blocks.
	; To fix, uncomment the line below.
	add a ; Comment or delete this line to fix the above bug.
	ld l, a
	ld h, 0
	; add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, [TilesetBlocksAddress]
	add l
	ld l, a
	ld a, [TilesetBlocksAddress + 1]
	adc h
	ld h, a
```

**Fix:** Delete `add a` and uncomment `add hl, hl`.


## Surfing directly across a map connection does not load the new map

([Video](https://www.youtube.com/watch?v=XFOWvMNG-zw))

*To do:* Identify specific code causing this bug and fix it.


## `Function6ec1` does not correctly limit object movement

This bug is why the Lapras in Union Cave, which uses `SPRITEMOVEDATA_LAPRAS`, is not restricted by its `1, 1` movement radius.

In [engine/npc_movement.asm](/engine/npc_movement.asm):

```asm
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit 4, [hl] ; lost, uncomment next line to fix
;	jr nz, .resume
```

**Fix:** Uncomment `jr nz, .resume`.


## `CheckOwnMon` only checks the first five letters of OT names

([Video](https://www.youtube.com/watch?v=GVTTmReM4nQ))

This bug can allow you to talk to Eusine in Celadon City and encounter Ho-Oh with only traded legendary beasts.

In [engine/search.asm](/engine/search.asm):

```asm
; check OT
; This only checks five characters, which is fine for the Japanese version,
; but in the English version the player name is 7 characters, so this is wrong.

	ld hl, PlayerName

rept NAME_LENGTH_JAPANESE +- 2 ; should be PLAYER_NAME_LENGTH +- 2
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

.notfound
	pop de
	pop hl
	pop bc
	and a
	ret
```

**Fix:** Change `rept NAME_LENGTH_JAPANESE +- 2` to `rept PLAYER_NAME_LENGTH +- 2`.


## Catching a Transformed Pokémon always catches a Ditto

This bug can affect Mew or Pokémon other than Ditto that used Transform via Mirror Move or Sketch.

This is a bug with `PokeBall` in [items/item_effects.asm](/items/item_effects.asm):

```asm
	ld hl, EnemySubStatus5
	ld a, [hl]
	push af
	set SUBSTATUS_TRANSFORMED, [hl]

; This code is buggy. Any wild Pokémon that has Transformed will be
; caught as a Ditto, even if it was something else like Mew.
; To fix, do not set [TempEnemyMonSpecies] to DITTO.
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .ditto
	jr .not_ditto

.ditto
	ld a, DITTO
	ld [TempEnemyMonSpecies], a
	jr .load_data

.not_ditto
	set SUBSTATUS_TRANSFORMED, [hl]
	ld hl, wEnemyBackupDVs
	ld a, [EnemyMonDVs]
	ld [hli], a
	ld a, [EnemyMonDVs + 1]
	ld [hl], a

.load_data
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld a, [EnemyMonLevel]
	ld [CurPartyLevel], a
	callba LoadEnemyMon

	pop af
	ld [EnemySubStatus5], a
```

**Fix:** 

```asm
	ld hl, EnemySubStatus5
	ld a, [hl]
	push af
	set SUBSTATUS_TRANSFORMED, [hl]

	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .load_data

	ld hl, wEnemyBackupDVs
	ld a, [EnemyMonDVs]
	ld [hli], a
	ld a, [EnemyMonDVs + 1]
	ld [hl], a

.load_data
	ld a, [TempEnemyMonSpecies]
	ld [CurPartySpecies], a
	ld a, [EnemyMonLevel]
	ld [CurPartyLevel], a
	callba LoadEnemyMon

	pop af
	ld [EnemySubStatus5], a
```


## Using a Park Ball in normal battles has a corrupt animation

([Video](https://www.youtube.com/watch?v=v1ErZdLCIyU))

This is a bug with `ParkBall` in [items/item_effects.asm](/items/item_effects.asm):

```asm
.room_in_party
	xor a
	ld [wWildMon], a
	ld a, [CurItem]
	cp PARK_BALL
	call nz, ReturnToBattle_UseBall
```

**Fix:**

```asm
.room_in_party
	xor a
	ld [wWildMon], a
	ld a, [BattleType]
	cp BATTLETYPE_CONTEST
	call nz, ReturnToBattle_UseBall
```


## `HELD_CATCH_CHANCE` has no effect

This is a bug with `PokeBall` in [items/item_effects.asm](/items/item_effects.asm):

```asm
	; BUG: callba overwrites a,
	; and GetItemHeldEffect takes b anyway.

	; This is probably the reason
	; the HELD_CATCH_CHANCE effect
	; is never used.

	; Uncomment the line below to fix.

	ld a, [BattleMonItem]
;	ld b, a
	callba GetItemHeldEffect
	ld a, b
	cp HELD_CATCH_CHANCE
```

**Fix:** Uncomment `ld b, a`.


## Only the first three `EvosAttacks` evolution entries can have Stone compatibility reported correctly

This is a bug with `PlacePartyMonEvoStoneCompatibility.DetermineCompatibility` in [engine/party_menu.asm](/engine/party_menu.asm):

```asm
.DetermineCompatibility: ; 50268
	ld de, StringBuffer1
	ld a, BANK(EvosAttacksPointers)
	ld bc, 2
	call FarCopyBytes
	ld hl, StringBuffer1
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
	ld a, BANK(EvosAttacks)
	ld bc, $a
	call FarCopyBytes
```

**Fix:** Change `ld bc, $a` to `ld bc, $10` to support up to five Stone entries.


## `ScriptCall` can overflow `wScriptStack` and crash

In [engine/scripting.asm](/engine/scripting.asm):

```asm
ScriptCall:
; Bug: The script stack has a capacity of 5 scripts, yet there is
; nothing to stop you from pushing a sixth script.  The high part
; of the script address can then be overwritten by modifications
; to ScriptDelay, causing the script to return to the rst/interrupt
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
	ld a, [ScriptBank]
	ld [hli], a
	ld a, [ScriptPos]
	ld [hli], a
	ld a, [ScriptPos + 1]
	ld [hl], a
	ld a, b
	ld [ScriptBank], a
	ld a, e
	ld [ScriptPos], a
	ld a, d
	ld [ScriptPos + 1], a
	ret
```


## `LoadSpriteGFX` does not limit the capacity of `UsedSprites`

In [engine/overworld.asm](/engine/overworld.asm):

```asm
LoadSpriteGFX: ; 14306
; Bug: b is not preserved, so it's useless as a next count.
; Uncomment the lines below to fix.

	ld hl, UsedSprites
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
	; push bc
	call GetSprite
	; pop bc
	ld a, l
	ret
; 1431e
```

**Fix:** Uncomment `push bc` and `pop bc`.


## `ChooseWildEncounter` doesn't really validate the wild Pokémon species

In [engine/wildmons.asm](/engine/wildmons.asm):

```asm
ChooseWildEncounter: ; 2a14f
...

	ld a, b
	ld [CurPartyLevel], a
	ld b, [hl]
	; ld a, b
	call ValidateTempWildMonSpecies
	jr c, .nowildbattle

	ld a, b ; This is in the wrong place.
	cp UNOWN
	jr nz, .done

...

ValidateTempWildMonSpecies: ; 2a4a0
; Due to a development oversight, this function is called with the wild Pokemon's level, not its species, in a.
```

**Fix:**

```asm
	ld a, b
	ld [CurPartyLevel], a
	ld b, [hl]
	ld a, b
	call ValidateTempWildMonSpecies
	jr c, .nowildbattle

	cp UNOWN
	jr nz, .done
```

## `TryObjectEvent` arbitrary code execution

In [engine/events.asm](/engine/events.asm):

```asm
; Bug: If IsInArray returns nc, data at bc will be executed as code.
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
	; pop bc
	xor a
	ret
```

**Fix:** Uncomment `pop bc`.


## `Special_CheckBugContestContestantFlag` can read beyond its data table

In [engine/events/bug_contest/contest_2.asm](/engine/events/bug_contest/contest_2.asm):

```asm
Special_CheckBugContestContestantFlag: ; 139ed
; Checks the flag of the Bug Catching Contestant whose index is loaded in a.

; Bug: If a >= 10 when this is called, it will read beyond the table.

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
; 139fe

BugCatchingContestantEventFlagTable: ; 139fe
	dw EVENT_BUG_CATCHING_CONTESTANT_1A
	dw EVENT_BUG_CATCHING_CONTESTANT_2A
	dw EVENT_BUG_CATCHING_CONTESTANT_3A
	dw EVENT_BUG_CATCHING_CONTESTANT_4A
	dw EVENT_BUG_CATCHING_CONTESTANT_5A
	dw EVENT_BUG_CATCHING_CONTESTANT_6A
	dw EVENT_BUG_CATCHING_CONTESTANT_7A
	dw EVENT_BUG_CATCHING_CONTESTANT_8A
	dw EVENT_BUG_CATCHING_CONTESTANT_9A
	dw EVENT_BUG_CATCHING_CONTESTANT_10A
; 13a12
```


## `ClearWRAM` only clears WRAM bank 1

In [home/init.asm](/home/init.asm):

```asm
ClearWRAM:: ; 25a
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
	jr nc, .bank_loop ; Should be jr c
	ret
; 270
```

**Fix:** Change `jr nc, .bank_loop` to `jr c, .bank_loop`.
