anim_wait: macro
if \1 >= $d0
	flip out
endc
	db \1
	endm

	enum_start $d0

	enum anim_obj_command ; d0
anim_obj: macro
	db anim_obj_command
	db \1 ; obj
	db (\2 << 3) + \3 ; x
	db (\4 << 3) + \5 ; y
	db \6 ; param
	endm

	enum anim_1gfx_command ; d1
anim_1gfx: macro
	db anim_1gfx_command
	db \1 ; gfx1
	endm

	enum anim_2gfx_command ; d2
anim_2gfx: macro
	db anim_2gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	endm

	enum anim_3gfx_command ; d3
anim_3gfx: macro
	db anim_3gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	endm

	enum anim_4gfx_command ; d4
anim_4gfx: macro
	db anim_4gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
	endm

	enum anim_5gfx_command ; d5
anim_5gfx: macro
	db anim_5gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
	db \5 ; gfx5
	endm

	enum anim_incobj_command ; d6
anim_incobj: macro
	db anim_incobj_command
	db \1 ; id
	endm

	enum anim_setobj_command ; d7
anim_setobj: macro
	db anim_setobj_command
	db \1 ; id
	db \2 ; obj
	endm

	enum anim_incbgeffect_command ; d8
anim_incbgeffect: macro
	db anim_incbgeffect_command
	db \1 ; effect
	endm

	enum anim_enemyfeetobj_command ; d9
anim_enemyfeetobj: macro
	db anim_enemyfeetobj_command
	endm

	enum anim_playerheadobj_command ; da
anim_playerheadobj: macro
	db anim_playerheadobj_command
	endm

	enum anim_checkpokeball_command ; db
anim_checkpokeball: macro
	db anim_checkpokeball_command
	endm

	enum anim_transform_command ; dc
anim_transform: macro
	db anim_transform_command
	endm

	enum anim_raisesub_command ; dd
anim_raisesub: macro
	db anim_raisesub_command
	endm

	enum anim_dropsub_command ; de
anim_dropsub: macro
	db anim_dropsub_command
	endm

	enum anim_resetobp0_command ; df
anim_resetobp0: macro
	db anim_resetobp0_command
	endm

	enum anim_sound_command ; e0
anim_sound: macro
	db anim_sound_command
	db (\1 << 2) | \2 ; duration, tracks
	db \3 ; id
	endm

	enum anim_cry_command ; e1
anim_cry: macro
	db anim_cry_command
	db \1 ; pitch
	endm

	enum anim_minimizeopp_command ; e2
anim_minimizeopp: macro
	db anim_minimizeopp_command
	endm

	enum anim_oamon_command ; e3
anim_oamon: macro
	db anim_oamon_command
	endm

	enum anim_oamoff_command ; e4
anim_oamoff: macro
	db anim_oamoff_command
	endm

	enum anim_clearobjs_command ; e5
anim_clearobjs: macro
	db anim_clearobjs_command
	endm

	enum anim_beatup_command ; e6
anim_beatup: macro
	db anim_beatup_command
	endm

	enum anim_0xe7_command ; e7
anim_0xe7: macro
	db anim_0xe7_command
	endm

	enum anim_updateactorpic_command ; e8
anim_updateactorpic: macro
	db anim_updateactorpic_command
	endm

	enum anim_minimize_command ; e9
anim_minimize: macro
	db anim_minimize_command
	endm

	enum anim_0xea_command ; ea
anim_0xea: macro
	db anim_0xea_command
	endm

	enum anim_0xeb_command ; eb
anim_0xeb: macro
	db anim_0xeb_command
	endm

	enum anim_0xec_command ; ec
anim_0xec: macro
	db anim_0xec_command
	endm

	enum anim_0xed_command ; ed
anim_0xed: macro
	db anim_0xed_command
	endm

	enum anim_if_param_and_command ; ee
anim_if_param_and: macro
	db anim_if_param_and_command
	db \1 ; value
	dw \2 ; address
	endm

	enum anim_jumpuntil_command ; ef
anim_jumpuntil: macro
	db anim_jumpuntil_command
	dw \1 ; address
	endm

	enum anim_bgeffect_command ; f0
anim_bgeffect: macro
	db anim_bgeffect_command
	db \1 ; effect
	db \2 ; unknown
	db \3 ; unknown
	db \4 ; unknown
	endm

	enum anim_bgp_command ; f1
anim_bgp: macro
	db anim_bgp_command
	db \1 ; colors
	endm

	enum anim_obp0_command ; f2
anim_obp0: macro
	db anim_obp0_command
	db \1 ; colors
	endm

	enum anim_obp1_command ; f3
anim_obp1: macro
	db anim_obp1_command
	db \1 ; colors
	endm

	enum anim_clearsprites_command ; f4
anim_clearsprites: macro
	db anim_clearsprites_command
	endm

	enum anim_0xf5_command ; f5
anim_0xf5: macro
	db anim_0xf5_command
	endm

	enum anim_0xf6_command ; f6
anim_0xf6: macro
	db anim_0xf6_command
	endm

	enum anim_0xf7_command ; f7
anim_0xf7: macro
	db anim_0xf7_command
	endm

	enum anim_if_param_equal_command ; f8
anim_if_param_equal: macro
	db anim_if_param_equal_command
	db \1 ; value
	dw \2 ; address
	endm

	enum anim_setvar_command ; f9
anim_setvar: macro
	db anim_setvar_command
	db \1 ; value
	endm

	enum anim_incvar_command ; fa
anim_incvar: macro
	db anim_incvar_command
	endm

	enum anim_if_var_equal_command ; fb
anim_if_var_equal: macro
	db anim_if_var_equal_command
	db \1 ; value
	dw \2 ; address
	endm

	enum anim_jump_command ; fc
anim_jump: macro
	db anim_jump_command
	dw \1 ; address
	endm

	enum anim_loop_command ; fd
anim_loop: macro
	db anim_loop_command
	db \1 ; count
	dw \2 ; address
	endm

	enum anim_call_command ; fe
anim_call: macro
	db anim_call_command
	dw \1 ; address
	endm

	enum anim_ret_command ; ff
anim_ret: macro
	db anim_ret_command
	endm
