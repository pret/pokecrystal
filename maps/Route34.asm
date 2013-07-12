Route34_MapScriptHeader: ; 0x78000
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x78005
; 0x78005

UnknownScript_0x78005: ; 0x78005
	checkbit2 $0005
	iftrue UnknownScript_0x78014
	clearbit1 $06e5
	setbit1 $06e6
	2jump UnknownScript_0x7801d
; 0x78014

UnknownScript_0x78014: ; 0x78014
	setbit1 $06e5
	clearbit1 $06e6
	2jump UnknownScript_0x7801d
; 0x7801d

UnknownScript_0x7801d: ; 0x7801d
	checkbit2 $0006
	iffalse UnknownScript_0x78029
	clearbit1 $06e7
	2jump UnknownScript_0x7802f
; 0x78029

UnknownScript_0x78029: ; 0x78029
	setbit1 $06e7
	2jump UnknownScript_0x7802f
; 0x7802f

UnknownScript_0x7802f: ; 0x7802f
	checkbit2 $0007
	iffalse UnknownScript_0x78039
	clearbit1 $06e8
	return
; 0x78039

UnknownScript_0x78039: ; 0x78039
	setbit1 $06e8
	return
; 0x7803d

GrampsScript_0x7803d: ; 0x7803d
	faceplayer
	loadfont
	special $0020
	closetext
	loadmovesprites
	if_equal $1, UnknownScript_0x7805a
	clearbit2 $0005
	checkcode $9
	if_equal $3, UnknownScript_0x7805b
	applymovement $8, MovementData_0x78333
	playsound $001f
	disappear $8
UnknownScript_0x7805a: ; 0x7805a
	end
; 0x7805b

UnknownScript_0x7805b: ; 0x7805b
	applymovement $8, MovementData_0x78337
	playsound $001f
	disappear $8
	end
; 0x78065

DaycareMon1Script_0x78065: ; 0x78065
	loadfont
	special $0045
	loadmovesprites
	end
; 0x7806b

DaycareMon2Script_0x7806b: ; 0x7806b
	loadfont
	special $0046
	loadmovesprites
	end
; 0x78071

TrainerCamperTodd1: ; 0x78071
	; bit/flag number
	dw $41b

	; trainer group && trainer id
	db CAMPER, TODD1

	; text when seen
	dw CamperTodd1SeenText

	; text when trainer beaten
	dw CamperTodd1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperTodd1Script
; 0x7807d

CamperTodd1Script: ; 0x7807d
	writecode $17, $14
	talkaftercancel
	loadfont
	checkbit2 $0070
	iftrue UnknownScript_0x780bd
	checkbit2 $0061
	iftrue UnknownScript_0x78131
	checkcellnum $14
	iftrue UnknownScript_0x78143
	checkbit1 $027d
	iftrue UnknownScript_0x780a6
	2writetext UnknownText_0x784f0
	keeptextopen
	setbit1 $027d
	2call UnknownScript_0x78137
	2jump UnknownScript_0x780a9
; 0x780a6

UnknownScript_0x780a6: ; 0x780a6
	2call UnknownScript_0x7813b
UnknownScript_0x780a9: ; 0x780a9
	askforphonenumber $14
	if_equal $1, UnknownScript_0x7814b
	if_equal $2, UnknownScript_0x78147
	trainertotext CAMPER, TODD1, $0
	2call UnknownScript_0x7813f
	2jump UnknownScript_0x78143
; 0x780bd

UnknownScript_0x780bd: ; 0x780bd
	2call UnknownScript_0x7814f
	winlosstext CamperTodd1BeatenText, $0000
	copybytetovar $d9fe
	if_equal $4, UnknownScript_0x780dc
	if_equal $3, UnknownScript_0x780e2
	if_equal $2, UnknownScript_0x780e8
	if_equal $1, UnknownScript_0x780ee
	if_equal $0, UnknownScript_0x780f4
UnknownScript_0x780dc: ; 0x780dc
	checkbit1 $00cd
	iftrue UnknownScript_0x78128
UnknownScript_0x780e2: ; 0x780e2
	checkbit1 $0044
	iftrue UnknownScript_0x7811b
UnknownScript_0x780e8: ; 0x780e8
	checkbit2 $004b
	iftrue UnknownScript_0x7810e
UnknownScript_0x780ee: ; 0x780ee
	checkbit2 $0045
	iftrue UnknownScript_0x78101
UnknownScript_0x780f4: ; 0x780f4
	loadtrainer CAMPER, TODD1
	startbattle
	returnafterbattle
	loadvar $d9fe, $1
	clearbit2 $0070
	end
; 0x78101

UnknownScript_0x78101: ; 0x78101
	loadtrainer CAMPER, TODD2
	startbattle
	returnafterbattle
	loadvar $d9fe, $2
	clearbit2 $0070
	end
; 0x7810e

UnknownScript_0x7810e: ; 0x7810e
	loadtrainer CAMPER, TODD3
	startbattle
	returnafterbattle
	loadvar $d9fe, $3
	clearbit2 $0070
	end
; 0x7811b

UnknownScript_0x7811b: ; 0x7811b
	loadtrainer CAMPER, TODD4
	startbattle
	returnafterbattle
	loadvar $d9fe, $4
	clearbit2 $0070
	end
; 0x78128

UnknownScript_0x78128: ; 0x78128
	loadtrainer CAMPER, TODD5
	startbattle
	returnafterbattle
	clearbit2 $0070
	end
; 0x78131

UnknownScript_0x78131: ; 0x78131
	2writetext UnknownText_0x78532
	closetext
	loadmovesprites
	end
; 0x78137

UnknownScript_0x78137: ; 0x78137
	jumpstd $0019
	end
; 0x7813b

UnknownScript_0x7813b: ; 0x7813b
	jumpstd $001a
	end
; 0x7813f

UnknownScript_0x7813f: ; 0x7813f
	jumpstd $001b
	end
; 0x78143

UnknownScript_0x78143: ; 0x78143
	jumpstd $001c
	end
; 0x78147

UnknownScript_0x78147: ; 0x78147
	jumpstd $001d
	end
; 0x7814b

UnknownScript_0x7814b: ; 0x7814b
	jumpstd $001e
	end
; 0x7814f

UnknownScript_0x7814f: ; 0x7814f
	jumpstd $001f
	end
; 0x78153

TrainerPicnickerGina1: ; 0x78153
	; bit/flag number
	dw $47f

	; trainer group && trainer id
	db PICNICKER, GINA1

	; text when seen
	dw PicnickerGina1SeenText

	; text when trainer beaten
	dw PicnickerGina1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerGina1Script
; 0x7815f

PicnickerGina1Script: ; 0x7815f
	writecode $17, $15
	talkaftercancel
	loadfont
	checkbit2 $0071
	iftrue UnknownScript_0x7819f
	checkbit2 $0080
	iftrue UnknownScript_0x78213
	checkcellnum $15
	iftrue UnknownScript_0x78234
	checkbit1 $027f
	iftrue UnknownScript_0x78188
	2writetext UnknownText_0x785b8
	keeptextopen
	setbit1 $027f
	2call UnknownScript_0x78228
	2jump UnknownScript_0x7818b
; 0x78188

UnknownScript_0x78188: ; 0x78188
	2call UnknownScript_0x7822c
UnknownScript_0x7818b: ; 0x7818b
	askforphonenumber $15
	if_equal $1, UnknownScript_0x7823c
	if_equal $2, UnknownScript_0x78238
	trainertotext PICNICKER, GINA1, $0
	2call UnknownScript_0x78230
	2jump UnknownScript_0x78234
; 0x7819f

UnknownScript_0x7819f: ; 0x7819f
	2call UnknownScript_0x78240
	winlosstext PicnickerGina1BeatenText, $0000
	copybytetovar $d9ff
	if_equal $4, UnknownScript_0x781be
	if_equal $3, UnknownScript_0x781c4
	if_equal $2, UnknownScript_0x781ca
	if_equal $1, UnknownScript_0x781d0
	if_equal $0, UnknownScript_0x781d6
UnknownScript_0x781be: ; 0x781be
	checkbit1 $00cd
	iftrue UnknownScript_0x7820a
UnknownScript_0x781c4: ; 0x781c4
	checkbit1 $0044
	iftrue UnknownScript_0x781fd
UnknownScript_0x781ca: ; 0x781ca
	checkbit1 $0021
	iftrue UnknownScript_0x781f0
UnknownScript_0x781d0: ; 0x781d0
	checkbit2 $0049
	iftrue UnknownScript_0x781e3
UnknownScript_0x781d6: ; 0x781d6
	loadtrainer PICNICKER, GINA1
	startbattle
	returnafterbattle
	loadvar $d9ff, $1
	clearbit2 $0071
	end
; 0x781e3

UnknownScript_0x781e3: ; 0x781e3
	loadtrainer PICNICKER, GINA2
	startbattle
	returnafterbattle
	loadvar $d9ff, $2
	clearbit2 $0071
	end
; 0x781f0

UnknownScript_0x781f0: ; 0x781f0
	loadtrainer PICNICKER, GINA3
	startbattle
	returnafterbattle
	loadvar $d9ff, $3
	clearbit2 $0071
	end
; 0x781fd

UnknownScript_0x781fd: ; 0x781fd
	loadtrainer PICNICKER, GINA4
	startbattle
	returnafterbattle
	loadvar $d9ff, $4
	clearbit2 $0071
	end
; 0x7820a

UnknownScript_0x7820a: ; 0x7820a
	loadtrainer PICNICKER, GINA5
	startbattle
	returnafterbattle
	clearbit2 $0071
	end
; 0x78213

UnknownScript_0x78213: ; 0x78213
	2call UnknownScript_0x78244
	verbosegiveitem LEAF_STONE, 1
	iffalse UnknownScript_0x78225
	clearbit2 $0080
	setbit1 $0100
	2jump UnknownScript_0x78234
; 0x78225

UnknownScript_0x78225: ; 0x78225
	2jump UnknownScript_0x78248
; 0x78228

UnknownScript_0x78228: ; 0x78228
	jumpstd $0023
	end
; 0x7822c

UnknownScript_0x7822c: ; 0x7822c
	jumpstd $0024
	end
; 0x78230

UnknownScript_0x78230: ; 0x78230
	jumpstd $0025
	end
; 0x78234

UnknownScript_0x78234: ; 0x78234
	jumpstd $0026
	end
; 0x78238

UnknownScript_0x78238: ; 0x78238
	jumpstd $0027
	end
; 0x7823c

UnknownScript_0x7823c: ; 0x7823c
	jumpstd $0028
	end
; 0x78240

UnknownScript_0x78240: ; 0x78240
	jumpstd $0029
	end
; 0x78244

UnknownScript_0x78244: ; 0x78244
	jumpstd $002a
	end
; 0x78248

UnknownScript_0x78248: ; 0x78248
	jumpstd $002b
	end
; 0x7824c

OfficerScript_0x7824c: ; 0x7824c
	faceplayer
	loadfont
	checktime $4
	iffalse UnknownScript_0x78276
	checkbit1 $0546
	iftrue UnknownScript_0x78270
	playmusic $000c
	2writetext UnknownText_0x785e4
	closetext
	loadmovesprites
	winlosstext UnknownText_0x78609, $0000
	loadtrainer OFFICER, KEITH
	startbattle
	returnafterbattle
	setbit1 $0546
	loadmovesprites
	end
; 0x78270

UnknownScript_0x78270: ; 0x78270
	2writetext UnknownText_0x78624
	closetext
	loadmovesprites
	end
; 0x78276

UnknownScript_0x78276: ; 0x78276
	2writetext UnknownText_0x7866a
	closetext
	loadmovesprites
	end
; 0x7827c

TrainerYoungsterSamuel: ; 0x7827c
	; bit/flag number
	dw $5ad

	; trainer group && trainer id
	db YOUNGSTER, SAMUEL

	; text when seen
	dw YoungsterSamuelSeenText

	; text when trainer beaten
	dw YoungsterSamuelBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterSamuelScript
; 0x78288

YoungsterSamuelScript: ; 0x78288
	talkaftercancel
	loadfont
	2writetext UnknownText_0x783d8
	closetext
	loadmovesprites
	end
; 0x78290

TrainerYoungsterIan: ; 0x78290
	; bit/flag number
	dw $5ae

	; trainer group && trainer id
	db YOUNGSTER, IAN

	; text when seen
	dw YoungsterIanSeenText

	; text when trainer beaten
	dw YoungsterIanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterIanScript
; 0x7829c

YoungsterIanScript: ; 0x7829c
	talkaftercancel
	loadfont
	2writetext UnknownText_0x78469
	closetext
	loadmovesprites
	end
; 0x782a4

TrainerPokefanmBrandon: ; 0x782a4
	; bit/flag number
	dw $4d3

	; trainer group && trainer id
	db POKEFANM, BRANDON

	; text when seen
	dw PokefanmBrandonSeenText

	; text when trainer beaten
	dw PokefanmBrandonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmBrandonScript
; 0x782b0

PokefanmBrandonScript: ; 0x782b0
	talkaftercancel
	loadfont
	2writetext UnknownText_0x786fc
	closetext
	loadmovesprites
	end
; 0x782b8

TrainerCooltrainerfIrene: ; 0x782b8
	; bit/flag number
	dw $560

	; trainer group && trainer id
	db COOLTRAINERF, IRENE

	; text when seen
	dw CooltrainerfIreneSeenText

	; text when trainer beaten
	dw CooltrainerfIreneBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfIreneScript
; 0x782c4

CooltrainerfIreneScript: ; 0x782c4
	talkaftercancel
	loadfont
	checkbit1 $0070
	iftrue UnknownScript_0x782d2
	2writetext UnknownText_0x7877f
	closetext
	loadmovesprites
	end
; 0x782d2

UnknownScript_0x782d2: ; 0x782d2
	2writetext UnknownText_0x787ad
	closetext
	loadmovesprites
	end
; 0x782d8

TrainerCooltrainerfJenn: ; 0x782d8
	; bit/flag number
	dw $56b

	; trainer group && trainer id
	db COOLTRAINERF, JENN

	; text when seen
	dw CooltrainerfJennSeenText

	; text when trainer beaten
	dw CooltrainerfJennBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfJennScript
; 0x782e4

CooltrainerfJennScript: ; 0x782e4
	talkaftercancel
	loadfont
	checkbit1 $0070
	iftrue UnknownScript_0x782f2
	2writetext UnknownText_0x78836
	closetext
	loadmovesprites
	end
; 0x782f2

UnknownScript_0x782f2: ; 0x782f2
	2writetext UnknownText_0x78866
	closetext
	loadmovesprites
	end
; 0x782f8

TrainerCooltrainerfKate: ; 0x782f8
	; bit/flag number
	dw $55f

	; trainer group && trainer id
	db COOLTRAINERF, KATE

	; text when seen
	dw CooltrainerfKateSeenText

	; text when trainer beaten
	dw CooltrainerfKateBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfKateScript
; 0x78304

CooltrainerfKateScript: ; 0x78304
	talkaftercancel
	loadfont
	checkbit1 $0070
	iftrue UnknownScript_0x78319
	2writetext UnknownText_0x788e2
	keeptextopen
	verbosegiveitem SOFT_SAND, 1
	iffalse UnknownScript_0x7831d
	setbit1 $0070
UnknownScript_0x78319: ; 0x78319
	2writetext UnknownText_0x7892b
	closetext
UnknownScript_0x7831d: ; 0x7831d
	loadmovesprites
	end
; 0x7831f

UnknownScript_0x7831f: ; 0x7831f
	jumptext UnknownText_0x7898a
; 0x78322

MapRoute34Signpost0Script: ; 0x78322
	jumptext UnknownText_0x789a8
; 0x78325

MapRoute34Signpost1Script: ; 0x78325
	jumptext UnknownText_0x789ed
; 0x78328

MapRoute34Signpost2Script: ; 0x78328
	jumptext UnknownText_0x78a52
; 0x7832b

ItemFragment_0x7832b: ; 0x7832b
	db NUGGET, 1
; 0x7832d

MapRoute34SignpostItem3: ; 0x7832d
	dw $00a7
	db RARE_CANDY
	
; 0x78330

MapRoute34SignpostItem4: ; 0x78330
	dw $00a8
	db SUPER_POTION
	
; 0x78333

MovementData_0x78333: ; 0x78333
	slow_step_left
	slow_step_left
	slow_step_up
	step_end
; 0x78337

MovementData_0x78337: ; 0x78337
	slow_step_down
	slow_step_left
	slow_step_left
	slow_step_up
	slow_step_up
	step_end
; 0x7833d

YoungsterSamuelSeenText: ; 0x7833d
	db $0, "This is where I do", $4f
	db "my training!", $57
; 0x7835e

YoungsterSamuelBeatenText: ; 0x7835e
	db $0, "Beaten by a", $4f
	db "passing stranger!", $57
; 0x7837d

UnknownText_0x7837d: ; 0x7837d
	db $0, "Have you been to", $4f
	db "GOLDENROD CITY?", $51
	db "Weren't you amazed", $4f
	db "by how they've", $51
	db "changed the", $4f
	db "#MON CENTER?", $57
; 0x783d8

UnknownText_0x783d8: ; 0x783d8
	db $0, "I'm going to train", $4f
	db "even harder.", $51
	db "After all, I'm", $4f
	db "trying to become", $55
	db "a GYM LEADER.", $57
; 0x78425

YoungsterIanSeenText: ; 0x78425
	db $0, "I'm the best in my", $4f
	db "class at #MON.", $57
; 0x78447

YoungsterIanBeatenText: ; 0x78447
	db $0, "No! There are bet-", $4f
	db "ter trainers…", $57
; 0x78469

UnknownText_0x78469: ; 0x78469
	db $0, "I'm trying hard so", $4f
	db "I can be the star", $55
	db "in my class.", $57
; 0x7849b

CamperTodd1SeenText: ; 0x7849b
	db $0, "I'm confident in", $4f
	db "my ability to", $55
	db "raise #MON.", $51
	db "Want to see?", $57
; 0x784d3

CamperTodd1BeatenText: ; 0x784d3
	db $0, "Did I screw up my", $4f
	db "training?", $57
; 0x784f0

UnknownText_0x784f0: ; 0x784f0
	db $0, "Maybe I should", $4f
	db "take one to a DAY-", $51
	db "CARE. Or maybe use", $4f
	db "some items…", $57
; 0x78532

UnknownText_0x78532: ; 0x78532
	db $0, "Shopping under the", $4f
	db "sky!", $51
	db "It feels so nice", $4f
	db "up on a rooftop.", $57
; 0x7856d

PicnickerGina1SeenText: ; 0x7856d
	db $0, "Are you a trainer?", $51
	db "Let's have a", $4f
	db "practice battle.", $57
; 0x7859e

PicnickerGina1BeatenText: ; 0x7859e
	db $0, "Oh, no! I just", $4f
	db "can't win…", $57
; 0x785b8

UnknownText_0x785b8: ; 0x785b8
	db $0, "You're too strong", $4f
	db "to be a practice", $55
	db "partner.", $57
; 0x785e4

UnknownText_0x785e4: ; 0x785e4
	db $0, "Who goes there?", $4f
	db "What are you up", $55
	db "to?", $57
; 0x78609

UnknownText_0x78609: ; 0x78609
	db $0, "You're a tough", $4f
	db "little kid.", $57
; 0x78624

UnknownText_0x78624: ; 0x78624
	db $0, "Yep, I see nothing", $4f
	db "wrong today. You", $51
	db "be good and stay", $4f
	db "out of trouble.", $57
; 0x7866a

UnknownText_0x7866a: ; 0x7866a
	db $0, "I'm on patrol for", $4f
	db "suspicious indi-", $55
	db "viduals.", $57
; 0x78696

PokefanmBrandonSeenText: ; 0x78696
	db $0, "I just got my", $4f
	db "#MON back from", $55
	db "DAY-CARE.", $51
	db "Let's see how much", $4f
	db "stronger it got!", $57
; 0x786e1

PokefanmBrandonBeatenText: ; 0x786e1
	db $0, "Why does it end", $4f
	db "this way?", $57
; 0x786fc

UnknownText_0x786fc: ; 0x786fc
	db $0, "My #MON knew", $4f
	db "moves I didn't", $55
	db "know it had.", $51
	db "That confounded me", $4f
	db "to no end!", $57
; 0x78743

CooltrainerfIreneSeenText: ; 0x78743
	db $0, "IRENE: Kyaaah!", $4f
	db "Someone found us!", $57
; 0x78765

CooltrainerfIreneBeatenText: ; 0x78765
	db $0, "IRENE: Ohhh!", $4f
	db "Too strong!", $57
; 0x7877f

UnknownText_0x7877f: ; 0x7877f
	db $0, "IRENE: My sister", $4f
	db "KATE will get you", $55
	db "for this!", $57
; 0x787ad

UnknownText_0x787ad: ; 0x787ad
	db $0, "IRENE: Isn't this", $4f
	db "beach great?", $51
	db "It's our secret", $4f
	db "little getaway!", $57
; 0x787eb

CooltrainerfJennSeenText: ; 0x787eb
	db $0, "JENN: You can't", $4f
	db "beat IRENE and go", $55
	db "unpunished!", $57
; 0x78819

CooltrainerfJennBeatenText: ; 0x78819
	db $0, "JENN: So sorry,", $4f
	db "IRENE! Sis!", $57
; 0x78836

UnknownText_0x78836: ; 0x78836
	db $0, "JENN: Don't get", $4f
	db "cocky! My sister", $55
	db "KATE is tough!", $57
; 0x78866

UnknownText_0x78866: ; 0x78866
	db $0, "JENN: Sunlight", $4f
	db "makes your body", $55
	db "stronger.", $57
; 0x78890

CooltrainerfKateSeenText: ; 0x78890
	db $0, "KATE: You sure", $4f
	db "were mean to my", $55
	db "little sisters!", $57
; 0x788c0

CooltrainerfKateBeatenText: ; 0x788c0
	db $0, "KATE: No! I can't", $4f
	db "believe I lost.", $57
; 0x788e2

UnknownText_0x788e2: ; 0x788e2
	db $0, "KATE: You're too", $4f
	db "strong. I didn't", $55
	db "stand a chance.", $51
	db "Here. You deserve", $4f
	db "this.", $57
; 0x7892b

UnknownText_0x7892b: ; 0x7892b
	db $0, "KATE: I'm sorry we", $4f
	db "jumped you.", $51
	db "We never expected", $4f
	db "anyone to find us", $51
	db "here. You sure", $4f
	db "startled us.", $57
; 0x7898a

UnknownText_0x7898a: ; 0x7898a
	db $0, "ILEX FOREST", $4f
	db "THROUGH THE GATE", $57
; 0x789a8

UnknownText_0x789a8: ; 0x789a8
	db $0, "ROUTE 34", $51
	db "GOLDENROD CITY -", $4f
	db "AZALEA TOWN", $51
	db "ILEX FOREST", $4f
	db "SOMEWHERE BETWEEN", $57
; 0x789ed

UnknownText_0x789ed: ; 0x789ed
	db $0, "TRAINER TIPS", $51
	db "BERRY trees grow", $4f
	db "new BERRIES", $55
	db "every day.", $51
	db "Make a note of", $4f
	db "which trees bear", $55
	db "which BERRIES.", $57
; 0x78a52

UnknownText_0x78a52: ; 0x78a52
	db $0, "DAY-CARE", $51
	db "LET US RAISE YOUR", $4f
	db "#MON FOR YOU!", $57
; 0x78a7c

Route34_MapEventHeader: ; 0x78a7c
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $25, $d, 1, GROUP_ROUTE_34_ILEX_FOREST_GATE, MAP_ROUTE_34_ILEX_FOREST_GATE
	warp_def $25, $e, 2, GROUP_ROUTE_34_ILEX_FOREST_GATE, MAP_ROUTE_34_ILEX_FOREST_GATE
	warp_def $e, $b, 1, GROUP_DAY_CARE, MAP_DAY_CARE
	warp_def $f, $b, 2, GROUP_DAY_CARE, MAP_DAY_CARE
	warp_def $f, $d, 3, GROUP_DAY_CARE, MAP_DAY_CARE

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 6, 12, $0, MapRoute34Signpost0Script
	signpost 33, 13, $0, MapRoute34Signpost1Script
	signpost 13, 10, $0, MapRoute34Signpost2Script
	signpost 32, 8, $7, MapRoute34SignpostItem3
	signpost 19, 17, $7, MapRoute34SignpostItem4

	; people-events
	db 13
	person_event SPRITE_YOUNGSTER, 11, 17, $8, $0, 255, 255, $a2, 5, TrainerCamperTodd1, $ffff
	person_event SPRITE_YOUNGSTER, 36, 19, $6, $0, 255, 255, $92, 3, TrainerYoungsterSamuel, $ffff
	person_event SPRITE_YOUNGSTER, 24, 15, $6, $0, 255, 255, $92, 3, TrainerYoungsterIan, $ffff
	person_event SPRITE_LASS, 30, 14, $9, $0, 255, 255, $a2, 3, TrainerPicnickerGina1, $ffff
	person_event SPRITE_OFFICER, 15, 13, $6, $0, 255, 255, $90, 0, OfficerScript_0x7824c, $ffff
	person_event SPRITE_POKEFAN_M, 32, 22, $1e, $0, 255, 255, $82, 3, TrainerPokefanmBrandon, $ffff
	person_event SPRITE_GRAMPS, 20, 19, $6, $0, 255, 255, $0, 0, GrampsScript_0x7803d, $06e6
	person_event SPRITE_DAYCARE_MON_1, 22, 18, $16, $22, 255, 255, $0, 0, DaycareMon1Script_0x78065, $06e7
	person_event SPRITE_DAYCARE_MON_2, 23, 21, $16, $22, 255, 255, $0, 0, DaycareMon2Script_0x7806b, $06e8
	person_event SPRITE_COOLTRAINER_F, 52, 15, $8, $0, 255, 255, $82, 5, TrainerCooltrainerfIrene, $ffff
	person_event SPRITE_COOLTRAINER_F, 52, 7, $9, $0, 255, 255, $82, 3, TrainerCooltrainerfJenn, $ffff
	person_event SPRITE_COOLTRAINER_F, 55, 10, $7, $0, 255, 255, $82, 2, TrainerCooltrainerfKate, $ffff
	person_event SPRITE_POKE_BALL, 34, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x7832b, $07bc
; 0x78b5d

