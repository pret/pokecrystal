VictoryRoad_MapScriptHeader: ; 0x74486
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x74490, $0000
	dw UnknownScript_0x74491, $0000

	; callback count
	db 0
; 0x74490

UnknownScript_0x74490: ; 0x74490
	end
; 0x74491

UnknownScript_0x74491: ; 0x74491
	end
; 0x74492

UnknownScript_0x74492: ; 0x74492
	moveperson $2, $12, $b
	spriteface $0, $0
	showemote $0, $0, 15
	special $006a
	pause 15
	appear $2
	applymovement $2, MovementData_0x74539
	2call UnknownScript_0x744d4
	applymovement $2, MovementData_0x7454c
	disappear $2
	dotrigger $1
	playmapmusic
	end
; 0x744b5

UnknownScript_0x744b5: ; 0x744b5
	spriteface $0, $0
	showemote $0, $0, 15
	special $006a
	pause 15
	appear $2
	applymovement $2, MovementData_0x74542
	2call UnknownScript_0x744d4
	applymovement $2, MovementData_0x74555
	disappear $2
	dotrigger $1
	playmapmusic
	end
; 0x744d4

UnknownScript_0x744d4: ; 0x744d4
	spriteface $0, $0
	playmusic $001f
	loadfont
	2writetext UnknownText_0x7455f
	closetext
	loadmovesprites
	setbit1 $06c2
	checkbit1 $001c
	iftrue UnknownScript_0x744ff
	checkbit1 $001d
	iftrue UnknownScript_0x7450f
	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
	setlasttalked $2
	loadtrainer RIVAL1, RIVAL1_15
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x7451f
; 0x744ff

UnknownScript_0x744ff: ; 0x744ff
	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
	setlasttalked $2
	loadtrainer RIVAL1, RIVAL1_13
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x7451f
; 0x7450f

UnknownScript_0x7450f: ; 0x7450f
	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
	setlasttalked $2
	loadtrainer RIVAL1, RIVAL1_14
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x7451f
; 0x7451f

UnknownScript_0x7451f: ; 0x7451f
	playmusic $0020
	loadfont
	2writetext UnknownText_0x746ce
	closetext
	loadmovesprites
	end
; 0x74529

ItemFragment_0x74529: ; 0x74529
	db TM_26, 1
; 0x7452b

ItemFragment_0x7452b: ; 0x7452b
	db MAX_REVIVE, 1
; 0x7452d

ItemFragment_0x7452d: ; 0x7452d
	db FULL_RESTORE, 1
; 0x7452f

ItemFragment_0x7452f: ; 0x7452f
	db FULL_HEAL, 1
; 0x74531

ItemFragment_0x74531: ; 0x74531
	db HP_UP, 1
; 0x74533

MapVictoryRoadSignpostItem0: ; 0x74533
	dw $009e
	db MAX_POTION
	
; 0x74536

MapVictoryRoadSignpostItem1: ; 0x74536
	dw $009f
	db FULL_HEAL
	
; 0x74539

MovementData_0x74539: ; 0x74539
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end
; 0x74542

MovementData_0x74542: ; 0x74542
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end
; 0x7454c

MovementData_0x7454c: ; 0x7454c
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x74555

MovementData_0x74555: ; 0x74555
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_end
; 0x7455f

UnknownText_0x7455f: ; 0x7455f
	db $0, "Hold it.", $51
	db "…Are you going to", $4f
	db "take the #MON", $55
	db "LEAGUE challenge?", $51
	db "…Don't make me", $4f
	db "laugh.", $51
	db "You're so much", $4f
	db "weaker than I am.", $51
	db "I'm not like I was", $4f
	db "before.", $51
	db "I now have the", $4f
	db "best and strongest", $51
	db "#MON with me.", $4f
	db "I'm invincible!", $51
	db $52, "!", $4f
	db "I challenge you!", $57
; 0x7463d

UnknownText_0x7463d: ; 0x7463d
	db $0, "…I couldn't win…", $51
	db "I gave it every-", $4f
	db "thing I had…", $51
	db "What you possess,", $4f
	db "and what I lack…", $51
	db "I'm beginning to", $4f
	db "understand what", $51
	db "that dragon master", $4f
	db "said to me…", $57
; 0x746ce

UnknownText_0x746ce: ; 0x746ce
	db $0, "…I haven't given up", $4f
	db "on becoming the", $55
	db "greatest trainer…", $51
	db "I'm going to find", $4f
	db "out why I can't", $51
	db "win and become", $4f
	db "stronger…", $51
	db "When I do, I will", $4f
	db "challenge you.", $51
	db "And I'll beat you", $4f
	db "down with all my", $55
	db "power.", $51
	db "…Humph! You keep", $4f
	db "at it until then.", $57
; 0x747aa

UnknownText_0x747aa: ; 0x747aa
	db $0, "…Humph!", $51
	db "When it comes down", $4f
	db "to it, nothing can", $55
	db "beat power.", $51
	db "I don't need any-", $4f
	db "thing else.", $57
; 0x74802

VictoryRoad_MapEventHeader: ; 0x74802
	; filler
	db 0, 0

	; warps
	db 10
	warp_def $43, $9, 5, GROUP_VICTORY_ROAD_GATE, MAP_VICTORY_ROAD_GATE
	warp_def $31, $1, 3, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $23, $1, 2, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $1f, $d, 5, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $11, $d, 4, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $21, $11, 7, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $13, $11, 6, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $b, $0, 9, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $1b, $0, 8, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $5, $d, 3, GROUP_ROUTE_23, MAP_ROUTE_23

	; xy triggers
	db 2
	xy_trigger 0, $8, $c, $0, UnknownScript_0x74492, $0, $0
	xy_trigger 0, $8, $d, $0, UnknownScript_0x744b5, $0, $0

	; signposts
	db 2
	signpost 29, 3, $7, MapVictoryRoadSignpostItem0
	signpost 65, 3, $7, MapVictoryRoadSignpostItem1

	; people-events
	db 6
	person_event SPRITE_SILVER, 17, 22, $7, $0, 255, 255, $0, 0, ObjectEvent, $06c2
	person_event SPRITE_POKE_BALL, 32, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x74529, $06a3
	person_event SPRITE_POKE_BALL, 52, 16, $1, $0, 255, 255, $1, 0, ItemFragment_0x7452b, $06a4
	person_event SPRITE_POKE_BALL, 33, 22, $1, $0, 255, 255, $1, 0, ItemFragment_0x7452d, $06a5
	person_event SPRITE_POKE_BALL, 52, 19, $1, $0, 255, 255, $1, 0, ItemFragment_0x7452f, $06a6
	person_event SPRITE_POKE_BALL, 42, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x74531, $06a7
; 0x748a2

