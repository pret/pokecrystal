# Battle Animation Commands

Defined in [macros/scripts/battle_anims.asm](/macros/scripts/battle_anims.asm) and [data/moves/animations.asm:BattleAnimations](/data/moves/animations.asm).


## `$00`−`$CF`: `anim_wait` *length*

- *length*: duration in frames


## `$D0`: `anim_obj` *object*, *x*, *y*, *param*
*Alternate*: `anim_obj` *object*, *x_tile*, *x*, *y_tile*, *y*, *param*

Spawns an *object* at coordinate (*x*, *y*).

- *object*: `ANIM_OBJ` constants (see [constants/battle_anim_constants.asm](/constants/battle_anim_constants.asm))
- *x*: the x position in pixels
- *y*: the x position in pixels
- *x_tile*: an added x position in tiles (8 pixels)
- *y_tile*: an added y position in tiles (8 pixels)
- *param*: modifies the behavior of *object*. The meaning differs for each object.

*TODO: what happens for x/y values greater than 160/144 respectively?*
*TODO: useful positions*
*TODO: document each object*


## `$D1`: `anim_1gfx` *gfx*

## `$D2`: `anim_2gfx` *gfx1*, *gfx2*

## `$D3`: `anim_3gfx` *gfx1*, *gfx2*, *gfx3*

## `$D4`: `anim_4gfx` *gfx1*, *gfx2*, *gfx3*, *gfx4*

## `$D5`: `anim_5gfx` *gfx1*, *gfx2*, *gfx3*, *gfx4*, *gfx5*

- *gfx*: `ANIM_GFX` constants (see [constants/battle_anim_constants.asm](/constants/battle_anim_constants.asm))


## `$D6`: `anim_incobj` *id*

## `$D7`: `anim_setobj` *id*, *object*

## `$D8`: `anim_incbgeffect` *effect*


## `$D9`: `anim_enemyfeetobj`

Temporarily creates sprites from the bottom row of the enemy frontpic, so that the player backpic can be moved around without corrupting the enemy frontpic.

## `$DA`: `anim_playerheadobj`

Temporarily creates sprites from the top row of the player backpic, so that the enemy frontpic can be moved around without corrupting the player backpic.


## `$DB`: `anim_checkpokeball`

Sets `var` to the result of [GetPokeBallWobble](/engine/battle_anims/getpokeballwobble.asm).


## `$DC`: `anim_transform`

## `$DD`: `anim_raisesub`

## `$DE`: `anim_dropsub`

## `$DF`: `anim_resetobp0`


## `$E0`: `anim_sound` *duration*, *tracks*, *sound_id*

Plays a sound.

## `$E1`: `anim_cry` *pitch*

Plays the user's cry.


## `$E2`: `anim_minimizeopp`

## `$E3`: `anim_oamon`

## `$E4`: `anim_oamoff`


## `$E5`: `anim_clearobjs`

Removes all active objects.


## `$E6`: `anim_beatup`

## `$E7`: `anim_0xe7`

## `$E8`: `anim_updateactorpic`

## `$E9`: `anim_minimize`

## `$EA`: `anim_0xea`

## `$EB`: `anim_0xeb`

## `$EC`: `anim_0xec`

## `$ED`: `anim_0xed`

## `$EE`: `anim_if_param_and` *value*, *address*

## `$EF`: `anim_jumpuntil` *address*


## `$F0`: `anim_bgeffect` *bg_effect*, *unknown1*, *unknown2*, *unknown3*

- *bg_effect*: `ANIM_BG` constants (see [constants/battle_anim_constants.asm](/constants/battle_anim_constants.asm))


## `$F1`: `anim_bgp` *colors*

Sets `rBGP` to *colors*.

## `$F2`: `anim_obp0` *colors*

Sets `rOBP0` to *colors*.

## `$F3`: `anim_obp1` *colors*

Sets `rOBP1` to *colors*.


## `$F4`: `anim_clearsprites`

## `$F5`: `anim_0xf5`

## `$F6`: `anim_0xf6`

## `$F7`: `anim_0xf7`

## `$F8`: `anim_if_param_equal` *value*, *address*

Jumps to another script if `wKickCounter` is equal to *value*.

## `$F9`: `anim_setvar` *value*

Sets `var` to *value*.

## `$FA`: `anim_incvar`

Increments `var` by 1.

## `$FB`: `anim_if_var_equal` *value*, *address*

Jumps to another script if `var` is equal to *value*.

## `$FC`: `anim_jump` *address*

Jumps to another script.

## `$FD`: `anim_loop` *count*, *address*

Jumps to another script up to *count* times. Then does nothing, allowing execution to continue.

## `$FE`: `anim_call` *address*

Calls a script.

## `$FF`: `anim_ret`

Ends the script and returns to the place where it was called. If there was no caller, the animation ends.
