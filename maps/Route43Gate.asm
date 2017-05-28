const_value set 2
	const ROUTE43GATE_OFFICER
	const ROUTE43GATE_ROCKET1
	const ROUTE43GATE_ROCKET2

Route43Gate_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x19abc5, 0
	dw UnknownScript_0x19abc9, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_NEWMAP, UnknownScript_0x19abca

UnknownScript_0x19abc5:
	priorityjump UnknownScript_0x19abda
	end

UnknownScript_0x19abc9:
	end

UnknownScript_0x19abca:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19abd5
	domaptrigger ROUTE_43, $0
	return

UnknownScript_0x19abd5:
	domaptrigger ROUTE_43, $1
	return

UnknownScript_0x19abda:
	playmusic MUSIC_ROCKET_ENCOUNTER
	checkcode VAR_FACING
	if_equal DOWN, UnknownScript_0x19abea
	if_equal UP, UnknownScript_0x19ac38
	dotrigger $1
	end

UnknownScript_0x19abea:
	applymovement PLAYER, MovementData_0x19aca2
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET2, 15
	applymovement ROUTE43GATE_ROCKET2, MovementData_0x19acbb
	spriteface ROUTE43GATE_ROCKET1, UP
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET1, 15
	applymovement ROUTE43GATE_ROCKET1, MovementData_0x19aca4
	opentext
	writetext UnknownText_0x19acd2
	buttonsound
	checkmoney $0, 999
	if_equal $0, UnknownScript_0x19ac12
	jump UnknownScript_0x19ac1d

UnknownScript_0x19ac12:
	takemoney $0, 1000
	writetext UnknownText_0x19ad0a
	jump UnknownScript_0x19ac28

UnknownScript_0x19ac1d:
	takemoney $0, 1000
	writetext UnknownText_0x19ad20
	jump UnknownScript_0x19ac28

UnknownScript_0x19ac28:
	buttonsound
	closetext
	applymovement ROUTE43GATE_ROCKET1, MovementData_0x19acaa
	applymovement ROUTE43GATE_ROCKET2, MovementData_0x19acc1
	dotrigger $1
	special RestartMapMusic
	end

UnknownScript_0x19ac38:
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET1, 15
	applymovement ROUTE43GATE_ROCKET1, MovementData_0x19acaf
	spriteface ROUTE43GATE_ROCKET2, DOWN
	showemote EMOTE_SHOCK, ROUTE43GATE_ROCKET2, 15
	applymovement ROUTE43GATE_ROCKET2, MovementData_0x19acc7
	opentext
	writetext UnknownText_0x19acd2
	buttonsound
	checkmoney $0, 999
	if_equal $0, UnknownScript_0x19ac5c
	jump UnknownScript_0x19ac67

UnknownScript_0x19ac5c:
	takemoney $0, 1000
	writetext UnknownText_0x19ad0a
	jump UnknownScript_0x19ac72

UnknownScript_0x19ac67:
	takemoney $0, 1000
	writetext UnknownText_0x19ad20
	jump UnknownScript_0x19ac72

UnknownScript_0x19ac72:
	buttonsound
	closetext
	applymovement ROUTE43GATE_ROCKET2, MovementData_0x19accd
	applymovement ROUTE43GATE_ROCKET1, MovementData_0x19acb5
	dotrigger $1
	special RestartMapMusic
	end

RocketScript_0x19ac82:
	jumptextfaceplayer UnknownText_0x19ad41

OfficerScript_0x19ac85:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM36_SLUDGE_BOMB
	iftrue UnknownScript_0x19ac9c
	writetext UnknownText_0x19ad9b
	buttonsound
	verbosegiveitem TM_SLUDGE_BOMB
	iffalse UnknownScript_0x19aca0
	setevent EVENT_GOT_TM36_SLUDGE_BOMB
	closetext
	end

UnknownScript_0x19ac9c:
	writetext UnknownText_0x19ae2d
	waitbutton
UnknownScript_0x19aca0:
	closetext
	end

MovementData_0x19aca2:
	step DOWN
	step_end

MovementData_0x19aca4:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	turn_head UP
	step_end

MovementData_0x19acaa:
	big_step LEFT
	big_step LEFT
	big_step DOWN
	big_step DOWN
	step_end

MovementData_0x19acaf:
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	turn_head DOWN
	step_end

MovementData_0x19acb5:
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

MovementData_0x19acbb:
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

MovementData_0x19acc1:
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	turn_head UP
	step_end

MovementData_0x19acc7:
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	turn_head DOWN
	step_end

MovementData_0x19accd:
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	step_end

UnknownText_0x19acd2:
	text "Hold it there,"
	line "kiddo!"

	para "The toll is ¥1000"
	line "to go through."
	done

UnknownText_0x19ad0a:
	text "Thank you very"
	line "much!"
	done

UnknownText_0x19ad20:
	text "Then pay what you"
	line "have, please."
	done

UnknownText_0x19ad41:
	text "He-he-he. We're"
	line "making a bundle."

	para "Everyone wants to"
	line "see what's going"

	para "on up at LAKE OF"
	line "RAGE."
	done

UnknownText_0x19ad9b:
	text "I got chased from"
	line "my post by these"
	cont "thugs in black."

	para "They left this"
	line "behind."

	para "It makes me uncom-"
	line "fortable. Could"
	cont "you take it away?"
	done

UnknownText_0x19ae1b:
	text "<PLAYER> received"
	line "TM30."
	done

UnknownText_0x19ae2d:
	text "Use this gate to"
	line "avoid walking in"
	cont "the grass."
	done

Route43Gate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 4, ROUTE_43
	warp_def $0, $5, 5, ROUTE_43
	warp_def $7, $4, 3, ROUTE_43
	warp_def $7, $5, 3, ROUTE_43

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OfficerScript_0x19ac85, EVENT_LAKE_OF_RAGE_CIVILIANS
	person_event SPRITE_ROCKET, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RocketScript_0x19ac82, EVENT_ROUTE_43_GATE_ROCKETS
	person_event SPRITE_ROCKET, 4, 7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RocketScript_0x19ac82, EVENT_ROUTE_43_GATE_ROCKETS
