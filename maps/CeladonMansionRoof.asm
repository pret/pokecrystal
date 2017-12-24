const_value set 2
	const CELADONMANSIONROOF_FISHER

CeladonMansionRoof_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

CeladonMansionRoofFisherScript:
	jumptextfaceplayer CeladonMansionRoofFisherText

MapCeladonMansionRoofSignpost0Script:
	jumptext UnknownText_0x71aa1

CeladonMansionRoofFisherText:
	text "High places--I do"
	line "love them so!"

	para "I'd say the only"
	line "thing that loves"

	para "heights as much as"
	line "me is smoke!"
	done

UnknownText_0x71aa1:
	text "There's graffiti"
	line "on the wall…"

	para "<PLAYER> added a"
	line "moustache!"
	done

CeladonMansionRoof_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $1, $1, 1, CELADON_MANSION_3F
	warp_def $1, $6, 4, CELADON_MANSION_3F
	warp_def $5, $2, 1, CELADON_MANSION_ROOF_HOUSE

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 1, 6, BGEVENT_LEFT, MapCeladonMansionRoofSignpost0Script

.ObjectEvents:
	db 1
	object_event SPRITE_FISHER, 5, 7, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofFisherScript, -1
