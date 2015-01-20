ViridianPokeCenter1F_MapScriptHeader: ; 0x9b68e
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b690

NurseScript_0x9b690: ; 0x9b690
	jumpstd $0000
; 0x9b693

CooltrainerMScript_0x9b693: ; 0x9b693
	faceplayer
	loadfont
	checkevent $0775
	iftrue UnknownScript_0x9b6a1
	writetext UnknownText_0x9b6ad
	closetext
	loadmovesprites
	end
; 0x9b6a1

UnknownScript_0x9b6a1: ; 0x9b6a1
	writetext UnknownText_0x9b6f5
	closetext
	loadmovesprites
	end
; 0x9b6a7

CooltrainerFScript_0x9b6a7: ; 0x9b6a7
	jumptextfaceplayer UnknownText_0x9b76b
; 0x9b6aa

BugCatcherScript_0x9b6aa: ; 0x9b6aa
	jumptextfaceplayer UnknownText_0x9b7c8
; 0x9b6ad

UnknownText_0x9b6ad: ; 0x9b6ad
	text "Where in the world"
	line "is VIRIDIAN's GYM"

	para "LEADER? I wanted"
	line "to challenge him."
	done
; 0x9b6f5

UnknownText_0x9b6f5: ; 0x9b6f5
	text "There are no GYM"
	line "TRAINERS at the"
	cont "VIRIDIAN GYM."

	para "The LEADER claims"
	line "his policy is to"

	para "win without having"
	line "any underlings."
	done
; 0x9b76b

UnknownText_0x9b76b: ; 0x9b76b
	text "I heard that the"
	line "GYM in CINNABAR is"
	cont "gone."

	para "I wonder what be-"
	line "came of BLAINE,"
	cont "the GYM LEADER."
	done
; 0x9b7c8

UnknownText_0x9b7c8: ; 0x9b7c8
	text "My dream is to be-"
	line "come a GYM LEADER."
	done
; 0x9b7ef

ViridianPokeCenter1F_MapEventHeader: ; 0x9b7ef
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 5, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $7, $4, 5, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x9b690, $ffff
	person_event SPRITE_COOLTRAINER_M, 8, 12, $5, $1, 255, 255, $80, 0, CooltrainerMScript_0x9b693, $ffff
	person_event SPRITE_COOLTRAINER_F, 7, 9, $7, $0, 255, 255, $90, 0, CooltrainerFScript_0x9b6a7, $ffff
	person_event SPRITE_BUG_CATCHER, 10, 5, $9, $0, 255, 255, $a0, 0, BugCatcherScript_0x9b6aa, $ffff
; 0x9b838

