WiltonMonHasGrownText:
	text "Mon @"
	text_ram wStringBuffer4
	text_start
	line "a bien grandi!"

	para "Je suis un sacré"
	line "pêcheur!"
	done

WiltonDefeatedMonText:
	text "On a battu un"
	line "@"
	text_ram wStringBuffer4
	text "…"

	para "Tu sais, la pêche,"
	line "je trouve ça plus"
	cont "marrant."
	done

WiltonLostAMonText:
	text "L'autre jour,"
	line "j'ai failli pêcher"

	para "un énorme"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "Enorme, il était."
	line "J'te jure!"
	done

WiltonBattleRematchText:
	text "Je pêche vers"
	line "@"
	text_ram wStringBuffer5
	text ","

	para "mais ça ne mord"
	line "pas."

	para "Il faut qu'on se"
	line "batte pour faire"
	cont "passer le temps."
	done

WiltonHangUpText:
	text "A plus tard."
	done

WiltonFoundItemText:
	text "J'ai eu un objet"
	line "en pêchant."

	para "Viens le prendre"
	line "vers..."
	cont "@"
	text_ram wStringBuffer5
	text "."
	done

WiltonHaventFoundAnythingText:
	text "Non. Je n'ai rien"
	line "trouvé d'intéres-"
	cont "sant."

	para "Tu dois encore"
	line "attendre."
	done

WiltonNotBitingText:
	text "Pfff..."
	line "Ca mord plus."

	para "Pas comme vers"
	line "@"
	text_ram wStringBuffer5
	text "…"

	para "Il faut qu'on"
	line "se batte!"
	done

WiltonWantThisText:
	text "Tu ne veux pas de"
	line "cet objet?"

	para "Quoi? Tu ne sais"
	line "pas où?"

	para "@"
	text_ram wStringBuffer5
	text "…"
	line "Va d'ACAJOU vers"
	cont "EBENELLE!"
	done
