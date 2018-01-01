newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

mapgroup: MACRO
;\1: map id
;\2: height: in blocks
;\3: width: in blocks
GROUP_\1 EQU const_value
	enum MAP_\1
\1_HEIGHT EQU \2
\1_WIDTH EQU \3
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see maps/map_headers.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; `mapgroup` indexes are for the sub-tables of MapGroupPointers (see maps/map_headers.asm)
	const_def

	newgroup                                                     ;  1

	mapgroup OLIVINE_POKECENTER_1F,                        4,  5 ;  1
	mapgroup OLIVINE_GYM,                                  8,  5 ;  2
	mapgroup OLIVINE_TIMS_HOUSE,                           4,  4 ;  3
	mapgroup OLIVINE_HOUSE_BETA,                           4,  4 ;  4
	mapgroup OLIVINE_PUNISHMENT_SPEECH_HOUSE,              4,  4 ;  5
	mapgroup OLIVINE_GOOD_ROD_HOUSE,                       4,  4 ;  6
	mapgroup OLIVINE_CAFE,                                 4,  4 ;  7
	mapgroup OLIVINE_MART,                                 4,  6 ;  8
	mapgroup ROUTE_38_ECRUTEAK_GATE,                       4,  5 ;  9
	mapgroup ROUTE_39_BARN,                                4,  4 ; 10
	mapgroup ROUTE_39_FARMHOUSE,                           4,  4 ; 11
	mapgroup ROUTE_38,                                     9, 20 ; 12
	mapgroup ROUTE_39,                                    18, 10 ; 13
	mapgroup OLIVINE_CITY,                                18, 20 ; 14

	newgroup                                                     ;  2

	mapgroup MAHOGANY_RED_GYARADOS_SPEECH_HOUSE,           4,  4 ;  1
	mapgroup MAHOGANY_GYM,                                 9,  5 ;  2
	mapgroup MAHOGANY_POKECENTER_1F,                       4,  5 ;  3
	mapgroup ROUTE_42_ECRUTEAK_GATE,                       4,  5 ;  4
	mapgroup ROUTE_42,                                     9, 30 ;  5
	mapgroup ROUTE_44,                                     9, 30 ;  6
	mapgroup MAHOGANY_TOWN,                                9, 10 ;  7

	newgroup                                                     ;  3

	mapgroup SPROUT_TOWER_1F,                              8, 10 ;  1
	mapgroup SPROUT_TOWER_2F,                              8, 10 ;  2
	mapgroup SPROUT_TOWER_3F,                              8, 10 ;  3
	mapgroup TIN_TOWER_1F,                                 9, 10 ;  4
	mapgroup TIN_TOWER_2F,                                 9, 10 ;  5
	mapgroup TIN_TOWER_3F,                                 9, 10 ;  6
	mapgroup TIN_TOWER_4F,                                 9, 10 ;  7
	mapgroup TIN_TOWER_5F,                                 9, 10 ;  8
	mapgroup TIN_TOWER_6F,                                 9, 10 ;  9
	mapgroup TIN_TOWER_7F,                                 9, 10 ; 10
	mapgroup TIN_TOWER_8F,                                 9, 10 ; 11
	mapgroup TIN_TOWER_9F,                                 9, 10 ; 12
	mapgroup BURNED_TOWER_1F,                              9, 10 ; 13
	mapgroup BURNED_TOWER_B1F,                             9, 10 ; 14
	mapgroup NATIONAL_PARK,                               27, 20 ; 15
	mapgroup NATIONAL_PARK_BUG_CONTEST,                   27, 20 ; 16
	mapgroup RADIO_TOWER_1F,                               4,  9 ; 17
	mapgroup RADIO_TOWER_2F,                               4,  9 ; 18
	mapgroup RADIO_TOWER_3F,                               4,  9 ; 19
	mapgroup RADIO_TOWER_4F,                               4,  9 ; 20
	mapgroup RADIO_TOWER_5F,                               4,  9 ; 21
	mapgroup RUINS_OF_ALPH_OUTSIDE,                       18, 10 ; 22
	mapgroup RUINS_OF_ALPH_HO_OH_CHAMBER,                  5,  4 ; 23
	mapgroup RUINS_OF_ALPH_KABUTO_CHAMBER,                 5,  4 ; 24
	mapgroup RUINS_OF_ALPH_OMANYTE_CHAMBER,                5,  4 ; 25
	mapgroup RUINS_OF_ALPH_AERODACTYL_CHAMBER,             5,  4 ; 26
	mapgroup RUINS_OF_ALPH_INNER_CHAMBER,                 14, 10 ; 27
	mapgroup RUINS_OF_ALPH_RESEARCH_CENTER,                4,  4 ; 28
	mapgroup RUINS_OF_ALPH_HO_OH_ITEM_ROOM,                5,  4 ; 29
	mapgroup RUINS_OF_ALPH_KABUTO_ITEM_ROOM,               5,  4 ; 30
	mapgroup RUINS_OF_ALPH_OMANYTE_ITEM_ROOM,              5,  4 ; 31
	mapgroup RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM,           5,  4 ; 32
	mapgroup RUINS_OF_ALPH_HO_OH_WORD_ROOM,               12, 10 ; 33
	mapgroup RUINS_OF_ALPH_KABUTO_WORD_ROOM,               7, 10 ; 34
	mapgroup RUINS_OF_ALPH_OMANYTE_WORD_ROOM,              8, 10 ; 35
	mapgroup RUINS_OF_ALPH_AERODACTYL_WORD_ROOM,           7, 10 ; 36
	mapgroup UNION_CAVE_1F,                               18, 10 ; 37
	mapgroup UNION_CAVE_B1F,                              18, 10 ; 38
	mapgroup UNION_CAVE_B2F,                              18, 10 ; 39
	mapgroup SLOWPOKE_WELL_B1F,                            9, 10 ; 40
	mapgroup SLOWPOKE_WELL_B2F,                            9, 10 ; 41
	mapgroup OLIVINE_LIGHTHOUSE_1F,                        9, 10 ; 42
	mapgroup OLIVINE_LIGHTHOUSE_2F,                        9, 10 ; 43
	mapgroup OLIVINE_LIGHTHOUSE_3F,                        9, 10 ; 44
	mapgroup OLIVINE_LIGHTHOUSE_4F,                        9, 10 ; 45
	mapgroup OLIVINE_LIGHTHOUSE_5F,                        9, 10 ; 46
	mapgroup OLIVINE_LIGHTHOUSE_6F,                        9, 10 ; 47
	mapgroup MAHOGANY_MART_1F,                             4,  4 ; 48
	mapgroup TEAM_ROCKET_BASE_B1F,                         9, 15 ; 49
	mapgroup TEAM_ROCKET_BASE_B2F,                         9, 15 ; 50
	mapgroup TEAM_ROCKET_BASE_B3F,                         9, 15 ; 51
	mapgroup ILEX_FOREST,                                 27, 15 ; 52
	mapgroup GOLDENROD_UNDERGROUND,                       18, 15 ; 53
	mapgroup GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 18, 15 ; 54
	mapgroup GOLDENROD_DEPT_STORE_B1F,                     9, 10 ; 55
	mapgroup GOLDENROD_UNDERGROUND_WAREHOUSE,              9, 10 ; 56
	mapgroup MOUNT_MORTAR_1F_OUTSIDE,                     18, 20 ; 57
	mapgroup MOUNT_MORTAR_1F_INSIDE,                      27, 20 ; 58
	mapgroup MOUNT_MORTAR_2F_INSIDE,                      18, 20 ; 59
	mapgroup MOUNT_MORTAR_B1F,                            18, 20 ; 60
	mapgroup ICE_PATH_1F,                                 18, 20 ; 61
	mapgroup ICE_PATH_B1F,                                18, 10 ; 62
	mapgroup ICE_PATH_B2F_MAHOGANY_SIDE,                   9, 10 ; 63
	mapgroup ICE_PATH_B2F_BLACKTHORN_SIDE,                 9,  5 ; 64
	mapgroup ICE_PATH_B3F,                                 9, 10 ; 65
	mapgroup WHIRL_ISLAND_NW,                              9,  5 ; 66
	mapgroup WHIRL_ISLAND_NE,                              9, 10 ; 67
	mapgroup WHIRL_ISLAND_SW,                              9, 10 ; 68
	mapgroup WHIRL_ISLAND_CAVE,                            9,  5 ; 69
	mapgroup WHIRL_ISLAND_SE,                              9,  5 ; 70
	mapgroup WHIRL_ISLAND_B1F,                            18, 20 ; 71
	mapgroup WHIRL_ISLAND_B2F,                            18, 10 ; 72
	mapgroup WHIRL_ISLAND_LUGIA_CHAMBER,                   9, 10 ; 73
	mapgroup SILVER_CAVE_ROOM_1,                          18, 10 ; 74
	mapgroup SILVER_CAVE_ROOM_2,                          18, 15 ; 75
	mapgroup SILVER_CAVE_ROOM_3,                          18, 10 ; 76
	mapgroup SILVER_CAVE_ITEM_ROOMS,                       9, 10 ; 77
	mapgroup DARK_CAVE_VIOLET_ENTRANCE,                   18, 20 ; 78
	mapgroup DARK_CAVE_BLACKTHORN_ENTRANCE,               18, 15 ; 79
	mapgroup DRAGONS_DEN_1F,                               9,  5 ; 80
	mapgroup DRAGONS_DEN_B1F,                             18, 20 ; 81
	mapgroup DRAGON_SHRINE,                                5,  5 ; 82
	mapgroup TOHJO_FALLS,                                  9, 15 ; 83
	mapgroup DIGLETTS_CAVE,                               18, 10 ; 84
	mapgroup MOUNT_MOON,                                   9, 15 ; 85
	mapgroup UNDERGROUND_PATH,                            14,  3 ; 86
	mapgroup ROCK_TUNNEL_1F,                              18, 15 ; 87
	mapgroup ROCK_TUNNEL_B1F,                             18, 15 ; 88
	mapgroup SAFARI_ZONE_FUCHSIA_GATE_BETA,                4,  5 ; 89
	mapgroup SAFARI_ZONE_BETA,                            18, 10 ; 90
	mapgroup VICTORY_ROAD,                                36, 10 ; 91

	newgroup                                                     ;  4

	mapgroup ECRUTEAK_HOUSE,                               9, 10 ;  1
	mapgroup WISE_TRIOS_ROOM,                              4,  4 ;  2
	mapgroup ECRUTEAK_POKECENTER_1F,                       4,  5 ;  3
	mapgroup ECRUTEAK_LUGIA_SPEECH_HOUSE,                  4,  4 ;  4
	mapgroup DANCE_THEATRE,                                7,  6 ;  5
	mapgroup ECRUTEAK_MART,                                4,  6 ;  6
	mapgroup ECRUTEAK_GYM,                                 9,  5 ;  7
	mapgroup ECRUTEAK_ITEMFINDER_HOUSE,                    4,  4 ;  8
	mapgroup ECRUTEAK_CITY,                               18, 20 ;  9

	newgroup                                                     ;  5

	mapgroup BLACKTHORN_GYM_1F,                            9,  5 ;  1
	mapgroup BLACKTHORN_GYM_2F,                            9,  5 ;  2
	mapgroup BLACKTHORN_DRAGON_SPEECH_HOUSE,               4,  4 ;  3
	mapgroup BLACKTHORN_EMYS_HOUSE,                        4,  4 ;  4
	mapgroup BLACKTHORN_MART,                              4,  6 ;  5
	mapgroup BLACKTHORN_POKECENTER_1F,                     4,  5 ;  6
	mapgroup MOVE_DELETERS_HOUSE,                          4,  4 ;  7
	mapgroup ROUTE_45,                                    45, 10 ;  8
	mapgroup ROUTE_46,                                    18, 10 ;  9
	mapgroup BLACKTHORN_CITY,                             18, 20 ; 10

	newgroup                                                     ;  6

	mapgroup CINNABAR_POKECENTER_1F,                       4,  5 ;  1
	mapgroup CINNABAR_POKECENTER_2F_BETA,                  4,  8 ;  2
	mapgroup ROUTE_19___FUCHSIA_GATE,                      4,  5 ;  3
	mapgroup SEAFOAM_GYM,                                  4,  5 ;  4
	mapgroup ROUTE_19,                                    18, 10 ;  5
	mapgroup ROUTE_20,                                     9, 30 ;  6
	mapgroup ROUTE_21,                                    18, 10 ;  7
	mapgroup CINNABAR_ISLAND,                              9, 10 ;  8

	newgroup                                                     ;  7

	mapgroup CERULEAN_GYM_BADGE_SPEECH_HOUSE,              4,  4 ;  1
	mapgroup CERULEAN_POLICE_STATION,                      4,  4 ;  2
	mapgroup CERULEAN_TRADE_SPEECH_HOUSE,                  4,  4 ;  3
	mapgroup CERULEAN_POKECENTER_1F,                       4,  5 ;  4
	mapgroup CERULEAN_POKECENTER_2F_BETA,                  4,  8 ;  5
	mapgroup CERULEAN_GYM,                                 8,  5 ;  6
	mapgroup CERULEAN_MART,                                4,  6 ;  7
	mapgroup ROUTE_10_POKECENTER_1F,                       4,  5 ;  8
	mapgroup ROUTE_10_POKECENTER_2F_BETA,                  4,  8 ;  9
	mapgroup POWER_PLANT,                                  9, 10 ; 10
	mapgroup BILLS_HOUSE,                                  4,  4 ; 11
	mapgroup ROUTE_4,                                      9, 20 ; 12
	mapgroup ROUTE_9,                                      9, 30 ; 13
	mapgroup ROUTE_10_NORTH,                               9, 10 ; 14
	mapgroup ROUTE_24,                                     9, 10 ; 15
	mapgroup ROUTE_25,                                     9, 30 ; 16
	mapgroup CERULEAN_CITY,                               18, 20 ; 17

	newgroup                                                     ;  8

	mapgroup AZALEA_POKECENTER_1F,                         4,  5 ;  1
	mapgroup CHARCOAL_KILN,                                4,  4 ;  2
	mapgroup AZALEA_MART,                                  4,  6 ;  3
	mapgroup KURTS_HOUSE,                                  4,  8 ;  4
	mapgroup AZALEA_GYM,                                   8,  5 ;  5
	mapgroup ROUTE_33,                                     9, 10 ;  6
	mapgroup AZALEA_TOWN,                                  9, 20 ;  7

	newgroup                                                     ;  9

	mapgroup LAKE_OF_RAGE_HIDDEN_POWER_HOUSE,              4,  4 ;  1
	mapgroup LAKE_OF_RAGE_MAGIKARP_HOUSE,                  4,  4 ;  2
	mapgroup ROUTE_43_MAHOGANY_GATE,                       4,  5 ;  3
	mapgroup ROUTE_43_GATE,                                4,  5 ;  4
	mapgroup ROUTE_43,                                    27, 10 ;  5
	mapgroup LAKE_OF_RAGE,                                18, 20 ;  6

	newgroup                                                     ; 10

	mapgroup ROUTE_32,                                    45, 10 ;  1
	mapgroup ROUTE_35,                                    18, 10 ;  2
	mapgroup ROUTE_36,                                     9, 30 ;  3
	mapgroup ROUTE_37,                                     9, 10 ;  4
	mapgroup VIOLET_CITY,                                 18, 20 ;  5
	mapgroup VIOLET_MART,                                  4,  6 ;  6
	mapgroup VIOLET_GYM,                                   8,  5 ;  7
	mapgroup EARLS_POKEMON_ACADEMY,                        8,  4 ;  8
	mapgroup VIOLET_NICKNAME_SPEECH_HOUSE,                 4,  4 ;  9
	mapgroup VIOLET_POKECENTER_1F,                         4,  5 ; 10
	mapgroup VIOLET_KYLES_HOUSE,                           4,  4 ; 11
	mapgroup ROUTE_32_RUINS_OF_ALPH_GATE,                  4,  5 ; 12
	mapgroup ROUTE_32_POKECENTER_1F,                       4,  5 ; 13
	mapgroup ROUTE_35_GOLDENROD_GATE,                      4,  5 ; 14
	mapgroup ROUTE_35_NATIONAL_PARK_GATE,                  4,  4 ; 15
	mapgroup ROUTE_36_RUINS_OF_ALPH_GATE,                  4,  5 ; 16
	mapgroup ROUTE_36_NATIONAL_PARK_GATE,                  4,  5 ; 17

	newgroup                                                     ; 11

	mapgroup ROUTE_34,                                    27, 10 ;  1
	mapgroup GOLDENROD_CITY,                              18, 20 ;  2
	mapgroup GOLDENROD_GYM,                                9, 10 ;  3
	mapgroup GOLDENROD_BIKE_SHOP,                          4,  4 ;  4
	mapgroup GOLDENROD_HAPPINESS_RATER,                    4,  4 ;  5
	mapgroup GOLDENROD_BILLS_HOUSE,                        4,  4 ;  6
	mapgroup GOLDENROD_MAGNET_TRAIN_STATION,               9, 10 ;  7
	mapgroup GOLDENROD_FLOWER_SHOP,                        4,  4 ;  8
	mapgroup GOLDENROD_PP_SPEECH_HOUSE,                    4,  4 ;  9
	mapgroup GOLDENROD_NAME_RATER,                         4,  4 ; 10
	mapgroup GOLDENROD_DEPT_STORE_1F,                      4,  8 ; 11
	mapgroup GOLDENROD_DEPT_STORE_2F,                      4,  8 ; 12
	mapgroup GOLDENROD_DEPT_STORE_3F,                      4,  8 ; 13
	mapgroup GOLDENROD_DEPT_STORE_4F,                      4,  8 ; 14
	mapgroup GOLDENROD_DEPT_STORE_5F,                      4,  8 ; 15
	mapgroup GOLDENROD_DEPT_STORE_6F,                      4,  8 ; 16
	mapgroup GOLDENROD_DEPT_STORE_ELEVATOR,                2,  2 ; 17
	mapgroup GOLDENROD_DEPT_STORE_ROOF,                    4,  8 ; 18
	mapgroup GOLDENROD_GAME_CORNER,                        7, 10 ; 19
	mapgroup GOLDENROD_POKECENTER_1F,                      4,  5 ; 20
	mapgroup GOLDENROD_POKECOM_CENTER_2F_MOBILE,          16, 16 ; 21
	mapgroup ILEX_FOREST_AZALEA_GATE,                      4,  5 ; 22
	mapgroup ROUTE_34_ILEX_FOREST_GATE,                    4,  5 ; 23
	mapgroup DAY_CARE,                                     4,  5 ; 24

	newgroup                                                     ; 12

	mapgroup ROUTE_6,                                      9, 10 ;  1
	mapgroup ROUTE_11,                                     9, 20 ;  2
	mapgroup VERMILION_CITY,                              18, 20 ;  3
	mapgroup VERMILION_HOUSE_FISHING_SPEECH_HOUSE,         4,  4 ;  4
	mapgroup VERMILION_POKECENTER_1F,                      4,  5 ;  5
	mapgroup VERMILION_POKECENTER_2F_BETA,                 4,  8 ;  6
	mapgroup POKEMON_FAN_CLUB,                             4,  5 ;  7
	mapgroup VERMILION_MAGNET_TRAIN_SPEECH_HOUSE,          4,  4 ;  8
	mapgroup VERMILION_MART,                               4,  6 ;  9
	mapgroup VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE,   4,  4 ; 10
	mapgroup VERMILION_GYM,                                9,  5 ; 11
	mapgroup ROUTE_6_SAFFRON_GATE,                         4,  5 ; 12
	mapgroup ROUTE_6_UNDERGROUND_PATH_ENTRANCE,            4,  4 ; 13

	newgroup                                                     ; 13

	mapgroup ROUTE_1,                                     18, 10 ;  1
	mapgroup PALLET_TOWN,                                  9, 10 ;  2
	mapgroup REDS_HOUSE_1F,                                4,  4 ;  3
	mapgroup REDS_HOUSE_2F,                                4,  4 ;  4
	mapgroup BLUES_HOUSE,                                  4,  4 ;  5
	mapgroup OAKS_LAB,                                     6,  5 ;  6

	newgroup                                                     ; 14

	mapgroup ROUTE_3,                                      9, 30 ;  1
	mapgroup PEWTER_CITY,                                 18, 20 ;  2
	mapgroup PEWTER_NIDORAN_SPEECH_HOUSE,                  4,  4 ;  3
	mapgroup PEWTER_GYM,                                   7,  5 ;  4
	mapgroup PEWTER_MART,                                  4,  6 ;  5
	mapgroup PEWTER_POKECENTER_1F,                         4,  5 ;  6
	mapgroup PEWTER_POKECENTER_2F_BETA,                    4,  8 ;  7
	mapgroup PEWTER_SNOOZE_SPEECH_HOUSE,                   4,  4 ;  8

	newgroup                                                     ; 15

	mapgroup OLIVINE_PORT,                                18, 10 ;  1
	mapgroup VERMILION_PORT,                              18, 10 ;  2
	mapgroup FAST_SHIP_1F,                                 9, 16 ;  3
	mapgroup FAST_SHIP_CABINS_NNW_NNE_NE,                 16,  4 ;  4
	mapgroup FAST_SHIP_CABINS_SW_SSW_NW,                  16,  4 ;  5
	mapgroup FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN,      17,  5 ;  6
	mapgroup FAST_SHIP_B1F,                                8, 16 ;  7
	mapgroup OLIVINE_PORT_PASSAGE,                         9, 10 ;  8
	mapgroup VERMILION_PORT_PASSAGE,                       9, 10 ;  9
	mapgroup MOUNT_MOON_SQUARE,                            9, 15 ; 10
	mapgroup MOUNT_MOON_GIFT_SHOP,                         4,  4 ; 11
	mapgroup TIN_TOWER_ROOF,                               9, 10 ; 12

	newgroup                                                     ; 16

	mapgroup ROUTE_23,                                     9, 10 ;  1
	mapgroup INDIGO_PLATEAU_POKECENTER_1F,                 7,  9 ;  2
	mapgroup WILLS_ROOM,                                   9,  5 ;  3
	mapgroup KOGAS_ROOM,                                   9,  5 ;  4
	mapgroup BRUNOS_ROOM,                                  9,  5 ;  5
	mapgroup KARENS_ROOM,                                  9,  5 ;  6
	mapgroup LANCES_ROOM,                                 12,  5 ;  7
	mapgroup HALL_OF_FAME,                                 7,  5 ;  8

	newgroup                                                     ; 17

	mapgroup ROUTE_13,                                     9, 30 ;  1
	mapgroup ROUTE_14,                                    18, 10 ;  2
	mapgroup ROUTE_15,                                     9, 20 ;  3
	mapgroup ROUTE_18,                                     9, 10 ;  4
	mapgroup FUCHSIA_CITY,                                18, 20 ;  5
	mapgroup FUCHSIA_MART,                                 4,  6 ;  6
	mapgroup SAFARI_ZONE_MAIN_OFFICE,                      4,  4 ;  7
	mapgroup FUCHSIA_GYM,                                  9,  5 ;  8
	mapgroup FUCHSIA_BILL_SPEECH_HOUSE,                    4,  4 ;  9
	mapgroup FUCHSIA_POKECENTER_1F,                        4,  5 ; 10
	mapgroup FUCHSIA_POKECENTER_2F_BETA,                   4,  8 ; 11
	mapgroup SAFARI_ZONE_WARDENS_HOME,                     4,  5 ; 12
	mapgroup ROUTE_15_FUCHSIA_GATE,                        4,  5 ; 13

	newgroup                                                     ; 18

	mapgroup ROUTE_8,                                      9, 20 ;  1
	mapgroup ROUTE_12,                                    27, 10 ;  2
	mapgroup ROUTE_10_SOUTH,                               9, 10 ;  3
	mapgroup LAVENDER_TOWN,                                9, 10 ;  4
	mapgroup LAVENDER_POKECENTER_1F,                       4,  5 ;  5
	mapgroup LAVENDER_POKECENTER_2F_BETA,                  4,  8 ;  6
	mapgroup MR_FUJIS_HOUSE,                               4,  5 ;  7
	mapgroup LAVENDER_SPEECH_HOUSE,                        4,  4 ;  8
	mapgroup LAVENDER_NAME_RATER,                          4,  4 ;  9
	mapgroup LAVENDER_MART,                                4,  6 ; 10
	mapgroup SOUL_HOUSE,                                   4,  5 ; 11
	mapgroup LAV_RADIO_TOWER_1F,                           4, 10 ; 12
	mapgroup ROUTE_8_SAFFRON_GATE,                         4,  5 ; 13
	mapgroup ROUTE_12_SUPER_ROD_HOUSE,                     4,  4 ; 14

	newgroup                                                     ; 19

	mapgroup ROUTE_28,                                     9, 20 ;  1
	mapgroup SILVER_CAVE_OUTSIDE,                         18, 20 ;  2
	mapgroup SILVER_CAVE_POKECENTER_1F,                    4,  5 ;  3
	mapgroup ROUTE_28_FAMOUS_SPEECH_HOUSE,                 4,  4 ;  4

	newgroup                                                     ; 20

	mapgroup POKECENTER_2F,                                4,  8 ;  1
	mapgroup TRADE_CENTER,                                 4,  5 ;  2
	mapgroup COLOSSEUM,                                    4,  5 ;  3
	mapgroup TIME_CAPSULE,                                 4,  5 ;  4
	mapgroup MOBILE_TRADE_ROOM_MOBILE,                     4,  5 ;  5
	mapgroup MOBILE_BATTLE_ROOM,                           4,  5 ;  6

	newgroup                                                     ; 21

	mapgroup ROUTE_7,                                      9, 10 ;  1
	mapgroup ROUTE_16,                                     9, 10 ;  2
	mapgroup ROUTE_17,                                    45, 10 ;  3
	mapgroup CELADON_CITY,                                18, 20 ;  4
	mapgroup CELADON_DEPT_STORE_1F,                        4,  8 ;  5
	mapgroup CELADON_DEPT_STORE_2F,                        4,  8 ;  6
	mapgroup CELADON_DEPT_STORE_3F,                        4,  8 ;  7
	mapgroup CELADON_DEPT_STORE_4F,                        4,  8 ;  8
	mapgroup CELADON_DEPT_STORE_5F,                        4,  8 ;  9
	mapgroup CELADON_DEPT_STORE_6F,                        4,  8 ; 10
	mapgroup CELADON_DEPT_STORE_ELEVATOR,                  2,  2 ; 11
	mapgroup CELADON_MANSION_1F,                           5,  4 ; 12
	mapgroup CELADON_MANSION_2F,                           5,  4 ; 13
	mapgroup CELADON_MANSION_3F,                           5,  4 ; 14
	mapgroup CELADON_MANSION_ROOF,                         5,  4 ; 15
	mapgroup CELADON_MANSION_ROOF_HOUSE,                   4,  4 ; 16
	mapgroup CELADON_POKECENTER_1F,                        4,  5 ; 17
	mapgroup CELADON_POKECENTER_2F_BETA,                   4,  8 ; 18
	mapgroup CELADON_GAME_CORNER,                          7, 10 ; 19
	mapgroup CELADON_GAME_CORNER_PRIZE_ROOM,               3,  3 ; 20
	mapgroup CELADON_GYM,                                  9,  5 ; 21
	mapgroup CELADON_CAFE,                                 4,  6 ; 22
	mapgroup ROUTE_16_FUCHSIA_SPEECH_HOUSE,                4,  4 ; 23
	mapgroup ROUTE_16_GATE,                                4,  5 ; 24
	mapgroup ROUTE_7_SAFFRON_GATE,                         4,  5 ; 25
	mapgroup ROUTE_17_ROUTE_18_GATE,                       4,  5 ; 26

	newgroup                                                     ; 22

	mapgroup ROUTE_40,                                    18, 10 ;  1
	mapgroup ROUTE_41,                                    27, 25 ;  2
	mapgroup CIANWOOD_CITY,                               27, 15 ;  3
	mapgroup MANIAS_HOUSE,                                 4,  4 ;  4
	mapgroup CIANWOOD_GYM,                                 9,  5 ;  5
	mapgroup CIANWOOD_POKECENTER_1F,                       4,  5 ;  6
	mapgroup CIANWOOD_PHARMACY,                            4,  4 ;  7
	mapgroup CIANWOOD_PHOTO_STUDIO,                        4,  4 ;  8
	mapgroup CIANWOOD_LUGIA_SPEECH_HOUSE,                  4,  4 ;  9
	mapgroup POKE_SEERS_HOUSE,                             4,  4 ; 10
	mapgroup BATTLE_TOWER_1F,                              5,  8 ; 11
	mapgroup BATTLE_TOWER_BATTLE_ROOM,                     4,  4 ; 12
	mapgroup BATTLE_TOWER_ELEVATOR,                        2,  2 ; 13
	mapgroup BATTLE_TOWER_HALLWAY,                         2, 11 ; 14
	mapgroup ROUTE_40_BATTLE_TOWER_GATE,                   4,  5 ; 15
	mapgroup BATTLE_TOWER_OUTSIDE,                        14, 10 ; 16

	newgroup                                                     ; 23

	mapgroup ROUTE_2,                                     27, 10 ;  1
	mapgroup ROUTE_22,                                     9, 20 ;  2
	mapgroup VIRIDIAN_CITY,                               18, 20 ;  3
	mapgroup VIRIDIAN_GYM,                                 9,  5 ;  4
	mapgroup VIRIDIAN_NICKNAME_SPEECH_HOUSE,               4,  4 ;  5
	mapgroup TRAINER_HOUSE_1F,                             7,  5 ;  6
	mapgroup TRAINER_HOUSE_B1F,                            8,  5 ;  7
	mapgroup VIRIDIAN_MART,                                4,  6 ;  8
	mapgroup VIRIDIAN_POKECENTER_1F,                       4,  5 ;  9
	mapgroup VIRIDIAN_POKECENTER_2F_BETA,                  4,  8 ; 10
	mapgroup ROUTE_2_NUGGET_SPEECH_HOUSE,                  4,  4 ; 11
	mapgroup ROUTE_2_GATE,                                 4,  5 ; 12
	mapgroup VICTORY_ROAD_GATE,                            9, 10 ; 13

	newgroup                                                     ; 24

	mapgroup ROUTE_26,                                    54, 10 ;  1
	mapgroup ROUTE_27,                                     9, 40 ;  2
	mapgroup ROUTE_29,                                     9, 30 ;  3
	mapgroup NEW_BARK_TOWN,                                9, 10 ;  4
	mapgroup ELMS_LAB,                                     6,  5 ;  5
	mapgroup KRISS_HOUSE_1F,                               4,  5 ;  6
	mapgroup KRISS_HOUSE_2F,                               3,  4 ;  7
	mapgroup KRISS_NEIGHBORS_HOUSE,                        4,  4 ;  8
	mapgroup ELMS_HOUSE,                                   4,  4 ;  9
	mapgroup ROUTE_26_HEAL_SPEECH_HOUSE,                   4,  4 ; 10
	mapgroup ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE,          4,  4 ; 11
	mapgroup ROUTE_27_SANDSTORM_HOUSE,                     4,  4 ; 12
	mapgroup ROUTE_29_ROUTE_46_GATE,                       4,  5 ; 13

	newgroup                                                     ; 25

	mapgroup ROUTE_5,                                      9, 10 ;  1
	mapgroup SAFFRON_CITY,                                18, 20 ;  2
	mapgroup FIGHTING_DOJO,                                6,  5 ;  3
	mapgroup SAFFRON_GYM,                                  9, 10 ;  4
	mapgroup SAFFRON_MART,                                 4,  6 ;  5
	mapgroup SAFFRON_POKECENTER_1F,                        4,  5 ;  6
	mapgroup SAFFRON_POKECENTER_2F_BETA,                   4,  8 ;  7
	mapgroup MR_PSYCHICS_HOUSE,                            4,  4 ;  8
	mapgroup SAFFRON_TRAIN_STATION,                        9, 10 ;  9
	mapgroup SILPH_CO_1F,                                  4,  8 ; 10
	mapgroup COPYCATS_HOUSE_1F,                            4,  4 ; 11
	mapgroup COPYCATS_HOUSE_2F,                            3,  5 ; 12
	mapgroup ROUTE_5_UNDERGROUND_PATH_ENTRANCE,            4,  4 ; 13
	mapgroup ROUTE_5_SAFFRON_GATE,                         4,  5 ; 14
	mapgroup ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE,             4,  4 ; 15

	newgroup                                                     ; 26

	mapgroup ROUTE_30,                                    27, 10 ;  1
	mapgroup ROUTE_31,                                     9, 20 ;  2
	mapgroup CHERRYGROVE_CITY,                             9, 20 ;  3
	mapgroup CHERRYGROVE_MART,                             4,  6 ;  4
	mapgroup CHERRYGROVE_POKECENTER_1F,                    4,  5 ;  5
	mapgroup CHERRYGROVE_GYM_SPEECH_HOUSE,                 4,  4 ;  6
	mapgroup GUIDE_GENTS_HOUSE,                            4,  4 ;  7
	mapgroup CHERRYGROVE_EVOLUTION_SPEECH_HOUSE,           4,  4 ;  8
	mapgroup ROUTE_30_BERRY_SPEECH_HOUSE,                  4,  4 ;  9
	mapgroup MR_POKEMONS_HOUSE,                            4,  4 ; 10
	mapgroup ROUTE_31_VIOLET_GATE,                         4,  5 ; 11
