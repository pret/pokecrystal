MahoganyGym_MapScriptHeader: ; 0x199a9c
	; trigger count
	db 0

	; callback count
	db 0
; 0x199a9e

PryceScript_0x199a9e: ; 0x199a9e
	faceplayer
	loadfont
	checkevent EVENT_BEAT_PRYCE
	iftrue UnknownScript_0x199ac8
	writetext UnknownText_0x199b8d
	closetext
	loadmovesprites
	winlosstext UnknownText_0x199cb3, $0000
	loadtrainer PRYCE, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_PRYCE
	loadfont
	writetext UnknownText_0x199d3b
	playsound SFX_GET_BADGE
	waitbutton
	setflag $0021
	checkcode $7
	scall UnknownScript_0x199af6
UnknownScript_0x199ac8: ; 0x199ac8
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue UnknownScript_0x199af0
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext UnknownText_0x199d55
	keeptextopen
	verbosegiveitem TM_16, 1
	iffalse UnknownScript_0x199af4
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext UnknownText_0x199def
	closetext
	loadmovesprites
	end
; 0x199af0

UnknownScript_0x199af0: ; 0x199af0
	writetext UnknownText_0x199e59
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
	writetext UnknownText_0x19a116
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
	writetext UnknownText_0x19a18f
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
	writetext UnknownText_0x199f2d
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
	writetext UnknownText_0x199fdd
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
	writetext UnknownText_0x19a047
	closetext
	loadmovesprites
	end
; 0x199b69

MahoganyGymGuyScript: ; 0x199b69
	faceplayer
	loadfont
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuyWinScript
	writetext MahoganyGymGuyText
	closetext
	loadmovesprites
	end

.MahoganyGymGuyWinScript
	writetext MahoganyGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x199b7d

MapMahoganyGymSignpost1Script: ; 0x199b7d
	checkflag $0021
	iftrue UnknownScript_0x199b86
	jumpstd $002d
; 0x199b86

UnknownScript_0x199b86: ; 0x199b86
	trainertotext PRYCE, 1, $1
	jumpstd $002e
; 0x199b8d

UnknownText_0x199b8d: ; 0x199b8d
	text "#MON have many"
	line "experiences in"

	para "their lives, just "
	line "like we do. "

	para "I, too, have seen"
	line "and suffered much"
	cont "in my life."

	para "Since I am your"
	line "elder, let me show"
	cont "you what I mean."

	para "I have been with"
	line "#MON since"

	para "before you were"
	line "born."

	para "I do not lose"
	line "easily."

	para "I, PRYCE--the"
	line "winter trainer--"

	para "shall demonstrate"
	line "my power!"
	done
; 0x199cb3

UnknownText_0x199cb3: ; 0x199cb3
	text "Ah, I am impressed"
	line "by your prowess."

	para "With your strong"
	line "will, I know you"

	para "will overcome all"
	line "life's obstacles."

	para "You are worthy of"
	line "this BADGE!"
	done
; 0x199d3b

UnknownText_0x199d3b: ; 0x199d3b
	text $52, " received"
	line "GLACIERBADGE."
	done
; 0x199d55

UnknownText_0x199d55: ; 0x199d55
	text "That BADGE will"
	line "raise the SPECIAL"
	cont "stats of #MON."

	para "It also lets your"
	line "#MON use WHIRL-"
	cont "POOL to get across"
	cont "real whirlpools."

	para "And this… This is"
	line "a gift from me!"
	done
; 0x199def

UnknownText_0x199def: ; 0x199def
	text "That TM contains"
	line "ICY WIND."

	para "It inflicts damage"
	line "and lowers speed."

	para "It demonstrates"
	line "the harshness of"
	cont "winter."
	done
; 0x199e59

UnknownText_0x199e59: ; 0x199e59
	text "When the ice and"
	line "snow melt, spring"
	cont "arrives."

	para "You and your #-"
	line "MON will be to-"

	para "gether for many"
	line "years to come."

	para "Cherish your time"
	line "together!"
	done
; 0x199ee1

BoarderRonaldSeenText: ; 0x199ee1
	text "I'll freeze your"
	line "#MON, so you"
	cont "can't do a thing!"
	done
; 0x199f10

BoarderRonaldBeatenText: ; 0x199f10
	text "Darn. I couldn't"
	line "do a thing."
	done
; 0x199f2d

UnknownText_0x199f2d: ; 0x199f2d
	text "I think there's a"
	line "move a #MON"

	para "can use while it's"
	line "frozen."
	done
; 0x199f65

BoarderBradSeenText: ; 0x199f65
	text "This GYM has a"
	line "slippery floor."

	para "It's fun, isn't"
	line "it?"

	para "But hey--we're"
	line "not playing games"
	cont "here!"
	done
; 0x199fbd

BoarderBradBeatenText: ; 0x199fbd
	text "Do you see how"
	line "serious we are?"
	done
; 0x199fdd

UnknownText_0x199fdd: ; 0x199fdd
	text "This GYM is great."
	line "I love boarding"
	cont "with my #MON!"
	done
; 0x19a00f

BoarderDouglasSeenText: ; 0x19a00f
	text "I know PRYCE's"
	line "secret."
	done
; 0x19a026

BoarderDouglasBeatenText: ; 0x19a026
	text "OK. I'll tell you"
	line "PRYCE's secret."
	done
; 0x19a047

UnknownText_0x19a047: ; 0x19a047
	text "The secret behind"
	line "PRYCE's power…"

	para "He meditates under"
	line "a waterfall daily"

	para "to strengthen his"
	line "mind and body."
	done
; 0x19a0ae

SkierRoxanneSeenText: ; 0x19a0ae
	text "To get to PRYCE,"
	line "our GYM LEADER,"

	para "you need to think"
	line "before you skate."
	done
; 0x19a0f4

SkierRoxanneBeatenText: ; 0x19a0f4
	text "I wouldn't lose to"
	line "you in skiing!"
	done
; 0x19a116

UnknownText_0x19a116: ; 0x19a116
	text "If you don't skate"
	line "with precision,"

	para "you won't get far"
	line "in this GYM."
	done
; 0x19a157

SkierClarissaSeenText: ; 0x19a157
	text "Check out my"
	line "parallel turn!"
	done
; 0x19a174

SkierClarissaBeatenText: ; 0x19a174
	text "No! You made me"
	line "wipe out!"
	done
; 0x19a18f

UnknownText_0x19a18f: ; 0x19a18f
	text "I shouldn't have"
	line "been bragging"
	cont "about my skiing…"
	done
; 0x19a1bf

MahoganyGymGuyText: ; 0x19a1bf
	text "PRYCE is a veteran"
	line "who has trained"

	para "#MON for some"
	line "50 years."

	para "He's said to be"
	line "good at freezing"

	para "opponents with"
	line "ice-type moves."

	para "That means you"
	line "should melt him"

	para "with your burning"
	line "ambition!"
	done
; 0x19a275

MahoganyGymGuyWinText: ; 0x19a275
	text "PRYCE is some-"
	line "thing, but you're"
	cont "something else!"

	para "That was a hot"
	line "battle that"

	para "bridged the gen-"
	line "eration gap!"
	done
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
