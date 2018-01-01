# Battle Animation Commands

Defined in [macros/scripts/battle_anims.asm](/macros/scripts/battle_anims.asm) and [engine/battle_anims/anim_commands.asm:BattleAnimCommands](/engine/battle_anims/anim_commands.asm).


## `$00`−`$CF`: `anim_wait` *length*

- *length*: duration in frames


## `$D0`: `anim_obj` *object*, *x*, *y*, *param*

***Alternate*: `anim_obj` *object*, *x_tile*, *x*, *y_tile*, *y*, *param***

Spawns an *object* at coordinate (*x*, *y*).

- *object*: `ANIM_OBJ` constants (see [constants/battle_anim_constants.asm](/constants/battle_anim_constants.asm))
- *x*: the x position in pixels
- *y*: the y position in pixels
- *x_tile*: an added x position in tiles (8 pixels)
- *y_tile*: an added y position in tiles (8 pixels)
- *param*: modifies the behavior of *object*. The meaning differs for each object.

The y position also depends on the y offset defined by the object.

- *TODO: what happens for x/y values greater than 160/144 respectively? Is it 1:1 with screen coordinates?*
- *TODO: how are the x/y values mirrored when the opponent is attacking?*
- *TODO: useful positions*
- *TODO: document each object*


## `$D1`: `anim_1gfx` *gfx*

## `$D2`: `anim_2gfx` *gfx1*, *gfx2*

## `$D3`: `anim_3gfx` *gfx1*, *gfx2*, *gfx3*

## `$D4`: `anim_4gfx` *gfx1*, *gfx2*, *gfx3*, *gfx4*

## `$D5`: `anim_5gfx` *gfx1*, *gfx2*, *gfx3*, *gfx4*, *gfx5*

Loads 1-5 sets of graphics. Will overwrite any previously loaded sets.

- *gfx*: `ANIM_GFX` constants (see [constants/battle_anim_constants.asm](/constants/battle_anim_constants.asm))


## `$D6`: `anim_incobj` *object_id*

Increments an object's state.

- *object_id*: the nth object in order of creation

Objects are state machines. `anim_incobj` progresses the state of an object.

## `$D7`: `anim_setobj` *object_id*, *state*

Sets an object's state to a specific value.

- *object_id*: the nth object in order of creation
- *state*: the state index

Objects are state machines. `anim_setobj` changes the state of an object.

## `$D8`: `anim_incbgeffect` *bg_effect*

Increments a bg effect's state.

- *bg_effect*: `ANIM_BG` constants (see [constants/battle_anim_constants.asm](/constants/battle_anim_constants.asm))

Since there can't be two of the same bg effect, the effect type is used. This is distinct from `anim_incobj`.


## `$D9`: `anim_enemyfeetobj`

Temporarily creates sprites from the bottom row of the enemy frontpic, so that the player backpic can be moved around without corrupting the enemy frontpic.

## `$DA`: `anim_playerheadobj`

Temporarily creates sprites from the top row of the player backpic, so that the enemy frontpic can be moved around without corrupting the player backpic.


## `$DB`: `anim_checkpokeball`

Sets `BattleAnimVar` to the result of [GetPokeBallWobble](/engine/battle_anims/getpokeballwobble.asm).


## `$DC`: `anim_transform`

## `$DD`: `anim_raisesub`

## `$DE`: `anim_dropsub`


## `$DF`: `anim_resetobp0`

Resets rOBP0 to the default (`q0123` or `%00011011`).


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

Does nothing. Unused.


## `$E8`: `anim_updateactorpic`

## `$E9`: `anim_minimize`


## `$EA`: `anim_0xea`

Does nothing. Unused.

## `$EB`: `anim_0xeb`

Does nothing. Unused.

## `$EC`: `anim_0xec`

Does nothing. Unused.

## `$ED`: `anim_0xed`

Does nothing. Unused.


## `$EE`: `anim_if_param_and` *value*, *address*

## `$EF`: `anim_jumpuntil` *address*

Jumps to another script and decrements `param` until it reaches 0. Similar to `anim_loop`.


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

Does nothing. Unused.

## `$F6`: `anim_0xf6`

Does nothing. Unused.

## `$F7`: `anim_0xf7`

Does nothing. Unused.


## `$F8`: `anim_if_param_equal` *value*, *address*

Jumps to another script if `wBattleAnimParam` (aka `wKickCounter` or `wPresentPower`) is equal to *value*.

## `$F9`: `anim_setvar` *value*

Sets `BattleAnimVar` to *value*.

## `$FA`: `anim_incvar`

Increments `BattleAnimVar` by 1.

## `$FB`: `anim_if_var_equal` *value*, *address*

Jumps to another script if `BattleAnimVar` is equal to *value*.

## `$FC`: `anim_jump` *address*

Jumps to another script.

## `$FD`: `anim_loop` *count*, *address*

Jumps to another script up to *count* times. Then does nothing, allowing execution to continue.

## `$FE`: `anim_call` *address*

Calls a script.

There is no call stack. The return address is overwritten, so the maximum call depth is 1.

## `$FF`: `anim_ret`

Ends the script and returns to where it was called from. If there was no caller, the animation ends.
