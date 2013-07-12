FuchsiaGym_MapScriptHeader: ; 0x195db7
	; trigger count
	db 0

	; callback count
	db 0
; 0x195db9

JanineScript_0x195db9: ; 0x195db9
	checkbit2 $0027
	iftrue UnknownScript_0x195e00
	applymovement $2, MovementData_0x195f27
	faceplayer
	loadfont
	2writetext UnknownText_0x195f35
	closetext
	loadmovesprites
	winlosstext UnknownText_0x195fa1, $0000
	loadtrainer JANINE, 1
	startbattle
	returnafterbattle
	setbit1 $04c9
	setbit1 $0517
	setbit1 $051a
	setbit1 $0482
	setbit1 $041e
	variablesprite $7, $28
	variablesprite $8, $28
	variablesprite $9, $28
	variablesprite $a, $27
	special $005e
	loadfont
	2writetext UnknownText_0x195feb
	playsound $009c
	waitbutton
	setbit2 $0027
	2jump UnknownScript_0x195e02
; 0x195e00

UnknownScript_0x195e00: ; 0x195e00
	faceplayer
	loadfont
UnknownScript_0x195e02: ; 0x195e02
	checkbit1 $00dd
	iftrue UnknownScript_0x195e15
	2writetext UnknownText_0x196002
	keeptextopen
	verbosegiveitem TM_06, 1
	iffalse UnknownScript_0x195e15
	setbit1 $00dd
UnknownScript_0x195e15: ; 0x195e15
	2writetext UnknownText_0x196074
	closetext
	loadmovesprites
	end
; 0x195e1b

FuschiaGym1Script_0x195e1b: ; 0x195e1b
	checkbit1 $0517
	iftrue UnknownScript_0x195e2c
	applymovement $3, MovementData_0x195f27
	faceplayer
	variablesprite $7, $28
	special $005e
UnknownScript_0x195e2c: ; 0x195e2c
	faceplayer
	loadfont
	checkbit1 $0517
	iftrue UnknownScript_0x195e4f
	2writetext UnknownText_0x1960e6
	closetext
	loadmovesprites
	winlosstext UnknownText_0x196126, $0000
	loadtrainer LASS, ALICE
	startbattle
	iftrue UnknownScript_0x195e4a
	returnafterbattle
	setbit1 $0517
	end
; 0x195e4a

UnknownScript_0x195e4a: ; 0x195e4a
	variablesprite $7, $a
	returnafterbattle
	end
; 0x195e4f

UnknownScript_0x195e4f: ; 0x195e4f
	2writetext UnknownText_0x196139
	closetext
	loadmovesprites
	end
; 0x195e55

FuschiaGym2Script_0x195e55: ; 0x195e55
	checkbit1 $051a
	iftrue UnknownScript_0x195e66
	applymovement $4, MovementData_0x195f27
	faceplayer
	variablesprite $8, $28
	special $005e
UnknownScript_0x195e66: ; 0x195e66
	faceplayer
	loadfont
	checkbit1 $051a
	iftrue UnknownScript_0x195e89
	2writetext UnknownText_0x196166
	closetext
	loadmovesprites
	winlosstext UnknownText_0x19617b, $0000
	loadtrainer LASS, LINDA
	startbattle
	iftrue UnknownScript_0x195e84
	returnafterbattle
	setbit1 $051a
	end
; 0x195e84

UnknownScript_0x195e84: ; 0x195e84
	variablesprite $8, $a
	returnafterbattle
	end
; 0x195e89

UnknownScript_0x195e89: ; 0x195e89
	2writetext UnknownText_0x196199
	closetext
	loadmovesprites
	end
; 0x195e8f

FuschiaGym3Script_0x195e8f: ; 0x195e8f
	checkbit1 $0482
	iftrue UnknownScript_0x195ea0
	applymovement $5, MovementData_0x195f27
	faceplayer
	variablesprite $9, $28
	special $005e
UnknownScript_0x195ea0: ; 0x195ea0
	faceplayer
	loadfont
	checkbit1 $0482
	iftrue UnknownScript_0x195ec3
	2writetext UnknownText_0x1961bb
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1961f1, $0000
	loadtrainer PICNICKER, CINDY
	startbattle
	iftrue UnknownScript_0x195ebe
	returnafterbattle
	setbit1 $0482
	end
; 0x195ebe

UnknownScript_0x195ebe: ; 0x195ebe
	variablesprite $9, $a
	returnafterbattle
	end
; 0x195ec3

UnknownScript_0x195ec3: ; 0x195ec3
	2writetext UnknownText_0x19620c
	closetext
	loadmovesprites
	end
; 0x195ec9

FuschiaGym4Script_0x195ec9: ; 0x195ec9
	checkbit1 $041e
	iftrue UnknownScript_0x195eda
	applymovement $6, MovementData_0x195f27
	faceplayer
	variablesprite $a, $27
	special $005e
UnknownScript_0x195eda: ; 0x195eda
	faceplayer
	loadfont
	checkbit1 $041e
	iftrue UnknownScript_0x195efd
	2writetext UnknownText_0x196228
	closetext
	loadmovesprites
	winlosstext UnknownText_0x19624a, $0000
	loadtrainer CAMPER, BARRY
	startbattle
	iftrue UnknownScript_0x195ef8
	returnafterbattle
	setbit1 $041e
	end
; 0x195ef8

UnknownScript_0x195ef8: ; 0x195ef8
	variablesprite $a, $a
	returnafterbattle
	end
; 0x195efd

UnknownScript_0x195efd: ; 0x195efd
	2writetext UnknownText_0x19626b
	closetext
	loadmovesprites
	end
; 0x195f03

FuchsiaGymGuyScript: ; 0x195f03
	faceplayer
	loadfont
	checkbit1 $04c9
	iftrue .FuchsiaGymGuyWinScript
	2writetext FuchsiaGymGuyText
	closetext
	loadmovesprites
	end

.FuchsiaGymGuyWinScript
	2writetext FuchsiaGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x195f17

MapFuchsiaGymSignpost1Script: ; 0x195f17
	checkbit2 $0027
	iftrue UnknownScript_0x195f20
	jumpstd $002d
; 0x195f20

UnknownScript_0x195f20: ; 0x195f20
	trainertotext JANINE, 1, $1
	jumpstd $002e
; 0x195f27

MovementData_0x195f27: ; 0x195f27
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end
; 0x195f35

UnknownText_0x195f35: ; 0x195f35
	db $0, "Fufufufu…", $51
	db "I'm sorry to dis-", $4f
	db "appoint you…", $51
	db "I'm only joking!", $51
	db "I'm the real deal!", $51
	db "JANINE of FUCHSIA", $4f
	db "GYM, that's me!", $57
; 0x195fa1

UnknownText_0x195fa1: ; 0x195fa1
	db $0, "JANINE: You're a", $4f
	db "tough one. You", $55
	db "definitely won…", $51
	db "Here's SOULBADGE.", $4f
	db "Take it.", $57
; 0x195feb

UnknownText_0x195feb: ; 0x195feb
	db $0, $52, " received", $4f
	db "SOULBADGE.", $57
; 0x196002

UnknownText_0x196002: ; 0x196002
	db $0, "JANINE: You're so", $4f
	db "tough! I have a", $55
	db "special gift!", $51
	db "It's TOXIC, a pow-", $4f
	db "erful poison that", $51
	db "steadily saps the", $4f
	db "victim's HP.", $57
; 0x196074

UnknownText_0x196074: ; 0x196074
	db $0, "JANINE: I'm going", $4f
	db "to really apply", $51
	db "myself and improve", $4f
	db "my skills.", $51
	db "I want to become", $4f
	db "better than both", $55
	db "Father and you!", $57
; 0x1960e6

UnknownText_0x1960e6: ; 0x1960e6
	db $0, "Fufufu!", $51
	db "I'm JANINE, the", $4f
	db "GYM LEADER!", $51
	db "No, I'm not!", $4f
	db "Gotcha, sucker!", $57
; 0x196126

UnknownText_0x196126: ; 0x196126
	db $0, "I had you fooled…", $57
; 0x196139

UnknownText_0x196139: ; 0x196139
	db $0, "How will you dis-", $4f
	db "tinguish our real", $55
	db "LEADER?", $57
; 0x196166

UnknownText_0x196166: ; 0x196166
	db $0, "Fooled you!", $4f
	db "Hahaha!", $57
; 0x19617b

UnknownText_0x19617b: ; 0x19617b
	db $0, "Ooh… I lost…", $4f
	db "You're not weak…", $57
; 0x196199

UnknownText_0x196199: ; 0x196199
	db $0, "Well? Wasn't my", $4f
	db "disguise perfect?", $57
; 0x1961bb

UnknownText_0x1961bb: ; 0x1961bb
	db $0, "I'm JANINE!", $51
	db "How did you know I", $4f
	db "was real?", $51
	db "Let's battle!", $57
; 0x1961f1

UnknownText_0x1961f1: ; 0x1961f1
	db $0, "Darn it!", $4f
	db "I wanted to win!", $57
; 0x19620c

UnknownText_0x19620c: ; 0x19620c
	db $0, "You must be", $4f
	db "getting tired.", $57
; 0x196228

UnknownText_0x196228: ; 0x196228
	db $0, "Wahahaha!", $51
	db "You betcha!", $4f
	db "I'm JANINE!", $57
; 0x19624a

UnknownText_0x19624a: ; 0x19624a
	db $0, "My disguise was", $4f
	db "right on! Dang!", $57
; 0x19626b

UnknownText_0x19626b: ; 0x19626b
	db $0, "Hey, you. Was my", $4f
	db "disguise cute or", $55
	db "what, huh?", $57
; 0x196299

FuchsiaGymGuyText: ; 0x196299
	db $0, "Yo, CHAMP in", $4f
	db "making!", $51
	db "Whoops! Take a", $4f
	db "good look around", $51
	db "you. The trainers", $4f
	db "all look like the", $55
	db "LEADER, JANINE.", $51
	db "Which of them is", $4f
	db "the real JANINE?", $57
; 0x196325

FuchsiaGymGuyWinText: ; 0x196325
	db $0, "That was a great", $4f
	db "battle, trainer", $55
	db "from JOHTO!", $57
; 0x196353

FuchsiaGym_MapEventHeader: ; 0x196353
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $11, $4, 3, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $11, $5, 3, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 15, 3, $0, MapFuchsiaGymSignpost1Script
	signpost 15, 6, $0, MapFuchsiaGymSignpost1Script

	; people-events
	db 6
	person_event SPRITE_JANINE, 14, 5, $3, $0, 255, 255, $90, 0, JanineScript_0x195db9, $ffff
	person_event SPRITE_FUSCHIA_GYM_1, 11, 9, $a, $0, 255, 255, $90, 0, FuschiaGym1Script_0x195e1b, $ffff
	person_event SPRITE_FUSCHIA_GYM_2, 15, 9, $a, $0, 255, 255, $90, 0, FuschiaGym2Script_0x195e55, $ffff
	person_event SPRITE_FUSCHIA_GYM_3, 8, 13, $a, $0, 255, 255, $90, 0, FuschiaGym3Script_0x195e8f, $ffff
	person_event SPRITE_FUSCHIA_GYM_4, 6, 8, $a, $0, 255, 255, $90, 0, FuschiaGym4Script_0x195ec9, $ffff
	person_event SPRITE_GYM_GUY, 19, 11, $6, $0, 255, 255, $90, 0, FuchsiaGymGuyScript, $ffff
; 0x1963bb

