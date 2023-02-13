	object_const_def
	const ROUTE35GOLDENRODGATE_RANDY
	const ROUTE35GOLDENRODGATE_POKEFAN_F
	const ROUTE35GOLDENRODGATE_FISHER

Route35GoldenrodGate_MapScripts:
	def_scene_scripts

	def_callbacks

RandyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftrue .gothpup
	checkevent EVENT_GAVE_KENYA
	iftrue .questcomplete
	checkevent EVENT_GOT_KENYA
	iftrue .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalse .refused
	writetext Route35GoldenrodGateRandyThanksText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke SPEAROW, 10, NO_ITEM, GiftSpearowName, GiftSpearowOTName
	givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	writetext Route35GoldenrodGateRandyWeirdTreeBlockingRoadText
	waitbutton
	closetext
	end

.partyfull
	writetext Route35GoldenrodGateRandyCantCarryAnotherMonText
	waitbutton
	closetext
	end

.refused
	writetext Route35GoldenrodGateRandyOhNeverMindThenText
	waitbutton
	closetext
	end

.questcomplete
	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
	promptbutton
	verbosegiveitem HP_UP
	iffalse .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
	waitbutton
.bagfull
	closetext
	end

GiftSpearowMail:
	db FLOWER_MAIL
	db   "ANTRE NOIRE    "
	next "mène autre part@"

GiftSpearowName:
	db "ALFRED@"

GiftSpearowOTName:
	db "BOBBY@"

	db 0 ; unused

UnusedEFText: ; unreferenced
	db " EF@"

	db 0 ; unused

Route35GoldenrodGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText
	waitbutton
	closetext
	end

.FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText_FoughtSudowoodo
	waitbutton
	closetext
	end

Route35GoldenrodGateFisherScript:
	jumptextfaceplayer Route35GoldenrodGateFisherText

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "Minute papillon!"
	line "Tu peux me rendre"
	cont "service?"

	para "Tu peux apporter"
	line "ce #MON et sa"
	cont "LETTRE à mon pote?"

	para "Il est sur la"
	line "ROUTE 31."
	done

Route35GoldenrodGateRandyThanksText:
	text "Tu veux bien?"
	line "Merci!"

	para "Mon pote est gras"
	line "et il pionce tout"
	cont "le temps."

	para "Tu vas le recon-"
	line "naître, c'est sûr!"
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> reçoit"
	line "un #MON avec"
	cont "une LETTRE."
	done

Route35GoldenrodGateRandyWeirdTreeBlockingRoadText:
	text "Tu peux la lire"
	line "mais ne la perds"
	cont "pas, OK? Et sou-"
	cont "viens-toi: la"
	cont "ROUTE 31!"

	para "Au fait, il y a un"
	line "arbre bizarre qui"
	cont "bloque le chemin."

	para "Il est parti, tu"
	line "crois?"
	done

Route35GoldenrodGateRandyCantCarryAnotherMonText:
	text "Tu ne peux plus"
	line "porter de #MON!"
	done

Route35GoldenrodGateRandyOhNeverMindThenText:
	text "Bon. Laisse tomber"
	line "alors..."
	done

Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "Merci bien! Tu"
	line "as bien fait la"
	cont "livraison!"

	para "Voilà pour toi!"
	done

Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "Mon pote pionce"
	line "comme un fou, non?"
	cont "Quelle classe!"
	done

Route35GoldenrodGatePokefanFText:
	text "Un arbre bizarre"
	line "bloque le chemin."

	para "Il gigote si on"
	line "s'en approche."

	para "Il paraît qu'il"
	line "devient dingue si"

	para "on l'asperge avec"
	line "une CARAPUCE A O."
	done

Route35GoldenrodGatePokefanFText_FoughtSudowoodo:
	text "J'aime la berceuse"
	line "#MON qui passe"
	cont "à la radio."
	done

Route35GoldenrodGateFisherText:
	text "Je me demande"
	line "combien de types"

	para "de #MON il y a"
	line "dans le monde."

	para "Il y a trois ans,"
	line "le PROF.CHEN"

	para "disait qu'il y"
	line "avait 150 types"
	cont "différents."
	done

Route35GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGateFisherScript, -1
