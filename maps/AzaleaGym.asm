AzaleaGym_MapScriptHeader: ; 0x18ec1c
	; trigger count
	db 0

	; callback count
	db 0
; 0x18ec1e

BugsyScript_0x18ec1e: ; 0x18ec1e
	faceplayer
	loadfont
	checkevent EVENT_BEAT_BUGSY
	iftrue UnknownScript_0x18ec48
	2writetext UnknownText_0x18ed0b
	closetext
	loadmovesprites
	winlosstext UnknownText_0x18edae, $0000
	loadtrainer BUGSY, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BUGSY
	loadfont
	2writetext UnknownText_0x18ee14
	playsound $009c
	waitbutton
	setbit2 $001c
	checkcode $7
	2call UnknownScript_0x18ec73
UnknownScript_0x18ec48: ; 0x18ec48
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue UnknownScript_0x18ec6d
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	2writetext UnknownText_0x18ee2b
	keeptextopen
	verbosegiveitem TM_49, 1
	iffalse UnknownScript_0x18ec71
	setevent EVENT_GOT_TM49_FURY_CUTTER
	2writetext UnknownText_0x18eefa
	closetext
	loadmovesprites
	end
; 0x18ec6d

UnknownScript_0x18ec6d: ; 0x18ec6d
	2writetext UnknownText_0x18ef98
	closetext
UnknownScript_0x18ec71: ; 0x18ec71
	loadmovesprites
	end
; 0x18ec73

UnknownScript_0x18ec73: ; 0x18ec73
	if_equal $7, UnknownScript_0x18ec7f
	if_equal $6, UnknownScript_0x18ec7c
	end
; 0x18ec7c

UnknownScript_0x18ec7c: ; 0x18ec7c
	jumpstd $0012
; 0x18ec7f

UnknownScript_0x18ec7f: ; 0x18ec7f
	jumpstd $0013
; 0x18ec82

TrainerTwinsAmyandmay1: ; 0x18ec82
	; bit/flag number
	dw $464

	; trainer group && trainer id
	db TWINS, AMYANDMAY1

	; text when seen
	dw TwinsAmyandmay1SeenText

	; text when trainer beaten
	dw TwinsAmyandmay1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsAmyandmay1Script
; 0x18ec8e

TwinsAmyandmay1Script: ; 0x18ec8e
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18f1fc
	closetext
	loadmovesprites
	end
; 0x18ec96

TrainerTwinsAmyandmay2: ; 0x18ec96
	; bit/flag number
	dw $464

	; trainer group && trainer id
	db TWINS, AMYANDMAY2

	; text when seen
	dw TwinsAmyandmay2SeenText

	; text when trainer beaten
	dw TwinsAmyandmay2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsAmyandmay2Script
; 0x18eca2

TwinsAmyandmay2Script: ; 0x18eca2
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18f269
	closetext
	loadmovesprites
	end
; 0x18ecaa

TrainerBug_catcherBug_catcher_benny: ; 0x18ecaa
	; bit/flag number
	dw $53c

	; trainer group && trainer id
	db BUG_CATCHER, BUG_CATCHER_BENNY

	; text when seen
	dw Bug_catcherBug_catcher_bennySeenText

	; text when trainer beaten
	dw Bug_catcherBug_catcher_bennyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherBug_catcher_bennyScript
; 0x18ecb6

Bug_catcherBug_catcher_bennyScript: ; 0x18ecb6
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18f053
	closetext
	loadmovesprites
	end
; 0x18ecbe

TrainerBug_catcherAl: ; 0x18ecbe
	; bit/flag number
	dw $53d

	; trainer group && trainer id
	db BUG_CATCHER, AL

	; text when seen
	dw Bug_catcherAlSeenText

	; text when trainer beaten
	dw Bug_catcherAlBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherAlScript
; 0x18ecca

Bug_catcherAlScript: ; 0x18ecca
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18f0d3
	closetext
	loadmovesprites
	end
; 0x18ecd2

TrainerBug_catcherJosh: ; 0x18ecd2
	; bit/flag number
	dw $53e

	; trainer group && trainer id
	db BUG_CATCHER, JOSH

	; text when seen
	dw Bug_catcherJoshSeenText

	; text when trainer beaten
	dw Bug_catcherJoshBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherJoshScript
; 0x18ecde

Bug_catcherJoshScript: ; 0x18ecde
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18f17e
	closetext
	loadmovesprites
	end
; 0x18ece6

AzaleaGymGuyScript: ; 0x18ece6
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuyWinScript
	loadfont
	2writetext AzaleaGymGuyText
	closetext
	loadmovesprites
	end

.AzaleaGymGuyWinScript
	loadfont
	2writetext AzaleaGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x18ecfb

MapAzaleaGymSignpost1Script: ; 0x18ecfb
	checkbit2 $001c
	iftrue UnknownScript_0x18ed04
	jumpstd $002d
; 0x18ed04

UnknownScript_0x18ed04: ; 0x18ed04
	trainertotext BUGSY, 1, $1
	jumpstd $002e
; 0x18ed0b

UnknownText_0x18ed0b: ; 0x18ed0b
	db $0, "I'm BUGSY!", $4f
	db "I never lose when", $51
	db "it comes to bug", $4f
	db "#MON.", $51
	db "My research is", $4f
	db "going to make me", $51
	db "the authority on", $4f
	db "bug #MON!", $51
	db "Let me demonstrate", $4f
	db "what I've learned", $55
	db "from my studies.", $57
; 0x18edae

UnknownText_0x18edae: ; 0x18edae
	db $0, "Whoa, amazing!", $4f
	db "You're an expert", $55
	db "on #MON!", $51
	db "My research isn't", $4f
	db "complete yet.", $51
	db "OK, you win. Take", $4f
	db "this BADGE.", $57
; 0x18ee14

UnknownText_0x18ee14: ; 0x18ee14
	db $0, $52, " received", $4f
	db "HIVEBADGE.", $57
; 0x18ee2b

UnknownText_0x18ee2b: ; 0x18ee2b
	db $0, "Do you know the", $4f
	db "benefits of HIVE-", $55
	db "BADGE?", $51
	db "If you have it,", $4f
	db "#MON up to L30", $51
	db "will obey you,", $4f
	db "even traded ones.", $51
	db "#MON that know", $4f
	db "CUT will be able", $51
	db "to use it outside", $4f
	db "of battle too.", $51
	db "Here, I also want", $4f
	db "you to have this.", $57
; 0x18eefa

UnknownText_0x18eefa: ; 0x18eefa
	db $0, "TM49 contains", $4f
	db "FURY CUTTER.", $51
	db "If you don't miss,", $4f
	db "it gets stronger", $55
	db "every turn.", $51
	db "The longer your", $4f
	db "battle goes, the", $55
	db "better it gets.", $51
	db "Isn't that great?", $4f
	db "I discovered it!", $57
; 0x18ef98

UnknownText_0x18ef98: ; 0x18ef98
	db $0, "Bug #MON are", $4f
	db "deep. There are", $51
	db "many mysteries to", $4f
	db "be explored.", $51
	db "Study your favor-", $4f
	db "ites thoroughly.", $57
; 0x18eff8

Bug_catcherBug_catcher_bennySeenText: ; 0x18eff8
	db $0, "Bug #MON evolve", $4f
	db "young. So they get", $51
	db "stronger that much", $4f
	db "faster.", $57
; 0x18f037

Bug_catcherBug_catcher_bennyBeatenText: ; 0x18f037
	db $0, "Just evolving", $4f
	db "isn't enough!", $57
; 0x18f053

UnknownText_0x18f053: ; 0x18f053
	db $0, "#MON become", $4f
	db "stronger if they", $55
	db "evolve. Really!", $57
; 0x18f081

Bug_catcherAlSeenText: ; 0x18f081
	db $0, "Bug #MON are", $4f
	db "cool and tough!", $51
	db "I'll prove it to", $4f
	db "you!", $57
; 0x18f0b4

Bug_catcherAlBeatenText: ; 0x18f0b4
	db $0, "You proved how", $4f
	db "tough you are…", $57
; 0x18f0d3

UnknownText_0x18f0d3: ; 0x18f0d3
	db $0, "They're so cool,", $4f
	db "but most girls", $51
	db "don't like bug", $4f
	db "#MON.", $51
	db "I don't know why…", $57
; 0x18f118

Bug_catcherJoshSeenText: ; 0x18f118
	db $0, "You saved all the", $4f
	db "SLOWPOKE? Whew,", $55
	db "you're mighty!", $51
	db "But my grown-up", $4f
	db "#MON are pretty", $55
	db "tough too!", $57
; 0x18f174

Bug_catcherJoshBeatenText: ; 0x18f174
	db $0, "Urrgggh!", $57
; 0x18f17e

UnknownText_0x18f17e: ; 0x18f17e
	db $0, "I guess I should", $4f
	db "teach them better", $55
	db "moves…", $57
; 0x18f1a9

TwinsAmyandmay1SeenText: ; 0x18f1a9
	db $0, "AMY: Hi! Are you", $4f
	db "challenging the", $55
	db "LEADER? No way!", $57
; 0x18f1db

TwinsAmyandmay1BeatenText: ; 0x18f1db
	db $0, "AMY & MAY: Oh,", $4f
	db "double goodness!", $57
; 0x18f1fc

UnknownText_0x18f1fc: ; 0x18f1fc
	db $0, "AMY: You're", $4f
	db "really strong!", $57
; 0x18f217

TwinsAmyandmay2SeenText: ; 0x18f217
	db $0, "MAY: You want to", $4f
	db "see the LEADER?", $55
	db "We come first!", $57
; 0x18f248

TwinsAmyandmay2BeatenText: ; 0x18f248
	db $0, "AMY & MAY: Oh,", $4f
	db "double goodness!", $57
; 0x18f269

UnknownText_0x18f269: ; 0x18f269
	db $0, "MAY: Our bug #-", $4f
	db "MON lost! Oh, what", $55
	db "a shame.", $57
; 0x18f296

AzaleaGymGuyText: ; 0x18f296
	db $0, "Yo, challenger!", $51
	db "BUGSY's young, but", $4f
	db "his knowledge of", $51
	db "bug #MON is for", $4f
	db "real.", $51
	db "It's going to be", $4f
	db "tough without my", $55
	db "advice.", $51
	db "Let's see… Bug", $4f
	db "#MON don't like", $55
	db "fire.", $51
	db "Flying-type moves", $4f
	db "are super-effec-", $55
	db "tive too.", $57
; 0x18f359

AzaleaGymGuyWinText: ; 0x18f359
	db $0, "Well done! That", $4f
	db "was a great clash", $51
	db "of talented young", $4f
	db "trainers.", $51
	db "With people like", $4f
	db "you, the future of", $55
	db "#MON is bright!", $57
; 0x18f3cc

AzaleaGym_MapEventHeader: ; 0x18f3cc
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $4, 5, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $f, $5, 5, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 3, $0, MapAzaleaGymSignpost1Script
	signpost 13, 6, $0, MapAzaleaGymSignpost1Script

	; people-events
	db 7
	person_event SPRITE_BUGSY, 11, 9, $3, $0, 255, 255, $a0, 0, BugsyScript_0x18ec1e, $ffff
	person_event SPRITE_BUG_CATCHER, 7, 9, $a, $0, 255, 255, $b2, 2, TrainerBug_catcherBug_catcher_benny, $ffff
	person_event SPRITE_BUG_CATCHER, 12, 12, $6, $0, 255, 255, $b2, 3, TrainerBug_catcherAl, $ffff
	person_event SPRITE_BUG_CATCHER, 6, 4, $6, $0, 255, 255, $b2, 3, TrainerBug_catcherJosh, $ffff
	person_event SPRITE_TWIN, 14, 8, $6, $0, 255, 255, $82, 1, TrainerTwinsAmyandmay1, $ffff
	person_event SPRITE_TWIN, 14, 9, $6, $0, 255, 255, $82, 1, TrainerTwinsAmyandmay2, $ffff
	person_event SPRITE_GYM_GUY, 17, 11, $6, $0, 255, 255, $80, 0, AzaleaGymGuyScript, $ffff
; 0x18f441



