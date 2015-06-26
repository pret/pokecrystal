KrissNeighborsHouse_MapScriptHeader: ; 0x7acec
	; trigger count
	db 0

	; callback count
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
	loadfont
	writetext KrisNeighborRadioText1
	pause 45
	writetext KrisNeighborRadioText2
	pause 45
	writetext KrisNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, $10
	writetext KrisNeighborRadioText4
	pause 45
	loadmovesprites
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio
	jumpstd radio1
.AbbreviatedRadio
	loadfont
	writetext KrisNeighborRadioText4
	pause 45
	loadmovesprites
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

KrissNeighborsHouse_MapEventHeader: ; 0x7aeb0
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $7, $3, 3, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, KrissNeighborsHouseBookshelf
	signpost 1, 1, $0, KrissNeighborsHouseBookshelf
	signpost 1, 7, $0, KrissNeighborsHouseRadio

	; people-events
	db 2
	person_event SPRITE_COOLTRAINER_F, 7, 6, $9, $0, 255, 255, $80, 0, KrissNeighborsDaughter, $ffff
	person_event SPRITE_POKEFAN_F, 7, 9, $8, $0, 255, 255, $80, 0, KrissNeighbor, $0793
; 0x7aee9
