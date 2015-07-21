IcePathB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 3, UnknownScript_0x7e4be

UnknownScript_0x7e4be:
	writecmdqueue CmdQueue_0x7e4c2
	return

CmdQueue_0x7e4c2:
	dbw 2, StoneTable_0x7e4c7 ; check if any stones are sitting on a warp
	db 0, 0 ; filler

StoneTable_0x7e4c7:
	db 3, 2 ; warp, person
	dw UnknownScript_0x7e4d8

	db 4, 3 ; warp, person
	dw UnknownScript_0x7e4e0

	db 5, 4 ; warp, person
	dw UnknownScript_0x7e4e8

	db 6, 5 ; warp, person
	dw UnknownScript_0x7e4f0

	db $ff ; end

UnknownScript_0x7e4d8:
	disappear 2
	clearevent EVENT_BOULDER_IN_ICE_PATH_1A
	jump UnknownScript_0x7e4f8

UnknownScript_0x7e4e0:
	disappear 3
	clearevent EVENT_BOULDER_IN_ICE_PATH_2A
	jump UnknownScript_0x7e4f8

UnknownScript_0x7e4e8:
	disappear 4
	clearevent EVENT_BOULDER_IN_ICE_PATH_3A
	jump UnknownScript_0x7e4f8

UnknownScript_0x7e4f0:
	disappear 5
	clearevent EVENT_BOULDER_IN_ICE_PATH_4A
	jump UnknownScript_0x7e4f8

UnknownScript_0x7e4f8:
	pause 30
	scall UnknownScript_0x7e504
	loadfont
	writetext UnknownText_0x7e512
	closetext
	loadmovesprites
	end

UnknownScript_0x7e504:
	playsound SFX_STRENGTH
	earthquake 80
	end


IcePathB1FBoulder:
	jumpstd strengthboulder

ItemFragment_0x7e50d:
	db IRON, 1

MapIcePathB1FSignpostItem0:
	dwb EVENT_ICE_PATH_B1F_HIDDEN_MAX_POTION, MAX_POTION


UnknownText_0x7e512:
	text "The boulder fell"
	line "through."
	done


IcePathB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 8
	warp_def $f, $3, 3, GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F
	warp_def $3, $11, 1, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $2, $b, 3, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $7, $4, 4, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $c, $5, 5, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $d, $c, 6, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $19, $5, 4, GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F
	warp_def $1b, $b, 1, GROUP_ICE_PATH_B2F_BLACKTHORN_SIDE, MAP_ICE_PATH_B2F_BLACKTHORN_SIDE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 30, 17, SIGNPOST_ITEM, MapIcePathB1FSignpostItem0

.PersonEvents:
	db 5
	person_event SPRITE_BOULDER, 11, 15, OW_LEFT | $11, $0, -1, -1, $0, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_1
	person_event SPRITE_BOULDER, 12, 11, OW_LEFT | $11, $0, -1, -1, $0, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_2
	person_event SPRITE_BOULDER, 13, 12, OW_LEFT | $11, $0, -1, -1, $0, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_3
	person_event SPRITE_BOULDER, 11, 21, OW_LEFT | $11, $0, -1, -1, $0, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_4
	person_event SPRITE_POKE_BALL, 39, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e50d, EVENT_ICE_PATH_B1F_IRON
