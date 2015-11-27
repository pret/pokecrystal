const_value set 2
	const ROUTE15FUCHSIAGATE_OFFICER

Route15FuchsiaGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x19679e:
	jumptextfaceplayer UnknownText_0x1967a1

UnknownText_0x1967a1:
	text "You're working on"
	line "a #DEX? That's"

	para "really something."
	line "Don't give up!"
	done

Route15FuchsiaGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 8, FUCHSIA_CITY
	warp_def $5, $0, 9, FUCHSIA_CITY
	warp_def $4, $9, 1, ROUTE_15
	warp_def $5, $9, 2, ROUTE_15

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x19679e, -1
