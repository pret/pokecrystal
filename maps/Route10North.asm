Route10North_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 2
	warp_def $1, $b, 1, GROUP_ROUTE_10_POKECENTER_1F, MAP_ROUTE_10_POKECENTER_1F
	warp_def $9, $3, 1, GROUP_POWER_PLANT, MAP_POWER_PLANT

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 5, $0, PowerPlantSign
	signpost 1, 12, $0, Route10PokeCenterSign

	; people-events
	db 0
