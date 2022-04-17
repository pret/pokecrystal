; BattleAnimCommands indexes (see engine/battle_anims/anim_commands.asm)
	const_def $d0
DEF FIRST_BATTLE_ANIM_CMD EQU const_value

MACRO anim_wait
	assert (\1) < FIRST_BATTLE_ANIM_CMD, "anim_wait argument must be less than {FIRST_BATTLE_ANIM_CMD}"
	db \1
ENDM

	const anim_obj_command ; $d0
MACRO anim_obj
	db anim_obj_command
	if _NARG <= 4
		db \1 ; object
		db \2 ; x
		db \3 ; y
		db \4 ; param
	else
	; LEGACY: Support the tile+offset format
		db \1 ; object
		db (\2) * 8 + (\3) ; x_tile, x
		db (\4) * 8 + (\5) ; y_tile, y
		db \6 ; param
	endc
ENDM

	const anim_1gfx_command ; $d1
MACRO anim_1gfx
	db anim_1gfx_command
	db \1 ; gfx1
ENDM

	const anim_2gfx_command ; $d2
MACRO anim_2gfx
	db anim_2gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
ENDM

	const anim_3gfx_command ; $d3
MACRO anim_3gfx
	db anim_3gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
ENDM

	const anim_4gfx_command ; $d4
MACRO anim_4gfx
	db anim_4gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
ENDM

	const anim_5gfx_command ; $d5
MACRO anim_5gfx
	db anim_5gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
	db \5 ; gfx5
ENDM

	const anim_incobj_command ; $d6
MACRO anim_incobj
	db anim_incobj_command
	db \1 ; object_id
ENDM

	const anim_setobj_command ; $d7
MACRO anim_setobj
	db anim_setobj_command
	db \1 ; object_id
	db \2 ; value
ENDM

	const anim_incbgeffect_command ; $d8
MACRO anim_incbgeffect
	db anim_incbgeffect_command
	db \1 ; effect
ENDM

	const anim_battlergfx_2row_command ; $d9
MACRO anim_battlergfx_2row
	db anim_battlergfx_2row_command
ENDM

	const anim_battlergfx_1row_command ; $da
MACRO anim_battlergfx_1row
	db anim_battlergfx_1row_command
ENDM

	const anim_checkpokeball_command ; $db
MACRO anim_checkpokeball
	db anim_checkpokeball_command
ENDM

	const anim_transform_command ; $dc
MACRO anim_transform
	db anim_transform_command
ENDM

	const anim_raisesub_command ; $dd
MACRO anim_raisesub
	db anim_raisesub_command
ENDM

	const anim_dropsub_command ; $de
MACRO anim_dropsub
	db anim_dropsub_command
ENDM

	const anim_resetobp0_command ; $df
MACRO anim_resetobp0
	db anim_resetobp0_command
ENDM

	const anim_sound_command ; $e0
MACRO anim_sound
	db anim_sound_command
	db (\1 << 2) | \2 ; duration, tracks
	db \3 ; sound_id
ENDM

	const anim_cry_command ; $e1
MACRO anim_cry
	db anim_cry_command
	db \1 ; pitch
ENDM

	const anim_minimizeopp_command ; $e2
MACRO anim_minimizeopp
	db anim_minimizeopp_command
ENDM

	const anim_oamon_command ; $e3
MACRO anim_oamon
	db anim_oamon_command
ENDM

	const anim_oamoff_command ; $e4
MACRO anim_oamoff
	db anim_oamoff_command
ENDM

	const anim_clearobjs_command ; $e5
MACRO anim_clearobjs
	db anim_clearobjs_command
ENDM

	const anim_beatup_command ; $e6
MACRO anim_beatup
	db anim_beatup_command
ENDM

	const anim_0xe7_command ; $e7
MACRO anim_0xe7
	db anim_0xe7_command
ENDM

	const anim_updateactorpic_command ; $e8
MACRO anim_updateactorpic
	db anim_updateactorpic_command
ENDM

	const anim_minimize_command ; $e9
MACRO anim_minimize
	db anim_minimize_command
ENDM

	const anim_0xea_command ; $ea
MACRO anim_0xea
	db anim_0xea_command
ENDM

	const anim_0xeb_command ; $eb
MACRO anim_0xeb
	db anim_0xeb_command
ENDM

	const anim_0xec_command ; $ec
MACRO anim_0xec
	db anim_0xec_command
ENDM

	const anim_0xed_command ; $ed
MACRO anim_0xed
	db anim_0xed_command
ENDM

	const anim_if_param_and_command ; $ee
MACRO anim_if_param_and
	db anim_if_param_and_command
	db \1 ; value
	dw \2 ; address
ENDM

	const anim_jumpuntil_command ; $ef
MACRO anim_jumpuntil
	db anim_jumpuntil_command
	dw \1 ; address
ENDM

	const anim_bgeffect_command ; $f0
MACRO anim_bgeffect
	db anim_bgeffect_command
	db \1 ; effect
	db \2 ; jumptable index
	db \3 ; battle turn
	db \4 ; unknown
ENDM

	const anim_bgp_command ; $f1
MACRO anim_bgp
	db anim_bgp_command
	db \1 ; colors
ENDM

	const anim_obp0_command ; $f2
MACRO anim_obp0
	db anim_obp0_command
	db \1 ; colors
ENDM

	const anim_obp1_command ; $f3
MACRO anim_obp1
	db anim_obp1_command
	db \1 ; colors
ENDM

	const anim_keepsprites_command ; $f4
MACRO anim_keepsprites
	db anim_keepsprites_command
ENDM

	const anim_0xf5_command ; $f5
MACRO anim_0xf5
	db anim_0xf5_command
ENDM

	const anim_0xf6_command ; $f6
MACRO anim_0xf6
	db anim_0xf6_command
ENDM

	const anim_0xf7_command ; $f7
MACRO anim_0xf7
	db anim_0xf7_command
ENDM

	const anim_if_param_equal_command ; $f8
MACRO anim_if_param_equal
	db anim_if_param_equal_command
	db \1 ; value
	dw \2 ; address
ENDM

	const anim_setvar_command ; $f9
MACRO anim_setvar
	db anim_setvar_command
	db \1 ; value
ENDM

	const anim_incvar_command ; $fa
MACRO anim_incvar
	db anim_incvar_command
ENDM

	const anim_if_var_equal_command ; $fb
MACRO anim_if_var_equal
	db anim_if_var_equal_command
	db \1 ; value
	dw \2 ; address
ENDM

	const anim_jump_command ; $fc
MACRO anim_jump
	db anim_jump_command
	dw \1 ; address
ENDM

	const anim_loop_command ; $fd
MACRO anim_loop
	db anim_loop_command
	db \1 ; count
	dw \2 ; address
ENDM

	const anim_call_command ; $fe
MACRO anim_call
	db anim_call_command
	dw \1 ; address
ENDM

	const anim_ret_command ; $ff
MACRO anim_ret
	db anim_ret_command
ENDM
