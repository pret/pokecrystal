GoldenrodGym_MapScriptHeader: ; 0x54000
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x5400a, $0000
	dw UnknownScript_0x5400b, $0000

	; callback count
	db 0
; 0x5400a

UnknownScript_0x5400a: ; 0x5400a
	end
; 0x5400b

UnknownScript_0x5400b: ; 0x5400b
	end
; 0x5400c

WhitneyScript_0x5400c: ; 0x5400c
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue UnknownScript_0x54037
	loadfont
	writetext UnknownText_0x54122
	closetext
	loadmovesprites
	winlosstext UnknownText_0x541a5, $0000
	loadtrainer WHITNEY, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	dotrigger $1
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
UnknownScript_0x54037: ; 0x54037
	loadfont
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalse UnknownScript_0x54044
	writetext UnknownText_0x541f4
	closetext
	loadmovesprites
	end
; 0x54044

UnknownScript_0x54044: ; 0x54044
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue UnknownScript_0x54077
	checkflag $001d
	iftrue UnknownScript_0x54064
	writetext UnknownText_0x54222
	keeptextopen
	waitbutton
	writetext UnknownText_0x54273
	playsound SFX_GET_BADGE
	waitbutton
	setflag $001d
	checkcode $7
	scall UnknownScript_0x5407d
UnknownScript_0x54064: ; 0x54064
	writetext UnknownText_0x5428b
	keeptextopen
	verbosegiveitem TM_45, 1
	iffalse UnknownScript_0x5407b
	setevent EVENT_GOT_TM45_ATTRACT
	writetext UnknownText_0x54302
	closetext
	loadmovesprites
	end
; 0x54077

UnknownScript_0x54077: ; 0x54077
	writetext UnknownText_0x54360
	closetext
UnknownScript_0x5407b: ; 0x5407b
	loadmovesprites
	end
; 0x5407d

UnknownScript_0x5407d: ; 0x5407d
	if_equal $7, UnknownScript_0x54089
	if_equal $6, UnknownScript_0x54086
	end
; 0x54086

UnknownScript_0x54086: ; 0x54086
	jumpstd $0012
; 0x54089

UnknownScript_0x54089: ; 0x54089
	jumpstd $0013
; 0x5408c

TrainerLassCarrie: ; 0x5408c
	; bit/flag number
	dw $515

	; trainer group && trainer id
	db LASS, CARRIE

	; text when seen
	dw LassCarrieSeenText

	; text when trainer beaten
	dw LassCarrieBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassCarrieScript
; 0x54098

LassCarrieScript: ; 0x54098
	talkaftercancel
	loadfont
	writetext LassCarrieOWText
	closetext
	loadmovesprites
	end
; 0x540a0

WhitneyCriesScript: ; 0x540a0
	showemote $0, $4, 15
	applymovement $4, BridgetWalksUpMovement
	spriteface $0, $0
	loadfont
	writetext BridgetWhitneyCriesText
	closetext
	loadmovesprites
	applymovement $4, BridgetWalksAwayMovement
	dotrigger $0
	clearevent EVENT_MADE_WHITNEY_CRY
	end
; 0x540bb

TrainerLassBridget: ; 0x540bb
	; bit/flag number
	dw $516

	; trainer group && trainer id
	db LASS, BRIDGET

	; text when seen
	dw LassBridgetSeenText

	; text when trainer beaten
	dw LassBridgetBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassBridgetScript
; 0x540c7

LassBridgetScript: ; 0x540c7
	talkaftercancel
	loadfont
	writetext LassBridgetOWText
	closetext
	loadmovesprites
	end
; 0x540cf

TrainerBeautyVictoria: ; 0x540cf
	; bit/flag number
	dw $4ad

	; trainer group && trainer id
	db BEAUTY, VICTORIA

	; text when seen
	dw BeautyVictoriaSeenText

	; text when trainer beaten
	dw BeautyVictoriaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BeautyVictoriaScript
; 0x540db

BeautyVictoriaScript: ; 0x540db
	talkaftercancel
	loadfont
	writetext BeautyVictoriaOWText
	closetext
	loadmovesprites
	end
; 0x540e3

TrainerBeautySamantha: ; 0x540e3
	; bit/flag number
	dw $4ae

	; trainer group && trainer id
	db BEAUTY, SAMANTHA

	; text when seen
	dw BeautySamanthaSeenText

	; text when trainer beaten
	dw BeautySamanthaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BeautySamanthaScript
; 0x540ef

BeautySamanthaScript: ; 0x540ef
	talkaftercancel
	loadfont
	writetext BeautySamanthaOWText
	closetext
	loadmovesprites
	end
; 0x540f7

GoldenrodGymGuyScript: ; 0x540f7
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuyWinScript
	loadfont
	writetext GoldenrodGymGuyText
	closetext
	loadmovesprites
	end

.GoldenrodGymGuyWinScript
	loadfont
	writetext GoldenrodGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x5410c

MapGoldenrodGymSignpost1Script: ; 0x5410c
	checkflag $001d
	iftrue UnknownScript_0x54115
	jumpstd $002d
; 0x54115

UnknownScript_0x54115: ; 0x54115
	trainertotext WHITNEY, 1, $1
	jumpstd $002e
; 0x5411c

BridgetWalksUpMovement: ; 0x5411c
	step_left
	turn_head_up
	step_end
; 0x5411f

BridgetWalksAwayMovement: ; 0x5411f
	step_right
	turn_head_left
	step_end
; 0x54122

UnknownText_0x54122: ; 0x54122
	text "Hi! I'm WHITNEY!"

	para "Everyone was into"
	line "#MON, so I got"
	cont "into it too!"

	para "#MON are"
	line "super-cute!"

	para "You want to bat-"
	line "tle? I'm warning"
	cont "you--I'm good!"
	done
; 0x541a5

UnknownText_0x541a5: ; 0x541a5
	text "Sob…"

	para "…Waaaaaaah!"
	line "You're mean!"

	para "You shouldn't be"
	line "so serious! You…"
	cont "you child, you!"
	done
; 0x541f4

UnknownText_0x541f4: ; 0x541f4
	text "Waaaaah!"

	para "Waaaaah!"

	para "…Snivel, hic…"
	line "…You meanie!"
	done
; 0x54222

UnknownText_0x54222: ; 0x54222
	text "…Sniff…"

	para "What? What do you"
	line "want? A BADGE?"

	para "Oh, right."
	line "I forgot. Here's"
	cont "PLAINBADGE."
	done
; 0x54273

UnknownText_0x54273: ; 0x54273
	text $52, " received"
	line "PLAINBADGE."
	done
; 0x5428b

UnknownText_0x5428b: ; 0x5428b
	text "PLAINBADGE lets"
	line "your #MON use"

	para "STRENGTH outside"
	line "of battle."

	para "It also boosts"
	line "your #MON's"
	cont "SPEED."

	para "Oh, you can have"
	line "this too!"
	done
; 0x54302

UnknownText_0x54302: ; 0x54302
	text "It's ATTRACT!"
	line "It makes full use"

	para "of a #MON's"
	line "charm."

	para "Isn't it just per-"
	line "fect for a cutie"
	cont "like me?"
	done
; 0x54360

UnknownText_0x54360: ; 0x54360
	text "Ah, that was a"
	line "good cry!"

	para "Come for a visit"
	line "again! Bye-bye!"
	done
; 0x5439b

LassCarrieSeenText: ; 0x5439b
	text "Don't let my"
	line "#MON's cute"

	para "looks fool you."
	line "They can whip you!"
	done
; 0x543d6

LassCarrieBeatenText: ; 0x543d6
	text "Darn… I thought"
	line "you were weak…"
	done
; 0x543f6

LassCarrieOWText: ; 0x543f6
	text "Do my #MON"
	line "think I'm cute?"
	done
; 0x54411

LassBridgetSeenText: ; 0x54411
	text "I like cute #-"
	line "MON better than"
	cont "strong #MON."

	para "But I have strong"
	line "and cute #MON!"
	done
; 0x5445f

LassBridgetBeatenText: ; 0x5445f
	text "Oh, no, no, no!"
	done
; 0x54470

LassBridgetOWText: ; 0x54470
	text "I'm trying to beat"
	line "WHITNEY, but…"
	cont "It's depressing."

	para "I'm okay! If I"
	line "lose, I'll just"

	para "try harder next"
	line "time!"
	done
; 0x544d4

BridgetWhitneyCriesText: ; 0x544d4
	text "Oh, no. You made"
	line "WHITNEY cry."

	para "It's OK. She'll"
	line "stop soon. She"

	para "always cries when"
	line "she loses."
	done
; 0x5452d

BeautyVictoriaSeenText: ; 0x5452d
	text "Oh, you are a cute"
	line "little trainer! "

	para "I like you, but I"
	line "won't hold back!"
	done
; 0x54574

BeautyVictoriaBeatenText: ; 0x54574
	text "Let's see… Oops,"
	line "it's over?"
	done
; 0x5458f

BeautyVictoriaOWText: ; 0x5458f
	text "Wow, you must be"
	line "good to beat me!"
	cont "Keep it up!"
	done
; 0x545be

BeautySamanthaSeenText: ; 0x545be
	text "Give it your best"
	line "shot, or I'll take"
	cont "you down!"
	done
; 0x545ed

BeautySamanthaBeatenText: ; 0x545ed
	text "No! Oh, MEOWTH,"
	line "I'm so sorry!"
	done
; 0x5460b

BeautySamanthaOWText: ; 0x5460b
	text "I taught MEOWTH"
	line "moves for taking"
	cont "on any type…"
	done
; 0x5463a

GoldenrodGymGuyText: ; 0x5463a
	text "Yo! CHAMP in"
	line "making!"

	para "This GYM is home"
	line "to normal-type"
	cont "#MON trainers."

	para "I recommend you"
	line "use fighting-type"
	cont "#MON."
	done
; 0x546a7

GoldenrodGymGuyWinText: ; 0x546a7
	text "You won? Great! I"
	line "was busy admiring"
	cont "the ladies here."
	done
; 0x546dd

GoldenrodGym_MapEventHeader: ; 0x546dd
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $11, $2, 1, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $11, $3, 1, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 1
	xy_trigger 1, $5, $8, $0, WhitneyCriesScript, $0, $0

	; signposts
	db 2
	signpost 15, 1, $0, MapGoldenrodGymSignpost1Script
	signpost 15, 4, $0, MapGoldenrodGymSignpost1Script

	; people-events
	db 6
	person_event SPRITE_WHITNEY, 7, 12, $6, $0, 255, 255, $80, 0, WhitneyScript_0x5400c, $ffff
	person_event SPRITE_LASS, 17, 13, $9, $0, 255, 255, $92, 4, TrainerLassCarrie, $ffff
	person_event SPRITE_LASS, 10, 13, $8, $0, 255, 255, $92, 1, TrainerLassBridget, $ffff
	person_event SPRITE_BUENA, 6, 4, $6, $0, 255, 255, $92, 3, TrainerBeautyVictoria, $ffff
	person_event SPRITE_BUENA, 9, 23, $6, $0, 255, 255, $92, 3, TrainerBeautySamantha, $ffff
	person_event SPRITE_GYM_GUY, 19, 9, $6, $0, 255, 255, $80, 0, GoldenrodGymGuyScript, $ffff
; 0x5474d

