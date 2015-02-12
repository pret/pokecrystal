
	map_header_2 NewBarkTown, NEW_BARK_TOWN, $5, WEST | EAST ; 0x94dd8
	connection west, ROUTE_29, Route29, 0, 0, 9, NEW_BARK_TOWN
	connection east, ROUTE_27, Route27, 0, 0, 9, NEW_BARK_TOWN

	map_header_2 CherrygroveCity, CHERRYGROVE_CITY, $35, NORTH | EAST ; 0x94dfc
	connection north, ROUTE_30, Route30, 5, 0, 10, CHERRYGROVE_CITY
	connection east, ROUTE_29, Route29, 0, 0, 9, CHERRYGROVE_CITY

	map_header_2 VioletCity, VIOLET_CITY, $5, SOUTH | WEST | EAST ; 0x94e20
	connection south, ROUTE_32, Route32, 0, 0, 10, VIOLET_CITY
	connection west, ROUTE_36, Route36, 0, 0, 9, VIOLET_CITY
	connection east, ROUTE_31, Route31, 9, 0, 9, VIOLET_CITY

	map_header_2 AzaleaTown, AZALEA_TOWN, $5, WEST | EAST ; 0x94e50
	connection west, ROUTE_34, Route34, -3, 15, 12, AZALEA_TOWN
	connection east, ROUTE_33, Route33, 0, 0, 9, AZALEA_TOWN

	map_header_2 CianwoodCity, CIANWOOD_CITY, $35, EAST ; 0x94e74
	connection east, ROUTE_41, Route41, 0, 0, 27, CIANWOOD_CITY

	map_header_2 GoldenrodCity, GOLDENROD_CITY, $35, NORTH | SOUTH ; 0x94e8c
	connection north, ROUTE_35, Route35, 5, 0, 10, GOLDENROD_CITY
	connection south, ROUTE_34, Route34, 5, 0, 10, GOLDENROD_CITY

	map_header_2 OlivineCity, OLIVINE_CITY, $35, NORTH | WEST ; 0x94eb0
	connection north, ROUTE_39, Route39, 5, 0, 10, OLIVINE_CITY
	connection west, ROUTE_40, Route40, 9, 0, 12, OLIVINE_CITY

	map_header_2 EcruteakCity, ECRUTEAK_CITY, $5, SOUTH | WEST | EAST ; 0x94ed4
	connection south, ROUTE_37, Route37, 5, 0, 10, ECRUTEAK_CITY
	connection west, ROUTE_38, Route38, 5, 0, 9, ECRUTEAK_CITY
	connection east, ROUTE_42, Route42, 9, 0, 9, ECRUTEAK_CITY

	map_header_2 MahoganyTown, MAHOGANY_TOWN, $71, NORTH | WEST | EAST ; 0x94f04
	connection north, ROUTE_43, Route43, 0, 0, 10, MAHOGANY_TOWN
	connection west, ROUTE_42, Route42, 0, 0, 9, MAHOGANY_TOWN
	connection east, ROUTE_44, Route44, 0, 0, 9, MAHOGANY_TOWN

	map_header_2 LakeofRage, LAKE_OF_RAGE, $5, SOUTH ; 0x94f34
	connection south, ROUTE_43, Route43, 5, 0, 10, LAKE_OF_RAGE

	map_header_2 BlackthornCity, BLACKTHORN_CITY, $71, SOUTH | WEST ; 0x94f4c
	connection south, ROUTE_45, Route45, 0, 0, 10, BLACKTHORN_CITY
	connection west, ROUTE_44, Route44, 9, 0, 9, BLACKTHORN_CITY

	map_header_2 SilverCaveOutside, SILVER_CAVE_OUTSIDE, $2c, EAST ; 0x94f70
	connection east, ROUTE_28, Route28, 9, 0, 9, SILVER_CAVE_OUTSIDE

	map_header_2 Route26, ROUTE_26, $5, WEST ; 0x94f88
	connection west, ROUTE_27, Route27, 45, 0, 9, ROUTE_26

	map_header_2 Route27, ROUTE_27, $35, WEST | EAST ; 0x94fa0
	connection west, NEW_BARK_TOWN, NewBarkTown, 0, 0, 9, ROUTE_27
	connection east, ROUTE_26, Route26, -3, 42, 12, ROUTE_27

	map_header_2 Route28, ROUTE_28, $2c, WEST ; 0x94fc4
	connection west, SILVER_CAVE_OUTSIDE, SilverCaveOutside, -3, 6, 12, ROUTE_28

	map_header_2 Route29, ROUTE_29, $5, NORTH | WEST | EAST ; 0x94fdc
	connection north, ROUTE_46, Route46, 10, 0, 10, ROUTE_29
	connection west, CHERRYGROVE_CITY, CherrygroveCity, 0, 0, 9, ROUTE_29
	connection east, NEW_BARK_TOWN, NewBarkTown, 0, 0, 9, ROUTE_29

	map_header_2 Route30, ROUTE_30, $5, NORTH | SOUTH ; 0x9500c
	connection north, ROUTE_31, Route31, -3, 7, 13, ROUTE_30
	connection south, CHERRYGROVE_CITY, CherrygroveCity, -3, 2, 16, ROUTE_30

	map_header_2 Route31, ROUTE_31, $5, SOUTH | WEST ; 0x95030
	connection south, ROUTE_30, Route30, 10, 0, 10, ROUTE_31
	connection west, VIOLET_CITY, VioletCity, -3, 6, 12, ROUTE_31

	map_header_2 Route32, ROUTE_32, $5, NORTH | SOUTH ; 0x95054
	connection north, VIOLET_CITY, VioletCity, 0, 0, 13, ROUTE_32
	connection south, ROUTE_33, Route33, 0, 0, 10, ROUTE_32

	map_header_2 Route33, ROUTE_33, $5, NORTH | WEST ; 0x95078
	connection north, ROUTE_32, Route32, 0, 0, 10, ROUTE_33
	connection west, AZALEA_TOWN, AzaleaTown, 0, 0, 9, ROUTE_33

	map_header_2 Route34, ROUTE_34, $5, NORTH | EAST ; 0x9509c
	connection north, GOLDENROD_CITY, GoldenrodCity, -3, 2, 16, ROUTE_34
	connection east, AZALEA_TOWN, AzaleaTown, 18, 0, 9, ROUTE_34

	map_header_2 Route35, ROUTE_35, $5, NORTH | SOUTH ; 0x950c0
	connection north, ROUTE_36, Route36, 0, 0, 13, ROUTE_35
	connection south, GOLDENROD_CITY, GoldenrodCity, -3, 2, 16, ROUTE_35

	map_header_2 Route36, ROUTE_36, $5, NORTH | SOUTH | EAST ; 0x950e4
	connection north, ROUTE_37, Route37, 10, 0, 10, ROUTE_36
	connection south, ROUTE_35, Route35, 0, 0, 10, ROUTE_36
	connection east, VIOLET_CITY, VioletCity, 0, 0, 12, ROUTE_36

	map_header_2 Route37, ROUTE_37, $5, NORTH | SOUTH ; 0x95114
	connection north, ECRUTEAK_CITY, EcruteakCity, -3, 2, 16, ROUTE_37
	connection south, ROUTE_36, Route36, -3, 7, 16, ROUTE_37

	map_header_2 Route38, ROUTE_38, $5, WEST | EAST ; 0x95138
	connection west, ROUTE_39, Route39, 0, 0, 12, ROUTE_38
	connection east, ECRUTEAK_CITY, EcruteakCity, -3, 2, 15, ROUTE_38

	map_header_2 Route39, ROUTE_39, $5, SOUTH | EAST ; 0x9515c
	connection south, OLIVINE_CITY, OlivineCity, -3, 2, 16, ROUTE_39
	connection east, ROUTE_38, Route38, 0, 0, 9, ROUTE_39

	map_header_2 Route40, ROUTE_40, $35, SOUTH | EAST ; 0x95180
	connection south, ROUTE_41, Route41, -3, 12, 13, ROUTE_40
	connection east, OLIVINE_CITY, OlivineCity, -3, 6, 12, ROUTE_40

	map_header_2 Route41, ROUTE_41, $35, NORTH | WEST ; 0x951a4
	connection north, ROUTE_40, Route40, 15, 0, 10, ROUTE_41
	connection west, CIANWOOD_CITY, CianwoodCity, 0, 0, 27, ROUTE_41

	map_header_2 Route42, ROUTE_42, $5, WEST | EAST ; 0x951c8
	connection west, ECRUTEAK_CITY, EcruteakCity, -3, 6, 12, ROUTE_42
	connection east, MAHOGANY_TOWN, MahoganyTown, 0, 0, 9, ROUTE_42

	map_header_2 Route43, ROUTE_43, $5, NORTH | SOUTH ; 0x951ec
	connection north, LAKE_OF_RAGE, LakeofRage, -3, 2, 16, ROUTE_43
	connection south, MAHOGANY_TOWN, MahoganyTown, 0, 0, 10, ROUTE_43

	map_header_2 Route44, ROUTE_44, $71, WEST | EAST ; 0x95210
	connection west, MAHOGANY_TOWN, MahoganyTown, 0, 0, 9, ROUTE_44
	connection east, BLACKTHORN_CITY, BlackthornCity, -3, 6, 12, ROUTE_44

	map_header_2 Route45, ROUTE_45, $71, NORTH | WEST ; 0x95234
	connection north, BLACKTHORN_CITY, BlackthornCity, 0, 0, 13, ROUTE_45
	connection west, ROUTE_46, Route46, 36, 0, 12, ROUTE_45

	map_header_2 Route46, ROUTE_46, $5, SOUTH | EAST ; 0x95258
	connection south, ROUTE_29, Route29, -3, 7, 16, ROUTE_46
	connection east, ROUTE_45, Route45, -3, 33, 12, ROUTE_46

	map_header_2 PewterCity, PEWTER_CITY, $f, SOUTH | EAST ; 0x9527c
	connection south, ROUTE_2, Route2, 5, 0, 10, PEWTER_CITY
	connection east, ROUTE_3, Route3, 5, 0, 9, PEWTER_CITY

	map_header_2 Route2, ROUTE_2, $f, NORTH | SOUTH ; 0x952a0
	connection north, PEWTER_CITY, PewterCity, -3, 2, 16, ROUTE_2
	connection south, VIRIDIAN_CITY, ViridianCity, -3, 2, 16, ROUTE_2

	map_header_2 ViridianCity, VIRIDIAN_CITY, $f, NORTH | SOUTH | WEST ; 0x952c4
	connection north, ROUTE_2, Route2, 5, 0, 10, VIRIDIAN_CITY
	connection south, ROUTE_1, Route1, 10, 0, 10, VIRIDIAN_CITY
	connection west, ROUTE_22, Route22, 4, 0, 9, VIRIDIAN_CITY

	map_header_2 Route22, ROUTE_22, $2c, EAST ; 0x952f4
	connection east, VIRIDIAN_CITY, ViridianCity, -3, 1, 15, ROUTE_22

	map_header_2 Route1, ROUTE_1, $f, NORTH | SOUTH ; 0x9530c
	connection north, VIRIDIAN_CITY, ViridianCity, -3, 7, 13, ROUTE_1
	connection south, PALLET_TOWN, PalletTown, 0, 0, 10, ROUTE_1

	map_header_2 PalletTown, PALLET_TOWN, $f, NORTH | SOUTH ; 0x95330
	connection north, ROUTE_1, Route1, 0, 0, 10, PALLET_TOWN
	connection south, ROUTE_21, Route21, 0, 0, 10, PALLET_TOWN

	map_header_2 Route21, ROUTE_21, $43, NORTH | SOUTH ; 0x95354
	connection north, PALLET_TOWN, PalletTown, 0, 0, 10, ROUTE_21
	connection south, CINNABAR_ISLAND, CinnabarIsland, 0, 0, 10, ROUTE_21

	map_header_2 CinnabarIsland, CINNABAR_ISLAND, $43, NORTH | EAST ; 0x95378
	connection north, ROUTE_21, Route21, 0, 0, 10, CINNABAR_ISLAND
	connection east, ROUTE_20, Route20, 0, 0, 9, CINNABAR_ISLAND

	map_header_2 Route20, ROUTE_20, $43, WEST | EAST ; 0x9539c
	connection west, CINNABAR_ISLAND, CinnabarIsland, 0, 0, 9, ROUTE_20
	connection east, ROUTE_19, Route19, -3, 6, 12, ROUTE_20

	map_header_2 Route19, ROUTE_19, $43, NORTH | WEST ; 0x953c0
	connection north, FUCHSIA_CITY, FuchsiaCity, 0, 0, 13, ROUTE_19
	connection west, ROUTE_20, Route20, 9, 0, 9, ROUTE_19

	map_header_2 FuchsiaCity, FUCHSIA_CITY, $f, SOUTH | WEST | EAST ; 0x953e4
	connection south, ROUTE_19, Route19, 0, 0, 10, FUCHSIA_CITY
	connection west, ROUTE_18, Route18, 7, 0, 9, FUCHSIA_CITY
	connection east, ROUTE_15, Route15, 9, 0, 9, FUCHSIA_CITY

	map_header_2 Route18, ROUTE_18, $43, WEST | EAST ; 0x95414
	connection west, ROUTE_17, Route17, -3, 35, 10, ROUTE_18
	connection east, FUCHSIA_CITY, FuchsiaCity, -3, 4, 14, ROUTE_18

	map_header_2 Route17, ROUTE_17, $43, NORTH | EAST ; 0x95438
	connection north, ROUTE_16, Route16, 0, 0, 10, ROUTE_17
	connection east, ROUTE_18, Route18, 38, 0, 9, ROUTE_17

	map_header_2 Route16, ROUTE_16, $f, SOUTH | EAST ; 0x9545c
	connection south, ROUTE_17, Route17, 0, 0, 10, ROUTE_16
	connection east, CELADON_CITY, CeladonCity, -3, 6, 12, ROUTE_16

	map_header_2 CeladonCity, CELADON_CITY, $f, WEST | EAST ; 0x95480
	connection west, ROUTE_16, Route16, 9, 0, 9, CELADON_CITY
	connection east, ROUTE_7, Route7, 5, 0, 9, CELADON_CITY

	map_header_2 Route7, ROUTE_7, $f, WEST | EAST ; 0x954a4
	connection west, CELADON_CITY, CeladonCity, -3, 2, 15, ROUTE_7
	connection east, SAFFRON_CITY, SaffronCity, -3, 6, 12, ROUTE_7

	map_header_2 Route15, ROUTE_15, $f, WEST | EAST ; 0x954c8
	connection west, FUCHSIA_CITY, FuchsiaCity, -3, 6, 12, ROUTE_15
	connection east, ROUTE_14, Route14, -3, 6, 12, ROUTE_15

	map_header_2 Route14, ROUTE_14, $43, NORTH | WEST ; 0x954ec
	connection north, ROUTE_13, Route13, 0, 0, 13, ROUTE_14
	connection west, ROUTE_15, Route15, 9, 0, 9, ROUTE_14

	map_header_2 Route13, ROUTE_13, $43, NORTH | SOUTH ; 0x95510
	connection north, ROUTE_12, Route12, 20, 0, 10, ROUTE_13
	connection south, ROUTE_14, Route14, 0, 0, 10, ROUTE_13

	map_header_2 Route12, ROUTE_12, $43, NORTH | SOUTH | WEST ; 0x95534
	connection north, LAVENDER_TOWN, LavenderTown, 0, 0, 10, ROUTE_12
	connection south, ROUTE_13, Route13, -3, 17, 13, ROUTE_12
	connection west, ROUTE_11, Route11, 9, 0, 9, ROUTE_12

	map_header_2 Route11, ROUTE_11, $f, WEST | EAST ; 0x95564
	connection west, VERMILION_CITY, VermilionCity, 0, 0, 12, ROUTE_11
	connection east, ROUTE_12, Route12, -3, 6, 15, ROUTE_11

	map_header_2 LavenderTown, LAVENDER_TOWN, $2c, NORTH | SOUTH | WEST ; 0x95588
	connection north, ROUTE_10_SOUTH, Route10South, 0, 0, 10, LAVENDER_TOWN
	connection south, ROUTE_12, Route12, 0, 0, 10, LAVENDER_TOWN
	connection west, ROUTE_8, Route8, 0, 0, 9, LAVENDER_TOWN

	map_header_2 VermilionCity, VERMILION_CITY, $43, NORTH | EAST ; 0x955b8
	connection north, ROUTE_6, Route6, 5, 0, 10, VERMILION_CITY
	connection east, ROUTE_11, Route11, 0, 0, 9, VERMILION_CITY

	map_header_2 Route6, ROUTE_6, $f, NORTH | SOUTH ; 0x955dc
	connection north, SAFFRON_CITY, SaffronCity, -3, 2, 16, ROUTE_6
	connection south, VERMILION_CITY, VermilionCity, -3, 2, 16, ROUTE_6

	map_header_2 SaffronCity, SAFFRON_CITY, $f, NORTH | SOUTH | WEST | EAST ; 0x95600
	connection north, ROUTE_5, Route5, 5, 0, 10, SAFFRON_CITY
	connection south, ROUTE_6, Route6, 5, 0, 10, SAFFRON_CITY
	connection west, ROUTE_7, Route7, 9, 0, 9, SAFFRON_CITY
	connection east, ROUTE_8, Route8, 9, 0, 9, SAFFRON_CITY

	map_header_2 Route5, ROUTE_5, $f, NORTH | SOUTH ; 0x9563c
	connection north, CERULEAN_CITY, CeruleanCity, -3, 2, 16, ROUTE_5
	connection south, SAFFRON_CITY, SaffronCity, -3, 2, 16, ROUTE_5

	map_header_2 CeruleanCity, CERULEAN_CITY, $f, NORTH | SOUTH | WEST | EAST ; 0x95660
	connection north, ROUTE_24, Route24, 6, 0, 10, CERULEAN_CITY
	connection south, ROUTE_5, Route5, 5, 0, 10, CERULEAN_CITY
	connection west, ROUTE_4, Route4, 5, 0, 9, CERULEAN_CITY
	connection east, ROUTE_9, Route9, 9, 0, 9, CERULEAN_CITY

	map_header_2 Route9, ROUTE_9, $2c, SOUTH | WEST ; 0x9569c
	connection south, ROUTE_10_NORTH, Route10North, 20, 0, 10, ROUTE_9
	connection west, CERULEAN_CITY, CeruleanCity, -3, 6, 12, ROUTE_9

	map_header_2 Route24, ROUTE_24, $2c, NORTH | SOUTH ; 0x956c0
	connection north, ROUTE_25, Route25, 0, 0, 13, ROUTE_24
	connection south, CERULEAN_CITY, CeruleanCity, -3, 3, 16, ROUTE_24

	map_header_2 Route25, ROUTE_25, $2c, SOUTH ; 0x956e4
	connection south, ROUTE_24, Route24, 0, 0, 10, ROUTE_25

	map_header_2 Route3, ROUTE_3, $2c, WEST | EAST ; 0x956fc
	connection west, PEWTER_CITY, PewterCity, -3, 2, 15, ROUTE_3
	connection east, ROUTE_4, Route4, 0, 0, 9, ROUTE_3

	map_header_2 Route4, ROUTE_4, $2c, WEST | EAST ; 0x95720
	connection west, ROUTE_3, Route3, 0, 0, 9, ROUTE_4
	connection east, CERULEAN_CITY, CeruleanCity, -3, 2, 15, ROUTE_4

	map_header_2 Route8, ROUTE_8, $2c, WEST | EAST ; 0x95744
	connection west, SAFFRON_CITY, SaffronCity, -3, 6, 12, ROUTE_8
	connection east, LAVENDER_TOWN, LavenderTown, 0, 0, 9, ROUTE_8

	map_header_2 Route10North, ROUTE_10_NORTH, $2c, NORTH | SOUTH ; 0x95768
	connection north, ROUTE_9, Route9, -3, 17, 13, ROUTE_10_NORTH
	connection south, ROUTE_10_SOUTH, Route10South, 0, 0, 10, ROUTE_10_NORTH

	map_header_2 Route10South, ROUTE_10_SOUTH, $2c, NORTH | SOUTH ; 0x9578c
	connection north, ROUTE_10_NORTH, Route10North, 0, 0, 10, ROUTE_10_SOUTH
	connection south, LAVENDER_TOWN, LavenderTown, 0, 0, 10, ROUTE_10_SOUTH

	map_header_2 Route23, ROUTE_23, $f, NONE ; 0x957b0
	map_header_2 SproutTower1F, SPROUT_TOWER_1F, $0, NONE ; 0x957bc
	map_header_2 SproutTower2F, SPROUT_TOWER_2F, $0, NONE ; 0x957c8
	map_header_2 SproutTower3F, SPROUT_TOWER_3F, $0, NONE ; 0x957d4
	map_header_2 TinTower1F, TIN_TOWER_1F, $0, NONE ; 0x957e0
	map_header_2 TinTower2F, TIN_TOWER_2F, $0, NONE ; 0x957ec
	map_header_2 TinTower3F, TIN_TOWER_3F, $0, NONE ; 0x957f8
	map_header_2 TinTower4F, TIN_TOWER_4F, $0, NONE ; 0x95804
	map_header_2 TinTower5F, TIN_TOWER_5F, $0, NONE ; 0x95810
	map_header_2 TinTower6F, TIN_TOWER_6F, $0, NONE ; 0x9581c
	map_header_2 TinTower7F, TIN_TOWER_7F, $0, NONE ; 0x95828
	map_header_2 TinTower8F, TIN_TOWER_8F, $0, NONE ; 0x95834
	map_header_2 TinTower9F, TIN_TOWER_9F, $0, NONE ; 0x95840
	map_header_2 BurnedTower1F, BURNED_TOWER_1F, $0, NONE ; 0x9584c
	map_header_2 BurnedTowerB1F, BURNED_TOWER_B1F, $9, NONE ; 0x95858
	map_header_2 NationalPark, NATIONAL_PARK, $0, NONE ; 0x95864
	map_header_2 NationalParkBugContest, NATIONAL_PARK_BUG_CONTEST, $0, NONE ; 0x95870
	map_header_2 RadioTower1F, RADIO_TOWER_1F, $0, NONE ; 0x9587c
	map_header_2 RadioTower2F, RADIO_TOWER_2F, $0, NONE ; 0x95888
	map_header_2 RadioTower3F, RADIO_TOWER_3F, $0, NONE ; 0x95894
	map_header_2 RadioTower4F, RADIO_TOWER_4F, $0, NONE ; 0x958a0
	map_header_2 RadioTower5F, RADIO_TOWER_5F, $0, NONE ; 0x958ac
	map_header_2 RuinsofAlphOutside, RUINS_OF_ALPH_OUTSIDE, $5, NONE ; 0x958b8
	map_header_2 RuinsofAlphHoOhChamber, RUINS_OF_ALPH_HO_OH_CHAMBER, $0, NONE ; 0x958c4
	map_header_2 RuinsofAlphKabutoChamber, RUINS_OF_ALPH_KABUTO_CHAMBER, $0, NONE ; 0x958d0
	map_header_2 RuinsofAlphOmanyteChamber, RUINS_OF_ALPH_OMANYTE_CHAMBER, $0, NONE ; 0x958dc
	map_header_2 RuinsofAlphAerodactylChamber, RUINS_OF_ALPH_AERODACTYL_CHAMBER, $0, NONE ; 0x958e8
	map_header_2 RuinsofAlphInnerChamber, RUINS_OF_ALPH_INNER_CHAMBER, $0, NONE ; 0x958f4
	map_header_2 RuinsofAlphResearchCenter, RUINS_OF_ALPH_RESEARCH_CENTER, $0, NONE ; 0x95900
	map_header_2 RuinsofAlphHoOhItemRoom, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, $0, NONE ; 0x9590c
	map_header_2 RuinsofAlphKabutoItemRoom, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, $0, NONE ; 0x95918
	map_header_2 RuinsofAlphOmanyteItemRoom, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, $0, NONE ; 0x95924
	map_header_2 RuinsofAlphAerodactylItemRoom, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM, $0, NONE ; 0x95930
	map_header_2 RuinsofAlphHoOhWordRoom, RUINS_OF_ALPH_HO_OH_WORD_ROOM, $0, NONE ; 0x9593c
	map_header_2 RuinsofAlphKabutoWordRoom, RUINS_OF_ALPH_KABUTO_WORD_ROOM, $0, NONE ; 0x95948
	map_header_2 RuinsofAlphOmanyteWordRoom, RUINS_OF_ALPH_OMANYTE_WORD_ROOM, $0, NONE ; 0x95954
	map_header_2 RuinsofAlphAerodactylWordRoom, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, $0, NONE ; 0x95960
	map_header_2 UnionCave1F, UNION_CAVE_1F, $9, NONE ; 0x9596c
	map_header_2 UnionCaveB1F, UNION_CAVE_B1F, $9, NONE ; 0x95978
	map_header_2 UnionCaveB2F, UNION_CAVE_B2F, $9, NONE ; 0x95984
	map_header_2 SlowpokeWellB1F, SLOWPOKE_WELL_B1F, $9, NONE ; 0x95990
	map_header_2 SlowpokeWellB2F, SLOWPOKE_WELL_B2F, $9, NONE ; 0x9599c
	map_header_2 OlivineLighthouse1F, OLIVINE_LIGHTHOUSE_1F, $0, NONE ; 0x959a8
	map_header_2 OlivineLighthouse2F, OLIVINE_LIGHTHOUSE_2F, $0, NONE ; 0x959b4
	map_header_2 OlivineLighthouse3F, OLIVINE_LIGHTHOUSE_3F, $0, NONE ; 0x959c0
	map_header_2 OlivineLighthouse4F, OLIVINE_LIGHTHOUSE_4F, $0, NONE ; 0x959cc
	map_header_2 OlivineLighthouse5F, OLIVINE_LIGHTHOUSE_5F, $0, NONE ; 0x959d8
	map_header_2 OlivineLighthouse6F, OLIVINE_LIGHTHOUSE_6F, $0, NONE ; 0x959e4
	map_header_2 MahoganyMart1F, MAHOGANY_MART_1F, $0, NONE ; 0x959f0
	map_header_2 TeamRocketBaseB1F, TEAM_ROCKET_BASE_B1F, $0, NONE ; 0x959fc
	map_header_2 TeamRocketBaseB2F, TEAM_ROCKET_BASE_B2F, $0, NONE ; 0x95a08
	map_header_2 TeamRocketBaseB3F, TEAM_ROCKET_BASE_B3F, $0, NONE ; 0x95a14
	map_header_2 IlexForest, ILEX_FOREST, $5, NONE ; 0x95a20
	map_header_2 WarehouseEntrance, WAREHOUSE_ENTRANCE, $0, NONE ; 0x95a2c
	map_header_2 UndergroundPathSwitchRoomEntrances, UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, $0, NONE ; 0x95a38
	map_header_2 GoldenrodDeptStoreB1F, GOLDENROD_DEPT_STORE_B1F, $0, NONE ; 0x95a44
	map_header_2 UndergroundWarehouse, UNDERGROUND_WAREHOUSE, $0, NONE ; 0x95a50
	map_header_2 MountMortar1FOutside, MOUNT_MORTAR_1F_OUTSIDE, $9, NONE ; 0x95a5c
	map_header_2 MountMortar1FInside, MOUNT_MORTAR_1F_INSIDE, $9, NONE ; 0x95a68
	map_header_2 MountMortar2FInside, MOUNT_MORTAR_2F_INSIDE, $9, NONE ; 0x95a74
	map_header_2 MountMortarB1F, MOUNT_MORTAR_B1F, $9, NONE ; 0x95a80
	map_header_2 IcePath1F, ICE_PATH_1F, $9, NONE ; 0x95a8c
	map_header_2 IcePathB1F, ICE_PATH_B1F, $19, NONE ; 0x95a98
	map_header_2 IcePathB2FMahoganySide, ICE_PATH_B2F_MAHOGANY_SIDE, $19, NONE ; 0x95aa4
	map_header_2 IcePathB2FBlackthornSide, ICE_PATH_B2F_BLACKTHORN_SIDE, $19, NONE ; 0x95ab0
	map_header_2 IcePathB3F, ICE_PATH_B3F, $19, NONE ; 0x95abc
	map_header_2 WhirlIslandNW, WHIRL_ISLAND_NW, $9, NONE ; 0x95ac8
	map_header_2 WhirlIslandNE, WHIRL_ISLAND_NE, $9, NONE ; 0x95ad4
	map_header_2 WhirlIslandSW, WHIRL_ISLAND_SW, $9, NONE ; 0x95ae0
	map_header_2 WhirlIslandCave, WHIRL_ISLAND_CAVE, $9, NONE ; 0x95aec
	map_header_2 WhirlIslandSE, WHIRL_ISLAND_SE, $f, NONE ; 0x95af8
	map_header_2 WhirlIslandB1F, WHIRL_ISLAND_B1F, $9, NONE ; 0x95b04
	map_header_2 WhirlIslandB2F, WHIRL_ISLAND_B2F, $2e, NONE ; 0x95b10
	map_header_2 WhirlIslandLugiaChamber, WHIRL_ISLAND_LUGIA_CHAMBER, $f, NONE ; 0x95b1c
	map_header_2 SilverCaveRoom1, SILVER_CAVE_ROOM_1, $9, NONE ; 0x95b28
	map_header_2 SilverCaveRoom2, SILVER_CAVE_ROOM_2, $9, NONE ; 0x95b34
	map_header_2 SilverCaveRoom3, SILVER_CAVE_ROOM_3, $9, NONE ; 0x95b40
	map_header_2 SilverCaveItemRooms, SILVER_CAVE_ITEM_ROOMS, $9, NONE ; 0x95b4c
	map_header_2 DarkCaveVioletEntrance, DARK_CAVE_VIOLET_ENTRANCE, $9, NONE ; 0x95b58
	map_header_2 DarkCaveBlackthornEntrance, DARK_CAVE_BLACKTHORN_ENTRANCE, $9, NONE ; 0x95b64
	map_header_2 DragonsDen1F, DRAGONS_DEN_1F, $9, NONE ; 0x95b70
	map_header_2 DragonsDenB1F, DRAGONS_DEN_B1F, $71, NONE ; 0x95b7c
	map_header_2 DragonShrine, DRAGON_SHRINE, $0, NONE ; 0x95b88
	map_header_2 TohjoFalls, TOHJO_FALLS, $9, NONE ; 0x95b94
	map_header_2 OlivinePokeCenter1F, OLIVINE_POKECENTER_1F, $0, NONE ; 0x95ba0
	map_header_2 OlivineGym, OLIVINE_GYM, $0, NONE ; 0x95bac
	map_header_2 OlivineVoltorbHouse, OLIVINE_VOLTORB_HOUSE, $0, NONE ; 0x95bb8
	map_header_2 OlivineHouseBeta, OLIVINE_HOUSE_BETA, $0, NONE ; 0x95bc4
	map_header_2 OlivinePunishmentSpeechHouse, OLIVINE_PUNISHMENT_SPEECH_HOUSE, $0, NONE ; 0x95bd0
	map_header_2 OlivineGoodRodHouse, OLIVINE_GOOD_ROD_HOUSE, $0, NONE ; 0x95bdc
	map_header_2 OlivineCafe, OLIVINE_CAFE, $0, NONE ; 0x95be8
	map_header_2 OlivineMart, OLIVINE_MART, $0, NONE ; 0x95bf4
	map_header_2 Route38EcruteakGate, ROUTE_38_ECRUTEAK_GATE, $0, NONE ; 0x95c00
	map_header_2 Route39Barn, ROUTE_39_BARN, $0, NONE ; 0x95c0c
	map_header_2 Route39Farmhouse, ROUTE_39_FARMHOUSE, $0, NONE ; 0x95c18
	map_header_2 MahoganyRedGyaradosSpeechHouse, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, $0, NONE ; 0x95c24
	map_header_2 MahoganyGym, MAHOGANY_GYM, $0, NONE ; 0x95c30
	map_header_2 MahoganyPokeCenter1F, MAHOGANY_POKECENTER_1F, $0, NONE ; 0x95c3c
	map_header_2 Route42EcruteakGate, ROUTE_42_ECRUTEAK_GATE, $0, NONE ; 0x95c48
	map_header_2 DiglettsCave, DIGLETTS_CAVE, $9, NONE ; 0x95c54
	map_header_2 MountMoon, MOUNT_MOON, $9, NONE ; 0x95c60
	map_header_2 Underground, UNDERGROUND, $0, NONE ; 0x95c6c
	map_header_2 RockTunnel1F, ROCK_TUNNEL_1F, $9, NONE ; 0x95c78
	map_header_2 RockTunnelB1F, ROCK_TUNNEL_B1F, $9, NONE ; 0x95c84
	map_header_2 SafariZoneFuchsiaGateBeta, SAFARI_ZONE_FUCHSIA_GATE_BETA, $0, NONE ; 0x95c90
	map_header_2 SafariZoneBeta, SAFARI_ZONE_BETA, $13, NONE ; 0x95c9c
	map_header_2 VictoryRoad, VICTORY_ROAD, $1d, NONE ; 0x95ca8
	map_header_2 EcruteakHouse, ECRUTEAK_HOUSE, $0, NONE ; 0x95cb4
	map_header_2 WiseTriosRoom, WISE_TRIOS_ROOM, $0, NONE ; 0x95cc0
	map_header_2 EcruteakPokeCenter1F, ECRUTEAK_POKECENTER_1F, $0, NONE ; 0x95ccc
	map_header_2 EcruteakLugiaSpeechHouse, ECRUTEAK_LUGIA_SPEECH_HOUSE, $0, NONE ; 0x95cd8
	map_header_2 DanceTheatre, DANCE_THEATRE, $0, NONE ; 0x95ce4
	map_header_2 EcruteakMart, ECRUTEAK_MART, $0, NONE ; 0x95cf0
	map_header_2 EcruteakGym, ECRUTEAK_GYM, $0, NONE ; 0x95cfc
	map_header_2 EcruteakItemfinderHouse, ECRUTEAK_ITEMFINDER_HOUSE, $0, NONE ; 0x95d08
	map_header_2 BlackthornGym1F, BLACKTHORN_GYM_1F, $0, NONE ; 0x95d14
	map_header_2 BlackthornGym2F, BLACKTHORN_GYM_2F, $0, NONE ; 0x95d20
	map_header_2 BlackthornDragonSpeechHouse, BLACKTHORN_DRAGON_SPEECH_HOUSE, $0, NONE ; 0x95d2c
	map_header_2 BlackthornDodrioTradeHouse, BLACKTHORN_DODRIO_TRADE_HOUSE, $0, NONE ; 0x95d38
	map_header_2 BlackthornMart, BLACKTHORN_MART, $0, NONE ; 0x95d44
	map_header_2 BlackthornPokeCenter1F, BLACKTHORN_POKECENTER_1F, $0, NONE ; 0x95d50
	map_header_2 MoveDeletersHouse, MOVE_DELETERS_HOUSE, $0, NONE ; 0x95d5c
	map_header_2 CinnabarPokeCenter1F, CINNABAR_POKECENTER_1F, $0, NONE ; 0x95d68
	map_header_2 CinnabarPokeCenter2FBeta, CINNABAR_POKECENTER_2F_BETA, $0, NONE ; 0x95d74
	map_header_2 Route19FuchsiaGate, ROUTE_19___FUCHSIA_GATE, $0, NONE ; 0x95d80
	map_header_2 SeafoamGym, SEAFOAM_GYM, $9, NONE ; 0x95d8c
	map_header_2 CeruleanGymBadgeSpeechHouse, CERULEAN_GYM_BADGE_SPEECH_HOUSE, $0, NONE ; 0x95d98
	map_header_2 CeruleanPoliceStation, CERULEAN_POLICE_STATION, $0, NONE ; 0x95da4
	map_header_2 CeruleanTradeSpeechHouse, CERULEAN_TRADE_SPEECH_HOUSE, $0, NONE ; 0x95db0
	map_header_2 CeruleanPokeCenter1F, CERULEAN_POKECENTER_1F, $0, NONE ; 0x95dbc
	map_header_2 CeruleanPokeCenter2FBeta, CERULEAN_POKECENTER_2F_BETA, $0, NONE ; 0x95dc8
	map_header_2 CeruleanGym, CERULEAN_GYM, $0, NONE ; 0x95dd4
	map_header_2 CeruleanMart, CERULEAN_MART, $0, NONE ; 0x95de0
	map_header_2 Route10PokeCenter1F, ROUTE_10_POKECENTER_1F, $0, NONE ; 0x95dec
	map_header_2 Route10PokeCenter2FBeta, ROUTE_10_POKECENTER_2F_BETA, $0, NONE ; 0x95df8
	map_header_2 PowerPlant, POWER_PLANT, $0, NONE ; 0x95e04
	map_header_2 BillsHouse, BILLS_HOUSE, $0, NONE ; 0x95e10
	map_header_2 AzaleaPokeCenter1F, AZALEA_POKECENTER_1F, $0, NONE ; 0x95e1c
	map_header_2 CharcoalKiln, CHARCOAL_KILN, $0, NONE ; 0x95e28
	map_header_2 AzaleaMart, AZALEA_MART, $0, NONE ; 0x95e34
	map_header_2 KurtsHouse, KURTS_HOUSE, $0, NONE ; 0x95e40
	map_header_2 AzaleaGym, AZALEA_GYM, $0, NONE ; 0x95e4c
	map_header_2 LakeofRageHiddenPowerHouse, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, $0, NONE ; 0x95e58
	map_header_2 LakeofRageMagikarpHouse, LAKE_OF_RAGE_MAGIKARP_HOUSE, $0, NONE ; 0x95e64
	map_header_2 Route43MahoganyGate, ROUTE_43_MAHOGANY_GATE, $0, NONE ; 0x95e70
	map_header_2 Route43Gate, ROUTE_43_GATE, $0, NONE ; 0x95e7c
	map_header_2 VioletMart, VIOLET_MART, $0, NONE ; 0x95e88
	map_header_2 VioletGym, VIOLET_GYM, $0, NONE ; 0x95e94
	map_header_2 EarlsPokemonAcademy, EARLS_POKEMON_ACADEMY, $0, NONE ; 0x95ea0
	map_header_2 VioletNicknameSpeechHouse, VIOLET_NICKNAME_SPEECH_HOUSE, $0, NONE ; 0x95eac
	map_header_2 VioletPokeCenter1F, VIOLET_POKECENTER_1F, $0, NONE ; 0x95eb8
	map_header_2 VioletOnixTradeHouse, VIOLET_ONIX_TRADE_HOUSE, $0, NONE ; 0x95ec4
	map_header_2 Route32RuinsofAlphGate, ROUTE_32_RUINS_OF_ALPH_GATE, $0, NONE ; 0x95ed0
	map_header_2 Route32PokeCenter1F, ROUTE_32_POKECENTER_1F, $0, NONE ; 0x95edc
	map_header_2 Route35Goldenrodgate, ROUTE_35_GOLDENROD_GATE, $0, NONE ; 0x95ee8
	map_header_2 Route35NationalParkgate, ROUTE_35_NATIONAL_PARK_GATE, $0, NONE ; 0x95ef4
	map_header_2 Route36RuinsofAlphgate, ROUTE_36_RUINS_OF_ALPH_GATE, $0, NONE ; 0x95f00
	map_header_2 Route36NationalParkgate, ROUTE_36_NATIONAL_PARK_GATE, $0, NONE ; 0x95f0c
	map_header_2 GoldenrodGym, GOLDENROD_GYM, $0, NONE ; 0x95f18
	map_header_2 GoldenrodBikeShop, GOLDENROD_BIKE_SHOP, $0, NONE ; 0x95f24
	map_header_2 GoldenrodHappinessRater, GOLDENROD_HAPPINESS_RATER, $0, NONE ; 0x95f30
	map_header_2 GoldenrodBillsHouse, GOLDENROD_BILLS_HOUSE, $0, NONE ; 0x95f3c
	map_header_2 GoldenrodMagnetTrainStation, GOLDENROD_MAGNET_TRAIN_STATION, $0, NONE ; 0x95f48
	map_header_2 GoldenrodFlowerShop, GOLDENROD_FLOWER_SHOP, $0, NONE ; 0x95f54
	map_header_2 GoldenrodPPSpeechHouse, GOLDENROD_PP_SPEECH_HOUSE, $0, NONE ; 0x95f60
	map_header_2 GoldenrodNameRatersHouse, GOLDENROD_NAME_RATERS_HOUSE, $0, NONE ; 0x95f6c
	map_header_2 GoldenrodDeptStore1F, GOLDENROD_DEPT_STORE_1F, $0, NONE ; 0x95f78
	map_header_2 GoldenrodDeptStore2F, GOLDENROD_DEPT_STORE_2F, $0, NONE ; 0x95f84
	map_header_2 GoldenrodDeptStore3F, GOLDENROD_DEPT_STORE_3F, $0, NONE ; 0x95f90
	map_header_2 GoldenrodDeptStore4F, GOLDENROD_DEPT_STORE_4F, $0, NONE ; 0x95f9c
	map_header_2 GoldenrodDeptStore5F, GOLDENROD_DEPT_STORE_5F, $0, NONE ; 0x95fa8
	map_header_2 GoldenrodDeptStore6F, GOLDENROD_DEPT_STORE_6F, $0, NONE ; 0x95fb4
	map_header_2 GoldenrodDeptStoreElevator, GOLDENROD_DEPT_STORE_ELEVATOR, $0, NONE ; 0x95fc0
	map_header_2 GoldenrodDeptStoreRoof, GOLDENROD_DEPT_STORE_ROOF, $24, NONE ; 0x95fcc
	map_header_2 GoldenrodGameCorner, GOLDENROD_GAME_CORNER, $0, NONE ; 0x95fd8
	map_header_2 GoldenrodPokeCenter1F, GOLDENROD_POKECENTER_1F, $0, NONE ; 0x95fe4
	map_header_2 GoldenrodPokeComCenter2FMobile, GOLDENROD_POKECOM_CENTER_2F_MOBILE, $0, NONE ; 0x95ff0
	map_header_2 IlexForestAzaleaGate, ILEX_FOREST_AZALEA_GATE, $0, NONE ; 0x95ffc
	map_header_2 Route34IlexForestGate, ROUTE_34_ILEX_FOREST_GATE, $0, NONE ; 0x96008
	map_header_2 DayCare, DAY_CARE, $0, NONE ; 0x96014
	map_header_2 VermilionHouseFishingSpeechHouse, VERMILION_HOUSE_FISHING_SPEECH_HOUSE, $0, NONE ; 0x96020
	map_header_2 VermilionPokeCenter1F, VERMILION_POKECENTER_1F, $0, NONE ; 0x9602c
	map_header_2 VermilionPokeCenter2FBeta, VERMILION_POKECENTER_2F_BETA, $0, NONE ; 0x96038
	map_header_2 PokemonFanClub, POKEMON_FAN_CLUB, $0, NONE ; 0x96044
	map_header_2 VermilionMagnetTrainSpeechHouse, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, $0, NONE ; 0x96050
	map_header_2 VermilionMart, VERMILION_MART, $0, NONE ; 0x9605c
	map_header_2 VermilionHouseDiglettsCaveSpeechHouse, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE, $0, NONE ; 0x96068
	map_header_2 VermilionGym, VERMILION_GYM, $0, NONE ; 0x96074
	map_header_2 Route6SaffronGate, ROUTE_6_SAFFRON_GATE, $0, NONE ; 0x96080
	map_header_2 Route6UndergroundEntrance, ROUTE_6_UNDERGROUND_ENTRANCE, $0, NONE ; 0x9608c
	map_header_2 RedsHouse1F, REDS_HOUSE_1F, $0, NONE ; 0x96098
	map_header_2 RedsHouse2F, REDS_HOUSE_2F, $0, NONE ; 0x960a4
	map_header_2 BluesHouse, BLUES_HOUSE, $0, NONE ; 0x960b0
	map_header_2 OaksLab, OAKS_LAB, $0, NONE ; 0x960bc
	map_header_2 PewterNidoranSpeechHouse, PEWTER_NIDORAN_SPEECH_HOUSE, $0, NONE ; 0x960c8
	map_header_2 PewterGym, PEWTER_GYM, $0, NONE ; 0x960d4
	map_header_2 PewterMart, PEWTER_MART, $0, NONE ; 0x960e0
	map_header_2 PewterPokeCenter1F, PEWTER_POKECENTER_1F, $0, NONE ; 0x960ec
	map_header_2 PewterPokeCEnter2FBeta, PEWTER_POKECENTER_2F_BETA, $0, NONE ; 0x960f8
	map_header_2 PewterSnoozeSpeechHouse, PEWTER_SNOOZE_SPEECH_HOUSE, $0, NONE ; 0x96104
	map_header_2 OlivinePort, OLIVINE_PORT, $a, NONE ; 0x96110
	map_header_2 VermilionPort, VERMILION_PORT, $a, NONE ; 0x9611c
	map_header_2 FastShip1F, FAST_SHIP_1F, $0, NONE ; 0x96128
	map_header_2 FastShipCabins_NNW_NNE_NE, FAST_SHIP_CABINS_NNW_NNE_NE, $0, NONE ; 0x96134
	map_header_2 FastShipCabins_SW_SSW_NW, FAST_SHIP_CABINS_SW_SSW_NW, $0, NONE ; 0x96140
	map_header_2 FastShipCabins_SE_SSE_CaptainsCabin, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, $0, NONE ; 0x9614c
	map_header_2 FastShipB1F, FAST_SHIP_B1F, $0, NONE ; 0x96158
	map_header_2 OlivinePortPassage, OLIVINE_PORT_PASSAGE, $0, NONE ; 0x96164
	map_header_2 VermilionPortPassage, VERMILION_PORT_PASSAGE, $0, NONE ; 0x96170
	map_header_2 MountMoonSquare, MOUNT_MOON_SQUARE, $2d, NONE ; 0x9617c
	map_header_2 MountMoonGiftShop, MOUNT_MOON_GIFT_SHOP, $0, NONE ; 0x96188
	map_header_2 TinTowerRoof, TIN_TOWER_ROOF, $0, NONE ; 0x96194
	map_header_2 IndigoPlateauPokeCenter1F, INDIGO_PLATEAU_POKECENTER_1F, $0, NONE ; 0x961a0
	map_header_2 WillsRoom, WILLS_ROOM, $0, NONE ; 0x961ac
	map_header_2 KogasRoom, KOGAS_ROOM, $0, NONE ; 0x961b8
	map_header_2 BrunosRoom, BRUNOS_ROOM, $0, NONE ; 0x961c4
	map_header_2 KarensRoom, KARENS_ROOM, $0, NONE ; 0x961d0
	map_header_2 LancesRoom, LANCES_ROOM, $0, NONE ; 0x961dc
	map_header_2 HallOfFame, HALL_OF_FAME, $0, NONE ; 0x961e8
	map_header_2 FuchsiaMart, FUCHSIA_MART, $0, NONE ; 0x961f4
	map_header_2 SafariZoneMainOffice, SAFARI_ZONE_MAIN_OFFICE, $0, NONE ; 0x96200
	map_header_2 FuchsiaGym, FUCHSIA_GYM, $0, NONE ; 0x9620c
	map_header_2 FuchsiaBillSpeechHouse, FUCHSIA_BILL_SPEECH_HOUSE, $0, NONE ; 0x96218
	map_header_2 FuchsiaPokeCenter1F, FUCHSIA_POKECENTER_1F, $0, NONE ; 0x96224
	map_header_2 FuchsiaPokeCenter2FBeta, FUCHSIA_POKECENTER_2F_BETA, $0, NONE ; 0x96230
	map_header_2 SafariZoneWardensHome, SAFARI_ZONE_WARDENS_HOME, $0, NONE ; 0x9623c
	map_header_2 Route15FuchsiaGate, ROUTE_15_FUCHSIA_GATE, $0, NONE ; 0x96248
	map_header_2 LavenderPokeCenter1F, LAVENDER_POKECENTER_1F, $0, NONE ; 0x96254
	map_header_2 LavenderPokeCenter2FBeta, LAVENDER_POKECENTER_2F_BETA, $0, NONE ; 0x96260
	map_header_2 MrFujisHouse, MR_FUJIS_HOUSE, $0, NONE ; 0x9626c
	map_header_2 LavenderTownSpeechHouse, LAVENDER_TOWN_SPEECH_HOUSE, $0, NONE ; 0x96278
	map_header_2 LavenderNameRater, LAVENDER_NAME_RATER, $0, NONE ; 0x96284
	map_header_2 LavenderMart, LAVENDER_MART, $0, NONE ; 0x96290
	map_header_2 SoulHouse, SOUL_HOUSE, $0, NONE ; 0x9629c
	map_header_2 LavRadioTower1F, LAV_RADIO_TOWER_1F, $0, NONE ; 0x962a8
	map_header_2 Route8SaffronGate, ROUTE_8_SAFFRON_GATE, $0, NONE ; 0x962b4
	map_header_2 Route12SuperRodHouse, ROUTE_12_SUPER_ROD_HOUSE, $0, NONE ; 0x962c0
	map_header_2 SilverCavePokeCenter1F, SILVER_CAVE_POKECENTER_1F, $0, NONE ; 0x962cc
	map_header_2 Route28FamousSpeechHouse, ROUTE_28_FAMOUS_SPEECH_HOUSE, $0, NONE ; 0x962d8
	map_header_2 PokeCenter2F, POKECENTER_2F, $0, NONE ; 0x962e4
	map_header_2 TradeCenter, TRADE_CENTER, $0, NONE ; 0x962f0
	map_header_2 Colosseum, COLOSSEUM, $0, NONE ; 0x962fc
	map_header_2 TimeCapsule, TIME_CAPSULE, $0, NONE ; 0x96308
	map_header_2 MobileTradeRoomMobile, MOBILE_TRADE_ROOM_MOBILE, $0, NONE ; 0x96314
	map_header_2 MobileBattleRoom, MOBILE_BATTLE_ROOM, $0, NONE ; 0x96320
	map_header_2 CeladonDeptStore1F, CELADON_DEPT_STORE_1F, $0, NONE ; 0x9632c
	map_header_2 CeladonDeptStore2F, CELADON_DEPT_STORE_2F, $0, NONE ; 0x96338
	map_header_2 CeladonDeptStore3F, CELADON_DEPT_STORE_3F, $0, NONE ; 0x96344
	map_header_2 CeladonDeptStore4F, CELADON_DEPT_STORE_4F, $0, NONE ; 0x96350
	map_header_2 CeladonDeptStore5F, CELADON_DEPT_STORE_5F, $0, NONE ; 0x9635c
	map_header_2 CeladonDeptStore6F, CELADON_DEPT_STORE_6F, $0, NONE ; 0x96368
	map_header_2 CeladonDeptStoreElevator, CELADON_DEPT_STORE_ELEVATOR, $0, NONE ; 0x96374
	map_header_2 CeladonMansion1F, CELADON_MANSION_1F, $0, NONE ; 0x96380
	map_header_2 CeladonMansion2F, CELADON_MANSION_2F, $0, NONE ; 0x9638c
	map_header_2 CeladonMansion3F, CELADON_MANSION_3F, $0, NONE ; 0x96398
	map_header_2 CeladonMansionRoof, CELADON_MANSION_ROOF, $1, NONE ; 0x963a4
	map_header_2 CeladonMansionRoofHouse, CELADON_MANSION_ROOF_HOUSE, $0, NONE ; 0x963b0
	map_header_2 CeladonPokeCenter1F, CELADON_POKECENTER_1F, $0, NONE ; 0x963bc
	map_header_2 CeladonPokeCenter2FBeta, CELADON_POKECENTER_2F_BETA, $0, NONE ; 0x963c8
	map_header_2 CeladonGameCorner, CELADON_GAME_CORNER, $0, NONE ; 0x963d4
	map_header_2 CeladonGameCornerPrizeRoom, CELADON_GAME_CORNER_PRIZE_ROOM, $0, NONE ; 0x963e0
	map_header_2 CeladonGym, CELADON_GYM, $0, NONE ; 0x963ec
	map_header_2 CeladonCafe, CELADON_CAFE, $0, NONE ; 0x963f8
	map_header_2 Route16FuchsiaSpeechHouse, ROUTE_16_FUCHSIA_SPEECH_HOUSE, $0, NONE ; 0x96404
	map_header_2 Route16Gate, ROUTE_16_GATE, $0, NONE ; 0x96410
	map_header_2 Route7SaffronGate, ROUTE_7_SAFFRON_GATE, $0, NONE ; 0x9641c
	map_header_2 Route1718Gate, ROUTE_17_18_GATE, $0, NONE ; 0x96428
	map_header_2 ManiasHouse, MANIAS_HOUSE, $0, NONE ; 0x96434
	map_header_2 CianwoodGym, CIANWOOD_GYM, $0, NONE ; 0x96440
	map_header_2 CianwoodPokeCenter1F, CIANWOOD_POKECENTER_1F, $0, NONE ; 0x9644c
	map_header_2 CianwoodPharmacy, CIANWOOD_PHARMACY, $0, NONE ; 0x96458
	map_header_2 CianwoodCityPhotoStudio, CIANWOOD_CITY_PHOTO_STUDIO, $0, NONE ; 0x96464
	map_header_2 CianwoodLugiaSpeechHouse, CIANWOOD_LUGIA_SPEECH_HOUSE, $0, NONE ; 0x96470
	map_header_2 PokeSeersHouse, POKE_SEERS_HOUSE, $0, NONE ; 0x9647c
	map_header_2 BattleTower1F, BATTLE_TOWER_1F, $0, NONE ; 0x96488
	map_header_2 BattleTowerBattleRoom, BATTLE_TOWER_BATTLE_ROOM, $0, NONE ; 0x96494
	map_header_2 BattleTowerElevator, BATTLE_TOWER_ELEVATOR, $0, NONE ; 0x964a0
	map_header_2 BattleTowerHallway, BATTLE_TOWER_HALLWAY, $0, NONE ; 0x964ac
	map_header_2 Route40BattleTowerGate, ROUTE_40_BATTLE_TOWER_GATE, $0, NONE ; 0x964b8
	map_header_2 BattleTowerOutside, BATTLE_TOWER_OUTSIDE, $5, NONE ; 0x964c4
	map_header_2 ViridianGym, VIRIDIAN_GYM, $0, NONE ; 0x964d0
	map_header_2 ViridianNicknameSpeechHouse, VIRIDIAN_NICKNAME_SPEECH_HOUSE, $0, NONE ; 0x964dc
	map_header_2 TrainerHouse1F, TRAINER_HOUSE_1F, $0, NONE ; 0x964e8
	map_header_2 TrainerHouseB1F, TRAINER_HOUSE_B1F, $0, NONE ; 0x964f4
	map_header_2 ViridianMart, VIRIDIAN_MART, $0, NONE ; 0x96500
	map_header_2 ViridianPokeCenter1F, VIRIDIAN_POKECENTER_1F, $0, NONE ; 0x9650c
	map_header_2 ViridianPokeCenter2FBeta, VIRIDIAN_POKECENTER_2F_BETA, $0, NONE ; 0x96518
	map_header_2 Route2NuggetSpeechHouse, ROUTE_2_NUGGET_SPEECH_HOUSE, $0, NONE ; 0x96524
	map_header_2 Route2Gate, ROUTE_2_GATE, $0, NONE ; 0x96530
	map_header_2 VictoryRoadGate, VICTORY_ROAD_GATE, $0, NONE ; 0x9653c
	map_header_2 ElmsLab, ELMS_LAB, $0, NONE ; 0x96548
	map_header_2 KrissHouse1F, KRISS_HOUSE_1F, $0, NONE ; 0x96554
	map_header_2 KrissHouse2F, KRISS_HOUSE_2F, $0, NONE ; 0x96560
	map_header_2 KrissNeighborsHouse, KRISS_NEIGHBORS_HOUSE, $0, NONE ; 0x9656c
	map_header_2 ElmsHouse, ELMS_HOUSE, $0, NONE ; 0x96578
	map_header_2 Route26HealSpeechHouse, ROUTE_26_HEAL_SPEECH_HOUSE, $0, NONE ; 0x96584
	map_header_2 Route26DayofWeekSiblingsHouse, ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE, $0, NONE ; 0x96590
	map_header_2 Route27SandstormHouse, ROUTE_27_SANDSTORM_HOUSE, $0, NONE ; 0x9659c
	map_header_2 Route2946Gate, ROUTE_29_46_GATE, $0, NONE ; 0x965a8
	map_header_2 FightingDojo, FIGHTING_DOJO, $0, NONE ; 0x965b4
	map_header_2 SaffronGym, SAFFRON_GYM, $0, NONE ; 0x965c0
	map_header_2 SaffronMart, SAFFRON_MART, $0, NONE ; 0x965cc
	map_header_2 SaffronPokeCenter1F, SAFFRON_POKECENTER_1F, $0, NONE ; 0x965d8
	map_header_2 SaffronPokeCenter2FBeta, SAFFRON_POKECENTER_2F_BETA, $0, NONE ; 0x965e4
	map_header_2 MrPsychicsHouse, MR_PSYCHICS_HOUSE, $0, NONE ; 0x965f0
	map_header_2 SaffronTrainStation, SAFFRON_TRAIN_STATION, $0, NONE ; 0x965fc
	map_header_2 SilphCo1F, SILPH_CO_1F, $0, NONE ; 0x96608
	map_header_2 CopycatsHouse1F, COPYCATS_HOUSE_1F, $0, NONE ; 0x96614
	map_header_2 CopycatsHouse2F, COPYCATS_HOUSE_2F, $0, NONE ; 0x96620
	map_header_2 Route5UndergroundEntrance, ROUTE_5_UNDERGROUND_ENTRANCE, $0, NONE ; 0x9662c
	map_header_2 Route5SaffronCityGate, ROUTE_5_SAFFRON_CITY_GATE, $0, NONE ; 0x96638
	map_header_2 Route5CleanseTagSpeechHouse, ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE, $0, NONE ; 0x96644
	map_header_2 CherrygroveMart, CHERRYGROVE_MART, $0, NONE ; 0x96650
	map_header_2 CherrygrovePokeCenter1F, CHERRYGROVE_POKECENTER_1F, $0, NONE ; 0x9665c
	map_header_2 CherrygroveGymSpeechHouse, CHERRYGROVE_GYM_SPEECH_HOUSE, $0, NONE ; 0x96668
	map_header_2 GuideGentsHouse, GUIDE_GENTS_HOUSE, $0, NONE ; 0x96674
	map_header_2 CherrygroveEvolutionSpeechHouse, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, $0, NONE ; 0x96680
	map_header_2 Route30BerrySpeechHouse, ROUTE_30_BERRY_SPEECH_HOUSE, $0, NONE ; 0x9668c
	map_header_2 MrPokemonsHouse, MR_POKEMONS_HOUSE, $0, NONE ; 0x96698
	map_header_2 Route31VioletGate, ROUTE_31_VIOLET_GATE, $0, NONE ; 0x966a4

