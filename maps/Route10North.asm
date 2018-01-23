Route10North_MapScripts:
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

Route10North_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 11, 1, 1, ROUTE_10_POKECENTER_1F
	warp_def 3, 9, 1, POWER_PLANT

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 5, 11, BGEVENT_READ, PowerPlantSign
	bg_event 12, 1, BGEVENT_READ, Route10PokecenterSign

.ObjectEvents:
	db 0
