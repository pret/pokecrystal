const_value set 2
	const ILEXFORESTAZALEAGATE_OFFICER
	const ILEXFORESTAZALEAGATE_GRANNY

IlexForestAzaleaGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x62c7a:
	jumptextfaceplayer UnknownText_0x62c80

GrannyScript_0x62c7d:
	jumptextfaceplayer UnknownText_0x62cb0

UnknownText_0x62c80:
	text "ILEX FOREST is"
	line "big. Be careful!"
	cont "Don't get lost."
	done

UnknownText_0x62cb0:
	text "The FOREST is"
	line "watched over by"
	cont "its protector."

	para "Stay out of"
	line "mischief!"
	done

IlexForestAzaleaGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 2, ILEX_FOREST
	warp_def $5, $0, 3, ILEX_FOREST
	warp_def $4, $9, 7, AZALEA_TOWN
	warp_def $5, $9, 8, AZALEA_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OfficerScript_0x62c7a, -1
	person_event SPRITE_GRANNY, 3, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GrannyScript_0x62c7d, -1
