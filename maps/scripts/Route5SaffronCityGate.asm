const_value set 2
	const ROUTE5SAFFRONCITYGATE_OFFICER

Route5SaffronCityGate_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route5SaffronCityGateOfficerScript:
	jumptextfaceplayer Route5SaffronCityGateOfficerText

Route5SaffronCityGateOfficerText:
	text "You're from JOHTO,"
	line "aren't you?"

	para "How do you like"
	line "KANTO? It's nice,"
	cont "don't you agree?"
	done

Route5SaffronCityGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 2, ROUTE_5
	warp_def $0, $5, 3, ROUTE_5
	warp_def $7, $4, 9, SAFFRON_CITY
	warp_def $7, $5, 9, SAFFRON_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5SaffronCityGateOfficerScript, -1
