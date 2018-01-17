const_value set 2
	const ROUTE26HEALSPEECHHOUSE_TEACHER

Route26HealSpeechHouse_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x7b125:
	faceplayer
	opentext
	writetext UnknownText_0x7b14d
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special Special_StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	opentext
	writetext UnknownText_0x7b18b
	waitbutton
	closetext
	end

Route26HealHouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x7b14d:
	text "Your #MON look"
	line "a little tired."

	para "You should rest"
	line "them a while."
	done

UnknownText_0x7b18b:
	text "There!"

	para "Your #MON are"
	line "looking good!"

	para "Keep at it!"
	done

Route26HealSpeechHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 2, ROUTE_26
	warp_def 3, 7, 2, ROUTE_26

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 0, 1, BGEVENT_READ, Route26HealHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, Route26HealHouseBookshelf

.ObjectEvents:
	db 1
	object_event 2, 3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeacherScript_0x7b125, -1
