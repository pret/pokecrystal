DEF MAHOGANYTOWN_RAGECANDYBAR_PRICE EQU 300

	object_const_def
	const MAHOGANYTOWN_POKEFAN_M
	const MAHOGANYTOWN_GRAMPS
	const MAHOGANYTOWN_FISHER
	const MAHOGANYTOWN_LASS

MahoganyTown_MapScripts:
	def_scene_scripts
	scene_script MahoganyTownNoop1Scene, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR
	scene_script MahoganyTownNoop2Scene, SCENE_MAHOGANYTOWN_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, MahoganyTownFlypointCallback

MahoganyTownNoop1Scene:
	end

MahoganyTownNoop2Scene:
	end

MahoganyTownFlypointCallback:
	setflag ENGINE_FLYPOINT_MAHOGANY
	endcallback

MahoganyTownTryARageCandyBarScript:
	showemote EMOTE_SHOCK, MAHOGANYTOWN_POKEFAN_M, 15
	applymovement MAHOGANYTOWN_POKEFAN_M, MahoganyTownRageCandyBarMerchantBlocksYouMovement
	follow PLAYER, MAHOGANYTOWN_POKEFAN_M
	applymovement PLAYER, MahoganyTownPlayerStepLeftMovement
	stopfollow
	turnobject PLAYER, RIGHT
	scall RageCandyBarMerchantScript
	applymovement MAHOGANYTOWN_POKEFAN_M, MahoganyTownRageCandyBarMerchantReturnsMovement
	end

MahoganyTownPokefanMScript:
	faceplayer
RageCandyBarMerchantScript:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	scall .SellRageCandyBars
	end

.ClearedRocketHideout:
	opentext
	writetext RageCandyBarMerchantSoldOutText
	waitbutton
	closetext
	end

.SellRageCandyBars:
	opentext
	writetext RageCandyBarMerchantTryOneText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, MAHOGANYTOWN_RAGECANDYBAR_PRICE
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NoRoom
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, MAHOGANYTOWN_RAGECANDYBAR_PRICE
	special PlaceMoneyTopRight
	writetext RageCandyBarMerchantSavorItText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext RageCandyBarMerchantNotEnoughMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext RageCandyBarMerchantRefusedText
	waitbutton
	closetext
	end

.NoRoom:
	writetext RageCandyBarMerchantNoRoomText
	waitbutton
	closetext
	end

MahoganyTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext MahoganyTownGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MahoganyTownGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

MahoganyTownFisherScript:
	jumptextfaceplayer MahoganyTownFisherText

MahoganyTownLassScript:
	jumptextfaceplayer MahoganyTownLassText

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyTownRagecandybarSign:
	jumptext MahoganyTownRagecandybarSignText

MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokecenterSign:
	jumpstd PokecenterSignScript

MahoganyTownCollideDownFaceLeftMovement: ; unreferenced
	step DOWN
	big_step UP
	turn_head DOWN
MahoganyTownPlayerStepLeftMovement:
	step LEFT
	step_end

MahoganyTownRageCandyBarMerchantBlocksYouMovement:
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end

MahoganyTownRageCandyBarMerchantReturnsMovement:
	step UP
	turn_head DOWN
	step_end

RageCandyBarMerchantTryOneText:
	text "Salut toi!"

	para "T'es pas d'ACAJOU,"
	line "toi."

	para "Alors tu DOIS"
	line "essayer le BONBON"
	cont "RAGE!"

	para "300¥ et c'est à"
	line "toi! OK?"
	done

RageCandyBarMerchantSavorItText:
	text "Bieeen! Goûte-le!"
	done

RageCandyBarMerchantNotEnoughMoneyText:
	text "Tu n'as pas assez"
	line "d'argent."
	done

RageCandyBarMerchantRefusedText:
	text "Oh, très bien..."
	done

RageCandyBarMerchantNoRoomText:
	text "Et non, y'a plus"
	line "de place!"
	done

RageCandyBarMerchantSoldOutText:
	text "Rupture de stock"
	line "de BONBON RAGE."

	para "Je fais mes"
	line "valises, alors du"
	cont "balai!"
	done

MahoganyTownGrampsText:
	text "Sors-tu pour voir"
	line "le LEVIATOR"
	cont "déchaîné au LAC?"
	done

MahoganyTownGrampsText_ClearedRocketHideout:
	text "Des MAGICARPE sont"
	line "revenus au LAC"
	cont "COLERE."

	para "Ca devrait faire"
	line "plaisir aux"
	cont "pêcheurs du coin."
	done

MahoganyTownFisherText:
	text "Si tu as fait tout"
	line "ce chemin, prends"

	para "donc le temps de"
	line "faire du tourisme."

	para "Tu devrais aller"
	line "au Nord et voir"
	cont "le LAC COLERE."
	done

MahoganyTownLassText:
	text "Va voir la"
	line "boutique de mémé."

	para "Elle vend des"
	line "trucs incroyables."
	done

MahoganyTownSignText:
	text "ACAJOU"

	para "Bienvenue chez"
	line "le grand ninja"
	done

MahoganyTownRagecandybarSignText:
	text "Pendant votre"
	line "visite d'ACAJOU,"
	cont "essayez un BONBON"
	cont "RAGE!"
	done

MahoganyGymSignText:
	text "CHAMPION d'ARENE"
	line "d'ACAJOU: FREDO"

	para "Le prof. qui"
	line "venait du froid"
	done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	def_coord_events
	coord_event 19,  8, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR, MahoganyTownTryARageCandyBarScript
	coord_event 19,  9, SCENE_MAHOGANYTOWN_TRY_RAGECANDYBAR, MahoganyTownTryARageCandyBarScript

	def_bg_events
	bg_event  1,  5, BGEVENT_READ, MahoganyTownSign
	bg_event  9,  7, BGEVENT_READ, MahoganyTownRagecandybarSign
	bg_event  3, 13, BGEVENT_READ, MahoganyGymSign
	bg_event 16, 13, BGEVENT_READ, MahoganyTownPokecenterSign

	def_object_events
	object_event 19,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownPokefanMScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	object_event  6,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  6, 14, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownFisherScript, EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM
	object_event 12,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownLassScript, EVENT_MAHOGANY_MART_OWNERS
