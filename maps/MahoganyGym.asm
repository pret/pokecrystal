MahoganyGym_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

PryceScript_0x199a9e:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
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
	setflag ENGINE_GLACIERBADGE
	checkcode VAR_BADGES
	scall MahoganyGymTriggerRockets
.FightDone
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue UnknownScript_0x199af0
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext UnknownText_0x199d55
	keeptextopen
	verbosegiveitem TM_ICY_WIND, 1
	iffalse UnknownScript_0x199af4
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext UnknownText_0x199def
	closetext
	loadmovesprites
	end

UnknownScript_0x199af0:
	writetext UnknownText_0x199e59
	closetext
UnknownScript_0x199af4:
	loadmovesprites
	end

MahoganyGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets
	jumpstd goldenrodrockets

.RadioTowerRockets
	jumpstd radiotowerrockets

TrainerSkierRoxanne:
	; bit/flag number
	dw EVENT_BEAT_SKIER_ROXANNE

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

SkierRoxanneScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19a116
	closetext
	loadmovesprites
	end

TrainerSkierClarissa:
	; bit/flag number
	dw EVENT_BEAT_SKIER_CLARISSA

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

SkierClarissaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19a18f
	closetext
	loadmovesprites
	end

TrainerBoarderRonald:
	; bit/flag number
	dw EVENT_BEAT_BOARDER_RONALD

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

BoarderRonaldScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x199f2d
	closetext
	loadmovesprites
	end

TrainerBoarderBrad:
	; bit/flag number
	dw EVENT_BEAT_BOARDER_BRAD

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

BoarderBradScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x199fdd
	closetext
	loadmovesprites
	end

TrainerBoarderDouglas:
	; bit/flag number
	dw EVENT_BEAT_BOARDER_DOUGLAS

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

BoarderDouglasScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19a047
	closetext
	loadmovesprites
	end

MahoganyGymGuyScript:
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

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext PRYCE, 1, $1
	jumpstd gymstatue2

UnknownText_0x199b8d:
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

UnknownText_0x199cb3:
	text "Ah, I am impressed"
	line "by your prowess."

	para "With your strong"
	line "will, I know you"

	para "will overcome all"
	line "life's obstacles."

	para "You are worthy of"
	line "this BADGE!"
	done

UnknownText_0x199d3b:
	text "<PLAYER> received"
	line "GLACIERBADGE."
	done

UnknownText_0x199d55:
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

UnknownText_0x199def:
	text "That TM contains"
	line "ICY WIND."

	para "It inflicts damage"
	line "and lowers speed."

	para "It demonstrates"
	line "the harshness of"
	cont "winter."
	done

UnknownText_0x199e59:
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

BoarderRonaldSeenText:
	text "I'll freeze your"
	line "#MON, so you"
	cont "can't do a thing!"
	done

BoarderRonaldBeatenText:
	text "Darn. I couldn't"
	line "do a thing."
	done

UnknownText_0x199f2d:
	text "I think there's a"
	line "move a #MON"

	para "can use while it's"
	line "frozen."
	done

BoarderBradSeenText:
	text "This GYM has a"
	line "slippery floor."

	para "It's fun, isn't"
	line "it?"

	para "But hey--we're"
	line "not playing games"
	cont "here!"
	done

BoarderBradBeatenText:
	text "Do you see how"
	line "serious we are?"
	done

UnknownText_0x199fdd:
	text "This GYM is great."
	line "I love boarding"
	cont "with my #MON!"
	done

BoarderDouglasSeenText:
	text "I know PRYCE's"
	line "secret."
	done

BoarderDouglasBeatenText:
	text "OK. I'll tell you"
	line "PRYCE's secret."
	done

UnknownText_0x19a047:
	text "The secret behind"
	line "PRYCE's power…"

	para "He meditates under"
	line "a waterfall daily"

	para "to strengthen his"
	line "mind and body."
	done

SkierRoxanneSeenText:
	text "To get to PRYCE,"
	line "our GYM LEADER,"

	para "you need to think"
	line "before you skate."
	done

SkierRoxanneBeatenText:
	text "I wouldn't lose to"
	line "you in skiing!"
	done

UnknownText_0x19a116:
	text "If you don't skate"
	line "with precision,"

	para "you won't get far"
	line "in this GYM."
	done

SkierClarissaSeenText:
	text "Check out my"
	line "parallel turn!"
	done

SkierClarissaBeatenText:
	text "No! You made me"
	line "wipe out!"
	done

UnknownText_0x19a18f:
	text "I shouldn't have"
	line "been bragging"
	cont "about my skiing…"
	done

MahoganyGymGuyText:
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

MahoganyGymGuyWinText:
	text "PRYCE is some-"
	line "thing, but you're"
	cont "something else!"

	para "That was a hot"
	line "battle that"

	para "bridged the gen-"
	line "eration gap!"
	done

MahoganyGym_MapEventHeader:
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
	signpost 15, 3, $0, MahoganyGymStatue
	signpost 15, 6, $0, MahoganyGymStatue

	; people-events
	db 7
	person_event SPRITE_PRYCE, 7, 9, $6, $0, 255, 255, $b0, 0, PryceScript_0x199a9e, -1
	person_event SPRITE_BUENA, 10, 8, $6, $0, 255, 255, $82, 1, TrainerSkierRoxanne, -1
	person_event SPRITE_ROCKER, 21, 4, $7, $0, 255, 255, $92, 1, TrainerBoarderRonald, -1
	person_event SPRITE_BUENA, 21, 13, $7, $0, 255, 255, $82, 1, TrainerSkierClarissa, -1
	person_event SPRITE_ROCKER, 13, 9, $6, $0, 255, 255, $92, 1, TrainerBoarderBrad, -1
	person_event SPRITE_ROCKER, 8, 6, $a, $0, 255, 255, $92, 1, TrainerBoarderDouglas, -1
	person_event SPRITE_GYM_GUY, 19, 11, $6, $0, 255, 255, $80, 0, MahoganyGymGuyScript, -1
