SproutTower3F_MapScriptHeader: ; 0x18493b
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x184945, $0000
	dw UnknownScript_0x184946, $0000

	; callback count
	db 0
; 0x184945

UnknownScript_0x184945: ; 0x184945
	end
; 0x184946

UnknownScript_0x184946: ; 0x184946
	end
; 0x184947

UnknownScript_0x184947: ; 0x184947
	spriteface $0, $1
	showemote $0, $0, 15
	special $006a
	playsound $0041
	playsound $006e
	earthquake 79
	pause 15
	playsound $0041
	playsound $006e
	earthquake 79
	applymovement $0, MovementData_0x184a1d
	applymovement $8, MovementData_0x184a22
	loadfont
	2writetext UnknownText_0x184a27
	closetext
	loadmovesprites
	showemote $0, $8, 15
	spriteface $8, $0
	pause 15
	applymovement $8, MovementData_0x184a24
	playmusic $001f
	loadfont
	2writetext UnknownText_0x184aec
	closetext
	loadmovesprites
	spriteface $8, $1
	loadfont
	2writetext UnknownText_0x184bc8
	pause 15
	loadmovesprites
	playsound $0013
	special $0030
	special $0033
	disappear $8
	waitbutton
	special $0032
	dotrigger $1
	special $003d
	end
; 0x1849a6

SageLiScript: ; 0x1849a6
	faceplayer
	loadfont
	checkbit1 $0014
	iftrue UnknownScript_0x1849d1
	2writetext SageLiSeenText
	closetext
	loadmovesprites
	winlosstext SageLiBeatenText, $0000
	loadtrainer SAGE, LI
	startbattle
	returnafterbattle
	loadfont
	2writetext UnknownText_0x184cc2
	keeptextopen
	verbosegiveitem HM_05, 1
	setbit1 $0014
	setbit1 $0419
	2writetext UnknownText_0x184d13
	closetext
	loadmovesprites
	end
; 0x1849d1

UnknownScript_0x1849d1: ; 0x1849d1
	2writetext UnknownText_0x184d88
	closetext
	loadmovesprites
	end
; 0x1849d7

TrainerSageJin: ; 0x1849d7
	; bit/flag number
	dw $413

	; trainer group && trainer id
	db SAGE, JIN

	; text when seen
	dw SageJinSeenText

	; text when trainer beaten
	dw SageJinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageJinScript
; 0x1849e3

SageJinScript: ; 0x1849e3
	talkaftercancel
	loadfont
	2writetext UnknownText_0x184dfa
	closetext
	loadmovesprites
	end
; 0x1849eb

TrainerSageTroy: ; 0x1849eb
	; bit/flag number
	dw $414

	; trainer group && trainer id
	db SAGE, TROY

	; text when seen
	dw SageTroySeenText

	; text when trainer beaten
	dw SageTroyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageTroyScript
; 0x1849f7

SageTroyScript: ; 0x1849f7
	talkaftercancel
	loadfont
	2writetext UnknownText_0x184ea4
	closetext
	loadmovesprites
	end
; 0x1849ff

TrainerSageNeal: ; 0x1849ff
	; bit/flag number
	dw $418

	; trainer group && trainer id
	db SAGE, NEAL

	; text when seen
	dw SageNealSeenText

	; text when trainer beaten
	dw SageNealBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageNealScript
; 0x184a0b

SageNealScript: ; 0x184a0b
	talkaftercancel
	loadfont
	2writetext UnknownText_0x184f12
	closetext
	loadmovesprites
	end
; 0x184a13

MapSproutTower3FSignpost3Script: ; 0x184a13
	jumptext UnknownText_0x184f37
; 0x184a16

MapSproutTower3FSignpost5Script: ; 0x184a16
	jumptext UnknownText_0x184f61
; 0x184a19

ItemFragment_0x184a19: ; 0x184a19
	db POTION, 1
; 0x184a1b

ItemFragment_0x184a1b: ; 0x184a1b
	db ESCAPE_ROPE, 1
; 0x184a1d

MovementData_0x184a1d: ; 0x184a1d
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x184a22

MovementData_0x184a22: ; 0x184a22
	step_up
	step_end
; 0x184a24

MovementData_0x184a24: ; 0x184a24
	step_right
	step_down
	step_end
; 0x184a27

UnknownText_0x184a27: ; 0x184a27
	db $0, "ELDER: You are in-", $4f
	db "deed skilled as a", $55
	db "trainer.", $51
	db "As promised, here", $4f
	db "is your HM.", $51
	db "But let me say", $4f
	db "this: You should", $51
	db "treat your", $4f
	db "#MON better.", $51
	db "The way you battle", $4f
	db "is far too harsh.", $51
	db "#MON are not", $4f
	db "tools of war…", $57
; 0x184aec

UnknownText_0x184aec: ; 0x184aec
	db $0, "…", $4f
	db "…Humph!", $51
	db "He claims to be", $4f
	db "the ELDER but", $55
	db "he's weak.", $51
	db "It stands to", $4f
	db "reason.", $51
	db "I'd never lose to", $4f
	db "fools who babble", $51
	db "about being nice", $4f
	db "to #MON.", $51
	db "I only care about", $4f
	db "strong #MON", $55
	db "that can win.", $51
	db "I really couldn't", $4f
	db "care less about", $55
	db "weak #MON.", $57
; 0x184bc8

UnknownText_0x184bc8: ; 0x184bc8
	db $0, $53, " used an", $4f
	db "ESCAPE ROPE!", $57
; 0x184be0

SageLiSeenText: ; 0x184be0
	db $0, "So good of you to", $4f
	db "come here!", $51
	db "SPROUT TOWER is a", $4f
	db "place of training.", $51
	db "People and #MON", $4f
	db "test their bonds", $51
	db "to build a bright", $4f
	db "future together.", $51
	db "I am the final", $4f
	db "test.", $51
	db "Allow me to check", $4f
	db "the ties between", $51
	db "your #MON and", $4f
	db "you!", $57
; 0x184cb2

SageLiBeatenText: ; 0x184cb2
	db $0, "Ah, excellent!", $57
; 0x184cc2

UnknownText_0x184cc2: ; 0x184cc2
	db $0, "You and your #-", $4f
	db "MON should have", $51
	db "no problem using", $4f
	db "this move.", $51
	db "Take this FLASH", $4f
	db "HM.", $57
; 0x184d13

UnknownText_0x184d13: ; 0x184d13
	db $0, "FLASH illuminates", $4f
	db "even the darkest", $55
	db "of all places.", $51
	db "But to use it out", $4f
	db "of battle, you", $51
	db "need the BADGE", $4f
	db "from VIOLET's GYM.", $57
; 0x184d88

UnknownText_0x184d88: ; 0x184d88
	db $0, "I hope you learn", $4f
	db "and grow from your", $55
	db "journey.", $57
; 0x184db6

SageJinSeenText: ; 0x184db6
	db $0, "I train to find", $4f
	db "enlightenment in", $55
	db "#MON!", $57
; 0x184dde

SageJinBeatenText: ; 0x184dde
	db $0, "My training is", $4f
	db "incomplete…", $57
; 0x184dfa

UnknownText_0x184dfa: ; 0x184dfa
	db $0, "As #MON grow", $4f
	db "stronger, so does", $55
	db "the trainer.", $51
	db "No, wait. As the", $4f
	db "trainer grows", $51
	db "stronger, so do", $4f
	db "the #MON.", $57
; 0x184e60

SageTroySeenText: ; 0x184e60
	db $0, "Let me see how", $4f
	db "much you trust", $55
	db "your #MON.", $57
; 0x184e8a

SageTroyBeatenText: ; 0x184e8a
	db $0, "Yes, your trust is", $4f
	db "real!", $57
; 0x184ea4

UnknownText_0x184ea4: ; 0x184ea4
	db $0, "It is not far to", $4f
	db "the ELDER.", $57
; 0x184ec1

SageNealSeenText: ; 0x184ec1
	db $0, "The ELDER's HM", $4f
	db "lights even pitch-", $55
	db "black darkness.", $57
; 0x184ef3

SageNealBeatenText: ; 0x184ef3
	db $0, "It is my head that", $4f
	db "is bright!", $57
; 0x184f12

UnknownText_0x184f12: ; 0x184f12
	db $0, "Let there be light", $4f
	db "on your journey.", $57
; 0x184f37

UnknownText_0x184f37: ; 0x184f37
	db $0, "It's a powerful", $4f
	db "painting of a", $55
	db "BELLSPROUT.", $57
; 0x184f61

UnknownText_0x184f61: ; 0x184f61
	db $0, "A #MON statue…", $51
	db "It looks very", $4f
	db "distinguished.", $57
; 0x184f8e

SproutTower3F_MapEventHeader: ; 0x184f8e
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $e, $a, 4, GROUP_SPROUT_TOWER_2F, MAP_SPROUT_TOWER_2F

	; xy triggers
	db 1
	xy_trigger 0, $9, $b, $0, UnknownScript_0x184947, $0, $0

	; signposts
	db 6
	signpost 1, 8, $0, MapSproutTower3FSignpost5Script
	signpost 1, 11, $0, MapSproutTower3FSignpost5Script
	signpost 0, 9, $0, MapSproutTower3FSignpost3Script
	signpost 0, 10, $0, MapSproutTower3FSignpost3Script
	signpost 15, 5, $0, MapSproutTower3FSignpost5Script
	signpost 15, 14, $0, MapSproutTower3FSignpost5Script

	; people-events
	db 7
	person_event SPRITE_SAGE, 17, 12, $9, $0, 255, 255, $92, 3, TrainerSageJin, $ffff
	person_event SPRITE_SAGE, 12, 12, $6, $0, 255, 255, $92, 2, TrainerSageTroy, $ffff
	person_event SPRITE_SAGE, 6, 14, $6, $0, 255, 255, $90, 0, SageLiScript, $ffff
	person_event SPRITE_SAGE, 15, 15, $8, $0, 255, 255, $92, 3, TrainerSageNeal, $ffff
	person_event SPRITE_POKE_BALL, 18, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x184a19, $0649
	person_event SPRITE_POKE_BALL, 5, 18, $1, $0, 255, 255, $1, 0, ItemFragment_0x184a1b, $064a
	person_event SPRITE_SILVER, 8, 14, $7, $0, 255, 255, $0, 0, ObjectEvent, $06c4
; 0x18501a

