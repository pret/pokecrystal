ElmsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd difficultbookshelf

ElmsWifeText:
	text "Hi, <PLAY_G>! My"
	line "husband's always"

	para "so busy--I hope"
	line "he's OK."

	para "When he's caught"
	line "up in his #MON"

	para "research, he even"
	line "forgets to eat."
	done

ElmsSonText:
	text "When I grow up,"
	line "I'm going to help"
	cont "my dad!"

	para "I'm going to be a"
	line "great #MON"
	cont "professor!"
	done

ElmsHouseLabFoodText:
; unused
	text "There's some food"
	line "here. It must be"
	cont "for the LAB."
	done

ElmsHousePokemonFoodText:
; unused
	text "There's some food"
	line "here. This must be"
	cont "for #MON."
	done

ElmsHousePCText:
	text "#MON. Where do"
	line "they come from? "

	para "Where are they"
	line "going?"

	para "Why has no one"
	line "ever witnessed a"
	cont "#MON's birth?"

	para "I want to know! I"
	line "will dedicate my"

	para "life to the study"
	line "of #MON!"

	para "…"

	para "It's a part of"
	line "PROF.ELM's re-"
	cont "search papers."
	done

ElmsHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 4, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $7, $3, 4, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 1, 0, SIGNPOST_READ, ElmsHousePC
	signpost 1, 6, SIGNPOST_READ, ElmsHouseBookshelf
	signpost 1, 7, SIGNPOST_READ, ElmsHouseBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_TEACHER, 9, 5, OW_UP | $0, $10, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, ElmsWife, -1
	person_event SPRITE_BUG_CATCHER, 8, 9, OW_UP | $3, $0, -1, -1, $0, 0, ElmsSon, -1
