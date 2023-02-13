ParryNothingCanMatchText:
	text "Mon @"
	text_ram wStringBuffer4
	text_start
	line "c'est le top."
	done

ParryDefeatedMonText:
	text "On a mis K.O."
	line "un @"
	text_ram wStringBuffer4
	text_start
	cont "sauvage!"

	para "En fait je voulais"
	line "l'attraper…"
	done

ParryLostAMonText:
	text "Hier, on a vu"
	line "un @"
	text_ram wStringBuffer4
	text_start

	para "sauvage."
	line "On savait pas s'il"

	para "fallait l'attraper"
	line "ou le battre."

	para "Et puis un type"
	line "est arrivé et l'a"

	para "chopé!"
	line "Tu le crois ça?"
	done

ParryBattleRematchText:
	text "Tu veux te battre"
	line "contre moi, non?"

	para "J'ai bon?"
	line "Hein?"

	para "On s'retrouve vers"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

ParryHangUpText:
	text "OK, rappelle-moi"
	line "vite!"
	done

ParryBattleWithMeText:
	text "Tu vas encore"
	line "m'affronter, non?"
	done

ParryHaventYouGottenToText:
	text "Tu as visité"
	line "@"
	text_ram wStringBuffer5
	text "?"

	para "J'attends là."
	line "Je veux combattre!"
	done
