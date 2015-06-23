TrainerHouse1F_MapScriptHeader: ; 0x9af65
	; trigger count
	db 0

	; callback count
	db 0
; 0x9af67

ReceptionistScript_0x9af67: ; 0x9af67
	jumptextfaceplayer UnknownText_0x9af7f
; 0x9af6a

CooltrainerMScript_0x9af6a: ; 0x9af6a
	jumptextfaceplayer UnknownText_0x9b025
; 0x9af6d

CooltrainerFScript_0x9af6d: ; 0x9af6d
	jumptextfaceplayer UnknownText_0x9b0b5
; 0x9af70

YoungsterScript_0x9af70: ; 0x9af70
	jumptextfaceplayer UnknownText_0x9b11d
; 0x9af73

GentlemanScript_0x9af73: ; 0x9af73
	jumptextfaceplayer UnknownText_0x9b1c9
; 0x9af76

MapTrainerHouse1FSignpost0Script: ; 0x9af76
	jumptext UnknownText_0x9b1f4
; 0x9af79

MapTrainerHouse1FSignpost1Script: ; 0x9af79
	jumptext UnknownText_0x9b25d
; 0x9af7c

MapTrainerHouse1FSignpost2Script: ; 0x9af7c
	jumptext UnknownText_0x9b2c1
; 0x9af7f

UnknownText_0x9af7f: ; 0x9af7f
	text "Welcome to TRAINER"
	line "HOUSE, the newest"

	para "and most happening"
	line "place in VIRIDIAN."

	para "We're open to"
	line "trainers only."

	para "You can battle"
	line "against the best"

	para "of the best right"
	line "downstairs."
	done
; 0x9b025

UnknownText_0x9b025: ; 0x9b025
	text "VIRIDIAN is the"
	line "town closest to"
	cont "INDIGO PLATEAU."

	para "They built this"
	line "place because so"

	para "many trainers pass"
	line "through on their"

	para "way up to INDIGO"
	line "PLATEAU."
	done
; 0x9b0b5

UnknownText_0x9b0b5: ; 0x9b0b5
	text "They hold practice"
	line "battles downstairs"
	cont "here."

	para "I would love to"
	line "see how well a"

	para "trainer from JOHTO"
	line "battles."
	done
; 0x9b11d

UnknownText_0x9b11d: ; 0x9b11d
	text "I guess you can't"
	line "become the CHAMP"

	para "unless you go all"
	line "over the place and"

	para "battle all kinds"
	line "of people."

	para "The CHAMPION from"
	line "PALLET traveled to"

	para "all the cities and"
	line "towns in KANTO."
	done
; 0x9b1c9

UnknownText_0x9b1c9: ; 0x9b1c9
	text "Whew… I'm taking a"
	line "rest from #MON"
	cont "battles."
	done
; 0x9b1f4

UnknownText_0x9b1f4: ; 0x9b1f4
	text "Practice battles"
	line "are held in the"

	para "TRAINING HALL"
	line "downstairs."

	para "Skilled trainers"
	line "are invited to"
	cont "participate."
	done
; 0x9b25d

UnknownText_0x9b25d: ; 0x9b25d
	text "There are no rules"
	line "or regulations for"

	para "practice matches."
	line "Just like in field"

	para "battles, anything"
	line "goes!"
	done
; 0x9b2c1

UnknownText_0x9b2c1: ; 0x9b2c1
	text "…What's this?"
	line "A strategy memo?"

	para "This writing looks"
	line "like ONIX tracks…"

	para "It's completely"
	line "illegible…"
	done
; 0x9b31f

TrainerHouse1F_MapEventHeader: ; 0x9b31f
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $d, $2, 3, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $d, $3, 3, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $2, $8, 1, GROUP_TRAINER_HOUSE_B1F, MAP_TRAINER_HOUSE_B1F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 0, 5, $0, MapTrainerHouse1FSignpost0Script
	signpost 0, 7, $0, MapTrainerHouse1FSignpost1Script
	signpost 10, 7, $0, MapTrainerHouse1FSignpost2Script

	; people-events
	db 5
	person_event SPRITE_RECEPTIONIST, 15, 4, $9, $0, 255, 255, $a0, 0, ReceptionistScript_0x9af67, $ffff
	person_event SPRITE_COOLTRAINER_M, 15, 11, $7, $0, 255, 255, $0, 0, CooltrainerMScript_0x9af6a, $ffff
	person_event SPRITE_COOLTRAINER_F, 6, 10, $6, $2, 255, 255, $80, 0, CooltrainerFScript_0x9af6d, $ffff
	person_event SPRITE_YOUNGSTER, 12, 8, $5, $2, 255, 255, $80, 0, YoungsterScript_0x9af70, $ffff
	person_event SPRITE_GENTLEMAN, 8, 6, $9, $0, 255, 255, $0, 0, GentlemanScript_0x9af73, $ffff
; 0x9b384
