const_value set 2
	const ROUTE6_POKEFAN_M1
	const ROUTE6_POKEFAN_M2
	const ROUTE6_POKEFAN_M3

Route6_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokefanmRex:
	trainer EVENT_BEAT_POKEFANM_REX, POKEFANM, REX, PokefanmRexSeenText, PokefanmRexBeatenText, 0, PokefanmRexScript

PokefanmRexScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ad9ff
	waitbutton
	closetext
	end

TrainerPokefanmAllan:
	trainer EVENT_BEAT_POKEFANM_ALLAN, POKEFANM, ALLAN, PokefanmAllanSeenText, PokefanmAllanBeatenText, 0, PokefanmAllanScript

PokefanmAllanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ada88
	waitbutton
	closetext
	end

PokefanMScript_0x1ad951:
	jumptextfaceplayer UnknownText_0x1ad957

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

UnknownText_0x1ad957:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

Route6UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

PokefanmRexSeenText:
	text "My PHANPY is the"
	line "cutest in the"
	cont "world."
	done

PokefanmRexBeatenText:
	text "My PHANPY!"
	done

UnknownText_0x1ad9ff:
	text "Look how adorable"
	line "my PHANPY acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done

PokefanmAllanSeenText:
	text "My TEDDIURSA is"
	line "the cutest in the"
	cont "world."
	done

PokefanmAllanBeatenText:
	text "My TEDDIURSA!"
	done

UnknownText_0x1ada88:
	text "Look how adorable"
	line "my TEDDIURSA acts!"

	para "Isn't it cute"
	line "enough to make"
	cont "your heart melt?"
	done

Route6_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $11, 1, ROUTE_6_UNDERGROUND_ENTRANCE
	warp_def $1, $6, 3, ROUTE_6_SAFFRON_GATE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 5, 19, SIGNPOST_READ, Route6UndergroundPathSign

.PersonEvents:
	db 3
	person_event SPRITE_POKEFAN_M, 4, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 2, PokefanMScript_0x1ad951, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	person_event SPRITE_POKEFAN_M, 12, 9, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 0, TrainerPokefanmRex, -1
	person_event SPRITE_POKEFAN_M, 12, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 0, TrainerPokefanmAllan, -1
