const_value set 2
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK2
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_ROCK4
	const CIANWOODCITY_ROCK5
	const CIANWOODCITY_ROCK6
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE

CianwoodCity_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPointAndSuicune

.Trigger0:
	end

.Trigger1:
	end

.FlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_FOUGHT_EUSINE
	iffalse UnknownScript_0x1a001d
	disappear CIANWOODCITY_EUSINE
UnknownScript_0x1a001d:
	return

UnknownScript_0x1a001e:
	spriteface PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, MovementData_0x1a00da
	spriteface PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, MovementData_0x1a00e0
	disappear CIANWOODCITY_SUICUNE
	pause 10
	dotrigger $0
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	domaptrigger ROUTE_42, $1
	checkevent EVENT_FOUGHT_EUSINE
	iftrue .Done
	setevent EVENT_FOUGHT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, MovementData_0x1a00e7
	opentext
	writetext UnknownText_0x1a0433
	waitbutton
	closetext
	winlosstext UnknownText_0x1a05a1, 0
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext UnknownText_0x1a05c3
	waitbutton
	closetext
	applymovement CIANWOODCITY_EUSINE, MovementData_0x1a00ec
	disappear CIANWOODCITY_EUSINE
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
.Done:
	end

PokefanFScript_0x1a0084:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue UnknownScript_0x1a00ad
	writetext UnknownText_0x1a00f1
	buttonsound
	checkevent EVENT_BEAT_CHUCK
	iftrue UnknownScript_0x1a009c
	writetext UnknownText_0x1a0163
	waitbutton
	closetext
	end

UnknownScript_0x1a009c:
	writetext UnknownText_0x1a01e3
	buttonsound
	verbosegiveitem HM_FLY
	iffalse UnknownScript_0x1a00b1
	setevent EVENT_GOT_HM02_FLY
	writetext UnknownText_0x1a021d
	buttonsound
UnknownScript_0x1a00ad:
	writetext UnknownText_0x1a0277
	waitbutton
UnknownScript_0x1a00b1:
	closetext
	end

StandingYoungsterScript_0x1a00b3:
	jumptextfaceplayer UnknownText_0x1a02df

PokefanMScript_0x1a00b6:
	jumptextfaceplayer UnknownText_0x1a0319

LassScript_0x1a00b9:
	jumptextfaceplayer UnknownText_0x1a0394

UnknownScript_0x1a00bc:
	jumptextfaceplayer UnknownText_0x1a03cc

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokeCenterSign:
	jumpstd pokecentersign

CianwoodCityRock:
	jumpstd smashrock

CianwoodCityHiddenRevive:
	dwb EVENT_CIANWOOD_CITY_HIDDEN_REVIVE, REVIVE

CianwoodCityHiddenMaxEther:
	dwb EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER, MAX_ETHER

MovementData_0x1a00da:
	db $39 ; movement
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	db $38 ; movement
	step_end

MovementData_0x1a00e0:
	db $39 ; movement
	fast_jump_step RIGHT
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	db $38 ; movement
	step_end

MovementData_0x1a00e7:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a00ec:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

UnknownText_0x1a00f1:
	text "You crossed the"
	line "sea to get here?"

	para "That must have"
	line "been hard."

	para "It would be much"
	line "easier if your"

	para "#MON knew how"
	line "to FLY…"
	done

UnknownText_0x1a0163:
	text "But you can't use"
	line "FLY without this"
	cont "city's GYM BADGE."

	para "If you beat the"
	line "GYM LEADER here,"
	cont "come see me."

	para "I'll have a nice"
	line "gift for you."
	done

UnknownText_0x1a01e3:
	text "That's CIANWOOD's"
	line "GYM BADGE!"

	para "Then you should"
	line "take this HM."
	done

UnknownText_0x1a021d:
	text "Teach FLY to your"
	line "#MON."

	para "You will be able"
	line "to FLY instantly"

	para "to anywhere you "
	line "have visited."
	done

UnknownText_0x1a0277:
	text "My husband lost to"
	line "you, so he needs"
	cont "to train harder."

	para "That's good, since"
	line "he was getting a"
	cont "little chubby."
	done

UnknownText_0x1a02df:
	text "If you use FLY,"
	line "you can get back"

	para "to OLIVINE in-"
	line "stantly."
	done

UnknownText_0x1a0319:
	text "Boulders to the"
	line "north of town can"
	cont "be crushed."

	para "They may be hiding"
	line "something."

	para "Your #MON could"
	line "use ROCK SMASH to"
	cont "break them."
	done

UnknownText_0x1a0394:
	text "CHUCK, the GYM"
	line "LEADER, spars with"

	para "his fighting #-"
	line "MON."
	done

; possibly unused
UnknownText_0x1a03cc:
	text "There are several"
	line "islands between"
	cont "here and OLIVINE."

	para "A mythical sea"
	line "creature supposed-"
	cont "ly lives there."
	done

UnknownText_0x1a0433:
	text "EUSINE: Yo,"
	line "<PLAYER>."

	para "Wasn't that"
	line "SUICUNE just now?"

	para "I only caught a"
	line "quick glimpse, but"

	para "I thought I saw"
	line "SUICUNE running on"
	cont "the waves."

	para "SUICUNE is beau-"
	line "tiful and grand."

	para "And it races"
	line "through towns and"

	para "roads at simply"
	line "awesome speeds."

	para "It's wonderful…"

	para "I want to see"
	line "SUICUNE up close…"

	para "I've decided."

	para "I'll battle you as"
	line "a trainer to earn"
	cont "SUICUNE's respect!"

	para "Come on, <PLAYER>."
	line "Let's battle now!"
	done

UnknownText_0x1a05a1:
	text "I hate to admit"
	line "it, but you win."
	done

UnknownText_0x1a05c3:
	text "You're amazing,"
	line "<PLAYER>!"

	para "No wonder #MON"
	line "gravitate to you."

	para "I get it now."

	para "I'm going to keep"
	line "searching for"
	cont "SUICUNE."

	para "I'm sure we'll see"
	line "each other again."

	para "See you around!"
	done

CianwoodCitySignText:
	text "CIANWOOD CITY"

	para "A Port Surrounded"
	line "by Rough Seas"
	done

CianwoodGymSignText:
	text "CIANWOOD CITY"
	line "#MON GYM"

	para "LEADER: CHUCK"

	para "His Roaring Fists"
	line "Do the Talking"
	done

CianwoodPharmacySignText:
	text "500 Years of"
	line "Tradition"

	para "CIANWOOD CITY"
	line "PHARMACY"

	para "We Await Your"
	line "Medicinal Queries"
	done

CianwoodPhotoStudioSignText:
	text "CIANWOOD CITY"
	line "PHOTO STUDIO"

	para "Take a Snapshot as"
	line "a Keepsake!"
	done

CianwoodPokeSeerSignText:
	text "THE # SEER"
	line "AHEAD"
	done

CianwoodCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 7
	warp_def $29, $11, 1, MANIAS_HOUSE
	warp_def $2b, $8, 1, CIANWOOD_GYM
	warp_def $2b, $17, 1, CIANWOOD_POKECENTER_1F
	warp_def $2f, $f, 1, CIANWOOD_PHARMACY
	warp_def $1f, $9, 1, CIANWOOD_CITY_PHOTO_STUDIO
	warp_def $25, $f, 1, CIANWOOD_LUGIA_SPEECH_HOUSE
	warp_def $11, $5, 1, POKE_SEERS_HOUSE

.XYTriggers:
	db 1
	xy_trigger 1, $10, $b, $0, UnknownScript_0x1a001e, $0, $0

.Signposts:
	db 8
	signpost 34, 20, SIGNPOST_READ, CianwoodCitySign
	signpost 45, 7, SIGNPOST_READ, CianwoodGymSign
	signpost 43, 24, SIGNPOST_READ, CianwoodPokeCenterSign
	signpost 47, 19, SIGNPOST_READ, CianwoodPharmacySign
	signpost 32, 8, SIGNPOST_READ, CianwoodPhotoStudioSign
	signpost 24, 8, SIGNPOST_READ, CianwoodPokeSeerSign
	signpost 19, 4, SIGNPOST_ITEM, CianwoodCityHiddenRevive
	signpost 29, 5, SIGNPOST_ITEM, CianwoodCityHiddenMaxEther

.PersonEvents:
	db 12
	person_event SPRITE_STANDING_YOUNGSTER, 37, 21, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, StandingYoungsterScript_0x1a00b3, -1
	person_event SPRITE_POKEFAN_M, 33, 17, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x1a00b6, -1
	person_event SPRITE_LASS, 42, 14, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x1a00b9, -1
	person_event SPRITE_ROCK, 16, 8, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CianwoodCityRock, -1
	person_event SPRITE_ROCK, 17, 9, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CianwoodCityRock, -1
	person_event SPRITE_ROCK, 25, 4, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CianwoodCityRock, -1
	person_event SPRITE_ROCK, 29, 5, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CianwoodCityRock, -1
	person_event SPRITE_ROCK, 27, 10, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CianwoodCityRock, -1
	person_event SPRITE_ROCK, 19, 4, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CianwoodCityRock, -1
	person_event SPRITE_POKEFAN_F, 46, 10, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanFScript_0x1a0084, -1
	person_event SPRITE_SUPER_NERD, 21, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	person_event SPRITE_SUICUNE, 14, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
