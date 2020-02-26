INCLUDE "constants/floating_constants.inc"


SECTION "engine/battle/battlestart_copytilemapatonce", ROMX, BANK[BANK_BATTLE_TRANSITION]

BattleStart_CopyTilemapAtOnce::
	call CGBOnly_CopyTilemapAtOnce
	ret
