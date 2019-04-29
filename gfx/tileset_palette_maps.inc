tilepal: MACRO
; used in gfx/tilesets/*_palette_map.asm
; vram bank, pals
x = \1 << OAM_TILE_BANK
rept (_NARG + -1) / 2
	dn (x | PAL_BG_\3), (x | PAL_BG_\2)
	shift
	shift
endr
ENDM

TilesetKantoPalMap:
INCLUDE "gfx/tilesets/kanto_palette_map.inc"

Tileset0PalMap:
TilesetJohtoPalMap:
INCLUDE "gfx/tilesets/johto_palette_map.inc"

TilesetJohtoModernPalMap:
INCLUDE "gfx/tilesets/johto_modern_palette_map.inc"

TilesetHousePalMap:
INCLUDE "gfx/tilesets/house_palette_map.inc"

TilesetPlayersHousePalMap:
INCLUDE "gfx/tilesets/players_house_palette_map.inc"

TilesetPokecenterPalMap:
INCLUDE "gfx/tilesets/pokecenter_palette_map.inc"

TilesetGatePalMap:
INCLUDE "gfx/tilesets/gate_palette_map.inc"

TilesetPortPalMap:
INCLUDE "gfx/tilesets/port_palette_map.inc"

TilesetLabPalMap:
INCLUDE "gfx/tilesets/lab_palette_map.inc"

TilesetFacilityPalMap:
INCLUDE "gfx/tilesets/facility_palette_map.inc"

TilesetMartPalMap:
INCLUDE "gfx/tilesets/mart_palette_map.inc"

TilesetMansionPalMap:
INCLUDE "gfx/tilesets/mansion_palette_map.inc"

TilesetGameCornerPalMap:
INCLUDE "gfx/tilesets/game_corner_palette_map.inc"

TilesetEliteFourRoomPalMap:
INCLUDE "gfx/tilesets/elite_four_room_palette_map.inc"

TilesetTraditionalHousePalMap:
INCLUDE "gfx/tilesets/traditional_house_palette_map.inc"

TilesetTowerPalMap:
INCLUDE "gfx/tilesets/tower_palette_map.inc"

TilesetCavePalMap:
TilesetDarkCavePalMap:
INCLUDE "gfx/tilesets/cave_palette_map.inc"

TilesetParkPalMap:
INCLUDE "gfx/tilesets/park_palette_map.inc"

TilesetRuinsOfAlphPalMap:
TilesetBetaWordRoomPalMap:
TilesetHoOhWordRoomPalMap:
TilesetKabutoWordRoomPalMap:
TilesetOmanyteWordRoomPalMap:
TilesetAerodactylWordRoomPalMap:
INCLUDE "gfx/tilesets/ruins_of_alph_palette_map.inc"

TilesetRadioTowerPalMap:
INCLUDE "gfx/tilesets/radio_tower_palette_map.inc"

TilesetTrainStationPalMap:
INCLUDE "gfx/tilesets/train_station_palette_map.inc"

TilesetUndergroundPalMap:
INCLUDE "gfx/tilesets/underground_palette_map.inc"

TilesetChampionsRoomPalMap:
INCLUDE "gfx/tilesets/champions_room_palette_map.inc"

TilesetLighthousePalMap:
INCLUDE "gfx/tilesets/lighthouse_palette_map.inc"

TilesetPlayersRoomPalMap:
INCLUDE "gfx/tilesets/players_room_palette_map.inc"

UnusedMuseumPalMap:
INCLUDE "gfx/tilesets/unused_museum_palette_map.inc"

TilesetIcePathPalMap:
INCLUDE "gfx/tilesets/ice_path_palette_map.inc"

TilesetForestPalMap:
INCLUDE "gfx/tilesets/forest_palette_map.inc"

TilesetPokeComCenterPalMap:
INCLUDE "gfx/tilesets/pokecom_center_palette_map.inc"

TilesetBattleTowerPalMap:
INCLUDE "gfx/tilesets/battle_tower_palette_map.inc"

TilesetBattleTowerOutsidePalMap:
INCLUDE "gfx/tilesets/battle_tower_outside_palette_map.inc"

; unused
rept 26
	db $06
endr
