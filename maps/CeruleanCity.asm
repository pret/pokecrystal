CeruleanCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw 5, .FlyPoint

.FlyPoint
	setflag ENGINE_FLYPOINT_CERULEAN
	return

CooltrainerMScript_0x184009:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x184017
	writetext UnknownText_0x1840bc
	closetext
	loadmovesprites
	end

UnknownScript_0x184017:
	writetext UnknownText_0x184144
	closetext
	loadmovesprites
	end

SuperNerdScript_0x18401d:
	jumptextfaceplayer UnknownText_0x1841a8

CeruleanCitySlowbro:
	loadfont
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	closetext
	loadmovesprites
	end

CooltrainerFScript_0x18402a:
	faceplayer
	loadfont
	writetext UnknownText_0x1841fa
	closetext
	loadmovesprites
	spriteface $5, LEFT
	loadfont
	writetext UnknownText_0x184229
	closetext
	loadmovesprites
	loadfont
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	closetext
	loadmovesprites
	loadfont
	writetext UnknownText_0x18424b
	closetext
	loadmovesprites
	end

FisherScript_0x18404a:
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x184058
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue UnknownScript_0x18405e
UnknownScript_0x184058:
	writetext UnknownText_0x18424e
	closetext
	loadmovesprites
	end

UnknownScript_0x18405e:
	writetext UnknownText_0x184275
	closetext
	loadmovesprites
	end

YoungsterScript_0x184064:
	faceplayer
	loadfont
	writetext UnknownText_0x1842a9
	closetext
	loadmovesprites
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iffalse UnknownScript_0x184072
	end

UnknownScript_0x184072:
	waitbutton
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitbutton
	playsound SFX_TRANSACTION
	waitbutton
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitbutton
	playsound SFX_TRANSACTION
	waitbutton
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitbutton
	playsound SFX_TRANSACTION
	waitbutton
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitbutton
	playsound SFX_TRANSACTION
	waitbutton
	showemote EMOTE_SHOCK, $7, 15
	spriteface $7, LEFT
	loadfont
	writetext UnknownText_0x1842ee
	closetext
	loadmovesprites
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanPoliceSign:
	jumptext CeruleanPoliceSignText

CeruleanCapeSign:
	jumptext CeruleanCapeSignText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityPokeCenterSign:
	jumpstd pokecentersign

CeruleanCityMartSign:
	jumpstd martsign

MapCeruleanCitySignpostItem8:
	dwb EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY, BERSERK_GENE

UnknownText_0x1840bc:
	text "KANTO's POWER"
	line "PLANT?"

	para "It's near the end"
	line "of ROUTE 9, the"

	para "road that heads"
	line "east from here."

	para "I think there was"
	line "an accident of"
	cont "some sort there."
	done

UnknownText_0x184144:
	text "You're collecting"
	line "every single kind"
	cont "of #MON?"

	para "That must be quite"
	line "a challenge, but"
	cont "it sounds fun too."
	done

UnknownText_0x1841a8:
	text "The CAPE in the"
	line "north is a good"

	para "place for dates."
	line "Girls like it!"
	done

CeruleanCitySlowbroText:
	text "SLOWBRO: Yarah?"
	done

UnknownText_0x1841fa:
	text "My SLOWBRO and I"
	line "make an awesome"
	cont "combination!"
	done

UnknownText_0x184229:
	text "SLOWBRO, show me"
	line "your CONFUSION!"
	done

UnknownText_0x18424b:
	text "…"
	done

UnknownText_0x18424e:
	text "I'm a huge fan of"
	line "CERULEAN GYM's"
	cont "MISTY."
	done

UnknownText_0x184275:
	text "I saw this shady"
	line "guy go off toward"
	cont "CERULEAN's CAPE."
	done

UnknownText_0x1842a9:
	text "There used to be a"
	line "cave here that had"

	para "horribly powerful"
	line "#MON in it."
	done

UnknownText_0x1842ee:
	text "Ayuh?"

	para "My ITEMFINDER is"
	line "responding…"
	done

CeruleanCitySignText:
	text "CERULEAN CITY"

	para "A Mysterious Blue"
	line "Aura Surrounds It"
	done

CeruleanGymSignText:
	text "CERULEAN CITY"
	line "#MON GYM"
	cont "LEADER: MISTY"

	para "The Tomboyish"
	line "Mermaid"
	done

CeruleanBikeShopSignText:
	text "There's a notice"
	line "here…"

	para "The BIKE SHOP has"
	line "moved to GOLDENROD"
	cont "CITY in JOHTO…"
	done

CeruleanPoliceSignText:
	text "There's a notice"
	line "here…"

	para "Stamp out thievery"
	line "and make the city"

	para "a friendlier, more"
	line "cheerful place!"

	para "CERULEAN POLICE"
	done

CeruleanCapeSignText:
	text "CERULEAN CAPE"
	line "AHEAD"
	done

CeruleanLockedDoorText:
	text "It's locked…"
	done

CeruleanCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def $f, $7, 1, GROUP_CERULEAN_GYM_BADGE_SPEECH_HOUSE, MAP_CERULEAN_GYM_BADGE_SPEECH_HOUSE
	warp_def $11, $1c, 1, GROUP_CERULEAN_POLICE_STATION, MAP_CERULEAN_POLICE_STATION
	warp_def $13, $d, 1, GROUP_CERULEAN_TRADE_SPEECH_HOUSE, MAP_CERULEAN_TRADE_SPEECH_HOUSE
	warp_def $15, $13, 1, GROUP_CERULEAN_POKECENTER_1F, MAP_CERULEAN_POKECENTER_1F
	warp_def $17, $1e, 1, GROUP_CERULEAN_GYM, MAP_CERULEAN_GYM
	warp_def $1d, $19, 2, GROUP_CERULEAN_MART, MAP_CERULEAN_MART

.XYTriggers:
	db 0

.Signposts:
	db 9
	signpost 23, 23, SIGNPOST_READ, CeruleanCitySign
	signpost 25, 27, SIGNPOST_READ, CeruleanGymSign
	signpost 29, 11, SIGNPOST_READ, CeruleanBikeShopSign
	signpost 17, 25, SIGNPOST_READ, CeruleanPoliceSign
	signpost 7, 23, SIGNPOST_READ, CeruleanCapeSign
	signpost 29, 14, SIGNPOST_READ, CeruleanLockedDoor
	signpost 21, 20, SIGNPOST_READ, CeruleanCityPokeCenterSign
	signpost 29, 26, SIGNPOST_READ, CeruleanCityMartSign
	signpost 12, 2, SIGNPOST_ITEM, MapCeruleanCitySignpostItem8

.PersonEvents:
	db 6
	person_event SPRITE_COOLTRAINER_M, 27, 19, OW_DOWN | $2, $22, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, CooltrainerMScript_0x184009, -1
	person_event SPRITE_SUPER_NERD, 19, 27, OW_DOWN | $2, $11, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SuperNerdScript_0x18401d, -1
	person_event SPRITE_SLOWPOKE, 28, 24, OW_DOWN | $1, $0, -1, -1, $0, 0, CeruleanCitySlowbro, -1
	person_event SPRITE_COOLTRAINER_F, 28, 25, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CooltrainerFScript_0x18402a, -1
	person_event SPRITE_FISHER, 30, 34, OW_UP | $1, $1, -1, -1, (PAL_OW_RED << 4) | $80, 0, FisherScript_0x18404a, -1
	person_event SPRITE_YOUNGSTER, 16, 10, OW_DOWN | $3, $1, -1, -1, (PAL_OW_RED << 4) | $80, 0, YoungsterScript_0x184064, -1
