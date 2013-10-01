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
	playsound $0023
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
	playsound $0023
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
	db $0, "Hi, I'm BILL. And", $4f
	db "who are you?", $51
	db "Hmm, ", $52, ", huh?", $4f
	db "You've come at the", $55
	db "right time.", $57
; 0x98f22

UnknownText_0x98f22: ; 0x98f22
	db $0, "I just finished", $4f
	db "adjustments on my", $55
	db "TIME CAPSULE.", $51
	db "You know that", $4f
	db "#MON can be", $55
	db "traded, right?", $51
	db "My TIME CAPSULE", $4f
	db "was developed to", $51
	db "enable trades with", $4f
	db "the past.", $51
	db "But you can't send", $4f
	db "anything that", $51
	db "didn't exist in", $4f
	db "the past.", $51
	db "If you did, the PC", $4f
	db "in the past would", $55
	db "have a breakdown.", $51
	db "So you have to", $4f
	db "remove anything", $51
	db "that wasn't around", $4f
	db "in the past.", $51
	db "Put simply, no", $4f
	db "sending new moves", $51
	db "or new #MON in", $4f
	db "the TIME CAPSULE.", $51
	db "Don't you worry.", $4f
	db "I'm done with the", $55
	db "adjustments.", $51
	db "Tomorrow, TIME", $4f
	db "CAPSULES will be", $51
	db "running at all", $4f
	db "#MON CENTERS.", $51
	db "I have to hurry on", $4f
	db "back to GOLDENROD", $55
	db "and see my folks.", $51
	db "Buh-bye!", $57
; 0x99155

UnknownText_0x99155: ; 0x99155
	db $0, "The way the KIMONO", $4f
	db "GIRLS dance is", $51
	db "marvelous. Just", $4f
	db "like the way they", $55
	db "use their #MON.", $57
; 0x991aa

UnknownText_0x991aa: ; 0x991aa
	db $0, "You must be hoping", $4f
	db "to battle more", $51
	db "people, right?", $4f
	db "There's apparently", $51
	db "some place where", $4f
	db "trainers gather.", $51
	db "Where, you ask?", $51
	db "It's a little past", $4f
	db "OLIVINE CITY.", $57
; 0x99240

UnknownText_0x99240: ; 0x99240
	db $0, "MORTY, the GYM", $4f
	db "LEADER, is soooo", $55
	db "cool.", $51
	db "His #MON are", $4f
	db "really tough too.", $57
; 0x99286

UnknownText_0x99286: ; 0x99286
	db $0, "LAKE OF RAGE…", $51
	db "The appearance of", $4f
	db "a GYARADOS swarm…", $51
	db "I smell a conspir-", $4f
	db "acy. I know it!", $57
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

