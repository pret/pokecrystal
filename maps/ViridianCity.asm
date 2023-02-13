	object_const_def
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER

ViridianCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlypointCallback

ViridianCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	promptbutton
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd PokecenterSignScript

ViridianCityMartSign:
	jumpstd MartSignScript

ViridianCityCoffeeGrampsQuestionText:
	text "Hé, toi! Je"
	line "viens de m'enfiler"

	para "un double café et"
	line "j'ai la patate!"

	para "Faut qu'je parle à"
	line "quelqu'un alors..."
	cont "Ecoute-moi!"

	para "J'ai pas l'air"
	line "mais je suis un"

	para "expert en capture"
	line "de #MON."

	para "Tu me crois, hein?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "Tant mieux."
	line "J'étais un crack!"

	para "Un balèze! J'avais"
	line "la classe!"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "Quoi? Sale peste!"

	para "Si j'étais plus"
	line "jeune, j't'en"

	para "ferais baver, moi!"
	line "Oh que oui!"
	done

ViridianCityGrampsNearGymText:
	text "Cette ARENE vient"
	line "juste d'avoir un"
	cont "CHAMPION officiel."

	para "Un jeune homme de"
	line "PALETTE est devenu"

	para "le CHAMPION mais"
	line "il se balade"
	cont "beaucoup."
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "Vas-tu affronter"
	line "le CHAMPION?"

	para "Bonne chance."
	line "T'en auras besoin."
	done

ViridianCityDreamEaterFisherText:
	text "(baille)!"

	para "J'ai dormi sous"
	line "le soleil."

	para "...J'ai rêvé d'un"
	line "SOPORIFIK en train"

	para "de manger mes"
	line "songes. Bizarre!"

	para "Hein?"
	line "C'est quoi?"

	para "D'où vient cette"
	line "CT?"

	para "C'est louche!"
	line "Tiens, je te la"
	cont "donne."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "CT42 contient"
	line "DEVOREVE..."

	para "...Zzzzz..."
	done

ViridianCityYoungsterText:
	text "On dit qu'il y a"
	line "plein d'objets sur"

	para "le sol de la FORET"
	line "DE JADE."
	done

ViridianCitySignText:
	text "JADIELLE"

	para "Le paradis vert"
	line "éternel"
	done

ViridianGymSignText:
	text "CHAMPION d'ARENE"
	line "de JADIELLE:"
	cont "..."

	para "Le reste est"
	line "illisible..."
	done

ViridianCityWelcomeSignText:
	text "Bienvenue à"
	line "JADIELLE, la porte"

	para "vers le PLATEAU"
	line "INDIGO"
	done

TrainerHouseSignText:
	text "CLUB des DRESSEURS"

	para "Réservé aux"
	line "meilleurs"
	done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	def_object_events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
