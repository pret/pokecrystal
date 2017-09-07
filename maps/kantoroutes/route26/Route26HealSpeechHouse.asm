const_value set 2
	const ROUTE26HEALSPEECHHOUSE_TEACHER

Route26HealSpeechHouse_MapScriptHeader:
.MapTriggers:
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
	special Special_ReloadSpritesNoPalettes
	special TrainerRankings_Healings
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

Route26HealSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, ROUTE_26
	warp_def $7, $3, 2, ROUTE_26

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, Route26HealHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, Route26HealHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_TEACHER, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x7b125, -1
