newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

mapconst: MACRO
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
; - MapGroupPointers (see data/maps/definitions.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - RoofPals (see gfx/tilesets/roofs.pal)
; `mapconst` indexes are for the sub-tables of MapGroupPointers (see data/maps/definitions.asm)
	const_def

	newgroup                                                     ;  1

	mapconst OLIVINE_POKECENTER_1F,                        4,  5 ;  1
	mapconst OLIVINE_GYM,                                  8,  5 ;  2
	mapconst OLIVINE_TIMS_HOUSE,                           4,  4 ;  3
	mapconst OLIVINE_HOUSE_BETA,                           4,  4 ;  4
	mapconst OLIVINE_PUNISHMENT_SPEECH_HOUSE,              4,  4 ;  5
	mapconst OLIVINE_GOOD_ROD_HOUSE,                       4,  4 ;  6
	mapconst OLIVINE_CAFE,                                 4,  4 ;  7
	mapconst OLIVINE_MART,                                 4,  6 ;  8
	mapconst ROUTE_38_ECRUTEAK_GATE,                       4,  5 ;  9
	mapconst ROUTE_39_BARN,                                4,  4 ; 10
	mapconst ROUTE_39_FARMHOUSE,                           4,  4 ; 11
	mapconst ROUTE_38,                                     9, 20 ; 12
	mapconst ROUTE_39,                                    18, 10 ; 13
	mapconst OLIVINE_CITY,                                18, 20 ; 14

	newgroup                                                     ;  2

	mapconst MAHOGANY_RED_GYARADOS_SPEECH_HOUSE,           4,  4 ;  1
	mapconst MAHOGANY_GYM,                                 9,  5 ;  2
	mapconst MAHOGANY_POKECENTER_1F,                       4,  5 ;  3
	mapconst ROUTE_42_ECRUTEAK_GATE,                       4,  5 ;  4
	mapconst ROUTE_42,                                     9, 30 ;  5
	mapconst ROUTE_44,                                     9, 30 ;  6
	mapconst MAHOGANY_TOWN,                                9, 10 ;  7

	newgroup                                                     ;  3

	mapconst SPROUT_TOWER_1F,                              8, 10 ;  1
	mapconst SPROUT_TOWER_2F,                              8, 10 ;  2
	mapconst SPROUT_TOWER_3F,                              8, 10 ;  3
	mapconst TIN_TOWER_1F,                                 9, 10 ;  4
	mapconst TIN_TOWER_2F,                                 9, 10 ;  5
	mapconst TIN_TOWER_3F,                                 9, 10 ;  6
	mapconst TIN_TOWER_4F,                                 9, 10 ;  7
	mapconst TIN_TOWER_5F,                                 9, 10 ;  8
	mapconst TIN_TOWER_6F,                                 9, 10 ;  9
	mapconst TIN_TOWER_7F,                                 9, 10 ; 10
	mapconst TIN_TOWER_8F,                                 9, 10 ; 11
	mapconst TIN_TOWER_9F,                                 9, 10 ; 12
	mapconst BURNED_TOWER_1F,                              9, 10 ; 13
	mapconst BURNED_TOWER_B1F,                             9, 10 ; 14
	mapconst NATIONAL_PARK,                               27, 20 ; 15
	mapconst NATIONAL_PARK_BUG_CONTEST,                   27, 20 ; 16
	mapconst RADIO_TOWER_1F,                               4,  9 ; 17
	mapconst RADIO_TOWER_2F,                               4,  9 ; 18
	mapconst RADIO_TOWER_3F,                               4,  9 ; 19
	mapconst RADIO_TOWER_4F,                               4,  9 ; 20
	mapconst RADIO_TOWER_5F,                               4,  9 ; 21
	mapconst RUINS_OF_ALPH_OUTSIDE,                       18, 10 ; 22
	mapconst RUINS_OF_ALPH_HO_OH_CHAMBER,                  5,  4 ; 23
	mapconst RUINS_OF_ALPH_KABUTO_CHAMBER,                 5,  4 ; 24
	mapconst RUINS_OF_ALPH_OMANYTE_CHAMBER,                5,  4 ; 25
	mapconst RUINS_OF_ALPH_AERODACTYL_CHAMBER,             5,  4 ; 26
	mapconst RUINS_OF_ALPH_INNER_CHAMBER,                 14, 10 ; 27
	mapconst RUINS_OF_ALPH_RESEARCH_CENTER,                4,  4 ; 28
	mapconst RUINS_OF_ALPH_HO_OH_ITEM_ROOM,                5,  4 ; 29
	mapconst RUINS_OF_ALPH_KABUTO_ITEM_ROOM,               5,  4 ; 30
	mapconst RUINS_OF_ALPH_OMANYTE_ITEM_ROOM,              5,  4 ; 31
	mapconst RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM,           5,  4 ; 32
	mapconst RUINS_OF_ALPH_HO_OH_WORD_ROOM,               12, 10 ; 33
	mapconst RUINS_OF_ALPH_KABUTO_WORD_ROOM,               7, 10 ; 34
	mapconst RUINS_OF_ALPH_OMANYTE_WORD_ROOM,              8, 10 ; 35
	mapconst RUINS_OF_ALPH_AERODACTYL_WORD_ROOM,           7, 10 ; 36
	mapconst UNION_CAVE_1F,                               18, 10 ; 37
	mapconst UNION_CAVE_B1F,                              18, 10 ; 38
	mapconst UNION_CAVE_B2F,                              18, 10 ; 39
	mapconst SLOWPOKE_WELL_B1F,                            9, 10 ; 40
	mapconst SLOWPOKE_WELL_B2F,                            9, 10 ; 41
	mapconst OLIVINE_LIGHTHOUSE_1F,                        9, 10 ; 42
	mapconst OLIVINE_LIGHTHOUSE_2F,                        9, 10 ; 43
	mapconst OLIVINE_LIGHTHOUSE_3F,                        9, 10 ; 44
	mapconst OLIVINE_LIGHTHOUSE_4F,                        9, 10 ; 45
	mapconst OLIVINE_LIGHTHOUSE_5F,                        9, 10 ; 46
	mapconst OLIVINE_LIGHTHOUSE_6F,                        9, 10 ; 47
	mapconst MAHOGANY_MART_1F,                             4,  4 ; 48
	mapconst TEAM_ROCKET_BASE_B1F,                         9, 15 ; 49
	mapconst TEAM_ROCKET_BASE_B2F,                         9, 15 ; 50
	mapconst TEAM_ROCKET_BASE_B3F,                         9, 15 ; 51
	mapconst ILEX_FOREST,                                 27, 15 ; 52
	mapconst GOLDENROD_UNDERGROUND,                       18, 15 ; 53
	mapconst GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 18, 15 ; 54
	mapconst GOLDENROD_DEPT_STORE_B1F,                     9, 10 ; 55
	mapconst GOLDENROD_UNDERGROUND_WAREHOUSE,              9, 10 ; 56
	mapconst MOUNT_MORTAR_1F_OUTSIDE,                     18, 20 ; 57
	mapconst MOUNT_MORTAR_1F_INSIDE,                      27, 20 ; 58
	mapconst MOUNT_MORTAR_2F_INSIDE,                      18, 20 ; 59
	mapconst MOUNT_MORTAR_B1F,                            18, 20 ; 60
	mapconst ICE_PATH_1F,                                 18, 20 ; 61
	mapconst ICE_PATH_B1F,                                18, 10 ; 62
	mapconst ICE_PATH_B2F_MAHOGANY_SIDE,                   9, 10 ; 63
	mapconst ICE_PATH_B2F_BLACKTHORN_SIDE,                 9,  5 ; 64
	mapconst ICE_PATH_B3F,                                 9, 10 ; 65
	mapconst WHIRL_ISLAND_NW,                              9,  5 ; 66
	mapconst WHIRL_ISLAND_NE,                              9, 10 ; 67
	mapconst WHIRL_ISLAND_SW,                              9, 10 ; 68
	mapconst WHIRL_ISLAND_CAVE,                            9,  5 ; 69
	mapconst WHIRL_ISLAND_SE,                              9,  5 ; 70
	mapconst WHIRL_ISLAND_B1F,                            18, 20 ; 71
	mapconst WHIRL_ISLAND_B2F,                            18, 10 ; 72
	mapconst WHIRL_ISLAND_LUGIA_CHAMBER,                   9, 10 ; 73
	mapconst SILVER_CAVE_ROOM_1,                          18, 10 ; 74
	mapconst SILVER_CAVE_ROOM_2,                          18, 15 ; 75
	mapconst SILVER_CAVE_ROOM_3,                          18, 10 ; 76
	mapconst SILVER_CAVE_ITEM_ROOMS,                       9, 10 ; 77
	mapconst DARK_CAVE_VIOLET_ENTRANCE,                   18, 20 ; 78
	mapconst DARK_CAVE_BLACKTHORN_ENTRANCE,               18, 15 ; 79
	mapconst DRAGONS_DEN_1F,                               9,  5 ; 80
	mapconst DRAGONS_DEN_B1F,                             18, 20 ; 81
	mapconst DRAGON_SHRINE,                                5,  5 ; 82
	mapconst TOHJO_FALLS,                                  9, 15 ; 83
	mapconst DIGLETTS_CAVE,                               18, 10 ; 84
	mapconst MOUNT_MOON,                                   9, 15 ; 85
	mapconst UNDERGROUND_PATH,                            14,  3 ; 86
	mapconst ROCK_TUNNEL_1F,                              18, 15 ; 87
	mapconst ROCK_TUNNEL_B1F,                             18, 15 ; 88
	mapconst SAFARI_ZONE_FUCHSIA_GATE_BETA,                4,  5 ; 89
	mapconst SAFARI_ZONE_BETA,                            18, 10 ; 90
	mapconst VICTORY_ROAD,                                36, 10 ; 91

	newgroup                                                     ;  4

	mapconst ECRUTEAK_HOUSE,                               9, 10 ;  1
	mapconst WISE_TRIOS_ROOM,                              4,  4 ;  2
	mapconst ECRUTEAK_POKECENTER_1F,                       4,  5 ;  3
	mapconst ECRUTEAK_LUGIA_SPEECH_HOUSE,                  4,  4 ;  4
	mapconst DANCE_THEATRE,                                7,  6 ;  5
	mapconst ECRUTEAK_MART,                                4,  6 ;  6
	mapconst ECRUTEAK_GYM,                                 9,  5 ;  7
	mapconst ECRUTEAK_ITEMFINDER_HOUSE,                    4,  4 ;  8
	mapconst ECRUTEAK_CITY,                               18, 20 ;  9

	newgroup                                                     ;  5

	mapconst BLACKTHORN_GYM_1F,                            9,  5 ;  1
	mapconst BLACKTHORN_GYM_2F,                            9,  5 ;  2
	mapconst BLACKTHORN_DRAGON_SPEECH_HOUSE,               4,  4 ;  3
	mapconst BLACKTHORN_EMYS_HOUSE,                        4,  4 ;  4
	mapconst BLACKTHORN_MART,                              4,  6 ;  5
	mapconst BLACKTHORN_POKECENTER_1F,                     4,  5 ;  6
	mapconst MOVE_DELETERS_HOUSE,                          4,  4 ;  7
	mapconst ROUTE_45,                                    45, 10 ;  8
	mapconst ROUTE_46,                                    18, 10 ;  9
	mapconst BLACKTHORN_CITY,                             18, 20 ; 10

	newgroup                                                     ;  6

	mapconst CINNABAR_POKECENTER_1F,                       4,  5 ;  1
	mapconst CINNABAR_POKECENTER_2F_BETA,                  4,  8 ;  2
	mapconst ROUTE_19_FUCHSIA_GATE,                        4,  5 ;  3
	mapconst SEAFOAM_GYM,                                  4,  5 ;  4
	mapconst ROUTE_19,                                    18, 10 ;  5
	mapconst ROUTE_20,                                     9, 30 ;  6
	mapconst ROUTE_21,                                    18, 10 ;  7
	mapconst CINNABAR_ISLAND,                              9, 10 ;  8

	newgroup                                                     ;  7

	mapconst CERULEAN_GYM_BADGE_SPEECH_HOUSE,              4,  4 ;  1
	mapconst CERULEAN_POLICE_STATION,                      4,  4 ;  2
	mapconst CERULEAN_TRADE_SPEECH_HOUSE,                  4,  4 ;  3
	mapconst CERULEAN_POKECENTER_1F,                       4,  5 ;  4
	mapconst CERULEAN_POKECENTER_2F_BETA,                  4,  8 ;  5
	mapconst CERULEAN_GYM,                                 8,  5 ;  6
	mapconst CERULEAN_MART,                                4,  6 ;  7
	mapconst ROUTE_10_POKECENTER_1F,                       4,  5 ;  8
	mapconst ROUTE_10_POKECENTER_2F_BETA,                  4,  8 ;  9
	mapconst POWER_PLANT,                                  9, 10 ; 10
	mapconst BILLS_HOUSE,                                  4,  4 ; 11
	mapconst ROUTE_4,                                      9, 20 ; 12
	mapconst ROUTE_9,                                      9, 30 ; 13
	mapconst ROUTE_10_NORTH,                               9, 10 ; 14
	mapconst ROUTE_24,                                     9, 10 ; 15
	mapconst ROUTE_25,                                     9, 30 ; 16
	mapconst CERULEAN_CITY,                               18, 20 ; 17

	newgroup                                                     ;  8

	mapconst AZALEA_POKECENTER_1F,                         4,  5 ;  1
	mapconst CHARCOAL_KILN,                                4,  4 ;  2
	mapconst AZALEA_MART,                                  4,  6 ;  3
	mapconst KURTS_HOUSE,                                  4,  8 ;  4
	mapconst AZALEA_GYM,                                   8,  5 ;  5
	mapconst ROUTE_33,                                     9, 10 ;  6
	mapconst AZALEA_TOWN,                                  9, 20 ;  7

	newgroup                                                     ;  9

	mapconst LAKE_OF_RAGE_HIDDEN_POWER_HOUSE,              4,  4 ;  1
	mapconst LAKE_OF_RAGE_MAGIKARP_HOUSE,                  4,  4 ;  2
	mapconst ROUTE_43_MAHOGANY_GATE,                       4,  5 ;  3
	mapconst ROUTE_43_GATE,                                4,  5 ;  4
	mapconst ROUTE_43,                                    27, 10 ;  5
	mapconst LAKE_OF_RAGE,                                18, 20 ;  6

	newgroup                                                     ; 10

	mapconst ROUTE_32,                                    45, 10 ;  1
	mapconst ROUTE_35,                                    18, 10 ;  2
	mapconst ROUTE_36,                                     9, 30 ;  3
	mapconst ROUTE_37,                                     9, 10 ;  4
	mapconst VIOLET_CITY,                                 18, 20 ;  5
	mapconst VIOLET_MART,                                  4,  6 ;  6
	mapconst VIOLET_GYM,                                   8,  5 ;  7
	mapconst EARLS_POKEMON_ACADEMY,                        8,  4 ;  8
	mapconst VIOLET_NICKNAME_SPEECH_HOUSE,                 4,  4 ;  9
	mapconst VIOLET_POKECENTER_1F,                         4,  5 ; 10
	mapconst VIOLET_KYLES_HOUSE,                           4,  4 ; 11
	mapconst ROUTE_32_RUINS_OF_ALPH_GATE,                  4,  5 ; 12
	mapconst ROUTE_32_POKECENTER_1F,                       4,  5 ; 13
	mapconst ROUTE_35_GOLDENROD_GATE,                      4,  5 ; 14
	mapconst ROUTE_35_NATIONAL_PARK_GATE,                  4,  4 ; 15
	mapconst ROUTE_36_RUINS_OF_ALPH_GATE,                  4,  5 ; 16
	mapconst ROUTE_36_NATIONAL_PARK_GATE,                  4,  5 ; 17

	newgroup                                                     ; 11

	mapconst ROUTE_34,                                    27, 10 ;  1
	mapconst GOLDENROD_CITY,                              18, 20 ;  2
	mapconst GOLDENROD_GYM,                                9, 10 ;  3
	mapconst GOLDENROD_BIKE_SHOP,                          4,  4 ;  4
	mapconst GOLDENROD_HAPPINESS_RATER,                    4,  4 ;  5
	mapconst GOLDENROD_BILLS_HOUSE,                        4,  4 ;  6
	mapconst GOLDENROD_MAGNET_TRAIN_STATION,               9, 10 ;  7
	mapconst GOLDENROD_FLOWER_SHOP,                        4,  4 ;  8
	mapconst GOLDENROD_PP_SPEECH_HOUSE,                    4,  4 ;  9
	mapconst GOLDENROD_NAME_RATER,                         4,  4 ; 10
	mapconst GOLDENROD_DEPT_STORE_1F,                      4,  8 ; 11
	mapconst GOLDENROD_DEPT_STORE_2F,                      4,  8 ; 12
	mapconst GOLDENROD_DEPT_STORE_3F,                      4,  8 ; 13
	mapconst GOLDENROD_DEPT_STORE_4F,                      4,  8 ; 14
	mapconst GOLDENROD_DEPT_STORE_5F,                      4,  8 ; 15
	mapconst GOLDENROD_DEPT_STORE_6F,                      4,  8 ; 16
	mapconst GOLDENROD_DEPT_STORE_ELEVATOR,                2,  2 ; 17
	mapconst GOLDENROD_DEPT_STORE_ROOF,                    4,  8 ; 18
	mapconst GOLDENROD_GAME_CORNER,                        7, 10 ; 19
	mapconst GOLDENROD_POKECENTER_1F,                      4,  5 ; 20
	mapconst GOLDENROD_POKECOM_CENTER_2F_MOBILE,          16, 16 ; 21
	mapconst ILEX_FOREST_AZALEA_GATE,                      4,  5 ; 22
	mapconst ROUTE_34_ILEX_FOREST_GATE,                    4,  5 ; 23
	mapconst DAY_CARE,                                     4,  5 ; 24

	newgroup                                                     ; 12

	mapconst ROUTE_6,                                      9, 10 ;  1
	mapconst ROUTE_11,                                     9, 20 ;  2
	mapconst VERMILION_CITY,                              18, 20 ;  3
	mapconst VERMILION_HOUSE_FISHING_SPEECH_HOUSE,         4,  4 ;  4
	mapconst VERMILION_POKECENTER_1F,                      4,  5 ;  5
	mapconst VERMILION_POKECENTER_2F_BETA,                 4,  8 ;  6
	mapconst POKEMON_FAN_CLUB,                             4,  5 ;  7
	mapconst VERMILION_MAGNET_TRAIN_SPEECH_HOUSE,          4,  4 ;  8
	mapconst VERMILION_MART,                               4,  6 ;  9
	mapconst VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE,   4,  4 ; 10
	mapconst VERMILION_GYM,                                9,  5 ; 11
	mapconst ROUTE_6_SAFFRON_GATE,                         4,  5 ; 12
	mapconst ROUTE_6_UNDERGROUND_PATH_ENTRANCE,            4,  4 ; 13

	newgroup                                                     ; 13

	mapconst ROUTE_1,                                     18, 10 ;  1
	mapconst PALLET_TOWN,                                  9, 10 ;  2
	mapconst REDS_HOUSE_1F,                                4,  4 ;  3
	mapconst REDS_HOUSE_2F,                                4,  4 ;  4
	mapconst BLUES_HOUSE,                                  4,  4 ;  5
	mapconst OAKS_LAB,                                     6,  5 ;  6

	newgroup                                                     ; 14

	mapconst ROUTE_3,                                      9, 30 ;  1
	mapconst PEWTER_CITY,                                 18, 20 ;  2
	mapconst PEWTER_NIDORAN_SPEECH_HOUSE,                  4,  4 ;  3
	mapconst PEWTER_GYM,                                   7,  5 ;  4
	mapconst PEWTER_MART,                                  4,  6 ;  5
	mapconst PEWTER_POKECENTER_1F,                         4,  5 ;  6
	mapconst PEWTER_POKECENTER_2F_BETA,                    4,  8 ;  7
	mapconst PEWTER_SNOOZE_SPEECH_HOUSE,                   4,  4 ;  8

	newgroup                                                     ; 15

	mapconst OLIVINE_PORT,                                18, 10 ;  1
	mapconst VERMILION_PORT,                              18, 10 ;  2
	mapconst FAST_SHIP_1F,                                 9, 16 ;  3
	mapconst FAST_SHIP_CABINS_NNW_NNE_NE,                 16,  4 ;  4
	mapconst FAST_SHIP_CABINS_SW_SSW_NW,                  16,  4 ;  5
	mapconst FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN,      17,  5 ;  6
	mapconst FAST_SHIP_B1F,                                8, 16 ;  7
	mapconst OLIVINE_PORT_PASSAGE,                         9, 10 ;  8
	mapconst VERMILION_PORT_PASSAGE,                       9, 10 ;  9
	mapconst MOUNT_MOON_SQUARE,                            9, 15 ; 10
	mapconst MOUNT_MOON_GIFT_SHOP,                         4,  4 ; 11
	mapconst TIN_TOWER_ROOF,                               9, 10 ; 12

	newgroup                                                     ; 16

	mapconst ROUTE_23,                                     9, 10 ;  1
	mapconst INDIGO_PLATEAU_POKECENTER_1F,                 7,  9 ;  2
	mapconst WILLS_ROOM,                                   9,  5 ;  3
	mapconst KOGAS_ROOM,                                   9,  5 ;  4
	mapconst BRUNOS_ROOM,                                  9,  5 ;  5
	mapconst KARENS_ROOM,                                  9,  5 ;  6
	mapconst LANCES_ROOM,                                 12,  5 ;  7
	mapconst HALL_OF_FAME,                                 7,  5 ;  8

	newgroup                                                     ; 17

	mapconst ROUTE_13,                                     9, 30 ;  1
	mapconst ROUTE_14,                                    18, 10 ;  2
	mapconst ROUTE_15,                                     9, 20 ;  3
	mapconst ROUTE_18,                                     9, 10 ;  4
	mapconst FUCHSIA_CITY,                                18, 20 ;  5
	mapconst FUCHSIA_MART,                                 4,  6 ;  6
	mapconst SAFARI_ZONE_MAIN_OFFICE,                      4,  4 ;  7
	mapconst FUCHSIA_GYM,                                  9,  5 ;  8
	mapconst FUCHSIA_BILL_SPEECH_HOUSE,                    4,  4 ;  9
	mapconst FUCHSIA_POKECENTER_1F,                        4,  5 ; 10
	mapconst FUCHSIA_POKECENTER_2F_BETA,                   4,  8 ; 11
	mapconst SAFARI_ZONE_WARDENS_HOME,                     4,  5 ; 12
	mapconst ROUTE_15_FUCHSIA_GATE,                        4,  5 ; 13

	newgroup                                                     ; 18

	mapconst ROUTE_8,                                      9, 20 ;  1
	mapconst ROUTE_12,                                    27, 10 ;  2
	mapconst ROUTE_10_SOUTH,                               9, 10 ;  3
	mapconst LAVENDER_TOWN,                                9, 10 ;  4
	mapconst LAVENDER_POKECENTER_1F,                       4,  5 ;  5
	mapconst LAVENDER_POKECENTER_2F_BETA,                  4,  8 ;  6
	mapconst MR_FUJIS_HOUSE,                               4,  5 ;  7
	mapconst LAVENDER_SPEECH_HOUSE,                        4,  4 ;  8
	mapconst LAVENDER_NAME_RATER,                          4,  4 ;  9
	mapconst LAVENDER_MART,                                4,  6 ; 10
	mapconst SOUL_HOUSE,                                   4,  5 ; 11
	mapconst LAV_RADIO_TOWER_1F,                           4, 10 ; 12
	mapconst ROUTE_8_SAFFRON_GATE,                         4,  5 ; 13
	mapconst ROUTE_12_SUPER_ROD_HOUSE,                     4,  4 ; 14

	newgroup                                                     ; 19

	mapconst ROUTE_28,                                     9, 20 ;  1
	mapconst SILVER_CAVE_OUTSIDE,                         18, 20 ;  2
	mapconst SILVER_CAVE_POKECENTER_1F,                    4,  5 ;  3
	mapconst ROUTE_28_FAMOUS_SPEECH_HOUSE,                 4,  4 ;  4

	newgroup                                                     ; 20

	mapconst POKECENTER_2F,                                4,  8 ;  1
	mapconst TRADE_CENTER,                                 4,  5 ;  2
	mapconst COLOSSEUM,                                    4,  5 ;  3
	mapconst TIME_CAPSULE,                                 4,  5 ;  4
	mapconst MOBILE_TRADE_ROOM_MOBILE,                     4,  5 ;  5
	mapconst MOBILE_BATTLE_ROOM,                           4,  5 ;  6

	newgroup                                                     ; 21

	mapconst ROUTE_7,                                      9, 10 ;  1
	mapconst ROUTE_16,                                     9, 10 ;  2
	mapconst ROUTE_17,                                    45, 10 ;  3
	mapconst CELADON_CITY,                                18, 20 ;  4
	mapconst CELADON_DEPT_STORE_1F,                        4,  8 ;  5
	mapconst CELADON_DEPT_STORE_2F,                        4,  8 ;  6
	mapconst CELADON_DEPT_STORE_3F,                        4,  8 ;  7
	mapconst CELADON_DEPT_STORE_4F,                        4,  8 ;  8
	mapconst CELADON_DEPT_STORE_5F,                        4,  8 ;  9
	mapconst CELADON_DEPT_STORE_6F,                        4,  8 ; 10
	mapconst CELADON_DEPT_STORE_ELEVATOR,                  2,  2 ; 11
	mapconst CELADON_MANSION_1F,                           5,  4 ; 12
	mapconst CELADON_MANSION_2F,                           5,  4 ; 13
	mapconst CELADON_MANSION_3F,                           5,  4 ; 14
	mapconst CELADON_MANSION_ROOF,                         5,  4 ; 15
	mapconst CELADON_MANSION_ROOF_HOUSE,                   4,  4 ; 16
	mapconst CELADON_POKECENTER_1F,                        4,  5 ; 17
	mapconst CELADON_POKECENTER_2F_BETA,                   4,  8 ; 18
	mapconst CELADON_GAME_CORNER,                          7, 10 ; 19
	mapconst CELADON_GAME_CORNER_PRIZE_ROOM,               3,  3 ; 20
	mapconst CELADON_GYM,                                  9,  5 ; 21
	mapconst CELADON_CAFE,                                 4,  6 ; 22
	mapconst ROUTE_16_FUCHSIA_SPEECH_HOUSE,                4,  4 ; 23
	mapconst ROUTE_16_GATE,                                4,  5 ; 24
	mapconst ROUTE_7_SAFFRON_GATE,                         4,  5 ; 25
	mapconst ROUTE_17_ROUTE_18_GATE,                       4,  5 ; 26

	newgroup                                                     ; 22

	mapconst ROUTE_40,                                    18, 10 ;  1
	mapconst ROUTE_41,                                    27, 25 ;  2
	mapconst CIANWOOD_CITY,                               27, 15 ;  3
	mapconst MANIAS_HOUSE,                                 4,  4 ;  4
	mapconst CIANWOOD_GYM,                                 9,  5 ;  5
	mapconst CIANWOOD_POKECENTER_1F,                       4,  5 ;  6
	mapconst CIANWOOD_PHARMACY,                            4,  4 ;  7
	mapconst CIANWOOD_PHOTO_STUDIO,                        4,  4 ;  8
	mapconst CIANWOOD_LUGIA_SPEECH_HOUSE,                  4,  4 ;  9
	mapconst POKE_SEERS_HOUSE,                             4,  4 ; 10
	mapconst BATTLE_TOWER_1F,                              5,  8 ; 11
	mapconst BATTLE_TOWER_BATTLE_ROOM,                     4,  4 ; 12
	mapconst BATTLE_TOWER_ELEVATOR,                        2,  2 ; 13
	mapconst BATTLE_TOWER_HALLWAY,                         2, 11 ; 14
	mapconst ROUTE_40_BATTLE_TOWER_GATE,                   4,  5 ; 15
	mapconst BATTLE_TOWER_OUTSIDE,                        14, 10 ; 16

	newgroup                                                     ; 23

	mapconst ROUTE_2,                                     27, 10 ;  1
	mapconst ROUTE_22,                                     9, 20 ;  2
	mapconst VIRIDIAN_CITY,                               18, 20 ;  3
	mapconst VIRIDIAN_GYM,                                 9,  5 ;  4
	mapconst VIRIDIAN_NICKNAME_SPEECH_HOUSE,               4,  4 ;  5
	mapconst TRAINER_HOUSE_1F,                             7,  5 ;  6
	mapconst TRAINER_HOUSE_B1F,                            8,  5 ;  7
	mapconst VIRIDIAN_MART,                                4,  6 ;  8
	mapconst VIRIDIAN_POKECENTER_1F,                       4,  5 ;  9
	mapconst VIRIDIAN_POKECENTER_2F_BETA,                  4,  8 ; 10
	mapconst ROUTE_2_NUGGET_SPEECH_HOUSE,                  4,  4 ; 11
	mapconst ROUTE_2_GATE,                                 4,  5 ; 12
	mapconst VICTORY_ROAD_GATE,                            9, 10 ; 13

	newgroup                                                     ; 24

	mapconst ROUTE_26,                                    54, 10 ;  1
	mapconst ROUTE_27,                                     9, 40 ;  2
	mapconst ROUTE_29,                                     9, 30 ;  3
	mapconst NEW_BARK_TOWN,                                9, 10 ;  4
	mapconst ELMS_LAB,                                     6,  5 ;  5
	mapconst KRISS_HOUSE_1F,                               4,  5 ;  6
	mapconst KRISS_HOUSE_2F,                               3,  4 ;  7
	mapconst KRISS_NEIGHBORS_HOUSE,                        4,  4 ;  8
	mapconst ELMS_HOUSE,                                   4,  4 ;  9
	mapconst ROUTE_26_HEAL_SPEECH_HOUSE,                   4,  4 ; 10
	mapconst ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE,          4,  4 ; 11
	mapconst ROUTE_27_SANDSTORM_HOUSE,                     4,  4 ; 12
	mapconst ROUTE_29_ROUTE_46_GATE,                       4,  5 ; 13

	newgroup                                                     ; 25

	mapconst ROUTE_5,                                      9, 10 ;  1
	mapconst SAFFRON_CITY,                                18, 20 ;  2
	mapconst FIGHTING_DOJO,                                6,  5 ;  3
	mapconst SAFFRON_GYM,                                  9, 10 ;  4
	mapconst SAFFRON_MART,                                 4,  6 ;  5
	mapconst SAFFRON_POKECENTER_1F,                        4,  5 ;  6
	mapconst SAFFRON_POKECENTER_2F_BETA,                   4,  8 ;  7
	mapconst MR_PSYCHICS_HOUSE,                            4,  4 ;  8
	mapconst SAFFRON_MAGNET_TRAIN_STATION,                 9, 10 ;  9
	mapconst SILPH_CO_1F,                                  4,  8 ; 10
	mapconst COPYCATS_HOUSE_1F,                            4,  4 ; 11
	mapconst COPYCATS_HOUSE_2F,                            3,  5 ; 12
	mapconst ROUTE_5_UNDERGROUND_PATH_ENTRANCE,            4,  4 ; 13
	mapconst ROUTE_5_SAFFRON_GATE,                         4,  5 ; 14
	mapconst ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE,             4,  4 ; 15

	newgroup                                                     ; 26

	mapconst ROUTE_30,                                    27, 10 ;  1
	mapconst ROUTE_31,                                     9, 20 ;  2
	mapconst CHERRYGROVE_CITY,                             9, 20 ;  3
	mapconst CHERRYGROVE_MART,                             4,  6 ;  4
	mapconst CHERRYGROVE_POKECENTER_1F,                    4,  5 ;  5
	mapconst CHERRYGROVE_GYM_SPEECH_HOUSE,                 4,  4 ;  6
	mapconst GUIDE_GENTS_HOUSE,                            4,  4 ;  7
	mapconst CHERRYGROVE_EVOLUTION_SPEECH_HOUSE,           4,  4 ;  8
	mapconst ROUTE_30_BERRY_SPEECH_HOUSE,                  4,  4 ;  9
	mapconst MR_POKEMONS_HOUSE,                            4,  4 ; 10
	mapconst ROUTE_31_VIOLET_GATE,                         4,  5 ; 11
