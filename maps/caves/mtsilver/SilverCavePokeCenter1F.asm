const_value set 2
	const SILVERCAVEPOKECENTER1F_NURSE
	const SILVERCAVEPOKECENTER1F_GRANNY

SilverCavePokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 3
	warp_def $7, $3, 1, SILVER_CAVE_OUTSIDE
	warp_def $7, $4, 1, SILVER_CAVE_OUTSIDE
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x1ae59a, -1
	person_event SPRITE_GRANNY, 5, 1, SPRITEMOVEDATA_STANDING_LEFT, 1, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrannyScript_0x1ae59d, -1
