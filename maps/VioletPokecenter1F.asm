	object_const_def
	const VIOLETPOKECENTER1F_NURSE
	const VIOLETPOKECENTER1F_GAMEBOY_KID
	const VIOLETPOKECENTER1F_GENTLEMAN
	const VIOLETPOKECENTER1F_YOUNGSTER
	const VIOLETPOKECENTER1F_ELMS_AIDE

VioletPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

VioletPokecenterNurse:
	jumpstd PokecenterNurseScript

VioletPokecenter1F_ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	iftrue .SecondTimeAsking
	writetext VioletPokecenterElmsAideFavorText
.AskTakeEgg:
	yesorno
	iffalse .RefusedEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, EGG_LEVEL
	getstring STRING_BUFFER_4, .eggname
	scall .AideGivesEgg
	setevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	clearevent EVENT_ELMS_AIDE_IN_LAB
	clearevent EVENT_TOGEPI_HATCHED
	setmapscene ROUTE_32, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	writetext VioletPokecenterElmsAideGiveEggText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .AideWalksAroundPlayer
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksStraightOutOfPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.AideWalksAroundPlayer:
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideWalksLeftToExitPokecenter
	turnobject PLAYER, DOWN
	applymovement VIOLETPOKECENTER1F_ELMS_AIDE, MovementData_AideFinishesLeavingPokecenter
	playsound SFX_EXIT_BUILDING
	disappear VIOLETPOKECENTER1F_ELMS_AIDE
	waitsfx
	end

.eggname
	db "OEUF@"

.AideGivesEgg:
	jumpstd ReceiveTogepiEggScript
	end

.PartyFull:
	writetext VioletCityElmsAideFullPartyText
	waitbutton
	closetext
	end

.RefusedEgg:
	writetext VioletPokecenterElmsAideRefuseText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_TAKE_EGG_FROM_ELMS_AIDE
	end

.SecondTimeAsking:
	writetext VioletPokecenterElmsAideAskEggText
	sjump .AskTakeEgg

VioletPokecenter1FGameboyKidScript:
	jumptextfaceplayer VioletPokecenter1FGameboyKidText

VioletPokecenter1FGentlemanScript:
	jumptextfaceplayer VioletPokecenter1FGentlemanText

VioletPokecenter1FYoungsterScript:
	jumptextfaceplayer VioletPokecenter1FYoungsterText

MovementData_AideWalksStraightOutOfPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_AideWalksLeftToExitPokecenter:
	step LEFT
	step DOWN
	step_end

MovementData_AideFinishesLeavingPokecenter:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletPokecenterElmsAideFavorText:
	text "<PLAY_G>!"
	line "Ca faisait long-"

	para "temps. Le PROF."
	line "ORME m'a demandé"
	cont "de te trouver."

	para "Il a encore un"
	line "service à te"
	cont "demander."

	para "Peux-tu prendre"
	line "l'OEUF #MON?"
	done

VioletPokecenterElmsAideGiveEggText:
	text "Nous avons décou-"
	line "vert qu'un #MON"

	para "ne peut naître qu'"
	line "en grandissant"
	cont "dans l'OEUF."

	para "Il doit aussi être"
	line "en compagnie de"
	cont "#MON actifs."

	para "<PLAY_G>, nous ne"
	line "pouvons que comp-"
	cont "ter sur toi."

	para "Appelle le PROF."
	line "ORME après son"
	cont "éclosion!"
	done

VioletCityElmsAideFullPartyText:
	text "Oh, flûte. Tu ne"
	line "peux plus avoir de"
	cont "#MON sur toi."

	para "Je t'attends ici"
	line "pendant que tu"
	cont "fais de la place"
	cont "pour l'OEUF."
	done

VioletPokecenterElmsAideRefuseText:
	text "M-Mais..."
	line "Le PROF.ORME te"
	cont "cherchait..."
	done

VioletPokecenterElmsAideAskEggText:
	text "<PLAY_G>, veux-tu"
	line "prendre l'OEUF?"
	done

VioletPokecenterFarawayLinkText: ; unreferenced
	text_start
	done

VioletPokecenterMobileAdapterText: ; unreferenced
	text_start
	done

VioletPokecenter1FGameboyKidText:
	text "Un type du nom de"
	line "LEO a créé le"
	cont "système de stocka-"
	cont "ge de #MON."
	done

VioletPokecenter1FGentlemanText:
	text "Ca fait plus ou"
	line "moins trois ans."

	para "La TEAM ROCKET"
	line "était la pire en-"
	cont "nemie des #MON."

	para "Mais y'a une"
	line "justice! Un jeune"
	cont "gamin les a depuis"
	cont "détrônés."
	done

VioletPokecenter1FYoungsterText:
	text "Les #MON"
	line "sont intelligents."

	para "Ils n'obéissent"
	line "pas aux dresseurs"
	cont "qui ne les res-"
	cont "pectent pas."

	para "Sans les BADGES"
	line "appropriés, ils"

	para "n'en feront qu'à"
	line "leur tête."
	done

VioletPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, VIOLET_CITY, 5
	warp_event  4,  7, VIOLET_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenterNurse, -1
	object_event  7,  6, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FGentlemanScript, -1
	object_event  8,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1FYoungsterScript, -1
	object_event  4,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletPokecenter1F_ElmsAideScript, EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
