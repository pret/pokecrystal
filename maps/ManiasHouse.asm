	object_const_def
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckle
	yesorno
	iffalse .refusetotakeshuckie
	special GiveShuckle
	iffalse .partyfull
	writetext ManiaText_TakeCareOfShuckle
	promptbutton
	waitsfx
	writetext ManiaText_GotShuckle
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_GOT_SHUCKIE
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfShuckle
	waitbutton
	closetext
	end

.partyfull
	writetext ManiaText_PartyFull
	waitbutton
	closetext
	end

.refusetotakeshuckie
	writetext ManiaText_IfHeComesBack
	waitbutton
	closetext
	end

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special ReturnShuckie
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .refused
	ifequal SHUCKIE_HAPPY, .superhappy
	ifequal SHUCKIE_FAINTED, .default_postevent
	; SHUCKIE_RETURNED
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	writetext ManiaText_ShuckleNotThere
	waitbutton
	closetext
	end

.superhappy
	writetext ManiaText_ShuckleLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	writetext ManiaText_SameAsBeingRobbed
	waitbutton
	closetext
	end

.nothingleft ; unreferenced
	writetext ManiaText_ShuckleIsYourLastMon
	waitbutton
	closetext
	end

.default_postevent
	writetext ManiaText_HappinessSpeech
	waitbutton
	closetext
	end

ManiasHouseUnusedBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

ManiaText_AskLookAfterShuckle:
	text "Je suis choqué!"

	para "Un garnement de"
	line "ton âge avec"

	para "l'oeil mauvais"
	line "et des cheveux"
	cont "longs, s'est in-"
	cont "filtré chez moi."

	para "Il m'a fait grand-"
	line "peur et chapardé"
	cont "mon #MON"
	cont "adoré!"

	para "Il m'en reste un"
	line "mais que faire"
	cont "s'il revient?"

	para "Tu as l'air"
	line "fort. Peux-tu"

	para "t'occuper de"
	line "mon #MON"
	cont "un petit moment?"
	done

ManiaText_TakeCareOfShuckle:
	text "Oh, bien le merci!"

	para "Prends-en bien"
	line "soin, pitié!"
	done

ManiaText_GotShuckle:
	text "<PLAYER> reçoit un"
	line "#MON."
	done

ManiaText_PartyFull:
	text "L'équipe #-"
	line "MON est pleine."
	done

ManiaText_IfHeComesBack:
	text "Oh, non... Que"
	line "vais-je faire"
	cont "s'il revient?"
	done

ManiaText_CanIHaveMyMonBack:
	text "Salut! Comment va"
	line "mon #MON?"

	para "Je pense être en"
	line "sécurité main-"
	cont "tenant, serait-il"
	cont "possible de le"
	cont "récupérer?"
	done

ManiaText_ThankYou:
	text "Merci mon petit!"
	done

ManiaText_ShuckleNotThere:
	text "Hé, tu n'as pas"
	line "mon #MON avec"
	cont "toi."
	done

ManiaText_ShuckleLikesYou:
	text "Mon #MON a"
	line "l'air de t'appré-"
	cont "cier."

	para "Très bien! Tu"
	line "peux le garder."

	para "Mais promets-moi"
	line "d'être sympa avec"
	cont "lui!"
	done

ManiaText_SameAsBeingRobbed:
	text "Oh, non de non..."
	line "C'est la même"
	cont "chose que de se"
	cont "faire voler."
	done

ManiaText_HappinessSpeech:
	text "Pour les #MON,"
	line "c'est le bonheur"

	para "d'être avec un"
	line "gentil dresseur."
	done

ManiaText_ShuckleIsYourLastMon:
	text "Si je reprends mon"
	line "#MON, avec quoi"

	para "vas-tu pouvoir"
	line "combattre?"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
