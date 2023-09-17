# Battle Animation Commands

Defined in [macros/scripts/battle_anims.asm](https://github.com/pret/pokecrystal/blob/master/macros/scripts/battle_anims.asm) and [engine/battle_anims/anim_commands.asm:BattleAnimCommands](https://github.com/pret/pokecrystal/blob/master/engine/battle_anims/anim_commands.asm).


## `$00`−`$CF`: <code>anim_wait <i>length</i></code>

- *length*: duration in frames


## `$D0`: <code>anim_obj <i>object</i>, <i>x</i>, <i>y</i>, <i>param</i></code>

***Alternate*: <code>anim_obj <i>object</i>, <i>x_tile</i>, <i>x</i>, <i>y_tile</i>, <i>y</i>, <i>param</i></code>**

Spawns an *object* at coordinate (*x*, *y*).

- *object*: `ANIM_OBJ` constants (see [constants/battle_anim_constants.asm](https://github.com/pret/pokecrystal/blob/master/constants/battle_anim_constants.asm))
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


## `$D1`: <code>anim_1gfx <i>gfx</i></code>


## `$D2`: <code>anim_2gfx <i>gfx1</i>, <i>gfx2</i></code>


## `$D3`: <code>anim_3gfx <i>gfx1</i>, <i>gfx2</i>, <i>gfx3</i></code>


## `$D4`: <code>anim_4gfx <i>gfx1</i>, <i>gfx2</i>, <i>gfx3</i>, <i>gfx4</i></code>


## `$D5`: <code>anim_5gfx <i>gfx1</i>, <i>gfx2</i>, <i>gfx3</i>, <i>gfx4</i>, <i>gfx5</i></code>

Loads 1-5 sets of graphics. Will overwrite any previously loaded sets.

- *gfx*: `ANIM_GFX` constants (see [constants/battle_anim_constants.asm](https://github.com/pret/pokecrystal/blob/master/constants/battle_anim_constants.asm))

Caveats:
- These will override any currently-loaded GFX.


## `$D6`: <code>anim_incobj <i>object_id</i></code>

Increments an object's state.

- *object_id*: the nth object in order of creation

Objects are state machines. `anim_incobj` progresses the state of an object.


## `$D7`: <code>anim_setobj <i>object_id</i>, <i>state</i></code>

Sets an object's state to a specific value.

- *object_id*: the nth object in order of creation
- *state*: the state index

Objects are state machines. `anim_setobj` changes the state of an object.


## `$D8`: <code>anim_incbgeffect <i>bg_effect</i></code>

Increments a bg effect's state.

- *bg_effect*: `ANIM_BG` constants (see [constants/battle_anim_constants.asm](https://github.com/pret/pokecrystal/blob/master/constants/battle_anim_constants.asm))

Since there can't be two of the same bg effect, the effect type is used. This is distinct from `anim_incobj`.


## `$D9`: `anim_battlergfx_2row`


## `$DA`: `anim_battlergfx_1row`

Loads animation graphics for the bottom one or two rows of the enemy pokemon and the top one or two rows of the player's.  
These graphics are identified through `BATTLE_ANIM_GFX_ENEMYFEET` and `BATTLE_ANIM_GFX_PLAYERHEAD`.

Caveats:
- Doesn't work with `anim_4gfx` and `anim_5gfx`.
- This overwrites previously loaded animation graphics if you've loaded more than 53 tiles (2row) or 66 tiles (1row).


## `$DB`: `anim_checkpokeball`

Sets `BattleAnimVar` to the result of [GetPokeBallWobble](https://github.com/pret/pokecrystal/blob/master/engine/battle_anims/pokeball_wobble.asm).


## `$DC`: `anim_transform`


## `$DD`: `anim_raisesub`


## `$DE`: `anim_dropsub`


## `$DF`: `anim_resetobp0`

Resets rOBP0 to the default (`q0123` or `%00011011`).


## `$E0`: <code>anim_sound <i>duration</i>, <i>tracks</i>, <i>sound_id</i></code>

Plays a sound.


## `$E1`: <code>anim_cry <i>pitch</i></code>

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


## `$EE`: <code>anim_if_param_and <i>value</i>, <i>address</i></code>


## `$EF`: <code>anim_jumpuntil <i>address</i></code>

Jumps to another script and decrements `param` until it reaches 0. Similar to `anim_loop`.


## `$F0`: <code>anim_bgeffect <i>bg_effect</i>, <i>unknown1</i>, <i>unknown2</i>, <i>unknown3</i></code>

- *bg_effect*: `ANIM_BG` constants (see [constants/battle_anim_constants.asm](https://github.com/pret/pokecrystal/blob/master/constants/battle_anim_constants.asm))


## `$F1`: <code>anim_bgp <i>colors</i></code>

Sets `rBGP` to *colors*.


## `$F2`: <code>anim_obp0 <i>colors</i></code>

Sets `rOBP0` to *colors*.


## `$F3`: <code>anim_obp1 <i>colors</i></code>

Sets `rOBP1` to *colors*.


## `$F4`: `anim_keepsprites`

Causes only the palettes to be cleared from the OAM memory when the animation ends, instead of clearing all of the OAM memory. This causes all objects to start using palette 0 (monochrome) when the animation script ends, and whatever objects were on the screen before the last `anim_ret` will stay on the screen.

This is only used for the Poke Ball animation.


## `$F5`: `anim_0xf5`

Does nothing. Unused.


## `$F6`: `anim_0xf6`

Does nothing. Unused.


## `$F7`: `anim_0xf7`

Does nothing. Unused.


## `$F8`: <code>anim_if_param_equal <i>value</i>, <i>address</i></code>

Jumps to another script if `wBattleAnimParam` is equal to *value*.


## `$F9`: <code>anim_setvar <i>value</i></code>

Sets `BattleAnimVar` to *value*.


## `$FA`: `anim_incvar`

Increments `BattleAnimVar` by 1.


## `$FB`: <code>anim_if_var_equal <i>value</i>, <i>address</i></code>

Jumps to another script if `BattleAnimVar` is equal to *value*.


## `$FC`: <code>anim_jump <i>address</i></code>

Jumps to another script.


## `$FD`: <code>anim_loop <i>count</i>, <i>address</i></code>

Jumps to another script up to *count* times. Then does nothing, allowing execution to continue.


## `$FE`: <code>anim_call <i>address</i></code>

Calls a script.

There is no call stack. The return address is overwritten, so the maximum call depth is 1.


## `$FF`: `anim_ret`

Ends the script and returns to where it was called from. If there was no caller, the animation ends.
