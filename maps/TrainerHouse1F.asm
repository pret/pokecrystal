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
	db $0, "Welcome to TRAINER", $4f
	db "HOUSE, the newest", $51
	db "and most happening", $4f
	db "place in VIRIDIAN.", $51
	db "We're open to", $4f
	db "trainers only.", $51
	db "You can battle", $4f
	db "against the best", $51
	db "of the best right", $4f
	db "downstairs.", $57
; 0x9b025

UnknownText_0x9b025: ; 0x9b025
	db $0, "VIRIDIAN is the", $4f
	db "town closest to", $55
	db "INDIGO PLATEAU.", $51
	db "They built this", $4f
	db "place because so", $51
	db "many trainers pass", $4f
	db "through on their", $51
	db "way up to INDIGO", $4f
	db "PLATEAU.", $57
; 0x9b0b5

UnknownText_0x9b0b5: ; 0x9b0b5
	db $0, "They hold practice", $4f
	db "battles downstairs", $55
	db "here.", $51
	db "I would love to", $4f
	db "see how well a", $51
	db "trainer from JOHTO", $4f
	db "battles.", $57
; 0x9b11d

UnknownText_0x9b11d: ; 0x9b11d
	db $0, "I guess you can't", $4f
	db "become the CHAMP", $51
	db "unless you go all", $4f
	db "over the place and", $51
	db "battle all kinds", $4f
	db "of people.", $51
	db "The CHAMPION from", $4f
	db "PALLET traveled to", $51
	db "all the cities and", $4f
	db "towns in KANTO.", $57
; 0x9b1c9

UnknownText_0x9b1c9: ; 0x9b1c9
	db $0, "Whew… I'm taking a", $4f
	db "rest from #MON", $55
	db "battles.", $57
; 0x9b1f4

UnknownText_0x9b1f4: ; 0x9b1f4
	db $0, "Practice battles", $4f
	db "are held in the", $51
	db "TRAINING HALL", $4f
	db "downstairs.", $51
	db "Skilled trainers", $4f
	db "are invited to", $55
	db "participate.", $57
; 0x9b25d

UnknownText_0x9b25d: ; 0x9b25d
	db $0, "There are no rules", $4f
	db "or regulations for", $51
	db "practice matches.", $4f
	db "Just like in field", $51
	db "battles, anything", $4f
	db "goes!", $57
; 0x9b2c1

UnknownText_0x9b2c1: ; 0x9b2c1
	db $0, "…What's this?", $4f
	db "A strategy memo?", $51
	db "This writing looks", $4f
	db "like ONIX tracks…", $51
	db "It's completely", $4f
	db "illegible…", $57
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

