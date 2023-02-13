AlanGettingStrongerText:
	text "Mon @"
	text_ram wStringBuffer4
	text_start
	line "est très fort!"
	cont "Je l'avais prévu!"
	done

AlanDefeatedMonText:
	text "Au fait, j'ai"
	line "battu un"

	para "@"
	text_ram wStringBuffer4
	text_start
	line "l'autre jour."

	para "S'entraîner, ça"
	line "paye!"
	done

AlanLostAMonText:
	text "Au fait, un"
	line "@"
	text_ram wStringBuffer4
	text " m'a"
	cont "échappé hier."

	para "Une erreur de"
	line "tactique..."
	done

AlanBattleRematchText:
	text "J'ai bien étudié"
	line "et j'ai fait de"
	cont "gros progrès!"

	para "Je suis vers"
	line "@"
	text_ram wStringBuffer5
	text "."

	para "Tu viens te faire"
	line "un p'tit combat?"
	done

AlanHangUpText:
	text "A plus tard!"
	done

AlanFoundItemText:
	text "J'ai trouvé un"
	line "truc chouette!"

	para "C'est pour toi!"
	line "Tu viens vers"

	para "@"
	text_ram wStringBuffer5
	text_start
	line "pour le prendre?"
	done

AlanHaventPickedUpAnythingText:
	text "Je n'ai encore"
	line "rien trouvé."

	para "Je t'appelle si"
	line "j'ai du nouveau."
	done

AlanReminderText:
	text "Y faut qu'on se"
	line "batte! Je vais"
	cont "oublier ma super"
	cont "stratégie!"

	para "J'attends vers"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

AlanComePickUpGiftText:
	text "J'ai des devoirs à"
	line "faire. Tu peux"

	para "venir prendre ton"
	line "cadeau maintenant?"

	para "J'attends vers"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done
