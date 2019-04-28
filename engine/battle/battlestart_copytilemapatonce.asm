SECTION "BattleStart_CopyTilemapAtOnce", ROMX, BANK[BANK_BATTLE_TRANSITION]

BattleStart_CopyTilemapAtOnce:
	call CGBOnly_CopyTilemapAtOnce
	ret
