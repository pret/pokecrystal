Route10PokeCenter1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

NurseScript_0x188bd4:
	jumpstd pokecenternurse

GentlemanScript_0x188bd7:
	jumptextfaceplayer UnknownText_0x188bf1

GymGuyScript_0x188bda:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188be8
	writetext UnknownText_0x188c26
	closetext
	loadmovesprites
	end

UnknownScript_0x188be8:
	writetext UnknownText_0x188c9e
	closetext
	loadmovesprites
	end

CooltrainerFScript_0x188bee:
	jumptextfaceplayer UnknownText_0x188d0c

UnknownText_0x188bf1:
	text "A #MON CENTER"
	line "near a cave?"

	para "That's mighty"
	line "convenient."
	done

UnknownText_0x188c26:
	text "The POWER PLANT's"
	line "MANAGER is looking"

	para "for a strong #-"
	line "MON trainer."

	para "He needs help"
	line "getting back"

	para "something that"
	line "was stolen."
	done

UnknownText_0x188c9e:
	text "I hear TEAM ROCKET"
	line "got back together"

	para "in JOHTO but fell"
	line "apart right away."

	para "I didn't know any-"
	line "thing about that."
	done

UnknownText_0x188d0c:
	text "When you go out-"
	line "side, you can see"

	para "the roof of a big"
	line "building."

	para "That's the POWER"
	line "PLANT."
	done

Route10PokeCenter1F_MapEventHeader:
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
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x188bd4, EVENT_ALWAYS_THERE
	person_event SPRITE_GENTLEMAN, 10, 11, $5, $1, 255, 255, $80, 0, GentlemanScript_0x188bd7, EVENT_ALWAYS_THERE
	person_event SPRITE_GYM_GUY, 6, 11, $3, $0, 255, 255, $a0, 0, GymGuyScript_0x188bda, EVENT_ALWAYS_THERE
	person_event SPRITE_COOLTRAINER_F, 7, 5, $6, $0, 255, 255, $0, 0, CooltrainerFScript_0x188bee, EVENT_ALWAYS_THERE
