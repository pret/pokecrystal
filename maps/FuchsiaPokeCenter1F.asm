FuchsiaPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x196458, $0000

.MapCallbacks:
	db 0

UnknownScript_0x196458:
	end

NurseScript_0x196459:
	jumpstd pokecenternurse

CooltrainerMScript_0x19645c:
	jumptextfaceplayer UnknownText_0x196494

CooltrainerFScript_0x19645f:
	jumptextfaceplayer UnknownText_0x1964dc

JanineImpersonatorScript_0x196462:
	faceplayer
	loadfont
	writetext UnknownText_0x19652e
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x196486
	faceplayer
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_JANINE
	special RunCallback_04
	loadfont
	writetext UnknownText_0x19654e
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x196486
	faceplayer
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
	special RunCallback_04
	end

MovementData_0x196486:
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

UnknownText_0x196494:
	text "Hey! You have a"
	line "brand new kind of"
	cont "#DEX."

	para "Did PROF.OAK give"
	line "that to you?"
	done

UnknownText_0x1964dc:
	text "I got quite a"
	line "shock at the GYM."

	para "There were all"
	line "these girls who"
	cont "looked identical."
	done

UnknownText_0x19652e:
	text "I'm JANINE! Hocus-"
	line "pocus… Poof!"
	done

UnknownText_0x19654e:
	text "See? I look just"
	line "like her now!"
	done

FuchsiaPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 5, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $4, 5, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 5, 7, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, NurseScript_0x196459, -1
	person_event SPRITE_COOLTRAINER_M, 8, 12, OW_UP | $1, $1, -1, -1, $0, 0, CooltrainerMScript_0x19645c, -1
	person_event SPRITE_COOLTRAINER_F, 8, 5, OW_UP | $1, $1, -1, -1, $0, 0, CooltrainerFScript_0x19645f, -1
	person_event SPRITE_JANINE_IMPERSONATOR, 7, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, JanineImpersonatorScript_0x196462, -1
