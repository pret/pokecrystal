	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts
	scene_const SCENE_GOLDENRODPOKECENTER1F_GS_BALL

	def_callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1F_GSBallSceneLeft:
	setval BATTLETOWERACTION_CHECKMOBILEEVENT
	special BattleTowerAction
	ifequal MOBILE_EVENT_OBJECT_GS_BALL, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
	setval BATTLETOWERACTION_CHECKMOBILEEVENT
	special BattleTowerAction
	ifequal MOBILE_EVENT_OBJECT_GS_BALL, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokecomCenterWelcomeToTradeCornerText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterWeMustHoldYourMonText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterWhatMonDoYouWantText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterWeWillTradeYourMonForMonText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterWeWillTradeYourMonForNewText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterYourMonHasBeenReceivedText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterYouHaveOnlyOneMonText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterWeHopeToSeeYouAgainText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterCommunicationErrorText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterCantAcceptLastMonText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterCantAcceptEggText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterCantAcceptAbnormalMonText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterAlreadyHoldingMonText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterCheckingTheRoomsText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterTradePartnerHasBeenFoundText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterItsYourNewPartnerText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterYourPartyIsFullText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterNoTradePartnerFoundText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterReturnedYourMonText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterYourMonIsLonelyText: ; unreferenced
	text_start
	done

GoldenrodPokecenter1FWeHopeToSeeYouAgainText_2: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterContinueToHoldYourMonText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterRecentlyLeftYourMonText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterSaveBeforeTradeCornerText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterWhichMonToTradeText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterTradeCanceledText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterEggTicketText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterOddEggBriefingText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPleaseWaitAMomentText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterHereIsYourOddEggText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterNoEggTicketServiceText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterNewsMachineText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterWhatToDoText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterNewsMachineExplanationText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterWouldYouLikeTheNewsText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterReadingTheLatestNewsText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterNoOldNewsText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterCorruptedNewsDataText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterMakingPreparationsText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterSaveBeforeNewsMachineText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson1Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson2Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson3Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson4Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson5Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson6Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson7Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson8Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson9Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson10Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson11Text: ; unreferenced
	text_start
	done

GoldenrodPokecenter1FGameboyKidText:
	text "Le COLISEE sert"
	line "à faire des com-"
	cont "bats en Link."

	para "Les records sont"
	line "affichés sur le"
	cont "mur. Perdre, c'est"
	cont "la honte!"
	done

GoldenrodPokecomCenterPerson12Text: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterPerson13Text: ; unreferenced
	text_start
	done

GoldenrodPokecenter1FLassText:
	text "Un #MON de"
	line "niveau élevé ne"
	cont "gagnera pas à tous"
	cont "les coups."

	para "Après tout, il y a"
	line "peut-être un type"
	cont "désavantagé."

	para "Je ne crois pas"
	line "qu'il y ait un"

	para "type de #MON"
	line "qui soit le plus"
	cont "résistant."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "<PLAYER>?"

	para "Félicitations!"

	para "En cadeau spécial,"
	line "une GS BALL vous a"
	cont "été envoyée!"

	para "C'est pour vous!"
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "A très bientôt!"
	done

GoldenrodPokecomCenterSignText: ; unreferenced
	text_start
	done

GoldenrodPokecomCenterNewsMachineNotYetText: ; unreferenced
	text_start
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Ton SAC a l'air"
	line "siiiii lourd!"

	para "Oh! As-tu un truc"
	line "du nom de LETR"
	cont "EVOLI?"

	para "Ma fille en veut"
	line "une."

	para "Tu peux m'en"
	line "donner une?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "Donner LETR EVOLI?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Oh, formidable!"
	line "Merci merci!"
	cont "Voilà pour toi!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "Ma fille sera"
	line "ravie!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Oh? Tu n'en as"
	line "pas? Dommage."
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Oh... Une autre"
	line "fois, alors."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> donne"
	line "la LETR EVOLI."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events
	coord_event  3,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_GOLDENRODPOKECENTER1F_GS_BALL, GoldenrodPokecenter1F_GSBallSceneRight

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
