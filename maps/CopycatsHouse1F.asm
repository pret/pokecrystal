CopycatsHouse1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x18ad13:
	jumptextfaceplayer UnknownText_0x18ad34

PokefanFScript_0x18ad16:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x18ad24
	writetext UnknownText_0x18ad95
	closetext
	loadmovesprites
	end

UnknownScript_0x18ad24:
	writetext UnknownText_0x18add3
	closetext
	loadmovesprites
	end

ClefairyScript_0x18ad2a:
	loadfont
	writetext UnknownText_0x18ae4b
	cry BLISSEY
	closetext
	loadmovesprites
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
	warp_def $7, $2, 8, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $3, 8, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $0, $2, 1, GROUP_COPYCATS_HOUSE_2F, MAP_COPYCATS_HOUSE_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_POKEFAN_M, 7, 6, OW_UP | $2, $0, -1, -1, $0, 0, PokefanMScript_0x18ad13, -1
	person_event SPRITE_POKEFAN_F, 8, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, PokefanFScript_0x18ad16, -1
	person_event SPRITE_CLEFAIRY, 10, 10, OW_UP | $12, $0, -1, -1, $0, 0, ClefairyScript_0x18ad2a, -1
