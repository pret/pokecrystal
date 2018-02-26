; AIDamageCalc uses BattleCommand_ConstantDamage
; to calculate damage for these instead of
; BattleCommand_DamageCalc and BattleCommand_Stab.

ConstantDamageEffects: ; 39413
	db EFFECT_SUPER_FANG
	db EFFECT_STATIC_DAMAGE
	db EFFECT_LEVEL_DAMAGE
	db EFFECT_PSYWAVE
	db -1 ; end
; 39418
