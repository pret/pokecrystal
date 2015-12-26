const_value set 2
	const TINTOWERROOF_HO_OH

TinTowerRoof_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, UnknownScript_0x77230

UnknownScript_0x77230:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue UnknownScript_0x77241
	checkitem RAINBOW_WING
	iftrue UnknownScript_0x7723e
	jump UnknownScript_0x77241

UnknownScript_0x7723e:
	appear TINTOWERROOF_HO_OH
	return

UnknownScript_0x77241:
	disappear TINTOWERROOF_HO_OH
	return

HoOhScript_0x77244:
	faceplayer
	opentext
	writetext UnknownText_0x77260
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

UnknownText_0x77260:
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
	person_event SPRITE_HO_OH, 5, 9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, HoOhScript_0x77244, EVENT_TIN_TOWER_ROOF_HO_OH
