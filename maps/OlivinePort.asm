OlivinePort_MapScriptHeader: ; 0x748a2
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x748ac, $0000
	dw UnknownScript_0x748ad, $0000

	; callback count
	db 0
; 0x748ac

UnknownScript_0x748ac: ; 0x748ac
	end
; 0x748ad

UnknownScript_0x748ad: ; 0x748ad
	priorityjump UnknownScript_0x748b1
	end
; 0x748b1

UnknownScript_0x748b1: ; 0x748b1
	applymovement $0, MovementData_0x74a32
	appear $2
	dotrigger $0
	setbit1 $0000
	blackoutmod GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	end
; 0x748c0

SailorScript_0x748c0: ; 0x748c0
	faceplayer
	loadfont
	checkbit1 $0000
	iftrue UnknownScript_0x74919
	2writetext UnknownText_0x74a55
	closetext
	loadmovesprites
	spriteface $2, $0
	pause 10
	playsound $0023
	disappear $2
	waitbutton
	applymovement $0, MovementData_0x74a30
	playsound $0023
	special $002e
	waitbutton
	checkbit1 $0030
	iffalse UnknownScript_0x7490a
	clearbit1 $073a
	setbit1 $073b
	clearbit1 EVENT_BEAT_COOLTRAINERM_SEAN
	clearbit1 EVENT_BEAT_COOLTRAINERF_CAROL
	clearbit1 EVENT_BEAT_GENTLEMAN_EDWARD
	clearbit1 EVENT_BEAT_BEAUTY_CASSIE
	clearbit1 EVENT_BEAT_PSYCHIC_RODNEY
	clearbit1 EVENT_BEAT_SUPER_NERD_SHAWN
	clearbit1 EVENT_BEAT_SAILOR_GARRETT
	clearbit1 EVENT_BEAT_FISHER_JONAH
	clearbit1 EVENT_BEAT_BLACKBELT_WAI
UnknownScript_0x7490a: ; 0x7490a
	clearbit1 $002f
	appear $2
	domaptrigger GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $1
	warp GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $19, $1
	end
; 0x74919

UnknownScript_0x74919: ; 0x74919
	2writetext UnknownText_0x74a80
	closetext
	loadmovesprites
	end
; 0x7491f

UnknownScript_0x7491f: ; 0x7491f
	spriteface $4, $3
	checkbit1 $0000
	iftrue UnknownScript_0x7498b
	checkbit1 $0001
	iftrue UnknownScript_0x7498b
	spriteface $0, $2
	loadfont
	checkbit1 $0030
	iffalse UnknownScript_0x7494e
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x74977
	if_equal SATURDAY, UnknownScript_0x74977
	if_equal TUESDAY, UnknownScript_0x74981
	if_equal WEDNESDAY, UnknownScript_0x74981
	if_equal THURSDAY, UnknownScript_0x74981
UnknownScript_0x7494e: ; 0x7494e
	2writetext UnknownText_0x74a9c
	yesorno
	iffalse UnknownScript_0x74992
	2writetext UnknownText_0x74ada
	keeptextopen
	checkitem S_S_TICKET
	iffalse UnknownScript_0x7496d
	2writetext UnknownText_0x74b11
	closetext
	loadmovesprites
	setbit1 $0001
	applymovement $0, MovementData_0x74a37
	2jump SailorScript_0x748c0
; 0x7496d

UnknownScript_0x7496d: ; 0x7496d
	2writetext UnknownText_0x74b41
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74a34
	end
; 0x74977

UnknownScript_0x74977: ; 0x74977
	2writetext UnknownText_0x74ba8
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74a34
	end
; 0x74981

UnknownScript_0x74981: ; 0x74981
	2writetext UnknownText_0x74bce
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74a34
	end
; 0x7498b

UnknownScript_0x7498b: ; 0x7498b
	end
; 0x7498c

UnknownScript_0x7498c: ; 0x7498c
	2writetext UnknownText_0x74af6
	closetext
	loadmovesprites
	end
; 0x74992

UnknownScript_0x74992: ; 0x74992
	2writetext UnknownText_0x74af6
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74a34
	end
; 0x7499c

SailorScript_0x7499c: ; 0x7499c
	faceplayer
	loadfont
	checkbit1 $0000
	iftrue UnknownScript_0x74919
	checkbit1 $0030
	iffalse UnknownScript_0x749c0
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x749f2
	if_equal SATURDAY, UnknownScript_0x749f2
	if_equal TUESDAY, UnknownScript_0x749f8
	if_equal WEDNESDAY, UnknownScript_0x749f8
	if_equal THURSDAY, UnknownScript_0x749f8
UnknownScript_0x749c0: ; 0x749c0
	2writetext UnknownText_0x74a9c
	yesorno
	iffalse UnknownScript_0x7498c
	2writetext UnknownText_0x74ada
	keeptextopen
	checkitem S_S_TICKET
	iffalse UnknownScript_0x749ec
	2writetext UnknownText_0x74b11
	closetext
	loadmovesprites
	setbit1 $0001
	checkcode $9
	if_equal $3, UnknownScript_0x749e5
	applymovement $0, MovementData_0x74a3f
	2jump SailorScript_0x748c0
; 0x749e5

UnknownScript_0x749e5: ; 0x749e5
	applymovement $0, MovementData_0x74a49
	2jump SailorScript_0x748c0
; 0x749ec

UnknownScript_0x749ec: ; 0x749ec
	2writetext UnknownText_0x74b41
	closetext
	loadmovesprites
	end
; 0x749f2

UnknownScript_0x749f2: ; 0x749f2
	2writetext UnknownText_0x74ba8
	closetext
	loadmovesprites
	end
; 0x749f8

UnknownScript_0x749f8: ; 0x749f8
	2writetext UnknownText_0x74bce
	closetext
	loadmovesprites
	end
; 0x749fe

SailorScript_0x749fe: ; 0x749fe
	jumptextfaceplayer UnknownText_0x74cd7
; 0x74a01

FishingGuruScript_0x74a01: ; 0x74a01
	faceplayer
	loadfont
	2writetext UnknownText_0x74bf4
	closetext
	loadmovesprites
	spriteface $5, $1
	end
; 0x74a0c

FishingGuruScript_0x74a0c: ; 0x74a0c
	faceplayer
	loadfont
	2writetext UnknownText_0x74c35
	closetext
	loadmovesprites
	spriteface $6, $1
	end
; 0x74a17

YoungsterScript_0x74a17: ; 0x74a17
	faceplayer
	loadfont
	2writetext UnknownText_0x74c76
	closetext
	loadmovesprites
	spriteface $7, $0
	end
; 0x74a22

CooltrainerFScript_0x74a22: ; 0x74a22
	faceplayer
	loadfont
	2writetext UnknownText_0x74ca2
	closetext
	loadmovesprites
	spriteface $8, $0
	end
; 0x74a2d

MapOlivinePortSignpostItem0: ; 0x74a2d
	dw $00ea
	db PROTEIN
	
; 0x74a30

MovementData_0x74a30: ; 0x74a30
	step_down
	step_end
; 0x74a32

MovementData_0x74a32: ; 0x74a32
	step_up
	step_end
; 0x74a34

MovementData_0x74a34: ; 0x74a34
	step_right
	turn_head_left
	step_end
; 0x74a37

MovementData_0x74a37: ; 0x74a37
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x74a3f

MovementData_0x74a3f: ; 0x74a3f
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x74a49

MovementData_0x74a49: ; 0x74a49
	step_up
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x74a55

UnknownText_0x74a55: ; 0x74a55
	db $0, "We're departing", $4f
	db "soon. Please get", $55
	db "on board.", $57
; 0x74a80

UnknownText_0x74a80: ; 0x74a80
	db $0, "Sorry. You can't", $4f
	db "board now.", $57
; 0x74a9c

UnknownText_0x74a9c: ; 0x74a9c
	db $0, "Welcome to FAST", $4f
	db "SHIP S.S.AQUA.", $51
	db "Will you be board-", $4f
	db "ing today?", $57
; 0x74ada

UnknownText_0x74ada: ; 0x74ada
	db $0, "May I see your", $4f
	db "S.S.TICKET?", $57
; 0x74af6

UnknownText_0x74af6: ; 0x74af6
	db $0, "We hope to see you", $4f
	db "again!", $57
; 0x74b11

UnknownText_0x74b11: ; 0x74b11
	db $0, $52, " flashed", $4f
	db "the S.S.TICKET.", $51
	db "That's it.", $4f
	db "Thank you!", $57
; 0x74b41

UnknownText_0x74b41: ; 0x74b41
	db $0, $52, " tried to", $4f
	db "show the S.S.", $55
	db "TICKET…", $51
	db "…But no TICKET!", $51
	db "Sorry!", $4f
	db "You may board only", $51
	db "if you have an", $4f
	db "S.S.TICKET.", $57
; 0x74ba8

UnknownText_0x74ba8: ; 0x74ba8
	db $0, "The FAST SHIP will", $4f
	db "sail next Monday.", $57
; 0x74bce

UnknownText_0x74bce: ; 0x74bce
	db $0, "The FAST SHIP will", $4f
	db "sail next Friday.", $57
; 0x74bf4

UnknownText_0x74bf4: ; 0x74bf4
	db $0, "SHELLDER are easy", $4f
	db "to catch here.", $51
	db "They're kind of", $4f
	db "rare elsewhere.", $57
; 0x74c35

UnknownText_0x74c35: ; 0x74c35
	db $0, "How many RODS do", $4f
	db "you have?", $51
	db "Different RODS", $4f
	db "catch different", $55
	db "#MON.", $57
; 0x74c76

UnknownText_0x74c76: ; 0x74c76
	db $0, "S.S.AQUA uses jets", $4f
	db "to skim over the", $55
	db "waves!", $57
; 0x74ca2

UnknownText_0x74ca2: ; 0x74ca2
	db $0, "There are lots of", $4f
	db "#MON in KANTO.", $51
	db "I wish I could go…", $57
; 0x74cd7

UnknownText_0x74cd7: ; 0x74cd7
	db $0, "We don't want you", $4f
	db "to fall into the", $51
	db "sea, so you're not", $4f
	db "allowed in.", $57
; 0x74d18

OlivinePort_MapEventHeader: ; 0x74d18
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $b, 5, GROUP_OLIVINE_PORT_PASSAGE, MAP_OLIVINE_PORT_PASSAGE
	warp_def $17, $7, 1, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F

	; xy triggers
	db 1
	xy_trigger 0, $f, $7, $0, UnknownScript_0x7491f, $0, $0

	; signposts
	db 1
	signpost 22, 1, $7, MapOlivinePortSignpostItem0

	; people-events
	db 7
	person_event SPRITE_SAILOR, 27, 11, $7, $0, 255, 255, $0, 0, SailorScript_0x748c0, $072a
	person_event SPRITE_SAILOR, 19, 11, $7, $0, 255, 255, $0, 0, SailorScript_0x749fe, $0737
	person_event SPRITE_SAILOR, 19, 10, $9, $0, 255, 255, $0, 0, SailorScript_0x7499c, $0738
	person_event SPRITE_FISHING_GURU, 18, 8, $7, $0, 255, 255, $0, 0, FishingGuruScript_0x74a01, $0737
	person_event SPRITE_FISHING_GURU, 18, 17, $7, $0, 255, 255, $0, 0, FishingGuruScript_0x74a0c, $0737
	person_event SPRITE_YOUNGSTER, 19, 8, $6, $0, 255, 255, $0, 0, YoungsterScript_0x74a17, $0738
	person_event SPRITE_COOLTRAINER_F, 19, 15, $6, $0, 255, 255, $0, 0, CooltrainerFScript_0x74a22, $0738
; 0x74d90

