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
	scall UnknownScript_0x744d4
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
	scall UnknownScript_0x744d4
	applymovement $2, MovementData_0x74555
	disappear $2
	dotrigger $1
	playmapmusic
	end
; 0x744d4

UnknownScript_0x744d4: ; 0x744d4
	spriteface $0, $0
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x7455f
	closetext
	loadmovesprites
	setevent $06c2
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x744ff
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x7450f
	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
	setlasttalked $2
	loadtrainer RIVAL1, RIVAL1_15
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x7451f
; 0x744ff

UnknownScript_0x744ff: ; 0x744ff
	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
	setlasttalked $2
	loadtrainer RIVAL1, RIVAL1_13
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x7451f
; 0x7450f

UnknownScript_0x7450f: ; 0x7450f
	winlosstext UnknownText_0x7463d, UnknownText_0x747aa
	setlasttalked $2
	loadtrainer RIVAL1, RIVAL1_14
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x7451f
; 0x7451f

UnknownScript_0x7451f: ; 0x7451f
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x746ce
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
	text "Hold it."

	para "…Are you going to"
	line "take the #MON"
	cont "LEAGUE challenge?"

	para "…Don't make me"
	line "laugh."

	para "You're so much"
	line "weaker than I am."

	para "I'm not like I was"
	line "before."

	para "I now have the"
	line "best and strongest"

	para "#MON with me."
	line "I'm invincible!"

	para $52, "!"
	line "I challenge you!"
	done
; 0x7463d

UnknownText_0x7463d: ; 0x7463d
	text "…I couldn't win…"

	para "I gave it every-"
	line "thing I had…"

	para "What you possess,"
	line "and what I lack…"

	para "I'm beginning to"
	line "understand what"

	para "that dragon master"
	line "said to me…"
	done
; 0x746ce

UnknownText_0x746ce: ; 0x746ce
	text "…I haven't given up"
	line "on becoming the"
	cont "greatest trainer…"

	para "I'm going to find"
	line "out why I can't"

	para "win and become"
	line "stronger…"

	para "When I do, I will"
	line "challenge you."

	para "And I'll beat you"
	line "down with all my"
	cont "power."

	para "…Humph! You keep"
	line "at it until then."
	done
; 0x747aa

UnknownText_0x747aa: ; 0x747aa
	text "…Humph!"

	para "When it comes down"
	line "to it, nothing can"
	cont "beat power."

	para "I don't need any-"
	line "thing else."
	done
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

