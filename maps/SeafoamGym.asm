SeafoamGym_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x1ab4fa, $0000

.MapCallbacks:
	db 0

UnknownScript_0x1ab4fa:
	end

BlaineScript_0x1ab4fb:
	faceplayer
	loadfont
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext UnknownText_0x1ab548
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1ab646, $0000
	loadtrainer BLAINE, 1
	startbattle
	iftrue .ReturnAfterBattle
	appear $3
.ReturnAfterBattle
	returnafterbattle
	setevent EVENT_BEAT_BLAINE
	loadfont
	writetext UnknownText_0x1ab683
	playsound SFX_GET_BADGE
	waitbutton
	setflag ENGINE_VOLCANOBADGE
	writetext UnknownText_0x1ab69d
	closetext
	loadmovesprites
	end

.FightDone
	writetext UnknownText_0x1ab71c
	closetext
	loadmovesprites
	end

SeafoamGymGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue .TalkedToSeafoamGymGuyScript
	writetext SeafoamGymGuyWinText
	closetext
	loadmovesprites
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	end

.TalkedToSeafoamGymGuyScript
	writetext SeafoamGymGuyWinText2
	closetext
	loadmovesprites
	end

UnknownText_0x1ab548:
	text "BLAINE: Waaah!"

	para "My GYM in CINNABAR"
	line "burned down."

	para "My fire-breathing"
	line "#MON and I are"

	para "homeless because"
	line "of the volcano."

	para "Waaah!"

	para "But I'm back in"
	line "business as a GYM"

	para "LEADER here in"
	line "this cave."

	para "If you can beat"
	line "me, I'll give you"
	cont "a BADGE."

	para "Ha! You'd better"
	line "have BURN HEAL!"
	done

UnknownText_0x1ab646:
	text "BLAINE: Awesome."
	line "I've burned out…"

	para "You've earned"
	line "VOLCANOBADGE!"
	done

UnknownText_0x1ab683:
	text "<PLAYER> received"
	line "VOLCANOBADGE."
	done

UnknownText_0x1ab69d:
	text "BLAINE: I did lose"
	line "this time, but I'm"

	para "going to win the"
	line "next time."

	para "When I rebuild my"
	line "CINNABAR GYM,"

	para "we'll have to have"
	line "a rematch."
	done

UnknownText_0x1ab71c:
	text "BLAINE: My fire"
	line "#MON will be"

	para "even stronger."
	line "Just you watch!"
	done

SeafoamGymGuyWinText:
	text "Yo!"

	para "… Huh? It's over"
	line "already?"

	para "Sorry, sorry!"

	para "CINNABAR GYM was"
	line "gone, so I didn't"

	para "know where to find"
	line "you."

	para "But, hey, you're"
	line "plenty strong even"

	para "without my advice."
	line "I knew you'd win!"
	done

SeafoamGymGuyWinText2:
	text "A #MON GYM can"
	line "be anywhere as"

	para "long as the GYM"
	line "LEADER is there."

	para "There's no need"
	line "for a building."
	done

SeafoamGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $5, $5, 1, GROUP_ROUTE_20, MAP_ROUTE_20

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_BLAINE, 6, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, BlaineScript_0x1ab4fb, -1
	person_event SPRITE_GYM_GUY, 9, 10, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SeafoamGymGuyScript, EVENT_SEAFOAM_GYM_GYM_GUY
