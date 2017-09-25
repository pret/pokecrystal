const_value set 2
	const TINTOWERROOF_HO_OH

TinTowerRoof_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .HoOh

.HoOh:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .NoAppear
	checkitem RAINBOW_WING
	iftrue .Appear
	jump .NoAppear

.Appear:
	appear TINTOWERROOF_HO_OH
	return

.NoAppear:
	disappear TINTOWERROOF_HO_OH
	return

TinTowerHoOh:
	faceplayer
	opentext
	writetext HoOhText
	cry HO_OH
	pause 15
	closetext
	setevent EVENT_FOUGHT_HO_OH
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon HO_OH, 60
	startbattle
	disappear TINTOWERROOF_HO_OH
	reloadmapafterbattle
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	end

HoOhText:
	text "Shaoooh!"
	done

TinTowerRoof_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $d, $9, 4, TIN_TOWER_9F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_HO_OH, 5, 9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_TIN_TOWER_ROOF_HO_OH
