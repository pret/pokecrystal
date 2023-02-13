	object_const_def
	const CHARCOALKILN_BLACK_BELT
	const CHARCOALKILN_YOUNGSTER
	const CHARCOALKILN_MOLTRES

CharcoalKiln_MapScripts:
	def_scene_scripts

	def_callbacks

CharcoalKilnBoss:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SavedSlowpoke
	writetext CharcoalKilnBossText1
	waitbutton
	closetext
	end

.SavedSlowpoke:
	writetext CharcoalKilnBossText2
	waitbutton
	closetext
	end

.GotCut:
	writetext CharcoalKilnBossText3
	waitbutton
	closetext
	end

CharcoalKilnApprentice:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue .YoureTheCoolest
	checkevent EVENT_GOT_HM01_CUT
	iftrue .Thanks
	writetext CharcoalKilnApprenticeText1
	waitbutton
	closetext
	end

.Thanks:
	writetext CharcoalKilnApprenticeText2
	promptbutton
	verbosegiveitem CHARCOAL
	iffalse .Done
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	closetext
	end

.YoureTheCoolest:
	writetext CharcoalKilnApprenticeText3
	waitbutton
.Done:
	closetext
	end

CharcoalKilnFarfetchd:
	faceplayer
	opentext
	writetext FarfetchdText
	cry FARFETCH_D
	waitbutton
	closetext
	end

CharcoalKilnBookshelf:
	jumpstd MagazineBookshelfScript

CharcoalKilnRadio:
	jumpstd Radio2Script

CharcoalKilnBossText1:
	text "Tous les RAMOLOSS"
	line "ont disparu"
	cont "de la ville."

	para "On risque d'avoir"
	line "des ennuis avec"
	cont "le protecteur de"
	cont "la forêt..."

	para "C'est peut-être un"
	line "mauvais présage."
	cont "On devrait rester"
	cont "chez soi."
	done

CharcoalKilnBossText2:
	text "Les RAMOLOSS sont"
	line "de retour..."

	para "Mais mon APPRENTI"
	line "n'est pas revenu"
	cont "du BOIS AUX"
	cont "CHENES."

	para "Où est donc ce"
	line "dresseur de"
	cont "troisième zone?"
	done

CharcoalKilnBossText3:
	text "Tu as chassé la"
	line "TEAM ROCKET et tu"

	para "as visité le BOIS"
	line "AUX CHENES en"
	cont "solitaire?"

	para "Pas mal!"
	line "J'aime ça. Viens"
	cont "donc t'entraîner"
	cont "avec nous."
	done

CharcoalKilnApprenticeText1:
	text "Où sont passés"
	line "les RAMOLOSS?"

	para "Sont-ils dehors en"
	line "train de traîner?"
	done

CharcoalKilnApprenticeText2:
	text "Pardonne-moi, j'ai"
	line "oublié de te re-"
	cont "mercier."

	para "J'ai produit ce"
	line "CHARBON."

	para "Les #MON de feu"
	line "seront contents"
	cont "d'en tenir un."
	done

CharcoalKilnApprenticeText3:
	text "Les RAMOLOSS sont"
	line "de retour et tu as"
	cont "même retrouvé"
	cont "CANARTICHO."
	cont "T'es trop cool!"
	done

FarfetchdText:
	text "CANARTICHO: Ticho!"
	done

CharcoalKiln_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, AZALEA_TOWN, 2
	warp_event  3,  7, AZALEA_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  1,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  7,  1, BGEVENT_READ, CharcoalKilnRadio

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, EVENT_CHARCOAL_KILN_APPRENTICE
	object_event  5,  6, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchd, EVENT_CHARCOAL_KILN_FARFETCH_D
