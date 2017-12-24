SilverCaveOutside_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	return

MtSilverPokecenterSign:
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

.CoordEvents:
	db 0

.BGEvents:
	db 3
	bg_event 19, 24, BGEVENT_READ, MtSilverPokecenterSign
	bg_event 13, 17, BGEVENT_READ, MtSilverSign
	bg_event 25, 9, BGEVENT_ITEM, SilverCaveOutsideHiddenFullRestore

.ObjectEvents:
	db 0
