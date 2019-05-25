INCLUDE "macros/rst.inc"


SECTION "engine/battle/update_battle_huds.asm", ROMX

_UpdateBattleHUDs::
	farcall DrawPlayerHUD
	ld hl, wPlayerHPPal
	call SetHPPal
	farcall DrawEnemyHUD
	ld hl, wEnemyHPPal
	call SetHPPal
	farcall FinishBattleAnim
	ret
