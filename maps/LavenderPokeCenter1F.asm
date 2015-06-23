LavenderPokeCenter1F_MapScriptHeader: ; 0x7e69e
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e6a0

NurseScript_0x7e6a0: ; 0x7e6a0
	jumpstd $0000
; 0x7e6a3

GentlemanScript_0x7e6a3: ; 0x7e6a3
	jumptextfaceplayer UnknownText_0x7e6bd
; 0x7e6a6

TeacherScript_0x7e6a6: ; 0x7e6a6
	jumptextfaceplayer UnknownText_0x7e710
; 0x7e6a9

YoungsterScript_0x7e6a9: ; 0x7e6a9
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x7e6b7
	writetext UnknownText_0x7e779
	closetext
	loadmovesprites
	end
; 0x7e6b7

UnknownScript_0x7e6b7: ; 0x7e6b7
	writetext UnknownText_0x7e7ed
	closetext
	loadmovesprites
	end
; 0x7e6bd

UnknownText_0x7e6bd: ; 0x7e6bd
	text "To the north of"
	line "LAVENDER is ROCK"

	para "TUNNEL. Go through"
	line "it to get to the"
	cont "POWER PLANT."
	done
; 0x7e710

UnknownText_0x7e710: ; 0x7e710
	text "There's a radio"
	line "program that plays"
	cont "# FLUTE music."

	para "Oh? Ah, your radio"
	line "needs an EXPN CARD"
	cont "to tune into it."
	done
; 0x7e779

UnknownText_0x7e779: ; 0x7e779
	text "If the POWER PLANT"
	line "isn't running, the"

	para "MAGNET TRAIN won't"
	line "run either…"

	para "It also means the"
	line "RADIO STATION"
	cont "can't broadcast…"
	done
; 0x7e7ed

UnknownText_0x7e7ed: ; 0x7e7ed
	text "The DIRECTOR of"
	line "the RADIO STATION"
	cont "sure was happy."

	para "He said they're"
	line "back on the air"

	para "because the POWER"
	line "PLANT is running"
	cont "smoothly again."
	done
; 0x7e872

LavenderPokeCenter1F_MapEventHeader: ; 0x7e872
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $4, 1, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x7e6a0, $ffff
	person_event SPRITE_GENTLEMAN, 10, 11, $5, $1, 255, 255, $0, 0, GentlemanScript_0x7e6a3, $ffff
	person_event SPRITE_TEACHER, 7, 9, $6, $0, 255, 255, $a0, 0, TeacherScript_0x7e6a6, $ffff
	person_event SPRITE_YOUNGSTER, 9, 5, $4, $10, 255, 255, $80, 0, YoungsterScript_0x7e6a9, $ffff
; 0x7e8bb
