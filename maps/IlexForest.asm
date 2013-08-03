IlexForest_MapScriptHeader: ; 0x6eafe
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x6eb03
; 0x6eb03

UnknownScript_0x6eb03: ; 0x6eb03
	checkbit1 $0010
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
UnknownScript_0x6eb34: ; 0x6eb34
	return
; 0x6eb35

UnknownScript_0x6eb35: ; 0x6eb35
	moveperson $2, $e, $1f
	appear $2
	return
; 0x6eb3c

UnknownScript_0x6eb3c: ; 0x6eb3c
	moveperson $2, $f, $19
	appear $2
	return
; 0x6eb43

UnknownScript_0x6eb43: ; 0x6eb43
	moveperson $2, $14, $18
	appear $2
	return
; 0x6eb4a

UnknownScript_0x6eb4a: ; 0x6eb4a
	moveperson $2, $1d, $16
	appear $2
	return
; 0x6eb51

UnknownScript_0x6eb51: ; 0x6eb51
	moveperson $2, $1c, $1f
	appear $2
	return
; 0x6eb58

UnknownScript_0x6eb58: ; 0x6eb58
	moveperson $2, $18, $23
	appear $2
	return
; 0x6eb5f

UnknownScript_0x6eb5f: ; 0x6eb5f
	moveperson $2, $16, $1f
	appear $2
	return
; 0x6eb66

UnknownScript_0x6eb66: ; 0x6eb66
	moveperson $2, $f, $1d
	appear $2
	return
; 0x6eb6d

UnknownScript_0x6eb6d: ; 0x6eb6d
	moveperson $2, $a, $23
	appear $2
	return
; 0x6eb74

UnknownScript_0x6eb74: ; 0x6eb74
	moveperson $2, $6, $1c
	appear $2
	return
; 0x6eb7b

YoungsterScript_0x6eb7b: ; 0x6eb7b
	faceplayer
	loadfont
	checkbit1 $0029
	iftrue UnknownScript_0x6eb89
	2writetext UnknownText_0x6ef5c
	closetext
	loadmovesprites
	end
; 0x6eb89

UnknownScript_0x6eb89: ; 0x6eb89
	2writetext UnknownText_0x6f019
	closetext
	loadmovesprites
	end
; 0x6eb8f

BirdScript_0x6eb8f: ; 0x6eb8f
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
UnknownScript_0x6ebba: ; 0x6ebba
	faceplayer
	loadfont
	2writetext UnknownText_0x6f06f
	keeptextopen
	2writetext UnknownText_0x6f086
	cry FARFETCH_D
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x6ee8f
	moveperson $2, $f, $19
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $2
	end
; 0x6ebd9

UnknownScript_0x6ebd9: ; 0x6ebd9
	2call UnknownScript_0x6eda1
	if_equal $0, UnknownScript_0x6ebf1
	applymovement $2, MovementData_0x6ee95
	moveperson $2, $14, $18
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $3
	end
; 0x6ebf1

UnknownScript_0x6ebf1: ; 0x6ebf1
	applymovement $2, MovementData_0x6ee9e
	moveperson $2, $f, $1d
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $8
	end
; 0x6ec02

UnknownScript_0x6ec02: ; 0x6ec02
	2call UnknownScript_0x6eda1
	if_equal $2, UnknownScript_0x6ec1a
	applymovement $2, MovementData_0x6eea4
	moveperson $2, $1d, $16
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $4
	end
; 0x6ec1a

UnknownScript_0x6ec1a: ; 0x6ec1a
	applymovement $2, MovementData_0x6eeab
	moveperson $2, $f, $19
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $2
	end
; 0x6ec2b

UnknownScript_0x6ec2b: ; 0x6ec2b
	2call UnknownScript_0x6eda1
	if_equal $1, UnknownScript_0x6ec43
	applymovement $2, MovementData_0x6eeb1
	moveperson $2, $1c, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $5
	end
; 0x6ec43

UnknownScript_0x6ec43: ; 0x6ec43
	applymovement $2, MovementData_0x6eeb8
	moveperson $2, $14, $18
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $3
	end
; 0x6ec54

UnknownScript_0x6ec54: ; 0x6ec54
	2call UnknownScript_0x6eda1
	if_equal $1, UnknownScript_0x6ec85
	if_equal $2, UnknownScript_0x6ec74
	if_equal $3, UnknownScript_0x6ec96
	applymovement $2, MovementData_0x6eebd
	moveperson $2, $18, $23
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $6
	end
; 0x6ec74

UnknownScript_0x6ec74: ; 0x6ec74
	applymovement $2, MovementData_0x6eec7
	moveperson $2, $16, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $7
	end
; 0x6ec85

UnknownScript_0x6ec85: ; 0x6ec85
	applymovement $2, MovementData_0x6eecc
	moveperson $2, $1d, $16
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $4
	end
; 0x6ec96

UnknownScript_0x6ec96: ; 0x6ec96
	applymovement $2, MovementData_0x6eed2
	moveperson $2, $1d, $16
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $4
	end
; 0x6eca7

UnknownScript_0x6eca7: ; 0x6eca7
	2call UnknownScript_0x6eda1
	if_equal $3, UnknownScript_0x6ecbf
	applymovement $2, MovementData_0x6eee6
	moveperson $2, $16, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $7
	end
; 0x6ecbf

UnknownScript_0x6ecbf: ; 0x6ecbf
	applymovement $2, MovementData_0x6eeef
	moveperson $2, $1c, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $5
	end
; 0x6ecd0

UnknownScript_0x6ecd0: ; 0x6ecd0
	2call UnknownScript_0x6eda1
	if_equal $0, UnknownScript_0x6ecfd
	if_equal $2, UnknownScript_0x6ecec
	applymovement $2, MovementData_0x6eef8
	moveperson $2, $f, $1d
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $8
	end
; 0x6ecec

UnknownScript_0x6ecec: ; 0x6ecec
	applymovement $2, MovementData_0x6ef00
	moveperson $2, $18, $23
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $6
	end
; 0x6ecfd

UnknownScript_0x6ecfd: ; 0x6ecfd
	applymovement $2, MovementData_0x6ef09
	moveperson $2, $1c, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $5
	end
; 0x6ed0e

UnknownScript_0x6ed0e: ; 0x6ed0e
	2call UnknownScript_0x6eda1
	if_equal $1, UnknownScript_0x6ed3f
	if_equal $2, UnknownScript_0x6ed3f
	if_equal $3, UnknownScript_0x6ed2e
	applymovement $2, MovementData_0x6ef10
	moveperson $2, $a, $23
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $9
	end
; 0x6ed2e

UnknownScript_0x6ed2e: ; 0x6ed2e
	applymovement $2, MovementData_0x6ef18
	moveperson $2, $16, $1f
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $7
	end
; 0x6ed3f

UnknownScript_0x6ed3f: ; 0x6ed3f
	applymovement $2, MovementData_0x6ef1e
	moveperson $2, $f, $19
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $2
	end
; 0x6ed50

UnknownScript_0x6ed50: ; 0x6ed50
	2call UnknownScript_0x6eda1
	if_equal $0, UnknownScript_0x6ed85
	if_equal $3, UnknownScript_0x6ed74
	applymovement $2, MovementData_0x6ef23
	moveperson $2, $6, $1c
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $a
	appear $4
	setbit1 $06f7
	setbit1 $0029
	end
; 0x6ed74

UnknownScript_0x6ed74: ; 0x6ed74
	applymovement $2, MovementData_0x6ef33
	moveperson $2, $f, $1d
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $8
	end
; 0x6ed85

UnknownScript_0x6ed85: ; 0x6ed85
	applymovement $2, MovementData_0x6ef3d
	moveperson $2, $f, $1d
	disappear $2
	appear $2
	loadvar FarfetchdPosition, $8
	end
; 0x6ed96

UnknownScript_0x6ed96: ; 0x6ed96
	faceplayer
	loadfont
	2writetext UnknownText_0x6f086
	cry FARFETCH_D
	closetext
	loadmovesprites
	end
; 0x6eda1

UnknownScript_0x6eda1: ; 0x6eda1
	faceplayer
	loadfont
	2writetext UnknownText_0x6f086
	cry FARFETCH_D
	closetext
	loadmovesprites
	checkcode $9
	end
; 0x6edae

BlackBeltScript_0x6edae: ; 0x6edae
	faceplayer
	loadfont
	checkbit1 $0010
	iftrue UnknownScript_0x6edd8
	2writetext UnknownText_0x6f099
	keeptextopen
	verbosegiveitem HM_01, 1
	setbit1 $0010
	2writetext UnknownText_0x6f141
	closetext
	loadmovesprites
	setbit1 $06e9
	setbit1 $06f3
	setbit1 $06f4
	clearbit1 $06f5
	clearbit1 $06f6
	clearbit1 $06f7
	end
; 0x6edd8

UnknownScript_0x6edd8: ; 0x6edd8
	2writetext UnknownText_0x6f1c0
	closetext
	loadmovesprites
	end
; 0x6edde

RockerScript_0x6edde: ; 0x6edde
	faceplayer
	loadfont
	checkbit1 $005f
	iftrue UnknownScript_0x6edf3
	2writetext UnknownText_0x6f21b
	keeptextopen
	verbosegiveitem TM_02, 1
	iffalse UnknownScript_0x6edf7
	setbit1 $005f
UnknownScript_0x6edf3: ; 0x6edf3
	2writetext UnknownText_0x6f26d
	closetext
UnknownScript_0x6edf7: ; 0x6edf7
	loadmovesprites
	end
; 0x6edf9

TrainerBug_catcherWayne: ; 0x6edf9
	; bit/flag number
	dw $5c0

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
; 0x6ee05

Bug_catcherWayneScript: ; 0x6ee05
	talkaftercancel
	loadfont
	2writetext UnknownText_0x6f571
	closetext
	loadmovesprites
	end
; 0x6ee0d

LassScript_0x6ee0d: ; 0x6ee0d
	jumptextfaceplayer UnknownText_0x6f2af
; 0x6ee10

ItemFragment_0x6ee10: ; 0x6ee10
	db REVIVE, 1
; 0x6ee12

ItemFragment_0x6ee12: ; 0x6ee12
	db X_ATTACK, 1
; 0x6ee14

ItemFragment_0x6ee14: ; 0x6ee14
	db ANTIDOTE, 1
; 0x6ee16

ItemFragment_0x6ee16: ; 0x6ee16
	db ETHER, 1
; 0x6ee18

MapIlexForestSignpostItem1: ; 0x6ee18
	dw $0088
	db ETHER
	
; 0x6ee1b

MapIlexForestSignpostItem2: ; 0x6ee1b
	dw $0089
	db SUPER_POTION
	
; 0x6ee1e

MapIlexForestSignpostItem3: ; 0x6ee1e
	dw $008a
	db FULL_HEAL
; 0x6ee21

UnknownScript_0x6ee21: ; 0x6ee21
	jumpstd $000e
; 0x6ee24

MapIlexForestSignpost0Script: ; 0x6ee24
	jumptext UnknownText_0x6f2de
; 0x6ee27

MapIlexForestSignpost4Script: ; 0x6ee27
	checkbit1 $00c0
	iftrue UnknownScript_0x6ee30
	2jump UnknownScript_0x6ee35
; 0x6ee30

UnknownScript_0x6ee30: ; 0x6ee30
	checkitem GS_BALL
	iftrue UnknownScript_0x6ee38
UnknownScript_0x6ee35: ; 0x6ee35
	jumptext UnknownText_0x6f358
; 0x6ee38

UnknownScript_0x6ee38: ; 0x6ee38
	loadfont
	2writetext UnknownText_0x6f394
	yesorno
	iftrue UnknownScript_0x6ee42
	loadmovesprites
	end
; 0x6ee42

UnknownScript_0x6ee42: ; 0x6ee42
	takeitem GS_BALL, 1
	clearbit1 $00c0
	setbit1 $07a4
	disappear $8
	clearbit1 $06eb
	2writetext UnknownText_0x6f43b
	closetext
	loadmovesprites
	pause 20
	showemote $0, $0, 20
	special $006a
	applymovement $0, MovementData_0x6ef58
	pause 30
	spriteface $0, $0
	pause 20
	clearbit2 $0064
	special $008f
	loadpokedata CELEBI, 30
	startbattle
	returnafterbattle
	pause 20
	special $0090
	iffalse UnknownScript_0x6ee8e
	appear $7
	applymovement $7, MovementData_0x6ef4e
	loadfont
	2writetext UnknownText_0x6f452
	closetext
	loadmovesprites
	applymovement $7, MovementData_0x6ef53
	disappear $7
UnknownScript_0x6ee8e: ; 0x6ee8e
	end
; 0x6ee8f

MovementData_0x6ee8f: ; 0x6ee8f
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end
; 0x6ee95

MovementData_0x6ee95: ; 0x6ee95
	big_step_up
	big_step_up
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_down
	step_end
; 0x6ee9e

MovementData_0x6ee9e: ; 0x6ee9e
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
; 0x6eea4

MovementData_0x6eea4: ; 0x6eea4
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end
; 0x6eeab

MovementData_0x6eeab: ; 0x6eeab
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
; 0x6eeb1

MovementData_0x6eeb1: ; 0x6eeb1
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
; 0x6eeb8

MovementData_0x6eeb8: ; 0x6eeb8
	big_step_left
	jump_step_left
	big_step_left
	big_step_left
	step_end
; 0x6eebd

MovementData_0x6eebd: ; 0x6eebd
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
; 0x6eec7

MovementData_0x6eec7: ; 0x6eec7
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
; 0x6eecc

MovementData_0x6eecc: ; 0x6eecc
	big_step_up
	big_step_up
	big_step_up
	big_step_right
	big_step_up
	step_end
; 0x6eed2

MovementData_0x6eed2: ; 0x6eed2
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
; 0x6eee6

MovementData_0x6eee6: ; 0x6eee6
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_right
	big_step_up
	big_step_up
	step_end
; 0x6eeef

MovementData_0x6eeef: ; 0x6eeef
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end
; 0x6eef8

MovementData_0x6eef8: ; 0x6eef8
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end
; 0x6ef00

MovementData_0x6ef00: ; 0x6ef00
	big_step_down
	big_step_down
	big_step_left
	big_step_down
	big_step_down
	big_step_right
	big_step_right
	big_step_right
	step_end
; 0x6ef09

MovementData_0x6ef09: ; 0x6ef09
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end
; 0x6ef10

MovementData_0x6ef10: ; 0x6ef10
	big_step_down
	big_step_left
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
; 0x6ef18

MovementData_0x6ef18: ; 0x6ef18
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	big_step_right
	step_end
; 0x6ef1e

MovementData_0x6ef1e: ; 0x6ef1e
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	step_end
; 0x6ef23

MovementData_0x6ef23: ; 0x6ef23
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
; 0x6ef33

MovementData_0x6ef33: ; 0x6ef33
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
; 0x6ef3d

MovementData_0x6ef3d: ; 0x6ef3d
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
; 0x6ef4e

MovementData_0x6ef4e: ; 0x6ef4e
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x6ef53

MovementData_0x6ef53: ; 0x6ef53
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x6ef58

MovementData_0x6ef58: ; 0x6ef58
	fix_facing
	slow_step_down
	remove_fixed_facing
	step_end
; 0x6ef5c

UnknownText_0x6ef5c: ; 0x6ef5c
	db $0, "Oh, man… My boss", $4f
	db "is going to be", $55
	db "steaming…", $51
	db "The FARFETCH'D", $4f
	db "that CUTS trees", $51
	db "for charcoal took", $4f
	db "off on me.", $51
	db "I can't go looking", $4f
	db "for it here in the", $55
	db "ILEX FOREST.", $51
	db "It's too big, dark", $4f
	db "and scary for me…", $57
; 0x6f019

UnknownText_0x6f019: ; 0x6f019
	db $0, "Wow! Thanks a", $4f
	db "whole bunch!", $51
	db "My boss's #MON", $4f
	db "won't obey me be-", $55
	db "cause I don't have", $55
	db "a BADGE.", $57
; 0x6f06f

UnknownText_0x6f06f: ; 0x6f06f
	db $0, "It's the missing", $4f
	db "#MON!", $57
; 0x6f086

UnknownText_0x6f086: ; 0x6f086
	db $0, "FARFETCH'D: Kwaa!", $57
; 0x6f099

UnknownText_0x6f099: ; 0x6f099
	db $0, "Ah! My FARFETCH'D!", $51
	db "You found it for", $4f
	db "us, kid?", $51
	db "Without it, we", $4f
	db "wouldn't be able", $51
	db "to CUT trees for", $4f
	db "charcoal.", $51
	db "Thanks, kid!", $51
	db "Now, how can I", $4f
	db "thank you…", $51
	db "I know! Here, take", $4f
	db "this.", $57
; 0x6f141

UnknownText_0x6f141: ; 0x6f141
	db $0, "That's the CUT HM.", $4f
	db "Teach that to a", $51
	db "#MON to clear", $4f
	db "small trees.", $51
	db "Of course, you", $4f
	db "have to have the", $51
	db "GYM BADGE from", $4f
	db "AZALEA to use it.", $57
; 0x6f1c0

UnknownText_0x6f1c0: ; 0x6f1c0
	db $0, "Do you want to", $4f
	db "apprentice as a", $51
	db "charcoal maker", $4f
	db "with me?", $51
	db "You'll be first-", $4f
	db "rate in ten years!", $57
; 0x6f21b

UnknownText_0x6f21b: ; 0x6f21b
	db $0, "What am I doing?", $51
	db "I'm shaking trees", $4f
	db "using HEADBUTT.", $51
	db "It's fun. Here,", $4f
	db "you try it too!", $57
; 0x6f26d

UnknownText_0x6f26d: ; 0x6f26d
	db $0, "Rattle trees with", $4f
	db "HEADBUTT. Some-", $55
	db "times, sleeping", $55
	db "#MON fall out.", $57
; 0x6f2af

UnknownText_0x6f2af: ; 0x6f2af
	db $0, "Did something", $4f
	db "happen to the", $55
	db "forest's guardian?", $57
; 0x6f2de

UnknownText_0x6f2de: ; 0x6f2de
	db $0, "ILEX FOREST is", $4f
	db "so overgrown with", $51
	db "trees that you", $4f
	db "can't see the sky.", $51
	db "Please watch out", $4f
	db "for items that may", $55
	db "have been dropped.", $57
; 0x6f358

UnknownText_0x6f358: ; 0x6f358
	db $0, "ILEX FOREST", $4f
	db "SHRINE…", $51
	db "It's in honor of", $4f
	db "the forest's", $55
	db "protector…", $57
; 0x6f394

UnknownText_0x6f394: ; 0x6f394
	db $0, "ILEX FOREST", $4f
	db "SHRINE…", $51
	db "It's in honor of", $4f
	db "the forest's", $55
	db "protector…", $51
	db "Oh? What is this?", $51
	db "It's a hole.", $4f
	db "It looks like the", $51
	db "GS BALL would fit", $4f
	db "inside it.", $51
	db "Want to put the GS", $4f
	db "BALL here?", $57
; 0x6f43b

UnknownText_0x6f43b: ; 0x6f43b
	db $0, $52, " put in the", $4f
	db "GS BALL.", $57
; 0x6f452

UnknownText_0x6f452: ; 0x6f452
	db $0, "Whew, wasn't that", $4f
	db "something!", $51
	db $52, ", that was", $4f
	db "fantastic. Thanks!", $51
	db "The legends about", $4f
	db "that SHRINE were", $55
	db "real after all.", $51
	db "I feel inspired by", $4f
	db "what I just saw.", $51
	db "It motivates me to", $4f
	db "make better BALLS!", $51
	db "I'm going!", $57
; 0x6f515

Bug_catcherWayneSeenText: ; 0x6f515
	db $0, "Don't sneak up on", $4f
	db "me like that!", $51
	db "You frightened a", $4f
	db "#MON away!", $57
; 0x6f551

Bug_catcherWayneBeatenText: ; 0x6f551
	db $0, "I hadn't seen that", $4f
	db "#MON before…", $57
; 0x6f571

UnknownText_0x6f571: ; 0x6f571
	db $0, "A #MON I've", $4f
	db "never seen before", $51
	db "fell out of the", $4f
	db "tree when I used", $55
	db "HEADBUTT.", $51
	db "I ought to use", $4f
	db "HEADBUTT in other", $55
	db "places too.", $57
; 0x6f5e7

IlexForest_MapEventHeader: ; 0x6f5e7
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
; 0x6f6a4



