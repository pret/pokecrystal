SilverCaveOutside_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	return

MtSilverPokecenterSign:
	jumpstd pokecentersign

MtSilverSign:
	jumptext MtSilverSignText

SilverCaveOutsideHiddenFullRestore:
	hiddenitem EVENT_SILVER_CAVE_OUTSIDE_HIDDEN_FULL_RESTORE, FULL_RESTORE

MtSilverSignText:
	text "MT.SILVER"
	done

SilverCaveOutside_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 23, 19, 1, SILVER_CAVE_POKECENTER_1F
	warp_def 18, 11, 1, SILVER_CAVE_ROOM_1

.CoordEvents:
	db 0

.BGEvents:
	db 3
	bg_event 24, 19, BGEVENT_READ, MtSilverPokecenterSign
	bg_event 17, 13, BGEVENT_READ, MtSilverSign
	bg_event 9, 25, BGEVENT_ITEM, SilverCaveOutsideHiddenFullRestore

.ObjectEvents:
	db 0
