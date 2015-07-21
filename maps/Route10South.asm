Route10South_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerHikerJim:
	trainer EVENT_BEAT_HIKER_JIM, HIKER, JIM, HikerJimSeenText, HikerJimBeatenText, $0000, HikerJimScript

HikerJimScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae43b
	closetext
	loadmovesprites
	end

TrainerPokefanmRobert:
	trainer EVENT_BEAT_POKEFANM_ROBERT, POKEFANM, ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, $0000, PokefanmRobertScript

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

.Warps:
	db 1
	warp_def $1, $6, 2, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 3, 5, SIGNPOST_READ, MapRoute10SouthSignpost0Script

.PersonEvents:
	db 2
	person_event SPRITE_POKEFAN_M, 7, 21, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerHikerJim, -1
	person_event SPRITE_POKEFAN_M, 14, 12, OW_LEFT | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerPokefanmRobert, -1
