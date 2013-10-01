SaffronTrainStation_MapScriptHeader: ; 0x18a817
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x18a81d, $0000

	; callback count
	db 0
; 0x18a81d

UnknownScript_0x18a81d: ; 0x18a81d
	end
; 0x18a81e

OfficerScript_0x18a81e: ; 0x18a81e
	faceplayer
	loadfont
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x18a82c
	2writetext UnknownText_0x18a8a9
	closetext
	loadmovesprites
	end
; 0x18a82c

UnknownScript_0x18a82c: ; 0x18a82c
	2writetext UnknownText_0x18a8dd
	yesorno
	iffalse UnknownScript_0x18a85c
	checkitem PASS
	iffalse UnknownScript_0x18a856
	2writetext UnknownText_0x18a917
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x18a88f
	applymovement $0, MovementData_0x18a898
	writebyte $1
	special $0023
	warpcheck
	newloadmap $f9
	applymovement $0, MovementData_0x18a854
	wait $14
	end
; 0x18a854

MovementData_0x18a854: ; 0x18a854
	turn_head_down
	step_end
; 0x18a856

UnknownScript_0x18a856: ; 0x18a856
	2writetext UnknownText_0x18a956
	closetext
	loadmovesprites
	end
; 0x18a85c

UnknownScript_0x18a85c: ; 0x18a85c
	2writetext UnknownText_0x18a978
	closetext
	loadmovesprites
	end
; 0x18a862

UnknownScript_0x18a862: ; 0x18a862
	applymovement $2, MovementData_0x18a88f
	applymovement $0, MovementData_0x18a8a1
	applymovement $2, MovementData_0x18a894
	loadfont
	2writetext UnknownText_0x18a993
	closetext
	loadmovesprites
	end
; 0x18a875

GymGuyScript_0x18a875: ; 0x18a875
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x18a883
	2writetext UnknownText_0x18a9ca
	closetext
	loadmovesprites
	end
; 0x18a883

UnknownScript_0x18a883: ; 0x18a883
	2writetext UnknownText_0x18aa61
	closetext
	loadmovesprites
	end
; 0x18a889

TeacherScript_0x18a889: ; 0x18a889
	jumptextfaceplayer UnknownText_0x18aaab
; 0x18a88c

LassScript_0x18a88c: ; 0x18a88c
	jumptextfaceplayer UnknownText_0x18ab20
; 0x18a88f

MovementData_0x18a88f: ; 0x18a88f
	step_up
	step_up
	step_right
	turn_head_left
	step_end
; 0x18a894

MovementData_0x18a894: ; 0x18a894
	step_left
	step_down
	step_down
	step_end
; 0x18a898

MovementData_0x18a898: ; 0x18a898
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end
; 0x18a8a1

MovementData_0x18a8a1: ; 0x18a8a1
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	turn_head_up
	step_end
; 0x18a8a9

UnknownText_0x18a8a9: ; 0x18a8a9
	db $0, "I'm sorry, but the", $4f
	db "MAGNET TRAIN isn't", $55
	db "operating now.", $57
; 0x18a8dd

UnknownText_0x18a8dd: ; 0x18a8dd
	db $0, "We'll soon depart", $4f
	db "for GOLDENROD.", $51
	db "Are you coming on", $4f
	db "board?", $57
; 0x18a917

UnknownText_0x18a917: ; 0x18a917
	db $0, "May I see your", $4f
	db "rail PASS, please?", $51
	db "OK. Right this", $4f
	db "way, please.", $57
; 0x18a956

UnknownText_0x18a956: ; 0x18a956
	db $0, "Sorry, but you", $4f
	db "don't have a PASS.", $57
; 0x18a978

UnknownText_0x18a978: ; 0x18a978
	db $0, "We hope to see you", $4f
	db "again.", $57
; 0x18a993

UnknownText_0x18a993: ; 0x18a993
	db $0, "We have arrived in", $4f
	db "SAFFRON.", $51
	db "We hope to see you", $4f
	db "again.", $57
; 0x18a9ca

UnknownText_0x18a9ca: ; 0x18a9ca
	db $0, "The MAGNET TRAIN", $4f
	db "is a super-modern", $51
	db "rail liner that", $4f
	db "uses electricity", $51
	db "and magnets to", $4f
	db "attain incredible", $55
	db "speed.", $51
	db "However, if there", $4f
	db "isn't any elec-", $55
	db "tricity…", $57
; 0x18aa61

UnknownText_0x18aa61: ; 0x18aa61
	db $0, "Whew…", $51
	db "How many times", $4f
	db "have I gone back", $51
	db "and forth between", $4f
	db "KANTO and JOHTO?", $57
; 0x18aaab

UnknownText_0x18aaab: ; 0x18aaab
	db $0, "Before the MAGNET", $4f
	db "TRAIN STATION was", $51
	db "built, there was a", $4f
	db "house there.", $51
	db "A little girl", $4f
	db "named COPYCAT used", $55
	db "to live there.", $57
; 0x18ab20

UnknownText_0x18ab20: ; 0x18ab20
	db $0, "Hi. Do you have a", $4f
	db "rail PASS? I have", $51
	db "one. All the peo-", $4f
	db "ple in SAFFRON who", $51
	db "ride the MAGNET", $4f
	db "TRAIN have PASSES.", $57
; 0x18ab8d

SaffronTrainStation_MapEventHeader: ; 0x18ab8d
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $11, $8, 6, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $11, $9, 6, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $5, $6, 4, GROUP_GOLDENROD_MAGNET_TRAIN_STATION, MAP_GOLDENROD_MAGNET_TRAIN_STATION
	warp_def $5, $b, 3, GROUP_GOLDENROD_MAGNET_TRAIN_STATION, MAP_GOLDENROD_MAGNET_TRAIN_STATION

	; xy triggers
	db 1
	xy_trigger 0, $6, $b, $0, UnknownScript_0x18a862, $0, $0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_OFFICER, 13, 13, $6, $0, 255, 255, $0, 0, OfficerScript_0x18a81e, $ffff
	person_event SPRITE_GYM_GUY, 18, 14, $2, $11, 255, 255, $0, 0, GymGuyScript_0x18a875, $ffff
	person_event SPRITE_TEACHER, 15, 10, $9, $0, 255, 255, $0, 0, TeacherScript_0x18a889, $0772
	person_event SPRITE_LASS, 14, 10, $7, $0, 255, 255, $a0, 0, LassScript_0x18a88c, $0772
; 0x18abe3

