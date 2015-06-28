SilverCaveRoom3_MapScriptHeader: ; 0x18c601
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c603

RedScript_0x18c603: ; 0x18c603
	special Functionc48f
	faceplayer
	loadfont
	writetext UnknownText_0x18c637
	closetext
	loadmovesprites
	winlosstext UnknownText_0x18c63c, UnknownText_0x18c63c
	loadtrainer RED, 1
	startbattle
	reloadmapmusic
	returnafterbattle
	special Functionc48f
	loadfont
	writetext UnknownText_0x18c63f
	closetext
	loadmovesprites
	special Function8c0b6
	special Functiond91
	disappear $2
	pause 15
	special Function8c0ab
	pause 30
	special HealParty
	refreshscreen $0
	credits
	end
; 0x18c637

UnknownText_0x18c637: ; 0x18c637
	text $56
	line $56
	done
; 0x18c63c

UnknownText_0x18c63c: ; 0x18c63c
	text "…"
	done
; 0x18c63f

UnknownText_0x18c63f: ; 0x18c63f
	text $56
	line $56
	done
; 0x18c644

SilverCaveRoom3_MapEventHeader: ; 0x18c644
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $21, $9, 2, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_RED, 14, 13, $7, $0, 255, 255, $80, 0, RedScript_0x18c603, EVENT_RED_IN_MT_SILVER
; 0x18c65c
