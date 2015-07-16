Route10South_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerHikerJim:
	; bit/flag number
	dw EVENT_BEAT_HIKER_JIM

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

HikerJimScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae43b
	closetext
	loadmovesprites
	end

TrainerPokefanmRobert:
	; bit/flag number
	dw EVENT_BEAT_POKEFANM_ROBERT

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

PokefanmRobertScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae4a9
	closetext
	loadmovesprites
	end

MapRoute10SouthSignpost0Script:
	jumptext UnknownText_0x1ae4dc

HikerJimSeenText:
	text "Hahahah!"
	done

HikerJimBeatenText:
	text "Hahaha-hachoo!"
	done

UnknownText_0x1ae43b:
	text "Hay fever is"
	line "making me sneeze!"
	cont "Ahahah-CHOO!"
	done

PokefanmRobertSeenText:
	text "You like #MON,"
	line "don't you?"

	para "Me too!"
	done

PokefanmRobertBeatenText:
	text "I'd have to say"
	line "that's my loss."
	done

UnknownText_0x1ae4a9:
	text "Look what you did"
	line "to my #MON…"

	para "I won't forget"
	line "this…"
	done

UnknownText_0x1ae4dc:
	text "ROUTE 10"

	para "CERULEAN CITY -"
	line "LAVENDER TOWN"
	done

Route10South_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $1, $6, 2, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 3, 5, SIGNPOST_READ, MapRoute10SouthSignpost0Script

	; people-events
	db 2
	person_event SPRITE_POKEFAN_M, 7, 21, LEFT << 2 | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerHikerJim, -1
	person_event SPRITE_POKEFAN_M, 14, 12, LEFT << 2 | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerPokefanmRobert, -1
