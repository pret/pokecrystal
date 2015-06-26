KrissHouse2F_MapScriptHeader: ; 0x7abab
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x7abb4

	dbw 1, UnknownScript_0x7abc5
; 0x7abb3

UnknownScript_0x7abb3: ; 0x7abb3
	end
; 0x7abb4

UnknownScript_0x7abb4: ; 0x7abb4
	special Function27043
	setevent $0007
	checkevent $0036
	iftrue UnknownScript_0x7abc4
	jumpstd initializeevents
	return
; 0x7abc4

UnknownScript_0x7abc4: ; 0x7abc4
	return
; 0x7abc5

UnknownScript_0x7abc5: ; 0x7abc5
	special Function26feb
	return
; 0x7abc9


	db 0, 0, 0 ; filler


Doll1:
	describedecoration $1

Doll2:
	describedecoration $2

BigDoll:
	describedecoration $3

GameConsole:
	describedecoration $4

KrissHousePoster:
	dw $02cc ; event
	dw .Script
.Script
	describedecoration $0

KrissHouseRadio:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	loadfont
	writetext KrisRadioText1
	pause 45
	writetext KrisRadioText2
	pause 45
	writetext KrisRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, $10
	writetext KrisRadioText4
	pause 45
	loadmovesprites
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio
	jumpstd radio1
.AbbreviatedRadio
	loadfont
	writetext KrisRadioText4
	pause 45
	loadmovesprites
	end

KrissHouseBookshelf:
	jumpstd picturebookshelf

KrissHousePC:
	loadfont
	special Functionc2e7
	iftrue .Warp
	loadmovesprites
	end
.Warp
	warp 0, 0, $0, $0
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

KrissHouse2F_MapEventHeader: ; 0x7ac99
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $0, $7, 3, GROUP_KRISS_HOUSE_1F, MAP_KRISS_HOUSE_1F

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 1, 2, $1, KrissHousePC
	signpost 1, 3, $0, KrissHouseRadio
	signpost 1, 5, $0, KrissHouseBookshelf
	signpost 0, 6, $5, KrissHousePoster

	; people-events
	db 4
	person_event SPRITE_CONSOLE, 6, 8, $1, $0, 255, 255, $0, 0, GameConsole, $0741
	person_event SPRITE_DOLL_1, 8, 8, $1, $0, 255, 255, $0, 0, Doll1, $0742
	person_event SPRITE_DOLL_2, 8, 9, $1, $0, 255, 255, $0, 0, Doll2, $0743
	person_event SPRITE_BIG_DOLL, 5, 4, $21, $0, 255, 255, $0, 0, BigDoll, $0744
