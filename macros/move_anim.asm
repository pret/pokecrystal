anim_wait: macro
if \1 >= $d0
	flip out
endc
	db \1
	endm

anim_obj: macro
	db $d0
	db \1 ; obj
	db \2 ; x
	db \3 ; y
	db \4 ; param
	endm

anim_1gfx: macro
	db $d1
	db \1 ; gfx1
	endm

anim_2gfx: macro
	db $d2
	db \1 ; gfx1
	db \2 ; gfx2
	endm

anim_3gfx: macro
	db $d3
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	endm

anim_4gfx: macro
	db $d4
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
	endm

anim_5gfx: macro
	db $d5
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
	db \5 ; gfx5
	endm

anim_incobj: macro
	db $d6
	db \1 ; id
	endm

anim_setobj: macro
	db $d7
	db \1 ; id
	db \2 ; obj
	endm

anim_incbgeffect: macro
	db $d8
	db \1 ; effect
	endm

anim_enemyfeetobj: macro
	db $d9
	endm

anim_playerheadobj: macro
	db $da
	endm

anim_checkpokeball: macro
	db $db
	endm

anim_transform: macro
	db $dc
	endm

anim_raisesub: macro
	db $dd
	endm

anim_dropsub: macro
	db $de
	endm

anim_resetobp0: macro
	db $df
	endm

anim_sound: macro
	db $e0
	db \1 ; tracks
	db \2 ; id
	endm

anim_cry: macro
	db $e1
	db \1 ; pitch
	endm

anim_minimizeopp: macro
	db $e2
	endm

anim_oamon: macro
	db $e3
	endm

anim_oamoff: macro
	db $e4
	endm

anim_clearobjs: macro
	db $e5
	endm

anim_beatup: macro
	db $e6
	endm

anim_0xe7: macro
	db $e7
	endm

anim_updateactorpic: macro
	db $e8
	endm

anim_minimize: macro
	db $e9
	endm

anim_0xea: macro
	db $ea
	endm

anim_0xeb: macro
	db $eb
	endm

anim_0xec: macro
	db $ec
	endm

anim_0xed: macro
	db $ed
	endm

anim_jumpand: macro
	db $ee
	db \1 ; value
	dw \2 ; address
	endm

anim_jumpuntil: macro
	db $ef
	dw \1 ; address
	endm

anim_bgeffect: macro
	db $f0
	db \1 ; effect
	db \2 ; unknown
	db \3 ; unknown
	db \4 ; unknown
	endm

anim_bgp: macro
	db $f1
	db \1 ; colors
	endm

anim_obp0: macro
	db $f2
	db \1 ; colors
	endm

anim_obp1: macro
	db $f3
	db \1 ; colors
	endm

anim_clearsprites: macro
	db $f4
	endm

anim_0xf5: macro
	db $f5
	endm

anim_0xf6: macro
	db $f6
	endm

anim_0xf7: macro
	db $f7
	endm

anim_jumpif: macro
	db $f8
	db \1 ; value
	dw \2 ; address
	endm

anim_setvar: macro
	db $f9
	db \1 ; value
	endm

anim_incvar: macro
	db $fa
	endm

anim_jumpvar: macro
	db $fb
	db \1 ; value
	dw \2 ; address
	endm

anim_jump: macro
	db $fc
	dw \1 ; address
	endm

anim_loop: macro
	db $fd
	db \1 ; count
	dw \2 ; address
	endm

anim_call: macro
	db $fe
	dw \1 ; address
	endm

anim_ret: macro
	db $ff
	endm
