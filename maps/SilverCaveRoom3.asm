SilverCaveRoom3_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RedScript_0x18c603:
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
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear $2
	pause 15
	special Special_FadeInQuickly
	pause 30
	special HealParty
	refreshscreen $0
	credits
	end

UnknownText_0x18c637:
	text $56
	line $56
	done

UnknownText_0x18c63c:
	text "…"
	done

UnknownText_0x18c63f:
	text $56
	line $56
	done

SilverCaveRoom3_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $21, $9, 2, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_RED, 14, 13, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, RedScript_0x18c603, EVENT_RED_IN_MT_SILVER
