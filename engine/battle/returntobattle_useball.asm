INCLUDE "macros/rst.inc"
INCLUDE "constants/battle_constants.inc"


SECTION "engine/battle/returntobattle_useball", ROMX

_ReturnToBattle_UseBall::
	call ClearBGPalettes
	call ClearTilemap
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .gettutorialbackpic
	farcall GetBattleMonBackpic
	jr .continue

.gettutorialbackpic
	farcall GetTrainerBackpic
.continue
	farcall GetEnemyMonFrontpic
	farcall _LoadBattleFontsHPBar
	call GetMemSGBLayout
	call CloseWindow
	call LoadStandardMenuHeader
	call WaitBGMap
	jp SetPalettes
