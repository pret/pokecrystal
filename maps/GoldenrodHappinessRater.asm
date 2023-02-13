	object_const_def
	const GOLDENRODHAPPINESSRATER_TEACHER
	const GOLDENRODHAPPINESSRATER_POKEFAN_M
	const GOLDENRODHAPPINESSRATER_TWIN

GoldenrodHappinessRater_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext GoldenrodHappinessRaterTeacherText
	promptbutton
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	sjump .LooksMean

.LovesYouALot:
	writetext GoldenrodHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext GoldenrodHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext GoldenrodHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext GoldenrodHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext GoldenrodHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext GoldenrodHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

GoldenrodHappinessRaterPokefanMScript:
	jumptextfaceplayer GoldenrodHappinessRaterPokefanMText

GoldenrodHappinessRaterTwinScript:
	jumptextfaceplayer GoldenrodHappinessRaterTwinText

HappinessRatersHouseBookshelf:
	jumpstd DifficultBookshelfScript

HappinessRatersHouseRadio:
	jumpstd Radio2Script

GoldenrodHappinessRaterTeacherText:
	text "Si tu traites tes"
	line "#MON avec"

	para "amour, ils te le"
	line "rendront bien."

	para "Oh? Montre-moi"
	line "ton @"
	text_ram wStringBuffer3
	text "."
	done

GoldenrodHappinessRatingText_LovesYouALot:
	text "Il a l'air très"
	line "content! Il doit"
	cont "t'aimer énormé-"
	cont "ment."
	done

GoldenrodHappinessRatingText_ReallyTrustsYou:
	text "J'ai le sentiment"
	line "qu'il te fait"
	cont "vraiment, vraiment"
	cont "confiance."
	done

GoldenrodHappinessRatingText_SortOfHappy:
	text "Tu es vraiment un"
	line "amour..."
	cont "Un nuage de"
	cont "bonne humeur et"
	cont "de gentillesse"
	cont "flotte au-dessus"
	cont "de toi."
	done

GoldenrodHappinessRatingText_QuiteCute:
	text "C'est trop chou."
	done

GoldenrodHappinessRatingText_NotUsedToYou:
	text "Tu devrais mieux"
	line "le traiter. C'est"
	cont "pour ton bien."
	done

GoldenrodHappinessRatingText_LooksMean:
	text "Il n'a pas l'air"
	line "de beaucoup"
	cont "t'aimer. Il a"
	cont "l'air triste."
	done

GoldenrodHappinessRaterPokefanMText:
	text "Je ne fais que"
	line "perdre les combats"

	para "avec mes #MON,"
	line "ils sont tout le"
	cont "temps K.O..."

	para "C'est peut-être"
	line "pour ça que mes"
	cont "#MON ne"
	cont "m'aiment pas trop!"
	done

GoldenrodHappinessRaterTwinText:
	text "Lorsque j'utilise"
	line "un objet sur mes"
	cont "#MON, ça"
	cont "fait des trucs"
	cont "cool!"
	done

GoldenrodHappinessRater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 3
	warp_event  3,  7, GOLDENROD_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, HappinessRatersHouseRadio

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTeacherScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterPokefanMScript, -1
	object_event  5,  6, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTwinScript, -1
