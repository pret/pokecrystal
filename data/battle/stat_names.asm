StatNames:
; entries correspond to stat ids
	list_start STRING_BUFFER_LENGTH - 1
	li "ATTACK"
	li "DEFENSE"
	li "SPEED"
	li "SPCL.ATK"
	li "SPCL.DEF"
	li "ACCURACY"
	li "EVASION"
	li "ABILITY" ; used for BattleCommand_Curse
	assert_list_length NUM_LEVEL_STATS
