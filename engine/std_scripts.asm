StdScripts::
	dbw BANK(PokeCenterNurseScript), PokeCenterNurseScript
	dbw BANK(DifficultBookshelfScript), DifficultBookshelfScript
	dbw BANK(PictureBookshelfScript), PictureBookshelfScript
	dbw BANK(MagazineBookshelfScript), MagazineBookshelfScript
	dbw BANK(TeamRocketOathScript), TeamRocketOathScript
	dbw BANK(IncenseBurnerScript), IncenseBurnerScript
	dbw BANK(MerchandiseShelfScript), MerchandiseShelfScript
	dbw BANK(TownMapScript), TownMapScript
	dbw BANK(WindowScript), WindowScript
	dbw BANK(TVScript), TVScript
	dbw BANK(HomepageScript), HomepageScript
	dbw BANK(Radio1Script), Radio1Script
	dbw BANK(Radio2Script), Radio2Script
	dbw BANK(TrashCanScript), TrashCanScript
	dbw BANK(StrengthBoulderScript), StrengthBoulderScript
	dbw BANK(SmashRockScript), SmashRockScript
	dbw BANK(PokeCenterSignScript), PokeCenterSignScript
	dbw BANK(MartSignScript), MartSignScript
	dbw BANK(GoldenrodRocketsScript), GoldenrodRocketsScript
	dbw BANK(RadioTowerRocketsScript), RadioTowerRocketsScript
	dbw BANK(ElevatorButtonScript), ElevatorButtonScript
	dbw BANK(DayToTextScript), DayToTextScript
	dbw BANK(BugContestResultsWarpScript), BugContestResultsWarpScript
	dbw BANK(BugContestResultsScript), BugContestResultsScript
	dbw BANK(InitializeEventsScript), InitializeEventsScript
	dbw BANK(AskNumber1MScript), AskNumber1MScript
	dbw BANK(AskNumber2MScript), AskNumber2MScript
	dbw BANK(RegisteredNumberMScript), RegisteredNumberMScript
	dbw BANK(NumberAcceptedMScript), NumberAcceptedMScript
	dbw BANK(NumberDeclinedMScript), NumberDeclinedMScript
	dbw BANK(PhoneFullMScript), PhoneFullMScript
	dbw BANK(RematchMScript), RematchMScript
	dbw BANK(GiftMScript), GiftMScript
	dbw BANK(PackFullMScript), PackFullMScript
	dbw BANK(RematchGiftMScript), RematchGiftMScript
	dbw BANK(AskNumber1FScript), AskNumber1FScript
	dbw BANK(AskNumber2FScript), AskNumber2FScript
	dbw BANK(RegisteredNumberFScript), RegisteredNumberFScript
	dbw BANK(NumberAcceptedFScript), NumberAcceptedFScript
	dbw BANK(NumberDeclinedFScript), NumberDeclinedFScript
	dbw BANK(PhoneFullFScript), PhoneFullFScript
	dbw BANK(RematchFScript), RematchFScript
	dbw BANK(GiftFScript), GiftFScript
	dbw BANK(PackFullFScript), PackFullFScript
	dbw BANK(RematchGiftFScript), RematchGiftFScript
	dbw BANK(GymStatue1Script), GymStatue1Script
	dbw BANK(GymStatue2Script), GymStatue2Script
	dbw BANK(ReceiveItemScript), ReceiveItemScript
	dbw BANK(ReceiveTogepiEggScript), ReceiveTogepiEggScript
	dbw BANK(PCScript), PCScript
	dbw BANK(GameCornerCoinVendorScript), GameCornerCoinVendorScript
	dbw BANK(HappinessCheckScript), HappinessCheckScript

PokeCenterNurseScript:
; EVENT_WELCOMED_TO_POKECOM_CENTER is never set

	loadfont
	checkmorn
	iftrue .morn
	checkday
	iftrue .day
	checknite
	iftrue .nite
	jump .ok

.morn
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .morn_comcenter
	farwritetext UnknownText_0x1b0000
	keeptextopen
	jump .ok
.morn_comcenter
	farwritetext UnknownText_0x1b008a
	keeptextopen
	jump .ok

.day
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .day_comcenter
	farwritetext UnknownText_0x1b002b
	keeptextopen
	jump .ok
.day_comcenter
	farwritetext UnknownText_0x1b00d6
	keeptextopen
	jump .ok

.nite
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .nite_comcenter
	farwritetext UnknownText_0x1b004f
	keeptextopen
	jump .ok
.nite_comcenter
	farwritetext UnknownText_0x1b011b
	keeptextopen
	jump .ok

.ok
	; only do this once
	clearevent EVENT_WELCOMED_TO_POKECOM_CENTER

	farwritetext UnknownText_0x1b017a
	yesorno
	iffalse .done

	farwritetext UnknownText_0x1b01bd
	pause 20
	special Mobile_HealParty
	spriteface $fe, LEFT
	pause 10
	special HealParty
	playmusic MUSIC_NONE
	writebyte 0 ; Machine is at a Pokemon Center
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	spriteface $fe, DOWN
	pause 10

	checkphonecall ; elm already called about pokerus
	iftrue .no
	checkflag ENGINE_POKERUS ; nurse already talked about pokerus
	iftrue .no
	special SpecialCheckPokerus
	iftrue .pokerus
.no

	farwritetext UnknownText_0x1b01d7
	pause 20

.done
	farwritetext UnknownText_0x1b020b

	spriteface $fe, UP
	pause 10
	spriteface $fe, DOWN
	pause 10

	closetext
	loadmovesprites
	end

.pokerus
	; already cleared earlier in the script
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .pokerus_comcenter

	farwritetext UnknownText_0x1b0241
	closetext
	loadmovesprites
	jump .pokerus_done

.pokerus_comcenter
	farwritetext UnknownText_0x1b02d6
	closetext
	loadmovesprites

.pokerus_done
	setflag ENGINE_POKERUS
	specialphonecall ELMCALL_POKERUS
	end

DifficultBookshelfScript:
	farjumptext DifficultBookshelfText

PictureBookshelfScript:
	farjumptext PictureBookshelfText

MagazineBookshelfScript:
	farjumptext MagazineBookshelfText

TeamRocketOathScript:
	farjumptext TeamRocketOathText

IncenseBurnerScript:
	farjumptext IncenseBurnerText

MerchandiseShelfScript:
	farjumptext MerchandiseShelfText

TownMapScript:
	loadfont
	farwritetext TownMapText
	closetext
	special Special_TownMap
	loadmovesprites
	end

WindowScript:
	farjumptext WindowText

TVScript:
	loadfont
	farwritetext TVText
	closetext
	loadmovesprites
	end

HomepageScript:
	farjumptext HomepageText

Radio1Script:
	loadfont
	writebyte $0
	special MapRadio
	loadmovesprites
	end

Radio2Script:
; Lucky Channel
	loadfont
	writebyte $4
	special MapRadio
	loadmovesprites
	end

TrashCanScript: ; 0xbc1a5
	farjumptext TrashCanText

PCScript:
	loadfont
	special PokemonCenterPC
	loadmovesprites
	end

ElevatorButtonScript:
	playsound SFX_READ_TEXT_2
	pause 15
	playsound SFX_ELEVATOR_END
	end

StrengthBoulderScript:
	farjump AskStrengthScript

SmashRockScript:
	farjump AskRockSmashScript

PokeCenterSignScript:
	farjumptext PokeCenterSignText

MartSignScript
	farjumptext MartSignText

DayToTextScript:
	checkcode VAR_WEEKDAY
	if_equal MONDAY, .Monday
	if_equal TUESDAY, .Tuesday
	if_equal WEDNESDAY, .Wednesday
	if_equal THURSDAY, .Thursday
	if_equal FRIDAY, .Friday
	if_equal SATURDAY, .Saturday
	stringtotext .SundayText, 0
	end
.Monday
	stringtotext .MondayText, 0
	end
.Tuesday
	stringtotext .TuesdayText, 0
	end
.Wednesday
	stringtotext .WednesdayText, 0
	end
.Thursday
	stringtotext .ThursdayText, 0
	end
.Friday
	stringtotext .FridayText, 0
	end
.Saturday
	stringtotext .SaturdayText, 0
	end
.SundayText
	db "SUNDAY@"
.MondayText
	db "MONDAY@"
.TuesdayText
	db "TUESDAY@"
.WednesdayText
	db "WEDNESDAY@"
.ThursdayText
	db "THURSDAY@"
.FridayText
	db "FRIDAY@"
.SaturdayText
	db "SATURDAY@"

GoldenrodRocketsScript:
	clearevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	end

RadioTowerRocketsScript:
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_CIVILIANS
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	specialphonecall ELMCALL_WEIRDBROADCAST
	domaptrigger GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN, $1
	end

BugContestResultsWarpScript:
	special WhiteBGMap
	scall BugContestResults_CopyContestantsToResults
	setevent EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	clearevent EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
	setevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	warp GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE, $0, $4
	applymovement $0, Movement_ContestResults_WalkAfterWarp

BugContestResultsScript:
	clearflag ENGINE_BUG_CONTEST_TIMER
	clearevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	loadfont
	farwritetext ContestResults_ReadyToJudgeText
	closetext
	special BugContestJudging
	RAM2MEM $0
	if_equal 1, BugContestResults_FirstPlace
	if_equal 2, BugContestResults_SecondPlace
	if_equal 3, BugContestResults_ThirdPlace
	farwritetext ContestResults_ConsolationPrizeText
	keeptextopen
	waitbutton
	verbosegiveitem BERRY, 1
	iffalse BugContestResults_NoRoomForBerry

BugContestResults_DidNotWin
	farwritetext ContestResults_DidNotWinText
	keeptextopen
	jump BugContestResults_FinishUp
; 0xbc2b1

BugContestResults_ReturnAfterWinnersPrize ; 0xbc2b1
	farwritetext ContestResults_JoinUsNextTimeText
	keeptextopen

BugContestResults_FinishUp
	checkevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	iffalse BugContestResults_DidNotLeaveMons
	farwritetext ContestResults_ReturnPartyText
	closetext
	special ContestReturnMons
BugContestResults_DidNotLeaveMons
	special CheckPartyFullAfterContest
	if_equal $0, BugContestResults_CleanUp
	if_equal $2, BugContestResults_CleanUp
	farwritetext ContestResults_PartyFullText
	closetext
BugContestResults_CleanUp
	loadmovesprites
	dotrigger $0
	domaptrigger GROUP_ROUTE_35_NATIONAL_PARK_GATE, MAP_ROUTE_35_NATIONAL_PARK_GATE, $0
	setevent EVENT_BUG_CATCHING_CONTESTANT_1A
	setevent EVENT_BUG_CATCHING_CONTESTANT_2A
	setevent EVENT_BUG_CATCHING_CONTESTANT_3A
	setevent EVENT_BUG_CATCHING_CONTESTANT_4A
	setevent EVENT_BUG_CATCHING_CONTESTANT_5A
	setevent EVENT_BUG_CATCHING_CONTESTANT_6A
	setevent EVENT_BUG_CATCHING_CONTESTANT_7A
	setevent EVENT_BUG_CATCHING_CONTESTANT_8A
	setevent EVENT_BUG_CATCHING_CONTESTANT_9A
	setevent EVENT_BUG_CATCHING_CONTESTANT_10A
	setevent EVENT_BUG_CATCHING_CONTESTANT_1B
	setevent EVENT_BUG_CATCHING_CONTESTANT_2B
	setevent EVENT_BUG_CATCHING_CONTESTANT_3B
	setevent EVENT_BUG_CATCHING_CONTESTANT_4B
	setevent EVENT_BUG_CATCHING_CONTESTANT_5B
	setevent EVENT_BUG_CATCHING_CONTESTANT_6B
	setevent EVENT_BUG_CATCHING_CONTESTANT_7B
	setevent EVENT_BUG_CATCHING_CONTESTANT_8B
	setevent EVENT_BUG_CATCHING_CONTESTANT_9B
	setevent EVENT_BUG_CATCHING_CONTESTANT_10B
	setflag ENGINE_DAILY_BUG_CONTEST
	special PlayMapMusic
	end
; 0xbc31e

BugContestResults_FirstPlace ; 0xbc31e
	setevent EVENT_GAVE_KURT_APRICORNS
	itemtotext SUN_STONE, $1
	farwritetext ContestResults_PlayerWonAPrizeText
	closetext
	verbosegiveitem SUN_STONE, 1
	iffalse BugContestResults_NoRoomForSunStone
	jump BugContestResults_ReturnAfterWinnersPrize
; 0xbc332

BugContestResults_SecondPlace ; 0xbc332
	itemtotext EVERSTONE, $1
	farwritetext ContestResults_PlayerWonAPrizeText
	closetext
	verbosegiveitem EVERSTONE, 1
	iffalse BugContestResults_NoRoomForEverstone
	jump BugContestResults_ReturnAfterWinnersPrize
; 0xbc343

BugContestResults_ThirdPlace ; 0xbc343
	itemtotext GOLD_BERRY, $1
	farwritetext ContestResults_PlayerWonAPrizeText
	closetext
	verbosegiveitem GOLD_BERRY, 1
	iffalse BugContestResults_NoRoomForGoldBerry
	jump BugContestResults_ReturnAfterWinnersPrize
; 0xbc354

BugContestResults_NoRoomForSunStone ; 0xbc354
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	jump BugContestResults_ReturnAfterWinnersPrize
; 0xbc35f

BugContestResults_NoRoomForEverstone ; 0xbc35f
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	jump BugContestResults_ReturnAfterWinnersPrize
; 0xbc36a

BugContestResults_NoRoomForGoldBerry ; 0xbc36a
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	jump BugContestResults_ReturnAfterWinnersPrize
; 0xbc375

BugContestResults_NoRoomForBerry ; 0xbc375
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent EVENT_CONTEST_OFFICER_HAS_BERRY
	jump BugContestResults_DidNotWin
; 0xbc380

BugContestResults_CopyContestantsToResults ; 0xbc380
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .skip1
	clearevent EVENT_BUG_CATCHING_CONTESTANT_1B
.skip1
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .skip2
	clearevent EVENT_BUG_CATCHING_CONTESTANT_2B
.skip2
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .skip3
	clearevent EVENT_BUG_CATCHING_CONTESTANT_3B
.skip3
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .skip4
	clearevent EVENT_BUG_CATCHING_CONTESTANT_4B
.skip4
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .skip5
	clearevent EVENT_BUG_CATCHING_CONTESTANT_5B
.skip5
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .skip6
	clearevent EVENT_BUG_CATCHING_CONTESTANT_6B
.skip6
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .skip7
	clearevent EVENT_BUG_CATCHING_CONTESTANT_7B
.skip7
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .skip8
	clearevent EVENT_BUG_CATCHING_CONTESTANT_8B
.skip8
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .skip9
	clearevent EVENT_BUG_CATCHING_CONTESTANT_9B
.skip9
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .skip10
	clearevent EVENT_BUG_CATCHING_CONTESTANT_10B
.skip10
	end

InitializeEventsScript:
	setevent EVENT_EARLS_ACADEMY_EARL
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	setevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_GRUNT_WITH_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_EXECUTIVE
	setevent EVENT_TEAM_ROCKET_BASE_B2F_DRAGONITE
	setevent EVENT_RIVAL_TEAM_ROCKET_BASE
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setevent EVENT_RIVAL_AZALEA_TOWN
	setevent EVENT_RIVAL_UNDERGROUND_PATH
	setevent EVENT_AZALEA_TOWN_SLOWPOKES
	setevent EVENT_KURTS_HOUSE_SLOWPOKE
	setevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	setevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_COP_IN_ELMS_LAB
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	setevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	setevent EVENT_BOULDER_IN_ICE_PATH_1A
	setevent EVENT_BOULDER_IN_ICE_PATH_2A
	setevent EVENT_BOULDER_IN_ICE_PATH_3A
	setevent EVENT_BOULDER_IN_ICE_PATH_4A
	setevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_BUG_CATCHING_CONTESTANT_1A
	setevent EVENT_BUG_CATCHING_CONTESTANT_2A
	setevent EVENT_BUG_CATCHING_CONTESTANT_3A
	setevent EVENT_BUG_CATCHING_CONTESTANT_4A
	setevent EVENT_BUG_CATCHING_CONTESTANT_5A
	setevent EVENT_BUG_CATCHING_CONTESTANT_6A
	setevent EVENT_BUG_CATCHING_CONTESTANT_7A
	setevent EVENT_BUG_CATCHING_CONTESTANT_8A
	setevent EVENT_BUG_CATCHING_CONTESTANT_9A
	setevent EVENT_BUG_CATCHING_CONTESTANT_10A
	setevent EVENT_BUG_CATCHING_CONTESTANT_1B
	setevent EVENT_BUG_CATCHING_CONTESTANT_2B
	setevent EVENT_BUG_CATCHING_CONTESTANT_3B
	setevent EVENT_BUG_CATCHING_CONTESTANT_4B
	setevent EVENT_BUG_CATCHING_CONTESTANT_5B
	setevent EVENT_BUG_CATCHING_CONTESTANT_6B
	setevent EVENT_BUG_CATCHING_CONTESTANT_7B
	setevent EVENT_BUG_CATCHING_CONTESTANT_8B
	setevent EVENT_BUG_CATCHING_CONTESTANT_9B
	setevent EVENT_BUG_CATCHING_CONTESTANT_10B
	setevent EVENT_FAST_SHIP_1F_GENTLEMAN
	setevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	setevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	setevent EVENT_LAKE_OF_RAGE_CIVILIANS
	setevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_TIN_TOWER_ROOF_HO_OH
	setevent EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
	setevent EVENT_KRISS_HOUSE_2F_CONSOLE
	setevent EVENT_KRISS_HOUSE_2F_DOLL_1
	setevent EVENT_KRISS_HOUSE_2F_DOLL_2
	setevent EVENT_KRISS_HOUSE_2F_BIG_DOLL
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_PLANT_4
	setevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
	setevent EVENT_OLIVINE_GYM_JASMINE
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	setevent EVENT_MET_BILL
	setevent EVENT_ECRUTEAK_POKE_CENTER_BILL
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	setevent EVENT_LAKE_OF_RAGE_LANCE
	setevent EVENT_WAREHOUSE_LAYOUT_1
	setevent EVENT_WAREHOUSE_BLOCKED_OFF
	setevent EVENT_DRAGONS_DEN_CLAIR
	setevent EVENT_RIVAL_OLIVINE_CITY
	setevent EVENT_RIVAL_VICTORY_ROAD
	setevent EVENT_RIVAL_DRAGONS_DEN
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	setevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	setevent EVENT_BURNED_TOWER_B1F_BEASTS_1
	setevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	setevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	setevent EVENT_OLIVINE_PORT_PASSAGE_POKEFAN_M
	setevent EVENT_KURTS_HOUSE_KURT_2
	setevent EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_SUDOWOODO
	setevent EVENT_GOLDENROD_CITY_MOVE_TUTOR
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	setevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	setevent EVENT_DRAGON_SHRINE_CLAIR
	setevent EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
	setevent EVENT_KRISS_NEIGHBORS_HOUSE_NEIGHBOR
	setevent EVENT_AZALEA_TOWN_KURT
	setevent EVENT_AZALEA_TOWN_KURT
	setevent EVENT_ILEX_FOREST_KURT
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
	setevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_ECRUTEAK_CITY_GRAMPS
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	setevent EVENT_KRISS_HOUSE_MOM_2
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	setevent EVENT_CIANWOOD_CITY_EUSINE
	setevent EVENT_TIN_TOWER_1F_EUSINE
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	setflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setflag ENGINE_ROCKETS_IN_MAHOGANY
	variablesprite SPRITE_WEIRD_TREE, SPRITE_SUDOWOODO
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SILVER
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_ROCKET
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
	setevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setevent EVENT_CERULEAN_GYM_ROCKET
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setevent EVENT_COPYCATS_HOUSE_2F_DOLL
	setevent EVENT_VIRIDIAN_GYM_BLUE
	setevent EVENT_SEAFOAM_GYM_GYM_GUY
	setevent EVENT_MT_MOON_SQUARE_CLEFAIRY
	setevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	setevent EVENT_INITIALIZED_EVENTS
	return

AskNumber1MScript:
	special RandomPhoneMon
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack
	farwritetext JackAskNumber1Text
	end
.Huey
	farwritetext HueyAskNumber1Text
	end
.Gaven
	farwritetext GavenAskNumber1Text
	end
.Jose
	farwritetext JoseAskNumber1Text
	end
.Joey
	farwritetext JoeyAskNumber1Text
	end
.Wade
	farwritetext WadeAskNumber1Text
	end
.Ralph
	farwritetext RalphAskNumber1Text
	end
.Anthony
	farwritetext AnthonyAskNumber1Text
	end
.Todd
	farwritetext ToddAskNumber1Text
	end
.Irwin
	farwritetext IrwinAskNumber1Text
	end
.Arnie
	farwritetext ArnieAskNumber1Text
	end
.Alan
	farwritetext AlanAskNumber1Text
	end
.Chad
	farwritetext ChadAskNumber1Text
	end
.Derek
	farwritetext DerekAskNumber1Text
	end
.Tully
	farwritetext TullyAskNumber1Text
	end
.Brent
	farwritetext BrentAskNumber1Text
	end
.Vance
	farwritetext VanceAskNumber1Text
	end
.Wilton
	farwritetext WiltonAskNumber1Text
	end
.Kenji
	farwritetext KenjiAskNumber1Text
	end
.Parry
	farwritetext ParryAskNumber1Text
	end

AskNumber2MScript:
	special RandomPhoneMon
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack
	farwritetext JackAskNumber2Text
	end
.Huey
	farwritetext HueyAskNumber2Text
	end
.Gaven
	farwritetext GavenAskNumber2Text
	end
.Jose
	farwritetext JoseAskNumber2Text
	end
.Joey
	farwritetext JoeyAskNumber2Text
	end
.Wade
	farwritetext WadeAskNumber2Text
	end
.Ralph
	farwritetext RalphAskNumber2Text
	end
.Anthony
	farwritetext AnthonyAskNumber2Text
	end
.Todd
	farwritetext ToddAskNumber2Text
	end
.Irwin
	farwritetext IrwinAskNumber2Text
	end
.Arnie
	farwritetext ArnieAskNumber2Text
	end
.Alan
	farwritetext AlanAskNumber2Text
	end
.Chad
	farwritetext ChadAskNumber2Text
	end
.Derek
	farwritetext DerekAskNumber2Text
	end
.Tully
	farwritetext TullyAskNumber2Text
	end
.Brent
	farwritetext BrentAskNumber2Text
	end
.Vance
	farwritetext VanceAskNumber2Text
	end
.Wilton
	farwritetext WiltonAskNumber2Text
	end
.Kenji
	farwritetext KenjiAskNumber2Text
	end
.Parry
	farwritetext ParryAskNumber2Text
	end

RegisteredNumberMScript:
	farwritetext RegisteredNumber1Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitbutton
	keeptextopen
	end

NumberAcceptedMScript:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack
	farwritetext JackNumberAcceptedText
	closetext
	loadmovesprites
	end
.Huey
	farwritetext HueyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Gaven
	farwritetext GavenNumberAcceptedText
	closetext
	loadmovesprites
	end
.Jose
	farwritetext JoseNumberAcceptedText
	closetext
	loadmovesprites
	end
.Joey
	farwritetext JoeyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Wade
	farwritetext WadeNumberAcceptedText
	closetext
	loadmovesprites
	end
.Ralph
	farwritetext RalphNumberAcceptedText
	closetext
	loadmovesprites
	end
.Anthony
	farwritetext AnthonyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Todd
	farwritetext ToddNumberAcceptedText
	closetext
	loadmovesprites
	end
.Irwin
	farwritetext IrwinNumberAcceptedText
	closetext
	loadmovesprites
	end
.Arnie
	farwritetext ArnieNumberAcceptedText
	closetext
	loadmovesprites
	end
.Alan
	farwritetext AlanNumberAcceptedText
	closetext
	loadmovesprites
	end
.Chad
	farwritetext ChadNumberAcceptedText
	closetext
	loadmovesprites
	end
.Derek
	farwritetext DerekNumberAcceptedText
	closetext
	loadmovesprites
	end
.Tully
	farwritetext TullyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Brent
	farwritetext BrentNumberAcceptedText
	closetext
	loadmovesprites
	end
.Vance
	farwritetext VanceNumberAcceptedText
	closetext
	loadmovesprites
	end
.Wilton
	farwritetext WiltonNumberAcceptedText
	closetext
	loadmovesprites
	end
.Kenji
	farwritetext KenjiNumberAcceptedText
	closetext
	loadmovesprites
	end
.Parry
	farwritetext ParryNumberAcceptedText
	closetext
	loadmovesprites
	end

NumberDeclinedMScript:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack
	farwritetext JackNumberDeclinedText
	closetext
	loadmovesprites
	end
.Huey
	farwritetext HueyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Gaven
	farwritetext GavenNumberDeclinedText
	closetext
	loadmovesprites
	end
.Jose
	farwritetext JoseNumberDeclinedText
	closetext
	loadmovesprites
	end
.Joey
	farwritetext JoeyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Wade
	farwritetext WadeNumberDeclinedText
	closetext
	loadmovesprites
	end
.Ralph
	farwritetext RalphNumberDeclinedText
	closetext
	loadmovesprites
	end
.Anthony
	farwritetext AnthonyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Todd
	farwritetext ToddNumberDeclinedText
	closetext
	loadmovesprites
	end
.Irwin
	farwritetext IrwinNumberDeclinedText
	closetext
	loadmovesprites
	end
.Arnie
	farwritetext ArnieNumberDeclinedText
	closetext
	loadmovesprites
	end
.Alan
	farwritetext AlanNumberDeclinedText
	closetext
	loadmovesprites
	end
.Chad
	farwritetext ChadNumberDeclinedText
	closetext
	loadmovesprites
	end
.Derek
	farwritetext DerekNumberDeclinedText
	closetext
	loadmovesprites
	end
.Tully
	farwritetext TullyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Brent
	farwritetext BrentNumberDeclinedText
	closetext
	loadmovesprites
	end
.Vance
	farwritetext VanceNumberDeclinedText
	closetext
	loadmovesprites
	end
.Wilton
	farwritetext WiltonNumberDeclinedText
	closetext
	loadmovesprites
	end
.Kenji
	farwritetext KenjiNumberDeclinedText
	closetext
	loadmovesprites
	end
.Parry
	farwritetext ParryNumberDeclinedText
	closetext
	loadmovesprites
	end

PhoneFullMScript:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack
	farwritetext JackPhoneFullText
	closetext
	loadmovesprites
	end
.Huey
	farwritetext HueyPhoneFullText
	closetext
	loadmovesprites
	end
.Gaven
	farwritetext GavenPhoneFullText
	closetext
	loadmovesprites
	end
.Jose
	farwritetext JosePhoneFullText
	closetext
	loadmovesprites
	end
.Joey
	farwritetext JoeyPhoneFullText
	closetext
	loadmovesprites
	end
.Wade
	farwritetext WadePhoneFullText
	closetext
	loadmovesprites
	end
.Ralph
	farwritetext RalphPhoneFullText
	closetext
	loadmovesprites
	end
.Anthony
	farwritetext AnthonyPhoneFullText
	closetext
	loadmovesprites
	end
.Todd
	farwritetext ToddPhoneFullText
	closetext
	loadmovesprites
	end
.Irwin
	farwritetext IrwinPhoneFullText
	closetext
	loadmovesprites
	end
.Arnie
	farwritetext ArniePhoneFullText
	closetext
	loadmovesprites
	end
.Alan
	farwritetext AlanPhoneFullText
	closetext
	loadmovesprites
	end
.Chad
	farwritetext ChadPhoneFullText
	closetext
	loadmovesprites
	end
.Derek
	farwritetext DerekPhoneFullText
	closetext
	loadmovesprites
	end
.Tully
	farwritetext TullyPhoneFullText
	closetext
	loadmovesprites
	end
.Brent
	farwritetext BrentPhoneFullText
	closetext
	loadmovesprites
	end
.Vance
	farwritetext VancePhoneFullText
	closetext
	loadmovesprites
	end
.Wilton
	farwritetext WiltonPhoneFullText
	closetext
	loadmovesprites
	end
.Kenji
	farwritetext KenjiPhoneFullText
	closetext
	loadmovesprites
	end
.Parry
	farwritetext ParryPhoneFullText
	closetext
	loadmovesprites
	end

RematchMScript:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack
	farwritetext JackRematchText
	closetext
	loadmovesprites
	end
.Huey
	farwritetext HueyRematchText
	closetext
	loadmovesprites
	end
.Gaven
	farwritetext GavenRematchText
	closetext
	loadmovesprites
	end
.Jose
	farwritetext JoseRematchText
	closetext
	loadmovesprites
	end
.Joey
	farwritetext JoeyRematchText
	closetext
	loadmovesprites
	end
.Wade
	farwritetext WadeRematchText
	closetext
	loadmovesprites
	end
.Ralph
	farwritetext RalphRematchText
	closetext
	loadmovesprites
	end
.Anthony
	farwritetext AnthonyRematchText
	closetext
	loadmovesprites
	end
.Todd
	farwritetext ToddRematchText
	closetext
	loadmovesprites
	end
.Arnie
	farwritetext ArnieRematchText
	closetext
	loadmovesprites
	end
.Alan
	farwritetext AlanRematchText
	closetext
	loadmovesprites
	end
.Chad
	farwritetext ChadRematchText
	closetext
	loadmovesprites
	end
.Tully
	farwritetext TullyRematchText
	closetext
	loadmovesprites
	end
.Brent
	farwritetext BrentRematchText
	closetext
	loadmovesprites
	end
.Vance
	farwritetext VanceRematchText
	closetext
	loadmovesprites
	end
.Wilton
	farwritetext WiltonRematchText
	closetext
	loadmovesprites
	end
.Parry
	farwritetext ParryRematchText
	closetext
	loadmovesprites
	end

GiftMScript:
	checkcode VAR_CALLERID
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji

.Jose
	farwritetext JoseGiftText
	keeptextopen
	end
.Wade
	farwritetext WadeGiftText
	keeptextopen
	end
.Alan
	farwritetext AlanGiftText
	keeptextopen
	end
.Derek
	farwritetext DerekGiftText
	keeptextopen
	end
.Tully
	farwritetext TullyGiftText
	keeptextopen
	end
.Wilton
	farwritetext WiltonGiftText
	keeptextopen
	end
.Kenji
	farwritetext KenjiGiftText
	keeptextopen
	end

PackFullMScript:
	checkcode VAR_CALLERID
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Huey
	farwritetext HueyPackFullText
	closetext
	loadmovesprites
	end
.Jose
	farwritetext JosePackFullText
	closetext
	loadmovesprites
	end
.Joey
	farwritetext JoeyPackFullText
	closetext
	loadmovesprites
	end
.Wade
	farwritetext WadePackFullText
	closetext
	loadmovesprites
	end
.Alan
	farwritetext AlanPackFullText
	closetext
	loadmovesprites
	end
.Derek
	farwritetext DerekPackFullText
	closetext
	loadmovesprites
	end
.Tully
	farwritetext TullyPackFullText
	closetext
	loadmovesprites
	end
.Vance
	farwritetext VancePackFullText
	closetext
	loadmovesprites
	end
.Wilton
	farwritetext WiltonPackFullText
	closetext
	loadmovesprites
	end
.Kenji
	farwritetext KenjiPackFullText
	closetext
	loadmovesprites
	end
.Parry
	farwritetext ParryPackFullText
	closetext
	loadmovesprites
	end

RematchGiftMScript:
	loadfont
	checkcode VAR_CALLERID
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_HIKER_PARRY, .Parry

.Huey
	farwritetext HueyRematchGiftText
	keeptextopen
	end
.Joey
	farwritetext JoeyRematchGiftText
	keeptextopen
	end
.Vance
	farwritetext VanceRematchGiftText
	keeptextopen
	end
.Parry
	farwritetext ParryRematchGiftText
	keeptextopen
	end

AskNumber1FScript:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly
	farwritetext BeverlyAskNumber1Text
	end
.Beth
	farwritetext BethAskNumber1Text
	end
.Reena
	farwritetext ReenaAskNumber1Text
	end
.Liz
	farwritetext LizAskNumber1Text
	end
.Gina
	farwritetext GinaAskNumber1Text
	end
.Dana
	farwritetext DanaAskNumber1Text
	end
.Tiffany
	farwritetext TiffanyAskNumber1Text
	end
.Erin
	farwritetext ErinAskNumber1Text
	end

AskNumber2FScript:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly
	farwritetext BeverlyAskNumber2Text
	end
.Beth
	farwritetext BethAskNumber2Text
	end
.Reena
	farwritetext ReenaAskNumber2Text
	end
.Liz
	farwritetext LizAskNumber2Text
	end
.Gina
	farwritetext GinaAskNumber2Text
	end
.Dana
	farwritetext DanaAskNumber2Text
	end
.Tiffany
	farwritetext TiffanyAskNumber2Text
	end
.Erin
	farwritetext ErinAskNumber2Text
	end

RegisteredNumberFScript:
	farwritetext RegisteredNumber2Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitbutton
	keeptextopen
	end

NumberAcceptedFScript: ; 0xbcbd3
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly
	farwritetext BeverlyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Beth
	farwritetext BethNumberAcceptedText
	closetext
	loadmovesprites
	end
.Reena
	farwritetext ReenaNumberAcceptedText
	closetext
	loadmovesprites
	end
.Liz
	farwritetext LizNumberAcceptedText
	closetext
	loadmovesprites
	end
.Gina
	farwritetext GinaNumberAcceptedText
	closetext
	loadmovesprites
	end
.Dana
	farwritetext DanaNumberAcceptedText
	closetext
	loadmovesprites
	end
.Tiffany
	farwritetext TiffanyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Erin
	farwritetext ErinNumberAcceptedText
	closetext
	loadmovesprites
	end

NumberDeclinedFScript:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly
	farwritetext BeverlyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Beth
	farwritetext BethNumberDeclinedText
	closetext
	loadmovesprites
	end
.Reena
	farwritetext ReenaNumberDeclinedText
	closetext
	loadmovesprites
	end
.Liz
	farwritetext LizNumberDeclinedText
	closetext
	loadmovesprites
	end
.Gina
	farwritetext GinaNumberDeclinedText
	closetext
	loadmovesprites
	end
.Dana
	farwritetext DanaNumberDeclinedText
	closetext
	loadmovesprites
	end
.Tiffany
	farwritetext TiffanyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Erin
	farwritetext ErinNumberDeclinedText
	closetext
	loadmovesprites
	end

PhoneFullFScript:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly
	farwritetext BeverlyPhoneFullText
	closetext
	loadmovesprites
	end
.Beth
	farwritetext BethPhoneFullText
	closetext
	loadmovesprites
	end
.Reena
	farwritetext ReenaPhoneFullText
	closetext
	loadmovesprites
	end
.Liz
	farwritetext LizPhoneFullText
	closetext
	loadmovesprites
	end
.Gina
	farwritetext GinaPhoneFullText
	closetext
	loadmovesprites
	end
.Dana
	farwritetext DanaPhoneFullText
	closetext
	loadmovesprites
	end
.Tiffany
	farwritetext TiffanyPhoneFullText
	closetext
	loadmovesprites
	end
.Erin
	farwritetext ErinPhoneFullText
	closetext
	loadmovesprites
	end

RematchFScript:
	checkcode VAR_CALLERID
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beth
	farwritetext BethRematchText
	closetext
	loadmovesprites
	end
.Reena
	farwritetext ReenaRematchText
	closetext
	loadmovesprites
	end
.Liz
	farwritetext LizRematchText
	closetext
	loadmovesprites
	end
.Gina
	farwritetext GinaRematchText
	closetext
	loadmovesprites
	end
.Dana
	farwritetext DanaRematchText
	closetext
	loadmovesprites
	end
.Tiffany
	farwritetext TiffanyRematchText
	closetext
	loadmovesprites
	end
.Erin
	farwritetext ErinRematchText
	closetext
	loadmovesprites
	end

GiftFScript:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany

.Beverly
	farwritetext BeverlyGiftText
	keeptextopen
	end
.Gina
	farwritetext GinaGiftText
	keeptextopen
	end
.Dana
	farwritetext DanaGiftText
	keeptextopen
	end
.Tiffany
	farwritetext TiffanyGiftText
	keeptextopen
	end

PackFullFScript:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly
	farwritetext BeverlyPackFullText
	closetext
	loadmovesprites
	end
.Gina
	farwritetext GinaPackFullText
	closetext
	loadmovesprites
	end
.Dana
	farwritetext DanaPackFullText
	closetext
	loadmovesprites
	end
.Tiffany
	farwritetext TiffanyPackFullText
	closetext
	loadmovesprites
	end
.Erin
	farwritetext ErinPackFullText
	closetext
	loadmovesprites
	end

RematchGiftFScript:
	checkcode VAR_CALLERID
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Erin
	loadfont
	farwritetext ErinRematchGiftText
	keeptextopen
	end

GymStatue1Script:
	mapnametotext $0
	loadfont
	farwritetext GymStatue_CityGymText
	closetext
	loadmovesprites
	end

GymStatue2Script:
	mapnametotext $0
	loadfont
	farwritetext GymStatue_CityGymText
	keeptextopen
	farwritetext GymStatue_WinningTrainersText
	closetext
	loadmovesprites
	end

ReceiveItemScript: ; 0xbcdb9
	waitbutton
	farwritetext ReceivedItemText
	playsound SFX_ITEM
	waitbutton
	end
; 0xbcdc3

ReceiveTogepiEggScript: ; 0xbcdc3
	waitbutton
	farwritetext ReceivedItemText
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitbutton
	end
; 0xbcdcd

GameCornerCoinVendorScript: ; 0xbcdcd
	faceplayer
	loadfont
	farwritetext CoinVendor_WelcomeText
	keeptextopen
	checkitem COIN_CASE
	iftrue CoinVendor_IntroScript
	farwritetext CoinVendor_NoCoinCaseText
	closetext
	loadmovesprites
	end
; 0xbcde0

CoinVendor_IntroScript: ; 0xbcde0
	farwritetext CoinVendor_IntroText

CoinVendor_SellCoinsMenuScript: ; 0xbcde4
	special Function24b4e
	loadmenudata CoinVendor_MenuDataHeader
	interpretmenu2
	writebackup
	if_equal $1, CoinVendor_Buy50CoinsScript
	if_equal $2, CoinVendor_Buy500CoinsScript
	jump CoinVendor_CancelScript
; 0xbcdf7

CoinVendor_Buy50CoinsScript: ; 0xbcdf7
	checkcoins 9949
	if_equal $0, CoinVendor_CoinCaseFullScript
	checkmoney $0, 1000
	if_equal $2, CoinVendor_NotEnoughMoneyScript
	givecoins 50
	takemoney $0, 1000
	waitbutton
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy50CoinsText
	closetext
	jump CoinVendor_SellCoinsMenuScript
; 0xbce1b

CoinVendor_Buy500CoinsScript: ; 0xbce1b
	checkcoins 9499
	if_equal $0, CoinVendor_CoinCaseFullScript
	checkmoney $0, 10000
	if_equal $2, CoinVendor_NotEnoughMoneyScript
	givecoins 500
	takemoney $0, 10000
	waitbutton
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy500CoinsText
	closetext
	jump CoinVendor_SellCoinsMenuScript
; 0xbce3f

CoinVendor_NotEnoughMoneyScript: ; 0xbce3f
	farwritetext CoinVendor_NotEnoughMoneyText
	closetext
	loadmovesprites
	end
; 0xbce46

CoinVendor_CoinCaseFullScript: ; 0xbce46
	farwritetext CoinVendor_CoinCaseFullText
	closetext
	loadmovesprites
	end
; 0xbce4d

CoinVendor_CancelScript: ; 0xbce4d
	farwritetext CoinVendor_CancelText
	closetext
	loadmovesprites
	end
; 0xbce54


CoinVendor_MenuDataHeader: ; 0xbce54
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw CoinVendor_MenuData2
	db 1 ; default option
; 0xbce5c

CoinVendor_MenuData2: ; 0xbce5c
	db $80 ; flags
	db 3 ; items
	db " 50 :  ¥1000@"
	db "500 : ¥10000@"
	db "CANCEL@"
; 0xbce7f


HappinessCheckScript:
	faceplayer
	loadfont
	special GetFirstPokemonHappiness
	if_less_than 50, .Unhappy
	if_less_than 150, .KindaHappy
	farwritetext HappinessText3
	closetext
	loadmovesprites
	end

.KindaHappy
	farwritetext HappinessText2
	closetext
	loadmovesprites
	end

.Unhappy
	farwritetext HappinessText1
	closetext
	loadmovesprites
	end

Movement_ContestResults_WalkAfterWarp: ; bcea1
	step_right
	step_down
	turn_head_up
	step_end
; bcea5
