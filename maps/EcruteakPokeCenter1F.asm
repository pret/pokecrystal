EcruteakPokeCenter1F_MapScriptHeader: ; 0x98e55
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x98e5f, $0000
	dw UnknownScript_0x98e63, $0000

	; callback count
	db 0
; 0x98e5f

UnknownScript_0x98e5f: ; 0x98e5f
	priorityjump UnknownScript_0x98e64
	end
; 0x98e63

UnknownScript_0x98e63: ; 0x98e63
	end
; 0x98e64

UnknownScript_0x98e64: ; 0x98e64
	pause 30
	playsound SFX_EXIT_BUILDING
	appear $6
	waitbutton
	applymovement $6, MovementData_0x98ec5
	applymovement $0, MovementData_0x98ed4
	spriteface $2, $1
	pause 10
	spriteface $2, $0
	pause 30
	spriteface $2, $1
	pause 10
	spriteface $2, $0
	pause 20
	spriteface $6, $0
	pause 10
	loadfont
	2writetext UnknownText_0x98ed8
	keeptextopen
	2jump UnknownScript_0x98e95
; 0x98e95

UnknownScript_0x98e95: ; 0x98e95
	2writetext UnknownText_0x98f22
	closetext
	loadmovesprites
	spriteface $0, $0
	applymovement $6, MovementData_0x98ece
	playsound SFX_EXIT_BUILDING
	disappear $6
	clearevent $0712
	setflag $0053
	dotrigger $1
	waitbutton
	end
; 0x98eb0

NurseScript_0x98eb0: ; 0x98eb0
	jumpstd $0000
; 0x98eb3

PokefanMScript_0x98eb3: ; 0x98eb3
	special $00a0
	iftrue UnknownScript_0x98ebc
	jumptextfaceplayer UnknownText_0x99155
; 0x98ebc

UnknownScript_0x98ebc: ; 0x98ebc
	jumptextfaceplayer UnknownText_0x991aa
; 0x98ebf

CooltrainerFScript_0x98ebf: ; 0x98ebf
	jumptextfaceplayer UnknownText_0x99240
; 0x98ec2

GymGuyScript_0x98ec2: ; 0x98ec2
	jumptextfaceplayer UnknownText_0x99286
; 0x98ec5

MovementData_0x98ec5: ; 0x98ec5
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_right
	turn_head_up
	step_end
; 0x98ece

MovementData_0x98ece: ; 0x98ece
	step_right
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x98ed4

MovementData_0x98ed4: ; 0x98ed4
	step_up
	step_up
	step_up
	step_end
; 0x98ed8

UnknownText_0x98ed8: ; 0x98ed8
	text "Hi, I'm BILL. And"
	line "who are you?"

	para "Hmm, ", $52, ", huh?"
	line "You've come at the"
	cont "right time."
	done
; 0x98f22

UnknownText_0x98f22: ; 0x98f22
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
; 0x99155

UnknownText_0x99155: ; 0x99155
	text "The way the KIMONO"
	line "GIRLS dance is"

	para "marvelous. Just"
	line "like the way they"
	cont "use their #MON."
	done
; 0x991aa

UnknownText_0x991aa: ; 0x991aa
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
; 0x99240

UnknownText_0x99240: ; 0x99240
	text "MORTY, the GYM"
	line "LEADER, is soooo"
	cont "cool."

	para "His #MON are"
	line "really tough too."
	done
; 0x99286

UnknownText_0x99286: ; 0x99286
	text "LAKE OF RAGE…"

	para "The appearance of"
	line "a GYARADOS swarm…"

	para "I smell a conspir-"
	line "acy. I know it!"
	done
; 0x992dc

EcruteakPokeCenter1F_MapEventHeader: ; 0x992dc
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 6, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $7, $4, 6, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x98eb0, $ffff
	person_event SPRITE_POKEFAN_M, 10, 11, $a, $0, 255, 255, $0, 0, PokefanMScript_0x98eb3, $ffff
	person_event SPRITE_COOLTRAINER_F, 8, 5, $3, $0, 255, 255, $0, 0, CooltrainerFScript_0x98ebf, $ffff
	person_event SPRITE_GYM_GUY, 5, 11, $6, $0, 255, 255, $a0, 0, GymGuyScript_0x98ec2, $ffff
	person_event SPRITE_BILL, 11, 4, $9, $0, 255, 255, $0, 0, ObjectEvent, $0713
; 0x99332

