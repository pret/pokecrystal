SilverCaveRoom3_MapScriptHeader: ; 0x18c601
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c603

UnknownScript_0x18c603: ; 0x18c603
	special $006a
	faceplayer
	loadfont
	2writetext UnknownText_0x18c637
	closetext
	loadmovesprites
	winlosstext UnknownText_0x18c63c, UnknownText_0x18c63c
	loadtrainer RED, 1
	startbattle
	reloadmapmusic
	returnafterbattle
	special $006a
	loadfont
	2writetext UnknownText_0x18c63f
	closetext
	loadmovesprites
	special $0030
	special $0033
	disappear $2
	pause 15
	special $0032
	pause 30
	special $001b
	refreshscreen $0
	credits
	end
; 0x18c637

UnknownText_0x18c637: ; 0x18c637
	db $0, $56, $4f
	db $56, $57
; 0x18c63c

UnknownText_0x18c63c: ; 0x18c63c
	db $0, "…", $57
; 0x18c63f

UnknownText_0x18c63f: ; 0x18c63f
	db $0, $56, $4f
	db $56, $57
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
	person_event $6, 14, 13, $7, $0, 255, 255, $80, 0, UnknownScript_0x18c603, $0762
; 0x18c65c

