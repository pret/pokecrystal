VermilionCity_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks
	dbw 5, .FlyPoint

.FlyPoint
	setflag ENGINE_FLYPOINT_VERMILION
	return

TeacherScript_0x1aa983:
	jumptextfaceplayer UnknownText_0x1aaa15

GrampsScript_0x1aa986:
	jumptextfaceplayer UnknownText_0x1aaa6f

VermilionMachop:
	loadfont
	writetext UnknownText_0x1aaaca
	cry MACHOP
	closetext
	loadmovesprites
	earthquake 30
	loadfont
	writetext UnknownText_0x1aaae2
	closetext
	loadmovesprites
	end

SuperNerdScript_0x1aa99b:
	jumptextfaceplayer UnknownText_0x1aab1a

VermilionSnorlax:
	loadfont
	special SpecialSnorlaxAwake
	iftrue UnknownScript_0x1aa9ab
	writetext UnknownText_0x1aab64
	closetext
	loadmovesprites
	end

UnknownScript_0x1aa9ab:
	writetext UnknownText_0x1aab84
	pause 15
	cry SNORLAX
	loadmovesprites
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadpokedata SNORLAX, 50
	startbattle
	disappear $6
	setevent EVENT_FOUGHT_SNORLAX
	returnafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	loadfont
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	checkcode VAR_BADGES
	if_equal 16, .AllBadges
	if_greater_than 13, .MostBadges
	if_greater_than 9, .SomeBadges
	writetext UnknownText_0x1aabc8
	closetext
	loadmovesprites
	end

.SomeBadges
	writetext UnknownText_0x1aac2b
	closetext
	loadmovesprites
	end

.MostBadges
	writetext UnknownText_0x1aac88
	closetext
	loadmovesprites
	end

.AllBadges
	writetext UnknownText_0x1aacf3
	keeptextopen
	verbosegiveitem HP_UP, 1
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem
	writetext UnknownText_0x1aad4a
	closetext
.Done
	loadmovesprites
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

MapVermilionCitySignpostItem7:
	dw $00fc
	db FULL_HEAL

UnknownText_0x1aaa15:
	text "VERMILION PORT is"
	line "KANTO's seaside"
	cont "gateway."

	para "Luxury liners from"
	line "around the world"
	cont "dock here."
	done

UnknownText_0x1aaa6f:
	text "My #MON is"
	line "preparing the land"
	cont "for construction."

	para "But I have no"
	line "money to start the"
	cont "project…"
	done

UnknownText_0x1aaaca:
	text "MACHOP: Guooh"
	line "gogogoh!"
	done

UnknownText_0x1aaae2:
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

	; warps
	db 10
	warp_def $5, $5, 1, GROUP_VERMILION_HOUSE_FISHING_SPEECH_HOUSE, MAP_VERMILION_HOUSE_FISHING_SPEECH_HOUSE
	warp_def $5, $9, 1, GROUP_VERMILION_POKECENTER_1F, MAP_VERMILION_POKECENTER_1F
	warp_def $d, $7, 1, GROUP_POKEMON_FAN_CLUB, MAP_POKEMON_FAN_CLUB
	warp_def $d, $d, 1, GROUP_VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, MAP_VERMILION_MAGNET_TRAIN_SPEECH_HOUSE
	warp_def $d, $15, 2, GROUP_VERMILION_MART, MAP_VERMILION_MART
	warp_def $11, $15, 1, GROUP_VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE, MAP_VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE
	warp_def $13, $a, 1, GROUP_VERMILION_GYM, MAP_VERMILION_GYM
	warp_def $1f, $13, 1, GROUP_VERMILION_PORT_PASSAGE, MAP_VERMILION_PORT_PASSAGE
	warp_def $1f, $14, 2, GROUP_VERMILION_PORT_PASSAGE, MAP_VERMILION_PORT_PASSAGE
	warp_def $7, $22, 1, GROUP_DIGLETTS_CAVE, MAP_DIGLETTS_CAVE

	; xy triggers
	db 0

	; signposts
	db 8
	signpost 3, 25, $0, VermilionCitySign
	signpost 19, 5, $0, VermilionGymSign
	signpost 13, 5, $0, PokemonFanClubSign
	signpost 9, 33, $0, VermilionCityDiglettsCaveSign
	signpost 15, 27, $0, VermilionCityPortSign
	signpost 5, 10, $0, VermilionCityPokeCenterSign
	signpost 13, 22, $0, VermilionCityMartSign
	signpost 19, 12, $7, MapVermilionCitySignpostItem7

	; people-events
	db 6
	person_event SPRITE_TEACHER, 13, 22, $2, $11, 255, 255, $0, 0, TeacherScript_0x1aa983, EVENT_ALWAYS_THERE
	person_event SPRITE_GRAMPS, 10, 27, $9, $0, 255, 255, $0, 0, GrampsScript_0x1aa986, EVENT_ALWAYS_THERE
	person_event SPRITE_MACHOP, 11, 30, $16, $0, 255, 255, $90, 0, VermilionMachop, EVENT_ALWAYS_THERE
	person_event SPRITE_SUPER_NERD, 20, 18, $2, $11, 255, 255, $a0, 0, SuperNerdScript_0x1aa99b, EVENT_ALWAYS_THERE
	person_event SPRITE_BIG_SNORLAX, 12, 38, $15, $0, 255, 255, $0, 0, VermilionSnorlax, EVENT_770
	person_event SPRITE_POKEFAN_M, 16, 35, $6, $0, 255, 255, $80, 0, VermilionGymBadgeGuy, EVENT_ALWAYS_THERE
