const_value set 2
	const SILVERCAVEROOM3_RED

SilverCaveRoom3_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Red:
	special Special_FadeOutMusic
	faceplayer
	opentext
	writetext .Text1
	waitbutton
	closetext
	winlosstext .Text2, .Text2
	loadtrainer RED, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special Special_FadeOutMusic
	opentext
	writetext .Text3
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

.Text1:
	text $56
	line $56
	done

.Text2:
	text "…"
	done

.Text3:
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
	person_event SPRITE_RED, 10, 9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
