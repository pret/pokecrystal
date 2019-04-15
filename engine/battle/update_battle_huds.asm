SECTION "_UpdateBattleHUDs", ROMX

_UpdateBattleHUDs:
	farcall DrawPlayerHUD
	ld hl, wPlayerHPPal
	call SetHPPal
	farcall DrawEnemyHUD
	ld hl, wEnemyHPPal
	call SetHPPal
	farcall FinishBattleAnim
	ret
