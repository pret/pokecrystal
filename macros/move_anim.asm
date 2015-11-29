anim_wait: macro
if \1 >= $d0
	flip out
endc
	db \1
	endm

	enum_start $d0

	command anim_obj ; d0
	command_macro
	db \1 ; obj
	db \2 ; x
	db \3 ; y
	db \4 ; param
	endm

	command anim_1gfx ; d1
	command_macro
	db \1 ; gfx1
	endm

	command anim_2gfx ; d2
	command_macro
	db \1 ; gfx1
	db \2 ; gfx2
	endm

	command anim_3gfx ; d3
	command_macro
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	endm

	command anim_4gfx ; d4
	command_macro
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
	endm

	command anim_5gfx ; d5
	command_macro
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
	db \5 ; gfx5
	endm

	command anim_incobj ; d6
	command_macro
	db \1 ; id
	endm

	command anim_setobj ; d7
	command_macro
	db \1 ; id
	db \2 ; obj
	endm

	command anim_incbgeffect ; d8
	command_macro
	db \1 ; effect
	endm

	command anim_enemyfeetobj ; d9
	command_macro
	endm

	command anim_playerheadobj ; da
	command_macro
	endm

	command anim_checkpokeball ; db
	command_macro
	endm

	command anim_transform ; dc
	command_macro
	endm

	command anim_raisesub ; dd
	command_macro
	endm

	command anim_dropsub ; de
	command_macro
	endm

	command anim_resetobp0 ; df
	command_macro
	endm

	command anim_sound ; e0
	command_macro
	db \1 ; tracks
	db \2 ; id
	endm

	command anim_cry ; e1
	command_macro
	db \1 ; pitch
	endm

	command anim_minimizeopp ; e2
	command_macro
	endm

	command anim_oamon ; e3
	command_macro
	endm

	command anim_oamoff ; e4
	command_macro
	endm

	command anim_clearobjs ; e5
	command_macro
	endm

	command anim_beatup ; e6
	command_macro
	endm

	command anim_0xe7 ; e7
	command_macro
	endm

	command anim_updateactorpic ; e8
	command_macro
	endm

	command anim_minimize ; e9
	command_macro
	endm

	command anim_0xea ; ea
	command_macro
	endm

	command anim_0xeb ; eb
	command_macro
	endm

	command anim_0xec ; ec
	command_macro
	endm

	command anim_0xed ; ed
	command_macro
	endm

	command anim_jumpand ; ee
	command_macro
	db \1 ; value
	dw \2 ; address
	endm

	command anim_jumpuntil ; ef
	command_macro
	dw \1 ; address
	endm

	command anim_bgeffect ; f0
	command_macro
	db \1 ; effect
	db \2 ; unknown
	db \3 ; unknown
	db \4 ; unknown
	endm

	command anim_bgp ; f1
	command_macro
	db \1 ; colors
	endm

	command anim_obp0 ; f2
	command_macro
	db \1 ; colors
	endm

	command anim_obp1 ; f3
	command_macro
	db \1 ; colors
	endm

	command anim_clearsprites ; f4
	command_macro
	endm

	command anim_0xf5 ; f5
	command_macro
	endm

	command anim_0xf6 ; f6
	command_macro
	endm

	command anim_0xf7 ; f7
	command_macro
	endm

	command anim_jumpif ; f8
	command_macro
	db \1 ; value
	dw \2 ; address
	endm

	command anim_setvar ; f9
	command_macro
	db \1 ; value
	endm

	command anim_incvar ; fa
	command_macro
	endm

	command anim_jumpvar ; fb
	command_macro
	db \1 ; value
	dw \2 ; address
	endm

	command anim_jump ; fc
	command_macro
	dw \1 ; address
	endm

	command anim_loop ; fd
	command_macro
	db \1 ; count
	dw \2 ; address
	endm

	command anim_call ; fe
	command_macro
	dw \1 ; address
	endm

	command anim_ret ; ff
	command_macro
	endm
