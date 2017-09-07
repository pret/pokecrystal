const_value set 2
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M

VermilionCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	return

TeacherScript_0x1aa983:
	jumptextfaceplayer UnknownText_0x1aaa15

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

SuperNerdScript_0x1aa99b:
	jumptextfaceplayer UnknownText_0x1aab1a

VermilionSnorlax:
	opentext
	special SpecialSnorlaxAwake
	iftrue UnknownScript_0x1aa9ab
	writetext UnknownText_0x1aab64
	waitbutton
	closetext
	end

UnknownScript_0x1aa9ab:
	writetext UnknownText_0x1aab84
	pause 15
	cry SNORLAX
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	checkcode VAR_BADGES
	if_equal 16, .AllBadges
	if_greater_than 13, .MostBadges
	if_greater_than 9, .SomeBadges
	writetext UnknownText_0x1aabc8
	waitbutton
	closetext
	end

.SomeBadges:
	writetext UnknownText_0x1aac2b
	waitbutton
	closetext
	end

.MostBadges:
	writetext UnknownText_0x1aac88
	waitbutton
	closetext
	end

.AllBadges:
	writetext UnknownText_0x1aacf3
	buttonsound
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext UnknownText_0x1aad4a
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokeCenterSign:
	jumpstd pokecentersign

VermilionCityMartSign:
	jumpstd martsign

VermilionCityHiddenFullHeal:
	dwb EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL, FULL_HEAL

UnknownText_0x1aaa15:
	text "VERMILION PORT is"
	line "KANTO's seaside"
	cont "gateway."

	para "Luxury liners from"
	line "around the world"
	cont "dock here."
	done

VermilionMachopOwnerText:
	text "My #MON is"
	line "preparing the land"
	cont "for construction."

	para "But I have no"
	line "money to start the"
	cont "project…"
	done

VermilionMachopText1:
	text "MACHOP: Guooh"
	line "gogogoh!"
	done

VermilionMachopText2:
	text "A MACHOP is growl-"
	line "ing while stomping"
	cont "the ground flat."
	done

UnknownText_0x1aab1a:
	text "There are eight"
	line "GYMS in KANTO."

	para "That big building"
	line "is VERMILION's"
	cont "#MON GYM."
	done

UnknownText_0x1aab64:
	text "SNORLAX is snoring"
	line "peacefully…"
	done

UnknownText_0x1aab84:
	text "The #GEAR was"
	line "placed near the"
	cont "sleeping SNORLAX…"

	para "…"

	para "SNORLAX woke up!"
	done

UnknownText_0x1aabc8:
	text "Skilled trainers"
	line "gather in KANTO."

	para "GYM LEADERS are"
	line "especially strong."

	para "They won't be easy"
	line "to defeat."
	done

UnknownText_0x1aac2b:
	text "You've started to"
	line "collect KANTO GYM"
	cont "BADGES?"

	para "Don't you agree"
	line "that the trainers"
	cont "here are tough?"
	done

UnknownText_0x1aac88:
	text "I guess you'll be"
	line "finished with your"

	para "conquest of KANTO"
	line "GYMS soon."

	para "Let me know if"
	line "you get all eight"
	cont "BADGES."
	done

UnknownText_0x1aacf3:
	text "Congratulations!"

	para "You got all the"
	line "KANTO GYM BADGES."

	para "I've got a reward"
	line "for your efforts."
	done

UnknownText_0x1aad4a:
	text "Having a variety"
	line "of #MON types"

	para "should give you an"
	line "edge in battle."

	para "I'm sure the KANTO"
	line "GYM BADGES will"
	cont "help you."
	done

VermilionCitySignText:
	text "VERMILION CITY"

	para "The Port of"
	line "Exquisite Sunsets"
	done

VermilionGymSignText:
	text "VERMILION CITY"
	line "#MON GYM"
	cont "LEADER: LT.SURGE"

	para "The Lightning"
	line "American"
	done

PokemonFanClubSignText:
	text "#MON FAN CLUB"

	para "All #MON Fans"
	line "Welcome!"
	done

VermilionCityDiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

VermilionCityPortSignText:
	text "VERMILION PORT"
	line "ENTRANCE"
	done

VermilionCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 10
	warp_def $5, $5, 1, VERMILION_HOUSE_FISHING_SPEECH_HOUSE
	warp_def $5, $9, 1, VERMILION_POKECENTER_1F
	warp_def $d, $7, 1, POKEMON_FAN_CLUB
	warp_def $d, $d, 1, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE
	warp_def $d, $15, 2, VERMILION_MART
	warp_def $11, $15, 1, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE
	warp_def $13, $a, 1, VERMILION_GYM
	warp_def $1f, $13, 1, VERMILION_PORT_PASSAGE
	warp_def $1f, $14, 2, VERMILION_PORT_PASSAGE
	warp_def $7, $22, 1, DIGLETTS_CAVE

.XYTriggers:
	db 0

.Signposts:
	db 8
	signpost 3, 25, SIGNPOST_READ, VermilionCitySign
	signpost 19, 5, SIGNPOST_READ, VermilionGymSign
	signpost 13, 5, SIGNPOST_READ, PokemonFanClubSign
	signpost 9, 33, SIGNPOST_READ, VermilionCityDiglettsCaveSign
	signpost 15, 27, SIGNPOST_READ, VermilionCityPortSign
	signpost 5, 10, SIGNPOST_READ, VermilionCityPokeCenterSign
	signpost 13, 22, SIGNPOST_READ, VermilionCityMartSign
	signpost 19, 12, SIGNPOST_ITEM, VermilionCityHiddenFullHeal

.PersonEvents:
	db 6
	person_event SPRITE_TEACHER, 9, 18, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1aa983, -1
	person_event SPRITE_GRAMPS, 6, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	person_event SPRITE_MACHOP, 7, 26, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, VermilionMachop, -1
	person_event SPRITE_SUPER_NERD, 16, 14, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SuperNerdScript_0x1aa99b, -1
	person_event SPRITE_BIG_SNORLAX, 8, 34, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	person_event SPRITE_POKEFAN_M, 12, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
