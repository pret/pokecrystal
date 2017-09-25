const_value set 2
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_FISHER
	const CERULEANCITY_YOUNGSTER

CeruleanCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	return

CooltrainerMScript_0x184009:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x184017
	writetext UnknownText_0x1840bc
	waitbutton
	closetext
	end

UnknownScript_0x184017:
	writetext UnknownText_0x184144
	waitbutton
	closetext
	end

SuperNerdScript_0x18401d:
	jumptextfaceplayer UnknownText_0x1841a8

CeruleanCitySlowbro:
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	end

CooltrainerFScript_0x18402a:
	faceplayer
	opentext
	writetext UnknownText_0x1841fa
	waitbutton
	closetext
	spriteface CERULEANCITY_COOLTRAINER_F, LEFT
	opentext
	writetext UnknownText_0x184229
	waitbutton
	closetext
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	opentext
	writetext UnknownText_0x18424b
	waitbutton
	closetext
	end

FisherScript_0x18404a:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x184058
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue UnknownScript_0x18405e
UnknownScript_0x184058:
	writetext UnknownText_0x18424e
	waitbutton
	closetext
	end

UnknownScript_0x18405e:
	writetext UnknownText_0x184275
	waitbutton
	closetext
	end

YoungsterScript_0x184064:
	faceplayer
	opentext
	writetext UnknownText_0x1842a9
	waitbutton
	closetext
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iffalse UnknownScript_0x184072
	end

UnknownScript_0x184072:
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	spriteface CERULEANCITY_YOUNGSTER, LEFT
	opentext
	writetext UnknownText_0x1842ee
	waitbutton
	closetext
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

CeruleanCityHiddenBerserkGene:
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
	warp_def $f, $7, 1, CERULEAN_GYM_BADGE_SPEECH_HOUSE
	warp_def $11, $1c, 1, CERULEAN_POLICE_STATION
	warp_def $13, $d, 1, CERULEAN_TRADE_SPEECH_HOUSE
	warp_def $15, $13, 1, CERULEAN_POKECENTER_1F
	warp_def $17, $1e, 1, CERULEAN_GYM
	warp_def $1d, $19, 2, CERULEAN_MART

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
	signpost 12, 2, SIGNPOST_ITEM, CeruleanCityHiddenBerserkGene

.PersonEvents:
	db 6
	person_event SPRITE_COOLTRAINER_M, 23, 15, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x184009, -1
	person_event SPRITE_SUPER_NERD, 15, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x18401d, -1
	person_event SPRITE_SLOWPOKE, 24, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	person_event SPRITE_COOLTRAINER_F, 24, 21, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x18402a, -1
	person_event SPRITE_FISHER, 26, 30, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, FisherScript_0x18404a, -1
	person_event SPRITE_YOUNGSTER, 12, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x184064, -1
