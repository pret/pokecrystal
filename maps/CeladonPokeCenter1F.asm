CeladonPokeCenter1F_MapScriptHeader: ; 0x71e20
	; trigger count
	db 0

	; callback count
	db 0
; 0x71e22

UnknownScript_0x71e22: ; 0x71e22
	jumpstd $0000
; 0x71e25

UnknownScript_0x71e25: ; 0x71e25
	jumpstd $0033
; 0x71e28

UnknownScript_0x71e28: ; 0x71e28
	jumptextfaceplayer UnknownText_0x71e70
; 0x71e2b

UnknownScript_0x71e2b: ; 0x71e2b
	jumptextfaceplayer UnknownText_0x71ec1
; 0x71e2e

UnknownScript_0x71e2e: ; 0x71e2e
	faceplayer
	loadfont
	2writetext UnknownText_0x71f22
	keeptextopen
	writebyte SUICUNE
	special $0097
	iffalse UnknownScript_0x71e46
	special $0096
	iftrue UnknownScript_0x71e48
	2writetext UnknownText_0x7201a
	closetext
UnknownScript_0x71e46: ; 0x71e46
	loadmovesprites
	end
; 0x71e48

UnknownScript_0x71e48: ; 0x71e48
	2writetext UnknownText_0x71f65
	closetext
	loadmovesprites
	checkcode $9
	if_equal $1, UnknownScript_0x71e5a
	applymovement $6, MovementData_0x71e6b
	2jump UnknownScript_0x71e5e
; 0x71e5a

UnknownScript_0x71e5a: ; 0x71e5a
	applymovement $6, MovementData_0x71e65
UnknownScript_0x71e5e: ; 0x71e5e
	disappear $6
	playsound $0023
	waitbutton
	end
; 0x71e65

MovementData_0x71e65: ; 0x71e65
	step_left
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x71e6b

MovementData_0x71e6b: ; 0x71e6b
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x71e70

UnknownText_0x71e70: ; 0x71e70
	db $0, "ERIKA is a master", $4f
	db "of grass #MON.", $51
	db "She'll make you", $4f
	db "pay if you don't", $55
	db "watch yourself.", $57
; 0x71ec1

UnknownText_0x71ec1: ; 0x71ec1
	db $0, "TEAM ROCKET's", $4f
	db "hideout is in the", $51
	db "basement of the", $4f
	db "GAME CORNER.", $51
	db "Oh, wait. That was", $4f
	db "three years ago.", $57
; 0x71f22

UnknownText_0x71f22: ; 0x71f22
	db $0, "EUSINE: Hi!", $51
	db "I'm back visiting", $4f
	db "my hometown.", $51
	db "It's been quite a", $4f
	db "while.", $57
; 0x71f65

UnknownText_0x71f65: ; 0x71f65
	db $0, $52, ", have you", $4f
	db "heard?", $51
	db "There have been", $4f
	db "fresh rumors of a", $51
	db "rainbow-colored", $4f
	db "#MON appearing", $55
	db "at TIN TOWER.", $51
	db "I've just had my", $4f
	db "party healed, so", $51
	db "now I'm headed to", $4f
	db "ECRUTEAK.", $51
	db "I'll be seeing", $4f
	db "you, ", $52, "!", $57
; 0x7201a

UnknownText_0x7201a: ; 0x7201a
	db $0, "Oh, by the way,", $4f
	db $52, ".", $51
	db "Have you caught", $4f
	db "the legendary", $51
	db "#MON RAIKOU and", $4f
	db "ENTEI?", $51
	db $56, $56, $56, $51
	db "Okay…", $51
	db "If you catch even", $4f
	db "one, I hope that", $55
	db "you'll inform me.", $51
	db "I'm counting on", $4f
	db "you, ", $52, "!", $57
; 0x720b8

CeladonPokeCenter1F_MapEventHeader: ; 0x720b8
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 5, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $7, $4, 5, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x71e22, $ffff
	person_event $40, 9, 5, $5, $1, 255, 255, $0, 0, UnknownScript_0x71e25, $ffff
	person_event $4b, 7, 4, $6, $0, 255, 255, $80, 0, UnknownScript_0x71e2b, $ffff
	person_event $24, 10, 12, $5, $1, 255, 255, $a0, 0, UnknownScript_0x71e28, $ffff
	person_event $2b, 7, 8, $6, $0, 255, 255, $90, 0, UnknownScript_0x71e2e, $07b7
; 0x7210e

