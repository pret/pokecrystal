DragonsDenB1F_MapScriptHeader: ; 0x18c890
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x18c89d, $0000
	dw UnknownScript_0x18c89e, $0000

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x18c89f
; 0x18c89d

UnknownScript_0x18c89d: ; 0x18c89d
	end
; 0x18c89e

UnknownScript_0x18c89e: ; 0x18c89e
	end
; 0x18c89f

UnknownScript_0x18c89f: ; 0x18c89f
	checkbit1 $0319
	iftrue UnknownScript_0x18c8a8
	disappear $4
	return
; 0x18c8a8

UnknownScript_0x18c8a8: ; 0x18c8a8
	checkcode $b
	if_equal TUESDAY, UnknownScript_0x18c8b5
	if_equal THURSDAY, UnknownScript_0x18c8b5
	disappear $4
	return
; 0x18c8b5

UnknownScript_0x18c8b5: ; 0x18c8b5
	appear $4
	return
; 0x18c8b8

UnknownScript_0x18c8b8: ; 0x18c8b8
	appear $3
	loadfont
	2writetext UnknownText_0x18c9b8
	pause 30
	loadmovesprites
	showemote $0, $0, 15
	spriteface $0, $2
	playmusic $005d
	applymovement $3, MovementData_0x18c9ae
	loadfont
	2writetext UnknownText_0x18c9bf
	keeptextopen
	giveitem TM_24, $1
	iffalse UnknownScript_0x18c8f4
	itemtotext TM_24, $0
	2writetext UnknownText_0x18c9fb
	playsound $0001
	waitbutton
	itemnotify
	setbit1 $000f
	2writetext UnknownText_0x18ca0d
	keeptextopen
	2writetext UnknownText_0x18caf1
	closetext
	loadmovesprites
	2jump UnknownScript_0x18c8f9
; 0x18c8f4

UnknownScript_0x18c8f4: ; 0x18c8f4
	2writetext UnknownText_0x18ca8b
	closetext
	loadmovesprites
UnknownScript_0x18c8f9: ; 0x18c8f9
	applymovement $3, MovementData_0x18c9b3
	special $006a
	pause 30
	special $003d
	disappear $3
	dotrigger $0
	end
; 0x18c90a

TrainerCooltrainermDarin: ; 0x18c90a
	; bit/flag number
	dw $5bd

	; trainer group && trainer id
	db COOLTRAINERM, DARIN

	; text when seen
	dw CooltrainermDarinSeenText

	; text when trainer beaten
	dw CooltrainermDarinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermDarinScript
; 0x18c916

CooltrainermDarinScript: ; 0x18c916
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18cd82
	closetext
	loadmovesprites
	end
; 0x18c91e

TrainerCooltrainerfCara: ; 0x18c91e
	; bit/flag number
	dw $5be

	; trainer group && trainer id
	db COOLTRAINERF, CARA

	; text when seen
	dw CooltrainerfCaraSeenText

	; text when trainer beaten
	dw CooltrainerfCaraBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfCaraScript
; 0x18c92a

CooltrainerfCaraScript: ; 0x18c92a
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18ce11
	closetext
	loadmovesprites
	end
; 0x18c932

TrainerTwinsLeaandpia1: ; 0x18c932
	; bit/flag number
	dw $5bf

	; trainer group && trainer id
	db TWINS, LEAANDPIA1

	; text when seen
	dw TwinsLeaandpia1SeenText

	; text when trainer beaten
	dw TwinsLeaandpia1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsLeaandpia1Script
; 0x18c93e

TwinsLeaandpia1Script: ; 0x18c93e
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18ced3
	closetext
	loadmovesprites
	end
; 0x18c946

TrainerTwinsLeaandpia2: ; 0x18c946
	; bit/flag number
	dw $5bf

	; trainer group && trainer id
	db TWINS, LEAANDPIA1

	; text when seen
	dw TwinsLeaandpia2SeenText

	; text when trainer beaten
	dw TwinsLeaandpia2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsLeaandpia2Script
; 0x18c952

TwinsLeaandpia2Script: ; 0x18c952
	talkaftercancel
	loadfont
	2writetext UnknownText_0x18cf0f
	closetext
	loadmovesprites
	end
; 0x18c95a

PokeBallScript_0x18c95a: ; 0x18c95a
	giveitem DRAGON_FANG, $1
	iffalse UnknownScript_0x18c970
	disappear $2
	loadfont
	itemtotext DRAGON_FANG, $0
	2writetext UnknownText_0x18cf41
	playsound $0001
	waitbutton
	itemnotify
	loadmovesprites
	end
; 0x18c970

UnknownScript_0x18c970: ; 0x18c970
	loadfont
	itemtotext DRAGON_FANG, $0
	2writetext UnknownText_0x18cf41
	keeptextopen
	2writetext UnknownText_0x18cf51
	closetext
	loadmovesprites
	end
; 0x18c97e

SilverScript_0x18c97e: ; 0x18c97e
	playmusic $001f
	faceplayer
	loadfont
	checkbit1 $0000
	iftrue UnknownScript_0x18c995
	2writetext UnknownText_0x18cc83
	closetext
	loadmovesprites
	setbit1 $0000
	special $003d
	end
; 0x18c995

UnknownScript_0x18c995: ; 0x18c995
	2writetext UnknownText_0x18cd2d
	closetext
	loadmovesprites
	special $003d
	end
; 0x18c99e

MapDragonsDenB1FSignpost0Script: ; 0x18c99e
	jumptext UnknownText_0x18cc2e
; 0x18c9a1

ItemFragment_0x18c9a1: ; 0x18c9a1
	db CALCIUM, 1
; 0x18c9a3

ItemFragment_0x18c9a3: ; 0x18c9a3
	db MAX_ELIXER, 1
; 0x18c9a5

MapDragonsDenB1FSignpostItem1: ; 0x18c9a5
	dw $00a0
	db REVIVE
; 0x18c9a8

MapDragonsDenB1FSignpostItem2: ; 0x18c9a8
	dw $00a1
	db MAX_POTION
; 0x18c9ab

MapDragonsDenB1FSignpostItem3: ; 0x18c9ab
	dw $00a2
	db MAX_ELIXER
; 0x18c9ae

MovementData_0x18c9ae: ; 0x18c9ae
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	step_end
; 0x18c9b3

MovementData_0x18c9b3: ; 0x18c9b3
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_end
; 0x18c9b8

UnknownText_0x18c9b8: ; 0x18c9b8
	db $0, "Wait!", $57
; 0x18c9bf

UnknownText_0x18c9bf: ; 0x18c9bf
	db $0, "CLAIR: I'm sorry", $4f
	db "about this.", $51
	db "Here, take this as", $4f
	db "my apology.", $57
; 0x18c9fb

UnknownText_0x18c9fb: ; 0x18c9fb
	db $0, $52, " received", $4f
	db "TM24.", $57
; 0x18ca0d

UnknownText_0x18ca0d: ; 0x18ca0d
	db $0, "That contains", $4f
	db "DRAGONBREATH.", $51
	db "No, it doesn't", $4f
	db "have anything to", $55
	db "do with my breath.", $51
	db "If you don't want", $4f
	db "it, you don't have", $55
	db "to take it.", $57
; 0x18ca8b

UnknownText_0x18ca8b: ; 0x18ca8b
	db $0, "Oh? You don't have", $4f
	db "any room for this.", $51
	db "I'm going back to", $4f
	db "the GYM, so make", $51
	db "room, then come", $4f
	db "see me there.", $57
; 0x18caf1

UnknownText_0x18caf1: ; 0x18caf1
	db $0, "CLAIR: What's the", $4f
	db "matter? Aren't you", $51
	db "going on to the", $4f
	db "#MON LEAGUE?", $51
	db "Do you know how to", $4f
	db "get there?", $51
	db "From here, go to", $4f
	db "NEW BARK TOWN.", $51
	db "Then SURF east to", $4f
	db "#MON LEAGUE.", $51
	db "The route there is", $4f
	db "very tough.", $51
	db "Don't you dare", $4f
	db "lose at the #-", $55
	db "MON LEAGUE!", $51
	db "If you do, I'll", $4f
	db "feel even worse", $51
	db "about having lost", $4f
	db "to you!", $51
	db "Give it everything", $4f
	db "you've got.", $57
; 0x18cc2e

UnknownText_0x18cc2e: ; 0x18cc2e
	db $0, "DRAGON SHRINE", $51
	db "A shrine honoring", $4f
	db "the dragon #MON", $51
	db "said to have lived", $4f
	db "in DRAGON'S DEN.", $57
; 0x18cc83

UnknownText_0x18cc83: ; 0x18cc83
	db $0, "…", $4f
	db "What? ", $52, "?", $51
	db "…No, I won't", $4f
	db "battle you now…", $51
	db "My #MON aren't", $4f
	db "ready to beat you.", $51
	db "I can't push them", $4f
	db "too hard now.", $51
	db "I have to be dis-", $4f
	db "ciplined to become", $51
	db "the greatest #-", $4f
	db "MON trainer…", $57
; 0x18cd2d

UnknownText_0x18cd2d: ; 0x18cd2d
	db $0, "…", $51
	db "Whew…", $51
	db "Learn to stay out", $4f
	db "of my way…", $57
; 0x18cd53

CooltrainermDarinSeenText: ; 0x18cd53
	db $0, "You! How dare you", $4f
	db "enter uninvited!", $57
; 0x18cd77

CooltrainermDarinBeatenText: ; 0x18cd77
	db $0, "S-strong!", $57
; 0x18cd82

UnknownText_0x18cd82: ; 0x18cd82
	db $0, "The SHRINE ahead", $4f
	db "is home to the", $51
	db "MASTER of our", $4f
	db "dragon-user clan.", $51
	db "You're not allowed", $4f
	db "to just go in!", $57
; 0x18cde4

CooltrainerfCaraSeenText: ; 0x18cde4
	db $0, "You shouldn't be", $4f
	db "in here!", $57
; 0x18cdfe

CooltrainerfCaraBeatenText: ; 0x18cdfe
	db $0, "Oh yikes, I lost!", $57
; 0x18ce11

UnknownText_0x18ce11: ; 0x18ce11
	db $0, "Soon I'm going to", $4f
	db "get permission", $51
	db "from our MASTER to", $4f
	db "use dragons.", $51
	db "When I do, I'm", $4f
	db "going to become an", $51
	db "admirable dragon", $4f
	db "trainer and gain", $51
	db "our MASTER's", $4f
	db "approval.", $57
; 0x18ceab

TwinsLeaandpia1SeenText: ; 0x18ceab
	db $0, "It's a stranger we", $4f
	db "don't know.", $57
; 0x18cec9

TwinsLeaandpia1BeatenText: ; 0x18cec9
	db $0, "Ouchies.", $57
; 0x18ced3

UnknownText_0x18ced3: ; 0x18ced3
	db $0, "It was like having", $4f
	db "to battle LANCE.", $57
; 0x18cef8

TwinsLeaandpia2SeenText: ; 0x18cef8
	db $0, "Who are you?", $57
; 0x18cf06

TwinsLeaandpia2BeatenText: ; 0x18cf06
	db $0, "Meanie.", $57
; 0x18cf0f

UnknownText_0x18cf0f: ; 0x18cf0f
	db $0, "We'll tell on you.", $51
	db "MASTER will be", $4f
	db "angry with you.", $57
; 0x18cf41

UnknownText_0x18cf41: ; 0x18cf41
	db $0, $52, " found", $4f
	db "@"
	text_from_ram $d099
	db $0, "!", $57
; 0x18cf51

UnknownText_0x18cf51: ; 0x18cf51
	db $0, "But ", $52, " can't", $4f
	db "carry any more", $55
	db "items.", $57
; 0x18cf73

DragonsDenB1F_MapEventHeader: ; 0x18cf73
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $14, 3, GROUP_DRAGONS_DEN_1F, MAP_DRAGONS_DEN_1F
	warp_def $1d, $13, 1, GROUP_DRAGON_SHRINE, MAP_DRAGON_SHRINE

	; xy triggers
	db 1
	xy_trigger 1, $1e, $13, $0, UnknownScript_0x18c8b8, $0, $0

	; signposts
	db 4
	signpost 24, 18, $0, MapDragonsDenB1FSignpost0Script
	signpost 29, 33, $7, MapDragonsDenB1FSignpostItem1
	signpost 17, 21, $7, MapDragonsDenB1FSignpostItem2
	signpost 15, 31, $7, MapDragonsDenB1FSignpostItem3

	; people-events
	db 9
	person_event SPRITE_POKE_BALL, 20, 39, $1, $0, 255, 255, $0, 0, PokeBallScript_0x18c95a, $06a8
	person_event SPRITE_CLAIR, 34, 18, $7, $0, 255, 255, $90, 0, ObjectEvent, $06d8
	person_event SPRITE_SILVER, 27, 24, $2, $22, 255, 255, $0, 0, SilverScript_0x18c97e, $06c6
	person_event SPRITE_COOLTRAINER_M, 12, 24, $7, $0, 255, 255, $82, 4, TrainerCooltrainermDarin, $ffff
	person_event SPRITE_COOLTRAINER_F, 12, 12, $6, $0, 255, 255, $82, 3, TrainerCooltrainerfCara, $ffff
	person_event SPRITE_TWIN, 21, 8, $9, $0, 255, 255, $82, 1, $4932, $ffff
	person_event SPRITE_TWIN, 22, 8, $9, $0, 255, 255, $82, 1, TrainerTwinsLeaandpia2, $ffff
	person_event SPRITE_POKE_BALL, 8, 34, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c9a1, $07bf
	person_event SPRITE_POKE_BALL, 24, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c9a3, $07c0
; 0x18d014

