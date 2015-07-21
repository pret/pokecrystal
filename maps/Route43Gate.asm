Route43Gate_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x19abc5, $0000
	dw UnknownScript_0x19abc9, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 5, UnknownScript_0x19abca

UnknownScript_0x19abc5:
	priorityjump UnknownScript_0x19abda
	end

UnknownScript_0x19abc9:
	end

UnknownScript_0x19abca:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19abd5
	domaptrigger GROUP_ROUTE_43, MAP_ROUTE_43, $0
	return

UnknownScript_0x19abd5:
	domaptrigger GROUP_ROUTE_43, MAP_ROUTE_43, $1
	return

UnknownScript_0x19abda:
	playmusic MUSIC_ROCKET_ENCOUNTER
	checkcode VAR_FACING
	if_equal $0, UnknownScript_0x19abea
	if_equal $1, UnknownScript_0x19ac38
	dotrigger $1
	end

UnknownScript_0x19abea:
	applymovement $0, MovementData_0x19aca2
	showemote EMOTE_SHOCK, $4, 15
	applymovement $4, MovementData_0x19acbb
	spriteface $3, UP
	showemote EMOTE_SHOCK, $3, 15
	applymovement $3, MovementData_0x19aca4
	loadfont
	writetext UnknownText_0x19acd2
	keeptextopen
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
	keeptextopen
	loadmovesprites
	applymovement $3, MovementData_0x19acaa
	applymovement $4, MovementData_0x19acc1
	dotrigger $1
	special RestartMapMusic
	end

UnknownScript_0x19ac38:
	showemote EMOTE_SHOCK, $3, 15
	applymovement $3, MovementData_0x19acaf
	spriteface $4, DOWN
	showemote EMOTE_SHOCK, $4, 15
	applymovement $4, MovementData_0x19acc7
	loadfont
	writetext UnknownText_0x19acd2
	keeptextopen
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
	keeptextopen
	loadmovesprites
	applymovement $4, MovementData_0x19accd
	applymovement $3, MovementData_0x19acb5
	dotrigger $1
	special RestartMapMusic
	end

RocketScript_0x19ac82:
	jumptextfaceplayer UnknownText_0x19ad41

OfficerScript_0x19ac85:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM36_SLUDGE_BOMB
	iftrue UnknownScript_0x19ac9c
	writetext UnknownText_0x19ad9b
	keeptextopen
	verbosegiveitem TM_SLUDGE_BOMB, 1
	iffalse UnknownScript_0x19aca0
	setevent EVENT_GOT_TM36_SLUDGE_BOMB
	loadmovesprites
	end

UnknownScript_0x19ac9c:
	writetext UnknownText_0x19ae2d
	closetext
UnknownScript_0x19aca0:
	loadmovesprites
	end

MovementData_0x19aca2:
	step_down
	step_end

MovementData_0x19aca4:
	big_step_up
	big_step_up
	big_step_right
	big_step_right
	turn_head_up
	step_end

MovementData_0x19acaa:
	big_step_left
	big_step_left
	big_step_down
	big_step_down
	step_end

MovementData_0x19acaf:
	big_step_down
	big_step_down
	big_step_right
	big_step_right
	turn_head_down
	step_end

MovementData_0x19acb5:
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	turn_head_down
	step_end

MovementData_0x19acbb:
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	turn_head_up
	step_end

MovementData_0x19acc1:
	big_step_right
	big_step_right
	big_step_down
	big_step_down
	turn_head_up
	step_end

MovementData_0x19acc7:
	big_step_down
	big_step_down
	big_step_left
	big_step_left
	turn_head_down
	step_end

MovementData_0x19accd:
	big_step_right
	big_step_right
	big_step_up
	big_step_up
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
	warp_def $0, $4, 4, GROUP_ROUTE_43, MAP_ROUTE_43
	warp_def $0, $5, 5, GROUP_ROUTE_43, MAP_ROUTE_43
	warp_def $7, $4, 3, GROUP_ROUTE_43, MAP_ROUTE_43
	warp_def $7, $5, 3, GROUP_ROUTE_43, MAP_ROUTE_43

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_OFFICER, 8, 4, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, OfficerScript_0x19ac85, EVENT_LAKE_OF_RAGE_CIVILIANS
	person_event SPRITE_ROCKET, 8, 6, OW_UP | $2, $0, -1, -1, $0, 0, RocketScript_0x19ac82, EVENT_ROUTE_43_GATE_ROCKETS
	person_event SPRITE_ROCKET, 8, 11, OW_UP | $3, $0, -1, -1, $0, 0, RocketScript_0x19ac82, EVENT_ROUTE_43_GATE_ROCKETS
