VioletNicknameSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x693e9:
	jumptextfaceplayer UnknownText_0x693fa

LassScript_0x693ec:
	jumptextfaceplayer UnknownText_0x6945e

BirdScript_0x693ef:
	faceplayer
	loadfont
	writetext UnknownText_0x6947c
	cry PIDGEY
	closetext
	loadmovesprites
	end

UnknownText_0x693fa:
	text "She uses the names"
	line "of her favorite"
	cont "things to eat."

	para "For the nicknames"
	line "she gives to her"
	cont "#MON, I mean."
	done

UnknownText_0x6945e:
	text "I call my PIDGEY"
	line "STRAWBERRY!"
	done

UnknownText_0x6947c:
	text "STRAWBERRY: Pijji!"
	done

VioletNicknameSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $3, 4, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $7, $4, 4, GROUP_VIOLET_CITY, MAP_VIOLET_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_TEACHER, 7, 6, OW_LEFT | $1, $0, -1, -1, $0, 0, TeacherScript_0x693e9, -1
	person_event SPRITE_LASS, 8, 10, OW_UP | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LassScript_0x693ec, -1
	person_event SPRITE_BIRD, 6, 9, OW_UP | $1, $1, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, BirdScript_0x693ef, -1
