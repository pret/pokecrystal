const_value set 2
	const COPYCATSHOUSE1F_POKEFAN_M
	const COPYCATSHOUSE1F_POKEFAN_F
	const COPYCATSHOUSE1F_CLEFAIRY

CopycatsHouse1F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

CopycatsHouse1FPokefanMScript:
	jumptextfaceplayer CopycatsHouse1FPokefanMText

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

CopycatsHouse1FPokefanMText:
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

CopycatsHouse1F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def 2, 7, 8, SAFFRON_CITY
	warp_def 3, 7, 8, SAFFRON_CITY
	warp_def 2, 0, 1, COPYCATS_HOUSE_2F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 3
	object_event 2, 3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CopycatsHouse1FPokefanMScript, -1
	object_event 5, 4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokefanFScript_0x18ad16, -1
	object_event 6, 6, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ClefairyScript_0x18ad2a, -1
