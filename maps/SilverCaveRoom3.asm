	object_const_def
	const SILVERCAVEROOM3_RED
	const SILVERCAVEROOM3_MEWTWO

SilverCaveRoom3_MapScripts:
	def_scene_scripts

	def_callbacks

Red:
	special FadeOutMusic
	faceplayer
	opentext
	writetext RedSeenText
	waitbutton
	closetext
	winlosstext RedWinLossText, RedWinLossText
	loadtrainer RED, RED1
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_RED
	special FadeOutMusic
	opentext
	writetext RedLeavesText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	appear SILVERCAVEROOM3_MEWTWO
	disappear SILVERCAVEROOM3_RED
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	halloffame
	credits
	end

SilverCaveRoom3Mewtwo:
	checkevent EVENT_BEAT_RED
	iffalse .notfoughtred
	faceplayer
	opentext
	writetext MewtwoBattleText
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	loadwildmon MEWTWO, 100
	startbattle
	disappear SILVERCAVEROOM3_MEWTWO
	reloadmapafterbattle
	end
	
.notfoughtred
	opentext
	writetext MewtwoBattleText
	waitbutton
	closetext
	end
	
RedSeenText:
	text "<……>"
	line "<……>"
	done

RedWinLossText:
	text "…"
	done

RedLeavesText:
	text "<……>"
	line "<……>"
	done
	
MewtwoBattleText:
    text "Mew!"
	done

SilverCaveRoom3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 33, SILVER_CAVE_ROOM_2, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 10, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
	object_event  9, 0, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom3Mewtwo, EVENT_SILVER_CAVE_ROOM_3_MEWTWO
