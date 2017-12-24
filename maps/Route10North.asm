Route10North_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd pokecentersign

PowerPlantSignText:
	text "KANTO POWER PLANT"
	done

Route10North_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $1, $b, 1, ROUTE_10_POKECENTER_1F
	warp_def $9, $3, 1, POWER_PLANT

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 11, 5, BGEVENT_READ, PowerPlantSign
	bg_event 1, 12, BGEVENT_READ, Route10PokecenterSign

.ObjectEvents:
	db 0
