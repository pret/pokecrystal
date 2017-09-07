const_value set 2
	const KRISSNEIGHBORSHOUSE_COOLTRAINER_F
	const KRISSNEIGHBORSHOUSE_POKEFAN_F

KrissNeighborsHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

KrissNeighborsDaughter:
	jumptextfaceplayer KrissNeighborsDaughterText

KrissNeighbor:
	jumptextfaceplayer KrissNeighborText

KrissNeighborsHouseBookshelf:
	jumpstd magazinebookshelf

KrissNeighborsHouseRadio:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext KrisNeighborRadioText1
	pause 45
	writetext KrisNeighborRadioText2
	pause 45
	writetext KrisNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, $10
	writetext KrisNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd radio1
.AbbreviatedRadio:
	opentext
	writetext KrisNeighborRadioText4
	pause 45
	closetext
	end

KrissNeighborsDaughterText:
	text "PIKACHU is an"
	line "evolved #MON."

	para "I was amazed by"
	line "PROF.ELM's find-"
	cont "ings."

	para "He's so famous for"
	line "his research on"
	cont "#MON evolution."

	para "…sigh…"

	para "I wish I could be"
	line "a researcher like"
	cont "him…"
	done

KrissNeighborText:
	text "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"

	para "But then, so do I!"
	done

KrisNeighborRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

KrisNeighborRadioText2:
	text "#MON CHANNEL!"
	done

KrisNeighborRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

KrisNeighborRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

KrissNeighborsHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, NEW_BARK_TOWN
	warp_def $7, $3, 3, NEW_BARK_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 1, 0, SIGNPOST_READ, KrissNeighborsHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, KrissNeighborsHouseBookshelf
	signpost 1, 7, SIGNPOST_READ, KrissNeighborsHouseRadio

.PersonEvents:
	db 2
	person_event SPRITE_COOLTRAINER_F, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KrissNeighborsDaughter, -1
	person_event SPRITE_POKEFAN_F, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KrissNeighbor, EVENT_KRISS_NEIGHBORS_HOUSE_NEIGHBOR
