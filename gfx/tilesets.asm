tilecoll: MACRO
; used in data/tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "Tileset Data 1", ROMX

TilesetKantoGFX:
INCBIN "gfx/tilesets/kanto.2bpp.lz"

TilesetKantoMeta:
INCBIN "data/tilesets/kanto_metatiles.bin"

TilesetKantoColl:
INCLUDE "data/tilesets/kanto_collision.asm"

Tileset0GFX:
TilesetJohtoGFX:
INCBIN "gfx/tilesets/johto.2bpp.lz"

Tileset0Meta:
TilesetJohtoMeta:
INCBIN "data/tilesets/johto_metatiles.bin"

Tileset0Coll:
TilesetJohtoColl:
INCLUDE "data/tilesets/johto_collision.asm"

TilesetIcePathGFX:
INCBIN "gfx/tilesets/ice_path.2bpp.lz"

TilesetIcePathMeta:
INCBIN "data/tilesets/ice_path_metatiles.bin"

TilesetIcePathColl:
INCLUDE "data/tilesets/ice_path_collision.asm"

TilesetPlayersRoomGFX:
INCBIN "gfx/tilesets/players_room.2bpp.lz"

TilesetPlayersRoomMeta:
INCBIN "data/tilesets/players_room_metatiles.bin"

TilesetPlayersRoomColl:
INCLUDE "data/tilesets/players_room_collision.asm"


SECTION "Tileset Data 2", ROMX

TilesetPokecenterGFX:
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

TilesetPokecenterMeta:
INCBIN "data/tilesets/pokecenter_metatiles.bin"

TilesetPokecenterColl:
INCLUDE "data/tilesets/pokecenter_collision.asm"

TilesetPortGFX:
INCBIN "gfx/tilesets/port.2bpp.lz"

TilesetPortMeta:
INCBIN "data/tilesets/port_metatiles.bin"

TilesetPortColl:
INCLUDE "data/tilesets/port_collision.asm"

TilesetPlayersHouseGFX:
INCBIN "gfx/tilesets/players_house.2bpp.lz"

TilesetPlayersHouseMeta:
INCBIN "data/tilesets/players_house_metatiles.bin"

TilesetPlayersHouseColl:
INCLUDE "data/tilesets/players_house_collision.asm"

TilesetMansionGFX:
INCBIN "gfx/tilesets/mansion.2bpp.lz"

TilesetMansionMeta:
INCBIN "data/tilesets/mansion_metatiles.bin"

TilesetMansionColl:
INCLUDE "data/tilesets/mansion_collision.asm"

TilesetCaveGFX:
INCBIN "gfx/tilesets/cave.2bpp.lz"

TilesetCaveMeta:
TilesetDarkCaveMeta:
INCBIN "data/tilesets/cave_metatiles.bin"

TilesetCaveColl:
TilesetDarkCaveColl:
INCLUDE "data/tilesets/cave_collision.asm"


SECTION "Tileset Data 3", ROMX

TilesetTowerGFX:
INCBIN "gfx/tilesets/tower.2bpp.lz"

TilesetTowerMeta:
INCBIN "data/tilesets/tower_metatiles.bin"

TilesetTowerColl:
INCLUDE "data/tilesets/tower_collision.asm"

TilesetLabGFX:
INCBIN "gfx/tilesets/lab.2bpp.lz"

TilesetLabMeta:
INCBIN "data/tilesets/lab_metatiles.bin"

TilesetLabColl:
INCLUDE "data/tilesets/lab_collision.asm"

TilesetMartGFX:
INCBIN "gfx/tilesets/mart.2bpp.lz"

TilesetMartMeta:
INCBIN "data/tilesets/mart_metatiles.bin"

TilesetMartColl:
INCLUDE "data/tilesets/mart_collision.asm"

TilesetGameCornerGFX:
INCBIN "gfx/tilesets/game_corner.2bpp.lz"

TilesetGameCornerMeta:
INCBIN "data/tilesets/game_corner_metatiles.bin"

TilesetGameCornerColl:
INCLUDE "data/tilesets/game_corner_collision.asm"

TilesetTrainStationGFX:
INCBIN "gfx/tilesets/train_station.2bpp.lz"

TilesetTrainStationMeta:
INCBIN "data/tilesets/train_station_metatiles.bin"

TilesetTrainStationColl:
INCLUDE "data/tilesets/train_station_collision.asm"

TilesetForestMeta:
INCBIN "data/tilesets/forest_metatiles.bin"


SECTION "Tileset Data 4", ROMX

TilesetEliteFourRoomGFX:
INCBIN "gfx/tilesets/elite_four_room.2bpp.lz"

TilesetEliteFourRoomMeta:
INCBIN "data/tilesets/elite_four_room_metatiles.bin"

TilesetEliteFourRoomColl:
INCLUDE "data/tilesets/elite_four_room_collision.asm"

TilesetParkGFX:
INCBIN "gfx/tilesets/park.2bpp.lz"

TilesetParkMeta:
INCBIN "data/tilesets/park_metatiles.bin"

TilesetParkColl:
INCLUDE "data/tilesets/park_collision.asm"

TilesetRadioTowerGFX:
INCBIN "gfx/tilesets/radio_tower.2bpp.lz"

TilesetRadioTowerMeta:
INCBIN "data/tilesets/radio_tower_metatiles.bin"

TilesetRadioTowerColl:
INCLUDE "data/tilesets/radio_tower_collision.asm"

TilesetUndergroundGFX:
INCBIN "gfx/tilesets/underground.2bpp.lz"

TilesetUndergroundMeta:
INCBIN "data/tilesets/underground_metatiles.bin"

TilesetUndergroundColl:
INCLUDE "data/tilesets/underground_collision.asm"

TilesetDarkCaveGFX:
INCBIN "gfx/tilesets/dark_cave.2bpp.lz"

UnusedTilesetDarkCaveMeta:
INCBIN "data/tilesets/unused_dark_cave_metatiles.bin"

UnusedTilesetDarkCaveColl:
INCLUDE "data/tilesets/unused_dark_cave_collision.asm"


SECTION "Tileset Data 5", ROMX

TilesetPokeComCenterGFX:
INCBIN "gfx/tilesets/pokecom_center.2bpp.lz"

TilesetPokeComCenterMeta:
INCBIN "data/tilesets/pokecom_center_metatiles.bin"

TilesetPokeComCenterColl:
INCLUDE "data/tilesets/pokecom_center_collision.asm"

TilesetBattleTowerGFX:
INCBIN "gfx/tilesets/battle_tower.2bpp.lz"

TilesetBattleTowerMeta:
INCBIN "data/tilesets/battle_tower_metatiles.bin"

TilesetBattleTowerColl:
INCLUDE "data/tilesets/battle_tower_collision.asm"

TilesetGateGFX:
INCBIN "gfx/tilesets/gate.2bpp.lz"

TilesetGateMeta:
INCBIN "data/tilesets/gate_metatiles.bin"

TilesetGateColl:
INCLUDE "data/tilesets/gate_collision.asm"

TilesetJohtoModernGFX:
TilesetBattleTowerOutsideGFX:
INCBIN "gfx/tilesets/johto_modern.2bpp.lz"

TilesetJohtoModernMeta:
INCBIN "data/tilesets/johto_modern_metatiles.bin"

TilesetJohtoModernColl:
INCLUDE "data/tilesets/johto_modern_collision.asm"

TilesetTraditionalHouseGFX:
INCBIN "gfx/tilesets/traditional_house.2bpp.lz"

TilesetTraditionalHouseMeta:
INCBIN "data/tilesets/traditional_house_metatiles.bin"

TilesetTraditionalHouseColl:
INCLUDE "data/tilesets/traditional_house_collision.asm"


SECTION "Tileset Data 6", ROMX

TilesetForestGFX:
INCBIN "gfx/tilesets/forest.2bpp.lz"

TilesetChampionsRoomGFX:
INCBIN "gfx/tilesets/champions_room.2bpp.lz"

TilesetChampionsRoomMeta:
INCBIN "data/tilesets/champions_room_metatiles.bin"

TilesetChampionsRoomColl:
INCLUDE "data/tilesets/champions_room_collision.asm"

TilesetHouseGFX:
INCBIN "gfx/tilesets/house.2bpp.lz"

TilesetHouseMeta:
INCBIN "data/tilesets/house_metatiles.bin"

TilesetHouseColl:
INCLUDE "data/tilesets/house_collision.asm"

TilesetLighthouseGFX:
INCBIN "gfx/tilesets/lighthouse.2bpp.lz"

TilesetLighthouseMeta:
INCBIN "data/tilesets/lighthouse_metatiles.bin"

TilesetLighthouseColl:
INCLUDE "data/tilesets/lighthouse_collision.asm"

TilesetForestColl:
INCLUDE "data/tilesets/forest_collision.asm"

TilesetFacilityGFX:
INCBIN "gfx/tilesets/facility.2bpp.lz"

TilesetFacilityMeta:
INCBIN "data/tilesets/facility_metatiles.bin"

TilesetFacilityColl:
INCLUDE "data/tilesets/facility_collision.asm"

TilesetBattleTowerOutsideMeta:
INCBIN "data/tilesets/battle_tower_outside_metatiles.bin"

TilesetBattleTowerOutsideColl:
INCLUDE "data/tilesets/battle_tower_outside_collision.asm"

TilesetBetaWordRoomMeta:
INCBIN "data/tilesets/beta_word_room_metatiles.bin"

TilesetBetaWordRoomColl:
TilesetHoOhWordRoomColl:
TilesetKabutoWordRoomColl:
TilesetOmanyteWordRoomColl:
TilesetAerodactylWordRoomColl:
INCLUDE "data/tilesets/beta_word_room_collision.asm"


SECTION "Tileset Data 7", ROMX

TilesetRuinsOfAlphGFX:
TilesetBetaWordRoomGFX:
TilesetHoOhWordRoomGFX:
TilesetKabutoWordRoomGFX:
TilesetOmanyteWordRoomGFX:
TilesetAerodactylWordRoomGFX:
INCBIN "gfx/tilesets/ruins_of_alph.2bpp.lz"

TilesetRuinsOfAlphMeta:
INCBIN "data/tilesets/ruins_of_alph_metatiles.bin"

TilesetRuinsOfAlphColl:
INCLUDE "data/tilesets/ruins_of_alph_collision.asm"


SECTION "Tileset Data 8", ROMX

TilesetHoOhWordRoomMeta:
INCBIN "data/tilesets/ho_oh_word_room_metatiles.bin"

TilesetKabutoWordRoomMeta:
INCBIN "data/tilesets/kabuto_word_room_metatiles.bin"

TilesetOmanyteWordRoomMeta:
INCBIN "data/tilesets/omanyte_word_room_metatiles.bin"

TilesetAerodactylWordRoomMeta:
INCBIN "data/tilesets/aerodactyl_word_room_metatiles.bin"
