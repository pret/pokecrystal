Route10South_MapScriptHeader: ; 0x1ae3f4
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ae3f6

TrainerHikerJim: ; 0x1ae3f6
	; bit/flag number
	dw $534

	; trainer group && trainer id
	db HIKER, JIM

	; text when seen
	dw HikerJimSeenText

	; text when trainer beaten
	dw HikerJimBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerJimScript
; 0x1ae402

HikerJimScript: ; 0x1ae402
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ae43b
	closetext
	loadmovesprites
	end
; 0x1ae40a

TrainerPokefanmRobert: ; 0x1ae40a
	; bit/flag number
	dw $4cf

	; trainer group && trainer id
	db POKEFANM, ROBERT

	; text when seen
	dw PokefanmRobertSeenText

	; text when trainer beaten
	dw PokefanmRobertBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmRobertScript
; 0x1ae416

PokefanmRobertScript: ; 0x1ae416
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ae4a9
	closetext
	loadmovesprites
	end
; 0x1ae41e

MapRoute10SouthSignpost0Script: ; 0x1ae41e
	jumptext UnknownText_0x1ae4dc
; 0x1ae421

HikerJimSeenText: ; 0x1ae421
	db $0, "Hahahah!", $57
; 0x1ae42b

HikerJimBeatenText: ; 0x1ae42b
	db $0, "Hahaha-hachoo!", $57
; 0x1ae43b

UnknownText_0x1ae43b: ; 0x1ae43b
	db $0, "Hay fever is", $4f
	db "making me sneeze!", $55
	db "Ahahah-CHOO!", $57
; 0x1ae468

PokefanmRobertSeenText: ; 0x1ae468
	db $0, "You like #MON,", $4f
	db "don't you?", $51
	db "Me too!", $57
; 0x1ae48a

PokefanmRobertBeatenText: ; 0x1ae48a
	db $0, "I'd have to say", $4f
	db "that's my loss.", $57
; 0x1ae4a9

UnknownText_0x1ae4a9: ; 0x1ae4a9
	db $0, "Look what you did", $4f
	db "to my #MON…", $51
	db "I won't forget", $4f
	db "this…", $57
; 0x1ae4dc

UnknownText_0x1ae4dc: ; 0x1ae4dc
	db $0, "ROUTE 10", $51
	db "CERULEAN CITY -", $4f
	db "LAVENDER TOWN", $57
; 0x1ae504

Route10South_MapEventHeader: ; 0x1ae504
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $1, $6, 2, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 3, 5, $0, MapRoute10SouthSignpost0Script

	; people-events
	db 2
	person_event SPRITE_POKEFAN_M, 7, 21, $8, $0, 255, 255, $b2, 3, TrainerHikerJim, $ffff
	person_event SPRITE_POKEFAN_M, 14, 12, $a, $0, 255, 255, $82, 3, TrainerPokefanmRobert, $ffff
; 0x1ae52e

