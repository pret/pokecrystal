const_value set 2
	const ROUTE10POKECENTER1F_NURSE
	const ROUTE10POKECENTER1F_GENTLEMAN
	const ROUTE10POKECENTER1F_GYM_GUY
	const ROUTE10POKECENTER1F_COOLTRAINER_F

Route10PokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x188bd4:
	jumpstd pokecenternurse

GentlemanScript_0x188bd7:
	jumptextfaceplayer UnknownText_0x188bf1

GymGuyScript_0x188bda:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x188be8
	writetext UnknownText_0x188c26
	waitbutton
	closetext
	end

UnknownScript_0x188be8:
	writetext UnknownText_0x188c9e
	waitbutton
	closetext
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

.Warps:
	db 3
	warp_def $7, $3, 1, ROUTE_10_NORTH
	warp_def $7, $4, 1, ROUTE_10_NORTH
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x188bd4, -1
	person_event SPRITE_GENTLEMAN, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x188bd7, -1
	person_event SPRITE_GYM_GUY, 2, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GymGuyScript_0x188bda, -1
	person_event SPRITE_COOLTRAINER_F, 3, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x188bee, -1
