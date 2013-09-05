MahoganyGym_MapScriptHeader: ; 0x199a9c
	; trigger count
	db 0

	; callback count
	db 0
; 0x199a9e

PryceScript_0x199a9e: ; 0x199a9e
	faceplayer
	loadfont
	checkbit1 EVENT_BEAT_PRYCE
	iftrue UnknownScript_0x199ac8
	2writetext UnknownText_0x199b8d
	closetext
	loadmovesprites
	winlosstext UnknownText_0x199cb3, $0000
	loadtrainer PRYCE, 1
	startbattle
	returnafterbattle
	setbit1 EVENT_BEAT_PRYCE
	loadfont
	2writetext UnknownText_0x199d3b
	playsound $009c
	waitbutton
	setbit2 $0021
	checkcode $7
	2call UnknownScript_0x199af6
UnknownScript_0x199ac8: ; 0x199ac8
	checkbit1 EVENT_GOT_TM16_ICY_WIND
	iftrue UnknownScript_0x199af0
	setbit1 EVENT_BEAT_SKIER_ROXANNE
	setbit1 EVENT_BEAT_SKIER_CLARISSA
	setbit1 EVENT_BEAT_BOARDER_RONALD
	setbit1 EVENT_BEAT_BOARDER_BRAD
	setbit1 EVENT_BEAT_BOARDER_DOUGLAS
	2writetext UnknownText_0x199d55
	keeptextopen
	verbosegiveitem TM_16, 1
	iffalse UnknownScript_0x199af4
	setbit1 EVENT_GOT_TM16_ICY_WIND
	2writetext UnknownText_0x199def
	closetext
	loadmovesprites
	end
; 0x199af0

UnknownScript_0x199af0: ; 0x199af0
	2writetext UnknownText_0x199e59
	closetext
UnknownScript_0x199af4: ; 0x199af4
	loadmovesprites
	end
; 0x199af6

UnknownScript_0x199af6: ; 0x199af6
	if_equal $7, UnknownScript_0x199b02
	if_equal $6, UnknownScript_0x199aff
	end
; 0x199aff

UnknownScript_0x199aff: ; 0x199aff
	jumpstd $0012
; 0x199b02

UnknownScript_0x199b02: ; 0x199b02
	jumpstd $0013
; 0x199b05

TrainerSkierRoxanne: ; 0x199b05
	; bit/flag number
	dw $592

	; trainer group && trainer id
	db SKIER, ROXANNE

	; text when seen
	dw SkierRoxanneSeenText

	; text when trainer beaten
	dw SkierRoxanneBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SkierRoxanneScript
; 0x199b11

SkierRoxanneScript: ; 0x199b11
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19a116
	closetext
	loadmovesprites
	end
; 0x199b19

TrainerSkierClarissa: ; 0x199b19
	; bit/flag number
	dw $593

	; trainer group && trainer id
	db SKIER, CLARISSA

	; text when seen
	dw SkierClarissaSeenText

	; text when trainer beaten
	dw SkierClarissaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SkierClarissaScript
; 0x199b25

SkierClarissaScript: ; 0x199b25
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19a18f
	closetext
	loadmovesprites
	end
; 0x199b2d

TrainerBoarderRonald: ; 0x199b2d
	; bit/flag number
	dw $40e

	; trainer group && trainer id
	db BOARDER, RONALD

	; text when seen
	dw BoarderRonaldSeenText

	; text when trainer beaten
	dw BoarderRonaldBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BoarderRonaldScript
; 0x199b39

BoarderRonaldScript: ; 0x199b39
	talkaftercancel
	loadfont
	2writetext UnknownText_0x199f2d
	closetext
	loadmovesprites
	end
; 0x199b41

TrainerBoarderBrad: ; 0x199b41
	; bit/flag number
	dw $40f

	; trainer group && trainer id
	db BOARDER, BRAD

	; text when seen
	dw BoarderBradSeenText

	; text when trainer beaten
	dw BoarderBradBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BoarderBradScript
; 0x199b4d

BoarderBradScript: ; 0x199b4d
	talkaftercancel
	loadfont
	2writetext UnknownText_0x199fdd
	closetext
	loadmovesprites
	end
; 0x199b55

TrainerBoarderDouglas: ; 0x199b55
	; bit/flag number
	dw $410

	; trainer group && trainer id
	db BOARDER, DOUGLAS

	; text when seen
	dw BoarderDouglasSeenText

	; text when trainer beaten
	dw BoarderDouglasBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BoarderDouglasScript
; 0x199b61

BoarderDouglasScript: ; 0x199b61
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19a047
	closetext
	loadmovesprites
	end
; 0x199b69

MahoganyGymGuyScript: ; 0x199b69
	faceplayer
	loadfont
	checkbit1 EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuyWinScript
	2writetext MahoganyGymGuyText
	closetext
	loadmovesprites
	end

.MahoganyGymGuyWinScript
	2writetext MahoganyGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x199b7d

MapMahoganyGymSignpost1Script: ; 0x199b7d
	checkbit2 $0021
	iftrue UnknownScript_0x199b86
	jumpstd $002d
; 0x199b86

UnknownScript_0x199b86: ; 0x199b86
	trainertotext PRYCE, 1, $1
	jumpstd $002e
; 0x199b8d

UnknownText_0x199b8d: ; 0x199b8d
	db $0, "#MON have many", $4f
	db "experiences in", $51
	db "their lives, just ", $4f
	db "like we do. ", $51
	db "I, too, have seen", $4f
	db "and suffered much", $55
	db "in my life.", $51
	db "Since I am your", $4f
	db "elder, let me show", $55
	db "you what I mean.", $51
	db "I have been with", $4f
	db "#MON since", $51
	db "before you were", $4f
	db "born.", $51
	db "I do not lose", $4f
	db "easily.", $51
	db "I, PRYCE--the", $4f
	db "winter trainer--", $51
	db "shall demonstrate", $4f
	db "my power!", $57
; 0x199cb3

UnknownText_0x199cb3: ; 0x199cb3
	db $0, "Ah, I am impressed", $4f
	db "by your prowess.", $51
	db "With your strong", $4f
	db "will, I know you", $51
	db "will overcome all", $4f
	db "life's obstacles.", $51
	db "You are worthy of", $4f
	db "this BADGE!", $57
; 0x199d3b

UnknownText_0x199d3b: ; 0x199d3b
	db $0, $52, " received", $4f
	db "GLACIERBADGE.", $57
; 0x199d55

UnknownText_0x199d55: ; 0x199d55
	db $0, "That BADGE will", $4f
	db "raise the SPECIAL", $55
	db "stats of #MON.", $51
	db "It also lets your", $4f
	db "#MON use WHIRL-", $55
	db "POOL to get across", $55
	db "real whirlpools.", $51
	db "And this… This is", $4f
	db "a gift from me!", $57
; 0x199def

UnknownText_0x199def: ; 0x199def
	db $0, "That TM contains", $4f
	db "ICY WIND.", $51
	db "It inflicts damage", $4f
	db "and lowers speed.", $51
	db "It demonstrates", $4f
	db "the harshness of", $55
	db "winter.", $57
; 0x199e59

UnknownText_0x199e59: ; 0x199e59
	db $0, "When the ice and", $4f
	db "snow melt, spring", $55
	db "arrives.", $51
	db "You and your #-", $4f
	db "MON will be to-", $51
	db "gether for many", $4f
	db "years to come.", $51
	db "Cherish your time", $4f
	db "together!", $57
; 0x199ee1

BoarderRonaldSeenText: ; 0x199ee1
	db $0, "I'll freeze your", $4f
	db "#MON, so you", $55
	db "can't do a thing!", $57
; 0x199f10

BoarderRonaldBeatenText: ; 0x199f10
	db $0, "Darn. I couldn't", $4f
	db "do a thing.", $57
; 0x199f2d

UnknownText_0x199f2d: ; 0x199f2d
	db $0, "I think there's a", $4f
	db "move a #MON", $51
	db "can use while it's", $4f
	db "frozen.", $57
; 0x199f65

BoarderBradSeenText: ; 0x199f65
	db $0, "This GYM has a", $4f
	db "slippery floor.", $51
	db "It's fun, isn't", $4f
	db "it?", $51
	db "But hey--we're", $4f
	db "not playing games", $55
	db "here!", $57
; 0x199fbd

BoarderBradBeatenText: ; 0x199fbd
	db $0, "Do you see how", $4f
	db "serious we are?", $57
; 0x199fdd

UnknownText_0x199fdd: ; 0x199fdd
	db $0, "This GYM is great.", $4f
	db "I love boarding", $55
	db "with my #MON!", $57
; 0x19a00f

BoarderDouglasSeenText: ; 0x19a00f
	db $0, "I know PRYCE's", $4f
	db "secret.", $57
; 0x19a026

BoarderDouglasBeatenText: ; 0x19a026
	db $0, "OK. I'll tell you", $4f
	db "PRYCE's secret.", $57
; 0x19a047

UnknownText_0x19a047: ; 0x19a047
	db $0, "The secret behind", $4f
	db "PRYCE's power…", $51
	db "He meditates under", $4f
	db "a waterfall daily", $51
	db "to strengthen his", $4f
	db "mind and body.", $57
; 0x19a0ae

SkierRoxanneSeenText: ; 0x19a0ae
	db $0, "To get to PRYCE,", $4f
	db "our GYM LEADER,", $51
	db "you need to think", $4f
	db "before you skate.", $57
; 0x19a0f4

SkierRoxanneBeatenText: ; 0x19a0f4
	db $0, "I wouldn't lose to", $4f
	db "you in skiing!", $57
; 0x19a116

UnknownText_0x19a116: ; 0x19a116
	db $0, "If you don't skate", $4f
	db "with precision,", $51
	db "you won't get far", $4f
	db "in this GYM.", $57
; 0x19a157

SkierClarissaSeenText: ; 0x19a157
	db $0, "Check out my", $4f
	db "parallel turn!", $57
; 0x19a174

SkierClarissaBeatenText: ; 0x19a174
	db $0, "No! You made me", $4f
	db "wipe out!", $57
; 0x19a18f

UnknownText_0x19a18f: ; 0x19a18f
	db $0, "I shouldn't have", $4f
	db "been bragging", $55
	db "about my skiing…", $57
; 0x19a1bf

MahoganyGymGuyText: ; 0x19a1bf
	db $0, "PRYCE is a veteran", $4f
	db "who has trained", $51
	db "#MON for some", $4f
	db "50 years.", $51
	db "He's said to be", $4f
	db "good at freezing", $51
	db "opponents with", $4f
	db "ice-type moves.", $51
	db "That means you", $4f
	db "should melt him", $51
	db "with your burning", $4f
	db "ambition!", $57
; 0x19a275

MahoganyGymGuyWinText: ; 0x19a275
	db $0, "PRYCE is some-", $4f
	db "thing, but you're", $55
	db "something else!", $51
	db "That was a hot", $4f
	db "battle that", $51
	db "bridged the gen-", $4f
	db "eration gap!", $57
; 0x19a2df

MahoganyGym_MapEventHeader: ; 0x19a2df
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $11, $4, 3, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN
	warp_def $11, $5, 3, GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 15, 3, $0, MapMahoganyGymSignpost1Script
	signpost 15, 6, $0, MapMahoganyGymSignpost1Script

	; people-events
	db 7
	person_event SPRITE_PRYCE, 7, 9, $6, $0, 255, 255, $b0, 0, PryceScript_0x199a9e, $ffff
	person_event SPRITE_BUENA, 10, 8, $6, $0, 255, 255, $82, 1, TrainerSkierRoxanne, $ffff
	person_event SPRITE_ROCKER, 21, 4, $7, $0, 255, 255, $92, 1, TrainerBoarderRonald, $ffff
	person_event SPRITE_BUENA, 21, 13, $7, $0, 255, 255, $82, 1, TrainerSkierClarissa, $ffff
	person_event SPRITE_ROCKER, 13, 9, $6, $0, 255, 255, $92, 1, TrainerBoarderBrad, $ffff
	person_event SPRITE_ROCKER, 8, 6, $a, $0, 255, 255, $92, 1, TrainerBoarderDouglas, $ffff
	person_event SPRITE_GYM_GUY, 19, 11, $6, $0, 255, 255, $80, 0, MahoganyGymGuyScript, $ffff
; 0x19a354

