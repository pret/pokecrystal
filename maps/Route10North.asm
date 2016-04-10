Route10North_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokeCenterSign:
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

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 11, 5, SIGNPOST_READ, PowerPlantSign
	signpost 1, 12, SIGNPOST_READ, Route10PokeCenterSign

.PersonEvents:
	db 0
