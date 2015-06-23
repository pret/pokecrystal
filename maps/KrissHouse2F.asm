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
	jumpstd $0018
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


Doll1Script_0x7abcc: ; 0x7abcc
	describedecoration $1
; 0x7abce

Doll2Script_0x7abce: ; 0x7abce
	describedecoration $2
; 0x7abd0

BigDollScript_0x7abd0: ; 0x7abd0
	describedecoration $3
; 0x7abd2

ConsoleScript_0x7abd2: ; 0x7abd2
	describedecoration $4
; 0x7abd4

MapKrissHouse2FSignpost4: ; 0x7abd4
	dw $02cc ; event
	dw MapKrissHouse2FSignpost4Script
; 0x7abd8

MapKrissHouse2FSignpost4Script: ; 0x7abd8
	describedecoration $0
; 0x7abda

MapKrissHouse2FSignpost2Script: ; 0x7abda
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue UnknownScript_0x7ac07
	checkevent EVENT_LISTENED_TO_RADIO_IN_NEIGHBORS_HOUSE
	iftrue UnknownScript_0x7ac0a
	playmusic MUSIC_POKEMON_TALK
	loadfont
	writetext UnknownText_0x7ac24
	pause 45
	writetext UnknownText_0x7ac55
	pause 45
	writetext UnknownText_0x7ac64
	pause 45
	musicfadeout $003c, $10
	writetext UnknownText_0x7ac84
	pause 45
	loadmovesprites
	setevent EVENT_LISTENED_TO_RADIO_IN_NEIGHBORS_HOUSE
	end
; 0x7ac07

UnknownScript_0x7ac07: ; 0x7ac07
	jumpstd radio
; 0x7ac0a

UnknownScript_0x7ac0a: ; 0x7ac0a
	loadfont
	writetext UnknownText_0x7ac84
	pause 45
	loadmovesprites
	end
; 0x7ac12


MapKrissHouse2FSignpost3Script: ; 0x7ac12
	jumpstd picturebookshelf
; 0x7ac15

MapKrissHouse2FSignpost0Script: ; 0x7ac15
	loadfont
	special Functionc2e7
	iftrue UnknownScript_0x7ac1e
	loadmovesprites
	end
; 0x7ac1e

UnknownScript_0x7ac1e: ; 0x7ac1e
	warp 0, 0, $0, $0
	end
; 0x7ac24

UnknownText_0x7ac24: ; 0x7ac24
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done
; 0x7ac55

UnknownText_0x7ac55: ; 0x7ac55
	text "#MON CHANNEL!"
	done
; 0x7ac64

UnknownText_0x7ac64: ; 0x7ac64
	text "This is DJ MARY,"
	line "your co-host!"
	done
; 0x7ac84

UnknownText_0x7ac84: ; 0x7ac84
	text "#MON!"
	line "#MON CHANNEL…"
	done
; 0x7ac99

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
	signpost 1, 2, $1, MapKrissHouse2FSignpost0Script
	signpost 1, 3, $0, MapKrissHouse2FSignpost2Script
	signpost 1, 5, $0, MapKrissHouse2FSignpost3Script
	signpost 0, 6, $5, MapKrissHouse2FSignpost4 ; 6bd4

	; people-events
	db 4
	person_event SPRITE_CONSOLE, 6, 8, $1, $0, 255, 255, $0, 0, ConsoleScript_0x7abd2, $0741
	person_event SPRITE_DOLL_1, 8, 8, $1, $0, 255, 255, $0, 0, Doll1Script_0x7abcc, $0742
	person_event SPRITE_DOLL_2, 8, 9, $1, $0, 255, 255, $0, 0, Doll2Script_0x7abce, $0743
	person_event SPRITE_BIG_DOLL, 5, 4, $21, $0, 255, 255, $0, 0, BigDollScript_0x7abd0, $0744
; 0x7acec
