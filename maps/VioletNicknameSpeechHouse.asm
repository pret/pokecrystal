VioletNicknameSpeechHouse_MapScriptHeader: ; 0x693e7
	; trigger count
	db 0

	; callback count
	db 0
; 0x693e9

UnknownScript_0x693e9: ; 0x693e9
	jumptextfaceplayer UnknownText_0x693fa
; 0x693ec

UnknownScript_0x693ec: ; 0x693ec
	jumptextfaceplayer UnknownText_0x6945e
; 0x693ef

UnknownScript_0x693ef: ; 0x693ef
	faceplayer
	loadfont
	2writetext UnknownText_0x6947c
	cry PIDGEY
	closetext
	loadmovesprites
	end
; 0x693fa

UnknownText_0x693fa: ; 0x693fa
	db $0, "She uses the names", $4f
	db "of her favorite", $55
	db "things to eat.", $51
	db "For the nicknames", $4f
	db "she gives to her", $55
	db "#MON, I mean.", $57
; 0x6945e

UnknownText_0x6945e: ; 0x6945e
	db $0, "I call my PIDGEY", $4f
	db "STRAWBERRY!", $57
; 0x6947c

UnknownText_0x6947c: ; 0x6947c
	db $0, "STRAWBERRY: Pijji!", $57
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
	person_event $29, 7, 6, $9, $0, 255, 255, $0, 0, UnknownScript_0x693e9, $ffff
	person_event $28, 8, 10, $7, $0, 255, 255, $a0, 0, UnknownScript_0x693ec, $ffff
	person_event $4e, 6, 9, $5, $1, 255, 255, $b0, 0, UnknownScript_0x693ef, $ffff
; 0x694c7

