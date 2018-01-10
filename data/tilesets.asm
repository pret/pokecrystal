tileset: MACRO
	dba \1GFX, \1Meta, \1Coll
	dw \1Anim
	dw NULL
	dw \1PalMap
ENDM

; Associated data:
; - The *GFX, *Meta, and *Coll are defined in gfx/tilesets.asm
; - The *Anim are defined in engine/tileset_anims.asm
; - The *PalMap are defined in gfx/tilesets/palette_maps.asm

Tilesets:: ; 4d596
; entries correspond to TILESET_* constants
	tileset Tileset0
	tileset TilesetJohto1
	tileset TilesetJohto2
	tileset TilesetKanto
	tileset TilesetBattleTowerOutside
	tileset TilesetHouse1
	tileset TilesetPlayersHouse
	tileset TilesetPokecenter
	tileset TilesetGate
	tileset TilesetPort
	tileset TilesetLab
	tileset TilesetPowerPlant
	tileset TilesetMart
	tileset TilesetCeladonMansion
	tileset TilesetGameCorner
	tileset TilesetGym1
	tileset TilesetKurtsHouse
	tileset TilesetTrainStation
	tileset TilesetOlivineGym
	tileset TilesetLighthouse
	tileset TilesetPlayersHouse2F
	tileset TilesetPokeComCenter
	tileset TilesetBattleTower
	tileset TilesetSproutTower
	tileset TilesetCave
	tileset TilesetPark
	tileset TilesetRuinsOfAlph
	tileset TilesetRadioTower
	tileset TilesetUnderground
	tileset TilesetIcePath
	tileset TilesetWhirlIslands
	tileset TilesetIlexForest
	tileset TilesetBetaWordRoom
	tileset TilesetHoOhWordRoom
	tileset TilesetKabutoWordRoom
	tileset TilesetOmanyteWordRoom
	tileset TilesetAerodactylWordRoom
; 4d7c1
