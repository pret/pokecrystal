map_data: MACRO
;\1: map name
;\2: map id
;\3: border block
;\4: connections: combo of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
\1_MapData::
	db \3
	db \2_HEIGHT, \2_WIDTH
	db BANK(\1_Blocks)
	dw \1_Blocks
	db BANK(\1_MapScripts)
	dw \1_MapScripts
	dw \1_MapEvents
	db \4
ENDM

connection: MACRO
if "\1" == "north"
;\2: map id
;\3: map name (eventually will be rolled into map id)
;\4: x
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_Blocks + \2_WIDTH * (\2_HEIGHT - 3) + \5
	dw wOverworldMap + \4 + 3
	db \6
	db \2_WIDTH
	db \2_HEIGHT * 2 - 1
	db (\4 - \5) * -2
	dw wOverworldMap + \2_HEIGHT * (\2_WIDTH + 6) + 1
endc

if "\1" == "south"
;\2: map id
;\3: map name (eventually will be rolled into map id)
;\4: x
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_Blocks + \5
	dw wOverworldMap + (\7_HEIGHT + 3) * (\7_WIDTH + 6) + \4 + 3
	db \6
	db \2_WIDTH
	db 0
	db (\4 - \5) * -2
	dw wOverworldMap + \2_WIDTH + 7
endc

if "\1" == "west"
;\2: map id
;\3: map name (eventually will be rolled into map id)
;\4: y
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_Blocks + (\2_WIDTH * \5) + \2_WIDTH - 3
	dw wOverworldMap + (\7_WIDTH + 6) * (\4 + 3)
	db \6
	db \2_WIDTH
	db (\4 - \5) * -2
	db \2_WIDTH * 2 - 1
	dw wOverworldMap + \2_WIDTH * 2 + 6
endc

if "\1" == "east"
;\2: map id
;\3: map name (eventually will be rolled into map id)
;\4: y
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_Blocks + (\2_WIDTH * \5)
	dw wOverworldMap + (\7_WIDTH + 6) * (\4 + 3 + 1) - 3
	db \6
	db \2_WIDTH
	db (\4 - \5) * -2
	db 0
	dw wOverworldMap + \2_WIDTH + 7
endc
ENDM


	map_data NewBarkTown, NEW_BARK_TOWN, $05, WEST | EAST
	connection west, ROUTE_29, Route29, 0, 0, 9, NEW_BARK_TOWN
	connection east, ROUTE_27, Route27, 0, 0, 9, NEW_BARK_TOWN

	map_data CherrygroveCity, CHERRYGROVE_CITY, $35, NORTH | EAST
	connection north, ROUTE_30, Route30, 5, 0, 10, CHERRYGROVE_CITY
	connection east, ROUTE_29, Route29, 0, 0, 9, CHERRYGROVE_CITY

	map_data VioletCity, VIOLET_CITY, $05, SOUTH | WEST | EAST
	connection south, ROUTE_32, Route32, 0, 0, 10, VIOLET_CITY
	connection west, ROUTE_36, Route36, 0, 0, 9, VIOLET_CITY
	connection east, ROUTE_31, Route31, 9, 0, 9, VIOLET_CITY

	map_data AzaleaTown, AZALEA_TOWN, $05, WEST | EAST
	connection west, ROUTE_34, Route34, -3, 15, 12, AZALEA_TOWN
	connection east, ROUTE_33, Route33, 0, 0, 9, AZALEA_TOWN

	map_data CianwoodCity, CIANWOOD_CITY, $35, EAST
	connection east, ROUTE_41, Route41, 0, 0, 27, CIANWOOD_CITY

	map_data GoldenrodCity, GOLDENROD_CITY, $35, NORTH | SOUTH
	connection north, ROUTE_35, Route35, 5, 0, 10, GOLDENROD_CITY
	connection south, ROUTE_34, Route34, 5, 0, 10, GOLDENROD_CITY

	map_data OlivineCity, OLIVINE_CITY, $35, NORTH | WEST
	connection north, ROUTE_39, Route39, 5, 0, 10, OLIVINE_CITY
	connection west, ROUTE_40, Route40, 9, 0, 12, OLIVINE_CITY

	map_data EcruteakCity, ECRUTEAK_CITY, $05, SOUTH | WEST | EAST
	connection south, ROUTE_37, Route37, 5, 0, 10, ECRUTEAK_CITY
	connection west, ROUTE_38, Route38, 5, 0, 9, ECRUTEAK_CITY
	connection east, ROUTE_42, Route42, 9, 0, 9, ECRUTEAK_CITY

	map_data MahoganyTown, MAHOGANY_TOWN, $71, NORTH | WEST | EAST
	connection north, ROUTE_43, Route43, 0, 0, 10, MAHOGANY_TOWN
	connection west, ROUTE_42, Route42, 0, 0, 9, MAHOGANY_TOWN
	connection east, ROUTE_44, Route44, 0, 0, 9, MAHOGANY_TOWN

	map_data LakeOfRage, LAKE_OF_RAGE, $05, SOUTH
	connection south, ROUTE_43, Route43, 5, 0, 10, LAKE_OF_RAGE

	map_data BlackthornCity, BLACKTHORN_CITY, $71, SOUTH | WEST
	connection south, ROUTE_45, Route45, 0, 0, 10, BLACKTHORN_CITY
	connection west, ROUTE_44, Route44, 9, 0, 9, BLACKTHORN_CITY

	map_data SilverCaveOutside, SILVER_CAVE_OUTSIDE, $2c, EAST
	connection east, ROUTE_28, Route28, 9, 0, 9, SILVER_CAVE_OUTSIDE

	map_data Route26, ROUTE_26, $05, WEST
	connection west, ROUTE_27, Route27, 45, 0, 9, ROUTE_26

	map_data Route27, ROUTE_27, $35, WEST | EAST
	connection west, NEW_BARK_TOWN, NewBarkTown, 0, 0, 9, ROUTE_27
	connection east, ROUTE_26, Route26, -3, 42, 12, ROUTE_27

	map_data Route28, ROUTE_28, $2c, WEST
	connection west, SILVER_CAVE_OUTSIDE, SilverCaveOutside, -3, 6, 12, ROUTE_28

	map_data Route29, ROUTE_29, $05, NORTH | WEST | EAST
	connection north, ROUTE_46, Route46, 10, 0, 10, ROUTE_29
	connection west, CHERRYGROVE_CITY, CherrygroveCity, 0, 0, 9, ROUTE_29
	connection east, NEW_BARK_TOWN, NewBarkTown, 0, 0, 9, ROUTE_29

	map_data Route30, ROUTE_30, $05, NORTH | SOUTH
	connection north, ROUTE_31, Route31, -3, 7, 13, ROUTE_30
	connection south, CHERRYGROVE_CITY, CherrygroveCity, -3, 2, 16, ROUTE_30

	map_data Route31, ROUTE_31, $05, SOUTH | WEST
	connection south, ROUTE_30, Route30, 10, 0, 10, ROUTE_31
	connection west, VIOLET_CITY, VioletCity, -3, 6, 12, ROUTE_31

	map_data Route32, ROUTE_32, $05, NORTH | SOUTH
	connection north, VIOLET_CITY, VioletCity, 0, 0, 13, ROUTE_32
	connection south, ROUTE_33, Route33, 0, 0, 10, ROUTE_32

	map_data Route33, ROUTE_33, $05, NORTH | WEST
	connection north, ROUTE_32, Route32, 0, 0, 10, ROUTE_33
	connection west, AZALEA_TOWN, AzaleaTown, 0, 0, 9, ROUTE_33

	map_data Route34, ROUTE_34, $05, NORTH | EAST
	connection north, GOLDENROD_CITY, GoldenrodCity, -3, 2, 16, ROUTE_34
	connection east, AZALEA_TOWN, AzaleaTown, 18, 0, 9, ROUTE_34

	map_data Route35, ROUTE_35, $05, NORTH | SOUTH
	connection north, ROUTE_36, Route36, 0, 0, 13, ROUTE_35
	connection south, GOLDENROD_CITY, GoldenrodCity, -3, 2, 16, ROUTE_35

	map_data Route36, ROUTE_36, $05, NORTH | SOUTH | EAST
	connection north, ROUTE_37, Route37, 10, 0, 10, ROUTE_36
	connection south, ROUTE_35, Route35, 0, 0, 10, ROUTE_36
	connection east, VIOLET_CITY, VioletCity, 0, 0, 12, ROUTE_36

	map_data Route37, ROUTE_37, $05, NORTH | SOUTH
	connection north, ECRUTEAK_CITY, EcruteakCity, -3, 2, 16, ROUTE_37
	connection south, ROUTE_36, Route36, -3, 7, 16, ROUTE_37

	map_data Route38, ROUTE_38, $05, WEST | EAST
	connection west, ROUTE_39, Route39, 0, 0, 12, ROUTE_38
	connection east, ECRUTEAK_CITY, EcruteakCity, -3, 2, 15, ROUTE_38

	map_data Route39, ROUTE_39, $05, SOUTH | EAST
	connection south, OLIVINE_CITY, OlivineCity, -3, 2, 16, ROUTE_39
	connection east, ROUTE_38, Route38, 0, 0, 9, ROUTE_39

	map_data Route40, ROUTE_40, $35, SOUTH | EAST
	connection south, ROUTE_41, Route41, -3, 12, 13, ROUTE_40
	connection east, OLIVINE_CITY, OlivineCity, -3, 6, 12, ROUTE_40

	map_data Route41, ROUTE_41, $35, NORTH | WEST
	connection north, ROUTE_40, Route40, 15, 0, 10, ROUTE_41
	connection west, CIANWOOD_CITY, CianwoodCity, 0, 0, 27, ROUTE_41

	map_data Route42, ROUTE_42, $05, WEST | EAST
	connection west, ECRUTEAK_CITY, EcruteakCity, -3, 6, 12, ROUTE_42
	connection east, MAHOGANY_TOWN, MahoganyTown, 0, 0, 9, ROUTE_42

	map_data Route43, ROUTE_43, $05, NORTH | SOUTH
	connection north, LAKE_OF_RAGE, LakeOfRage, -3, 2, 16, ROUTE_43
	connection south, MAHOGANY_TOWN, MahoganyTown, 0, 0, 10, ROUTE_43

	map_data Route44, ROUTE_44, $71, WEST | EAST
	connection west, MAHOGANY_TOWN, MahoganyTown, 0, 0, 9, ROUTE_44
	connection east, BLACKTHORN_CITY, BlackthornCity, -3, 6, 12, ROUTE_44

	map_data Route45, ROUTE_45, $71, NORTH | WEST
	connection north, BLACKTHORN_CITY, BlackthornCity, 0, 0, 13, ROUTE_45
	connection west, ROUTE_46, Route46, 36, 0, 12, ROUTE_45

	map_data Route46, ROUTE_46, $05, SOUTH | EAST
	connection south, ROUTE_29, Route29, -3, 7, 16, ROUTE_46
	connection east, ROUTE_45, Route45, -3, 33, 12, ROUTE_46

	map_data PewterCity, PEWTER_CITY, $0f, SOUTH | EAST
	connection south, ROUTE_2, Route2, 5, 0, 10, PEWTER_CITY
	connection east, ROUTE_3, Route3, 5, 0, 9, PEWTER_CITY

	map_data Route2, ROUTE_2, $0f, NORTH | SOUTH
	connection north, PEWTER_CITY, PewterCity, -3, 2, 16, ROUTE_2
	connection south, VIRIDIAN_CITY, ViridianCity, -3, 2, 16, ROUTE_2

	map_data ViridianCity, VIRIDIAN_CITY, $0f, NORTH | SOUTH | WEST
	connection north, ROUTE_2, Route2, 5, 0, 10, VIRIDIAN_CITY
	connection south, ROUTE_1, Route1, 10, 0, 10, VIRIDIAN_CITY
	connection west, ROUTE_22, Route22, 4, 0, 9, VIRIDIAN_CITY

	map_data Route22, ROUTE_22, $2c, EAST
	connection east, VIRIDIAN_CITY, ViridianCity, -3, 1, 15, ROUTE_22

	map_data Route1, ROUTE_1, $0f, NORTH | SOUTH
	connection north, VIRIDIAN_CITY, ViridianCity, -3, 7, 13, ROUTE_1
	connection south, PALLET_TOWN, PalletTown, 0, 0, 10, ROUTE_1

	map_data PalletTown, PALLET_TOWN, $0f, NORTH | SOUTH
	connection north, ROUTE_1, Route1, 0, 0, 10, PALLET_TOWN
	connection south, ROUTE_21, Route21, 0, 0, 10, PALLET_TOWN

	map_data Route21, ROUTE_21, $43, NORTH | SOUTH
	connection north, PALLET_TOWN, PalletTown, 0, 0, 10, ROUTE_21
	connection south, CINNABAR_ISLAND, CinnabarIsland, 0, 0, 10, ROUTE_21

	map_data CinnabarIsland, CINNABAR_ISLAND, $43, NORTH | EAST
	connection north, ROUTE_21, Route21, 0, 0, 10, CINNABAR_ISLAND
	connection east, ROUTE_20, Route20, 0, 0, 9, CINNABAR_ISLAND

	map_data Route20, ROUTE_20, $43, WEST | EAST
	connection west, CINNABAR_ISLAND, CinnabarIsland, 0, 0, 9, ROUTE_20
	connection east, ROUTE_19, Route19, -3, 6, 12, ROUTE_20

	map_data Route19, ROUTE_19, $43, NORTH | WEST
	connection north, FUCHSIA_CITY, FuchsiaCity, 0, 0, 13, ROUTE_19
	connection west, ROUTE_20, Route20, 9, 0, 9, ROUTE_19

	map_data FuchsiaCity, FUCHSIA_CITY, $0f, SOUTH | WEST | EAST
	connection south, ROUTE_19, Route19, 0, 0, 10, FUCHSIA_CITY
	connection west, ROUTE_18, Route18, 7, 0, 9, FUCHSIA_CITY
	connection east, ROUTE_15, Route15, 9, 0, 9, FUCHSIA_CITY

	map_data Route18, ROUTE_18, $43, WEST | EAST
	connection west, ROUTE_17, Route17, -3, 35, 10, ROUTE_18
	connection east, FUCHSIA_CITY, FuchsiaCity, -3, 4, 14, ROUTE_18

	map_data Route17, ROUTE_17, $43, NORTH | EAST
	connection north, ROUTE_16, Route16, 0, 0, 10, ROUTE_17
	connection east, ROUTE_18, Route18, 38, 0, 9, ROUTE_17

	map_data Route16, ROUTE_16, $0f, SOUTH | EAST
	connection south, ROUTE_17, Route17, 0, 0, 10, ROUTE_16
	connection east, CELADON_CITY, CeladonCity, -3, 6, 12, ROUTE_16

	map_data CeladonCity, CELADON_CITY, $0f, WEST | EAST
	connection west, ROUTE_16, Route16, 9, 0, 9, CELADON_CITY
	connection east, ROUTE_7, Route7, 5, 0, 9, CELADON_CITY

	map_data Route7, ROUTE_7, $0f, WEST | EAST
	connection west, CELADON_CITY, CeladonCity, -3, 2, 15, ROUTE_7
	connection east, SAFFRON_CITY, SaffronCity, -3, 6, 12, ROUTE_7

	map_data Route15, ROUTE_15, $0f, WEST | EAST
	connection west, FUCHSIA_CITY, FuchsiaCity, -3, 6, 12, ROUTE_15
	connection east, ROUTE_14, Route14, -3, 6, 12, ROUTE_15

	map_data Route14, ROUTE_14, $43, NORTH | WEST
	connection north, ROUTE_13, Route13, 0, 0, 13, ROUTE_14
	connection west, ROUTE_15, Route15, 9, 0, 9, ROUTE_14

	map_data Route13, ROUTE_13, $43, NORTH | SOUTH
	connection north, ROUTE_12, Route12, 20, 0, 10, ROUTE_13
	connection south, ROUTE_14, Route14, 0, 0, 10, ROUTE_13

	map_data Route12, ROUTE_12, $43, NORTH | SOUTH | WEST
	connection north, LAVENDER_TOWN, LavenderTown, 0, 0, 10, ROUTE_12
	connection south, ROUTE_13, Route13, -3, 17, 13, ROUTE_12
	connection west, ROUTE_11, Route11, 9, 0, 9, ROUTE_12

	map_data Route11, ROUTE_11, $0f, WEST | EAST
	connection west, VERMILION_CITY, VermilionCity, 0, 0, 12, ROUTE_11
	connection east, ROUTE_12, Route12, -3, 6, 15, ROUTE_11

	map_data LavenderTown, LAVENDER_TOWN, $2c, NORTH | SOUTH | WEST
	connection north, ROUTE_10_SOUTH, Route10South, 0, 0, 10, LAVENDER_TOWN
	connection south, ROUTE_12, Route12, 0, 0, 10, LAVENDER_TOWN
	connection west, ROUTE_8, Route8, 0, 0, 9, LAVENDER_TOWN

	map_data VermilionCity, VERMILION_CITY, $43, NORTH | EAST
	connection north, ROUTE_6, Route6, 5, 0, 10, VERMILION_CITY
	connection east, ROUTE_11, Route11, 0, 0, 9, VERMILION_CITY

	map_data Route6, ROUTE_6, $0f, NORTH | SOUTH
	connection north, SAFFRON_CITY, SaffronCity, -3, 2, 16, ROUTE_6
	connection south, VERMILION_CITY, VermilionCity, -3, 2, 16, ROUTE_6

	map_data SaffronCity, SAFFRON_CITY, $0f, NORTH | SOUTH | WEST | EAST
	connection north, ROUTE_5, Route5, 5, 0, 10, SAFFRON_CITY
	connection south, ROUTE_6, Route6, 5, 0, 10, SAFFRON_CITY
	connection west, ROUTE_7, Route7, 9, 0, 9, SAFFRON_CITY
	connection east, ROUTE_8, Route8, 9, 0, 9, SAFFRON_CITY

	map_data Route5, ROUTE_5, $0f, NORTH | SOUTH
	connection north, CERULEAN_CITY, CeruleanCity, -3, 2, 16, ROUTE_5
	connection south, SAFFRON_CITY, SaffronCity, -3, 2, 16, ROUTE_5

	map_data CeruleanCity, CERULEAN_CITY, $0f, NORTH | SOUTH | WEST | EAST
	connection north, ROUTE_24, Route24, 6, 0, 10, CERULEAN_CITY
	connection south, ROUTE_5, Route5, 5, 0, 10, CERULEAN_CITY
	connection west, ROUTE_4, Route4, 5, 0, 9, CERULEAN_CITY
	connection east, ROUTE_9, Route9, 9, 0, 9, CERULEAN_CITY

	map_data Route9, ROUTE_9, $2c, SOUTH | WEST
	connection south, ROUTE_10_NORTH, Route10North, 20, 0, 10, ROUTE_9
	connection west, CERULEAN_CITY, CeruleanCity, -3, 6, 12, ROUTE_9

	map_data Route24, ROUTE_24, $2c, NORTH | SOUTH
	connection north, ROUTE_25, Route25, 0, 0, 13, ROUTE_24
	connection south, CERULEAN_CITY, CeruleanCity, -3, 3, 16, ROUTE_24

	map_data Route25, ROUTE_25, $2c, SOUTH
	connection south, ROUTE_24, Route24, 0, 0, 10, ROUTE_25

	map_data Route3, ROUTE_3, $2c, WEST | EAST
	connection west, PEWTER_CITY, PewterCity, -3, 2, 15, ROUTE_3
	connection east, ROUTE_4, Route4, 0, 0, 9, ROUTE_3

	map_data Route4, ROUTE_4, $2c, WEST | EAST
	connection west, ROUTE_3, Route3, 0, 0, 9, ROUTE_4
	connection east, CERULEAN_CITY, CeruleanCity, -3, 2, 15, ROUTE_4

	map_data Route8, ROUTE_8, $2c, WEST | EAST
	connection west, SAFFRON_CITY, SaffronCity, -3, 6, 12, ROUTE_8
	connection east, LAVENDER_TOWN, LavenderTown, 0, 0, 9, ROUTE_8

	map_data Route10North, ROUTE_10_NORTH, $2c, NORTH | SOUTH
	connection north, ROUTE_9, Route9, -3, 17, 13, ROUTE_10_NORTH
	connection south, ROUTE_10_SOUTH, Route10South, 0, 0, 10, ROUTE_10_NORTH

	map_data Route10South, ROUTE_10_SOUTH, $2c, NORTH | SOUTH
	connection north, ROUTE_10_NORTH, Route10North, 0, 0, 10, ROUTE_10_SOUTH
	connection south, LAVENDER_TOWN, LavenderTown, 0, 0, 10, ROUTE_10_SOUTH

	map_data Route23, ROUTE_23, $0f, 0
	map_data SproutTower1F, SPROUT_TOWER_1F, $00, 0
	map_data SproutTower2F, SPROUT_TOWER_2F, $00, 0
	map_data SproutTower3F, SPROUT_TOWER_3F, $00, 0
	map_data TinTower1F, TIN_TOWER_1F, $00, 0
	map_data TinTower2F, TIN_TOWER_2F, $00, 0
	map_data TinTower3F, TIN_TOWER_3F, $00, 0
	map_data TinTower4F, TIN_TOWER_4F, $00, 0
	map_data TinTower5F, TIN_TOWER_5F, $00, 0
	map_data TinTower6F, TIN_TOWER_6F, $00, 0
	map_data TinTower7F, TIN_TOWER_7F, $00, 0
	map_data TinTower8F, TIN_TOWER_8F, $00, 0
	map_data TinTower9F, TIN_TOWER_9F, $00, 0
	map_data BurnedTower1F, BURNED_TOWER_1F, $00, 0
	map_data BurnedTowerB1F, BURNED_TOWER_B1F, $09, 0
	map_data NationalPark, NATIONAL_PARK, $00, 0
	map_data NationalParkBugContest, NATIONAL_PARK_BUG_CONTEST, $00, 0
	map_data RadioTower1F, RADIO_TOWER_1F, $00, 0
	map_data RadioTower2F, RADIO_TOWER_2F, $00, 0
	map_data RadioTower3F, RADIO_TOWER_3F, $00, 0
	map_data RadioTower4F, RADIO_TOWER_4F, $00, 0
	map_data RadioTower5F, RADIO_TOWER_5F, $00, 0
	map_data RuinsOfAlphOutside, RUINS_OF_ALPH_OUTSIDE, $05, 0
	map_data RuinsOfAlphHoOhChamber, RUINS_OF_ALPH_HO_OH_CHAMBER, $00, 0
	map_data RuinsOfAlphKabutoChamber, RUINS_OF_ALPH_KABUTO_CHAMBER, $00, 0
	map_data RuinsOfAlphOmanyteChamber, RUINS_OF_ALPH_OMANYTE_CHAMBER, $00, 0
	map_data RuinsOfAlphAerodactylChamber, RUINS_OF_ALPH_AERODACTYL_CHAMBER, $00, 0
	map_data RuinsOfAlphInnerChamber, RUINS_OF_ALPH_INNER_CHAMBER, $00, 0
	map_data RuinsOfAlphResearchCenter, RUINS_OF_ALPH_RESEARCH_CENTER, $00, 0
	map_data RuinsOfAlphHoOhItemRoom, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, $00, 0
	map_data RuinsOfAlphKabutoItemRoom, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, $00, 0
	map_data RuinsOfAlphOmanyteItemRoom, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, $00, 0
	map_data RuinsOfAlphAerodactylItemRoom, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM, $00, 0
	map_data RuinsOfAlphHoOhWordRoom, RUINS_OF_ALPH_HO_OH_WORD_ROOM, $00, 0
	map_data RuinsOfAlphKabutoWordRoom, RUINS_OF_ALPH_KABUTO_WORD_ROOM, $00, 0
	map_data RuinsOfAlphOmanyteWordRoom, RUINS_OF_ALPH_OMANYTE_WORD_ROOM, $00, 0
	map_data RuinsOfAlphAerodactylWordRoom, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, $00, 0
	map_data UnionCave1F, UNION_CAVE_1F, $09, 0
	map_data UnionCaveB1F, UNION_CAVE_B1F, $09, 0
	map_data UnionCaveB2F, UNION_CAVE_B2F, $09, 0
	map_data SlowpokeWellB1F, SLOWPOKE_WELL_B1F, $09, 0
	map_data SlowpokeWellB2F, SLOWPOKE_WELL_B2F, $09, 0
	map_data OlivineLighthouse1F, OLIVINE_LIGHTHOUSE_1F, $00, 0
	map_data OlivineLighthouse2F, OLIVINE_LIGHTHOUSE_2F, $00, 0
	map_data OlivineLighthouse3F, OLIVINE_LIGHTHOUSE_3F, $00, 0
	map_data OlivineLighthouse4F, OLIVINE_LIGHTHOUSE_4F, $00, 0
	map_data OlivineLighthouse5F, OLIVINE_LIGHTHOUSE_5F, $00, 0
	map_data OlivineLighthouse6F, OLIVINE_LIGHTHOUSE_6F, $00, 0
	map_data MahoganyMart1F, MAHOGANY_MART_1F, $00, 0
	map_data TeamRocketBaseB1F, TEAM_ROCKET_BASE_B1F, $00, 0
	map_data TeamRocketBaseB2F, TEAM_ROCKET_BASE_B2F, $00, 0
	map_data TeamRocketBaseB3F, TEAM_ROCKET_BASE_B3F, $00, 0
	map_data IlexForest, ILEX_FOREST, $05, 0
	map_data GoldenrodUnderground, GOLDENROD_UNDERGROUND, $00, 0
	map_data GoldenrodUndergroundSwitchRoomEntrances, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, $00, 0
	map_data GoldenrodDeptStoreB1F, GOLDENROD_DEPT_STORE_B1F, $00, 0
	map_data GoldenrodUndergroundWarehouse, GOLDENROD_UNDERGROUND_WAREHOUSE, $00, 0
	map_data MountMortar1FOutside, MOUNT_MORTAR_1F_OUTSIDE, $09, 0
	map_data MountMortar1FInside, MOUNT_MORTAR_1F_INSIDE, $09, 0
	map_data MountMortar2FInside, MOUNT_MORTAR_2F_INSIDE, $09, 0
	map_data MountMortarB1F, MOUNT_MORTAR_B1F, $09, 0
	map_data IcePath1F, ICE_PATH_1F, $09, 0
	map_data IcePathB1F, ICE_PATH_B1F, $19, 0
	map_data IcePathB2FMahoganySide, ICE_PATH_B2F_MAHOGANY_SIDE, $19, 0
	map_data IcePathB2FBlackthornSide, ICE_PATH_B2F_BLACKTHORN_SIDE, $19, 0
	map_data IcePathB3F, ICE_PATH_B3F, $19, 0
	map_data WhirlIslandNW, WHIRL_ISLAND_NW, $09, 0
	map_data WhirlIslandNE, WHIRL_ISLAND_NE, $09, 0
	map_data WhirlIslandSW, WHIRL_ISLAND_SW, $09, 0
	map_data WhirlIslandCave, WHIRL_ISLAND_CAVE, $09, 0
	map_data WhirlIslandSE, WHIRL_ISLAND_SE, $0f, 0
	map_data WhirlIslandB1F, WHIRL_ISLAND_B1F, $09, 0
	map_data WhirlIslandB2F, WHIRL_ISLAND_B2F, $2e, 0
	map_data WhirlIslandLugiaChamber, WHIRL_ISLAND_LUGIA_CHAMBER, $0f, 0
	map_data SilverCaveRoom1, SILVER_CAVE_ROOM_1, $09, 0
	map_data SilverCaveRoom2, SILVER_CAVE_ROOM_2, $09, 0
	map_data SilverCaveRoom3, SILVER_CAVE_ROOM_3, $09, 0
	map_data SilverCaveItemRooms, SILVER_CAVE_ITEM_ROOMS, $09, 0
	map_data DarkCaveVioletEntrance, DARK_CAVE_VIOLET_ENTRANCE, $09, 0
	map_data DarkCaveBlackthornEntrance, DARK_CAVE_BLACKTHORN_ENTRANCE, $09, 0
	map_data DragonsDen1F, DRAGONS_DEN_1F, $09, 0
	map_data DragonsDenB1F, DRAGONS_DEN_B1F, $71, 0
	map_data DragonShrine, DRAGON_SHRINE, $00, 0
	map_data TohjoFalls, TOHJO_FALLS, $09, 0
	map_data OlivinePokecenter1F, OLIVINE_POKECENTER_1F, $00, 0
	map_data OlivineGym, OLIVINE_GYM, $00, 0
	map_data OlivineTimsHouse, OLIVINE_TIMS_HOUSE, $00, 0
	map_data OlivineHouseBeta, OLIVINE_HOUSE_BETA, $00, 0
	map_data OlivinePunishmentSpeechHouse, OLIVINE_PUNISHMENT_SPEECH_HOUSE, $00, 0
	map_data OlivineGoodRodHouse, OLIVINE_GOOD_ROD_HOUSE, $00, 0
	map_data OlivineCafe, OLIVINE_CAFE, $00, 0
	map_data OlivineMart, OLIVINE_MART, $00, 0
	map_data Route38EcruteakGate, ROUTE_38_ECRUTEAK_GATE, $00, 0
	map_data Route39Barn, ROUTE_39_BARN, $00, 0
	map_data Route39Farmhouse, ROUTE_39_FARMHOUSE, $00, 0
	map_data MahoganyRedGyaradosSpeechHouse, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, $00, 0
	map_data MahoganyGym, MAHOGANY_GYM, $00, 0
	map_data MahoganyPokecenter1F, MAHOGANY_POKECENTER_1F, $00, 0
	map_data Route42EcruteakGate, ROUTE_42_ECRUTEAK_GATE, $00, 0
	map_data DiglettsCave, DIGLETTS_CAVE, $09, 0
	map_data MountMoon, MOUNT_MOON, $09, 0
	map_data UndergroundPath, UNDERGROUND_PATH, $00, 0
	map_data RockTunnel1F, ROCK_TUNNEL_1F, $09, 0
	map_data RockTunnelB1F, ROCK_TUNNEL_B1F, $09, 0
	map_data SafariZoneFuchsiaGateBeta, SAFARI_ZONE_FUCHSIA_GATE_BETA, $00, 0
	map_data SafariZoneBeta, SAFARI_ZONE_BETA, $13, 0
	map_data VictoryRoad, VICTORY_ROAD, $1d, 0
	map_data EcruteakHouse, ECRUTEAK_HOUSE, $00, 0
	map_data WiseTriosRoom, WISE_TRIOS_ROOM, $00, 0
	map_data EcruteakPokecenter1F, ECRUTEAK_POKECENTER_1F, $00, 0
	map_data EcruteakLugiaSpeechHouse, ECRUTEAK_LUGIA_SPEECH_HOUSE, $00, 0
	map_data DanceTheatre, DANCE_THEATRE, $00, 0
	map_data EcruteakMart, ECRUTEAK_MART, $00, 0
	map_data EcruteakGym, ECRUTEAK_GYM, $00, 0
	map_data EcruteakItemfinderHouse, ECRUTEAK_ITEMFINDER_HOUSE, $00, 0
	map_data BlackthornGym1F, BLACKTHORN_GYM_1F, $00, 0
	map_data BlackthornGym2F, BLACKTHORN_GYM_2F, $00, 0
	map_data BlackthornDragonSpeechHouse, BLACKTHORN_DRAGON_SPEECH_HOUSE, $00, 0
	map_data BlackthornEmysHouse, BLACKTHORN_EMYS_HOUSE, $00, 0
	map_data BlackthornMart, BLACKTHORN_MART, $00, 0
	map_data BlackthornPokecenter1F, BLACKTHORN_POKECENTER_1F, $00, 0
	map_data MoveDeletersHouse, MOVE_DELETERS_HOUSE, $00, 0
	map_data CinnabarPokecenter1F, CINNABAR_POKECENTER_1F, $00, 0
	map_data CinnabarPokecenter2FBeta, CINNABAR_POKECENTER_2F_BETA, $00, 0
	map_data Route19FuchsiaGate, ROUTE_19_FUCHSIA_GATE, $00, 0
	map_data SeafoamGym, SEAFOAM_GYM, $09, 0
	map_data CeruleanGymBadgeSpeechHouse, CERULEAN_GYM_BADGE_SPEECH_HOUSE, $00, 0
	map_data CeruleanPoliceStation, CERULEAN_POLICE_STATION, $00, 0
	map_data CeruleanTradeSpeechHouse, CERULEAN_TRADE_SPEECH_HOUSE, $00, 0
	map_data CeruleanPokecenter1F, CERULEAN_POKECENTER_1F, $00, 0
	map_data CeruleanPokecenter2FBeta, CERULEAN_POKECENTER_2F_BETA, $00, 0
	map_data CeruleanGym, CERULEAN_GYM, $00, 0
	map_data CeruleanMart, CERULEAN_MART, $00, 0
	map_data Route10Pokecenter1F, ROUTE_10_POKECENTER_1F, $00, 0
	map_data Route10Pokecenter2FBeta, ROUTE_10_POKECENTER_2F_BETA, $00, 0
	map_data PowerPlant, POWER_PLANT, $00, 0
	map_data BillsHouse, BILLS_HOUSE, $00, 0
	map_data AzaleaPokecenter1F, AZALEA_POKECENTER_1F, $00, 0
	map_data CharcoalKiln, CHARCOAL_KILN, $00, 0
	map_data AzaleaMart, AZALEA_MART, $00, 0
	map_data KurtsHouse, KURTS_HOUSE, $00, 0
	map_data AzaleaGym, AZALEA_GYM, $00, 0
	map_data LakeOfRageHiddenPowerHouse, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, $00, 0
	map_data LakeOfRageMagikarpHouse, LAKE_OF_RAGE_MAGIKARP_HOUSE, $00, 0
	map_data Route43MahoganyGate, ROUTE_43_MAHOGANY_GATE, $00, 0
	map_data Route43Gate, ROUTE_43_GATE, $00, 0
	map_data VioletMart, VIOLET_MART, $00, 0
	map_data VioletGym, VIOLET_GYM, $00, 0
	map_data EarlsPokemonAcademy, EARLS_POKEMON_ACADEMY, $00, 0
	map_data VioletNicknameSpeechHouse, VIOLET_NICKNAME_SPEECH_HOUSE, $00, 0
	map_data VioletPokecenter1F, VIOLET_POKECENTER_1F, $00, 0
	map_data VioletKylesHouse, VIOLET_KYLES_HOUSE, $00, 0
	map_data Route32RuinsOfAlphGate, ROUTE_32_RUINS_OF_ALPH_GATE, $00, 0
	map_data Route32Pokecenter1F, ROUTE_32_POKECENTER_1F, $00, 0
	map_data Route35GoldenrodGate, ROUTE_35_GOLDENROD_GATE, $00, 0
	map_data Route35NationalParkGate, ROUTE_35_NATIONAL_PARK_GATE, $00, 0
	map_data Route36RuinsOfAlphGate, ROUTE_36_RUINS_OF_ALPH_GATE, $00, 0
	map_data Route36NationalParkGate, ROUTE_36_NATIONAL_PARK_GATE, $00, 0
	map_data GoldenrodGym, GOLDENROD_GYM, $00, 0
	map_data GoldenrodBikeShop, GOLDENROD_BIKE_SHOP, $00, 0
	map_data GoldenrodHappinessRater, GOLDENROD_HAPPINESS_RATER, $00, 0
	map_data GoldenrodBillsHouse, GOLDENROD_BILLS_HOUSE, $00, 0
	map_data GoldenrodMagnetTrainStation, GOLDENROD_MAGNET_TRAIN_STATION, $00, 0
	map_data GoldenrodFlowerShop, GOLDENROD_FLOWER_SHOP, $00, 0
	map_data GoldenrodPPSpeechHouse, GOLDENROD_PP_SPEECH_HOUSE, $00, 0
	map_data GoldenrodNameRater, GOLDENROD_NAME_RATER, $00, 0
	map_data GoldenrodDeptStore1F, GOLDENROD_DEPT_STORE_1F, $00, 0
	map_data GoldenrodDeptStore2F, GOLDENROD_DEPT_STORE_2F, $00, 0
	map_data GoldenrodDeptStore3F, GOLDENROD_DEPT_STORE_3F, $00, 0
	map_data GoldenrodDeptStore4F, GOLDENROD_DEPT_STORE_4F, $00, 0
	map_data GoldenrodDeptStore5F, GOLDENROD_DEPT_STORE_5F, $00, 0
	map_data GoldenrodDeptStore6F, GOLDENROD_DEPT_STORE_6F, $00, 0
	map_data GoldenrodDeptStoreElevator, GOLDENROD_DEPT_STORE_ELEVATOR, $00, 0
	map_data GoldenrodDeptStoreRoof, GOLDENROD_DEPT_STORE_ROOF, $24, 0
	map_data GoldenrodGameCorner, GOLDENROD_GAME_CORNER, $00, 0
	map_data GoldenrodPokecenter1F, GOLDENROD_POKECENTER_1F, $00, 0
	map_data GoldenrodPokeComCenter2FMobile, GOLDENROD_POKECOM_CENTER_2F_MOBILE, $00, 0
	map_data IlexForestAzaleaGate, ILEX_FOREST_AZALEA_GATE, $00, 0
	map_data Route34IlexForestGate, ROUTE_34_ILEX_FOREST_GATE, $00, 0
	map_data DayCare, DAY_CARE, $00, 0
	map_data VermilionHouseFishingSpeechHouse, VERMILION_HOUSE_FISHING_SPEECH_HOUSE, $00, 0
	map_data VermilionPokecenter1F, VERMILION_POKECENTER_1F, $00, 0
	map_data VermilionPokecenter2FBeta, VERMILION_POKECENTER_2F_BETA, $00, 0
	map_data PokemonFanClub, POKEMON_FAN_CLUB, $00, 0
	map_data VermilionMagnetTrainSpeechHouse, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, $00, 0
	map_data VermilionMart, VERMILION_MART, $00, 0
	map_data VermilionHouseDiglettsCaveSpeechHouse, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE, $00, 0
	map_data VermilionGym, VERMILION_GYM, $00, 0
	map_data Route6SaffronGate, ROUTE_6_SAFFRON_GATE, $00, 0
	map_data Route6UndergroundPathEntrance, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, $00, 0
	map_data RedsHouse1F, REDS_HOUSE_1F, $00, 0
	map_data RedsHouse2F, REDS_HOUSE_2F, $00, 0
	map_data BluesHouse, BLUES_HOUSE, $00, 0
	map_data OaksLab, OAKS_LAB, $00, 0
	map_data PewterNidoranSpeechHouse, PEWTER_NIDORAN_SPEECH_HOUSE, $00, 0
	map_data PewterGym, PEWTER_GYM, $00, 0
	map_data PewterMart, PEWTER_MART, $00, 0
	map_data PewterPokecenter1F, PEWTER_POKECENTER_1F, $00, 0
	map_data PewterPokecenter2FBeta, PEWTER_POKECENTER_2F_BETA, $00, 0
	map_data PewterSnoozeSpeechHouse, PEWTER_SNOOZE_SPEECH_HOUSE, $00, 0
	map_data OlivinePort, OLIVINE_PORT, $0a, 0
	map_data VermilionPort, VERMILION_PORT, $0a, 0
	map_data FastShip1F, FAST_SHIP_1F, $00, 0
	map_data FastShipCabins_NNW_NNE_NE, FAST_SHIP_CABINS_NNW_NNE_NE, $00, 0
	map_data FastShipCabins_SW_SSW_NW, FAST_SHIP_CABINS_SW_SSW_NW, $00, 0
	map_data FastShipCabins_SE_SSE_CaptainsCabin, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, $00, 0
	map_data FastShipB1F, FAST_SHIP_B1F, $00, 0
	map_data OlivinePortPassage, OLIVINE_PORT_PASSAGE, $00, 0
	map_data VermilionPortPassage, VERMILION_PORT_PASSAGE, $00, 0
	map_data MountMoonSquare, MOUNT_MOON_SQUARE, $2d, 0
	map_data MountMoonGiftShop, MOUNT_MOON_GIFT_SHOP, $00, 0
	map_data TinTowerRoof, TIN_TOWER_ROOF, $00, 0
	map_data IndigoPlateauPokecenter1F, INDIGO_PLATEAU_POKECENTER_1F, $00, 0
	map_data WillsRoom, WILLS_ROOM, $00, 0
	map_data KogasRoom, KOGAS_ROOM, $00, 0
	map_data BrunosRoom, BRUNOS_ROOM, $00, 0
	map_data KarensRoom, KARENS_ROOM, $00, 0
	map_data LancesRoom, LANCES_ROOM, $00, 0
	map_data HallOfFame, HALL_OF_FAME, $00, 0
	map_data FuchsiaMart, FUCHSIA_MART, $00, 0
	map_data SafariZoneMainOffice, SAFARI_ZONE_MAIN_OFFICE, $00, 0
	map_data FuchsiaGym, FUCHSIA_GYM, $00, 0
	map_data FuchsiaBillSpeechHouse, FUCHSIA_BILL_SPEECH_HOUSE, $00, 0
	map_data FuchsiaPokecenter1F, FUCHSIA_POKECENTER_1F, $00, 0
	map_data FuchsiaPokecenter2FBeta, FUCHSIA_POKECENTER_2F_BETA, $00, 0
	map_data SafariZoneWardensHome, SAFARI_ZONE_WARDENS_HOME, $00, 0
	map_data Route15FuchsiaGate, ROUTE_15_FUCHSIA_GATE, $00, 0
	map_data LavenderPokecenter1F, LAVENDER_POKECENTER_1F, $00, 0
	map_data LavenderPokecenter2FBeta, LAVENDER_POKECENTER_2F_BETA, $00, 0
	map_data MrFujisHouse, MR_FUJIS_HOUSE, $00, 0
	map_data LavenderSpeechHouse, LAVENDER_SPEECH_HOUSE, $00, 0
	map_data LavenderNameRater, LAVENDER_NAME_RATER, $00, 0
	map_data LavenderMart, LAVENDER_MART, $00, 0
	map_data SoulHouse, SOUL_HOUSE, $00, 0
	map_data LavRadioTower1F, LAV_RADIO_TOWER_1F, $00, 0
	map_data Route8SaffronGate, ROUTE_8_SAFFRON_GATE, $00, 0
	map_data Route12SuperRodHouse, ROUTE_12_SUPER_ROD_HOUSE, $00, 0
	map_data SilverCavePokecenter1F, SILVER_CAVE_POKECENTER_1F, $00, 0
	map_data Route28FamousSpeechHouse, ROUTE_28_FAMOUS_SPEECH_HOUSE, $00, 0
	map_data Pokecenter2F, POKECENTER_2F, $00, 0
	map_data TradeCenter, TRADE_CENTER, $00, 0
	map_data Colosseum, COLOSSEUM, $00, 0
	map_data TimeCapsule, TIME_CAPSULE, $00, 0
	map_data MobileTradeRoomMobile, MOBILE_TRADE_ROOM_MOBILE, $00, 0
	map_data MobileBattleRoom, MOBILE_BATTLE_ROOM, $00, 0
	map_data CeladonDeptStore1F, CELADON_DEPT_STORE_1F, $00, 0
	map_data CeladonDeptStore2F, CELADON_DEPT_STORE_2F, $00, 0
	map_data CeladonDeptStore3F, CELADON_DEPT_STORE_3F, $00, 0
	map_data CeladonDeptStore4F, CELADON_DEPT_STORE_4F, $00, 0
	map_data CeladonDeptStore5F, CELADON_DEPT_STORE_5F, $00, 0
	map_data CeladonDeptStore6F, CELADON_DEPT_STORE_6F, $00, 0
	map_data CeladonDeptStoreElevator, CELADON_DEPT_STORE_ELEVATOR, $00, 0
	map_data CeladonMansion1F, CELADON_MANSION_1F, $00, 0
	map_data CeladonMansion2F, CELADON_MANSION_2F, $00, 0
	map_data CeladonMansion3F, CELADON_MANSION_3F, $00, 0
	map_data CeladonMansionRoof, CELADON_MANSION_ROOF, $01, 0
	map_data CeladonMansionRoofHouse, CELADON_MANSION_ROOF_HOUSE, $00, 0
	map_data CeladonPokecenter1F, CELADON_POKECENTER_1F, $00, 0
	map_data CeladonPokecenter2FBeta, CELADON_POKECENTER_2F_BETA, $00, 0
	map_data CeladonGameCorner, CELADON_GAME_CORNER, $00, 0
	map_data CeladonGameCornerPrizeRoom, CELADON_GAME_CORNER_PRIZE_ROOM, $00, 0
	map_data CeladonGym, CELADON_GYM, $00, 0
	map_data CeladonCafe, CELADON_CAFE, $00, 0
	map_data Route16FuchsiaSpeechHouse, ROUTE_16_FUCHSIA_SPEECH_HOUSE, $00, 0
	map_data Route16Gate, ROUTE_16_GATE, $00, 0
	map_data Route7SaffronGate, ROUTE_7_SAFFRON_GATE, $00, 0
	map_data Route17Route18Gate, ROUTE_17_ROUTE_18_GATE, $00, 0
	map_data ManiasHouse, MANIAS_HOUSE, $00, 0
	map_data CianwoodGym, CIANWOOD_GYM, $00, 0
	map_data CianwoodPokecenter1F, CIANWOOD_POKECENTER_1F, $00, 0
	map_data CianwoodPharmacy, CIANWOOD_PHARMACY, $00, 0
	map_data CianwoodPhotoStudio, CIANWOOD_PHOTO_STUDIO, $00, 0
	map_data CianwoodLugiaSpeechHouse, CIANWOOD_LUGIA_SPEECH_HOUSE, $00, 0
	map_data PokeSeersHouse, POKE_SEERS_HOUSE, $00, 0
	map_data BattleTower1F, BATTLE_TOWER_1F, $00, 0
	map_data BattleTowerBattleRoom, BATTLE_TOWER_BATTLE_ROOM, $00, 0
	map_data BattleTowerElevator, BATTLE_TOWER_ELEVATOR, $00, 0
	map_data BattleTowerHallway, BATTLE_TOWER_HALLWAY, $00, 0
	map_data Route40BattleTowerGate, ROUTE_40_BATTLE_TOWER_GATE, $00, 0
	map_data BattleTowerOutside, BATTLE_TOWER_OUTSIDE, $05, 0
	map_data ViridianGym, VIRIDIAN_GYM, $00, 0
	map_data ViridianNicknameSpeechHouse, VIRIDIAN_NICKNAME_SPEECH_HOUSE, $00, 0
	map_data TrainerHouse1F, TRAINER_HOUSE_1F, $00, 0
	map_data TrainerHouseB1F, TRAINER_HOUSE_B1F, $00, 0
	map_data ViridianMart, VIRIDIAN_MART, $00, 0
	map_data ViridianPokecenter1F, VIRIDIAN_POKECENTER_1F, $00, 0
	map_data ViridianPokecenter2FBeta, VIRIDIAN_POKECENTER_2F_BETA, $00, 0
	map_data Route2NuggetSpeechHouse, ROUTE_2_NUGGET_SPEECH_HOUSE, $00, 0
	map_data Route2Gate, ROUTE_2_GATE, $00, 0
	map_data VictoryRoadGate, VICTORY_ROAD_GATE, $00, 0
	map_data ElmsLab, ELMS_LAB, $00, 0
	map_data KrissHouse1F, KRISS_HOUSE_1F, $00, 0
	map_data KrissHouse2F, KRISS_HOUSE_2F, $00, 0
	map_data KrissNeighborsHouse, KRISS_NEIGHBORS_HOUSE, $00, 0
	map_data ElmsHouse, ELMS_HOUSE, $00, 0
	map_data Route26HealSpeechHouse, ROUTE_26_HEAL_SPEECH_HOUSE, $00, 0
	map_data Route26DayofWeekSiblingsHouse, ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE, $00, 0
	map_data Route27SandstormHouse, ROUTE_27_SANDSTORM_HOUSE, $00, 0
	map_data Route29Route46Gate, ROUTE_29_ROUTE_46_GATE, $00, 0
	map_data FightingDojo, FIGHTING_DOJO, $00, 0
	map_data SaffronGym, SAFFRON_GYM, $00, 0
	map_data SaffronMart, SAFFRON_MART, $00, 0
	map_data SaffronPokecenter1F, SAFFRON_POKECENTER_1F, $00, 0
	map_data SaffronPokecenter2FBeta, SAFFRON_POKECENTER_2F_BETA, $00, 0
	map_data MrPsychicsHouse, MR_PSYCHICS_HOUSE, $00, 0
	map_data SaffronMagnetTrainStation, SAFFRON_MAGNET_TRAIN_STATION, $00, 0
	map_data SilphCo1F, SILPH_CO_1F, $00, 0
	map_data CopycatsHouse1F, COPYCATS_HOUSE_1F, $00, 0
	map_data CopycatsHouse2F, COPYCATS_HOUSE_2F, $00, 0
	map_data Route5UndergroundPathEntrance, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, $00, 0
	map_data Route5SaffronGate, ROUTE_5_SAFFRON_GATE, $00, 0
	map_data Route5CleanseTagSpeechHouse, ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE, $00, 0
	map_data CherrygroveMart, CHERRYGROVE_MART, $00, 0
	map_data CherrygrovePokecenter1F, CHERRYGROVE_POKECENTER_1F, $00, 0
	map_data CherrygroveGymSpeechHouse, CHERRYGROVE_GYM_SPEECH_HOUSE, $00, 0
	map_data GuideGentsHouse, GUIDE_GENTS_HOUSE, $00, 0
	map_data CherrygroveEvolutionSpeechHouse, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, $00, 0
	map_data Route30BerrySpeechHouse, ROUTE_30_BERRY_SPEECH_HOUSE, $00, 0
	map_data MrPokemonsHouse, MR_POKEMONS_HOUSE, $00, 0
	map_data Route31VioletGate, ROUTE_31_VIOLET_GATE, $00, 0
