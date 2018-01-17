tilepal: MACRO
; used in gfx/tilesets/*_palette_map.asm
; vram bank, pals
x = \1 << OAM_TILE_BANK
rept (_NARG +- 1) / 2
	dn (x | PAL_BG_\3), (x | PAL_BG_\2)
	shift
	shift
endr
ENDM


TilesetKantoPalMap: ; 0x4c075
INCLUDE "gfx/tilesets/kanto_palette_map.asm"
; 0x4c0e5

Tileset0PalMap: ; 0x4c0e5
TilesetJohtoPalMap: ; 0x4c0e5
INCLUDE "gfx/tilesets/johto_palette_map.asm"
; 0x4c155

TilesetJohtoModernPalMap: ; 0x4c155
INCLUDE "gfx/tilesets/johto_modern_palette_map.asm"
; 0x4c1c5

TilesetHousePalMap: ; 0x4c1c5
INCLUDE "gfx/tilesets/house_palette_map.asm"
; 0x4c235

TilesetPlayersHousePalMap: ; 0x4c235
INCLUDE "gfx/tilesets/players_house_palette_map.asm"
; 0x4c2a5

TilesetPokecenterPalMap: ; 0x4c2a5
INCLUDE "gfx/tilesets/pokecenter_palette_map.asm"
; 0x4c315

TilesetGatePalMap: ; 0x4c315
INCLUDE "gfx/tilesets/gate_palette_map.asm"
; 0x4c385

TilesetPortPalMap: ; 0x4c385
INCLUDE "gfx/tilesets/port_palette_map.asm"
; 0x4c3f5

TilesetLabPalMap: ; 0x4c3f5
INCLUDE "gfx/tilesets/lab_palette_map.asm"
; 0x4c465

TilesetFacilityPalMap: ; 0x4c465
INCLUDE "gfx/tilesets/facility_palette_map.asm"
; 0x4c4d5

TilesetMartPalMap: ; 0x4c4d5
INCLUDE "gfx/tilesets/mart_palette_map.asm"
; 0x4c545

TilesetMansionPalMap: ; 0x4c545
INCLUDE "gfx/tilesets/mansion_palette_map.asm"
; 0x4c5b5

TilesetGameCornerPalMap: ; 0x4c5b5
INCLUDE "gfx/tilesets/game_corner_palette_map.asm"
; 0x4c625

TilesetEliteFourRoomPalMap: ; 0x4c625
INCLUDE "gfx/tilesets/elite_four_room_palette_map.asm"
; 0x4c695

TilesetTraditionalHousePalMap: ; 0x4c695
INCLUDE "gfx/tilesets/traditional_house_palette_map.asm"
; 0x4c705

TilesetTowerPalMap: ; 0x4c705
INCLUDE "gfx/tilesets/tower_palette_map.asm"
; 0x4c775

TilesetCavePalMap: ; 0x4c775
TilesetDarkCavePalMap: ; 0x4c775
INCLUDE "gfx/tilesets/cave_palette_map.asm"
; 0x4c7e5

TilesetParkPalMap: ; 0x4c7e5
INCLUDE "gfx/tilesets/park_palette_map.asm"
; 0x4c855

TilesetRuinsOfAlphPalMap: ; 0x4c855
TilesetBetaWordRoomPalMap: ; 0x4c855
TilesetHoOhWordRoomPalMap: ; 0x4c855
TilesetKabutoWordRoomPalMap: ; 0x4c855
TilesetOmanyteWordRoomPalMap: ; 0x4c855
TilesetAerodactylWordRoomPalMap: ; 0x4c855
INCLUDE "gfx/tilesets/ruins_of_alph_palette_map.asm"
; 0x4c8c5

TilesetRadioTowerPalMap: ; 0x4c8c5
INCLUDE "gfx/tilesets/radio_tower_palette_map.asm"
; 0x4c935

TilesetTrainStationPalMap: ; 0x4c935
INCLUDE "gfx/tilesets/train_station_palette_map.asm"
; 0x4c9a5

TilesetUndergroundPalMap: ; 0x4c9a5
INCLUDE "gfx/tilesets/underground_palette_map.asm"
; 0x4ca15

TilesetChampionsRoomPalMap: ; 0x4ca15
INCLUDE "gfx/tilesets/champions_room_palette_map.asm"
; 0x4ca85

TilesetLighthousePalMap: ; 0x4ca85
INCLUDE "gfx/tilesets/lighthouse_palette_map.asm"
; 0x4caf5

TilesetPlayersRoomPalMap: ; 0x4caf5
INCLUDE "gfx/tilesets/players_room_palette_map.asm"
; 0x4cb65

UnusedMuseumPalMap: ; 0x4cb65
INCLUDE "gfx/tilesets/unused_museum_palette_map.asm"
; 4cbd5

TilesetIcePathPalMap: ; 0x4cbd5
INCLUDE "gfx/tilesets/ice_path_palette_map.asm"
; 0x4cc45

TilesetForestPalMap: ; 0x4cc45
INCLUDE "gfx/tilesets/forest_palette_map.asm"
; 0x4ccb5

TilesetPokeComCenterPalMap: ; 0x4ccb5
INCLUDE "gfx/tilesets/pokecom_center_palette_map.asm"
; 0x4cd25

TilesetBattleTowerPalMap: ; 0x4cd25
INCLUDE "gfx/tilesets/battle_tower_palette_map.asm"
; 0x4cd95

TilesetBattleTowerOutsidePalMap: ; 0x4cd95
INCLUDE "gfx/tilesets/battle_tower_outside_palette_map.asm"
; 0x4ce05

; unused
; 0x4ce05
rept 26
	db $06
endr
; 0x4ce1f
