map_data: MACRO
;\1: map name
;\2: map id
;\3: border block
;\4: connections: combo of NORTH, SOUTH, WEST, and/or EAST, or 0 for none
CURRENT_MAP_WIDTH = \2_WIDTH
CURRENT_MAP_HEIGHT = \2_HEIGHT
\1_MapData::
	db \3
	db CURRENT_MAP_HEIGHT, CURRENT_MAP_WIDTH
	db BANK(\1_Blocks)
	dw \1_Blocks
	db BANK(\1_MapScripts) ; BANK(\1_MapEvents)
	dw \1_MapScripts
	dw \1_MapEvents
	db \4
ENDM

connection: MACRO
;\1: direction
;\2: map name
;\3: map id
;\4: x offset for east/west, y offset for north/south
;\5: distance offset?
;\6: strip length
if "\1" == "north"
	map \3
	dw \2_Blocks + \3_WIDTH * (\3_HEIGHT - 3) + \5
	dw OverworldMap + \4 + 3
	db \6
	db \3_WIDTH
	db \3_HEIGHT * 2 - 1
	db (\4 - \5) * -2
	dw OverworldMap + \3_HEIGHT * (\3_WIDTH + 6) + 1
elif "\1" == "south"
	map \3
	dw \2_Blocks + \5
	dw OverworldMap + (CURRENT_MAP_HEIGHT + 3) * (CURRENT_MAP_WIDTH + 6) + \4 + 3
	db \6
	db \3_WIDTH
	db 0
	db (\4 - \5) * -2
	dw OverworldMap + \3_WIDTH + 7
elif "\1" == "west"
	map \3
	dw \2_Blocks + (\3_WIDTH * \5) + \3_WIDTH - 3
	dw OverworldMap + (CURRENT_MAP_WIDTH + 6) * (\4 + 3)
	db \6
	db \3_WIDTH
	db (\4 - \5) * -2
	db \3_WIDTH * 2 - 1
	dw OverworldMap + \3_WIDTH * 2 + 6
elif "\1" == "east"
	map \3
	dw \2_Blocks + (\3_WIDTH * \5)
	dw OverworldMap + (CURRENT_MAP_WIDTH + 6) * (\4 + 3 + 1) - 3
	db \6
	db \3_WIDTH
	db (\4 - \5) * -2
	db 0
	dw OverworldMap + \3_WIDTH + 7
endc
ENDM


	map_data NewBarkTown, NEW_BARK_TOWN, $05, WEST | EAST
	connection west, Route29, ROUTE_29, 0, 0, 9
	connection east, Route27, ROUTE_27, 0, 0, 9

	map_data CherrygroveCity, CHERRYGROVE_CITY, $35, NORTH | EAST
	connection north, Route30, ROUTE_30, 5, 0, 10
	connection east, Route29, ROUTE_29, 0, 0, 9

	map_data VioletCity, VIOLET_CITY, $05, SOUTH | WEST | EAST
	connection south, Route32, ROUTE_32, 0, 0, 10
	connection west, Route36, ROUTE_36, 0, 0, 9
	connection east, Route31, ROUTE_31, 9, 0, 9

	map_data AzaleaTown, AZALEA_TOWN, $05, WEST | EAST
	connection west, Route34, ROUTE_34, -3, 15, 12
	connection east, Route33, ROUTE_33, 0, 0, 9

	map_data CianwoodCity, CIANWOOD_CITY, $35, EAST
	connection east, Route41, ROUTE_41, 0, 0, 27

	map_data GoldenrodCity, GOLDENROD_CITY, $35, NORTH | SOUTH
	connection north, Route35, ROUTE_35, 5, 0, 10
	connection south, Route34, ROUTE_34, 5, 0, 10

	map_data OlivineCity, OLIVINE_CITY, $35, NORTH | WEST
	connection north, Route39, ROUTE_39, 5, 0, 10
	connection west, Route40, ROUTE_40, 9, 0, 12

	map_data EcruteakCity, ECRUTEAK_CITY, $05, SOUTH | WEST | EAST
	connection south, Route37, ROUTE_37, 5, 0, 10
	connection west, Route38, ROUTE_38, 5, 0, 9
	connection east, Route42, ROUTE_42, 9, 0, 9

	map_data MahoganyTown, MAHOGANY_TOWN, $71, NORTH | WEST | EAST
	connection north, Route43, ROUTE_43, 0, 0, 10
	connection west, Route42, ROUTE_42, 0, 0, 9
	connection east, Route44, ROUTE_44, 0, 0, 9

	map_data LakeOfRage, LAKE_OF_RAGE, $05, SOUTH
	connection south, Route43, ROUTE_43, 5, 0, 10

	map_data BlackthornCity, BLACKTHORN_CITY, $71, SOUTH | WEST
	connection south, Route45, ROUTE_45, 0, 0, 10
	connection west, Route44, ROUTE_44, 9, 0, 9

	map_data SilverCaveOutside, SILVER_CAVE_OUTSIDE, $2c, EAST
	connection east, Route28, ROUTE_28, 9, 0, 9

	map_data Route26, ROUTE_26, $05, WEST
	connection west, Route27, ROUTE_27, 45, 0, 9

	map_data Route27, ROUTE_27, $35, WEST | EAST
	connection west, NewBarkTown, NEW_BARK_TOWN, 0, 0, 9
	connection east, Route26, ROUTE_26, -3, 42, 12

	map_data Route28, ROUTE_28, $2c, WEST
	connection west, SilverCaveOutside, SILVER_CAVE_OUTSIDE, -3, 6, 12

	map_data Route29, ROUTE_29, $05, NORTH | WEST | EAST
	connection north, Route46, ROUTE_46, 10, 0, 10
	connection west, CherrygroveCity, CHERRYGROVE_CITY, 0, 0, 9
	connection east, NewBarkTown, NEW_BARK_TOWN, 0, 0, 9

	map_data Route30, ROUTE_30, $05, NORTH | SOUTH
	connection north, Route31, ROUTE_31, -3, 7, 13
	connection south, CherrygroveCity, CHERRYGROVE_CITY, -3, 2, 16

	map_data Route31, ROUTE_31, $05, SOUTH | WEST
	connection south, Route30, ROUTE_30, 10, 0, 10
	connection west, VioletCity, VIOLET_CITY, -3, 6, 12

	map_data Route32, ROUTE_32, $05, NORTH | SOUTH
	connection north, VioletCity, VIOLET_CITY, 0, 0, 13
	connection south, Route33, ROUTE_33, 0, 0, 10

	map_data Route33, ROUTE_33, $05, NORTH | WEST
	connection north, Route32, ROUTE_32, 0, 0, 10
	connection west, AzaleaTown, AZALEA_TOWN, 0, 0, 9

	map_data Route34, ROUTE_34, $05, NORTH | EAST
	connection north, GoldenrodCity, GOLDENROD_CITY, -3, 2, 16
	connection east, AzaleaTown, AZALEA_TOWN, 18, 0, 9

	map_data Route35, ROUTE_35, $05, NORTH | SOUTH
	connection north, Route36, ROUTE_36, 0, 0, 13
	connection south, GoldenrodCity, GOLDENROD_CITY, -3, 2, 16

	map_data Route36, ROUTE_36, $05, NORTH | SOUTH | EAST
	connection north, Route37, ROUTE_37, 10, 0, 10
	connection south, Route35, ROUTE_35, 0, 0, 10
	connection east, VioletCity, VIOLET_CITY, 0, 0, 12

	map_data Route37, ROUTE_37, $05, NORTH | SOUTH
	connection north, EcruteakCity, ECRUTEAK_CITY, -3, 2, 16
	connection south, Route36, ROUTE_36, -3, 7, 16

	map_data Route38, ROUTE_38, $05, WEST | EAST
	connection west, Route39, ROUTE_39, 0, 0, 12
	connection east, EcruteakCity, ECRUTEAK_CITY, -3, 2, 15

	map_data Route39, ROUTE_39, $05, SOUTH | EAST
	connection south, OlivineCity, OLIVINE_CITY, -3, 2, 16
	connection east, Route38, ROUTE_38, 0, 0, 9

	map_data Route40, ROUTE_40, $35, SOUTH | EAST
	connection south, Route41, ROUTE_41, -3, 12, 13
	connection east, OlivineCity, OLIVINE_CITY, -3, 6, 12

	map_data Route41, ROUTE_41, $35, NORTH | WEST
	connection north, Route40, ROUTE_40, 15, 0, 10
	connection west, CianwoodCity, CIANWOOD_CITY, 0, 0, 27

	map_data Route42, ROUTE_42, $05, WEST | EAST
	connection west, EcruteakCity, ECRUTEAK_CITY, -3, 6, 12
	connection east, MahoganyTown, MAHOGANY_TOWN, 0, 0, 9

	map_data Route43, ROUTE_43, $05, NORTH | SOUTH
	connection north, LakeOfRage, LAKE_OF_RAGE, -3, 2, 16
	connection south, MahoganyTown, MAHOGANY_TOWN, 0, 0, 10

	map_data Route44, ROUTE_44, $71, WEST | EAST
	connection west, MahoganyTown, MAHOGANY_TOWN, 0, 0, 9
	connection east, BlackthornCity, BLACKTHORN_CITY, -3, 6, 12

	map_data Route45, ROUTE_45, $71, NORTH | WEST
	connection north, BlackthornCity, BLACKTHORN_CITY, 0, 0, 13
	connection west, Route46, ROUTE_46, 36, 0, 12

	map_data Route46, ROUTE_46, $05, SOUTH | EAST
	connection south, Route29, ROUTE_29, -3, 7, 16
	connection east, Route45, ROUTE_45, -3, 33, 12

	map_data PewterCity, PEWTER_CITY, $0f, SOUTH | EAST
	connection south, Route2, ROUTE_2, 5, 0, 10
	connection east, Route3, ROUTE_3, 5, 0, 9

	map_data Route2, ROUTE_2, $0f, NORTH | SOUTH
	connection north, PewterCity, PEWTER_CITY, -3, 2, 16
	connection south, ViridianCity, VIRIDIAN_CITY, -3, 2, 16

	map_data ViridianCity, VIRIDIAN_CITY, $0f, NORTH | SOUTH | WEST
	connection north, Route2, ROUTE_2, 5, 0, 10
	connection south, Route1, ROUTE_1, 10, 0, 10
	connection west, Route22, ROUTE_22, 4, 0, 9

	map_data Route22, ROUTE_22, $2c, EAST
	connection east, ViridianCity, VIRIDIAN_CITY, -3, 1, 15

	map_data Route1, ROUTE_1, $0f, NORTH | SOUTH
	connection north, ViridianCity, VIRIDIAN_CITY, -3, 7, 13
	connection south, PalletTown, PALLET_TOWN, 0, 0, 10

	map_data PalletTown, PALLET_TOWN, $0f, NORTH | SOUTH
	connection north, Route1, ROUTE_1, 0, 0, 10
	connection south, Route21, ROUTE_21, 0, 0, 10

	map_data Route21, ROUTE_21, $43, NORTH | SOUTH
	connection north, PalletTown, PALLET_TOWN, 0, 0, 10
	connection south, CinnabarIsland, CINNABAR_ISLAND, 0, 0, 10

	map_data CinnabarIsland, CINNABAR_ISLAND, $43, NORTH | EAST
	connection north, Route21, ROUTE_21, 0, 0, 10
	connection east, Route20, ROUTE_20, 0, 0, 9

	map_data Route20, ROUTE_20, $43, WEST | EAST
	connection west, CinnabarIsland, CINNABAR_ISLAND, 0, 0, 9
	connection east, Route19, ROUTE_19, -3, 6, 12

	map_data Route19, ROUTE_19, $43, NORTH | WEST
	connection north, FuchsiaCity, FUCHSIA_CITY, 0, 0, 13
	connection west, Route20, ROUTE_20, 9, 0, 9

	map_data FuchsiaCity, FUCHSIA_CITY, $0f, SOUTH | WEST | EAST
	connection south, Route19, ROUTE_19, 0, 0, 10
	connection west, Route18, ROUTE_18, 7, 0, 9
	connection east, Route15, ROUTE_15, 9, 0, 9

	map_data Route18, ROUTE_18, $43, WEST | EAST
	connection west, Route17, ROUTE_17, -3, 35, 10
	connection east, FuchsiaCity, FUCHSIA_CITY, -3, 4, 14

	map_data Route17, ROUTE_17, $43, NORTH | EAST
	connection north, Route16, ROUTE_16, 0, 0, 10
	connection east, Route18, ROUTE_18, 38, 0, 9

	map_data Route16, ROUTE_16, $0f, SOUTH | EAST
	connection south, Route17, ROUTE_17, 0, 0, 10
	connection east, CeladonCity, CELADON_CITY, -3, 6, 12

	map_data CeladonCity, CELADON_CITY, $0f, WEST | EAST
	connection west, Route16, ROUTE_16, 9, 0, 9
	connection east, Route7, ROUTE_7, 5, 0, 9

	map_data Route7, ROUTE_7, $0f, WEST | EAST
	connection west, CeladonCity, CELADON_CITY, -3, 2, 15
	connection east, SaffronCity, SAFFRON_CITY, -3, 6, 12

	map_data Route15, ROUTE_15, $0f, WEST | EAST
	connection west, FuchsiaCity, FUCHSIA_CITY, -3, 6, 12
	connection east, Route14, ROUTE_14, -3, 6, 12

	map_data Route14, ROUTE_14, $43, NORTH | WEST
	connection north, Route13, ROUTE_13, 0, 0, 13
	connection west, Route15, ROUTE_15, 9, 0, 9

	map_data Route13, ROUTE_13, $43, NORTH | SOUTH
	connection north, Route12, ROUTE_12, 20, 0, 10
	connection south, Route14, ROUTE_14, 0, 0, 10

	map_data Route12, ROUTE_12, $43, NORTH | SOUTH | WEST
	connection north, LavenderTown, LAVENDER_TOWN, 0, 0, 10
	connection south, Route13, ROUTE_13, -3, 17, 13
	connection west, Route11, ROUTE_11, 9, 0, 9

	map_data Route11, ROUTE_11, $0f, WEST | EAST
	connection west, VermilionCity, VERMILION_CITY, 0, 0, 12
	connection east, Route12, ROUTE_12, -3, 6, 15

	map_data LavenderTown, LAVENDER_TOWN, $2c, NORTH | SOUTH | WEST
	connection north, Route10South, ROUTE_10_SOUTH, 0, 0, 10
	connection south, Route12, ROUTE_12, 0, 0, 10
	connection west, Route8, ROUTE_8, 0, 0, 9

	map_data VermilionCity, VERMILION_CITY, $43, NORTH | EAST
	connection north, Route6, ROUTE_6, 5, 0, 10
	connection east, Route11, ROUTE_11, 0, 0, 9

	map_data Route6, ROUTE_6, $0f, NORTH | SOUTH
	connection north, SaffronCity, SAFFRON_CITY, -3, 2, 16
	connection south, VermilionCity, VERMILION_CITY, -3, 2, 16

	map_data SaffronCity, SAFFRON_CITY, $0f, NORTH | SOUTH | WEST | EAST
	connection north, Route5, ROUTE_5, 5, 0, 10
	connection south, Route6, ROUTE_6, 5, 0, 10
	connection west, Route7, ROUTE_7, 9, 0, 9
	connection east, Route8, ROUTE_8, 9, 0, 9

	map_data Route5, ROUTE_5, $0f, NORTH | SOUTH
	connection north, CeruleanCity, CERULEAN_CITY, -3, 2, 16
	connection south, SaffronCity, SAFFRON_CITY, -3, 2, 16

	map_data CeruleanCity, CERULEAN_CITY, $0f, NORTH | SOUTH | WEST | EAST
	connection north, Route24, ROUTE_24, 6, 0, 10
	connection south, Route5, ROUTE_5, 5, 0, 10
	connection west, Route4, ROUTE_4, 5, 0, 9
	connection east, Route9, ROUTE_9, 9, 0, 9

	map_data Route9, ROUTE_9, $2c, SOUTH | WEST
	connection south, Route10North, ROUTE_10_NORTH, 20, 0, 10
	connection west, CeruleanCity, CERULEAN_CITY, -3, 6, 12

	map_data Route24, ROUTE_24, $2c, NORTH | SOUTH
	connection north, Route25, ROUTE_25, 0, 0, 13
	connection south, CeruleanCity, CERULEAN_CITY, -3, 3, 16

	map_data Route25, ROUTE_25, $2c, SOUTH
	connection south, Route24, ROUTE_24, 0, 0, 10

	map_data Route3, ROUTE_3, $2c, WEST | EAST
	connection west, PewterCity, PEWTER_CITY, -3, 2, 15
	connection east, Route4, ROUTE_4, 0, 0, 9

	map_data Route4, ROUTE_4, $2c, WEST | EAST
	connection west, Route3, ROUTE_3, 0, 0, 9
	connection east, CeruleanCity, CERULEAN_CITY, -3, 2, 15

	map_data Route8, ROUTE_8, $2c, WEST | EAST
	connection west, SaffronCity, SAFFRON_CITY, -3, 6, 12
	connection east, LavenderTown, LAVENDER_TOWN, 0, 0, 9

	map_data Route10North, ROUTE_10_NORTH, $2c, NORTH | SOUTH
	connection north, Route9, ROUTE_9, -3, 17, 13
	connection south, Route10South, ROUTE_10_SOUTH, 0, 0, 10

	map_data Route10South, ROUTE_10_SOUTH, $2c, NORTH | SOUTH
	connection north, Route10North, ROUTE_10_NORTH, 0, 0, 10
	connection south, LavenderTown, LAVENDER_TOWN, 0, 0, 10

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
	map_data EcruteakTinTowerEntrance, ECRUTEAK_TIN_TOWER_ENTRANCE, $00, 0
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
	map_data BillsFamilysHouse, BILLS_FAMILYS_HOUSE, $00, 0
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
	map_data PokecomCenterAdminRoomMobile, POKECOM_CENTER_ADMIN_ROOM_MOBILE, $00, 0
	map_data IlexForestAzaleaGate, ILEX_FOREST_AZALEA_GATE, $00, 0
	map_data Route34IlexForestGate, ROUTE_34_ILEX_FOREST_GATE, $00, 0
	map_data DayCare, DAY_CARE, $00, 0
	map_data VermilionFishingSpeechHouse, VERMILION_FISHING_SPEECH_HOUSE, $00, 0
	map_data VermilionPokecenter1F, VERMILION_POKECENTER_1F, $00, 0
	map_data VermilionPokecenter2FBeta, VERMILION_POKECENTER_2F_BETA, $00, 0
	map_data PokemonFanClub, POKEMON_FAN_CLUB, $00, 0
	map_data VermilionMagnetTrainSpeechHouse, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, $00, 0
	map_data VermilionMart, VERMILION_MART, $00, 0
	map_data VermilionDiglettsCaveSpeechHouse, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, $00, 0
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
	map_data BillsBrothersHouse, BILLS_BROTHERS_HOUSE, $00, 0
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
	map_data Route28SteelWingHouse, ROUTE_28_STEEL_WING_HOUSE, $00, 0
	map_data Pokecenter2F, POKECENTER_2F, $00, 0
	map_data TradeCenter, TRADE_CENTER, $00, 0
	map_data Colosseum, COLOSSEUM, $00, 0
	map_data TimeCapsule, TIME_CAPSULE, $00, 0
	map_data MobileTradeRoom, MOBILE_TRADE_ROOM, $00, 0
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
	map_data Route2NuggetHouse, ROUTE_2_NUGGET_HOUSE, $00, 0
	map_data Route2Gate, ROUTE_2_GATE, $00, 0
	map_data VictoryRoadGate, VICTORY_ROAD_GATE, $00, 0
	map_data ElmsLab, ELMS_LAB, $00, 0
	map_data PlayersHouse1F, PLAYERS_HOUSE_1F, $00, 0
	map_data PlayersHouse2F, PLAYERS_HOUSE_2F, $00, 0
	map_data PlayersNeighborsHouse, PLAYERS_NEIGHBORS_HOUSE, $00, 0
	map_data ElmsHouse, ELMS_HOUSE, $00, 0
	map_data Route26HealHouse, ROUTE_26_HEAL_HOUSE, $00, 0
	map_data DayOfWeekSiblingsHouse, DAY_OF_WEEK_SIBLINGS_HOUSE, $00, 0
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
	map_data Route5CleanseTagHouse, ROUTE_5_CLEANSE_TAG_HOUSE, $00, 0
	map_data CherrygroveMart, CHERRYGROVE_MART, $00, 0
	map_data CherrygrovePokecenter1F, CHERRYGROVE_POKECENTER_1F, $00, 0
	map_data CherrygroveGymSpeechHouse, CHERRYGROVE_GYM_SPEECH_HOUSE, $00, 0
	map_data GuideGentsHouse, GUIDE_GENTS_HOUSE, $00, 0
	map_data CherrygroveEvolutionSpeechHouse, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, $00, 0
	map_data Route30BerryHouse, ROUTE_30_BERRY_HOUSE, $00, 0
	map_data MrPokemonsHouse, MR_POKEMONS_HOUSE, $00, 0
	map_data Route31VioletGate, ROUTE_31_VIOLET_GATE, $00, 0
