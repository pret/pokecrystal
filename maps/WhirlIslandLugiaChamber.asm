WhirlIslandLugiaChamber_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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
	appear $2
	return

UnknownScript_0x18c515:
	disappear $2
	return

LugiaScript_0x18c518:
	faceplayer
	loadfont
	writetext UnknownText_0x18c531
	cry LUGIA
	pause 15
	loadmovesprites
	setevent EVENT_FOUGHT_LUGIA
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadpokedata LUGIA, 60
	startbattle
	disappear $2
	returnafterbattle
	end

UnknownText_0x18c531:
	text "Gyaaas!"
	done

WhirlIslandLugiaChamber_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $d, $9, 3, GROUP_WHIRL_ISLAND_B2F, MAP_WHIRL_ISLAND_B2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_LUGIA, 9, 13, $16, $0, 255, 255, $90, 0, LugiaScript_0x18c518, $073d
