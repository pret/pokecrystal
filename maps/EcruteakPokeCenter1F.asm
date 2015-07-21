EcruteakPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x98e5f, $0000
	dw UnknownScript_0x98e63, $0000

.MapCallbacks:
	db 0

UnknownScript_0x98e5f:
	priorityjump UnknownScript_0x98e64
	end

UnknownScript_0x98e63:
	end

UnknownScript_0x98e64:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear $6
	waitbutton
	applymovement $6, MovementData_0x98ec5
	applymovement $0, MovementData_0x98ed4
	spriteface $2, UP
	pause 10
	spriteface $2, DOWN
	pause 30
	spriteface $2, UP
	pause 10
	spriteface $2, DOWN
	pause 20
	spriteface $6, DOWN
	pause 10
	loadfont
	writetext UnknownText_0x98ed8
	keeptextopen
	jump UnknownScript_0x98e95

UnknownScript_0x98e95:
	writetext UnknownText_0x98f22
	closetext
	loadmovesprites
	spriteface $0, DOWN
	applymovement $6, MovementData_0x98ece
	playsound SFX_EXIT_BUILDING
	disappear $6
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	dotrigger $1
	waitbutton
	end

NurseScript_0x98eb0:
	jumpstd pokecenternurse

PokefanMScript_0x98eb3:
	special Function10630f
	iftrue UnknownScript_0x98ebc
	jumptextfaceplayer UnknownText_0x99155

UnknownScript_0x98ebc:
	jumptextfaceplayer UnknownText_0x991aa

CooltrainerFScript_0x98ebf:
	jumptextfaceplayer UnknownText_0x99240

GymGuyScript_0x98ec2:
	jumptextfaceplayer UnknownText_0x99286

MovementData_0x98ec5:
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_right
	turn_head_up
	step_end

MovementData_0x98ece:
	step_right
	step_down
	step_down
	step_down
	step_down
	step_end

MovementData_0x98ed4:
	step_up
	step_up
	step_up
	step_end

UnknownText_0x98ed8:
	text "Hi, I'm BILL. And"
	line "who are you?"

	para "Hmm, <PLAYER>, huh?"
	line "You've come at the"
	cont "right time."
	done

UnknownText_0x98f22:
	text "I just finished"
	line "adjustments on my"
	cont "TIME CAPSULE."

	para "You know that"
	line "#MON can be"
	cont "traded, right?"

	para "My TIME CAPSULE"
	line "was developed to"

	para "enable trades with"
	line "the past."

	para "But you can't send"
	line "anything that"

	para "didn't exist in"
	line "the past."

	para "If you did, the PC"
	line "in the past would"
	cont "have a breakdown."

	para "So you have to"
	line "remove anything"

	para "that wasn't around"
	line "in the past."

	para "Put simply, no"
	line "sending new moves"

	para "or new #MON in"
	line "the TIME CAPSULE."

	para "Don't you worry."
	line "I'm done with the"
	cont "adjustments."

	para "Tomorrow, TIME"
	line "CAPSULES will be"

	para "running at all"
	line "#MON CENTERS."

	para "I have to hurry on"
	line "back to GOLDENROD"
	cont "and see my folks."

	para "Buh-bye!"
	done

UnknownText_0x99155:
	text "The way the KIMONO"
	line "GIRLS dance is"

	para "marvelous. Just"
	line "like the way they"
	cont "use their #MON."
	done

UnknownText_0x991aa:
	text "You must be hoping"
	line "to battle more"

	para "people, right?"
	line "There's apparently"

	para "some place where"
	line "trainers gather."

	para "Where, you ask?"

	para "It's a little past"
	line "OLIVINE CITY."
	done

UnknownText_0x99240:
	text "MORTY, the GYM"
	line "LEADER, is soooo"
	cont "cool."

	para "His #MON are"
	line "really tough too."
	done

UnknownText_0x99286:
	text "LAKE OF RAGE…"

	para "The appearance of"
	line "a GYARADOS swarm…"

	para "I smell a conspir-"
	line "acy. I know it!"
	done

EcruteakPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 6, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $7, $4, 6, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 5
	person_event SPRITE_NURSE, 5, 7, OW_UP | $2, $0, -1, -1, $0, 0, NurseScript_0x98eb0, -1
	person_event SPRITE_POKEFAN_M, 10, 11, OW_LEFT | $2, $0, -1, -1, $0, 0, PokefanMScript_0x98eb3, -1
	person_event SPRITE_COOLTRAINER_F, 8, 5, OW_DOWN | $3, $0, -1, -1, $0, 0, CooltrainerFScript_0x98ebf, -1
	person_event SPRITE_GYM_GUY, 5, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, GymGuyScript_0x98ec2, -1
	person_event SPRITE_BILL, 11, 4, OW_LEFT | $1, $0, -1, -1, $0, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
