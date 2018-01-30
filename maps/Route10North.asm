Route10North_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd pokecentersign

PowerPlantSignText:
	text "KANTO POWER PLANT"
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 1, 1, ROUTE_10_POKECENTER_1F
	warp_event 3, 9, 1, POWER_PLANT

	db 0 ; coord events

	db 2 ; bg events
	bg_event 5, 11, BGEVENT_READ, PowerPlantSign
	bg_event 12, 1, BGEVENT_READ, Route10PokecenterSign

	db 0 ; object events
