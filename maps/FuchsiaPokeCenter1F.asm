FuchsiaPokeCenter1F_MapScriptHeader: ; 0x196452
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x196458, $0000

	; callback count
	db 0
; 0x196458

UnknownScript_0x196458: ; 0x196458
	end
; 0x196459

NurseScript_0x196459: ; 0x196459
	jumpstd $0000
; 0x19645c

CooltrainerMScript_0x19645c: ; 0x19645c
	jumptextfaceplayer UnknownText_0x196494
; 0x19645f

CooltrainerFScript_0x19645f: ; 0x19645f
	jumptextfaceplayer UnknownText_0x1964dc
; 0x196462

JanineImpersonatorScript_0x196462: ; 0x196462
	faceplayer
	loadfont
	writetext UnknownText_0x19652e
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x196486
	faceplayer
	variablesprite $c, $a
	special Function14209
	loadfont
	writetext UnknownText_0x19654e
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x196486
	faceplayer
	variablesprite $c, $28
	special Function14209
	end
; 0x196486

MovementData_0x196486: ; 0x196486
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end
; 0x196494

UnknownText_0x196494: ; 0x196494
	text "Hey! You have a"
	line "brand new kind of"
	cont "#DEX."

	para "Did PROF.OAK give"
	line "that to you?"
	done
; 0x1964dc

UnknownText_0x1964dc: ; 0x1964dc
	text "I got quite a"
	line "shock at the GYM."

	para "There were all"
	line "these girls who"
	cont "looked identical."
	done
; 0x19652e

UnknownText_0x19652e: ; 0x19652e
	text "I'm JANINE! Hocus-"
	line "pocus… Poof!"
	done
; 0x19654e

UnknownText_0x19654e: ; 0x19654e
	text "See? I look just"
	line "like her now!"
	done
; 0x19656e

FuchsiaPokeCenter1F_MapEventHeader: ; 0x19656e
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 5, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $4, 5, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $a0, 0, NurseScript_0x196459, $ffff
	person_event SPRITE_COOLTRAINER_M, 8, 12, $5, $1, 255, 255, $0, 0, CooltrainerMScript_0x19645c, $ffff
	person_event SPRITE_COOLTRAINER_F, 8, 5, $5, $1, 255, 255, $0, 0, CooltrainerFScript_0x19645f, $ffff
	person_event SPRITE_JANINE_IMPERSONATOR, 7, 9, $6, $0, 255, 255, $90, 0, JanineImpersonatorScript_0x196462, $ffff
; 0x1965b7

