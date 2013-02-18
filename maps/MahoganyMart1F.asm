MahoganyMart1F_MapScriptHeader: ; 0x6c349
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x6c356, $0000
	dw UnknownScript_0x6c357, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x6c35b
; 0x6c356

UnknownScript_0x6c356: ; 0x6c356
	end
; 0x6c357

UnknownScript_0x6c357: ; 0x6c357
	priorityjump UnknownScript_0x6c38f
	end
; 0x6c35b

UnknownScript_0x6c35b: ; 0x6c35b
	checkbit1 $02e2
	iftrue UnknownScript_0x6c362
	return
; 0x6c362

UnknownScript_0x6c362: ; 0x6c362
	changeblock $6, $2, $1e
	return
; 0x6c367

UnknownScript_0x6c367: ; 0x6c367
	faceplayer
	loadfont
	checkbit1 $0060
	iftrue UnknownScript_0x6c375
	pokemart $0, $000f
	loadmovesprites
	end
; 0x6c375

UnknownScript_0x6c375: ; 0x6c375
	2writetext UnknownText_0x6c46b
	closetext
	loadmovesprites
	end
; 0x6c37b

UnknownScript_0x6c37b: ; 0x6c37b
	faceplayer
	loadfont
	checkbit1 $0060
	iftrue UnknownScript_0x6c389
	2writetext UnknownText_0x6c494
	closetext
	loadmovesprites
	end
; 0x6c389

UnknownScript_0x6c389: ; 0x6c389
	2writetext UnknownText_0x6c501
	closetext
	loadmovesprites
	end
; 0x6c38f

UnknownScript_0x6c38f: ; 0x6c38f
	pause 15
	loadfont
	2writetext UnknownText_0x6c52a
	pause 15
	loadmovesprites
	playsound $0041
	applymovement $5, MovementData_0x6c3f6
	applymovement $3, MovementData_0x6c3fb
	pause 15
	disappear $5
	pause 15
	applymovement $4, MovementData_0x6c407
	loadfont
	2writetext UnknownText_0x6c549
	closetext
	loadmovesprites
	follow $4, $0
	applymovement $4, MovementData_0x6c40a
	applymovement $2, MovementData_0x6c403
	applymovement $4, MovementData_0x6c40e
	stopfollow
	loadfont
	2writetext UnknownText_0x6c59e
	closetext
	showemote $0, $2, 10
	playsound $002a
	changeblock $6, $2, $1e
	reloadmappart
	loadmovesprites
	setbit1 $02e2
	spriteface $4, $2
	loadfont
	2writetext UnknownText_0x6c5ba
	closetext
	loadmovesprites
	applymovement $4, MovementData_0x6c412
	playsound $0023
	disappear $4
	dotrigger $0
	waitbutton
	end
; 0x6c3ee

UnknownScript_0x6c3ee: ; 0x6c3ee
	faceplayer
	loadfont
	pokemart $0, $0010
	loadmovesprites
	end
; 0x6c3f6

MovementData_0x6c3f6: ; 0x6c3f6
	fix_facing
	big_step_left
	big_step_right
	remove_fixed_facing
	step_end
; 0x6c3fb

MovementData_0x6c3fb: ; 0x6c3fb
	fix_facing
	big_step_left
	remove_fixed_facing
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_end
; 0x6c403

MovementData_0x6c403: ; 0x6c403
	fix_facing
	big_step_left
	remove_fixed_facing
	step_end
; 0x6c407

MovementData_0x6c407: ; 0x6c407
	slow_step_left
	turn_head_down
	step_end
; 0x6c40a

MovementData_0x6c40a: ; 0x6c40a
	slow_step_right
	slow_step_up
	slow_step_up
	step_end
; 0x6c40e

MovementData_0x6c40e: ; 0x6c40e
	slow_step_up
	slow_step_right
	slow_step_right
	step_end
; 0x6c412

MovementData_0x6c412: ; 0x6c412
	slow_step_right
	step_end
; 0x6c414

UnknownText_0x6c414: ; 0x6c414
	db $0, "Hello, kiddo!", $51
	db "How would you like", $4f
	db "some RAGECANDYBAR?", $51
	db "It's the thing to", $4f
	db "eat in MAHOGANY!", $57
; 0x6c46b

UnknownText_0x6c46b: ; 0x6c46b
	db $0, "Arrgh… You found", $4f
	db "the secret stair-", $55
	db "way…", $57
; 0x6c494

UnknownText_0x6c494: ; 0x6c494
	db $0, "Heheh! The experi-", $4f
	db "ment worked like a", $55
	db "charm.", $51
	db "MAGIKARP are just", $4f
	db "worthless, but", $51
	db "GYARADOS are big", $4f
	db "moneymakers.", $57
; 0x6c501

UnknownText_0x6c501: ; 0x6c501
	db $0, "Urrgh…", $51
	db "That guy's dragon", $4f
	db "#MON are tough…", $57
; 0x6c52a

UnknownText_0x6c52a: ; 0x6c52a
	db $0, "LANCE: DRAGONITE,", $4f
	db "HYPER BEAM.", $57
; 0x6c549

UnknownText_0x6c549: ; 0x6c549
	db $0, "What took you,", $4f
	db $14, "?", $51
	db "Just as I thought,", $4f
	db "that strange radio", $51
	db "signal is coming", $4f
	db "from here.", $57
; 0x6c59e

UnknownText_0x6c59e: ; 0x6c59e
	db $0, "The stairs are", $4f
	db "right here.", $57
; 0x6c5ba

UnknownText_0x6c5ba: ; 0x6c5ba
	db $0, "LANCE: ", $14, ", we", $4f
	db "should split up to", $51
	db "check this place.", $4f
	db "I'll go first.", $57
; 0x6c5fb

MahoganyMart1F_MapEventHeader: ; 0x6c5fb
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $7, $4, 1, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $3, $7, 1, GROUP_TEAM_ROCKET_BASE_B1F, MAP_TEAM_ROCKET_BASE_B1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event $4b, 7, 8, $6, $0, 255, 255, $0, 0, UnknownScript_0x6c367, $06da
	person_event $41, 10, 5, $3, $0, 255, 255, $0, 0, UnknownScript_0x6c37b, $06da
	person_event $1e, 10, 8, $8, $0, 255, 255, $0, 0, ObjectEvent, $06d5
	person_event $4f, 10, 7, $8, $0, 255, 255, $0, 0, ObjectEvent, $06d5
	person_event $30, 7, 5, $9, $0, 255, 255, $0, 0, UnknownScript_0x6c3ee, $0736
; 0x6c651

