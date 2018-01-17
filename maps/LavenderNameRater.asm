const_value set 2
	const LAVENDERNAMERATER_NAME_RATER

LavenderNameRater_MapScripts:
.SceneScripts:
	db 1
	scene_script .DummyScene

.MapCallbacks:
	db 0

.DummyScene:
	end

LavenderNameRater:
	faceplayer
	opentext
	special Special_NameRater
	waitbutton
	closetext
	end

LavenderNameRaterUnusedBookshelf:
	jumpstd difficultbookshelf

LavenderNameRater_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 4, LAVENDER_TOWN
	warp_def 3, 7, 4, LAVENDER_TOWN

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 2, 3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderNameRater, -1
