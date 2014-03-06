MahoganyRedGyaradosSpeechHouse_MapScriptHeader: ; 0x19997d
	; trigger count
	db 0

	; callback count
	db 0
; 0x19997f

BlackBeltScript_0x19997f: ; 0x19997f
	jumptextfaceplayer UnknownText_0x19999c
; 0x199982

TeacherScript_0x199982: ; 0x199982
	faceplayer
	loadfont
	checkflag $0013
	iftrue UnknownScript_0x199990
	2writetext UnknownText_0x199a0e
	closetext
	loadmovesprites
	end
; 0x199990

UnknownScript_0x199990: ; 0x199990
	2writetext UnknownText_0x199a3d
	closetext
	loadmovesprites
	end
; 0x199996

; TODO wtf?
UnknownText_0x199996: ; 0x199996
	limited_interpret_data 2
	db $0, "ズ", $03, $00

UnknownText_0x19999c: ; 0x19999c
	text "I heard that a red"
	line "GYARADOS appeared"
	cont "at the LAKE."

	para "That's odd, since"
	line "even ordinary"

	para "GYARADOS are rare"
	line "in that lake…"
	done
; 0x199a0e

UnknownText_0x199a0e: ; 0x199a0e
	text "My favorite radio"
	line "program? I'd say"
	cont "#MON MUSIC."
	done
; 0x199a3d

UnknownText_0x199a3d: ; 0x199a3d
	text "I've been hearing"
	line "laughter on the"

	para "radio…"
	line "It's creepy."
	done
; 0x199a72

MahoganyRedGyaradosSpeechHouse_MapEventHeader: ; 0x199a72
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $7, $3, 2, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_BLACK_BELT, 7, 6, $9, $0, 255, 255, $0, 0, BlackBeltScript_0x19997f, $ffff
	person_event SPRITE_TEACHER, 9, 10, $4, $10, 255, 255, $90, 0, TeacherScript_0x199982, $ffff
; 0x199a9c

