EcruteakHouse_MapScriptHeader: ; 0x98000
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x9800d, $0000
	dw UnknownScript_0x9800e, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x9800f
; 0x9800d

UnknownScript_0x9800d: ; 0x9800d
	end
; 0x9800e

UnknownScript_0x9800e: ; 0x9800e
	end
; 0x9800f

UnknownScript_0x9800f: ; 0x9800f
	checkbit1 $0335
	iftrue UnknownScript_0x98033
	checkbit1 $0334
	iftrue UnknownScript_0x98033
	checkbit1 $0021
	iftrue UnknownScript_0x98022
	return
; 0x98022

UnknownScript_0x98022: ; 0x98022
	clearbit1 $0766
	setbit1 $0767
	setbit1 $07b1
	checkitem CLEAR_BELL
	iftrue UnknownScript_0x98032
	dotrigger $0
UnknownScript_0x98032: ; 0x98032
	return
; 0x98033

UnknownScript_0x98033: ; 0x98033
	clearbit1 $07b1
	return
; 0x98037

UnknownScript_0x98037: ; 0x98037
	checkbit1 $0767
	iftrue UnknownScript_0x98061
	applymovement $3, MovementData_0x980c7
	moveperson $2, $4, $6
	appear $2
	pause 5
	disappear $3
	end
; 0x9804c

UnknownScript_0x9804c: ; 0x9804c
	checkbit1 $0766
	iftrue UnknownScript_0x98061
	applymovement $2, MovementData_0x980cc
	moveperson $3, $5, $6
	appear $3
	pause 5
	disappear $2
	end
; 0x98061

UnknownScript_0x98061: ; 0x98061
	end
; 0x98062

UnknownScript_0x98062: ; 0x98062
	faceplayer
	loadfont
	checkbit1 $0021
	iftrue UnknownScript_0x9807c
	checkbit2 $001e
	iftrue UnknownScript_0x98076
	2writetext UnknownText_0x980d1
	closetext
	loadmovesprites
	end
; 0x98076

UnknownScript_0x98076: ; 0x98076
	2writetext UnknownText_0x98131
	closetext
	loadmovesprites
	end
; 0x9807c

UnknownScript_0x9807c: ; 0x9807c
	checkbit1 $0334
	iftrue UnknownScript_0x980a4
	checkbit1 $0000
	iftrue UnknownScript_0x980aa
	checkitem CLEAR_BELL
	iftrue UnknownScript_0x98093
	2writetext UnknownText_0x981a4
	closetext
	loadmovesprites
	end
; 0x98093

UnknownScript_0x98093: ; 0x98093
	2writetext UnknownText_0x98250
	closetext
	loadmovesprites
	dotrigger $1
	setbit1 $0767
	clearbit1 $0766
	setbit1 $0000
	end
; 0x980a4

UnknownScript_0x980a4: ; 0x980a4
	2writetext UnknownText_0x9837e
	closetext
	loadmovesprites
	end
; 0x980aa

UnknownScript_0x980aa: ; 0x980aa
	2writetext UnknownText_0x98391
	closetext
	loadmovesprites
	end
; 0x980b0

UnknownScript_0x980b0: ; 0x980b0
	faceplayer
	loadfont
	checkbit1 $0078
	iftrue UnknownScript_0x980be
	2writetext UnknownText_0x9840b
	closetext
	loadmovesprites
	end
; 0x980be

UnknownScript_0x980be: ; 0x980be
	2writetext UnknownText_0x9846f
	closetext
	loadmovesprites
	end
; 0x980c4

UnknownScript_0x980c4: ; 0x980c4
	jumptextfaceplayer UnknownText_0x984ab
; 0x980c7

MovementData_0x980c7: ; 0x980c7
	fix_facing
	big_step_left
	remove_fixed_facing
	turn_head_down
	step_end
; 0x980cc

MovementData_0x980cc: ; 0x980cc
	fix_facing
	big_step_right
	remove_fixed_facing
	turn_head_down
	step_end
; 0x980d1

UnknownText_0x980d1: ; 0x980d1
	db $0, "TIN TOWER is off", $4f
	db "limits to anyone", $51
	db "without ECRUTEAK", $4f
	db "GYM's BADGE.", $51
	db "Sorry, but you'll", $4f
	db "have to leave.", $57
; 0x98131

UnknownText_0x98131: ; 0x98131
	db $0, "TIN TOWER is off", $4f
	db "limits to anyone", $51
	db "without ECRUTEAK", $4f
	db "GYM's BADGE.", $51
	db "Ah!", $51
	db "ECRUTEAK's GYM", $4f
	db "BADGE! Please, go", $55
	db "right through.", $57
; 0x981a4

UnknownText_0x981a4: ; 0x981a4
	db $0, "A momentous event", $4f
	db "has occurred.", $51
	db "I beg your pardon,", $4f
	db "but I must ask you", $55
	db "to leave.", $51
	db "…What soothes the", $4f
	db "soul…", $51
	db "The WISE TRIO say", $4f
	db "things that are so", $51
	db "very difficult to", $4f
	db "understand…", $57
; 0x98250

UnknownText_0x98250: ; 0x98250
	db $0, "A momentous event", $4f
	db "has occurred.", $51
	db "I beg your pardon,", $4f
	db "but I must ask you", $55
	db "to leave.", $51
	db $56, $56, $56, $51
	db "Ah!", $51
	db "The sound of that", $4f
	db "CLEAR BELL!", $51
	db "It… It's sublime!", $51
	db "I've never heard", $4f
	db "so beautiful a", $55
	db "sound before!", $51
	db "That bell's chime", $4f
	db "is indicative of", $55
	db "the bearer's soul.", $51
	db "You…", $51
	db "You may be able to", $4f
	db "make it through", $55
	db "TIN TOWER.", $51
	db "Please, do go on.", $57
; 0x9837e

UnknownText_0x9837e: ; 0x9837e
	db $0, "Please, do go on.", $57
; 0x98391

UnknownText_0x98391: ; 0x98391
	db $0, "That bell's chime", $4f
	db "is indicative of", $55
	db "the bearer's soul.", $51
	db "You…", $51
	db "You may be able to", $4f
	db "make it through", $55
	db "TIN TOWER.", $51
	db "Please, do go on.", $57
; 0x9840b

UnknownText_0x9840b: ; 0x9840b
	db $0, "The TIN TOWER", $4f
	db "ahead is a nine-", $51
	db "tier tower of", $4f
	db "divine beauty.", $51
	db "It soothes the", $4f
	db "soul of all who", $55
	db "see it.", $57
; 0x9846f

UnknownText_0x9846f: ; 0x9846f
	db $0, "The TIN TOWER", $4f
	db "shook! A #MON", $51
	db "must have returned", $4f
	db "to the top!", $57
; 0x984ab

UnknownText_0x984ab: ; 0x984ab
	db $0, "Two towers…", $4f
	db "Two #MON…", $51
	db "But when one", $4f
	db "burned down, both", $51
	db "#MON flew away,", $4f
	db "never to return.", $57
; 0x98502

EcruteakHouse_MapEventHeader: ; 0x98502
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $11, $4, 3, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $11, $5, 3, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $3, $5, 4, GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE
	warp_def $f, $11, 3, GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE
	warp_def $3, $11, 3, GROUP_WISE_TRIOS_ROOM, MAP_WISE_TRIOS_ROOM

	; xy triggers
	db 2
	xy_trigger 0, $7, $4, $0, UnknownScript_0x98037, $0, $0
	xy_trigger 0, $7, $5, $0, UnknownScript_0x9804c, $0, $0

	; signposts
	db 0

	; people-events
	db 4
	person_event $3e, 10, 8, $6, $0, 255, 255, $0, 0, UnknownScript_0x98062, $0766
	person_event $3e, 10, 9, $6, $0, 255, 255, $0, 0, UnknownScript_0x98062, $0767
	person_event $3e, 13, 10, $2, $11, 255, 255, $0, 0, UnknownScript_0x980b0, $07b1
	person_event $2f, 15, 7, $2, $11, 255, 255, $0, 0, UnknownScript_0x980c4, $07b1
; 0x98565

