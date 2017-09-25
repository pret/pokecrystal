const_value set 2
	const COPYCATSHOUSE1F_POKEFAN_M
	const COPYCATSHOUSE1F_POKEFAN_F
	const COPYCATSHOUSE1F_CLEFAIRY

CopycatsHouse1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x18ad13:
	jumptextfaceplayer UnknownText_0x18ad34

PokefanFScript_0x18ad16:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x18ad24
	writetext UnknownText_0x18ad95
	waitbutton
	closetext
	end

UnknownScript_0x18ad24:
	writetext UnknownText_0x18add3
	waitbutton
	closetext
	end

ClefairyScript_0x18ad2a:
	opentext
	writetext UnknownText_0x18ae4b
	cry BLISSEY
	waitbutton
	closetext
	end

UnknownText_0x18ad34:
	text "My daughter likes"
	line "to mimic people."

	para "Her mimicry has"
	line "earned her the"

	para "nickname COPYCAT"
	line "around here."
	done

UnknownText_0x18ad95:
	text "My daughter is so"
	line "self-centered…"

	para "She only has a few"
	line "friends."
	done

UnknownText_0x18add3:
	text "She recently lost"
	line "the # DOLL that"

	para "a boy gave her"
	line "three years ago."

	para "Ever since then,"
	line "she's gotten even"
	cont "better at mimicry…"
	done

UnknownText_0x18ae4b:
	text "BLISSEY: Bliisii!"
	done

CopycatsHouse1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $2, 8, SAFFRON_CITY
	warp_def $7, $3, 8, SAFFRON_CITY
	warp_def $0, $2, 1, COPYCATS_HOUSE_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_POKEFAN_M, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x18ad13, -1
	person_event SPRITE_POKEFAN_F, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x18ad16, -1
	person_event SPRITE_CLEFAIRY, 6, 6, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClefairyScript_0x18ad2a, -1
