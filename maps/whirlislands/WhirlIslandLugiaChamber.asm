const_value set 2
	const WHIRLISLANDLUGIACHAMBER_LUGIA

WhirlIslandLugiaChamber_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .Lugia

.Lugia:
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .NoAppear
	checkitem SILVER_WING
	iftrue .Appear
	jump .NoAppear

.Appear:
	appear WHIRLISLANDLUGIACHAMBER_LUGIA
	return

.NoAppear:
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	return

Lugia:
	faceplayer
	opentext
	writetext LugiaText
	cry LUGIA
	pause 15
	closetext
	setevent EVENT_FOUGHT_LUGIA
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon LUGIA, 60
	startbattle
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	reloadmapafterbattle
	end

LugiaText:
	text "Gyaaas!"
	done

WhirlIslandLugiaChamber_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $d, $9, 3, WHIRL_ISLAND_B2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_LUGIA, 5, 9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Lugia, EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
