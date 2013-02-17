GoldenrodDeptStore5F_MapScriptHeader: ; 0x5608b
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x56090
; 0x56090

UnknownScript_0x56090: ; 0x56090
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x56099
	disappear $7
	return
; 0x56099

UnknownScript_0x56099: ; 0x56099
	appear $7
	return
; 0x5609c

UnknownScript_0x5609c: ; 0x5609c
	faceplayer
	loadfont
	checkbit1 $005f
	iftrue UnknownScript_0x560ad
	checkbit1 $004b
	iftrue UnknownScript_0x560c2
	2jump UnknownScript_0x560b6
; 0x560ad

UnknownScript_0x560ad: ; 0x560ad
	checkbit1 $004b
	iftrue UnknownScript_0x560c8
	2jump UnknownScript_0x560bc
; 0x560b6

UnknownScript_0x560b6: ; 0x560b6
	pokemart $0, $0009
	loadmovesprites
	end
; 0x560bc

UnknownScript_0x560bc: ; 0x560bc
	pokemart $0, $000a
	loadmovesprites
	end
; 0x560c2

UnknownScript_0x560c2: ; 0x560c2
	pokemart $0, $000b
	loadmovesprites
	end
; 0x560c8

UnknownScript_0x560c8: ; 0x560c8
	pokemart $0, $000c
	loadmovesprites
	end
; 0x560ce

UnknownScript_0x560ce: ; 0x560ce
	faceplayer
	loadfont
	checkcode $b
	if_not_equal SUNDAY, UnknownScript_0x56112
	checkbit2 $005b
	iftrue UnknownScript_0x56112
	special $0059
	2writetext UnknownText_0x56143
	keeptextopen
	if_less_than $95, UnknownScript_0x560ee
	if_less_than $31, UnknownScript_0x560fd
	2jump UnknownScript_0x56103
; 0x560ee

UnknownScript_0x560ee: ; 0x560ee
	2writetext UnknownText_0x5615a
	keeptextopen
	verbosegiveitem TM_27, 1
	iffalse UnknownScript_0x56116
	setbit2 $005b
	loadmovesprites
	end
; 0x560fd

UnknownScript_0x560fd: ; 0x560fd
	2writetext UnknownText_0x561a6
	closetext
	loadmovesprites
	end
; 0x56103

UnknownScript_0x56103: ; 0x56103
	2writetext UnknownText_0x561d8
	keeptextopen
	verbosegiveitem TM_21, 1
	iffalse UnknownScript_0x56116
	setbit2 $005b
	loadmovesprites
	end
; 0x56112

UnknownScript_0x56112: ; 0x56112
	2writetext UnknownText_0x56202
	closetext
UnknownScript_0x56116: ; 0x56116
	loadmovesprites
	end
; 0x56118

UnknownScript_0x56118: ; 0x56118
	faceplayer
	loadfont
	special $0066
	if_not_equal $2, UnknownScript_0x5612a
	2writetext UnknownText_0x56241
	closetext
	loadmovesprites
	special $0013
	end
; 0x5612a

UnknownScript_0x5612a: ; 0x5612a
	2writetext UnknownText_0x56279
	closetext
	loadmovesprites
	end
; 0x56130

UnknownScript_0x56130: ; 0x56130
	jumptextfaceplayer UnknownText_0x562ad
; 0x56133

UnknownScript_0x56133: ; 0x56133
	faceplayer
	loadfont
	trade $0
	closetext
	loadmovesprites
	end
; 0x5613a

UnknownScript_0x5613a: ; 0x5613a
	jumptextfaceplayer UnknownText_0x562f3
; 0x5613d

MapGoldenrodDeptStore5FSignpost0Script: ; 0x5613d
	jumptext UnknownText_0x56364
; 0x56140

MapGoldenrodDeptStore5FSignpost1Script: ; 0x56140
	jumpstd $0014
; 0x56143

UnknownText_0x56143: ; 0x56143
	db $0, "Hello. Oh, your", $4f
	db "#MON…", $57
; 0x5615a

UnknownText_0x5615a: ; 0x5615a
	db $0, "It's very attached", $4f
	db "to you.", $51
	db "This move should", $4f
	db "be perfect for a", $55
	db "pair like you.", $57
; 0x561a6

UnknownText_0x561a6: ; 0x561a6
	db $0, "It's adorable!", $51
	db "You should teach", $4f
	db "it good TM moves.", $57
; 0x561d8

UnknownText_0x561d8: ; 0x561d8
	db $0, "It looks evil. How", $4f
	db "about this TM for", $55
	db "it?", $57
; 0x56202

UnknownText_0x56202: ; 0x56202
	db $0, "There are sure to", $4f
	db "be TMs that are", $51
	db "just perfect for", $4f
	db "your #MON.", $57
; 0x56241

UnknownText_0x56241: ; 0x56241
	db $0, "MYSTERY GIFT.", $51
	db "With just a", $4f
	db "little beep, you", $55
	db "get a gift.", $57
; 0x56279

UnknownText_0x56279: ; 0x56279
	db $0, "The MYSTERY GIFT", $4f
	db "option requires a", $55
	db "Game Boy Color.", $57
; 0x562ad

UnknownText_0x562ad: ; 0x562ad
	db $0, "On Sundays, a lady", $4f
	db "comes to check out", $55
	db "#MON.", $51
	db "She even gives", $4f
	db "away TMs!", $57
; 0x562f3

UnknownText_0x562f3: ; 0x562f3
	db $0, "You can't rename a", $4f
	db "#MON you get in", $55
	db "a trade.", $51
	db "The name is a re-", $4f
	db "flection of the", $51
	db "original trainer's", $4f
	db "feelings for it.", $57
; 0x56364

UnknownText_0x56364: ; 0x56364
	db $0, "Customize Your", $4f
	db "#MON", $51
	db "5F TM CORNER", $57
; 0x56386

GoldenrodDeptStore5F_MapEventHeader: ; 0x56386
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_GOLDENROD_DEPT_STORE_4F, MAP_GOLDENROD_DEPT_STORE_4F
	warp_def $0, $f, 1, GROUP_GOLDENROD_DEPT_STORE_6F, MAP_GOLDENROD_DEPT_STORE_6F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapGoldenrodDeptStore5FSignpost0Script
	signpost 0, 3, $0, MapGoldenrodDeptStore5FSignpost1Script

	; people-events
	db 6
	person_event $39, 9, 12, $7, $0, 255, 255, $0, 0, UnknownScript_0x5609c, $ffff
	person_event $28, 10, 7, $2, $11, 255, 255, $0, 0, UnknownScript_0x56130, $ffff
	person_event $23, 7, 10, $3, $0, 255, 255, $0, 0, UnknownScript_0x56133, $ffff
	person_event $2d, 9, 17, $2, $22, 255, 255, $0, 0, UnknownScript_0x5613a, $ffff
	person_event $26, 5, 13, $6, $0, 255, 255, $a0, 0, UnknownScript_0x56118, $ffff
	person_event $42, 9, 11, $7, $0, 255, 255, $80, 0, UnknownScript_0x560ce, $0763
; 0x563f3

