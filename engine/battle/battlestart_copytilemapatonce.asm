; FLOAT: Referred to by DoBattleTransition and StartTrainerBattle_LoadPokeBallGraphics
SECTION "BattleStart_CopyTilemapAtOnce", ROMX, BANK[$23]

BattleStart_CopyTilemapAtOnce:
	call CGBOnly_CopyTilemapAtOnce
	ret
