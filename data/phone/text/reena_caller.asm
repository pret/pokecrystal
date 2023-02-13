ReenaMonsIsAPerfectMatchText:
	text "Ecoute..."

	para "Tu te souviens de"
	line "@"
	text_ram wStringBuffer4
	text "?"

	para "Mon joli petit"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "Tu le trouves"
	line "joli, non?"
	done

ReenaDefeatedMonText:
	text "Quoi? Si j'ai déjà"
	line "vu un @"
	text_ram wStringBuffer4
	text "?"

	para "Tu me prends pour"
	line "qui?"

	para "J'en ai battu des"
	line "tas!"
	done

ReenaLostAMonText:
	text "Si j'ai déjà loupé"
	line "un #MON?"

	para "Tu me prends pour"
	line "qui?"

	para "Moi je manque ja-"
	line "mais d'attraper un"

	para "@"
	text_ram wStringBuffer4
	text_start
	line "sauvage! Et ouais!"
	done

ReenaBattleRematchText:
	text "On va se faire"
	line "un combat!"

	para "Vers..."
	line "@"
	text_ram wStringBuffer5
	text "!"

	para "Ne me fais pas"
	line "attendre, OK?"
	done

ReenaHangUpText:
	text "OK. Tchao."
	done

ReenaForwardText:
	text "Ne crâne pas si tu"
	line "as pu me battre!"

	para "C'est bas!"
	done

ReenaHurryText:
	text "Qu'est-ce que tu"
	line "fabriques?"

	para "Viens vers"
	line "@"
	text_ram wStringBuffer5
	text "!"
	cont "T'as peur?"
	done
