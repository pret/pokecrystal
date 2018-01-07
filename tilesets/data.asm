tilecoll: MACRO
; used in tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "Tileset Data 1", ROMX

TilesetKantoGFX: ; 0x18000
INCBIN "gfx/tilesets/kanto.2bpp.lz"
; 0x18606

TilesetKantoMeta: ; 0x18606
INCBIN "tilesets/kanto_metatiles.bin"
; 0x18e06

TilesetKantoColl: ; 0x18e06
INCLUDE "tilesets/kanto_collision.asm"
; 0x19006

Tileset0GFX: ; 0x19006
TilesetJohto1GFX: ; 0x19006
INCBIN "gfx/tilesets/johto_1.2bpp.lz"
; 0x19c0e

Tileset0Meta: ; 0x19c0e
TilesetJohto1Meta: ; 0x19c0e
INCBIN "tilesets/johto_1_metatiles.bin"
; 0x1a40e

Tileset0Coll: ; 0x1a40e
TilesetJohto1Coll: ; 0x1a40e
INCLUDE "tilesets/johto_1_collision.asm"
; 0x1a60e

TilesetIcePathGFX: ; 0x1a60e
INCBIN "gfx/tilesets/ice_path.2bpp.lz"
; 0x1af3e

TilesetIcePathMeta: ; 0x1af3e
INCBIN "tilesets/ice_path_metatiles.bin"
; 0x1b33e

TilesetIcePathColl: ; 0x1b33e
INCLUDE "tilesets/ice_path_collision.asm"
; 0x1b43e

TilesetPlayersHouse2FGFX: ; 0x1b43e
INCBIN "gfx/tilesets/players_house_2f.2bpp.lz"
; 0x1b8fe

TilesetPlayersHouse2FMeta: ; 0x1b8fe
INCBIN "tilesets/players_house_2f_metatiles.bin"
; 0x1bcfe

TilesetPlayersHouse2FColl: ; 0x1bcfe
INCLUDE "tilesets/players_house_2f_collision.asm"
; 0x1bdfe


SECTION "Tileset Data 2", ROMX

TilesetPokecenterGFX: ; 0x1c30c
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"
; 0x1c73c

TilesetPokecenterMeta: ; 0x1c73c
INCBIN "tilesets/pokecenter_metatiles.bin"
; 0x1cb3c

TilesetPokecenterColl: ; 0x1cb3c
INCLUDE "tilesets/pokecenter_collision.asm"
; 0x1cc3c

TilesetPortGFX: ; 0x1cc3c
INCBIN "gfx/tilesets/port.2bpp.lz"
; 0x1d04c

TilesetPortMeta: ; 0x1d04c
INCBIN "tilesets/port_metatiles.bin"
; 0x1d44c

TilesetPortColl: ; 0x1d44c
INCLUDE "tilesets/port_collision.asm"
; 0x1d54c

TilesetPlayersHouseGFX: ; 0x1d54c
INCBIN "gfx/tilesets/players_house.2bpp.lz"
; 0x1d92c

TilesetPlayersHouseMeta: ; 0x1d92c
INCBIN "tilesets/players_house_metatiles.bin"
; 0x1dd2c

TilesetPlayersHouseColl: ; 0x1dd2c
INCLUDE "tilesets/players_house_collision.asm"
; 0x1de2c

TilesetCeladonMansionGFX: ; 0x1de2c
INCBIN "gfx/tilesets/celadon_mansion.2bpp.lz"
; 0x1e58c

TilesetCeladonMansionMeta: ; 0x1e58c
INCBIN "tilesets/celadon_mansion_metatiles.bin"
; 0x1e98c

TilesetCeladonMansionColl: ; 0x1e98c
INCLUDE "tilesets/celadon_mansion_collision.asm"
; 0x1ea8c

TilesetCaveGFX: ; 0x1ea8c
INCBIN "gfx/tilesets/cave.2bpp.lz"
; 0x1ee1c

TilesetCaveMeta: ; 0x1ee1c
TilesetWhirlIslandsMeta: ; 0x1ee1c
INCBIN "tilesets/cave_metatiles.bin"
; 0x1f21c

TilesetCaveColl: ; 0x1f21c
TilesetWhirlIslandsColl: ; 0x1f21c
INCLUDE "tilesets/cave_collision.asm"
; 0x1f31c


SECTION "Tileset Data 3", ROMX

TilesetSproutTowerGFX: ; 0x20181
INCBIN "gfx/tilesets/sprout_tower.2bpp.lz"
; 0x206e1

TilesetSproutTowerMeta: ; 0x206e1
INCBIN "tilesets/sprout_tower_metatiles.bin"
; 0x20ae1

TilesetSproutTowerColl: ; 0x20ae1
INCLUDE "tilesets/sprout_tower_collision.asm"
; 0x20be1

TilesetLabGFX: ; 0x20be1
INCBIN "gfx/tilesets/lab.2bpp.lz"
; 0x213e1

TilesetLabMeta: ; 0x213e1
INCBIN "tilesets/lab_metatiles.bin"
; 0x217e1

TilesetLabColl: ; 0x217e1
INCLUDE "tilesets/lab_collision.asm"
; 0x218e1

TilesetMartGFX: ; 0x218e1
INCBIN "gfx/tilesets/mart.2bpp.lz"
; 0x22031

TilesetMartMeta: ; 0x22031
INCBIN "tilesets/mart_metatiles.bin"
; 0x22431

TilesetMartColl: ; 0x22431
INCLUDE "tilesets/mart_collision.asm"
; 0x22531

TilesetGameCornerGFX: ; 0x22531
INCBIN "gfx/tilesets/game_corner.2bpp.lz"
; 0x22af1

TilesetGameCornerMeta: ; 0x22af1
INCBIN "tilesets/game_corner_metatiles.bin"
; 0x22ef1

TilesetGameCornerColl: ; 0x22ef1
INCLUDE "tilesets/game_corner_collision.asm"
; 0x22ff1

TilesetTrainStationGFX: ; 0x22ff1
INCBIN "gfx/tilesets/train_station.2bpp.lz"
; 0x23391

TilesetTrainStationMeta: ; 0x23391
INCBIN "tilesets/train_station_metatiles.bin"
; 0x23791

TilesetTrainStationColl: ; 0x23791
INCLUDE "tilesets/train_station_collision.asm"
; 0x23891

TilesetIlexForestMeta: ; 0x23891
INCBIN "tilesets/ilex_forest_metatiles.bin"
; 0x23b11


SECTION "Tileset Data 4", ROMX

TilesetGym1GFX: ; 0x30000
INCBIN "gfx/tilesets/gym_1.2bpp.lz"
; 0x304e0

TilesetGym1Meta: ; 0x304e0
INCBIN "tilesets/gym_1_metatiles.bin"
; 0x308e0

TilesetGym1Coll: ; 0x308e0
INCLUDE "tilesets/gym_1_collision.asm"
; 0x309e0

TilesetParkGFX: ; 0x309e0
INCBIN "gfx/tilesets/park.2bpp.lz"
; 0x30e80

TilesetParkMeta: ; 0x30e80
INCBIN "tilesets/park_metatiles.bin"
; 0x31280

TilesetParkColl: ; 0x31280
INCLUDE "tilesets/park_collision.asm"
; 0x31380

TilesetRadioTowerGFX: ; 0x31380
INCBIN "gfx/tilesets/radio_tower.2bpp.lz"
; 0x318e0

TilesetRadioTowerMeta: ; 0x318e0
INCBIN "tilesets/radio_tower_metatiles.bin"
; 0x31ce0

TilesetRadioTowerColl: ; 0x31ce0
INCLUDE "tilesets/radio_tower_collision.asm"
; 0x31de0

TilesetUndergroundGFX: ; 0x31de0
INCBIN "gfx/tilesets/underground.2bpp.lz"
; 0x321b0

TilesetUndergroundMeta: ; 0x321b0
INCBIN "tilesets/underground_metatiles.bin"
; 0x325b0

TilesetUndergroundColl: ; 0x325b0
INCLUDE "tilesets/underground_collision.asm"
; 0x326b0

TilesetWhirlIslandsGFX: ; 0x326b0
INCBIN "gfx/tilesets/whirl_islands.2bpp.lz"
; 0x329f0

UnusedTilesetWhirlIslandsMeta: ; 0x329f0
INCBIN "tilesets/unused_whirl_islands_metatiles.bin"
; 0x331f0

UnusedTilesetWhirlIslandsColl: ; 0x331f0
INCLUDE "tilesets/unused_whirl_islands_collision.asm"
; 0x333f0


SECTION "Tileset Data 5", ROMX

TilesetPokeComCenterGFX: ; 0xb4000
INCBIN "gfx/tilesets/pokecom_center.2bpp.lz"
; 0xb48a0

TilesetPokeComCenterMeta: ; 0xb48a0
INCBIN "tilesets/pokecom_center_metatiles.bin"
; 0xb4ca0

TilesetPokeComCenterColl: ; 0xb4ca0
INCLUDE "tilesets/pokecom_center_collision.asm"
; 0xb4da0

TilesetBattleTowerGFX: ; 0xb4da0
INCBIN "gfx/tilesets/battle_tower.2bpp.lz"
; 0xb50e0

TilesetBattleTowerMeta: ; 0xb50e0
INCBIN "tilesets/battle_tower_metatiles.bin"
; 0xb54e0

TilesetBattleTowerColl: ; 0xb54e0
INCLUDE "tilesets/battle_tower_collision.asm"
; 0xb55e0

TilesetGateGFX: ; 0xb55e0
INCBIN "gfx/tilesets/gate.2bpp.lz"
; 0xb59e0

TilesetGateMeta: ; 0xb59e0
INCBIN "tilesets/gate_metatiles.bin"
; 0xb5de0

TilesetGateColl: ; 0xb5de0
INCLUDE "tilesets/gate_collision.asm"
; 0xb5ee0

TilesetJohto2GFX: ; 0xb5ee0
TilesetBattleTowerOutsideGFX: ; 0xb5ee0
INCBIN "gfx/tilesets/johto_2.2bpp.lz"
; 0xb6ae8

TilesetJohto2Meta: ; 0xb6ae8
INCBIN "tilesets/johto_2_metatiles.bin"
; 0xb72e8

TilesetJohto2Coll: ; 0xb72e8
INCLUDE "tilesets/johto_2_collision.asm"
; 0xb74e8

TilesetKurtsHouseGFX: ; 0xb74e8
INCBIN "gfx/tilesets/kurts_house.2bpp.lz"
; 0xb79a8

TilesetKurtsHouseMeta: ; 0xb79a8
INCBIN "tilesets/kurts_house_metatiles.bin"
; 0xb7da8

TilesetKurtsHouseColl: ; 0xb7da8
INCLUDE "tilesets/kurts_house_collision.asm"
; 0xb7ea8


SECTION "Tileset Data 6", ROMX

TilesetIlexForestGFX: ; 0xdc000
INCBIN "gfx/tilesets/ilex_forest.2bpp.lz"
; 0xdc3d0

TilesetOlivineGymGFX: ; 0xdc3d0
INCBIN "gfx/tilesets/olivine_gym.2bpp.lz"
; 0xdcc50

TilesetOlivineGymMeta: ; 0xdcc50
INCBIN "tilesets/olivine_gym_metatiles.bin"
; 0xdd050

TilesetOlivineGymColl: ; 0xdd050
INCLUDE "tilesets/olivine_gym_collision.asm"
; 0xdd150

TilesetHouse1GFX: ; 0xdd150
INCBIN "gfx/tilesets/house_1.2bpp.lz"
; 0xdd600

TilesetHouse1Meta: ; 0xdd600
INCBIN "tilesets/house_1_metatiles.bin"
; 0xdda00

TilesetHouse1Coll: ; 0xdda00
INCLUDE "tilesets/house_1_collision.asm"
; 0xddb00

TilesetLighthouseGFX: ; 0xddb00
INCBIN "gfx/tilesets/lighthouse.2bpp.lz"
; 0xddf70

TilesetLighthouseMeta: ; 0xddf70
INCBIN "tilesets/lighthouse_metatiles.bin"
; 0xde370

TilesetLighthouseColl: ; 0xde370
INCLUDE "tilesets/lighthouse_collision.asm"
; 0xde470

TilesetIlexForestColl: ; 0xde470
INCLUDE "tilesets/ilex_forest_collision.asm"
; 0xde570

TilesetPowerPlantGFX: ; 0xde570
INCBIN "gfx/tilesets/power_plant.2bpp.lz"
; 0xde990

TilesetPowerPlantMeta: ; 0xde990
INCBIN "tilesets/power_plant_metatiles.bin"
; 0xded90

TilesetPowerPlantColl: ; 0xded90
INCLUDE "tilesets/power_plant_collision.asm"
; 0xdee90

TilesetBattleTowerOutsideMeta: ; 0xdee90
INCBIN "tilesets/battle_tower_outside_metatiles.bin"
; 0xdf690

TilesetBattleTowerOutsideColl: ; 0xdf690
INCLUDE "tilesets/battle_tower_outside_collision.asm"
; 0xdf890

TilesetBetaWordRoomMeta: ; 0xdf890
INCBIN "tilesets/beta_word_room_metatiles.bin"
; 0xdfc90

TilesetBetaWordRoomColl: ; 0xdfc90
TilesetHoOhWordRoomColl: ; 0xdfc90
TilesetKabutoWordRoomColl: ; 0xdfc90
TilesetOmanyteWordRoomColl: ; 0xdfc90
TilesetAerodactylWordRoomColl: ; 0xdfc90
INCLUDE "tilesets/beta_word_room_collision.asm"
; 0xdfd90


SECTION "Tileset Data 7", ROMX

TilesetRuinsOfAlphGFX: ; 0x1dc5a1
TilesetBetaWordRoomGFX: ; 0x1dc5a1
TilesetHoOhWordRoomGFX: ; 0x1dc5a1
TilesetKabutoWordRoomGFX: ; 0x1dc5a1
TilesetOmanyteWordRoomGFX: ; 0x1dc5a1
TilesetAerodactylWordRoomGFX: ; 0x1dc5a1
INCBIN "gfx/tilesets/ruins_of_alph.2bpp.lz"
; 0x1dd1a9

TilesetRuinsOfAlphMeta: ; 0x1dd1a9
INCBIN "tilesets/ruins_of_alph_metatiles.bin"
; 0x1dd5a9

TilesetRuinsOfAlphColl: ; 0x1dd5a9
INCLUDE "tilesets/ruins_of_alph_collision.asm"
; 0x1dd6a9


SECTION "Tileset Data 8", ROMX

TilesetHoOhWordRoomMeta: ; 0x1e0000
INCBIN "tilesets/ho_oh_word_room_metatiles.bin"
; 0x1e0400

TilesetKabutoWordRoomMeta: ; 0x1e0400
INCBIN "tilesets/kabuto_word_room_metatiles.bin"
; 0x1e0800

TilesetOmanyteWordRoomMeta: ; 0x1e0800
INCBIN "tilesets/omanyte_word_room_metatiles.bin"
; 0x1e0c00

TilesetAerodactylWordRoomMeta: ; 0x1e0c00
INCBIN "tilesets/aerodactyl_word_room_metatiles.bin"
; 0x1e1000
