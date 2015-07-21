
MapGroupPointers::
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
	map_header OlivinePokeCenter1F, $7, INDOOR, OLIVINE_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header OlivineGym, $12, INDOOR, OLIVINE_CITY, MUSIC_GYM, 1, 1, 1
	map_header OlivineVoltorbHouse, $5, INDOOR, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header OlivineHouseBeta, $5, INDOOR, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header OlivinePunishmentSpeechHouse, $5, INDOOR, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header OlivineGoodRodHouse, $5, INDOOR, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header OlivineCafe, $e, INDOOR, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header OlivineMart, $c, INDOOR, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header Route38EcruteakGate, $8, GATE, ROUTE_38, MUSIC_ROUTE_37, 0, 1, 1
	map_header Route39Barn, $10, INDOOR, ROUTE_39, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header Route39Farmhouse, $5, INDOOR, ROUTE_39, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header Route38, $1, ROUTE, ROUTE_38, MUSIC_ROUTE_37, 0, 0, 1
	map_header Route39, $1, ROUTE, ROUTE_39, MUSIC_ROUTE_37, 0, 0, 1
	map_header OlivineCity, $1, TOWN, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 0, 1


MapGroup2:
	map_header MahoganyRedGyaradosSpeechHouse, $5, INDOOR, MAHOGANY_TOWN, MUSIC_CHERRYGROVE_CITY, 0, 1, 1
	map_header MahoganyGym, $f, INDOOR, MAHOGANY_TOWN, MUSIC_GYM, 1, 1, 1
	map_header MahoganyPokeCenter1F, $7, INDOOR, MAHOGANY_TOWN, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header Route42EcruteakGate, $8, GATE, ROUTE_42, MUSIC_LAKE_OF_RAGE, 0, 1, 1
	map_header Route42, $1, ROUTE, ROUTE_42, MUSIC_LAKE_OF_RAGE, 0, 0, 3
	map_header Route44, $1, ROUTE, ROUTE_44, MUSIC_LAKE_OF_RAGE, 0, 0, 4
	map_header MahoganyTown, $1, TOWN, MAHOGANY_TOWN, MUSIC_CHERRYGROVE_CITY, 0, 0, 1


MapGroup3:
	map_header SproutTower1F, $17, DUNGEON, SPROUT_TOWER, MUSIC_SPROUT_TOWER, 0, 1, 1
	map_header SproutTower2F, $17, DUNGEON, SPROUT_TOWER, MUSIC_SPROUT_TOWER, 0, 1, 1
	map_header SproutTower3F, $17, DUNGEON, SPROUT_TOWER, MUSIC_SPROUT_TOWER, 0, 1, 1
	map_header TinTower1F, $17, DUNGEON, TIN_TOWER, MUSIC_TIN_TOWER, 0, 1, 1
	map_header TinTower2F, $17, DUNGEON, TIN_TOWER, MUSIC_TIN_TOWER, 0, 1, 1
	map_header TinTower3F, $17, DUNGEON, TIN_TOWER, MUSIC_TIN_TOWER, 0, 1, 1
	map_header TinTower4F, $17, DUNGEON, TIN_TOWER, MUSIC_TIN_TOWER, 0, 1, 1
	map_header TinTower5F, $17, DUNGEON, TIN_TOWER, MUSIC_TIN_TOWER, 0, 1, 1
	map_header TinTower6F, $17, DUNGEON, TIN_TOWER, MUSIC_TIN_TOWER, 0, 1, 1
	map_header TinTower7F, $17, DUNGEON, TIN_TOWER, MUSIC_TIN_TOWER, 0, 1, 1
	map_header TinTower8F, $17, DUNGEON, TIN_TOWER, MUSIC_TIN_TOWER, 0, 1, 1
	map_header TinTower9F, $17, DUNGEON, TIN_TOWER, MUSIC_TIN_TOWER, 0, 1, 1
	map_header BurnedTower1F, $17, DUNGEON, BURNED_TOWER, MUSIC_BURNED_TOWER, 1, 2, 1
	map_header BurnedTowerB1F, $18, CAVE, BURNED_TOWER, MUSIC_BURNED_TOWER, 1, 2, 1
	map_header NationalPark, $19, ROUTE, NATIONAL_PARK, MUSIC_NATIONAL_PARK, 0, 0, 1
	map_header NationalParkBugContest, $19, ROUTE, NATIONAL_PARK, MUSIC_BUG_CATCHING_CONTEST, 0, 0, 1
	map_header RadioTower1F, $1b, INDOOR, RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 1, 1, 1
	map_header RadioTower2F, $1b, INDOOR, RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 1, 1, 1
	map_header RadioTower3F, $1b, INDOOR, RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 1, 1, 1
	map_header RadioTower4F, $1b, INDOOR, RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 1, 1, 1
	map_header RadioTower5F, $1b, INDOOR, RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 1, 1, 1
	map_header RuinsofAlphOutside, $1, ROUTE, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 0, 0, 4
	map_header RuinsofAlphHoOhChamber, $1a, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphKabutoChamber, $1a, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphOmanyteChamber, $1a, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphAerodactylChamber, $1a, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphInnerChamber, $1a, DUNGEON, RUINS_OF_ALPH, MUSIC_RUINS_OF_ALPH_INTERIOR, 1, 1, 1
	map_header RuinsofAlphResearchCenter, $b, INDOOR, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 0, 1, 1
	map_header RuinsofAlphHoOhItemRoom, $1a, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphKabutoItemRoom, $1a, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphOmanyteItemRoom, $1a, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphAerodactylItemRoom, $1a, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphHoOhWordRoom, $21, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphKabutoWordRoom, $22, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphOmanyteWordRoom, $23, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header RuinsofAlphAerodactylWordRoom, $24, DUNGEON, RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1, 1
	map_header UnionCave1F, $18, CAVE, UNION_CAVE, MUSIC_UNION_CAVE, 1, 2, 3
	map_header UnionCaveB1F, $18, CAVE, UNION_CAVE, MUSIC_UNION_CAVE, 1, 2, 3
	map_header UnionCaveB2F, $18, CAVE, UNION_CAVE, MUSIC_UNION_CAVE, 1, 2, 1
	map_header SlowpokeWellB1F, $18, CAVE, SLOWPOKE_WELL, MUSIC_DARK_CAVE, 1, 2, 3
	map_header SlowpokeWellB2F, $18, CAVE, SLOWPOKE_WELL, MUSIC_DARK_CAVE, 1, 2, 3
	map_header OlivineLighthouse1F, $13, DUNGEON, LIGHTHOUSE, MUSIC_LIGHTHOUSE, 0, 1, 1
	map_header OlivineLighthouse2F, $13, DUNGEON, LIGHTHOUSE, MUSIC_LIGHTHOUSE, 0, 1, 1
	map_header OlivineLighthouse3F, $13, DUNGEON, LIGHTHOUSE, MUSIC_LIGHTHOUSE, 0, 1, 1
	map_header OlivineLighthouse4F, $13, DUNGEON, LIGHTHOUSE, MUSIC_LIGHTHOUSE, 0, 1, 1
	map_header OlivineLighthouse5F, $13, DUNGEON, LIGHTHOUSE, MUSIC_LIGHTHOUSE, 0, 1, 1
	map_header OlivineLighthouse6F, $13, DUNGEON, LIGHTHOUSE, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header MahoganyMart1F, $10, INDOOR, MAHOGANY_TOWN, MUSIC_MAHOGANY_MART, 1, 1, 1
	map_header TeamRocketBaseB1F, $1c, DUNGEON, MAHOGANY_TOWN, MUSIC_ROCKET_HIDEOUT, 1, 1, 1
	map_header TeamRocketBaseB2F, $b, DUNGEON, MAHOGANY_TOWN, MUSIC_ROCKET_HIDEOUT, 1, 1, 1
	map_header TeamRocketBaseB3F, $b, DUNGEON, MAHOGANY_TOWN, MUSIC_ROCKET_HIDEOUT, 1, 1, 1
	map_header IlexForest, $1f, CAVE, ILEX_FOREST, MUSIC_UNION_CAVE, 0, 2, 4
	map_header WarehouseEntrance, $8, DUNGEON, GOLDENROD_CITY, MUSIC_UNION_CAVE, 1, 1, 1
	map_header UndergroundPathSwitchRoomEntrances, $f, DUNGEON, GOLDENROD_CITY, MUSIC_UNION_CAVE, 1, 1, 1
	map_header GoldenrodDeptStoreB1F, $1c, DUNGEON, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1, 1
	map_header UndergroundWarehouse, $1c, DUNGEON, GOLDENROD_CITY, MUSIC_UNION_CAVE, 1, 1, 1
	map_header MountMortar1FOutside, $1e, CAVE, MT_MORTAR, MUSIC_UNION_CAVE, 1, 2, 3
	map_header MountMortar1FInside, $1e, CAVE, MT_MORTAR, MUSIC_UNION_CAVE, 1, 2, 3
	map_header MountMortar2FInside, $1e, CAVE, MT_MORTAR, MUSIC_UNION_CAVE, 1, 2, 3
	map_header MountMortarB1F, $1e, CAVE, MT_MORTAR, MUSIC_UNION_CAVE, 1, 2, 3
	map_header IcePath1F, $1d, CAVE, ICE_PATH, MUSIC_DARK_CAVE, 1, 2, 5
	map_header IcePathB1F, $1d, CAVE, ICE_PATH, MUSIC_DARK_CAVE, 1, 2, 5
	map_header IcePathB2FMahoganySide, $1d, CAVE, ICE_PATH, MUSIC_DARK_CAVE, 1, 2, 5
	map_header IcePathB2FBlackthornSide, $1d, CAVE, ICE_PATH, MUSIC_DARK_CAVE, 1, 2, 5
	map_header IcePathB3F, $1d, CAVE, ICE_PATH, MUSIC_DARK_CAVE, 1, 2, 5
	map_header WhirlIslandNW, $1e, CAVE, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 1, 4, 10
	map_header WhirlIslandNE, $1e, CAVE, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 1, 4, 10
	map_header WhirlIslandSW, $1e, CAVE, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 1, 4, 10
	map_header WhirlIslandCave, $1e, CAVE, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 1, 4, 10
	map_header WhirlIslandSE, $1e, CAVE, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 1, 4, 10
	map_header WhirlIslandB1F, $1e, CAVE, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 1, 4, 10
	map_header WhirlIslandB2F, $1e, CAVE, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 1, 4, 10
	map_header WhirlIslandLugiaChamber, $1e, CAVE, WHIRL_ISLANDS, MUSIC_UNION_CAVE, 1, 4, 10
	map_header SilverCaveRoom1, $1e, CAVE, SILVER_CAVE, MUSIC_LIGHTHOUSE, 1, 4, 3
	map_header SilverCaveRoom2, $18, CAVE, SILVER_CAVE, MUSIC_LIGHTHOUSE, 1, 2, 3
	map_header SilverCaveRoom3, $18, CAVE, SILVER_CAVE, MUSIC_LIGHTHOUSE, 1, 1, 3
	map_header SilverCaveItemRooms, $18, CAVE, SILVER_CAVE, MUSIC_LIGHTHOUSE, 1, 2, 3
	map_header DarkCaveVioletEntrance, $1e, CAVE, DARK_CAVE, MUSIC_DARK_CAVE, 1, 4, 3
	map_header DarkCaveBlackthornEntrance, $1e, CAVE, DARK_CAVE, MUSIC_DARK_CAVE, 1, 4, 3
	map_header DragonsDen1F, $18, CAVE, DRAGONS_DEN, MUSIC_DRAGONS_DEN, 1, 2, 5
	map_header DragonsDenB1F, $1, CAVE, DRAGONS_DEN, MUSIC_DRAGONS_DEN, 1, 2, 5
	map_header DragonShrine, $a, INDOOR, DRAGONS_DEN, MUSIC_DRAGONS_DEN, 1, 2, 1
	map_header TohjoFalls, $18, CAVE, TOHJO_FALLS, MUSIC_UNION_CAVE, 1, 2, 3
	map_header DiglettsCave, $18, CAVE, DIGLETTS_CAVE, MUSIC_MT_MOON, 1, 2, 1
	map_header MountMoon, $18, CAVE, MT_MOON, MUSIC_MT_MOON, 1, 2, 1
	map_header Underground, $1c, GATE, UNDERGROUND, MUSIC_MT_MOON, 0, 2, 1
	map_header RockTunnel1F, $1e, CAVE, ROCK_TUNNEL, MUSIC_MT_MOON, 1, 4, 1
	map_header RockTunnelB1F, $1e, CAVE, ROCK_TUNNEL, MUSIC_MT_MOON, 1, 4, 1
	map_header SafariZoneFuchsiaGateBeta, $8, INDOOR, FUCHSIA_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header SafariZoneBeta, $19, CAVE, FUCHSIA_CITY, MUSIC_EVOLUTION, 0, 0, 1
	map_header VictoryRoad, $18, CAVE, VICTORY_ROAD, MUSIC_VICTORY_ROAD, 1, 2, 1


MapGroup4:
	map_header EcruteakHouse, $17, INDOOR, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header WiseTriosRoom, $10, INDOOR, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 1, 1, 1
	map_header EcruteakPokeCenter1F, $7, INDOOR, ECRUTEAK_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header EcruteakLugiaSpeechHouse, $10, INDOOR, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header DanceTheatre, $10, INDOOR, ECRUTEAK_CITY, MUSIC_DANCING_HALL, 0, 1, 1
	map_header EcruteakMart, $c, INDOOR, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header EcruteakGym, $17, INDOOR, ECRUTEAK_CITY, MUSIC_GYM, 1, 1, 1
	map_header EcruteakItemfinderHouse, $10, INDOOR, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header EcruteakCity, $1, TOWN, ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 0, 0, 4


MapGroup5:
	map_header BlackthornGym1F, $f, INDOOR, BLACKTHORN_CITY, MUSIC_GYM, 1, 1, 1
	map_header BlackthornGym2F, $f, INDOOR, BLACKTHORN_CITY, MUSIC_GYM, 1, 1, 1
	map_header BlackthornDragonSpeechHouse, $5, INDOOR, BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 0, 1, 1
	map_header BlackthornDodrioTradeHouse, $5, INDOOR, BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 0, 1, 1
	map_header BlackthornMart, $c, INDOOR, BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 0, 1, 1
	map_header BlackthornPokeCenter1F, $7, INDOOR, BLACKTHORN_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header MoveDeletersHouse, $5, INDOOR, BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 0, 1, 1
	map_header Route45, $1, ROUTE, ROUTE_45, MUSIC_ROUTE_36, 0, 0, 9
	map_header Route46, $1, ROUTE, ROUTE_46, MUSIC_ROUTE_36, 0, 0, 1
	map_header BlackthornCity, $1, TOWN, BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 0, 0, 4


MapGroup6:
	map_header CinnabarPokeCenter1F, $7, INDOOR, CINNABAR_ISLAND, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header CinnabarPokeCenter2FBeta, $7, INDOOR, CINNABAR_ISLAND, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header Route19FuchsiaGate, $8, GATE, ROUTE_19, MUSIC_ROUTE_3, 0, 1, 1
	map_header SeafoamGym, $18, INDOOR, SEAFOAM_ISLANDS, MUSIC_GYM, 1, 1, 1
	map_header Route19, $3, ROUTE, ROUTE_19, MUSIC_ROUTE_3, 0, 0, 1
	map_header Route20, $3, ROUTE, ROUTE_20, MUSIC_ROUTE_3, 0, 0, 2
	map_header Route21, $3, ROUTE, ROUTE_21, MUSIC_ROUTE_3, 0, 0, 2
	map_header CinnabarIsland, $3, TOWN, CINNABAR_ISLAND, MUSIC_VIRIDIAN_CITY, 0, 0, 2


MapGroup7:
	map_header CeruleanGymBadgeSpeechHouse, $5, INDOOR, CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header CeruleanPoliceStation, $5, INDOOR, CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header CeruleanTradeSpeechHouse, $5, INDOOR, CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header CeruleanPokeCenter1F, $7, INDOOR, CERULEAN_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header CeruleanPokeCenter2FBeta, $7, INDOOR, CERULEAN_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header CeruleanGym, $9, INDOOR, CERULEAN_CITY, MUSIC_GYM, 1, 1, 0
	map_header CeruleanMart, $c, INDOOR, CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header Route10PokeCenter1F, $7, INDOOR, ROUTE_10, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header Route10PokeCenter2FBeta, $7, INDOOR, ROUTE_10, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header PowerPlant, $b, INDOOR, POWER_PLANT, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header BillsHouse, $5, INDOOR, ROUTE_25, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header Route4, $3, ROUTE, ROUTE_4, MUSIC_ROUTE_3, 0, 0, 0
	map_header Route9, $3, ROUTE, ROUTE_9, MUSIC_ROUTE_3, 0, 0, 3
	map_header Route10North, $3, ROUTE, ROUTE_10, MUSIC_ROUTE_3, 0, 0, 3
	map_header Route24, $3, ROUTE, ROUTE_24, MUSIC_ROUTE_3, 0, 0, 3
	map_header Route25, $3, ROUTE, ROUTE_25, MUSIC_ROUTE_3, 0, 0, 3
	map_header CeruleanCity, $3, TOWN, CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 0, 0


MapGroup8:
	map_header AzaleaPokeCenter1F, $7, INDOOR, AZALEA_TOWN, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header CharcoalKiln, $5, INDOOR, AZALEA_TOWN, MUSIC_AZALEA_TOWN, 0, 1, 1
	map_header AzaleaMart, $c, INDOOR, AZALEA_TOWN, MUSIC_AZALEA_TOWN, 0, 1, 1
	map_header KurtsHouse, $10, INDOOR, AZALEA_TOWN, MUSIC_AZALEA_TOWN, 0, 1, 1
	map_header AzaleaGym, $f, INDOOR, AZALEA_TOWN, MUSIC_GYM, 1, 1, 1
	map_header Route33, $2, ROUTE, ROUTE_33, MUSIC_ROUTE_30, 0, 0, 1
	map_header AzaleaTown, $2, TOWN, AZALEA_TOWN, MUSIC_AZALEA_TOWN, 0, 0, 1


MapGroup9:
	map_header LakeofRageHiddenPowerHouse, $5, INDOOR, LAKE_OF_RAGE, MUSIC_LAKE_OF_RAGE, 0, 1, 1
	map_header LakeofRageMagikarpHouse, $5, INDOOR, LAKE_OF_RAGE, MUSIC_LAKE_OF_RAGE, 0, 1, 1
	map_header Route43MahoganyGate, $8, GATE, ROUTE_43, MUSIC_LAKE_OF_RAGE, 0, 1, 1
	map_header Route43Gate, $8, GATE, ROUTE_43, MUSIC_LAKE_OF_RAGE, 0, 1, 1
	map_header Route43, $1, ROUTE, ROUTE_43, MUSIC_LAKE_OF_RAGE, 0, 0, 4
	map_header LakeofRage, $1, TOWN, LAKE_OF_RAGE, MUSIC_LAKE_OF_RAGE, 0, 0, 8


MapGroup10:
	map_header Route32, $1, ROUTE, ROUTE_32, MUSIC_ROUTE_30, 0, 0, 11
	map_header Route35, $1, ROUTE, ROUTE_35, MUSIC_ROUTE_36, 0, 0, 4
	map_header Route36, $1, ROUTE, ROUTE_36, MUSIC_ROUTE_36, 0, 0, 1
	map_header Route37, $1, ROUTE, ROUTE_37, MUSIC_ROUTE_36, 0, 0, 1
	map_header VioletCity, $1, TOWN, VIOLET_CITY, MUSIC_VIOLET_CITY, 0, 0, 4
	map_header VioletMart, $c, INDOOR, VIOLET_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header VioletGym, $f, INDOOR, VIOLET_CITY, MUSIC_GYM, 1, 1, 1
	map_header EarlsPokemonAcademy, $a, INDOOR, VIOLET_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header VioletNicknameSpeechHouse, $10, INDOOR, VIOLET_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header VioletPokeCenter1F, $7, INDOOR, VIOLET_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header VioletOnixTradeHouse, $10, INDOOR, VIOLET_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header Route32RuinsofAlphGate, $8, GATE, ROUTE_32, MUSIC_ROUTE_30, 0, 1, 1
	map_header Route32PokeCenter1F, $7, INDOOR, ROUTE_32, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header Route35Goldenrodgate, $8, GATE, ROUTE_35, MUSIC_ROUTE_36, 0, 1, 1
	map_header Route35NationalParkgate, $8, INDOOR, ROUTE_35, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header Route36RuinsofAlphgate, $8, GATE, ROUTE_36, MUSIC_ROUTE_36, 0, 1, 1
	map_header Route36NationalParkgate, $8, INDOOR, ROUTE_36, MUSIC_GOLDENROD_CITY, 0, 1, 1


MapGroup11:
	map_header Route34, $2, ROUTE, ROUTE_34, MUSIC_ROUTE_36, 0, 0, 1
	map_header GoldenrodCity, $2, TOWN, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 0, 1
	map_header GoldenrodGym, $f, INDOOR, GOLDENROD_CITY, MUSIC_GYM, 1, 1, 1
	map_header GoldenrodBikeShop, $12, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodHappinessRater, $5, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodBillsHouse, $5, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodMagnetTrainStation, $11, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodFlowerShop, $5, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodPPSpeechHouse, $5, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodNameRatersHouse, $5, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodDeptStore1F, $c, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodDeptStore2F, $c, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodDeptStore3F, $c, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodDeptStore4F, $c, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodDeptStore5F, $c, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodDeptStore6F, $c, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodDeptStoreElevator, $c, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodDeptStoreRoof, $c, INDOOR, GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1, 1
	map_header GoldenrodGameCorner, $e, INDOOR, GOLDENROD_CITY, MUSIC_GAME_CORNER, 0, 1, 1
	map_header GoldenrodPokeCenter1F, $7, INDOOR, GOLDENROD_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header GoldenrodPokeComCenter2FMobile, $15, INDOOR, GOLDENROD_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header IlexForestAzaleaGate, $8, GATE, ROUTE_34, MUSIC_ROUTE_36, 0, 1, 1
	map_header Route34IlexForestGate, $8, GATE, ROUTE_34, MUSIC_ROUTE_36, 0, 1, 1
	map_header DayCare, $5, INDOOR, ROUTE_34, MUSIC_AZALEA_TOWN, 0, 1, 1


MapGroup12:
	map_header Route6, $3, ROUTE, ROUTE_6, MUSIC_ROUTE_3, 0, 0, 4
	map_header Route11, $3, ROUTE, ROUTE_11, MUSIC_ROUTE_12, 0, 0, 1
	map_header VermilionCity, $3, TOWN, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 0, 2
	map_header VermilionHouseFishingSpeechHouse, $5, INDOOR, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 1, 1
	map_header VermilionPokeCenter1F, $7, INDOOR, VERMILION_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header VermilionPokeCenter2FBeta, $7, INDOOR, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 1, 1
	map_header PokemonFanClub, $5, INDOOR, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 1, 1
	map_header VermilionMagnetTrainSpeechHouse, $5, INDOOR, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 1, 1
	map_header VermilionMart, $c, INDOOR, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 1, 1
	map_header VermilionHouseDiglettsCaveSpeechHouse, $5, INDOOR, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 1, 1
	map_header VermilionGym, $e, INDOOR, VERMILION_CITY, MUSIC_GYM, 1, 1, 1
	map_header Route6SaffronGate, $8, GATE, ROUTE_6, MUSIC_ROUTE_3, 0, 1, 1
	map_header Route6UndergroundEntrance, $8, GATE, ROUTE_6, MUSIC_ROUTE_3, 0, 1, 1


MapGroup13:
	map_header Route1, $3, ROUTE, ROUTE_1, MUSIC_ROUTE_1, 0, 0, 1
	map_header PalletTown, $3, TOWN, PALLET_TOWN, MUSIC_PALLET_TOWN, 0, 0, 2
	map_header RedsHouse1F, $6, INDOOR, PALLET_TOWN, MUSIC_PALLET_TOWN, 0, 1, 1
	map_header RedsHouse2F, $6, INDOOR, PALLET_TOWN, MUSIC_PALLET_TOWN, 0, 1, 1
	map_header BluesHouse, $5, INDOOR, PALLET_TOWN, MUSIC_PALLET_TOWN, 0, 1, 1
	map_header OaksLab, $a, INDOOR, PALLET_TOWN, MUSIC_POKEMON_TALK, 0, 1, 1


MapGroup14:
	map_header Route3, $3, ROUTE, ROUTE_3, MUSIC_ROUTE_3, 0, 0, 1
	map_header PewterCity, $3, TOWN, PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 0, 0, 1
	map_header PewterNidoranSpeechHouse, $5, INDOOR, PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header PewterGym, $17, INDOOR, PEWTER_CITY, MUSIC_GYM, 1, 1, 1
	map_header PewterMart, $c, INDOOR, PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header PewterPokeCenter1F, $7, INDOOR, PEWTER_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header PewterPokeCEnter2FBeta, $7, INDOOR, PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header PewterSnoozeSpeechHouse, $5, INDOOR, PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1


MapGroup15:
	map_header OlivinePort, $9, ROUTE, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 0, 2
	map_header VermilionPort, $9, ROUTE, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 0, 2
	map_header FastShip1F, $13, INDOOR, FAST_SHIP, MUSIC_SS_AQUA, 0, 1, 1
	map_header FastShipCabins_NNW_NNE_NE, $13, INDOOR, FAST_SHIP, MUSIC_SS_AQUA, 0, 1, 1
	map_header FastShipCabins_SW_SSW_NW, $13, INDOOR, FAST_SHIP, MUSIC_SS_AQUA, 0, 1, 1
	map_header FastShipCabins_SE_SSE_CaptainsCabin, $13, INDOOR, FAST_SHIP, MUSIC_SS_AQUA, 0, 1, 1
	map_header FastShipB1F, $13, INDOOR, FAST_SHIP, MUSIC_SS_AQUA, 0, 1, 1
	map_header OlivinePortPassage, $1c, INDOOR, OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 1, 1
	map_header VermilionPortPassage, $1c, INDOOR, VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 1, 1
	map_header MountMoonSquare, $3, ROUTE, MT_MOON, MUSIC_MT_MOON_SQUARE, 0, 0, 1
	map_header MountMoonGiftShop, $10, INDOOR, MT_MOON, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header TinTowerRoof, $17, ROUTE, TIN_TOWER, MUSIC_TIN_TOWER, 0, 0, 1


MapGroup16:
	map_header Route23, $3, TOWN, ROUTE_23, MUSIC_INDIGO_PLATEAU, 0, 0, 1
	map_header IndigoPlateauPokeCenter1F, $7, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 0, 1, 1
	map_header WillsRoom, $f, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 1, 1, 1
	map_header KogasRoom, $f, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 1, 1, 1
	map_header BrunosRoom, $f, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 1, 1, 1
	map_header KarensRoom, $f, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 1, 1, 1
	map_header LancesRoom, $12, INDOOR, INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 1, 1, 1
	map_header HallOfFame, $1d, INDOOR, INDIGO_PLATEAU, MUSIC_NEW_BARK_TOWN, 1, 1, 1


MapGroup17:
	map_header Route13, $3, ROUTE, ROUTE_13, MUSIC_ROUTE_12, 0, 0, 13
	map_header Route14, $3, ROUTE, ROUTE_14, MUSIC_ROUTE_12, 0, 0, 1
	map_header Route15, $3, ROUTE, ROUTE_15, MUSIC_ROUTE_12, 0, 0, 1
	map_header Route18, $3, ROUTE, ROUTE_18, MUSIC_ROUTE_3, 0, 0, 1
	map_header FuchsiaCity, $3, TOWN, FUCHSIA_CITY, MUSIC_CELADON_CITY, 0, 0, 8
	map_header FuchsiaMart, $c, INDOOR, FUCHSIA_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header SafariZoneMainOffice, $e, INDOOR, FUCHSIA_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header FuchsiaGym, $a, INDOOR, FUCHSIA_CITY, MUSIC_GYM, 1, 1, 1
	map_header FuchsiaBillSpeechHouse, $5, INDOOR, FUCHSIA_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header FuchsiaPokeCenter1F, $7, INDOOR, FUCHSIA_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header FuchsiaPokeCenter2FBeta, $7, INDOOR, FUCHSIA_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header SafariZoneWardensHome, $5, INDOOR, FUCHSIA_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header Route15FuchsiaGate, $8, GATE, ROUTE_15, MUSIC_ROUTE_12, 0, 1, 1


MapGroup18:
	map_header Route8, $3, ROUTE, ROUTE_8, MUSIC_ROUTE_3, 0, 0, 1
	map_header Route12, $3, ROUTE, ROUTE_12, MUSIC_ROUTE_12, 0, 0, 13
	map_header Route10South, $3, ROUTE, ROUTE_10, MUSIC_ROUTE_3, 0, 0, 3
	map_header LavenderTown, $3, TOWN, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 0, 0, 1
	map_header LavenderPokeCenter1F, $7, INDOOR, LAVENDER_TOWN, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header LavenderPokeCenter2FBeta, $7, INDOOR, LAVENDER_TOWN, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header MrFujisHouse, $5, INDOOR, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 0, 1, 1
	map_header LavenderTownSpeechHouse, $5, INDOOR, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 0, 1, 1
	map_header LavenderNameRater, $5, INDOOR, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 0, 1, 1
	map_header LavenderMart, $c, INDOOR, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 0, 1, 1
	map_header SoulHouse, $5, INDOOR, LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 0, 1, 1
	map_header LavRadioTower1F, $1b, INDOOR, LAV_RADIO_TOWER, MUSIC_LAVENDER_TOWN, 0, 1, 1
	map_header Route8SaffronGate, $8, GATE, ROUTE_8, MUSIC_ROUTE_3, 0, 1, 1
	map_header Route12SuperRodHouse, $5, INDOOR, ROUTE_12, MUSIC_VIRIDIAN_CITY, 0, 1, 1


MapGroup19:
	map_header Route28, $3, ROUTE, ROUTE_28, MUSIC_INDIGO_PLATEAU, 0, 0, 4
	map_header SilverCaveOutside, $3, TOWN, SILVER_CAVE, MUSIC_INDIGO_PLATEAU, 0, 0, 4
	map_header SilverCavePokeCenter1F, $7, INDOOR, SILVER_CAVE, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header Route28FamousSpeechHouse, $5, INDOOR, ROUTE_28, MUSIC_AZALEA_TOWN, 0, 1, 1


MapGroup20:
	map_header PokeCenter2F, $7, INDOOR, SPECIAL_MAP, MUSIC_POKEMON_CENTER, 1, 1, 1
	map_header TradeCenter, $8, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 1, 1, 1
	map_header Colosseum, $8, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 1, 1, 1
	map_header TimeCapsule, $8, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 1, 1, 1
	map_header MobileTradeRoomMobile, $d, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 1, 1, 1
	map_header MobileBattleRoom, $d, INDOOR, SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 1, 1, 1


MapGroup21:
	map_header Route7, $3, ROUTE, ROUTE_7, MUSIC_ROUTE_3, 0, 0, 1
	map_header Route16, $3, ROUTE, ROUTE_16, MUSIC_ROUTE_3, 0, 0, 1
	map_header Route17, $3, ROUTE, ROUTE_17, MUSIC_ROUTE_3, 0, 0, 0
	map_header CeladonCity, $3, TOWN, CELADON_CITY, MUSIC_CELADON_CITY, 0, 0, 0
	map_header CeladonDeptStore1F, $c, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonDeptStore2F, $c, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonDeptStore3F, $c, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonDeptStore4F, $c, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonDeptStore5F, $c, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonDeptStore6F, $c, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonDeptStoreElevator, $c, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonMansion1F, $d, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonMansion2F, $d, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonMansion3F, $d, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonMansionRoof, $d, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonMansionRoofHouse, $5, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonPokeCenter1F, $7, INDOOR, CELADON_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header CeladonPokeCenter2FBeta, $7, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonGameCorner, $e, INDOOR, CELADON_CITY, MUSIC_GAME_CORNER, 0, 1, 1
	map_header CeladonGameCornerPrizeRoom, $e, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header CeladonGym, $11, INDOOR, CELADON_CITY, MUSIC_GYM, 1, 1, 1
	map_header CeladonCafe, $e, INDOOR, CELADON_CITY, MUSIC_CELADON_CITY, 0, 1, 1
	map_header Route16FuchsiaSpeechHouse, $5, INDOOR, ROUTE_16, MUSIC_CELADON_CITY, 0, 1, 1
	map_header Route16Gate, $8, GATE, ROUTE_16, MUSIC_ROUTE_3, 0, 1, 1
	map_header Route7SaffronGate, $8, GATE, ROUTE_7, MUSIC_ROUTE_3, 0, 1, 1
	map_header Route1718Gate, $8, GATE, ROUTE_17, MUSIC_ROUTE_3, 0, 1, 1


MapGroup22:
	map_header Route40, $1, ROUTE, ROUTE_40, MUSIC_ROUTE_36, 0, 0, 1
	map_header Route41, $1, ROUTE, ROUTE_41, MUSIC_ROUTE_36, 0, 0, 2
	map_header CianwoodCity, $1, TOWN, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 0, 0, 1
	map_header ManiasHouse, $5, INDOOR, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header CianwoodGym, $17, INDOOR, CIANWOOD_CITY, MUSIC_GYM, 1, 1, 1
	map_header CianwoodPokeCenter1F, $7, INDOOR, CIANWOOD_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header CianwoodPharmacy, $5, INDOOR, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header CianwoodCityPhotoStudio, $5, INDOOR, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header CianwoodLugiaSpeechHouse, $5, INDOOR, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header PokeSeersHouse, $5, INDOOR, CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 0, 1, 1
	map_header BattleTower1F, $16, INDOOR, BATTLE_TOWER, MUSIC_BATTLE_TOWER_LOBBY, 1, 1, 1
	map_header BattleTowerBattleRoom, $16, INDOOR, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, 1, 1, 1
	map_header BattleTowerElevator, $16, INDOOR, BATTLE_TOWER, MUSIC_NONE, 1, 1, 1
	map_header BattleTowerHallway, $16, INDOOR, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, 1, 1, 1
	map_header Route40BattleTowerGate, $8, GATE, BATTLE_TOWER, MUSIC_ROUTE_36, 0, 1, 1
	map_header BattleTowerOutside, $4, ROUTE, BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, 0, 0, 1


MapGroup23:
	map_header Route2, $3, ROUTE, ROUTE_2, MUSIC_ROUTE_2, 0, 0, 1
	map_header Route22, $3, ROUTE, ROUTE_22, MUSIC_ROUTE_3, 0, 0, 4
	map_header ViridianCity, $3, TOWN, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 0, 4
	map_header ViridianGym, $11, INDOOR, VIRIDIAN_CITY, MUSIC_GYM, 1, 1, 1
	map_header ViridianNicknameSpeechHouse, $5, INDOOR, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header TrainerHouse1F, $5, INDOOR, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header TrainerHouseB1F, $b, INDOOR, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header ViridianMart, $c, INDOOR, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header ViridianPokeCenter1F, $7, INDOOR, VIRIDIAN_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header ViridianPokeCenter2FBeta, $7, INDOOR, VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header Route2NuggetSpeechHouse, $5, INDOOR, ROUTE_2, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header Route2Gate, $8, GATE, ROUTE_2, MUSIC_ROUTE_2, 0, 1, 1
	map_header VictoryRoadGate, $8, GATE, ROUTE_26, MUSIC_INDIGO_PLATEAU, 0, 1, 1


MapGroup24:
	map_header Route26, $1, ROUTE, ROUTE_26, MUSIC_ROUTE_26, 0, 0, 2
	map_header Route27, $1, ROUTE, ROUTE_27, MUSIC_ROUTE_26, 0, 0, 2
	map_header Route29, $1, ROUTE, ROUTE_29, MUSIC_ROUTE_29, 0, 0, 1
	map_header NewBarkTown, $1, TOWN, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 0, 0, 2
	map_header ElmsLab, $a, INDOOR, NEW_BARK_TOWN, MUSIC_PROF_ELM, 0, 1, 1
	map_header KrissHouse1F, $6, INDOOR, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 0, 1, 1
	map_header KrissHouse2F, $14, INDOOR, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 0, 1, 1
	map_header KrissNeighborsHouse, $5, INDOOR, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 0, 1, 1
	map_header ElmsHouse, $6, INDOOR, NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 0, 1, 1
	map_header Route26HealSpeechHouse, $5, INDOOR, ROUTE_26, MUSIC_AZALEA_TOWN, 0, 1, 1
	map_header Route26DayofWeekSiblingsHouse, $5, INDOOR, ROUTE_26, MUSIC_AZALEA_TOWN, 0, 1, 1
	map_header Route27SandstormHouse, $5, INDOOR, ROUTE_27, MUSIC_AZALEA_TOWN, 0, 1, 1
	map_header Route2946Gate, $8, GATE, ROUTE_29, MUSIC_ROUTE_29, 0, 1, 1


MapGroup25:
	map_header Route5, $3, ROUTE, ROUTE_5, MUSIC_ROUTE_3, 0, 0, 1
	map_header SaffronCity, $3, TOWN, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 0, 1
	map_header FightingDojo, $11, INDOOR, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header SaffronGym, $1c, INDOOR, SAFFRON_CITY, MUSIC_GYM, 1, 1, 1
	map_header SaffronMart, $c, INDOOR, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header SaffronPokeCenter1F, $7, INDOOR, SAFFRON_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header SaffronPokeCenter2FBeta, $7, INDOOR, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header MrPsychicsHouse, $5, INDOOR, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header SaffronTrainStation, $11, INDOOR, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header SilphCo1F, $b, INDOOR, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header CopycatsHouse1F, $6, INDOOR, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header CopycatsHouse2F, $6, INDOOR, SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header Route5UndergroundEntrance, $8, GATE, ROUTE_5, MUSIC_ROUTE_3, 0, 1, 1
	map_header Route5SaffronCityGate, $8, GATE, ROUTE_5, MUSIC_VIRIDIAN_CITY, 0, 1, 1
	map_header Route5CleanseTagSpeechHouse, $5, INDOOR, ROUTE_5, MUSIC_VIRIDIAN_CITY, 0, 1, 1


MapGroup26:
	map_header Route30, $1, ROUTE, ROUTE_30, MUSIC_ROUTE_30, 0, 0, 4
	map_header Route31, $1, ROUTE, ROUTE_31, MUSIC_ROUTE_30, 0, 0, 4
	map_header CherrygroveCity, $1, TOWN, CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 0, 0, 1
	map_header CherrygroveMart, $c, INDOOR, CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 0, 1, 1
	map_header CherrygrovePokeCenter1F, $7, INDOOR, CHERRYGROVE_CITY, MUSIC_POKEMON_CENTER, 0, 1, 1
	map_header CherrygroveGymSpeechHouse, $5, INDOOR, CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 0, 1, 1
	map_header GuideGentsHouse, $5, INDOOR, CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 0, 1, 1
	map_header CherrygroveEvolutionSpeechHouse, $5, INDOOR, CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 0, 1, 1
	map_header Route30BerrySpeechHouse, $5, INDOOR, ROUTE_30, MUSIC_CHERRYGROVE_CITY, 0, 1, 1
	map_header MrPokemonsHouse, $b, INDOOR, ROUTE_30, MUSIC_CHERRYGROVE_CITY, 0, 1, 1
	map_header Route31VioletGate, $8, GATE, ROUTE_31, MUSIC_ROUTE_30, 0, 1, 1
