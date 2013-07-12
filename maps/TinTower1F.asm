TinTower1F_MapScriptHeader: ; 0x18501a
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x18502a, $0000
	dw UnknownScript_0x18502e, $0000

	; callback count
	db 2

	; callbacks

	dbw 2, UnknownScript_0x18502f

	dbw 1, UnknownScript_0x185084
; 0x18502a

UnknownScript_0x18502a: ; 0x18502a
	priorityjump UnknownScript_0x18508f
	end
; 0x18502e

UnknownScript_0x18502e: ; 0x18502e
	end
; 0x18502f

UnknownScript_0x18502f: ; 0x18502f
	checkbit1 $0336
	iftrue UnknownScript_0x185047
	checkbit1 $0044
	iffalse UnknownScript_0x185050
	special $0096
	iffalse UnknownScript_0x185050
	clearbit1 $07c5
	setbit1 $07b6
UnknownScript_0x185047: ; 0x185047
	checkbit1 $0317
	iffalse UnknownScript_0x18504f
	appear $5
UnknownScript_0x18504f: ; 0x18504f
	return
; 0x185050

UnknownScript_0x185050: ; 0x185050
	checkbit1 $0335
	iftrue UnknownScript_0x185077
	appear $2
	writebyte RAIKOU
	special $0097
	iftrue UnknownScript_0x185065
	appear $3
	2jump UnknownScript_0x185067
; 0x185065

UnknownScript_0x185065: ; 0x185065
	disappear $3
UnknownScript_0x185067: ; 0x185067
	writebyte ENTEI
	special $0097
	iftrue UnknownScript_0x185074
	appear $4
	2jump UnknownScript_0x185076
; 0x185074

UnknownScript_0x185074: ; 0x185074
	disappear $4
UnknownScript_0x185076: ; 0x185076
	return
; 0x185077

UnknownScript_0x185077: ; 0x185077
	disappear $2
	disappear $3
	disappear $4
	clearbit1 $07b6
	setbit1 $07c5
	return
; 0x185084

UnknownScript_0x185084: ; 0x185084
	checkbit1 $0336
	iftrue UnknownScript_0x18508e
	changeblock $a, $2, $9
UnknownScript_0x18508e: ; 0x18508e
	return
; 0x18508f

UnknownScript_0x18508f: ; 0x18508f
	applymovement $0, MovementData_0x1851cb
	pause 15
	writebyte RAIKOU
	special $0097
	iftrue UnknownScript_0x1850b6
	applymovement $3, MovementData_0x1851d0
	spriteface $0, $2
	cry RAIKOU
	pause 10
	playsound $0014
	applymovement $3, MovementData_0x1851d4
	disappear $3
	playsound $0023
	waitbutton
UnknownScript_0x1850b6: ; 0x1850b6
	writebyte ENTEI
	special $0097
	iftrue UnknownScript_0x1850d7
	applymovement $4, MovementData_0x1851da
	spriteface $0, $3
	cry ENTEI
	pause 10
	playsound $0014
	applymovement $4, MovementData_0x1851de
	disappear $4
	playsound $0023
	waitbutton
UnknownScript_0x1850d7: ; 0x1850d7
	spriteface $0, $1
	pause 10
	applymovement $0, MovementData_0x1851e8
	applymovement $2, MovementData_0x1851e4
	cry SUICUNE
	pause 20
	loadpokedata SUICUNE, 40
	writecode $3, $c
	startbattle
	reloadmapmusic
	disappear $2
	setbit1 $0335
	setbit1 $07af
	domaptrigger GROUP_ROUTE_42, MAP_ROUTE_42, $0
	setbit1 $07b0
	domaptrigger GROUP_ROUTE_36, MAP_ROUTE_36, $0
	setbit1 $07ae
	domaptrigger GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY, $0
	dotrigger $1
	clearbit1 $07b7
	returnafterbattle
	pause 20
	spriteface $0, $0
	playmusic $0061
	playsound $001f
	moveperson $5, $a, $f
	appear $5
	applymovement $5, MovementData_0x1851ec
	playsound $001f
	moveperson $6, $9, $f
	appear $6
	applymovement $6, MovementData_0x1851f5
	playsound $001f
	moveperson $7, $9, $f
	appear $7
	applymovement $7, MovementData_0x1851fb
	playsound $001f
	moveperson $8, $9, $f
	appear $8
	applymovement $8, MovementData_0x1851fe
	moveperson $6, $7, $d
	moveperson $7, $9, $d
	moveperson $8, $b, $d
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x185203
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x1851f1
	playsound $0023
	disappear $5
	waitbutton
	special $006a
	pause 20
	playmapmusic
	end
; 0x185173

SageScript_0x185173: ; 0x185173
	jumptextfaceplayer UnknownText_0x185386
; 0x185176

SageScript_0x185176: ; 0x185176
	jumptextfaceplayer UnknownText_0x185433
; 0x185179

SageScript_0x185179: ; 0x185179
	jumptextfaceplayer UnknownText_0x185544
; 0x18517c

SageScript_0x18517c: ; 0x18517c
	checkbit1 $0317
	iftrue UnknownScript_0x185185
	jumptextfaceplayer UnknownText_0x1855ee
; 0x185185

UnknownScript_0x185185: ; 0x185185
	jumptextfaceplayer UnknownText_0x185765
; 0x185188

SageScript_0x185188: ; 0x185188
	faceplayer
	loadfont
	checkbit1 $0317
	iftrue UnknownScript_0x1851b6
	checkbit1 $0336
	iftrue UnknownScript_0x1851b0
	2writetext UnknownText_0x185629
	keeptextopen
	verbosegiveitem RAINBOW_WING, 1
	loadmovesprites
	refreshscreen $0
	earthquake 72
	waitbutton
	playsound $001b
	changeblock $a, $2, $20
	reloadmappart
	setbit1 $0336
	loadmovesprites
	loadfont
UnknownScript_0x1851b0: ; 0x1851b0
	2writetext UnknownText_0x18564a
	closetext
	loadmovesprites
	end
; 0x1851b6

UnknownScript_0x1851b6: ; 0x1851b6
	2writetext UnknownText_0x185803
	closetext
	loadmovesprites
	end
; 0x1851bc

SageScript_0x1851bc: ; 0x1851bc
	checkbit1 $0317
	iftrue UnknownScript_0x1851c5
	jumptextfaceplayer UnknownText_0x185654
; 0x1851c5

UnknownScript_0x1851c5: ; 0x1851c5
	jumptextfaceplayer UnknownText_0x1858d0
; 0x1851c8

SuperNerdScript_0x1851c8: ; 0x1851c8
	jumptextfaceplayer UnknownText_0x1856a3
; 0x1851cb

MovementData_0x1851cb: ; 0x1851cb
	slow_step_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end
; 0x1851d0

MovementData_0x1851d0: ; 0x1851d0
	db $39 ; movement
	fast_jump_step_down
	db $38 ; movement
	step_end
; 0x1851d4

MovementData_0x1851d4: ; 0x1851d4
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_down
	db $38 ; movement
	step_end
; 0x1851da

MovementData_0x1851da: ; 0x1851da
	db $39 ; movement
	fast_jump_step_down
	db $38 ; movement
	step_end
; 0x1851de

MovementData_0x1851de: ; 0x1851de
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_left
	fast_jump_step_down
	db $38 ; movement
	step_end
; 0x1851e4

MovementData_0x1851e4: ; 0x1851e4
	db $39 ; movement
	fast_jump_step_down
	db $38 ; movement
	step_end
; 0x1851e8

MovementData_0x1851e8: ; 0x1851e8
	fix_facing
	big_step_down
	remove_fixed_facing
	step_end
; 0x1851ec

MovementData_0x1851ec: ; 0x1851ec
	step_up
	step_up
	step_up
	turn_head_left
	step_end
; 0x1851f1

MovementData_0x1851f1: ; 0x1851f1
	step_down
	step_down
	step_down
	step_end
; 0x1851f5

MovementData_0x1851f5: ; 0x1851f5
	step_up
	step_up
	step_left
	step_left
	turn_head_up
	step_end
; 0x1851fb

MovementData_0x1851fb: ; 0x1851fb
	step_up
	step_up
	step_end
; 0x1851fe

MovementData_0x1851fe: ; 0x1851fe
	step_up
	step_right
	step_right
	step_up
	step_end
; 0x185203

UnknownText_0x185203: ; 0x185203
	db $0, "EUSINE: Awesome!", $4f
	db "Too awesome, even!", $51
	db "I've never seen a", $4f
	db "battle that great.", $51
	db "That was truly", $4f
	db "inspiring to see.", $51
	db "SUICUNE was tough,", $4f
	db "but you were even", $51
	db "more incredible,", $4f
	db $52, ".", $51
	db "I heard SUICUNE's", $4f
	db "mystic power", $51
	db "summons a rainbow-", $4f
	db "colored #MON.", $51
	db "Maybe, just maybe,", $4f
	db "what went on today", $51
	db "will cause that", $4f
	db "#MON to appear.", $51
	db "I'm going to study", $4f
	db "the legends more.", $51
	db "Thanks for showing", $4f
	db "me that fantastic", $55
	db "battle.", $51
	db "Later, ", $52, "!", $57
; 0x185386

UnknownText_0x185386: ; 0x185386
	db $0, "According to", $4f
	db "legend…", $51
	db "When the souls of", $4f
	db "#MON and humans", $51
	db "commune, from the", $4f
	db "heavens descends a", $51
	db "#MON of rainbow", $4f
	db "colors…", $51
	db "Could it mean the", $4f
	db "legendary #MON", $51
	db "are testing us", $4f
	db "humans?", $57
; 0x185433

UnknownText_0x185433: ; 0x185433
	db $0, "When the BRASS", $4f
	db "TOWER burned down,", $51
	db "three nameless", $4f
	db "#MON were said", $51
	db "to have perished.", $4f
	db "It was tragic.", $51
	db "However…", $51
	db "A rainbow-colored", $4f
	db "#MON…", $51
	db "In other words…", $51
	db "HO-OH descended", $4f
	db "from the sky and", $51
	db "gave new life to", $4f
	db "the three #MON.", $51
	db "They are…", $51
	db "SUICUNE, ENTEI and", $4f
	db "RAIKOU.", $51
	db "That is what they", $4f
	db "say.", $57
; 0x185544

UnknownText_0x185544: ; 0x185544
	db $0, "The two TOWERS are", $4f
	db "said to have been", $51
	db "built to foster", $4f
	db "friendship and", $51
	db "hope between #-", $4f
	db "MON and people.", $51
	db "That was 700 years", $4f
	db "ago, but the ideal", $51
	db "still remains", $4f
	db "important today.", $57
; 0x1855ee

UnknownText_0x1855ee: ; 0x1855ee
	db $0, "HO-OH appears to", $4f
	db "have descended", $51
	db "upon this, the TIN", $4f
	db "TOWER!", $57
; 0x185629

UnknownText_0x185629: ; 0x185629
	db $0, "This will protect", $4f
	db "you. Take it.", $57
; 0x18564a

UnknownText_0x18564a: ; 0x18564a
	db $0, "Now, go.", $57
; 0x185654

UnknownText_0x185654: ; 0x185654
	db $0, "I believe you are", $4f
	db "being tested.", $51
	db "Free your mind", $4f
	db "from uncertainty,", $55
	db "and advance.", $57
; 0x1856a3

UnknownText_0x1856a3: ; 0x1856a3
	db $0, "I knew it.", $51
	db "I knew you'd get", $4f
	db "to see the #MON", $51
	db "of rainbow colors,", $4f
	db $52, ".", $51
	db "It happened just", $4f
	db "as I envisioned.", $51
	db "My research isn't", $4f
	db "bad, I might say.", $51
	db "I'm going to keep", $4f
	db "studying #MON", $51
	db "to become a famous", $4f
	db "#MANIAC!", $57
; 0x185765

UnknownText_0x185765: ; 0x185765
	db $0, "The legendary", $4f
	db "#MON are said", $51
	db "to embody three", $4f
	db "powers…", $51
	db "The lightning that", $4f
	db "struck the TOWER.", $51
	db "The fire that", $4f
	db "burned the TOWER.", $51
	db "And the rain that", $4f
	db "put out the fire…", $57
; 0x185803

UnknownText_0x185803: ; 0x185803
	db $0, "When the legendary", $4f
	db "#MON appeared…", $51
	db "They struck terror", $4f
	db "in those who saw", $55
	db "their rise.", $51
	db "And…", $51
	db "Some even took to", $4f
	db "futile attacks.", $51
	db "The legendary", $4f
	db "#MON, knowing", $51
	db "their own power,", $4f
	db "fled, ignoring the", $55
	db "frightened people.", $57
; 0x1858d0

UnknownText_0x1858d0: ; 0x1858d0
	db $0, "Of the legendary", $4f
	db "#MON, SUICUNE", $51
	db "is said to be the", $4f
	db "closest to HO-OH.", $51
	db "I hear there may", $4f
	db "also be a link to", $51
	db "#MON known as", $4f
	db "UNOWN.", $51
	db "The #MON UNOWN", $4f
	db "must be sharing a", $51
	db "cooperative bond", $4f
	db "with SUICUNE.", $57
; 0x18598c

TinTower1F_MapEventHeader: ; 0x18598c
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $f, $9, 12, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $f, $a, 12, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $2, $a, 2, GROUP_TIN_TOWER_2F, MAP_TIN_TOWER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 10
	person_event SPRITE_SUICUNE, 13, 13, $1, $0, 255, 255, $90, 0, ObjectEvent, $07b2
	person_event SPRITE_RAIKOU, 13, 11, $1, $0, 255, 255, $b0, 0, ObjectEvent, $07b4
	person_event SPRITE_ENTEI, 13, 16, $1, $0, 255, 255, $80, 0, ObjectEvent, $07b3
	person_event SPRITE_SUPER_NERD, 7, 12, $3, $0, 255, 255, $90, 0, SuperNerdScript_0x1851c8, $07b5
	person_event SPRITE_SAGE, 13, 9, $3, $0, 255, 255, $0, 0, SageScript_0x185173, $07b6
	person_event SPRITE_SAGE, 15, 15, $3, $0, 255, 255, $0, 0, SageScript_0x185176, $07b6
	person_event SPRITE_SAGE, 10, 18, $3, $0, 255, 255, $0, 0, SageScript_0x185179, $07b6
	person_event SPRITE_SAGE, 6, 8, $4, $10, 255, 255, $0, 0, SageScript_0x18517c, $07c5
	person_event SPRITE_SAGE, 5, 13, $6, $0, 255, 255, $0, 0, SageScript_0x185188, $07c5
	person_event SPRITE_SAGE, 6, 18, $5, $1, 255, 255, $0, 0, SageScript_0x1851bc, $07c5
; 0x185a23

