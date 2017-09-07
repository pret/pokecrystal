const_value set 2
	const CELADONMANSIONROOF_FISHER

CeladonMansionRoof_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FisherScript_0x71a39:
	jumptextfaceplayer UnknownText_0x71a3f

MapCeladonMansionRoofSignpost0Script:
	jumptext UnknownText_0x71aa1

UnknownText_0x71a3f:
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

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 1, 6, SIGNPOST_LEFT, MapCeladonMansionRoofSignpost0Script

.PersonEvents:
	db 1
	person_event SPRITE_FISHER, 5, 7, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FisherScript_0x71a39, -1
