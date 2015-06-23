Route10PokeCenter1F_MapScriptHeader: ; 0x188bd2
	; trigger count
	db 0

	; callback count
	db 0
; 0x188bd4

NurseScript_0x188bd4: ; 0x188bd4
	jumpstd pokecenternurse
; 0x188bd7

GentlemanScript_0x188bd7: ; 0x188bd7
	jumptextfaceplayer UnknownText_0x188bf1
; 0x188bda

GymGuyScript_0x188bda: ; 0x188bda
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188be8
	writetext UnknownText_0x188c26
	closetext
	loadmovesprites
	end
; 0x188be8

UnknownScript_0x188be8: ; 0x188be8
	writetext UnknownText_0x188c9e
	closetext
	loadmovesprites
	end
; 0x188bee

CooltrainerFScript_0x188bee: ; 0x188bee
	jumptextfaceplayer UnknownText_0x188d0c
; 0x188bf1

UnknownText_0x188bf1: ; 0x188bf1
	text "A #MON CENTER"
	line "near a cave?"

	para "That's mighty"
	line "convenient."
	done
; 0x188c26

UnknownText_0x188c26: ; 0x188c26
	text "The POWER PLANT's"
	line "MANAGER is looking"

	para "for a strong #-"
	line "MON trainer."

	para "He needs help"
	line "getting back"

	para "something that"
	line "was stolen."
	done
; 0x188c9e

UnknownText_0x188c9e: ; 0x188c9e
	text "I hear TEAM ROCKET"
	line "got back together"

	para "in JOHTO but fell"
	line "apart right away."

	para "I didn't know any-"
	line "thing about that."
	done
; 0x188d0c

UnknownText_0x188d0c: ; 0x188d0c
	text "When you go out-"
	line "side, you can see"

	para "the roof of a big"
	line "building."

	para "That's the POWER"
	line "PLANT."
	done
; 0x188d63

Route10PokeCenter1F_MapEventHeader: ; 0x188d63
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH
	warp_def $7, $4, 1, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x188bd4, $ffff
	person_event SPRITE_GENTLEMAN, 10, 11, $5, $1, 255, 255, $80, 0, GentlemanScript_0x188bd7, $ffff
	person_event SPRITE_GYM_GUY, 6, 11, $3, $0, 255, 255, $a0, 0, GymGuyScript_0x188bda, $ffff
	person_event SPRITE_COOLTRAINER_F, 7, 5, $6, $0, 255, 255, $0, 0, CooltrainerFScript_0x188bee, $ffff
; 0x188dac
