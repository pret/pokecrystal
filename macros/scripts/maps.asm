map: macro
;\1: map id
	db GROUP_\1, MAP_\1
endm


scene_script: macro
;\1: script pointer
	dw \1, 0
endm

warp_def: macro
;\1: y: top to bottom, starts at 0
;\2: x: left to right, starts at 0
;\3: warp destination: starts at 1
;\4: map id: from constants/map_constants.asm
	db \1, \2, \3
	map \4
endm

coord_event: macro
;\1: number: controlled by setscene/setmapscene
;\2: y: top to bottom, starts at 0
;\3: x: left to right, starts at 0
;\4: script pointer
	db \1, \2, \3, $0
	dw \4
	db $0, $0
endm

bg_event: macro
;\1: y: top to bottom, starts at 0
;\2: x: left to right, starts at 0
;\3: function: a BGEVENT_* constant
;\4: script pointer
	db \1, \2, \3
	dw \4
endm

object_event: macro
;\1: sprite: a SPRITE_* constant
;\2: y: top to bottom, starts at 0
;\3: x: left to right, starts at 0
;\4: movement function: a SPRITEMOVEDATA_* constant
;\5, \6: movement radius: y, x
;\7, \8: hour1 and hour2: control the hours an object_event is visible (0-23)
;  * if hour1 < hour2, the object_event will only appear from hour1 to hour2
;  * if hour1 > hour2, the object_event will not appear from hour2 to hour1
;  * if hour1 == hour2, the object_event will always appear
;  * if hour1 == -1, hour2 is treated as a time-of-day value:
;    a combo of MORN, DAY, and/or NITE, or -1 to always appear
;\9: color: a PAL_NPC_* constant, or 0 for sprite default
;\10: function: a OBJECTTYPE_* constant
;\11: sight range: applies to OBJECTTYPE_TRAINER
;\12: script pointer
;\13: event flag: an EVENT_* constant, or 0 to always appear
	db \1, \2 + 4, \3 + 4, \4
	dn \5, \6
	db \7, \8
	shift
	dn \8, \9
	shift
	db \9
	shift
	dw \9
	shift
	dw \9
endm


trainer: macro
;\1: flag: an EVENT_BEAT_* constant
;\2: trainer group
;\3: trainer id
;\4: seen text
;\5: win text
;\6: loss text
;\7: after-battle text
	dw \1
	db \2, \3
	dw \4, \5, \6, \7
endm

itemball: macro
;\1: item: from constants/item_constants.asm
;\2: quantity: default 1
if _NARG == 2
	db \1, \2
else
	db \1, 1
endc
endm

elevfloor: macro
;\1: floor: a FLOOR_* constant
;\2: warp destination: starts at 1
;\3: map id
	db \1, \2
	map \3
ENDM

stonetable: macro
;\1: warp id
;\2: object_event id
;\3: script pointer
	db \1, \2
	dw \3
endm
