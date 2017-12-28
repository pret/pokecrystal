# Battle Animation Commands

Defined in [macros/scripts/battle_anims.asm](/macros/scripts/battle_anims.asm) and [data/moves/animations.asm:BattleAnimations](/data/moves/animations.asm).


## `$00`−`$EF`: `anim_wait` *length*

## `$D0`: `anim_obj` *object*, *x1*, *x2*, *y1*, *y2*, *param*

The *x1*/*x2* and *y1*/*y2* pairs specify the position on screen of the animation object.
*x1*/*y1* specify a tile position, and *x2*/*y2* specify a pixel offset from that tile. 

Values for *x2*/*y2* are in the 0-7 range, since 8 pixels make a tile.

Values for *x1* are between -16 to 31. In practice *x1* starts between 0 to 15, then between -16 to -10. Negative values are relative to the opponent, while positive values are relative to the player. Useful values are between 14 to -10 (for the opponent) and between 0 to 13 (for the player).

Some sample values are:

- 0: player left border
- 6: player center
- -15: enemy center
- -10: enemy right border

Values for *y1* are also between -16 to 31; the useful range is between 2 to 14.
Values between 2 to 8 will be in the opponent's area (2 being the top border and 8 being the
bottom border), and values between 8 to 14 will be in the player's area (again, 8 being the top border and 14 being the bottom border).
The center of the body is often 2 to 4 tiles away from the border (i.e., 5-6 for the opponent or 10-11 for the player).

## `$D1`: `anim_1gfx` *gfx*

## `$D2`: `anim_2gfx` *gfx1*, *gfx2*

## `$D3`: `anim_3gfx` *gfx1*, *gfx2*, *gfx3*

## `$D4`: `anim_4gfx` *gfx1*, *gfx2*, *gfx3*, *gfx4*

## `$D5`: `anim_5gfx` *gfx1*, *gfx2*, *gfx3*, *gfx4*, *gfx5*

## `$D6`: `anim_incobj` *id*

## `$D7`: `anim_setobj` *id*, *object*

## `$D8`: `anim_incbgeffect` *effect*

## `$D9`: `anim_enemyfeetobj`

## `$DA`: `anim_playerheadobj`

## `$DB`: `anim_checkpokeball`

## `$DC`: `anim_transform`

## `$DD`: `anim_raisesub`

## `$DE`: `anim_dropsub`

## `$DF`: `anim_resetobp0`

## `$E0`: `anim_sound` *duration*, *tracks*, *id*

## `$E1`: `anim_cry` *pitch*

## `$E2`: `anim_minimizeopp`

## `$E3`: `anim_oamon`

## `$E4`: `anim_oamoff`

## `$E5`: `anim_clearobjs`

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

## `$F0`: `anim_bgeffect` *effect*, *unknown1*, *unknown2*, *unknown3*

## `$F1`: `anim_bgp` *colors*

## `$F2`: `anim_obp0` *colors*

## `$F3`: `anim_obp1` *colors*

## `$F4`: `anim_clearsprites`

## `$F5`: `anim_0xf5`

## `$F6`: `anim_0xf6`

## `$F7`: `anim_0xf7`

## `$F8`: `anim_if_param_equal` *value*, *address*

## `$F9`: `anim_setvar` *value*

## `$FA`: `anim_incvar`

## `$FB`: `anim_if_var_equal` *value*, *address*

## `$FC`: `anim_jump` *address*

## `$FD`: `anim_loop` *count*, *address*

## `$FE`: `anim_call` *address*

## `$FF`: `anim_ret`
