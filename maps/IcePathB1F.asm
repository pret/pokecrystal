const_value set 2
	const ICEPATHB1F_BOULDER1
	const ICEPATHB1F_BOULDER2
	const ICEPATHB1F_BOULDER3
	const ICEPATHB1F_BOULDER4
	const ICEPATHB1F_POKE_BALL

IcePathB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 3, .SetUpStoneTable

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	dbw 2, .StoneTable ; check if any stones are sitting on a warp
	db 0, 0 ; filler

.StoneTable:
	db 3, 2 ; warp, person
	dw .Boulder1

	db 4, 3 ; warp, person
	dw .Boulder2

	db 5, 4 ; warp, person
	dw .Boulder3

	db 6, 5 ; warp, person
	dw .Boulder4

	db -1 ; end

.Boulder1:
	disappear ICEPATHB1F_BOULDER1
	clearevent EVENT_BOULDER_IN_ICE_PATH_1A
	jump .FinishBoulder

.Boulder2:
	disappear ICEPATHB1F_BOULDER2
	clearevent EVENT_BOULDER_IN_ICE_PATH_2A
	jump .FinishBoulder

.Boulder3:
	disappear ICEPATHB1F_BOULDER3
	clearevent EVENT_BOULDER_IN_ICE_PATH_3A
	jump .FinishBoulder

.Boulder4:
	disappear ICEPATHB1F_BOULDER4
	clearevent EVENT_BOULDER_IN_ICE_PATH_4A
	jump .FinishBoulder

.FinishBoulder:
	pause 30
	scall .BoulderFallsThrough
	loadfont
	writetext UnknownText_0x7e512
	waitbutton
	closetext
	end

.BoulderFallsThrough:
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
	warp_def $f, $3, 3, ICE_PATH_1F
	warp_def $3, $11, 1, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $2, $b, 3, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $7, $4, 4, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $c, $5, 5, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $d, $c, 6, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $19, $5, 4, ICE_PATH_1F
	warp_def $1b, $b, 1, ICE_PATH_B2F_BLACKTHORN_SIDE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 30, 17, SIGNPOST_ITEM, MapIcePathB1FSignpostItem0

.PersonEvents:
	db 5
	person_event SPRITE_BOULDER, 7, 11, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_1
	person_event SPRITE_BOULDER, 8, 7, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_2
	person_event SPRITE_BOULDER, 9, 8, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_3
	person_event SPRITE_BOULDER, 7, 17, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, IcePathB1FBoulder, EVENT_BOULDER_IN_ICE_PATH_4
	person_event SPRITE_POKE_BALL, 35, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x7e50d, EVENT_ICE_PATH_B1F_IRON
