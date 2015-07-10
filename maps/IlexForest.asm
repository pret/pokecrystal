IlexForest_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x6eb03

UnknownScript_0x6eb03:
	checkevent EVENT_GOT_HM01_CUT
	iftrue UnknownScript_0x6eb34
	copybytetovar FarfetchdPosition
	if_equal $1, UnknownScript_0x6eb35
	if_equal $2, UnknownScript_0x6eb3c
	if_equal $3, UnknownScript_0x6eb43
	if_equal $4, UnknownScript_0x6eb4a
	if_equal $5, UnknownScript_0x6eb51
	if_equal $6, UnknownScript_0x6eb58
	if_equal $7, UnknownScript_0x6eb5f
	if_equal $8, UnknownScript_0x6eb66
	if_equal $9, UnknownScript_0x6eb6d
	if_equal $a, UnknownScript_0x6eb74
UnknownScript_0x6eb34:
	return

UnknownScript_0x6eb35:
	moveperson $2, $e, $1f
	appear $2
	return

UnknownScript_0x6eb3c:
	moveperson $2, $f, $19
	appear $2
	return

UnknownScript_0x6eb43:
	moveperson $2, $14, $18
	appear $2
	return

UnknownScript_0x6eb4a:
	moveperson $2, $1d, $16
	appear $2
	return

UnknownScript_0x6eb51:
	moveperson $2, $1c, $1f
	appear $2
	return

UnknownScript_0x6eb58:
	moveperson $2, $18, $23
	appear $2
	return

UnknownScript_0x6eb5f:
	moveperson $2, $16, $1f
	appear $2
	return

UnknownScript_0x6eb66:
	moveperson $2, $f, $1d
	appear $2
	return

UnknownScript_0x6eb6d:
	moveperson $2, $a, $23
	appear $2
	return

UnknownScript_0x6eb74:
	moveperson $2, $6, $1c
	appear $2
	return

YoungsterScript_0x6eb7b:
	faceplayer
	loadfont
	checkevent EVENT_HERDED_FARFETCHD
	iftrue UnknownScript_0x6eb89
	writetext UnknownText_0x6ef5c
	closetext
	loadmovesprites
	end

UnknownScript_0x6eb89:
	writetext UnknownText_0x6f019
	closetext
	loadmovesprites
	end

BirdScript_0x6eb8f:
	copybytetovar FarfetchdPosition
	if_equal $1, UnknownScript_0x6ebba
	if_equal $2, UnknownScript_0x6ebd9
	if_equal $3, UnknownScript_0x6ec02
	if_equal $4, UnknownScript_0x6ec2b
	if_equal $5, UnknownScript_0x6ec54
	if_equal $6, UnknownScript_0x6eca7
	if_equal $7, UnknownScript_0x6ecd0
	if_equal $8, UnknownScript_0x6ed0e
	if_equal $9, UnknownScript_0x6ed50
	if_equal $a, UnknownScript_0x6ed96
UnknownScript_0x6ebba:
	faceplayer
	loadfont
	writetext UnknownText_0x6f06f
	keeptextopen
	writetext UnknownText_0x6f086
	cry FARFETCH_D
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x6ee8f
	moveperson $2, $f, $19
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $2
	end

UnknownScript_0x6ebd9:
	scall UnknownScript_0x6eda1
	if_equal $0, UnknownScript_0x6ebf1
	applymovement $2, MovementData_0x6ee95
	moveperson $2, $14, $18
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $3
	end

UnknownScript_0x6ebf1:
	applymovement $2, MovementData_0x6ee9e
	moveperson $2, $f, $1d
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $8
	end

UnknownScript_0x6ec02:
	scall UnknownScript_0x6eda1
	if_equal $2, UnknownScript_0x6ec1a
	applymovement $2, MovementData_0x6eea4
	moveperson $2, $1d, $16
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $4
	end

UnknownScript_0x6ec1a:
	applymovement $2, MovementData_0x6eeab
	moveperson $2, $f, $19
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $2
	end

UnknownScript_0x6ec2b:
	scall UnknownScript_0x6eda1
	if_equal $1, UnknownScript_0x6ec43
	applymovement $2, MovementData_0x6eeb1
	moveperson $2, $1c, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $5
	end

UnknownScript_0x6ec43:
	applymovement $2, MovementData_0x6eeb8
	moveperson $2, $14, $18
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $3
	end

UnknownScript_0x6ec54:
	scall UnknownScript_0x6eda1
	if_equal $1, UnknownScript_0x6ec85
	if_equal $2, UnknownScript_0x6ec74
	if_equal $3, UnknownScript_0x6ec96
	applymovement $2, MovementData_0x6eebd
	moveperson $2, $18, $23
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $6
	end

UnknownScript_0x6ec74:
	applymovement $2, MovementData_0x6eec7
	moveperson $2, $16, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $7
	end

UnknownScript_0x6ec85:
	applymovement $2, MovementData_0x6eecc
	moveperson $2, $1d, $16
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $4
	end

UnknownScript_0x6ec96:
	applymovement $2, MovementData_0x6eed2
	moveperson $2, $1d, $16
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $4
	end

UnknownScript_0x6eca7:
	scall UnknownScript_0x6eda1
	if_equal $3, UnknownScript_0x6ecbf
	applymovement $2, MovementData_0x6eee6
	moveperson $2, $16, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $7
	end

UnknownScript_0x6ecbf:
	applymovement $2, MovementData_0x6eeef
	moveperson $2, $1c, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $5
	end

UnknownScript_0x6ecd0:
	scall UnknownScript_0x6eda1
	if_equal $0, UnknownScript_0x6ecfd
	if_equal $2, UnknownScript_0x6ecec
	applymovement $2, MovementData_0x6eef8
	moveperson $2, $f, $1d
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $8
	end

UnknownScript_0x6ecec:
	applymovement $2, MovementData_0x6ef00
	moveperson $2, $18, $23
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $6
	end

UnknownScript_0x6ecfd:
	applymovement $2, MovementData_0x6ef09
	moveperson $2, $1c, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $5
	end

UnknownScript_0x6ed0e:
	scall UnknownScript_0x6eda1
	if_equal $1, UnknownScript_0x6ed3f
	if_equal $2, UnknownScript_0x6ed3f
	if_equal $3, UnknownScript_0x6ed2e
	applymovement $2, MovementData_0x6ef10
	moveperson $2, $a, $23
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $9
	end

UnknownScript_0x6ed2e:
	applymovement $2, MovementData_0x6ef18
	moveperson $2, $16, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $7
	end

UnknownScript_0x6ed3f:
	applymovement $2, MovementData_0x6ef1e
	moveperson $2, $f, $19
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $2
	end

UnknownScript_0x6ed50:
	scall UnknownScript_0x6eda1
	if_equal $0, UnknownScript_0x6ed85
	if_equal $3, UnknownScript_0x6ed74
	applymovement $2, MovementData_0x6ef23
	moveperson $2, $6, $1c
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $a
	appear $4
	setevent $06f7
	setevent EVENT_HERDED_FARFETCHD
	end

UnknownScript_0x6ed74:
	applymovement $2, MovementData_0x6ef33
	moveperson $2, $f, $1d
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $8
	end

UnknownScript_0x6ed85:
	applymovement $2, MovementData_0x6ef3d
	moveperson $2, $f, $1d
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $8
	end

UnknownScript_0x6ed96:
	faceplayer
	loadfont
	writetext UnknownText_0x6f086
	cry FARFETCH_D
	closetext
	loadmovesprites
	end

UnknownScript_0x6eda1:
	faceplayer
	loadfont
	writetext UnknownText_0x6f086
	cry FARFETCH_D
	closetext
	loadmovesprites
	checkcode VAR_FACING
	end

BlackBeltScript_0x6edae:
	faceplayer
	loadfont
	checkevent EVENT_GOT_HM01_CUT
	iftrue UnknownScript_0x6edd8
	writetext UnknownText_0x6f099
	keeptextopen
	verbosegiveitem HM_CUT, 1
	setevent EVENT_GOT_HM01_CUT
	writetext UnknownText_0x6f141
	closetext
	loadmovesprites
	setevent $06e9
	setevent $06f3
	setevent $06f4
	clearevent $06f5
	clearevent $06f6
	clearevent $06f7
	end

UnknownScript_0x6edd8:
	writetext UnknownText_0x6f1c0
	closetext
	loadmovesprites
	end

RockerScript_0x6edde:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue UnknownScript_0x6edf3
	writetext UnknownText_0x6f21b
	keeptextopen
	verbosegiveitem TM_HEADBUTT, 1
	iffalse UnknownScript_0x6edf7
	setevent EVENT_GOT_TM02_HEADBUTT
UnknownScript_0x6edf3:
	writetext UnknownText_0x6f26d
	closetext
UnknownScript_0x6edf7:
	loadmovesprites
	end

TrainerBug_catcherWayne:
	; bit/flag number
	dw EVENT_BEAT_BUG_CATCHER_WAYNE

	; trainer group && trainer id
	db BUG_CATCHER, WAYNE

	; text when seen
	dw Bug_catcherWayneSeenText

	; text when trainer beaten
	dw Bug_catcherWayneBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherWayneScript

Bug_catcherWayneScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6f571
	closetext
	loadmovesprites
	end

LassScript_0x6ee0d:
	jumptextfaceplayer UnknownText_0x6f2af

ItemFragment_0x6ee10:
	db REVIVE, 1

ItemFragment_0x6ee12:
	db X_ATTACK, 1

ItemFragment_0x6ee14:
	db ANTIDOTE, 1

ItemFragment_0x6ee16:
	db ETHER, 1

MapIlexForestSignpostItem1:
	dw $0088
	db ETHER
	

MapIlexForestSignpostItem2:
	dw $0089
	db SUPER_POTION
	

MapIlexForestSignpostItem3:
	dw $008a
	db FULL_HEAL

IlexForestBoulder:
; unused
	jumpstd strengthboulder

MapIlexForestSignpost0Script:
	jumptext UnknownText_0x6f2de

MapIlexForestSignpost4Script:
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue UnknownScript_0x6ee30
	jump UnknownScript_0x6ee35

UnknownScript_0x6ee30:
	checkitem GS_BALL
	iftrue UnknownScript_0x6ee38
UnknownScript_0x6ee35:
	jumptext UnknownText_0x6f358

UnknownScript_0x6ee38:
	loadfont
	writetext UnknownText_0x6f394
	yesorno
	iftrue UnknownScript_0x6ee42
	loadmovesprites
	end

UnknownScript_0x6ee42:
	takeitem GS_BALL, 1
	clearevent EVENT_FOREST_IS_RESTLESS
	setevent $07a4
	disappear $8
	clearevent $06eb
	writetext UnknownText_0x6f43b
	closetext
	loadmovesprites
	pause 20
	showemote $0, $0, 20
	special Functionc48f
	applymovement $0, MovementData_0x6ef58
	pause 30
	spriteface $0, DOWN
	pause 20
	clearflag $0064
	special Function4989a
	loadpokedata CELEBI, 30
	startbattle
	returnafterbattle
	pause 20
	special Function49bf9
	iffalse UnknownScript_0x6ee8e
	appear $7
	applymovement $7, MovementData_0x6ef4e
	loadfont
	writetext UnknownText_0x6f452
	closetext
	loadmovesprites
	applymovement $7, MovementData_0x6ef53
	disappear $7
UnknownScript_0x6ee8e:
	end

MovementData_0x6ee8f:
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_0x6ee95:
	big_step_up
	big_step_up
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_down
	step_end

MovementData_0x6ee9e:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_0x6eea4:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_0x6eeab:
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

MovementData_0x6eeb1:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_0x6eeb8:
	big_step_left
	jump_step_left
	big_step_left
	big_step_left
	step_end

MovementData_0x6eebd:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

MovementData_0x6eec7:
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

MovementData_0x6eecc:
	big_step_up
	big_step_up
	big_step_up
	big_step_right
	big_step_up
	step_end

MovementData_0x6eed2:
	big_step_right
	turn_head_up
	db $3e ; movement
	turn_head_down
	db $3e ; movement
	turn_head_up
	db $3e ; movement
	big_step_down
	big_step_down
	fix_facing
	jump_step_up
	accelerate_last
	accelerate_last
	remove_fixed_facing
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_0x6eee6:
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_right
	big_step_up
	big_step_up
	step_end

MovementData_0x6eeef:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_0x6eef8:
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

MovementData_0x6ef00:
	big_step_down
	big_step_down
	big_step_left
	big_step_down
	big_step_down
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_0x6ef09:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_0x6ef10:
	big_step_down
	big_step_left
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end

MovementData_0x6ef18:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end

MovementData_0x6ef1e:
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_0x6ef23:
	big_step_left
	big_step_left
	fix_facing
	jump_step_right
	accelerate_last
	accelerate_last
	remove_fixed_facing
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_0x6ef33:
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_0x6ef3d:
	big_step_left
	big_step_left
	fix_facing
	jump_step_right
	accelerate_last
	accelerate_last
	remove_fixed_facing
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end

MovementData_0x6ef4e:
	step_up
	step_up
	step_up
	step_up
	step_end

MovementData_0x6ef53:
	step_down
	step_down
	step_down
	step_down
	step_end

MovementData_0x6ef58:
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end

UnknownText_0x6ef5c:
	text "Oh, man… My boss"
	line "is going to be"
	cont "steaming…"

	para "The FARFETCH'D"
	line "that CUTS trees"

	para "for charcoal took"
	line "off on me."

	para "I can't go looking"
	line "for it here in the"
	cont "ILEX FOREST."

	para "It's too big, dark"
	line "and scary for me…"
	done

UnknownText_0x6f019:
	text "Wow! Thanks a"
	line "whole bunch!"

	para "My boss's #MON"
	line "won't obey me be-"
	cont "cause I don't have"
	cont "a BADGE."
	done

UnknownText_0x6f06f:
	text "It's the missing"
	line "#MON!"
	done

UnknownText_0x6f086:
	text "FARFETCH'D: Kwaa!"
	done

UnknownText_0x6f099:
	text "Ah! My FARFETCH'D!"

	para "You found it for"
	line "us, kid?"

	para "Without it, we"
	line "wouldn't be able"

	para "to CUT trees for"
	line "charcoal."

	para "Thanks, kid!"

	para "Now, how can I"
	line "thank you…"

	para "I know! Here, take"
	line "this."
	done

UnknownText_0x6f141:
	text "That's the CUT HM."
	line "Teach that to a"

	para "#MON to clear"
	line "small trees."

	para "Of course, you"
	line "have to have the"

	para "GYM BADGE from"
	line "AZALEA to use it."
	done

UnknownText_0x6f1c0:
	text "Do you want to"
	line "apprentice as a"

	para "charcoal maker"
	line "with me?"

	para "You'll be first-"
	line "rate in ten years!"
	done

UnknownText_0x6f21b:
	text "What am I doing?"

	para "I'm shaking trees"
	line "using HEADBUTT."

	para "It's fun. Here,"
	line "you try it too!"
	done

UnknownText_0x6f26d:
	text "Rattle trees with"
	line "HEADBUTT. Some-"
	cont "times, sleeping"
	cont "#MON fall out."
	done

UnknownText_0x6f2af:
	text "Did something"
	line "happen to the"
	cont "forest's guardian?"
	done

UnknownText_0x6f2de:
	text "ILEX FOREST is"
	line "so overgrown with"

	para "trees that you"
	line "can't see the sky."

	para "Please watch out"
	line "for items that may"
	cont "have been dropped."
	done

UnknownText_0x6f358:
	text "ILEX FOREST"
	line "SHRINE…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"
	done

UnknownText_0x6f394:
	text "ILEX FOREST"
	line "SHRINE…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"

	para "Oh? What is this?"

	para "It's a hole."
	line "It looks like the"

	para "GS BALL would fit"
	line "inside it."

	para "Want to put the GS"
	line "BALL here?"
	done

UnknownText_0x6f43b:
	text "<PLAYER> put in the"
	line "GS BALL."
	done

UnknownText_0x6f452:
	text "Whew, wasn't that"
	line "something!"

	para "<PLAYER>, that was"
	line "fantastic. Thanks!"

	para "The legends about"
	line "that SHRINE were"
	cont "real after all."

	para "I feel inspired by"
	line "what I just saw."

	para "It motivates me to"
	line "make better BALLS!"

	para "I'm going!"
	done

Bug_catcherWayneSeenText:
	text "Don't sneak up on"
	line "me like that!"

	para "You frightened a"
	line "#MON away!"
	done

Bug_catcherWayneBeatenText:
	text "I hadn't seen that"
	line "#MON before…"
	done

UnknownText_0x6f571:
	text "A #MON I've"
	line "never seen before"

	para "fell out of the"
	line "tree when I used"
	cont "HEADBUTT."

	para "I ought to use"
	line "HEADBUTT in other"
	cont "places too."
	done

IlexForest_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $5, $1, 3, GROUP_ROUTE_34_ILEX_FOREST_GATE, MAP_ROUTE_34_ILEX_FOREST_GATE
	warp_def $2a, $3, 1, GROUP_ILEX_FOREST_AZALEA_GATE, MAP_ILEX_FOREST_AZALEA_GATE
	warp_def $2b, $3, 2, GROUP_ILEX_FOREST_AZALEA_GATE, MAP_ILEX_FOREST_AZALEA_GATE

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 17, 3, $0, MapIlexForestSignpost0Script
	signpost 7, 11, $7, MapIlexForestSignpostItem1
	signpost 14, 22, $7, MapIlexForestSignpostItem2
	signpost 17, 1, $7, MapIlexForestSignpostItem3
	signpost 22, 8, $1, MapIlexForestSignpost4Script

	; people-events
	db 11
	person_event SPRITE_BIRD, 35, 18, $3, $0, 255, 255, $b0, 0, BirdScript_0x6eb8f, $06e9
	person_event SPRITE_YOUNGSTER, 32, 11, $6, $0, 255, 255, $a0, 0, YoungsterScript_0x6eb7b, $06f3
	person_event SPRITE_BLACK_BELT, 32, 9, $9, $0, 255, 255, $0, 0, BlackBeltScript_0x6edae, $06f4
	person_event SPRITE_ROCKER, 18, 19, $9, $0, 255, 255, $0, 0, RockerScript_0x6edde, $ffff
	person_event SPRITE_POKE_BALL, 36, 24, $1, $0, 255, 255, $1, 0, ItemFragment_0x6ee10, $0671
	person_event SPRITE_KURT, 33, 12, $7, $0, 255, 255, $0, 0, ObjectEvent, $07a5
	person_event SPRITE_LASS, 28, 7, $9, $0, 255, 255, $a0, 0, LassScript_0x6ee0d, $06ed
	person_event SPRITE_YOUNGSTER, 5, 16, $7, $0, 255, 255, $a2, 0, TrainerBug_catcherWayne, $ffff
	person_event SPRITE_POKE_BALL, 21, 13, $1, $0, 255, 255, $1, 0, ItemFragment_0x6ee12, $07b9
	person_event SPRITE_POKE_BALL, 11, 21, $1, $0, 255, 255, $1, 0, ItemFragment_0x6ee14, $07ba
	person_event SPRITE_POKE_BALL, 5, 31, $1, $0, 255, 255, $1, 0, ItemFragment_0x6ee16, $07bb
