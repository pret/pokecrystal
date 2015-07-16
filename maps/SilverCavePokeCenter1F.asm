SilverCavePokeCenter1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

NurseScript_0x1ae59a:
	jumpstd pokecenternurse

GrannyScript_0x1ae59d:
	jumptextfaceplayer UnknownText_0x1ae5a0

UnknownText_0x1ae5a0:
	text "Trainers who seek"
	line "power climb MT."

	para "SILVER despite its"
	line "many dangers…"

	para "With their trusted"
	line "#MON, they must"

	para "feel they can go"
	line "anywhere…"
	done

SilverCavePokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE
	warp_def $7, $4, 1, GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_NURSE, 5, 7, UP << 2 | $2, $0, -1, -1, $0, 0, NurseScript_0x1ae59a, -1
	person_event SPRITE_GRANNY, 9, 5, LEFT << 2 | $0, $12, -1, -1, $0, 0, GrannyScript_0x1ae59d, -1
