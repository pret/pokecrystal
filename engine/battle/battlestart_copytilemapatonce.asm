INCLUDE "constants/floating_constants.inc"


SECTION "engine/battle/battlestart_copytilemapatonce.asm", ROMX, BANK[BANK_BATTLE_TRANSITION]

BattleStart_CopyTilemapAtOnce::
	call CGBOnly_CopyTilemapAtOnce
	ret
