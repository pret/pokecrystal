_UpdateBattleHUDs:
	farcall DrawPlayerHUD
	ld hl, PlayerHPPal
	call SetHPPal
	farcall DrawEnemyHUD
	ld hl, EnemyHPPal
	call SetHPPal
	farcall FinishBattleAnim
	ret
