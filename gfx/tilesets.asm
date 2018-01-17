tilecoll: MACRO
; used in data/tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "Tileset Data 1", ROMX

TilesetKantoGFX: ; 0x18000
INCBIN "gfx/tilesets/kanto.2bpp.lz"
; 0x18606

TilesetKantoMeta: ; 0x18606
INCBIN "data/tilesets/kanto_metatiles.bin"
; 0x18e06

TilesetKantoColl: ; 0x18e06
INCLUDE "data/tilesets/kanto_collision.asm"
; 0x19006

Tileset0GFX: ; 0x19006
TilesetJohtoGFX: ; 0x19006
INCBIN "gfx/tilesets/johto.2bpp.lz"
; 0x19c0e

Tileset0Meta: ; 0x19c0e
TilesetJohtoMeta: ; 0x19c0e
INCBIN "data/tilesets/johto_metatiles.bin"
; 0x1a40e

Tileset0Coll: ; 0x1a40e
TilesetJohtoColl: ; 0x1a40e
INCLUDE "data/tilesets/johto_collision.asm"
; 0x1a60e

TilesetIcePathGFX: ; 0x1a60e
INCBIN "gfx/tilesets/ice_path.2bpp.lz"
; 0x1af3e

TilesetIcePathMeta: ; 0x1af3e
INCBIN "data/tilesets/ice_path_metatiles.bin"
; 0x1b33e

TilesetIcePathColl: ; 0x1b33e
INCLUDE "data/tilesets/ice_path_collision.asm"
; 0x1b43e

TilesetPlayersRoomGFX: ; 0x1b43e
INCBIN "gfx/tilesets/players_room.2bpp.lz"
; 0x1b8fe

TilesetPlayersRoomMeta: ; 0x1b8fe
INCBIN "data/tilesets/players_room_metatiles.bin"
; 0x1bcfe

TilesetPlayersRoomColl: ; 0x1bcfe
INCLUDE "data/tilesets/players_room_collision.asm"
; 0x1bdfe


SECTION "Tileset Data 2", ROMX

TilesetPokecenterGFX: ; 0x1c30c
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"
; 0x1c73c

TilesetPokecenterMeta: ; 0x1c73c
INCBIN "data/tilesets/pokecenter_metatiles.bin"
; 0x1cb3c

TilesetPokecenterColl: ; 0x1cb3c
INCLUDE "data/tilesets/pokecenter_collision.asm"
; 0x1cc3c

TilesetPortGFX: ; 0x1cc3c
INCBIN "gfx/tilesets/port.2bpp.lz"
; 0x1d04c

TilesetPortMeta: ; 0x1d04c
INCBIN "data/tilesets/port_metatiles.bin"
; 0x1d44c

TilesetPortColl: ; 0x1d44c
INCLUDE "data/tilesets/port_collision.asm"
; 0x1d54c

TilesetPlayersHouseGFX: ; 0x1d54c
INCBIN "gfx/tilesets/players_house.2bpp.lz"
; 0x1d92c

TilesetPlayersHouseMeta: ; 0x1d92c
INCBIN "data/tilesets/players_house_metatiles.bin"
; 0x1dd2c

TilesetPlayersHouseColl: ; 0x1dd2c
INCLUDE "data/tilesets/players_house_collision.asm"
; 0x1de2c

TilesetMansionGFX: ; 0x1de2c
INCBIN "gfx/tilesets/mansion.2bpp.lz"
; 0x1e58c

TilesetMansionMeta: ; 0x1e58c
INCBIN "data/tilesets/mansion_metatiles.bin"
; 0x1e98c

TilesetMansionColl: ; 0x1e98c
INCLUDE "data/tilesets/mansion_collision.asm"
; 0x1ea8c

TilesetCaveGFX: ; 0x1ea8c
INCBIN "gfx/tilesets/cave.2bpp.lz"
; 0x1ee1c

TilesetCaveMeta: ; 0x1ee1c
TilesetDarkCaveMeta: ; 0x1ee1c
INCBIN "data/tilesets/cave_metatiles.bin"
; 0x1f21c

TilesetCaveColl: ; 0x1f21c
TilesetDarkCaveColl: ; 0x1f21c
INCLUDE "data/tilesets/cave_collision.asm"
; 0x1f31c


SECTION "Tileset Data 3", ROMX

TilesetTowerGFX: ; 0x20181
INCBIN "gfx/tilesets/tower.2bpp.lz"
; 0x206e1

TilesetTowerMeta: ; 0x206e1
INCBIN "data/tilesets/tower_metatiles.bin"
; 0x20ae1

TilesetTowerColl: ; 0x20ae1
INCLUDE "data/tilesets/tower_collision.asm"
; 0x20be1

TilesetLabGFX: ; 0x20be1
INCBIN "gfx/tilesets/lab.2bpp.lz"
; 0x213e1

TilesetLabMeta: ; 0x213e1
INCBIN "data/tilesets/lab_metatiles.bin"
; 0x217e1

TilesetLabColl: ; 0x217e1
INCLUDE "data/tilesets/lab_collision.asm"
; 0x218e1

TilesetMartGFX: ; 0x218e1
INCBIN "gfx/tilesets/mart.2bpp.lz"
; 0x22031

TilesetMartMeta: ; 0x22031
INCBIN "data/tilesets/mart_metatiles.bin"
; 0x22431

TilesetMartColl: ; 0x22431
INCLUDE "data/tilesets/mart_collision.asm"
; 0x22531

TilesetGameCornerGFX: ; 0x22531
INCBIN "gfx/tilesets/game_corner.2bpp.lz"
; 0x22af1

TilesetGameCornerMeta: ; 0x22af1
INCBIN "data/tilesets/game_corner_metatiles.bin"
; 0x22ef1

TilesetGameCornerColl: ; 0x22ef1
INCLUDE "data/tilesets/game_corner_collision.asm"
; 0x22ff1

TilesetTrainStationGFX: ; 0x22ff1
INCBIN "gfx/tilesets/train_station.2bpp.lz"
; 0x23391

TilesetTrainStationMeta: ; 0x23391
INCBIN "data/tilesets/train_station_metatiles.bin"
; 0x23791

TilesetTrainStationColl: ; 0x23791
INCLUDE "data/tilesets/train_station_collision.asm"
; 0x23891

TilesetForestMeta: ; 0x23891
INCBIN "data/tilesets/forest_metatiles.bin"
; 0x23b11


SECTION "Tileset Data 4", ROMX

TilesetEliteFourRoomGFX: ; 0x30000
INCBIN "gfx/tilesets/elite_four_room.2bpp.lz"
; 0x304e0

TilesetEliteFourRoomMeta: ; 0x304e0
INCBIN "data/tilesets/elite_four_room_metatiles.bin"
; 0x308e0

TilesetEliteFourRoomColl: ; 0x308e0
INCLUDE "data/tilesets/elite_four_room_collision.asm"
; 0x309e0

TilesetParkGFX: ; 0x309e0
INCBIN "gfx/tilesets/park.2bpp.lz"
; 0x30e80

TilesetParkMeta: ; 0x30e80
INCBIN "data/tilesets/park_metatiles.bin"
; 0x31280

TilesetParkColl: ; 0x31280
INCLUDE "data/tilesets/park_collision.asm"
; 0x31380

TilesetRadioTowerGFX: ; 0x31380
INCBIN "gfx/tilesets/radio_tower.2bpp.lz"
; 0x318e0

TilesetRadioTowerMeta: ; 0x318e0
INCBIN "data/tilesets/radio_tower_metatiles.bin"
; 0x31ce0

TilesetRadioTowerColl: ; 0x31ce0
INCLUDE "data/tilesets/radio_tower_collision.asm"
; 0x31de0

TilesetUndergroundGFX: ; 0x31de0
INCBIN "gfx/tilesets/underground.2bpp.lz"
; 0x321b0

TilesetUndergroundMeta: ; 0x321b0
INCBIN "data/tilesets/underground_metatiles.bin"
; 0x325b0

TilesetUndergroundColl: ; 0x325b0
INCLUDE "data/tilesets/underground_collision.asm"
; 0x326b0

TilesetDarkCaveGFX: ; 0x326b0
INCBIN "gfx/tilesets/dark_cave.2bpp.lz"
; 0x329f0

UnusedTilesetDarkCaveMeta: ; 0x329f0
INCBIN "data/tilesets/unused_dark_cave_metatiles.bin"
; 0x331f0

UnusedTilesetDarkCaveColl: ; 0x331f0
INCLUDE "data/tilesets/unused_dark_cave_collision.asm"
; 0x333f0


SECTION "Tileset Data 5", ROMX

TilesetPokeComCenterGFX: ; 0xb4000
INCBIN "gfx/tilesets/pokecom_center.2bpp.lz"
; 0xb48a0

TilesetPokeComCenterMeta: ; 0xb48a0
INCBIN "data/tilesets/pokecom_center_metatiles.bin"
; 0xb4ca0

TilesetPokeComCenterColl: ; 0xb4ca0
INCLUDE "data/tilesets/pokecom_center_collision.asm"
; 0xb4da0

TilesetBattleTowerGFX: ; 0xb4da0
INCBIN "gfx/tilesets/battle_tower.2bpp.lz"
; 0xb50e0

TilesetBattleTowerMeta: ; 0xb50e0
INCBIN "data/tilesets/battle_tower_metatiles.bin"
; 0xb54e0

TilesetBattleTowerColl: ; 0xb54e0
INCLUDE "data/tilesets/battle_tower_collision.asm"
; 0xb55e0

TilesetGateGFX: ; 0xb55e0
INCBIN "gfx/tilesets/gate.2bpp.lz"
; 0xb59e0

TilesetGateMeta: ; 0xb59e0
INCBIN "data/tilesets/gate_metatiles.bin"
; 0xb5de0

TilesetGateColl: ; 0xb5de0
INCLUDE "data/tilesets/gate_collision.asm"
; 0xb5ee0

TilesetJohtoModernGFX: ; 0xb5ee0
TilesetBattleTowerOutsideGFX: ; 0xb5ee0
INCBIN "gfx/tilesets/johto_modern.2bpp.lz"
; 0xb6ae8

TilesetJohtoModernMeta: ; 0xb6ae8
INCBIN "data/tilesets/johto_modern_metatiles.bin"
; 0xb72e8

TilesetJohtoModernColl: ; 0xb72e8
INCLUDE "data/tilesets/johto_modern_collision.asm"
; 0xb74e8

TilesetTraditionalHouseGFX: ; 0xb74e8
INCBIN "gfx/tilesets/traditional_house.2bpp.lz"
; 0xb79a8

TilesetTraditionalHouseMeta: ; 0xb79a8
INCBIN "data/tilesets/traditional_house_metatiles.bin"
; 0xb7da8

TilesetTraditionalHouseColl: ; 0xb7da8
INCLUDE "data/tilesets/traditional_house_collision.asm"
; 0xb7ea8


SECTION "Tileset Data 6", ROMX

TilesetForestGFX: ; 0xdc000
INCBIN "gfx/tilesets/forest.2bpp.lz"
; 0xdc3d0

TilesetChampionsRoomGFX: ; 0xdc3d0
INCBIN "gfx/tilesets/champions_room.2bpp.lz"
; 0xdcc50

TilesetChampionsRoomMeta: ; 0xdcc50
INCBIN "data/tilesets/champions_room_metatiles.bin"
; 0xdd050

TilesetChampionsRoomColl: ; 0xdd050
INCLUDE "data/tilesets/champions_room_collision.asm"
; 0xdd150

TilesetHouseGFX: ; 0xdd150
INCBIN "gfx/tilesets/house.2bpp.lz"
; 0xdd600

TilesetHouseMeta: ; 0xdd600
INCBIN "data/tilesets/house_metatiles.bin"
; 0xdda00

TilesetHouseColl: ; 0xdda00
INCLUDE "data/tilesets/house_collision.asm"
; 0xddb00

TilesetLighthouseGFX: ; 0xddb00
INCBIN "gfx/tilesets/lighthouse.2bpp.lz"
; 0xddf70

TilesetLighthouseMeta: ; 0xddf70
INCBIN "data/tilesets/lighthouse_metatiles.bin"
; 0xde370

TilesetLighthouseColl: ; 0xde370
INCLUDE "data/tilesets/lighthouse_collision.asm"
; 0xde470

TilesetForestColl: ; 0xde470
INCLUDE "data/tilesets/forest_collision.asm"
; 0xde570

TilesetFacilityGFX: ; 0xde570
INCBIN "gfx/tilesets/facility.2bpp.lz"
; 0xde990

TilesetFacilityMeta: ; 0xde990
INCBIN "data/tilesets/facility_metatiles.bin"
; 0xded90

TilesetFacilityColl: ; 0xded90
INCLUDE "data/tilesets/facility_collision.asm"
; 0xdee90

TilesetBattleTowerOutsideMeta: ; 0xdee90
INCBIN "data/tilesets/battle_tower_outside_metatiles.bin"
; 0xdf690

TilesetBattleTowerOutsideColl: ; 0xdf690
INCLUDE "data/tilesets/battle_tower_outside_collision.asm"
; 0xdf890

TilesetBetaWordRoomMeta: ; 0xdf890
INCBIN "data/tilesets/beta_word_room_metatiles.bin"
; 0xdfc90

TilesetBetaWordRoomColl: ; 0xdfc90
TilesetHoOhWordRoomColl: ; 0xdfc90
TilesetKabutoWordRoomColl: ; 0xdfc90
TilesetOmanyteWordRoomColl: ; 0xdfc90
TilesetAerodactylWordRoomColl: ; 0xdfc90
INCLUDE "data/tilesets/beta_word_room_collision.asm"
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
INCBIN "data/tilesets/ruins_of_alph_metatiles.bin"
; 0x1dd5a9

TilesetRuinsOfAlphColl: ; 0x1dd5a9
INCLUDE "data/tilesets/ruins_of_alph_collision.asm"
; 0x1dd6a9


SECTION "Tileset Data 8", ROMX

TilesetHoOhWordRoomMeta: ; 0x1e0000
INCBIN "data/tilesets/ho_oh_word_room_metatiles.bin"
; 0x1e0400

TilesetKabutoWordRoomMeta: ; 0x1e0400
INCBIN "data/tilesets/kabuto_word_room_metatiles.bin"
; 0x1e0800

TilesetOmanyteWordRoomMeta: ; 0x1e0800
INCBIN "data/tilesets/omanyte_word_room_metatiles.bin"
; 0x1e0c00

TilesetAerodactylWordRoomMeta: ; 0x1e0c00
INCBIN "data/tilesets/aerodactyl_word_room_metatiles.bin"
; 0x1e1000
