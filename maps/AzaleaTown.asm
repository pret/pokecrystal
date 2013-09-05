AzaleaTown_MapScriptHeader: ; 0x198000
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x198011, $0000
	dw UnknownScript_0x198012, $0000
	dw UnknownScript_0x198013, $0000

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x198014
; 0x198011

UnknownScript_0x198011: ; 0x198011
	end
; 0x198012

UnknownScript_0x198012: ; 0x198012
	end
; 0x198013

UnknownScript_0x198013: ; 0x198013
	end
; 0x198014

UnknownScript_0x198014: ; 0x198014
	setbit2 $0044
	return
; 0x198018

UnknownScript_0x198018: ; 0x198018
	moveperson $b, $b, $b
	spriteface $0, $3
	showemote $0, $0, 15
	special $006a
	pause 15
	appear $b
	applymovement $b, MovementData_0x198134
	spriteface $0, $0
	2jump UnknownScript_0x198049
; 0x198034

UnknownScript_0x198034: ; 0x198034
	spriteface $0, $3
	showemote $0, $0, 15
	special $006a
	pause 15
	appear $b
	applymovement $b, MovementData_0x19813c
	spriteface $0, $1
UnknownScript_0x198049: ; 0x198049
	playmusic $001f
	loadfont
	2writetext UnknownText_0x19814d
	closetext
	loadmovesprites
	setbit1 $06bf
	checkbit1 EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x198071
	checkbit1 EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x198081
	winlosstext UnknownText_0x1981e6, UnknownText_0x19835b
	setlasttalked $b
	loadtrainer RIVAL1, RIVAL1_6
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x198091
; 0x198071

UnknownScript_0x198071: ; 0x198071
	winlosstext UnknownText_0x1981e6, UnknownText_0x19835b
	setlasttalked $b
	loadtrainer RIVAL1, RIVAL1_4
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x198091
; 0x198081

UnknownScript_0x198081: ; 0x198081
	winlosstext UnknownText_0x1981e6, UnknownText_0x19835b
	setlasttalked $b
	loadtrainer RIVAL1, RIVAL1_5
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x198091
; 0x198091

UnknownScript_0x198091: ; 0x198091
	playmusic $0020
	loadfont
	2writetext UnknownText_0x198233
	closetext
	loadmovesprites
	spriteface $0, $2
	applymovement $b, MovementData_0x198144
	playsound $0023
	disappear $b
	dotrigger $0
	waitbutton
	playmapmusic
	end
; 0x1980ab

AzaleaRocketScript_0x1980ab: ; 0x1980ab
	jumptextfaceplayer UnknownText_0x19837b
; 0x1980ae

AzaleaRocketScript_0x1980ae: ; 0x1980ae
	jumptextfaceplayer UnknownText_0x1983c7
; 0x1980b1

GrampsScript_0x1980b1: ; 0x1980b1
	faceplayer
	loadfont
	checkbit1 EVENT_CLEARED_SLOWPOKE_WELL
	iftrue UnknownScript_0x1980bf
	2writetext UnknownText_0x19841b
	closetext
	loadmovesprites
	end
; 0x1980bf

UnknownScript_0x1980bf: ; 0x1980bf
	2writetext UnknownText_0x198473
	closetext
	loadmovesprites
	end
; 0x1980c5

TeacherScript_0x1980c5: ; 0x1980c5
	jumptextfaceplayer UnknownText_0x1984ce
; 0x1980c8

YoungsterScript_0x1980c8: ; 0x1980c8
	jumptextfaceplayer UnknownText_0x19851a
; 0x1980cb

SlowpokeScript_0x1980cb: ; 0x1980cb
	loadfont
	2writetext UnknownText_0x1985b0
	pause 60
	2writetext UnknownText_0x1985c3
	cry SLOWPOKE
	closetext
	loadmovesprites
	end
; 0x1980da

UnknownScript_0x1980da: ; 0x1980da
	faceplayer
	loadfont
	2writetext UnknownText_0x1985cd
	cry $00c3
	closetext
	loadmovesprites
	end
; 0x1980e5

UnknownScript_0x1980e5: ; 0x1980e5
	applymovement $0, MovementData_0x198148
	loadfont
	2writetext UnknownText_0x1985df
	keeptextopen
	spriteface $d, $3
	2writetext UnknownText_0x19860b
	keeptextopen
	2writetext UnknownText_0x198628
	closetext
	verbosegiveitem GS_BALL, 1
	spriteface $d, $2
	setbit2 $0064
	clearbit1 $06ed
	setbit1 $06eb
	dotrigger $0
	loadmovesprites
	end
; 0x19810c

KurtOutsideScript_0x19810c: ; 0x19810c
	faceplayer
	loadfont
	2writetext UnknownText_0x198628
	closetext
	spriteface $d, $2
	loadmovesprites
	end
; 0x198117

MapAzaleaTownSignpost0Script: ; 0x198117
	jumptext UnknownText_0x19865a
; 0x19811a

MapAzaleaTownSignpost1Script: ; 0x19811a
	jumptext UnknownText_0x198693
; 0x19811d

MapAzaleaTownSignpost2Script: ; 0x19811d
	jumptext UnknownText_0x1986a1
; 0x198120

MapAzaleaTownSignpost3Script: ; 0x198120
	jumptext UnknownText_0x1986e7
; 0x198123

MapAzaleaTownSignpost4Script: ; 0x198123
	jumptext UnknownText_0x19878d
; 0x198126

MapAzaleaTownSignpost7Script: ; 0x198126
	jumptext UnknownText_0x19879c
; 0x198129

MapAzaleaTownSignpost5Script: ; 0x198129
	jumpstd $0010
; 0x19812c

MapAzaleaTownSignpost6Script: ; 0x19812c
	jumpstd $0011
; 0x19812f

FruitTreeScript_0x19812f: ; 0x19812f
	fruittree $14
; 0x198131

MapAzaleaTownSignpostItem8: ; 0x198131
	dw $00b1
	db FULL_HEAL
	
; 0x198134

MovementData_0x198134: ; 0x198134
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end
; 0x19813c

MovementData_0x19813c: ; 0x19813c
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_down
	step_end
; 0x198144

MovementData_0x198144: ; 0x198144
	step_left
	step_left
	step_left
	step_end
; 0x198148

MovementData_0x198148: ; 0x198148
	step_left
	step_left
	step_up
	turn_head_left
	step_end
; 0x19814d

UnknownText_0x19814d: ; 0x19814d
	db $0, "…Tell me some-", $4f
	db "thing.", $51
	db "Is it true that", $4f
	db "TEAM ROCKET has", $55
	db "returned?", $51
	db "What? You beat", $4f
	db "them? Hah! Quit", $55
	db "lying.", $51
	db "You're not joking?", $4f
	db "Then let's see how", $55
	db "good you are.", $57
; 0x1981e6

UnknownText_0x1981e6: ; 0x1981e6
	db $0, "… Humph! Useless", $4f
	db "#MON!", $51
	db "Listen, you. You", $4f
	db "only won because", $51
	db "my #MON were", $4f
	db "weak.", $57
; 0x198233

UnknownText_0x198233: ; 0x198233
	db $0, "I hate the weak.", $51
	db "#MON, trainers.", $4f
	db "It doesn't matter", $55
	db "who or what.", $51
	db "I'm going to be", $4f
	db "strong and wipe", $55
	db "out the weak.", $51
	db "That goes for TEAM", $4f
	db "ROCKET too.", $51
	db "They act big and", $4f
	db "tough in a group.", $51
	db "But get them", $4f
	db "alone, and they're", $55
	db "weak.", $51
	db "I hate them all.", $51
	db "You stay out of my", $4f
	db "way. A weakling", $51
	db "like you is only a", $4f
	db "distraction.", $57
; 0x19835b

UnknownText_0x19835b: ; 0x19835b
	db $0, "…Humph! I knew", $4f
	db "you were lying.", $57
; 0x19837b

UnknownText_0x19837b: ; 0x19837b
	db $0, "It's unsafe to go", $4f
	db "in there, so I'm", $55
	db "standing guard.", $51
	db "Aren't I a good", $4f
	db "Samaritan?", $57
; 0x1983c7

UnknownText_0x1983c7: ; 0x1983c7
	db $0, "Do you know about", $4f
	db "SLOWPOKETAIL? I", $55
	db "heard it's tasty!", $51
	db "Aren't you glad I", $4f
	db "told you that?", $57
; 0x19841b

UnknownText_0x19841b: ; 0x19841b
	db $0, "The SLOWPOKE have", $4f
	db "disappeared from", $55
	db "town…", $51
	db "I heard their", $4f
	db "TAILS are being", $55
	db "sold somewhere.", $57
; 0x198473

UnknownText_0x198473: ; 0x198473
	db $0, "The SLOWPOKE have", $4f
	db "returned.", $51
	db "Knowing them, they", $4f
	db "could've just been", $51
	db "goofing off some-", $4f
	db "where.", $57
; 0x1984ce

UnknownText_0x1984ce: ; 0x1984ce
	db $0, "Did you come to", $4f
	db "get KURT to make", $55
	db "some BALLS?", $51
	db "A lot of people do", $4f
	db "just that.", $57
; 0x19851a

UnknownText_0x19851a: ; 0x19851a
	db $0, "Cut through AZALEA", $4f
	db "and you'll be in", $55
	db "ILEX FOREST.", $51
	db "But these skinny", $4f
	db "trees make it", $51
	db "impossible to get", $4f
	db "through.", $51
	db "The CHARCOAL MAN's", $4f
	db "#MON can CUT", $55
	db "down trees.", $57
; 0x1985b0

UnknownText_0x1985b0: ; 0x1985b0
	db $0, "SLOWPOKE: …", $51
	db $56, " ", $56, " ", $56, $57
; 0x1985c3

UnknownText_0x1985c3: ; 0x1985c3
	db $0, $56, " ", $56, "Yawn?", $57
; 0x1985cd

UnknownText_0x1985cd: ; 0x1985cd
	db $0, "WOOSTER: Gugyoo…", $57
; 0x1985df

UnknownText_0x1985df: ; 0x1985df
	db $0, "ILEX FOREST is", $4f
	db "restless!", $51
	db "What is going on?", $57
; 0x19860b

UnknownText_0x19860b: ; 0x19860b
	db $0, $52, ", here's", $4f
	db "your GS BALL back!", $57
; 0x198628

UnknownText_0x198628: ; 0x198628
	db $0, "Could you go see", $4f
	db "why ILEX FOREST is", $55
	db "so restless?", $57
; 0x19865a

UnknownText_0x19865a: ; 0x19865a
	db $0, "AZALEA TOWN", $4f
	db "Where People and", $51
	db "#MON Live in", $4f
	db "Happy Harmony", $57
; 0x198693

UnknownText_0x198693: ; 0x198693
	db $0, "KURT'S HOUSE", $57
; 0x1986a1

UnknownText_0x1986a1: ; 0x1986a1
	db $0, "AZALEA TOWN", $4f
	db "#MON GYM", $55
	db "LEADER: BUGSY", $51
	db "The Walking", $4f
	db "Bug #MON", $55
	db "Encyclopedia", $57
; 0x1986e7

UnknownText_0x1986e7: ; 0x1986e7
	db $0, "SLOWPOKE WELL", $51
	db "Also known as the", $4f
	db "RAINMAKER WELL.", $51
	db "Locals believe", $4f
	db "that a SLOWPOKE's", $55
	db "yawn summons rain.", $51
	db "Records show that", $4f
	db "a SLOWPOKE's yawn", $51
	db "ended a drought", $4f
	db "400 years ago.", $57
; 0x19878d

UnknownText_0x19878d: ; 0x19878d
	db $0, "CHARCOAL KILN", $57
; 0x19879c

UnknownText_0x19879c: ; 0x19879c
	db $0, "ILEX FOREST", $51
	db "Enter through the", $4f
	db "gate.", $57
; 0x1987c1

AzaleaTown_MapEventHeader: ; 0x1987c1
	; filler
	db 0, 0

	; warps
	db 8
	warp_def $9, $f, 1, GROUP_AZALEA_POKECENTER_1F, MAP_AZALEA_POKECENTER_1F
	warp_def $d, $15, 1, GROUP_CHARCOAL_KILN, MAP_CHARCOAL_KILN
	warp_def $5, $15, 2, GROUP_AZALEA_MART, MAP_AZALEA_MART
	warp_def $5, $9, 1, GROUP_KURTS_HOUSE, MAP_KURTS_HOUSE
	warp_def $f, $a, 1, GROUP_AZALEA_GYM, MAP_AZALEA_GYM
	warp_def $7, $1f, 1, GROUP_SLOWPOKE_WELL_B1F, MAP_SLOWPOKE_WELL_B1F
	warp_def $a, $2, 3, GROUP_ILEX_FOREST_AZALEA_GATE, MAP_ILEX_FOREST_AZALEA_GATE
	warp_def $b, $2, 4, GROUP_ILEX_FOREST_AZALEA_GATE, MAP_ILEX_FOREST_AZALEA_GATE

	; xy triggers
	db 3
	xy_trigger 1, $a, $5, $0, UnknownScript_0x198018, $0, $0
	xy_trigger 1, $b, $5, $0, UnknownScript_0x198034, $0, $0
	xy_trigger 2, $6, $9, $0, UnknownScript_0x1980e5, $0, $0

	; signposts
	db 9
	signpost 9, 19, $0, MapAzaleaTownSignpost0Script
	signpost 9, 10, $0, MapAzaleaTownSignpost1Script
	signpost 15, 14, $0, MapAzaleaTownSignpost2Script
	signpost 7, 29, $0, MapAzaleaTownSignpost3Script
	signpost 13, 19, $0, MapAzaleaTownSignpost4Script
	signpost 9, 16, $0, MapAzaleaTownSignpost5Script
	signpost 5, 22, $0, MapAzaleaTownSignpost6Script
	signpost 9, 3, $0, MapAzaleaTownSignpost7Script
	signpost 6, 31, $7, MapAzaleaTownSignpostItem8

	; people-events
	db 12
	person_event SPRITE_AZALEA_ROCKET, 13, 35, $6, $0, 255, 255, $0, 0, AzaleaRocketScript_0x1980ab, $06fa
	person_event SPRITE_GRAMPS, 13, 25, $2, $21, 255, 255, $0, 0, GrampsScript_0x1980b1, $ffff
	person_event SPRITE_TEACHER, 17, 19, $4, $20, 255, 255, $90, 0, TeacherScript_0x1980c5, $ffff
	person_event SPRITE_YOUNGSTER, 13, 11, $5, $1, 255, 255, $a0, 0, YoungsterScript_0x1980c8, $ffff
	person_event SPRITE_SLOWPOKE, 21, 12, $1, $0, 255, 255, $0, 0, SlowpokeScript_0x1980cb, $06f9
	person_event SPRITE_SLOWPOKE, 13, 22, $1, $0, 255, 255, $0, 0, SlowpokeScript_0x1980cb, $06f9
	person_event SPRITE_SLOWPOKE, 13, 33, $1, $0, 255, 255, $0, 0, SlowpokeScript_0x1980cb, $06f9
	person_event SPRITE_SLOWPOKE, 19, 19, $1, $0, 255, 255, $0, 0, SlowpokeScript_0x1980cb, $06f9
	person_event SPRITE_FRUIT_TREE, 6, 12, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x19812f, $ffff
	person_event SPRITE_AZALEA_ROCKET, 14, 15, $8, $0, 255, 255, $0, 0, ObjectEvent, $06bf
	person_event SPRITE_AZALEA_ROCKET, 20, 14, $6, $0, 255, 255, $0, 0, AzaleaRocketScript_0x1980ae, $06fc
	person_event SPRITE_KURT_OUTSIDE, 9, 10, $8, $0, 255, 255, $0, 0, KurtOutsideScript_0x19810c, $07a4
; 0x1988d0

