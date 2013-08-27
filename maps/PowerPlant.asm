PowerPlant_MapScriptHeader: ; 0x188db9
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x188dc3, $0000
	dw UnknownScript_0x188dc4, $0000

	; callback count
	db 0
; 0x188dc3

UnknownScript_0x188dc3: ; 0x188dc3
	end
; 0x188dc4

UnknownScript_0x188dc4: ; 0x188dc4
	end
; 0x188dc5

UnknownScript_0x188dc5: ; 0x188dc5
	playsound $006a
	showemote $0, $2, 15
	waitbutton
	pause 30
	applymovement $2, MovementData_0x188ed5
	spriteface $3, $0
	spriteface $4, $0
	loadfont
	2writetext UnknownText_0x188f22
	closetext
	loadmovesprites
	spriteface $2, $2
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x188f7f
	closetext
	loadmovesprites
	spriteface $0, $0
	applymovement $2, MovementData_0x188eda
	dotrigger $0
	end
; 0x188df5

OfficerScript_0x188df5: ; 0x188df5
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x188e0f
	checkbit1 $00ca
	iftrue UnknownScript_0x188e09
	2writetext UnknownText_0x188ee0
	closetext
	loadmovesprites
	end
; 0x188e09

UnknownScript_0x188e09: ; 0x188e09
	2writetext UnknownText_0x188f7f
	closetext
	loadmovesprites
	end
; 0x188e0f

UnknownScript_0x188e0f: ; 0x188e0f
	2writetext UnknownText_0x188fa2
	closetext
	loadmovesprites
	end
; 0x188e15

GymGuyScript_0x188e15: ; 0x188e15
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x188e23
	2writetext UnknownText_0x188fcf
	closetext
	loadmovesprites
	end
; 0x188e23

UnknownScript_0x188e23: ; 0x188e23
	2writetext UnknownText_0x189038
	closetext
	loadmovesprites
	end
; 0x188e29

GymGuyScript_0x188e29: ; 0x188e29
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x188e37
	2writetext UnknownText_0x189079
	closetext
	loadmovesprites
	end
; 0x188e37

UnknownScript_0x188e37: ; 0x188e37
	2writetext UnknownText_0x1890ef
	closetext
	loadmovesprites
	end
; 0x188e3d

OfficerScript_0x188e3d: ; 0x188e3d
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x188e4b
	2writetext UnknownText_0x18910e
	closetext
	loadmovesprites
	end
; 0x188e4b

UnknownScript_0x188e4b: ; 0x188e4b
	2writetext UnknownText_0x18917f
	closetext
	loadmovesprites
	end
; 0x188e51

GymGuyScript_0x188e51: ; 0x188e51
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x188e5f
	2writetext UnknownText_0x1891c2
	closetext
	loadmovesprites
	end
; 0x188e5f

UnknownScript_0x188e5f: ; 0x188e5f
	2writetext UnknownText_0x189225
	closetext
	loadmovesprites
	end
; 0x188e65

FisherScript_0x188e65: ; 0x188e65
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x188eac
	checkitem MACHINE_PART
	iftrue UnknownScript_0x188e93
	checkbit1 $00ca
	iftrue UnknownScript_0x188e8d
	2writetext UnknownText_0x189264
	closetext
	loadmovesprites
	setbit1 $00ca
	clearbit1 $076d
	clearbit1 $00fb
	domaptrigger GROUP_CERULEAN_GYM, MAP_CERULEAN_GYM, $1
	dotrigger $1
	end
; 0x188e8d

UnknownScript_0x188e8d: ; 0x188e8d
	2writetext UnknownText_0x189308
	closetext
	loadmovesprites
	end
; 0x188e93

UnknownScript_0x188e93: ; 0x188e93
	2writetext UnknownText_0x18936e
	keeptextopen
	takeitem MACHINE_PART, 1
	setbit1 $00c9
	clearbit1 $0772
	setbit1 $0771
	setbit1 $076c
	setbit1 $00cd
	clearbit1 $0749
UnknownScript_0x188eac: ; 0x188eac
	checkbit1 $00df
	iftrue UnknownScript_0x188ec5
	2writetext UnknownText_0x1893c4
	keeptextopen
	verbosegiveitem TM_07, 1
	iffalse UnknownScript_0x188ec3
	setbit1 $00df
	2writetext UnknownText_0x1893f4
	closetext
UnknownScript_0x188ec3: ; 0x188ec3
	loadmovesprites
	end
; 0x188ec5

UnknownScript_0x188ec5: ; 0x188ec5
	2writetext UnknownText_0x189475
	closetext
	loadmovesprites
	end
; 0x188ecb

GymGuyScript_0x188ecb: ; 0x188ecb
	faceplayer
	loadfont
	trade $6
	closetext
	loadmovesprites
	end
; 0x188ed2

MapPowerPlantSignpost1Script: ; 0x188ed2
	jumpstd $0001
; 0x188ed5

MovementData_0x188ed5: ; 0x188ed5
	step_right
	step_right
	step_up
	step_up
	step_end
; 0x188eda

MovementData_0x188eda: ; 0x188eda
	step_down
	step_down
	step_left
	step_left
	turn_head_down
	step_end
; 0x188ee0

UnknownText_0x188ee0: ; 0x188ee0
	db $0, "A thief broke into", $4f
	db "the POWER PLANT…", $51
	db "What is the world", $4f
	db "coming to?", $57
; 0x188f22

UnknownText_0x188f22: ; 0x188f22
	db $0, "I just got word", $4f
	db "from CERULEAN.", $51
	db "It appears that a", $4f
	db "shady character", $51
	db "has been loitering", $4f
	db "around.", $57
; 0x188f7f

UnknownText_0x188f7f: ; 0x188f7f
	db $0, "Could I ask for", $4f
	db "your cooperation?", $57
; 0x188fa2

UnknownText_0x188fa2: ; 0x188fa2
	db $0, "We'll have to beef", $4f
	db "up our security", $55
	db "presence.", $57
; 0x188fcf

UnknownText_0x188fcf: ; 0x188fcf
	db $0, "Someone made off", $4f
	db "with a part that's", $51
	db "essential for the", $4f
	db "generator.", $51
	db "Without it, the", $4f
	db "new generator's", $55
	db "useless!", $57
; 0x189038

UnknownText_0x189038: ; 0x189038
	db $0, "The generator's up", $4f
	db "and running. It's", $51
	db "making electricity", $4f
	db "to spare.", $57
; 0x189079

UnknownText_0x189079: ; 0x189079
	db $0, "This POWER PLANT", $4f
	db "had been abandoned", $55
	db "in the past.", $51
	db "We got it back up", $4f
	db "and running to", $51
	db "provide power to", $4f
	db "the MAGNET TRAIN.", $57
; 0x1890ef

UnknownText_0x1890ef: ; 0x1890ef
	db $0, "The generator's", $4f
	db "running again!", $57
; 0x18910e

UnknownText_0x18910e: ; 0x18910e
	db $0, "The POWER PLANT's", $4f
	db "MANAGER is up", $55
	db "ahead.", $51
	db "But since someone", $4f
	db "wrecked the gener-", $55
	db "ator, he's been", $55
	db "both sad and", $55
	db "furious…", $57
; 0x18917f

UnknownText_0x18917f: ; 0x18917f
	db $0, "Since the gener-", $4f
	db "ator's been fixed,", $51
	db "the MANAGER has", $4f
	db "been cheerful.", $57
; 0x1891c2

UnknownText_0x1891c2: ; 0x1891c2
	db $0, "The MAGNET TRAIN", $4f
	db "consumes a lot of", $55
	db "electricity.", $51
	db "It can't move if", $4f
	db "the new generator", $55
	db "isn't operating.", $57
; 0x189225

UnknownText_0x189225: ; 0x189225
	db $0, "All right! We can", $4f
	db "finally get the", $51
	db "MAGNET TRAIN", $4f
	db "running again.", $57
; 0x189264

UnknownText_0x189264: ; 0x189264
	db $0, "MANAGER: I, I, I'm", $4f
	db "ready to blast", $55
	db "someone!", $51
	db "Who would dare", $4f
	db "ruin my generator?", $51
	db "I spent so much", $4f
	db "time on it!", $51
	db "If I catch him,", $4f
	db "he's going to get", $51
	db "a taste of my ZAP", $4f
	db "CANNON!", $57
; 0x189308

UnknownText_0x189308: ; 0x189308
	db $0, "MANAGER: I won't", $4f
	db "forgive him!", $51
	db "The culprit can", $4f
	db "cry and apologize,", $51
	db "but I'll still", $4f
	db "hammer him!", $51
	db "Gahahahah!", $57
; 0x18936e

UnknownText_0x18936e: ; 0x18936e
	db $0, "MANAGER: Ah! Yeah!", $51
	db "That's the missing", $4f
	db "PART from my be-", $55
	db "loved generator!", $55
	db "You found it?", $57
; 0x1893c4

UnknownText_0x1893c4: ; 0x1893c4
	db $0, "Wahah! Thanks!", $51
	db "Here! Take this TM", $4f
	db "as a reward!", $57
; 0x1893f4

UnknownText_0x1893f4: ; 0x1893f4
	db $0, "MANAGER: TM07 is", $4f
	db "my ZAP CANNON.", $51
	db "It's a powerful", $4f
	db "technique!", $51
	db "It's not what any-", $4f
	db "one would consider", $51
	db "accurate, but it", $4f
	db "packs a wallop!", $57
; 0x189475

UnknownText_0x189475: ; 0x189475
	db $0, "MANAGER: My be-", $4f
	db "loved generator!", $51
	db "Keep pumping the", $4f
	db "electricity out!", $57
; 0x1894b9

PowerPlant_MapEventHeader: ; 0x1894b9
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $11, $2, 2, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH
	warp_def $11, $3, 2, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH

	; xy triggers
	db 1
	xy_trigger 1, $c, $5, $0, UnknownScript_0x188dc5, $0, $0

	; signposts
	db 2
	signpost 1, 0, $0, MapPowerPlantSignpost1Script
	signpost 1, 1, $0, MapPowerPlantSignpost1Script

	; people-events
	db 7
	person_event SPRITE_OFFICER, 18, 8, $6, $0, 255, 255, $a0, 0, OfficerScript_0x188df5, $ffff
	person_event SPRITE_GYM_GUY, 13, 6, $3, $0, 255, 255, $90, 0, GymGuyScript_0x188e15, $ffff
	person_event SPRITE_GYM_GUY, 15, 10, $7, $0, 255, 255, $90, 0, GymGuyScript_0x188e29, $ffff
	person_event SPRITE_OFFICER, 7, 13, $8, $0, 255, 255, $a0, 0, OfficerScript_0x188e3d, $ffff
	person_event SPRITE_GYM_GUY, 6, 11, $5, $1, 255, 255, $90, 0, GymGuyScript_0x188e51, $ffff
	person_event SPRITE_FISHER, 14, 18, $7, $0, 255, 255, $80, 0, FisherScript_0x188e65, $ffff
	person_event SPRITE_GYM_GUY, 9, 9, $7, $0, 255, 255, $90, 0, GymGuyScript_0x188ecb, $ffff
; 0x189536

