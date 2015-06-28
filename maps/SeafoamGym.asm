SeafoamGym_MapScriptHeader: ; 0x1ab4f4
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x1ab4fa, $0000

	; callback count
	db 0
; 0x1ab4fa

UnknownScript_0x1ab4fa: ; 0x1ab4fa
	end
; 0x1ab4fb

BlaineScript_0x1ab4fb: ; 0x1ab4fb
	faceplayer
	loadfont
	checkflag $0029
	iftrue UnknownScript_0x1ab52b
	writetext UnknownText_0x1ab548
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1ab646, $0000
	loadtrainer BLAINE, 1
	startbattle
	iftrue UnknownScript_0x1ab516
	appear $3
UnknownScript_0x1ab516: ; 0x1ab516
	returnafterbattle
	setevent $04cb
	loadfont
	writetext UnknownText_0x1ab683
	playsound SFX_GET_BADGE
	waitbutton
	setflag $0029
	writetext UnknownText_0x1ab69d
	closetext
	loadmovesprites
	end
; 0x1ab52b

UnknownScript_0x1ab52b: ; 0x1ab52b
	writetext UnknownText_0x1ab71c
	closetext
	loadmovesprites
	end
; 0x1ab531

SeafoamGymGuyScript: ; 0x1ab531
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
; 0x1ab548

UnknownText_0x1ab548: ; 0x1ab548
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
; 0x1ab646

UnknownText_0x1ab646: ; 0x1ab646
	text "BLAINE: Awesome."
	line "I've burned out…"

	para "You've earned"
	line "VOLCANOBADGE!"
	done
; 0x1ab683

UnknownText_0x1ab683: ; 0x1ab683
	text "<PLAYER> received"
	line "VOLCANOBADGE."
	done
; 0x1ab69d

UnknownText_0x1ab69d: ; 0x1ab69d
	text "BLAINE: I did lose"
	line "this time, but I'm"

	para "going to win the"
	line "next time."

	para "When I rebuild my"
	line "CINNABAR GYM,"

	para "we'll have to have"
	line "a rematch."
	done
; 0x1ab71c

UnknownText_0x1ab71c: ; 0x1ab71c
	text "BLAINE: My fire"
	line "#MON will be"

	para "even stronger."
	line "Just you watch!"
	done
; 0x1ab759

SeafoamGymGuyWinText: ; 0x1ab759
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
; 0x1ab806

SeafoamGymGuyWinText2: ; 0x1ab806
	text "A #MON GYM can"
	line "be anywhere as"

	para "long as the GYM"
	line "LEADER is there."

	para "There's no need"
	line "for a building."
	done
; 0x1ab865

SeafoamGym_MapEventHeader: ; 0x1ab865
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $5, $5, 1, GROUP_ROUTE_20, MAP_ROUTE_20

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_BLAINE, 6, 9, $6, $0, 255, 255, $b0, 0, BlaineScript_0x1ab4fb, $ffff
	person_event SPRITE_GYM_GUY, 9, 10, $7, $0, 255, 255, $90, 0, SeafoamGymGuyScript, $0777
; 0x1ab88a
