BlackthornGym1F_MapScriptHeader: ; 0x194e00
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x194e05
; 0x194e05

UnknownScript_0x194e05: ; 0x194e05
	checkbit1 $0706
	iffalse UnknownScript_0x194e0f
	changeblock $8, $2, $3b
UnknownScript_0x194e0f: ; 0x194e0f
	checkbit1 $0707
	iffalse UnknownScript_0x194e19
	changeblock $2, $4, $3a
UnknownScript_0x194e19: ; 0x194e19
	checkbit1 $0708
	iffalse UnknownScript_0x194e23
	changeblock $8, $6, $3b
UnknownScript_0x194e23: ; 0x194e23
	return
; 0x194e24

ClairScript_0x194e24: ; 0x194e24
	faceplayer
	loadfont
	checkbit2 $0022
	iftrue UnknownScript_0x194e69
	checkbit1 $04c4
	iftrue UnknownScript_0x194e63
	2writetext UnknownText_0x194efa
	closetext
	loadmovesprites
	winlosstext UnknownText_0x194fd6, $0000
	loadtrainer CLAIR, 1
	startbattle
	returnafterbattle
	setbit1 $04c4
	loadfont
	2writetext UnknownText_0x19500e
	closetext
	loadmovesprites
	setbit1 $054a
	setbit1 $054b
	setbit1 $054c
	setbit1 $055d
	setbit1 $055e
	clearbit1 $0736
	setbit1 $074c
	clearbit1 $074d
	end
; 0x194e63

UnknownScript_0x194e63: ; 0x194e63
	2writetext UnknownText_0x195162
	closetext
	loadmovesprites
	end
; 0x194e69

UnknownScript_0x194e69: ; 0x194e69
	checkbit1 $000f
	iftrue UnknownScript_0x194e94
	2writetext UnknownText_0x195196
	keeptextopen
	giveitem TM_24, $1
	iffalse UnknownScript_0x194e8e
	itemtotext TM_24, $0
	2writetext UnknownText_0x1951bf
	playsound $0001
	waitbutton
	itemnotify
	setbit1 $000f
	2writetext UnknownText_0x1951d1
	keeptextopen
	2jump UnknownScript_0x194e94
; 0x194e8e

UnknownScript_0x194e8e: ; 0x194e8e
	2writetext UnknownText_0x19524f
	closetext
	loadmovesprites
	end
; 0x194e94

UnknownScript_0x194e94: ; 0x194e94
	2writetext UnknownText_0x195272
	closetext
	loadmovesprites
	end
; 0x194e9a

TrainerCooltrainermPaul: ; 0x194e9a
	; bit/flag number
	dw $54a

	; trainer group && trainer id
	db COOLTRAINERM, PAUL

	; text when seen
	dw CooltrainermPaulSeenText

	; text when trainer beaten
	dw CooltrainermPaulBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermPaulScript
; 0x194ea6

CooltrainermPaulScript: ; 0x194ea6
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1953f1
	closetext
	loadmovesprites
	end
; 0x194eae

TrainerCooltrainermMike: ; 0x194eae
	; bit/flag number
	dw $54c

	; trainer group && trainer id
	db COOLTRAINERM, MIKE

	; text when seen
	dw CooltrainermMikeSeenText

	; text when trainer beaten
	dw CooltrainermMikeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermMikeScript
; 0x194eba

CooltrainermMikeScript: ; 0x194eba
	talkaftercancel
	loadfont
	2writetext UnknownText_0x195467
	closetext
	loadmovesprites
	end
; 0x194ec2

TrainerCooltrainerfLola: ; 0x194ec2
	; bit/flag number
	dw $55e

	; trainer group && trainer id
	db COOLTRAINERF, LOLA

	; text when seen
	dw CooltrainerfLolaSeenText

	; text when trainer beaten
	dw CooltrainerfLolaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfLolaScript
; 0x194ece

CooltrainerfLolaScript: ; 0x194ece
	talkaftercancel
	loadfont
	2writetext UnknownText_0x195516
	closetext
	loadmovesprites
	end
; 0x194ed6

BlackthornGymGuyScript: ; 0x194ed6
	faceplayer
	loadfont
	checkbit1 $04c4
	iftrue .BlackthornGymGuyWinScript
	2writetext BlackthornGymGuyText
	closetext
	loadmovesprites
	end

.BlackthornGymGuyWinScript
	2writetext BlackthornGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x194eea

MapBlackthornGym1FSignpost1Script: ; 0x194eea
	checkbit2 $0022
	iftrue UnknownScript_0x194ef3
	jumpstd $002d
; 0x194ef3

UnknownScript_0x194ef3: ; 0x194ef3
	trainertotext CLAIR, 1, $1
	jumpstd $002e
; 0x194efa

UnknownText_0x194efa: ; 0x194efa
	db $0, "I am CLAIR.", $51
	db "The world's best", $4f
	db "dragon master.", $51
	db "I can hold my own", $4f
	db "against even the", $51
	db "#MON LEAGUE's", $4f
	db "ELITE FOUR.", $51
	db "Do you still want", $4f
	db "to take me on?", $51
	db "…Fine.", $4f
	db "Let's do it!", $51
	db "As a GYM LEADER,", $4f
	db "I will use my full", $51
	db "power against any", $4f
	db "opponent!", $57
; 0x194fd6

UnknownText_0x194fd6: ; 0x194fd6
	db $0, "I lost?", $51
	db "I don't believe", $4f
	db "it. There must be", $55
	db "some mistake…", $57
; 0x19500e

UnknownText_0x19500e: ; 0x19500e
	db $0, "I won't admit", $4f
	db "this.", $51
	db "I may have lost,", $4f
	db "but you're still", $51
	db "not ready for the", $4f
	db "#MON LEAGUE.", $51
	db "I know. You should", $4f
	db "take the dragon", $55
	db "user challenge.", $51
	db "Behind this GYM is", $4f
	db "a place called", $55
	db "DRAGON'S DEN.", $51
	db "There is a small", $4f
	db "shrine at its", $51
	db "center.", $4f
	db "Go there.", $51
	db "If you can prove", $4f
	db "that you've lost", $51
	db "your lazy ideals,", $4f
	db "I will recognize", $51
	db "you as a trainer", $4f
	db "worthy of a GYM", $55
	db "BADGE!", $57
; 0x195162

UnknownText_0x195162: ; 0x195162
	db $0, "What's the matter?", $51
	db "Is it too much to", $4f
	db "expect of you?", $57
; 0x195196

UnknownText_0x195196: ; 0x195196
	db $0, "You've kept me", $4f
	db "waiting!", $51
	db "Here! Take this!", $57
; 0x1951bf

UnknownText_0x1951bf: ; 0x1951bf
	db $0, $52, " received", $4f
	db "TM24.", $57
; 0x1951d1

UnknownText_0x1951d1: ; 0x1951d1
	db $0, "That contains", $4f
	db "DRAGONBREATH.", $51
	db "No, it doesn't", $4f
	db "have anything to", $55
	db "do with my breath.", $51
	db "If you don't want", $4f
	db "it, you don't have", $55
	db "to take it.", $57
; 0x19524f

UnknownText_0x19524f: ; 0x19524f
	db $0, "What is this? You", $4f
	db "don't have room?", $57
; 0x195272

UnknownText_0x195272: ; 0x195272
	db $0, "What's the matter?", $51
	db "Aren't you headed", $4f
	db "to the #MON", $55
	db "LEAGUE?", $51
	db "Don't you know", $4f
	db "where it is?", $51
	db "From here, go to", $4f
	db "NEW BARK TOWN.", $51
	db "Then SURF east.", $4f
	db "The route there is", $55
	db "very tough.", $51
	db "Don't you dare", $4f
	db "lose at the #-", $55
	db "MON LEAGUE!", $51
	db "If you do, I'll", $4f
	db "feel even worse", $51
	db "about having lost", $4f
	db "to you!", $51
	db "Give it every-", $4f
	db "thing you've got.", $57
; 0x195396

CooltrainermPaulSeenText: ; 0x195396
	db $0, "Your first battle", $4f
	db "against dragons?", $51
	db "I'll show you how", $4f
	db "tough they are!", $57
; 0x1953db

CooltrainermPaulBeatenText: ; 0x1953db
	db $0, "My dragon #MON", $4f
	db "lost?", $57
; 0x1953f1

UnknownText_0x1953f1: ; 0x1953f1
	db $0, "LANCE told you", $4f
	db "that he'd like to", $51
	db "see you again?", $4f
	db "Not a chance!", $57
; 0x19542f

CooltrainermMikeSeenText: ; 0x19542f
	db $0, "My chance of", $4f
	db "losing? Not even", $55
	db "one percent!", $57
; 0x19545b

CooltrainermMikeBeatenText: ; 0x19545b
	db $0, "That's odd.", $57
; 0x195467

UnknownText_0x195467: ; 0x195467
	db $0, "I know my short-", $4f
	db "comings now.", $51
	db "Thanks for showing", $4f
	db "me!", $57
; 0x19549d

CooltrainerfLolaSeenText: ; 0x19549d
	db $0, "Dragons are sacred", $4f
	db "#MON.", $51
	db "They are full of", $4f
	db "life energy.", $51
	db "If you're not", $4f
	db "serious, you won't", $51
	db "be able to beat", $4f
	db "them.", $57
; 0x19550a

CooltrainerfLolaBeatenText: ; 0x19550a
	db $0, "Way to go!", $57
; 0x195516

UnknownText_0x195516: ; 0x195516
	db $0, "Dragons are weak", $4f
	db "against dragon-", $55
	db "type moves.", $57
; 0x195544

BlackthornGymGuyText: ; 0x195544
	db $0, "Yo! CHAMP in", $4f
	db "making!", $51
	db "It's been a long", $4f
	db "journey, but we", $51
	db "are almost done!", $4f
	db "Count on me!", $51
	db "CLAIR uses the", $4f
	db "mythical and sac-", $55
	db "red dragon-type", $55
	db "#MON.", $51
	db "You can't damage", $4f
	db "them very easily.", $51
	db "But you know,", $4f
	db "they're supposed", $51
	db "to be weak against", $4f
	db "ice-type moves.", $57
; 0x195632

BlackthornGymGuyWinText: ; 0x195632
	db $0, "You were great to", $4f
	db "beat CLAIR!", $51
	db "All that's left is", $4f
	db "the #MON LEAGUE", $55
	db "challenge.", $51
	db "You're on the way", $4f
	db "to becoming the", $55
	db "#MON CHAMPION!", $57
; 0x1956ae

BlackthornGym1F_MapEventHeader: ; 0x1956ae
	; filler
	db 0, 0

	; warps
	db 7
	warp_def $11, $4, 1, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $11, $5, 1, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $1, 1, GROUP_BLACKTHORN_GYM_2F, MAP_BLACKTHORN_GYM_2F
	warp_def $9, $7, 2, GROUP_BLACKTHORN_GYM_2F, MAP_BLACKTHORN_GYM_2F
	warp_def $6, $2, 3, GROUP_BLACKTHORN_GYM_2F, MAP_BLACKTHORN_GYM_2F
	warp_def $7, $7, 4, GROUP_BLACKTHORN_GYM_2F, MAP_BLACKTHORN_GYM_2F
	warp_def $6, $7, 5, GROUP_BLACKTHORN_GYM_2F, MAP_BLACKTHORN_GYM_2F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 15, 3, $0, MapBlackthornGym1FSignpost1Script
	signpost 15, 6, $0, MapBlackthornGym1FSignpost1Script

	; people-events
	db 5
	person_event SPRITE_CLAIR, 7, 9, $6, $0, 255, 255, $90, 0, ClairScript_0x194e24, $ffff
	person_event SPRITE_COOLTRAINER_M, 10, 10, $6, $0, 255, 255, $82, 3, TrainerCooltrainermMike, $ffff
	person_event SPRITE_COOLTRAINER_M, 18, 5, $6, $0, 255, 255, $82, 3, TrainerCooltrainermPaul, $ffff
	person_event SPRITE_COOLTRAINER_F, 6, 13, $6, $0, 255, 255, $82, 1, TrainerCooltrainerfLola, $ffff
	person_event SPRITE_GYM_GUY, 19, 11, $6, $0, 255, 255, $80, 0, BlackthornGymGuyScript, $ffff
; 0x195722

