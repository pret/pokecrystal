const_value set 2
	const KRISSHOUSE2F_CONSOLE
	const KRISSHOUSE2F_DOLL_1
	const KRISSHOUSE2F_DOLL_2
	const KRISSHOUSE2F_BIG_DOLL

KrissHouse2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks

	dbw MAPCALLBACK_NEWMAP, .InitializeRoom

	dbw MAPCALLBACK_TILES, .SetSpawn

.Null:
	end

.InitializeRoom:
	special ToggleDecorationsVisibility
	setevent EVENT_IN_YOUR_ROOM
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInizialization
	jumpstd initializeevents
	return

.SkipInizialization:
	return

.SetSpawn:
	special ToggleMaptileDecorations
	return


	db 0, 0, 0 ; filler


Doll1:
	describedecoration 1

Doll2:
	describedecoration 2

BigDoll:
	describedecoration 3

GameConsole:
	describedecoration 4

KrissHousePoster:
	dw EVENT_KRISS_ROOM_POSTER, .Script
.Script:
	describedecoration 0

KrissHouseRadio:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext KrisRadioText1
	pause 45
	writetext KrisRadioText2
	pause 45
	writetext KrisRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext KrisRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd radio1

.AbbreviatedRadio:
	opentext
	writetext KrisRadioText4
	pause 45
	closetext
	end

KrissHouseBookshelf:
	jumpstd picturebookshelf

KrissHousePC:
	opentext
	special Special_KrissHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, $0, $0
	end

KrisRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

KrisRadioText2:
	text "#MON CHANNEL!"
	done

KrisRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

KrisRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

KrissHouse2F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $0, $7, 3, KRISS_HOUSE_1F

.XYTriggers:
	db 0

.Signposts:
	db 4
	signpost 1, 2, SIGNPOST_UP, KrissHousePC
	signpost 1, 3, SIGNPOST_READ, KrissHouseRadio
	signpost 1, 5, SIGNPOST_READ, KrissHouseBookshelf
	signpost 0, 6, SIGNPOST_IFSET, KrissHousePoster

.PersonEvents:
	db 4
	person_event SPRITE_CONSOLE, 2, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameConsole, EVENT_KRISS_HOUSE_2F_CONSOLE
	person_event SPRITE_DOLL_1, 4, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Doll1, EVENT_KRISS_HOUSE_2F_DOLL_1
	person_event SPRITE_DOLL_2, 4, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Doll2, EVENT_KRISS_HOUSE_2F_DOLL_2
	person_event SPRITE_BIG_DOLL, 1, 0, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BigDoll, EVENT_KRISS_HOUSE_2F_BIG_DOLL
