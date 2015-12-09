const_value set 2
	const WHIRLISLANDLUGIACHAMBER_LUGIA

WhirlIslandLugiaChamber_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, UnknownScript_0x18c504

UnknownScript_0x18c504:
	checkevent EVENT_FOUGHT_LUGIA
	iftrue UnknownScript_0x18c515
	checkitem SILVER_WING
	iftrue UnknownScript_0x18c512
	jump UnknownScript_0x18c515

UnknownScript_0x18c512:
	appear WHIRLISLANDLUGIACHAMBER_LUGIA
	return

UnknownScript_0x18c515:
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	return

LugiaScript_0x18c518:
	faceplayer
	opentext
	writetext UnknownText_0x18c531
	cry LUGIA
	pause 15
	closetext
	setevent EVENT_FOUGHT_LUGIA
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon LUGIA, 60
	startbattle
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	returnafterbattle
	end

UnknownText_0x18c531:
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
	person_event SPRITE_LUGIA, 5, 9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LugiaScript_0x18c518, EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
