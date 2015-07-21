CherrygrovePokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x19696d:
	jumpstd pokecenternurse

FisherScript_0x196970:
	jumptextfaceplayer UnknownText_0x19698a

GentlemanScript_0x196973:
	jumptextfaceplayer UnknownText_0x1969c8

TeacherScript_0x196976:
	faceplayer
	loadfont
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x196984
	writetext UnknownText_0x1969f1
	closetext
	loadmovesprites
	end

UnknownScript_0x196984:
	writetext UnknownText_0x196a46
	closetext
	loadmovesprites
	end

UnknownText_0x19698a:
	text "It's great. I can"
	line "store any number"

	para "of #MON, and"
	line "it's all free."
	done

UnknownText_0x1969c8:
	text "That PC is free"
	line "for any trainer"
	cont "to use."
	done

UnknownText_0x1969f1:
	text "The COMMUNICATION"
	line "CENTER upstairs"
	cont "was just built."

	para "But they're still"
	line "finishing it up."
	done

UnknownText_0x196a46:
	text "The COMMUNICATION"
	line "CENTER upstairs"
	cont "was just built."

	para "I traded #MON"
	line "there already!"
	done

CherrygrovePokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 2, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warp_def $7, $4, 2, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 5, 7, OW_UP | $2, $0, -1, -1, $0, 0, NurseScript_0x19696d, -1
	person_event SPRITE_FISHER, 7, 6, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, FisherScript_0x196970, -1
	person_event SPRITE_GENTLEMAN, 10, 12, OW_UP | $3, $0, -1, -1, $0, 0, GentlemanScript_0x196973, -1
	person_event SPRITE_TEACHER, 10, 5, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, TeacherScript_0x196976, -1
