; entries correspond to TILESET_* constants

tileset: macro
	dba \1GFX, \1Meta, \1Coll
	dw \1Anim
	dw NULL
	dw \1PalMap
endm

Tileset0::
	tileset Tileset0
Tileset1::
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
