const_value set 2
	const SILVERCAVEROOM3_RED

SilverCaveRoom3_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RedScript_0x18c603:
	special Special_RotatePalettesRightMusic
	faceplayer
	loadfont
	writetext UnknownText_0x18c637
	waitbutton
	closetext
	winlosstext UnknownText_0x18c63c, UnknownText_0x18c63c
	scriptedtrainerdata RED, 1
	startbattle
	reloadmapmusic
	returnafterbattle
	special Special_RotatePalettesRightMusic
	loadfont
	writetext UnknownText_0x18c63f
	waitbutton
	closetext
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear SILVERCAVEROOM3_RED
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
	warp_def $21, $9, 2, SILVER_CAVE_ROOM_2

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_RED, 10, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RedScript_0x18c603, EVENT_RED_IN_MT_SILVER
