map: macro
;\1: map id
	db GROUP_\1, MAP_\1
endm

maptrigger: macro
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

xy_trigger: macro
;\1: number: controlled by dotrigger/domaptrigger
;\2: y: top to bottom, starts at 0
;\3: x: left to right, starts at 0
;\4: script pointer
	db \1, \2, \3, $0
	dw \4
	db $0, $0
endm

signpost: macro
;\1: y: top to bottom, starts at 0
;\2: x: left to right, starts at 0
;\3: function: a SIGNPOST_* constant
;\4: script pointer
	db \1, \2, \3
	dw \4
endm

person_event: macro
;\1: sprite: a SPRITE_* constant
;\2: y: top to bottom, starts at 0
;\3: x: left to right, starts at 0
;\4: movement function: a SPRITEMOVEDATA_* constant
;\5, \6: movement radius: y, x
;\7: clock hour: ???
;\8: clock daytime: sum of MORN, DAY, and/or NITE, or 0 for always
;\9: color: a PAL_NPC_* constant, or 0 for sprite default
;\10: function: a PERSONTYPE_* constant
;\11: sight range: applies to PERSONTYPE_TRAINER
;\12: script pointer
;\13: event flag: an EVENT_* constant, or 0 for always
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


newgroup: macro
const_value = const_value + 1
	enum_start 1
endm

mapgroup: macro
;\1: map id
;\2: height: in blocks
;\3: width: in blocks
GROUP_\1 EQU const_value
	enum MAP_\1
\1_HEIGHT EQU \2
\1_WIDTH EQU \3
endm


map_header: macro
;\1: map label
;\2: tileset: a TILESET_* constant
;\3: permission: TOWN, ROUTE, INDOOR, CAVE, PERM_5, GATE, or DUNGEON
;\4: location: from constants/landmark_constants.asm
;\5: music: a MUSIC_* constant
;\6: phone service flag: 1 to prevent phone calls
;\7: time of day: a PALETTE_* constant
;\8: fishing group: a FISHGROUP_* constant
\1_MapHeader:
	db BANK(\1_SecondMapHeader), \2, \3
	dw \1_SecondMapHeader
	db \4, \5
	dn \6, \7
	db \8
endm


map_header_2: macro
;\1: map label
;\2: map id
;\3: border block
;\4: connections: sum of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
\1_SecondMapHeader::
	db \3
	db \2_HEIGHT, \2_WIDTH
	db BANK(\1_BlockData)
	dw \1_BlockData
	db BANK(\1_MapScriptHeader)
	dw \1_MapScriptHeader
	dw \1_MapEventHeader
	db \4
endm

connection: macro
if "\1" == "north"
;\2: map id
;\3: map label (eventually will be rolled into map id)
;\4: x
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_BlockData + \2_WIDTH * (\2_HEIGHT - 3) + \5
	dw OverworldMap + \4 + 3
	db \6
	db \2_WIDTH
	db \2_HEIGHT * 2 - 1
	db (\4 - \5) * -2
	dw OverworldMap + \2_HEIGHT * (\2_WIDTH + 6) + 1
endc

if "\1" == "south"
;\2: map id
;\3: map label (eventually will be rolled into map id)
;\4: x
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_BlockData + \5
	dw OverworldMap + (\7_HEIGHT + 3) * (\7_WIDTH + 6) + \4 + 3
	db \6
	db \2_WIDTH
	db 0
	db (\4 - \5) * -2
	dw OverworldMap + \2_WIDTH + 7
endc

if "\1" == "west"
;\2: map id
;\3: map label (eventually will be rolled into map id)
;\4: y
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_BlockData + (\2_WIDTH * \5) + \2_WIDTH - 3
	dw OverworldMap + (\7_WIDTH + 6) * (\4 + 3)
	db \6
	db \2_WIDTH
	db (\4 - \5) * -2
	db \2_WIDTH * 2 - 1
	dw OverworldMap + \2_WIDTH * 2 + 6
endc

if "\1" == "east"
;\2: map id
;\3: map label (eventually will be rolled into map id)
;\4: y
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_BlockData + (\2_WIDTH * \5)
	dw OverworldMap + (\7_WIDTH + 6) * (\4 + 3 + 1) - 3
	db \6
	db \2_WIDTH
	db (\4 - \5) * -2
	db 0
	dw OverworldMap + \2_WIDTH + 7
endc
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
;\2: person_event id
;\3: script pointer
	db \1, \2
	dw \3
endm
