VioletNicknameSpeechHouse_MapScriptHeader: ; 0x693e7
	; trigger count
	db 0

	; callback count
	db 0
; 0x693e9

TeacherScript_0x693e9: ; 0x693e9
	jumptextfaceplayer UnknownText_0x693fa
; 0x693ec

LassScript_0x693ec: ; 0x693ec
	jumptextfaceplayer UnknownText_0x6945e
; 0x693ef

BirdScript_0x693ef: ; 0x693ef
	faceplayer
	loadfont
	writetext UnknownText_0x6947c
	cry PIDGEY
	closetext
	loadmovesprites
	end
; 0x693fa

UnknownText_0x693fa: ; 0x693fa
	text "She uses the names"
	line "of her favorite"
	cont "things to eat."

	para "For the nicknames"
	line "she gives to her"
	cont "#MON, I mean."
	done
; 0x6945e

UnknownText_0x6945e: ; 0x6945e
	text "I call my PIDGEY"
	line "STRAWBERRY!"
	done
; 0x6947c

UnknownText_0x6947c: ; 0x6947c
	text "STRAWBERRY: Pijji!"
	done
; 0x69490

VioletNicknameSpeechHouse_MapEventHeader: ; 0x69490
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 4, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $7, $4, 4, GROUP_VIOLET_CITY, MAP_VIOLET_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_TEACHER, 7, 6, $9, $0, 255, 255, $0, 0, TeacherScript_0x693e9, $ffff
	person_event SPRITE_LASS, 8, 10, $7, $0, 255, 255, $a0, 0, LassScript_0x693ec, $ffff
	person_event SPRITE_BIRD, 6, 9, $5, $1, 255, 255, $b0, 0, BirdScript_0x693ef, $ffff
; 0x694c7

