OlivineLighthouse6F_MapScriptHeader: ; 0x60b8f
	; trigger count
	db 0

	; callback count
	db 0
; 0x60b91

JasmineScript_0x60b91: ; 0x60b91
	faceplayer
	loadfont
	checkitem SECRETPOTION
	iftrue UnknownScript_0x60bab
	checkbit1 $0037
	iftrue UnknownScript_0x60ba5
	2writetext UnknownText_0x60c81
	keeptextopen
	setbit1 $0037
UnknownScript_0x60ba5: ; 0x60ba5
	2writetext UnknownText_0x60d64
	closetext
	loadmovesprites
	end
; 0x60bab

UnknownScript_0x60bab: ; 0x60bab
	2writetext UnknownText_0x60d99
	yesorno
	iffalse UnknownScript_0x60c25
	2writetext UnknownText_0x60dc3
	keeptextopen
	takeitem SECRETPOTION, 1
	2writetext UnknownText_0x60dea
	closetext
	loadmovesprites
	spriteface $2, $3
	pause 15
	spriteface $3, $2
	loadfont
	playmusic $000d
	2writetext UnknownText_0x60e44
	pause 60
	keeptextopen
	loadmovesprites
	special $003d
	cry AMPHAROS
	special $002e
	pause 10
	special $0031
	loadfont
	2writetext UnknownText_0x60f3d
	closetext
	loadmovesprites
	spriteface $3, $3
	pause 10
	spriteface $3, $2
	pause 10
	spriteface $3, $3
	pause 10
	spriteface $3, $2
	pause 10
	faceplayer
	loadfont
	2writetext UnknownText_0x60e6c
	closetext
	loadmovesprites
	setbit1 EVENT_JASMINE_RETURNED_TO_GYM
	clearbit1 $06d3
	checkcode $9
	if_equal $0, UnknownScript_0x60c17
	if_equal $3, UnknownScript_0x60c1e
	applymovement $2, MovementData_0x60c68
	disappear $2
	end
; 0x60c17

UnknownScript_0x60c17: ; 0x60c17
	applymovement $2, MovementData_0x60c70
	disappear $2
	end
; 0x60c1e

UnknownScript_0x60c1e: ; 0x60c1e
	applymovement $2, MovementData_0x60c79
	disappear $2
	end
; 0x60c25

UnknownScript_0x60c25: ; 0x60c25
	2writetext UnknownText_0x60edf
	closetext
	loadmovesprites
	spriteface $2, $3
	pause 15
	spriteface $3, $2
	loadfont
	2writetext UnknownText_0x60ef1
	closetext
	loadmovesprites
	end
; 0x60c39

UnknownScript_0x60c39: ; 0x60c39
	end
; 0x60c3a

MonsterScript_0x60c3a: ; 0x60c3a
	faceplayer
	loadfont
	checkbit1 EVENT_JASMINE_RETURNED_TO_GYM
	iftrue UnknownScript_0x60c51
	2writetext UnknownText_0x60f03
	writebyte AMPHAROS
	special $005f
	keeptextopen
	2writetext UnknownText_0x60f19
	closetext
	loadmovesprites
	end
; 0x60c51

UnknownScript_0x60c51: ; 0x60c51
	2writetext UnknownText_0x60f3d
	cry AMPHAROS
	closetext
	loadmovesprites
	special $002e
	special $0031
	special $002e
	special $0031
	end
; 0x60c66

ItemFragment_0x60c66: ; 0x60c66
	db SUPER_POTION, 1
; 0x60c68

MovementData_0x60c68: ; 0x60c68
	slow_step_up
	slow_step_up
	slow_step_right
	slow_step_up
	slow_step_up
	accelerate_last
	accelerate_last
	step_end
; 0x60c70

MovementData_0x60c70: ; 0x60c70
	slow_step_down
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_up
	slow_step_right
	slow_step_right
	slow_step_right
	step_end
; 0x60c79

MovementData_0x60c79: ; 0x60c79
	slow_step_up
	slow_step_up
	slow_step_right
	slow_step_up
	slow_step_up
	slow_step_up
	accelerate_last
	step_end
; 0x60c81

UnknownText_0x60c81: ; 0x60c81
	db $0, "JASMINE: … This", $4f
	db "#MON always", $51
	db "kept the sea lit", $4f
	db "at night.", $51
	db "…But it suddenly", $4f
	db "got sick… It's", $55
	db "gasping for air…", $51
	db "…I understand", $4f
	db "that there is a", $51
	db "wonderful PHARMACY", $4f
	db "in CIANWOOD…", $51
	db "But that's across", $4f
	db "the sea…", $51
	db "And I can't leave", $4f
	db "AMPHY unattended…", $57
; 0x60d64

UnknownText_0x60d64: ; 0x60d64
	db $0, "…May I ask you to", $4f
	db "get some medicine", $55
	db "for me? Please?", $57
; 0x60d99

UnknownText_0x60d99: ; 0x60d99
	db $0, "JASMINE: …Will", $4f
	db "that medicine cure", $55
	db "AMPHY?", $57
; 0x60dc3

UnknownText_0x60dc3: ; 0x60dc3
	db $0, $52, " handed the", $4f
	db "SECRETPOTION to", $55
	db "JASMINE.", $57
; 0x60dea

UnknownText_0x60dea: ; 0x60dea
	db $0, "JASMINE: …Um,", $4f
	db "please don't be", $55
	db "offended…", $51
	db "…AMPHY will not", $4f
	db "take anything from", $55
	db "anyone but me…", $57
; 0x60e44

UnknownText_0x60e44: ; 0x60e44
	db $0, "JASMINE: …", $51
	db "AMPHY, how are you", $4f
	db "feeling?", $57
; 0x60e6c

UnknownText_0x60e6c: ; 0x60e6c
	db $0, "JASMINE: …Oh, I'm", $4f
	db "so relieved…", $51
	db "This is just so", $4f
	db "wonderful…", $51
	db "Thank you so very,", $4f
	db "very much.", $51
	db "…I will return to", $4f
	db "the GYM…", $57
; 0x60edf

UnknownText_0x60edf: ; 0x60edf
	db $0, "JASMINE: …I see…", $57
; 0x60ef1

UnknownText_0x60ef1: ; 0x60ef1
	db $0, "…AMPHY, hang on!", $57
; 0x60f03

UnknownText_0x60f03: ; 0x60f03
	db $0, "AMPHY: …", $4f
	db "…Pa… paloo…", $57
; 0x60f19

UnknownText_0x60f19: ; 0x60f19
	db $0, "Its breathing is", $4f
	db "terribly labored…", $57
; 0x60f3d

UnknownText_0x60f3d: ; 0x60f3d
	db $0, "AMPHY: Palu!", $4f
	db "Palulu!", $57
; 0x60f53

OlivineLighthouse6F_MapEventHeader: ; 0x60f53
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $f, $9, 1, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F
	warp_def $5, $10, 6, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F
	warp_def $5, $11, 7, GROUP_OLIVINE_LIGHTHOUSE_5F, MAP_OLIVINE_LIGHTHOUSE_5F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_JASMINE, 12, 12, $6, $0, 255, 255, $80, 0, JasmineScript_0x60b91, $06d2
	person_event SPRITE_MONSTER, 12, 13, $6, $0, 255, 255, $b0, 0, MonsterScript_0x60c3a, $ffff
	person_event SPRITE_POKE_BALL, 8, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x60c66, $0668
; 0x60f8f

