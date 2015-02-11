CeruleanPokeCenter1F_MapScriptHeader: ; 0x18820d
	; trigger count
	db 0

	; callback count
	db 0
; 0x18820f

NurseScript_0x18820f: ; 0x18820f
	jumpstd $0000
; 0x188212

SuperNerdScript_0x188212: ; 0x188212
	special Function10630f
	iftrue UnknownScript_0x18821b
	jumptextfaceplayer UnknownText_0x188221
; 0x18821b

UnknownScript_0x18821b: ; 0x18821b
	jumptextfaceplayer UnknownText_0x18828c
; 0x18821e

GymGuyScript_0x18821e: ; 0x18821e
	jumptextfaceplayer UnknownText_0x1882ff
; 0x188221

UnknownText_0x188221: ; 0x188221
	text "For battles, I'd"
	line "much rather use"

	para "#MON I've been"
	line "raising, even if"

	para "they're weaker"
	line "than some newly"
	cont "caught #MON."
	done
; 0x18828c

UnknownText_0x18828c: ; 0x18828c
	text "Do you battle by"
	line "mobile phone?"

	para "If time runs out"
	line "during a battle,"

	para "waiting to see who"
	line "won is really"
	cont "nerve wracking."
	done
; 0x1882ff

UnknownText_0x1882ff: ; 0x1882ff
	text "The MAGNET TRAIN"
	line "travels at over"

	para "340 mph. It goes"
	line "between KANTO and"

	para "JOHTO in almost no"
	line "time at all."

	para "It really makes"
	line "JOHTO accessible."
	done
; 0x188386

CeruleanPokeCenter1F_MapEventHeader: ; 0x188386
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 4, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $4, 4, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x18820f, $ffff
	person_event SPRITE_SUPER_NERD, 8, 12, $5, $1, 255, 255, $0, 0, SuperNerdScript_0x188212, $ffff
	person_event SPRITE_GYM_GUY, 9, 5, $2, $11, 255, 255, $a0, 0, GymGuyScript_0x18821e, $ffff
; 0x1883c2

