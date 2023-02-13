	object_const_def
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU

LakeOfRageMagikarpHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setval MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	promptbutton
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign: ; unreferenced
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd DifficultBookshelfScript

MagikarpLengthRaterText_LakeOfRageHistory:
	text "Le LAC COLERE est"
	line "en fait un cratère"

	para "créé par le"
	line "déchaînement des"
	cont "LEVIATOR."

	para "Le cratère s'est"
	line "peu à peu rempli"

	para "d'eau de pluie et"
	line "un LAC s'est"
	cont "formé."

	para "Cette histoire se"
	line "transmet de géné-"

	para "ration en géné-"
	line "ration. Elle vient"
	cont "d'un de mes"
	cont "grands-pères."

	para "On pouvait attra-"
	line "per de vrais"

	para "MAGICARPE en"
	line "pleine forme ici!"

	para "Je ne comprends"
	line "pas ce qu'il se"
	cont "passe."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Ce LAC n'est plus"
	line "normal depuis"

	para "l'arrivée des"
	line "hommes en noir."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Le LAC COLERE est"
	line "redevenu normal."

	para "Les MAGICARPE sont"
	line "de retour."

	para "Mon rêve se"
	line "réalise enfin:"
	cont "voir un monde"
	cont "plein de"
	cont "MAGICARPE."

	para "As-tu une CANNE?"
	line "Aide-moi si tu en"
	cont "as une."
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, tu as un"
	line "MAGICARPE! Laisse-"

	para "moi voir sa"
	line "taille."
	done

MagikarpLengthRaterText_Memento:
	text "Whaou! Celui-ci"
	line "est démesuré!"

	para "Je te tire mon"
	line "chapeau!"

	para "Accepte ceci en"
	line "récompense!"
	done

MagikarpLengthRaterText_Bonus:
	text "Ce qui est impor-"
	line "tant, c'est d'épa-"

	para "ter les autres!"
	line "Suis mes conseils!"
	done

MagikarpLengthRaterText_TooShort:
	text "Whaou! C'est pas"
	line "mal du tout!"

	para "...J'aimerais pou-"
	line "voir te dire ça"

	para "mais j'en ai déjà"
	line "vu des plus gros."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Quoi? Ce n'est pas"
	line "un MAGICARPE!"
	done

MagikarpLengthRaterText_Refused:
	text "Alors... Tu n'as"
	line "rien pris qui"

	para "vaille la peine"
	line "d'être montré?"
	cont "Peut-être la"
	cont "prochaine fois!"
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "RECORD ACTUEL"

	para "@"
	text_ram wStringBuffer3
	text_start
	line "a été attrapé par"
	cont "@"
	text_ram wStringBuffer4
	text_end

LakeOfRageMagikarpHouseUnusedDummyText: ; unreferenced
	text_end

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
