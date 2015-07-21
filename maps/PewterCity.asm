PewterCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw 5, .FlyPoint

.FlyPoint
	setflag ENGINE_FLYPOINT_PEWTER
	return

CooltrainerFScript_0x18c009:
	jumptextfaceplayer UnknownText_0x18c042

BugCatcherScript_0x18c00c:
	jumptextfaceplayer UnknownText_0x18c080

GrampsScript_0x18c00f:
	faceplayer
	loadfont
	checkevent EVENT_GOT_SILVER_WING
	iftrue UnknownScript_0x18c023
	writetext UnknownText_0x18c0c6
	keeptextopen
	verbosegiveitem SILVER_WING, 1
	setevent EVENT_GOT_SILVER_WING
	loadmovesprites
	end

UnknownScript_0x18c023:
	writetext UnknownText_0x18c1aa
	closetext
	loadmovesprites
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokeCenterSign:
	jumpstd pokecentersign

PewterCityMartSign:
	jumpstd martsign

FruitTreeScript_0x18c03e:
	fruittree $1c

FruitTreeScript_0x18c040:
	fruittree $1d

UnknownText_0x18c042:
	text "Have you visited"
	line "PEWTER GYM?"

	para "The LEADER uses"
	line "rock-type #MON."
	done

UnknownText_0x18c080:
	text "At night, CLEFAIRY"
	line "come out to play"
	cont "at MT.MOON."

	para "But not every"
	line "night."
	done

UnknownText_0x18c0c6:
	text "Ah, you came all"
	line "the way out here"
	cont "from JOHTO?"

	para "That brings back"
	line "memories. When I"

	para "was young, I went"
	line "to JOHTO to train."

	para "You remind me so"
	line "much of what I was"

	para "like as a young"
	line "man."

	para "Here. I want you"
	line "to have this item"
	cont "I found in JOHTO."
	done

UnknownText_0x18c1aa:
	text "Going to new, un-"
	line "known places and"
	cont "seeing new people…"

	para "Those are the joys"
	line "of travel."
	done

PewterCitySignText:
	text "PEWTER CITY"
	line "A Stone Gray City"
	done

PewterGymSignText:
	text "PEWTER CITY"
	line "#MON GYM"
	cont "LEADER: BROCK"

	para "The Rock Solid"
	line "#MON Trainer"
	done

PewterMuseumSignText:
	text "There's a notice"
	line "here…"

	para "PEWTER MUSEUM OF"
	line "SCIENCE is closed"
	cont "for renovations…"
	done

PewterCityMtMoonGiftShopSignText:
	text "There's a notice"
	line "here…"

	para "MT.MOON GIFT SHOP"
	line "NOW OPEN!"
	done

PewterCityWelcomeSignText:
	text "WELCOME TO"
	line "PEWTER CITY!"
	done

PewterCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $d, $1d, 1, GROUP_PEWTER_NIDORAN_SPEECH_HOUSE, MAP_PEWTER_NIDORAN_SPEECH_HOUSE
	warp_def $11, $10, 1, GROUP_PEWTER_GYM, MAP_PEWTER_GYM
	warp_def $11, $17, 2, GROUP_PEWTER_MART, MAP_PEWTER_MART
	warp_def $19, $d, 1, GROUP_PEWTER_POKECENTER_1F, MAP_PEWTER_POKECENTER_1F
	warp_def $1d, $7, 1, GROUP_PEWTER_SNOOZE_SPEECH_HOUSE, MAP_PEWTER_SNOOZE_SPEECH_HOUSE

.XYTriggers:
	db 0

.Signposts:
	db 7
	signpost 23, 25, SIGNPOST_READ, PewterCitySign
	signpost 17, 11, SIGNPOST_READ, PewterGymSign
	signpost 9, 15, SIGNPOST_READ, PewterMuseumSign
	signpost 19, 33, SIGNPOST_READ, PewterCityMtMoonGiftShopSign
	signpost 29, 19, SIGNPOST_READ, PewterCityWelcomeSign
	signpost 25, 14, SIGNPOST_READ, PewterCityPokeCenterSign
	signpost 17, 24, SIGNPOST_READ, PewterCityMartSign

.PersonEvents:
	db 5
	person_event SPRITE_COOLTRAINER_F, 15, 23, OW_DOWN | $2, $22, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CooltrainerFScript_0x18c009, -1
	person_event SPRITE_BUG_CATCHER, 33, 18, OW_DOWN | $2, $22, -1, -1, (PAL_OW_RED << 4) | $80, 0, BugCatcherScript_0x18c00c, -1
	person_event SPRITE_GRAMPS, 21, 33, OW_UP | $1, $2, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, GrampsScript_0x18c00f, -1
	person_event SPRITE_FRUIT_TREE, 7, 36, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x18c03e, -1
	person_event SPRITE_FRUIT_TREE, 7, 34, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x18c040, -1
