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
TilesetJohto1PalMap: ; 0x4c0e5
INCLUDE "gfx/tilesets/johto_1_palette_map.asm"
; 0x4c155

TilesetJohto2PalMap: ; 0x4c155
INCLUDE "gfx/tilesets/johto_2_palette_map.asm"
; 0x4c1c5

TilesetHouse1PalMap: ; 0x4c1c5
INCLUDE "gfx/tilesets/house_1_palette_map.asm"
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

TilesetPowerPlantPalMap: ; 0x4c465
INCLUDE "gfx/tilesets/power_plant_palette_map.asm"
; 0x4c4d5

TilesetMartPalMap: ; 0x4c4d5
INCLUDE "gfx/tilesets/mart_palette_map.asm"
; 0x4c545

TilesetCeladonMansionPalMap: ; 0x4c545
INCLUDE "gfx/tilesets/celadon_mansion_palette_map.asm"
; 0x4c5b5

TilesetGameCornerPalMap: ; 0x4c5b5
INCLUDE "gfx/tilesets/game_corner_palette_map.asm"
; 0x4c625

TilesetGym1PalMap: ; 0x4c625
INCLUDE "gfx/tilesets/gym_1_palette_map.asm"
; 0x4c695

TilesetKurtsHousePalMap: ; 0x4c695
INCLUDE "gfx/tilesets/kurts_house_palette_map.asm"
; 0x4c705

TilesetSproutTowerPalMap: ; 0x4c705
INCLUDE "gfx/tilesets/sprout_tower_palette_map.asm"
; 0x4c775

TilesetCavePalMap: ; 0x4c775
TilesetWhirlIslandsPalMap: ; 0x4c775
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

TilesetOlivineGymPalMap: ; 0x4ca15
INCLUDE "gfx/tilesets/olivine_gym_palette_map.asm"
; 0x4ca85

TilesetLighthousePalMap: ; 0x4ca85
INCLUDE "gfx/tilesets/lighthouse_palette_map.asm"
; 0x4caf5

TilesetPlayersHouse2FPalMap: ; 0x4caf5
INCLUDE "gfx/tilesets/players_house_2f_palette_map.asm"
; 0x4cb65

UnusedMuseumPalMap: ; 0x4cb65
INCLUDE "gfx/tilesets/unused_museum_palette_map.asm"
; 4cbd5

TilesetIcePathPalMap: ; 0x4cbd5
INCLUDE "gfx/tilesets/ice_path_palette_map.asm"
; 0x4cc45

TilesetIlexForestPalMap: ; 0x4cc45
INCLUDE "gfx/tilesets/ilex_forest_palette_map.asm"
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
