const_value set 2
	const KRISSHOUSE2F_CONSOLE
	const KRISSHOUSE2F_DOLL_1
	const KRISSHOUSE2F_DOLL_2
	const KRISSHOUSE2F_BIG_DOLL

KrissHouse2F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 2
	callback MAPCALLBACK_NEWMAP, .InitializeRoom
	callback MAPCALLBACK_TILES, .SetSpawn

; unused
.Null:
	end

.InitializeRoom:
	special Special_ToggleDecorationsVisibility
	setevent EVENT_IN_YOUR_ROOM
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd initializeevents
	return

.SkipInitialization:
	return

.SetSpawn:
	special Special_ToggleMaptileDecorations
	return

	db 0, 0, 0 ; filler

DecoDoll1Script:
	describedecoration DECODESC_LEFT_DOLL

DecoDoll2Script:
	describedecoration DECODESC_RIGHT_DOLL

DecoBigDollScript:
	describedecoration DECODESC_BIG_DOLL

DecoGameConsoleScript:
	describedecoration DECODESC_CONSOLE

DecoPosterScript:
	conditional_event EVENT_KRISS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

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
	warp NONE, 0, 0
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

KrissHouse2F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def 7, 0, 3, KRISS_HOUSE_1F

.CoordEvents:
	db 0

.BGEvents:
	db 4
	bg_event 2, 1, BGEVENT_UP, KrissHousePC
	bg_event 3, 1, BGEVENT_READ, KrissHouseRadio
	bg_event 5, 1, BGEVENT_READ, KrissHouseBookshelf
	bg_event 6, 0, BGEVENT_IFSET, DecoPosterScript

.ObjectEvents:
	db 4
	object_event 4, 2, SPRITE_CONSOLE, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DecoGameConsoleScript, EVENT_KRISS_HOUSE_2F_CONSOLE
	object_event 4, 4, SPRITE_DOLL_1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DecoDoll1Script, EVENT_KRISS_HOUSE_2F_DOLL_1
	object_event 5, 4, SPRITE_DOLL_2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DecoDoll2Script, EVENT_KRISS_HOUSE_2F_DOLL_2
	object_event 0, 1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DecoBigDollScript, EVENT_KRISS_HOUSE_2F_BIG_DOLL
