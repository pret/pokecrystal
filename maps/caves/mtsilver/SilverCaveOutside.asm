SilverCaveOutside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	return

MtSilverPokeCenterSign:
	jumpstd pokecentersign

MtSilverSign:
	jumptext MtSilverSignText

SilverCaveOutsideHiddenFullRestore:
	dwb EVENT_SILVER_CAVE_OUTSIDE_HIDDEN_FULL_RESTORE, FULL_RESTORE

MtSilverSignText:
	text "MT.SILVER"
	done

SilverCaveOutside_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $13, $17, 1, SILVER_CAVE_POKECENTER_1F
	warp_def $b, $12, 1, SILVER_CAVE_ROOM_1

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 19, 24, SIGNPOST_READ, MtSilverPokeCenterSign
	signpost 13, 17, SIGNPOST_READ, MtSilverSign
	signpost 25, 9, SIGNPOST_ITEM, SilverCaveOutsideHiddenFullRestore

.PersonEvents:
	db 0
