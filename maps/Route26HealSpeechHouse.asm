Route26HealSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x7b125:
	faceplayer
	loadfont
	writetext UnknownText_0x7b14d
	closetext
	loadmovesprites
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	special Mobile_HealParty
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	loadfont
	writetext UnknownText_0x7b18b
	closetext
	loadmovesprites
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
	warp_def $7, $2, 2, GROUP_ROUTE_26, MAP_ROUTE_26
	warp_def $7, $3, 2, GROUP_ROUTE_26, MAP_ROUTE_26

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, Route26HealHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, Route26HealHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_TEACHER, 7, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, TeacherScript_0x7b125, -1
