SilverCaveOutside_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks
	dbw 5, .FlyPoint

.FlyPoint
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	return

MtSilverPokeCenterSign:
	jumpstd pokecentersign

MtSilverSign:
	jumptext MtSilverSignText

MapSilverCaveOutsideSignpostItem2:
	dw $00b8
	db FULL_RESTORE

MtSilverSignText:
	text "MT.SILVER"
	done

SilverCaveOutside_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $13, $17, 1, GROUP_SILVER_CAVE_POKECENTER_1F, MAP_SILVER_CAVE_POKECENTER_1F
	warp_def $b, $12, 1, GROUP_SILVER_CAVE_ROOM_1, MAP_SILVER_CAVE_ROOM_1

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 19, 24, $0, MtSilverPokeCenterSign
	signpost 13, 17, $0, MtSilverSign
	signpost 25, 9, $7, MapSilverCaveOutsideSignpostItem2

	; people-events
	db 0
