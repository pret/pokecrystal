	object_const_def
    const MTSILVER_RIVAL

SilverCaveOutside_MapScripts:
	def_scene_scripts
	scene_script MountSilverNoop1Scene, SCENE_MTSILVER_RIVAL_BATTLE
	scene_script MountSilverNoop2Scene, SCENE_MTSILVER_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, SilverCaveOutsideFlypointCallback

MountSilverNoop1Scene:
	end

MountSilverNoop2Scene:
	end

SilverCaveOutsideFlypointCallback:
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	endcallback

MtSilverPokecenterSign:
	jumpstd PokecenterSignScript

MtSilverSign:
	jumptext MtSilverSignText

SilverCaveOutsideHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_SILVER_CAVE_OUTSIDE_HIDDEN_FULL_RESTORE

MtSilverSignText:
	text "MT.SILVER"
	done

MtSilverRival:
    opentext
	writetext MtSilverRivalHoldIt
	waitbutton
	closetext
	special FadeOutMusic
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	moveobject MTSILVER_RIVAL, 18, 17
	appear MTSILVER_RIVAL
	pause 15
	applymovement MTSILVER_RIVAL, MtSilverRivalBattleApproachMovement
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext MtSilverRivalBeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .GotTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GotChikorita
	winlosstext MountSilverRivalTextWin, MountSilverRivalTextLoss
	setlasttalked MTSILVER_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotTotodile:
	winlosstext MountSilverRivalTextWin, MountSilverRivalTextLoss
	setlasttalked MTSILVER_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotChikorita:
	winlosstext MountSilverRivalTextWin, MountSilverRivalTextLoss
	setlasttalked MTSILVER_RIVAL
	loadtrainer RIVAL2, RIVAL2_1_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext MtSilverRivalTextAfter
	waitbutton
	closetext
	applymovement MTSILVER_RIVAL, MtSilverRivalBattleExitMovement
	disappear MTSILVER_RIVAL
	setscene SCENE_MTSILVER_NOOP
	setevent EVENT_BEAT_RIVAL_IN_MT_SILVER
	playmapmusic
	end

MtSilverRivalBattleApproachMovement:
	step UP
	step UP
	step UP
	step UP 
	step_end

MtSilverRivalBattleExitMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end
	
MtSilverRivalHoldIt:
    text "Hold it."
	done 

MtSilverRivalBeforeText:
	text "It's been a while,"
	line "<PLAYER>."
	
	para "Since you beat me"
	line "in VICTORY ROAD,"
	cont "I've been thinking"
	cont "about what me and"
	cont "my #MON were"
	cont "lacking."
	
	para "And now I have the"
	line "answers."
	
	para "The words of that"
	line "DRAGON MASTER were"
	cont "true."
	
	para "It's the trust"
	line "between the"
	cont "trainer and their"
	cont "#MON that's"
	cont "important."
	
	para "And we've grown"
	line "stronger because"
	cont "of it."
	
	para "I'll prove just"
	line "how strong we've"
	cont "become by"
	cont "defeating you!"
	
	para "Right here…"
	line "right now!"
	done 

MountSilverRivalTextWin:
	text "I raised my"
	line "#MON to be as"
	cont "as strong as"
	cont "they could be…"
	
	para "We've fought"
	line "hard to get this"
	cont "far, but…"
	
	para "It wasn't enough…"
	done

MtSilverRivalTextAfter:
	text "You won, fair"
	line "and square."

	para "I admit it. But"
	line "this isn't the"
	cont "end."

	para "I know the path"
	line "and the methods"
	cont "I've chosen are"
	cont "right."
	
	para "You won today,"
	line "but we will"
	cont "continue to get"
	cont "stronger."
	
	para "And once we do…"
	
	para "I'll defeat you"
	line "with all my"
	cont "strength and"
	cont "become the"
	cont "world's greatest"
	cont "trainer."
	
	para "See you around,"
	line "<PLAYER>."
	done 

MountSilverRivalTextLoss:
    text "…It's over."

	para "I've finally"
	line "repaid my debt"
	cont "to you."

	para "With my partners"
	line "I'm going to"
	cont "become the"
	cont "greatest trainer"
	cont "in the world."
	done 
	
	SilverCaveOutside_MapEvents:
	db 0, 0 ; filler

    def_warp_events
	warp_event 23, 19, SILVER_CAVE_POKECENTER_1F, 1
	warp_event 18, 11, SILVER_CAVE_ROOM_1, 1
	
	def_coord_events
	coord_event 18, 12, SCENE_MTSILVER_RIVAL_BATTLE, MtSilverRival

	def_bg_events
	bg_event 24, 19, BGEVENT_READ, MtSilverPokecenterSign
	bg_event 17, 13, BGEVENT_READ, MtSilverSign
	bg_event  9, 25, BGEVENT_ITEM, SilverCaveOutsideHiddenFullRestore

	def_object_events
	object_event -3, 19, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_MT_SILVER
