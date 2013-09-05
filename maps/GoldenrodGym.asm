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
	checkbit1 EVENT_BEAT_WHITNEY
	iftrue UnknownScript_0x54037
	loadfont
	2writetext UnknownText_0x54122
	closetext
	loadmovesprites
	winlosstext UnknownText_0x541a5, $0000
	loadtrainer WHITNEY, 1
	startbattle
	returnafterbattle
	setbit1 EVENT_BEAT_WHITNEY
	setbit1 EVENT_MADE_WHITNEY_CRY
	dotrigger $1
	setbit1 EVENT_BEAT_BEAUTY_VICTORIA
	setbit1 EVENT_BEAT_BEAUTY_SAMANTHA
	setbit1 EVENT_BEAT_LASS_CARRIE
	setbit1 EVENT_BEAT_LASS_BRIDGET
UnknownScript_0x54037: ; 0x54037
	loadfont
	checkbit1 EVENT_MADE_WHITNEY_CRY
	iffalse UnknownScript_0x54044
	2writetext UnknownText_0x541f4
	closetext
	loadmovesprites
	end
; 0x54044

UnknownScript_0x54044: ; 0x54044
	checkbit1 EVENT_GOT_TM45_ATTRACT
	iftrue UnknownScript_0x54077
	checkbit2 $001d
	iftrue UnknownScript_0x54064
	2writetext UnknownText_0x54222
	keeptextopen
	waitbutton
	2writetext UnknownText_0x54273
	playsound $009c
	waitbutton
	setbit2 $001d
	checkcode $7
	2call UnknownScript_0x5407d
UnknownScript_0x54064: ; 0x54064
	2writetext UnknownText_0x5428b
	keeptextopen
	verbosegiveitem TM_45, 1
	iffalse UnknownScript_0x5407b
	setbit1 EVENT_GOT_TM45_ATTRACT
	2writetext UnknownText_0x54302
	closetext
	loadmovesprites
	end
; 0x54077

UnknownScript_0x54077: ; 0x54077
	2writetext UnknownText_0x54360
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
	2writetext LassCarrieOWText
	closetext
	loadmovesprites
	end
; 0x540a0

WhitneyCriesScript: ; 0x540a0
	showemote $0, $4, 15
	applymovement $4, BridgetWalksUpMovement
	spriteface $0, $0
	loadfont
	2writetext BridgetWhitneyCriesText
	closetext
	loadmovesprites
	applymovement $4, BridgetWalksAwayMovement
	dotrigger $0
	clearbit1 EVENT_MADE_WHITNEY_CRY
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
	2writetext LassBridgetOWText
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
	2writetext BeautyVictoriaOWText
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
	2writetext BeautySamanthaOWText
	closetext
	loadmovesprites
	end
; 0x540f7

GoldenrodGymGuyScript: ; 0x540f7
	faceplayer
	checkbit1 EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuyWinScript
	loadfont
	2writetext GoldenrodGymGuyText
	closetext
	loadmovesprites
	end

.GoldenrodGymGuyWinScript
	loadfont
	2writetext GoldenrodGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x5410c

MapGoldenrodGymSignpost1Script: ; 0x5410c
	checkbit2 $001d
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
	db $0, "Hi! I'm WHITNEY!", $51
	db "Everyone was into", $4f
	db "#MON, so I got", $55
	db "into it too!", $51
	db "#MON are", $4f
	db "super-cute!", $51
	db "You want to bat-", $4f
	db "tle? I'm warning", $55
	db "you--I'm good!", $57
; 0x541a5

UnknownText_0x541a5: ; 0x541a5
	db $0, "Sob…", $51
	db "…Waaaaaaah!", $4f
	db "You're mean!", $51
	db "You shouldn't be", $4f
	db "so serious! You…", $55
	db "you child, you!", $57
; 0x541f4

UnknownText_0x541f4: ; 0x541f4
	db $0, "Waaaaah!", $51
	db "Waaaaah!", $51
	db "…Snivel, hic…", $4f
	db "…You meanie!", $57
; 0x54222

UnknownText_0x54222: ; 0x54222
	db $0, "…Sniff…", $51
	db "What? What do you", $4f
	db "want? A BADGE?", $51
	db "Oh, right.", $4f
	db "I forgot. Here's", $55
	db "PLAINBADGE.", $57
; 0x54273

UnknownText_0x54273: ; 0x54273
	db $0, $52, " received", $4f
	db "PLAINBADGE.", $57
; 0x5428b

UnknownText_0x5428b: ; 0x5428b
	db $0, "PLAINBADGE lets", $4f
	db "your #MON use", $51
	db "STRENGTH outside", $4f
	db "of battle.", $51
	db "It also boosts", $4f
	db "your #MON's", $55
	db "SPEED.", $51
	db "Oh, you can have", $4f
	db "this too!", $57
; 0x54302

UnknownText_0x54302: ; 0x54302
	db $0, "It's ATTRACT!", $4f
	db "It makes full use", $51
	db "of a #MON's", $4f
	db "charm.", $51
	db "Isn't it just per-", $4f
	db "fect for a cutie", $55
	db "like me?", $57
; 0x54360

UnknownText_0x54360: ; 0x54360
	db $0, "Ah, that was a", $4f
	db "good cry!", $51
	db "Come for a visit", $4f
	db "again! Bye-bye!", $57
; 0x5439b

LassCarrieSeenText: ; 0x5439b
	db $0, "Don't let my", $4f
	db "#MON's cute", $51
	db "looks fool you.", $4f
	db "They can whip you!", $57
; 0x543d6

LassCarrieBeatenText: ; 0x543d6
	db $0, "Darn… I thought", $4f
	db "you were weak…", $57
; 0x543f6

LassCarrieOWText: ; 0x543f6
	db $0, "Do my #MON", $4f
	db "think I'm cute?", $57
; 0x54411

LassBridgetSeenText: ; 0x54411
	db $0, "I like cute #-", $4f
	db "MON better than", $55
	db "strong #MON.", $51
	db "But I have strong", $4f
	db "and cute #MON!", $57
; 0x5445f

LassBridgetBeatenText: ; 0x5445f
	db $0, "Oh, no, no, no!", $57
; 0x54470

LassBridgetOWText: ; 0x54470
	db $0, "I'm trying to beat", $4f
	db "WHITNEY, but…", $55
	db "It's depressing.", $51
	db "I'm okay! If I", $4f
	db "lose, I'll just", $51
	db "try harder next", $4f
	db "time!", $57
; 0x544d4

BridgetWhitneyCriesText: ; 0x544d4
	db $0, "Oh, no. You made", $4f
	db "WHITNEY cry.", $51
	db "It's OK. She'll", $4f
	db "stop soon. She", $51
	db "always cries when", $4f
	db "she loses.", $57
; 0x5452d

BeautyVictoriaSeenText: ; 0x5452d
	db $0, "Oh, you are a cute", $4f
	db "little trainer! ", $51
	db "I like you, but I", $4f
	db "won't hold back!", $57
; 0x54574

BeautyVictoriaBeatenText: ; 0x54574
	db $0, "Let's see… Oops,", $4f
	db "it's over?", $57
; 0x5458f

BeautyVictoriaOWText: ; 0x5458f
	db $0, "Wow, you must be", $4f
	db "good to beat me!", $55
	db "Keep it up!", $57
; 0x545be

BeautySamanthaSeenText: ; 0x545be
	db $0, "Give it your best", $4f
	db "shot, or I'll take", $55
	db "you down!", $57
; 0x545ed

BeautySamanthaBeatenText: ; 0x545ed
	db $0, "No! Oh, MEOWTH,", $4f
	db "I'm so sorry!", $57
; 0x5460b

BeautySamanthaOWText: ; 0x5460b
	db $0, "I taught MEOWTH", $4f
	db "moves for taking", $55
	db "on any type…", $57
; 0x5463a

GoldenrodGymGuyText: ; 0x5463a
	db $0, "Yo! CHAMP in", $4f
	db "making!", $51
	db "This GYM is home", $4f
	db "to normal-type", $55
	db "#MON trainers.", $51
	db "I recommend you", $4f
	db "use fighting-type", $55
	db "#MON.", $57
; 0x546a7

GoldenrodGymGuyWinText: ; 0x546a7
	db $0, "You won? Great! I", $4f
	db "was busy admiring", $55
	db "the ladies here.", $57
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

