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
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement $0, MovementData_0x184a1d
	applymovement $8, MovementData_0x184a22
	loadfont
	writetext UnknownText_0x184a27
	closetext
	loadmovesprites
	showemote $0, $8, 15
	spriteface $8, $0
	pause 15
	applymovement $8, MovementData_0x184a24
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x184aec
	closetext
	loadmovesprites
	spriteface $8, $1
	loadfont
	writetext UnknownText_0x184bc8
	pause 15
	loadmovesprites
	playsound SFX_WARP_TO
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
	checkevent EVENT_GOT_HM05_FLASH
	iftrue UnknownScript_0x1849d1
	writetext SageLiSeenText
	closetext
	loadmovesprites
	winlosstext SageLiBeatenText, $0000
	loadtrainer SAGE, LI
	startbattle
	returnafterbattle
	loadfont
	writetext UnknownText_0x184cc2
	keeptextopen
	verbosegiveitem HM_05, 1
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext UnknownText_0x184d13
	closetext
	loadmovesprites
	end
; 0x1849d1

UnknownScript_0x1849d1: ; 0x1849d1
	writetext UnknownText_0x184d88
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
	writetext UnknownText_0x184dfa
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
	writetext UnknownText_0x184ea4
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
	writetext UnknownText_0x184f12
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
	text "ELDER: You are in-"
	line "deed skilled as a"
	cont "trainer."

	para "As promised, here"
	line "is your HM."

	para "But let me say"
	line "this: You should"

	para "treat your"
	line "#MON better."

	para "The way you battle"
	line "is far too harsh."

	para "#MON are not"
	line "tools of war…"
	done
; 0x184aec

UnknownText_0x184aec: ; 0x184aec
	text "…"
	line "…Humph!"

	para "He claims to be"
	line "the ELDER but"
	cont "he's weak."

	para "It stands to"
	line "reason."

	para "I'd never lose to"
	line "fools who babble"

	para "about being nice"
	line "to #MON."

	para "I only care about"
	line "strong #MON"
	cont "that can win."

	para "I really couldn't"
	line "care less about"
	cont "weak #MON."
	done
; 0x184bc8

UnknownText_0x184bc8: ; 0x184bc8
	text $53, " used an"
	line "ESCAPE ROPE!"
	done
; 0x184be0

SageLiSeenText: ; 0x184be0
	text "So good of you to"
	line "come here!"

	para "SPROUT TOWER is a"
	line "place of training."

	para "People and #MON"
	line "test their bonds"

	para "to build a bright"
	line "future together."

	para "I am the final"
	line "test."

	para "Allow me to check"
	line "the ties between"

	para "your #MON and"
	line "you!"
	done
; 0x184cb2

SageLiBeatenText: ; 0x184cb2
	text "Ah, excellent!"
	done
; 0x184cc2

UnknownText_0x184cc2: ; 0x184cc2
	text "You and your #-"
	line "MON should have"

	para "no problem using"
	line "this move."

	para "Take this FLASH"
	line "HM."
	done
; 0x184d13

UnknownText_0x184d13: ; 0x184d13
	text "FLASH illuminates"
	line "even the darkest"
	cont "of all places."

	para "But to use it out"
	line "of battle, you"

	para "need the BADGE"
	line "from VIOLET's GYM."
	done
; 0x184d88

UnknownText_0x184d88: ; 0x184d88
	text "I hope you learn"
	line "and grow from your"
	cont "journey."
	done
; 0x184db6

SageJinSeenText: ; 0x184db6
	text "I train to find"
	line "enlightenment in"
	cont "#MON!"
	done
; 0x184dde

SageJinBeatenText: ; 0x184dde
	text "My training is"
	line "incomplete…"
	done
; 0x184dfa

UnknownText_0x184dfa: ; 0x184dfa
	text "As #MON grow"
	line "stronger, so does"
	cont "the trainer."

	para "No, wait. As the"
	line "trainer grows"

	para "stronger, so do"
	line "the #MON."
	done
; 0x184e60

SageTroySeenText: ; 0x184e60
	text "Let me see how"
	line "much you trust"
	cont "your #MON."
	done
; 0x184e8a

SageTroyBeatenText: ; 0x184e8a
	text "Yes, your trust is"
	line "real!"
	done
; 0x184ea4

UnknownText_0x184ea4: ; 0x184ea4
	text "It is not far to"
	line "the ELDER."
	done
; 0x184ec1

SageNealSeenText: ; 0x184ec1
	text "The ELDER's HM"
	line "lights even pitch-"
	cont "black darkness."
	done
; 0x184ef3

SageNealBeatenText: ; 0x184ef3
	text "It is my head that"
	line "is bright!"
	done
; 0x184f12

UnknownText_0x184f12: ; 0x184f12
	text "Let there be light"
	line "on your journey."
	done
; 0x184f37

UnknownText_0x184f37: ; 0x184f37
	text "It's a powerful"
	line "painting of a"
	cont "BELLSPROUT."
	done
; 0x184f61

UnknownText_0x184f61: ; 0x184f61
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done
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

