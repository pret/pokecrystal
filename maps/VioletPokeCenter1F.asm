VioletPokeCenter1F_MapScriptHeader: ; 0x694c7
	; trigger count
	db 0

	; callback count
	db 0
; 0x694c9

NurseScript_0x694c9: ; 0x694c9
	jumpstd $0000
; 0x694cc

ScientistScript_0x694cc: ; 0x694cc
	faceplayer
	loadfont
	checkbit1 $002c
	iftrue UnknownScript_0x6953a
	2writetext UnknownText_0x69555
UnknownScript_0x694d7: ; 0x694d7
	yesorno
	iffalse UnknownScript_0x69531
	checkcode $1
	if_equal $6, UnknownScript_0x6952b
	giveegg TOGEPI, 5
	stringtotext .eggname, $1
	2call UnknownScript_0x69527
	setbit1 $002d
	clearbit1 $0701
	clearbit1 $0054
	domaptrigger GROUP_ROUTE_32, MAP_ROUTE_32, $1
	2writetext UnknownText_0x695c5
	closetext
	loadmovesprites
	checkcode $9
	if_equal $1, .UnknownScript_0x69511
	spriteface $0, $0
	applymovement $6, MovementData_0x69549
	playsound $0023
	disappear $6
	waitbutton
	end

.UnknownScript_0x69511 ; 0x69511
	applymovement $6, MovementData_0x6954e
	spriteface $0, $0
	applymovement $6, MovementData_0x69551
	playsound $0023
	disappear $6
	waitbutton
	end
; 0x69523

.eggname ; 0x69523
	db "EGG@"
; 0x69527

UnknownScript_0x69527: ; 0x69527
	jumpstd $0030
	end
; 0x6952b

UnknownScript_0x6952b: ; 0x6952b
	2writetext UnknownText_0x69693
	closetext
	loadmovesprites
	end
; 0x69531

UnknownScript_0x69531: ; 0x69531
	2writetext UnknownText_0x696f2
	closetext
	loadmovesprites
	setbit1 $002c
	end
; 0x6953a

UnknownScript_0x6953a: ; 0x6953a
	2writetext UnknownText_0x69712
	2jump UnknownScript_0x694d7
; 0x69540

GameboyKidScript_0x69540: ; 0x69540
	jumptextfaceplayer UnknownText_0x69809
; 0x69543

GentlemanScript_0x69543: ; 0x69543
	jumptextfaceplayer UnknownText_0x6983c
; 0x69546

YoungsterScript_0x69546: ; 0x69546
	jumptextfaceplayer UnknownText_0x698b8
; 0x69549

MovementData_0x69549: ; 0x69549
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x6954e

MovementData_0x6954e: ; 0x6954e
	step_left
	step_down
	step_end
; 0x69551

MovementData_0x69551: ; 0x69551
	step_down
	step_down
	step_down
	step_end
; 0x69555

UnknownText_0x69555: ; 0x69555
	db $0, $14, ", long", $4f
	db "time, no see.", $51
	db "PROF.ELM asked me", $4f
	db "to find you.", $51
	db "He has another", $4f
	db "favor to ask.", $51
	db "Would you take the", $4f
	db "#MON EGG?", $57
; 0x695c5

UnknownText_0x695c5: ; 0x695c5
	db $0, "We discovered that", $4f
	db "a #MON will not", $51
	db "hatch until it", $4f
	db "grows in the EGG.", $51
	db "It also has to be", $4f
	db "with other active", $55
	db "#MON to hatch.", $51
	db $14, ", you're", $4f
	db "the only person", $55
	db "we can rely on.", $51
	db "Please call PROF.", $4f
	db "ELM when that EGG", $55
	db "hatches!", $57
; 0x69693

UnknownText_0x69693: ; 0x69693
	db $0, "Oh, no. You can't", $4f
	db "carry any more", $55
	db "#MON with you.", $51
	db "I'll wait here", $4f
	db "while you make", $55
	db "room for the EGG.", $57
; 0x696f2

UnknownText_0x696f2: ; 0x696f2
	db $0, "B-but… PROF.ELM", $4f
	db "asked for you…", $57
; 0x69712

UnknownText_0x69712: ; 0x69712
	db $0, $14, ", will you", $4f
	db "take the EGG?", $57
; 0x6972d

UnknownText_0x6972d: ; 0x6972d
	db $0, "I've been thinking", $4f
	db "it'd be great to", $51
	db "be able to link up", $4f
	db "and battle with my", $51
	db "friends who live", $4f
	db "far away.", $57
; 0x69791

UnknownText_0x69791: ; 0x69791
	db $0, "I just battled a", $4f
	db "friend in CIANWOOD", $55
	db "over a link.", $51
	db "If you connect a", $4f
	db "MOBILE ADAPTER,", $51
	db "you can link with", $4f
	db "a friend far away.", $57
; 0x69809

UnknownText_0x69809: ; 0x69809
	db $0, "A guy named BILL", $4f
	db "made the #MON", $55
	db "PC storage system.", $57
; 0x6983c

UnknownText_0x6983c: ; 0x6983c
	db $0, "It was around", $4f
	db "three years ago.", $51
	db "TEAM ROCKET was up", $4f
	db "to no good with", $55
	db "#MON.", $51
	db "But justice pre-", $4f
	db "vailed--a young", $55
	db "kid broke 'em up.", $57
; 0x698b8

UnknownText_0x698b8: ; 0x698b8
	db $0, "#MON are smart.", $4f
	db "They won't obey a", $51
	db "trainer they don't", $4f
	db "respect.", $51
	db "Without the right", $4f
	db "GYM BADGES, they", $51
	db "will just do as", $4f
	db "they please.", $57
; 0x69935

VioletPokeCenter1F_MapEventHeader: ; 0x69935
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 5, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $7, $4, 5, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x694c9, $ffff
	person_event SPRITE_GAMEBOY_KID, 10, 11, $6, $0, 255, 255, $a0, 0, GameboyKidScript_0x69540, $ffff
	person_event SPRITE_GENTLEMAN, 8, 5, $3, $0, 255, 255, $0, 0, GentlemanScript_0x69543, $ffff
	person_event SPRITE_YOUNGSTER, 5, 12, $6, $0, 255, 255, $80, 0, YoungsterScript_0x69546, $ffff
	person_event SPRITE_SCIENTIST, 7, 8, $6, $0, 255, 255, $90, 0, ScientistScript_0x694cc, $0700
; 0x6998b

