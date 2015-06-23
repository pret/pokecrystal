
MapGroupPointers:: ; 0x94000
; pointers to the first map header of each map group
	dw MapGroup1
	dw MapGroup2
	dw MapGroup3
	dw MapGroup4
	dw MapGroup5
	dw MapGroup6
	dw MapGroup7
	dw MapGroup8
	dw MapGroup9
	dw MapGroup10
	dw MapGroup11
	dw MapGroup12
	dw MapGroup13
	dw MapGroup14
	dw MapGroup15
	dw MapGroup16
	dw MapGroup17
	dw MapGroup18
	dw MapGroup19
	dw MapGroup20
	dw MapGroup21
	dw MapGroup22
	dw MapGroup23
	dw MapGroup24
	dw MapGroup25
	dw MapGroup26


MapGroup1:
	map_header OlivinePokeCenter1F, $7, 3, OLIVINE_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header OlivineGym, $12, 3, OLIVINE_CITY, MUSIC_GYM, 17, 1
	map_header OlivineVoltorbHouse, $5, 3, OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header OlivineHouseBeta, $5, 3, OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header OlivinePunishmentSpeechHouse, $5, 3, OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header OlivineGoodRodHouse, $5, 3, OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header OlivineCafe, $e, 3, OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header OlivineMart, $c, 3, OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header Route38EcruteakGate, $8, 6, ROUTE_38, MUSIC_ROUTE_37, 1, 1
	map_header Route39Barn, $10, 3, ROUTE_39, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header Route39Farmhouse, $5, 3, ROUTE_39, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header Route38, $1, 2, ROUTE_38, MUSIC_ROUTE_37, 0, 1
	map_header Route39, $1, 2, ROUTE_39, MUSIC_ROUTE_37, 0, 1
	map_header OlivineCity, $1, 1, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 1


MapGroup2:
	map_header MahoganyRedGyaradosSpeechHouse, $5, 3, MAHOGANY_TOWN, MUSIC_CHERRYGROVE_CITY, 1, 1
	map_header MahoganyGym, $f, 3, MAHOGANY_TOWN, MUSIC_GYM, 17, 1
	map_header MahoganyPokeCenter1F, $7, 3, MAHOGANY_TOWN, MUSIC_POKEMON_CENTER, 1, 1
	map_header Route42EcruteakGate, $8, 6, ROUTE_42, MUSIC_LAKE_OF_RAGE, 1, 1
	map_header Route42, $1, 2, ROUTE_42, MUSIC_LAKE_OF_RAGE, 0, 3
	map_header Route44, $1, 2, ROUTE_44, MUSIC_LAKE_OF_RAGE, 0, 4
	map_header MahoganyTown, $1, 1, MAHOGANY_TOWN, MUSIC_CHERRYGROVE_CITY, 0, 1


MapGroup3:
	map_header SproutTower1F, $17, 7, SPROUT_TOWER, MUSIC_SPROUT_TOWER, 1, 1
	map_header SproutTower2F, $17, 7, SPROUT_TOWER, MUSIC_SPROUT_TOWER, 1, 1
	map_header SproutTower3F, $17, 7, SPROUT_TOWER, MUSIC_SPROUT_TOWER, 1, 1
	map_header TinTower1F, $17, 7, TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
	map_header TinTower2F, $17, 7, TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
	map_header TinTower3F, $17, 7, TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
	map_header TinTower4F, $17, 7, TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
	map_header TinTower5F, $17, 7, TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
	map_header TinTower6F, $17, 7, TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
	map_header TinTower7F, $17, 7, TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
	map_header TinTower8F, $17, 7, TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
	map_header TinTower9F, $17, 7, TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
	map_header BurnedTower1F, $17, 7, BURNED_TOWER, MUSIC_BURNED_TOWER, 18, 1
	map_header BurnedTowerB1F, $18, 4, BURNED_TOWER, MUSIC_BURNED_TOWER, 18, 1
	map_header NationalPark, $19, 2, NATIONAL_PARK, MUSIC_NATIONAL_PARK, 0, 1
	map_header NationalParkBugContest, $19, 2, NATIONAL_PARK, MUSIC_BUG_CATCHING_CONTEST, 0, 1
	map_header RadioTower1F, $1b, 3, RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 17, 1
	map_header RadioTower2F, $1b, 3, RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 17, 1
	map_header RadioTower3F, $1b, 3, RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 17, 1
	map_header RadioTower4F, $1b, 3, RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 17, 1
	map_header RadioTower5F, $1b, 3, RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 17, 1
	map_header RuinsofAlphOutside, $1, 2, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 0, 4
	map_header RuinsofAlphHoOhChamber, $1a, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphKabutoChamber, $1a, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphOmanyteChamber, $1a, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphAerodactylChamber, $1a, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphInnerChamber, $1a, 7, RUINS_OF_ALPH, MUSIC_RUINS_OF_ALPH_INTERIOR, 17, 1
	map_header RuinsofAlphResearchCenter, $b, 3, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1
	map_header RuinsofAlphHoOhItemRoom, $1a, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphKabutoItemRoom, $1a, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphOmanyteItemRoom, $1a, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphAerodactylItemRoom, $1a, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphHoOhWordRoom, $21, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphKabutoWordRoom, $22, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphOmanyteWordRoom, $23, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header RuinsofAlphAerodactylWordRoom, $24, 7, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
	map_header UnionCave1F, $18, 4, UNION_CAVE, MUSIC_UNION_CAVE, 18, 3
	map_header UnionCaveB1F, $18, 4, UNION_CAVE, MUSIC_UNION_CAVE, 18, 3
	map_header UnionCaveB2F, $18, 4, UNION_CAVE, MUSIC_UNION_CAVE, 18, 1
	map_header SlowpokeWellB1F, $18, 4, SLOWPOKE_WELL, MUSIC_DARK_CAVE, 18, 3
	map_header SlowpokeWellB2F, $18, 4, SLOWPOKE_WELL, MUSIC_DARK_CAVE, 18, 3
	map_header OlivineLighthouse1F, $13, 7, LIGHTHOUSE, MUSIC_LIGHTHOUSE, 1, 1
	map_header OlivineLighthouse2F, $13, 7, LIGHTHOUSE, MUSIC_LIGHTHOUSE, 1, 1
	map_header OlivineLighthouse3F, $13, 7, LIGHTHOUSE, MUSIC_LIGHTHOUSE, 1, 1
	map_header OlivineLighthouse4F, $13, 7, LIGHTHOUSE, MUSIC_LIGHTHOUSE, 1, 1
	map_header OlivineLighthouse5F, $13, 7, LIGHTHOUSE, MUSIC_LIGHTHOUSE, 1, 1
	map_header OlivineLighthouse6F, $13, 7, LIGHTHOUSE, MUSIC_VIOLET_CITY, 1, 1
	map_header MahoganyMart1F, $10, 3, MAHOGANY_TOWN, MUSIC_MAHOGANY_MART, 17, 1
	map_header TeamRocketBaseB1F, $1c, 7, MAHOGANY_TOWN, MUSIC_ROCKET_HIDEOUT, 17, 1
	map_header TeamRocketBaseB2F, $b, 7, MAHOGANY_TOWN, MUSIC_ROCKET_HIDEOUT, 17, 1
	map_header TeamRocketBaseB3F, $b, 7, MAHOGANY_TOWN, MUSIC_ROCKET_HIDEOUT, 17, 1
	map_header IlexForest, $1f, 4, ILEX_FOREST, MUSIC_UNION_CAVE, 2, 4
	map_header WarehouseEntrance, $8, 7, GOLDENROD_CITY, MUSIC_UNION_CAVE, 17, 1
	map_header UndergroundPathSwitchRoomEntrances, $f, 7, GOLDENROD_CITY, MUSIC_UNION_CAVE, 17, 1
	map_header GoldenrodDeptStoreB1F, $1c, 7, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 17, 1
	map_header UndergroundWarehouse, $1c, 7, GOLDENROD_CITY, MUSIC_UNION_CAVE, 17, 1
	map_header MountMortar1FOutside, $1e, 4, MT_MORTAR, MUSIC_UNION_CAVE, 18, 3
	map_header MountMortar1FInside, $1e, 4, MT_MORTAR, MUSIC_UNION_CAVE, 18, 3
	map_header MountMortar2FInside, $1e, 4, MT_MORTAR, MUSIC_UNION_CAVE, 18, 3
	map_header MountMortarB1F, $1e, 4, MT_MORTAR, MUSIC_UNION_CAVE, 18, 3
	map_header IcePath1F, $1d, 4, ICE_PATH, MUSIC_DARK_CAVE, 18, 5
	map_header IcePathB1F, $1d, 4, ICE_PATH, MUSIC_DARK_CAVE, 18, 5
	map_header IcePathB2FMahoganySide, $1d, 4, ICE_PATH, MUSIC_DARK_CAVE, 18, 5
	map_header IcePathB2FBlackthornSide, $1d, 4, ICE_PATH, MUSIC_DARK_CAVE, 18, 5
	map_header IcePathB3F, $1d, 4, ICE_PATH, MUSIC_DARK_CAVE, 18, 5
	map_header WhirlIslandNW, $1e, 4, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
	map_header WhirlIslandNE, $1e, 4, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
	map_header WhirlIslandSW, $1e, 4, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
	map_header WhirlIslandCave, $1e, 4, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
	map_header WhirlIslandSE, $1e, 4, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
	map_header WhirlIslandB1F, $1e, 4, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
	map_header WhirlIslandB2F, $1e, 4, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
	map_header WhirlIslandLugiaChamber, $1e, 4, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
	map_header SilverCaveRoom1, $1e, 4, SILVER_CAVE, MUSIC_LIGHTHOUSE, 20, 3
	map_header SilverCaveRoom2, $18, 4, SILVER_CAVE, MUSIC_LIGHTHOUSE, 18, 3
	map_header SilverCaveRoom3, $18, 4, SILVER_CAVE, MUSIC_LIGHTHOUSE, 17, 3
	map_header SilverCaveItemRooms, $18, 4, SILVER_CAVE, MUSIC_LIGHTHOUSE, 18, 3
	map_header DarkCaveVioletEntrance, $1e, 4, DARK_CAVE, MUSIC_DARK_CAVE, 20, 3
	map_header DarkCaveBlackthornEntrance, $1e, 4, DARK_CAVE, MUSIC_DARK_CAVE, 20, 3
	map_header DragonsDen1F, $18, 4, DRAGONS_DEN, MUSIC_DRAGONS_DEN, 18, 5
	map_header DragonsDenB1F, $1, 4, DRAGONS_DEN, MUSIC_DRAGONS_DEN, 18, 5
	map_header DragonShrine, $a, 3, DRAGONS_DEN, MUSIC_DRAGONS_DEN, 18, 1
	map_header TohjoFalls, $18, 4, TOHJO_FALLS, MUSIC_UNION_CAVE, 18, 3
	map_header DiglettsCave, $18, 4, DIGLETTS_CAVE, MUSIC_MT_MOON, 18, 1
	map_header MountMoon, $18, 4, MT_MOON, MUSIC_MT_MOON, 18, 1
	map_header Underground, $1c, 6, UNDERGROUND, MUSIC_MT_MOON, 2, 1
	map_header RockTunnel1F, $1e, 4, ROCK_TUNNEL, MUSIC_MT_MOON, 20, 1
	map_header RockTunnelB1F, $1e, 4, ROCK_TUNNEL, MUSIC_MT_MOON, 20, 1
	map_header SafariZoneFuchsiaGateBeta, $8, 3, FUCHSIA_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header SafariZoneBeta, $19, 4, FUCHSIA_CITY, MUSIC_EVOLUTION, 0, 1
	map_header VictoryRoad, $18, 4, VICTORY_ROAD, MUSIC_VICTORY_ROAD, 18, 1


MapGroup4:
	map_header EcruteakHouse, $17, 3, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header WiseTriosRoom, $10, 3, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 17, 1
	map_header EcruteakPokeCenter1F, $7, 3, ECRUTEAK_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header EcruteakLugiaSpeechHouse, $10, 3, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header DanceTheatre, $10, 3, ECRUTEAK_CITY, MUSIC_DANCING_HALL, 1, 1
	map_header EcruteakMart, $c, 3, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header EcruteakGym, $17, 3, ECRUTEAK_CITY, MUSIC_GYM, 17, 1
	map_header EcruteakItemfinderHouse, $10, 3, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header EcruteakCity, $1, 1, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 0, 4


MapGroup5:
	map_header BlackthornGym1F, $f, 3, BLACKTHORN_CITY, MUSIC_GYM, 17, 1
	map_header BlackthornGym2F, $f, 3, BLACKTHORN_CITY, MUSIC_GYM, 17, 1
	map_header BlackthornDragonSpeechHouse, $5, 3, BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 1, 1
	map_header BlackthornDodrioTradeHouse, $5, 3, BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 1, 1
	map_header BlackthornMart, $c, 3, BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 1, 1
	map_header BlackthornPokeCenter1F, $7, 3, BLACKTHORN_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header MoveDeletersHouse, $5, 3, BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 1, 1
	map_header Route45, $1, 2, ROUTE_45, MUSIC_ROUTE_36, 0, 9
	map_header Route46, $1, 2, ROUTE_46, MUSIC_ROUTE_36, 0, 1
	map_header BlackthornCity, $1, 1, BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 0, 4


MapGroup6:
	map_header CinnabarPokeCenter1F, $7, 3, CINNABAR_ISLAND, MUSIC_POKEMON_CENTER, 1, 1
	map_header CinnabarPokeCenter2FBeta, $7, 3, CINNABAR_ISLAND, MUSIC_POKEMON_CENTER, 1, 1
	map_header Route19FuchsiaGate, $8, 6, ROUTE_19, MUSIC_ROUTE_3, 1, 1
	map_header SeafoamGym, $18, 3, SEAFOAM_ISLANDS, MUSIC_GYM, 17, 1
	map_header Route19, $3, 2, ROUTE_19, MUSIC_ROUTE_3, 0, 1
	map_header Route20, $3, 2, ROUTE_20, MUSIC_ROUTE_3, 0, 2
	map_header Route21, $3, 2, ROUTE_21, MUSIC_ROUTE_3, 0, 2
	map_header CinnabarIsland, $3, 1, CINNABAR_ISLAND, MUSIC_VIRIDIAN_CITY, 0, 2


MapGroup7:
	map_header CeruleanGymBadgeSpeechHouse, $5, 3, CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header CeruleanPoliceStation, $5, 3, CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header CeruleanTradeSpeechHouse, $5, 3, CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header CeruleanPokeCenter1F, $7, 3, CERULEAN_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header CeruleanPokeCenter2FBeta, $7, 3, CERULEAN_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header CeruleanGym, $9, 3, CERULEAN_CITY, MUSIC_GYM, 17, 0
	map_header CeruleanMart, $c, 3, CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header Route10PokeCenter1F, $7, 3, ROUTE_10, MUSIC_POKEMON_CENTER, 1, 1
	map_header Route10PokeCenter2FBeta, $7, 3, ROUTE_10, MUSIC_POKEMON_CENTER, 1, 1
	map_header PowerPlant, $b, 3, POWER_PLANT, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header BillsHouse, $5, 3, ROUTE_25, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header Route4, $3, 2, ROUTE_4, MUSIC_ROUTE_3, 0, 0
	map_header Route9, $3, 2, ROUTE_9, MUSIC_ROUTE_3, 0, 3
	map_header Route10North, $3, 2, ROUTE_10, MUSIC_ROUTE_3, 0, 3
	map_header Route24, $3, 2, ROUTE_24, MUSIC_ROUTE_3, 0, 3
	map_header Route25, $3, 2, ROUTE_25, MUSIC_ROUTE_3, 0, 3
	map_header CeruleanCity, $3, 1, CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 0


MapGroup8:
	map_header AzaleaPokeCenter1F, $7, 3, AZALEA_TOWN, MUSIC_POKEMON_CENTER, 1, 1
	map_header CharcoalKiln, $5, 3, AZALEA_TOWN, MUSIC_AZALEA_TOWN, 1, 1
	map_header AzaleaMart, $c, 3, AZALEA_TOWN, MUSIC_AZALEA_TOWN, 1, 1
	map_header KurtsHouse, $10, 3, AZALEA_TOWN, MUSIC_AZALEA_TOWN, 1, 1
	map_header AzaleaGym, $f, 3, AZALEA_TOWN, MUSIC_GYM, 17, 1
	map_header Route33, $2, 2, ROUTE_33, MUSIC_ROUTE_30, 0, 1
	map_header AzaleaTown, $2, 1, AZALEA_TOWN, MUSIC_AZALEA_TOWN, 0, 1


MapGroup9:
	map_header LakeofRageHiddenPowerHouse, $5, 3, LAKE_OF_RAGE, MUSIC_LAKE_OF_RAGE, 1, 1
	map_header LakeofRageMagikarpHouse, $5, 3, LAKE_OF_RAGE, MUSIC_LAKE_OF_RAGE, 1, 1
	map_header Route43MahoganyGate, $8, 6, ROUTE_43, MUSIC_LAKE_OF_RAGE, 1, 1
	map_header Route43Gate, $8, 6, ROUTE_43, MUSIC_LAKE_OF_RAGE, 1, 1
	map_header Route43, $1, 2, ROUTE_43, MUSIC_LAKE_OF_RAGE, 0, 4
	map_header LakeofRage, $1, 1, LAKE_OF_RAGE, MUSIC_LAKE_OF_RAGE, 0, 8


MapGroup10:
	map_header Route32, $1, 2, ROUTE_32, MUSIC_ROUTE_30, 0, 11
	map_header Route35, $1, 2, ROUTE_35, MUSIC_ROUTE_36, 0, 4
	map_header Route36, $1, 2, ROUTE_36, MUSIC_ROUTE_36, 0, 1
	map_header Route37, $1, 2, ROUTE_37, MUSIC_ROUTE_36, 0, 1
	map_header VioletCity, $1, 1, VIOLET_CITY, MUSIC_VIOLET_CITY, 0, 4
	map_header VioletMart, $c, 3, VIOLET_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header VioletGym, $f, 3, VIOLET_CITY, MUSIC_GYM, 17, 1
	map_header EarlsPokemonAcademy, $a, 3, VIOLET_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header VioletNicknameSpeechHouse, $10, 3, VIOLET_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header VioletPokeCenter1F, $7, 3, VIOLET_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header VioletOnixTradeHouse, $10, 3, VIOLET_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header Route32RuinsofAlphGate, $8, 6, ROUTE_32, MUSIC_ROUTE_30, 1, 1
	map_header Route32PokeCenter1F, $7, 3, ROUTE_32, MUSIC_POKEMON_CENTER, 1, 1
	map_header Route35Goldenrodgate, $8, 6, ROUTE_35, MUSIC_ROUTE_36, 1, 1
	map_header Route35NationalParkgate, $8, 3, ROUTE_35, MUSIC_GOLDENROD_CITY, 1, 1
	map_header Route36RuinsofAlphgate, $8, 6, ROUTE_36, MUSIC_ROUTE_36, 1, 1
	map_header Route36NationalParkgate, $8, 3, ROUTE_36, MUSIC_GOLDENROD_CITY, 1, 1


MapGroup11:
	map_header Route34, $2, 2, ROUTE_34, MUSIC_ROUTE_36, 0, 1
	map_header GoldenrodCity, $2, 1, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1
	map_header GoldenrodGym, $f, 3, GOLDENROD_CITY, MUSIC_GYM, 17, 1
	map_header GoldenrodBikeShop, $12, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodHappinessRater, $5, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodBillsHouse, $5, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodMagnetTrainStation, $11, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodFlowerShop, $5, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodPPSpeechHouse, $5, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodNameRatersHouse, $5, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodDeptStore1F, $c, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodDeptStore2F, $c, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodDeptStore3F, $c, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodDeptStore4F, $c, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodDeptStore5F, $c, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodDeptStore6F, $c, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodDeptStoreElevator, $c, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodDeptStoreRoof, $c, 3, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
	map_header GoldenrodGameCorner, $e, 3, GOLDENROD_CITY, MUSIC_GAME_CORNER, 1, 1
	map_header GoldenrodPokeCenter1F, $7, 3, GOLDENROD_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header GoldenrodPokeComCenter2FMobile, $15, 3, GOLDENROD_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header IlexForestAzaleaGate, $8, 6, ROUTE_34, MUSIC_ROUTE_36, 1, 1
	map_header Route34IlexForestGate, $8, 6, ROUTE_34, MUSIC_ROUTE_36, 1, 1
	map_header DayCare, $5, 3, ROUTE_34, MUSIC_AZALEA_TOWN, 1, 1


MapGroup12:
	map_header Route6, $3, 2, ROUTE_6, MUSIC_ROUTE_3, 0, 4
	map_header Route11, $3, 2, ROUTE_11, MUSIC_ROUTE_12, 0, 1
	map_header VermilionCity, $3, 1, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 2
	map_header VermilionHouseFishingSpeechHouse, $5, 3, VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
	map_header VermilionPokeCenter1F, $7, 3, VERMILION_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header VermilionPokeCenter2FBeta, $7, 3, VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
	map_header PokemonFanClub, $5, 3, VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
	map_header VermilionMagnetTrainSpeechHouse, $5, 3, VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
	map_header VermilionMart, $c, 3, VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
	map_header VermilionHouseDiglettsCaveSpeechHouse, $5, 3, VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
	map_header VermilionGym, $e, 3, VERMILION_CITY, MUSIC_GYM, 17, 1
	map_header Route6SaffronGate, $8, 6, ROUTE_6, MUSIC_ROUTE_3, 1, 1
	map_header Route6UndergroundEntrance, $8, 6, ROUTE_6, MUSIC_ROUTE_3, 1, 1


MapGroup13:
	map_header Route1, $3, 2, ROUTE_1, MUSIC_ROUTE_1, 0, 1
	map_header PalletTown, $3, 1, PALLET_TOWN, MUSIC_PALLET_TOWN, 0, 2
	map_header RedsHouse1F, $6, 3, PALLET_TOWN, MUSIC_PALLET_TOWN, 1, 1
	map_header RedsHouse2F, $6, 3, PALLET_TOWN, MUSIC_PALLET_TOWN, 1, 1
	map_header BluesHouse, $5, 3, PALLET_TOWN, MUSIC_PALLET_TOWN, 1, 1
	map_header OaksLab, $a, 3, PALLET_TOWN, MUSIC_POKEMON_TALK, 1, 1


MapGroup14:
	map_header Route3, $3, 2, ROUTE_3, MUSIC_ROUTE_3, 0, 1
	map_header PewterCity, $3, 1, PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 0, 1
	map_header PewterNidoranSpeechHouse, $5, 3, PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header PewterGym, $17, 3, PEWTER_CITY, MUSIC_GYM, 17, 1
	map_header PewterMart, $c, 3, PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header PewterPokeCenter1F, $7, 3, PEWTER_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header PewterPokeCEnter2FBeta, $7, 3, PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header PewterSnoozeSpeechHouse, $5, 3, PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 1, 1


MapGroup15:
	map_header OlivinePort, $9, 2, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 2
	map_header VermilionPort, $9, 2, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 2
	map_header FastShip1F, $13, 3, FAST_SHIP, MUSIC_SS_AQUA, 1, 1
	map_header FastShipCabins_NNW_NNE_NE, $13, 3, FAST_SHIP, MUSIC_SS_AQUA, 1, 1
	map_header FastShipCabins_SW_SSW_NW, $13, 3, FAST_SHIP, MUSIC_SS_AQUA, 1, 1
	map_header FastShipCabins_SE_SSE_CaptainsCabin, $13, 3, FAST_SHIP, MUSIC_SS_AQUA, 1, 1
	map_header FastShipB1F, $13, 3, FAST_SHIP, MUSIC_SS_AQUA, 1, 1
	map_header OlivinePortPassage, $1c, 3, OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
	map_header VermilionPortPassage, $1c, 3, VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
	map_header MountMoonSquare, $3, 2, MT_MOON, MUSIC_MT_MOON_SQUARE, 0, 1
	map_header MountMoonGiftShop, $10, 3, MT_MOON, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header TinTowerRoof, $17, 2, TIN_TOWER, MUSIC_TIN_TOWER, 0, 1


MapGroup16:
	map_header Route23, $3, 1, ROUTE_23, MUSIC_INDIGO_PLATEAU, 0, 1
	map_header IndigoPlateauPokeCenter1F, $7, 3, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 1, 1
	map_header WillsRoom, $f, 3, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 17, 1
	map_header KogasRoom, $f, 3, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 17, 1
	map_header BrunosRoom, $f, 3, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 17, 1
	map_header KarensRoom, $f, 3, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 17, 1
	map_header LancesRoom, $12, 3, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 17, 1
	map_header HallOfFame, $1d, 3, INDIGO_PLATEAU, MUSIC_NEW_BARK_TOWN, 17, 1


MapGroup17:
	map_header Route13, $3, 2, ROUTE_13, MUSIC_ROUTE_12, 0, 13
	map_header Route14, $3, 2, ROUTE_14, MUSIC_ROUTE_12, 0, 1
	map_header Route15, $3, 2, ROUTE_15, MUSIC_ROUTE_12, 0, 1
	map_header Route18, $3, 2, ROUTE_18, MUSIC_ROUTE_3, 0, 1
	map_header FuchsiaCity, $3, 1, FUCHSIA_CITY, MUSIC_CELADON_CITY, 0, 8
	map_header FuchsiaMart, $c, 3, FUCHSIA_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header SafariZoneMainOffice, $e, 3, FUCHSIA_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header FuchsiaGym, $a, 3, FUCHSIA_CITY, MUSIC_GYM, 17, 1
	map_header FuchsiaBillSpeechHouse, $5, 3, FUCHSIA_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header FuchsiaPokeCenter1F, $7, 3, FUCHSIA_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header FuchsiaPokeCenter2FBeta, $7, 3, FUCHSIA_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header SafariZoneWardensHome, $5, 3, FUCHSIA_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header Route15FuchsiaGate, $8, 6, ROUTE_15, MUSIC_ROUTE_12, 1, 1


MapGroup18:
	map_header Route8, $3, 2, ROUTE_8, MUSIC_ROUTE_3, 0, 1
	map_header Route12, $3, 2, ROUTE_12, MUSIC_ROUTE_12, 0, 13
	map_header Route10South, $3, 2, ROUTE_10, MUSIC_ROUTE_3, 0, 3
	map_header LavenderTown, $3, 1, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 0, 1
	map_header LavenderPokeCenter1F, $7, 3, LAVENDER_TOWN, MUSIC_POKEMON_CENTER, 1, 1
	map_header LavenderPokeCenter2FBeta, $7, 3, LAVENDER_TOWN, MUSIC_POKEMON_CENTER, 1, 1
	map_header MrFujisHouse, $5, 3, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 1, 1
	map_header LavenderTownSpeechHouse, $5, 3, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 1, 1
	map_header LavenderNameRater, $5, 3, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 1, 1
	map_header LavenderMart, $c, 3, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 1, 1
	map_header SoulHouse, $5, 3, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 1, 1
	map_header LavRadioTower1F, $1b, 3, LAV_RADIO_TOWER, MUSIC_LAVENDER_TOWN, 1, 1
	map_header Route8SaffronGate, $8, 6, ROUTE_8, MUSIC_ROUTE_3, 1, 1
	map_header Route12SuperRodHouse, $5, 3, ROUTE_12, MUSIC_VIRIDIAN_CITY, 1, 1


MapGroup19:
	map_header Route28, $3, 2, ROUTE_28, MUSIC_INDIGO_PLATEAU, 0, 4
	map_header SilverCaveOutside, $3, 1, SILVER_CAVE, MUSIC_INDIGO_PLATEAU, 0, 4
	map_header SilverCavePokeCenter1F, $7, 3, SILVER_CAVE, MUSIC_POKEMON_CENTER, 1, 1
	map_header Route28FamousSpeechHouse, $5, 3, ROUTE_28, MUSIC_AZALEA_TOWN, 1, 1


MapGroup20:
	map_header PokeCenter2F, $7, 3, SPECIAL_MAP, MUSIC_POKEMON_CENTER, 17, 1
	map_header TradeCenter, $8, 3, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 17, 1
	map_header Colosseum, $8, 3, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 17, 1
	map_header TimeCapsule, $8, 3, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 17, 1
	map_header MobileTradeRoomMobile, $d, 3, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 17, 1
	map_header MobileBattleRoom, $d, 3, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 17, 1


MapGroup21:
	map_header Route7, $3, 2, ROUTE_7, MUSIC_ROUTE_3, 0, 1
	map_header Route16, $3, 2, ROUTE_16, MUSIC_ROUTE_3, 0, 1
	map_header Route17, $3, 2, ROUTE_17, MUSIC_ROUTE_3, 0, 0
	map_header CeladonCity, $3, 1, CELADON_CITY, MUSIC_CELADON_CITY, 0, 0
	map_header CeladonDeptStore1F, $c, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonDeptStore2F, $c, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonDeptStore3F, $c, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonDeptStore4F, $c, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonDeptStore5F, $c, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonDeptStore6F, $c, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonDeptStoreElevator, $c, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonMansion1F, $d, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonMansion2F, $d, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonMansion3F, $d, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonMansionRoof, $d, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonMansionRoofHouse, $5, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonPokeCenter1F, $7, 3, CELADON_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header CeladonPokeCenter2FBeta, $7, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonGameCorner, $e, 3, CELADON_CITY, MUSIC_GAME_CORNER, 1, 1
	map_header CeladonGameCornerPrizeRoom, $e, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header CeladonGym, $11, 3, CELADON_CITY, MUSIC_GYM, 17, 1
	map_header CeladonCafe, $e, 3, CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
	map_header Route16FuchsiaSpeechHouse, $5, 3, ROUTE_16, MUSIC_CELADON_CITY, 1, 1
	map_header Route16Gate, $8, 6, ROUTE_16, MUSIC_ROUTE_3, 1, 1
	map_header Route7SaffronGate, $8, 6, ROUTE_7, MUSIC_ROUTE_3, 1, 1
	map_header Route1718Gate, $8, 6, ROUTE_17, MUSIC_ROUTE_3, 1, 1


MapGroup22:
	map_header Route40, $1, 2, ROUTE_40, MUSIC_ROUTE_36, 0, 1
	map_header Route41, $1, 2, ROUTE_41, MUSIC_ROUTE_36, 0, 2
	map_header CianwoodCity, $1, 1, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 0, 1
	map_header ManiasHouse, $5, 3, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header CianwoodGym, $17, 3, CIANWOOD_CITY, MUSIC_GYM, 17, 1
	map_header CianwoodPokeCenter1F, $7, 3, CIANWOOD_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header CianwoodPharmacy, $5, 3, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header CianwoodCityPhotoStudio, $5, 3, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header CianwoodLugiaSpeechHouse, $5, 3, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header PokeSeersHouse, $5, 3, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
	map_header BattleTower1F, $16, 3, BATTLE_TOWER, MUSIC_BATTLE_TOWER_LOBBY, 17, 1
	map_header BattleTowerBattleRoom, $16, 3, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, 17, 1
	map_header BattleTowerElevator, $16, 3, BATTLE_TOWER, MUSIC_NONE, 17, 1
	map_header BattleTowerHallway, $16, 3, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, 17, 1
	map_header Route40BattleTowerGate, $8, 6, BATTLE_TOWER, MUSIC_ROUTE_36, 1, 1
	map_header BattleTowerOutside, $4, 2, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, 0, 1


MapGroup23:
	map_header Route2, $3, 2, ROUTE_2, MUSIC_ROUTE_2, 0, 1
	map_header Route22, $3, 2, ROUTE_22, MUSIC_ROUTE_3, 0, 4
	map_header ViridianCity, $3, 1, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 4
	map_header ViridianGym, $11, 3, VIRIDIAN_CITY, MUSIC_GYM, 17, 1
	map_header ViridianNicknameSpeechHouse, $5, 3, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header TrainerHouse1F, $5, 3, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header TrainerHouseB1F, $b, 3, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header ViridianMart, $c, 3, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header ViridianPokeCenter1F, $7, 3, VIRIDIAN_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header ViridianPokeCenter2FBeta, $7, 3, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header Route2NuggetSpeechHouse, $5, 3, ROUTE_2, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header Route2Gate, $8, 6, ROUTE_2, MUSIC_ROUTE_2, 1, 1
	map_header VictoryRoadGate, $8, 6, ROUTE_26, MUSIC_INDIGO_PLATEAU, 1, 1


MapGroup24:
	map_header Route26, $1, 2, ROUTE_26, MUSIC_ROUTE_26, 0, 2
	map_header Route27, $1, 2, ROUTE_27, MUSIC_ROUTE_26, 0, 2
	map_header Route29, $1, 2, ROUTE_29, MUSIC_ROUTE_29, 0, 1
	map_header NewBarkTown, $1, 1, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 0, 2
	map_header ElmsLab, $a, 3, NEW_BARK_TOWN, MUSIC_PROF_ELM, 1, 1
	map_header KrissHouse1F, $6, 3, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 1, 1
	map_header KrissHouse2F, $14, 3, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 1, 1
	map_header KrissNeighborsHouse, $5, 3, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 1, 1
	map_header ElmsHouse, $6, 3, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 1, 1
	map_header Route26HealSpeechHouse, $5, 3, ROUTE_26, MUSIC_AZALEA_TOWN, 1, 1
	map_header Route26DayofWeekSiblingsHouse, $5, 3, ROUTE_26, MUSIC_AZALEA_TOWN, 1, 1
	map_header Route27SandstormHouse, $5, 3, ROUTE_27, MUSIC_AZALEA_TOWN, 1, 1
	map_header Route2946Gate, $8, 6, ROUTE_29, MUSIC_ROUTE_29, 1, 1


MapGroup25:
	map_header Route5, $3, 2, ROUTE_5, MUSIC_ROUTE_3, 0, 1
	map_header SaffronCity, $3, 1, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 1
	map_header FightingDojo, $11, 3, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header SaffronGym, $1c, 3, SAFFRON_CITY, MUSIC_GYM, 17, 1
	map_header SaffronMart, $c, 3, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header SaffronPokeCenter1F, $7, 3, SAFFRON_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header SaffronPokeCenter2FBeta, $7, 3, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header MrPsychicsHouse, $5, 3, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header SaffronTrainStation, $11, 3, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header SilphCo1F, $b, 3, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header CopycatsHouse1F, $6, 3, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header CopycatsHouse2F, $6, 3, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header Route5UndergroundEntrance, $8, 6, ROUTE_5, MUSIC_ROUTE_3, 1, 1
	map_header Route5SaffronCityGate, $8, 6, ROUTE_5, MUSIC_VIRIDIAN_CITY, 1, 1
	map_header Route5CleanseTagSpeechHouse, $5, 3, ROUTE_5, MUSIC_VIRIDIAN_CITY, 1, 1


MapGroup26:
	map_header Route30, $1, 2, ROUTE_30, MUSIC_ROUTE_30, 0, 4
	map_header Route31, $1, 2, ROUTE_31, MUSIC_ROUTE_30, 0, 4
	map_header CherrygroveCity, $1, 1, CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 0, 1
	map_header CherrygroveMart, $c, 3, CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 1, 1
	map_header CherrygrovePokeCenter1F, $7, 3, CHERRYGROVE_CITY, MUSIC_POKEMON_CENTER, 1, 1
	map_header CherrygroveGymSpeechHouse, $5, 3, CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 1, 1
	map_header GuideGentsHouse, $5, 3, CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 1, 1
	map_header CherrygroveEvolutionSpeechHouse, $5, 3, CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 1, 1
	map_header Route30BerrySpeechHouse, $5, 3, ROUTE_30, MUSIC_CHERRYGROVE_CITY, 1, 1
	map_header MrPokemonsHouse, $b, 3, ROUTE_30, MUSIC_CHERRYGROVE_CITY, 1, 1
	map_header Route31VioletGate, $8, 6, ROUTE_31, MUSIC_ROUTE_30, 1, 1
