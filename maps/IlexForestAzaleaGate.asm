const_value set 2 ; person constants
	const ILEXFORESTAZALEAGATE_OFFICER
	const ILEXFORESTAZALEAGATE_GRANNY

IlexForestAzaleaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IlexForestAzaleaGateOfficerScript:
	jumptextfaceplayer IlexForestAzaleaGateOfficerText

IlexForestAzaleaGateGrannyScript:
	jumptextfaceplayer IlexForestAzaleaGateGrannyText

IlexForestAzaleaGateOfficerText:
	text "ILEX FOREST is"
	line "big. Be careful!"
	cont "Don't get lost."
	done

IlexForestAzaleaGateGrannyText:
	text "The FOREST is"
	line "watched over by"
	cont "its protector."

	para "Stay out of"
	line "mischief!"
	done

IlexForestAzaleaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 0, 4, 2, ILEX_FOREST
	warp_event 0, 5, 3, ILEX_FOREST
	warp_event 9, 4, 7, AZALEA_TOWN
	warp_event 9, 5, 8, AZALEA_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 5, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateOfficerScript, -1
	object_event 1, 3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateGrannyScript, -1
