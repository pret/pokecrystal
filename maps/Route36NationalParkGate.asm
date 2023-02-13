	object_const_def
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_ROCKER
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER4
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_YOUNGSTER5
	const ROUTE36NATIONALPARKGATE_YOUNGSTER6
	const ROUTE36NATIONALPARKGATE_YOUNGSTER7
	const ROUTE36NATIONALPARKGATE_OFFICER2

Route36NationalParkGate_MapScripts:
	def_scene_scripts
	scene_script Route36NationalParkGateNoop1Scene,             SCENE_ROUTE36NATIONALPARKGATE_NOOP
	scene_script Route36NationalParkGateNoop2Scene,             SCENE_ROUTE36NATIONALPARKGATE_UNUSED
	scene_script Route36NationalParkGateLeaveContestEarlyScene, SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route36NationalParkGateCheckIfContestRunningCallback
	callback MAPCALLBACK_OBJECTS, Route36NationalParkGateCheckIfContestAvailableCallback

Route36NationalParkGateNoop1Scene:
	end

Route36NationalParkGateNoop2Scene:
	end

Route36NationalParkGateLeaveContestEarlyScene:
	sdefer Route36NationalParkGateLeavingContestEarlyScript
	end

Route36NationalParkGateCheckIfContestRunningCallback:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOOP
	endcallback

.BugContestIsRunning:
	setscene SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	endcallback

Route36NationalParkGateCheckIfContestAvailableCallback:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftrue .Return
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	endcallback

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	endcallback

Route36NationalParkGateLeavingContestEarlyScript:
	turnobject PLAYER, UP
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route36NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route36NationalParkGateOfficer1WaitHereForAnnouncementText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, Route36NationalParkGatePlayerWaitWithContestantsMovement
	pause 15
	special FadeInQuickly
	jumpstd BugContestResultsScript

.GoBackToContest:
	writetext Route36NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear ROUTE36NATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	scall Route36ParkGate_DayToText
	writetext Route36NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse .DecidedNotToJoinContest
	readvar VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route36NationalParkGateOfficer1GiveParkBallsText
	promptbutton
	waitsfx
	writetext Route36NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route36NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.LeaveMonsWithOfficer:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext Route36NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route36NationalParkGateOfficer1WellHoldYourMonText
	promptbutton
	writetext Route36NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	promptbutton
	sjump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext Route36NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext Route36NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext Route36NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

.BoxFull:
	writetext Route36NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext Route36NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext Route36NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

.Sunstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem SUN_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	closetext
	end

.Everstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	promptbutton
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext Route36NationalParkGateOfficer1WellHoldPrizeText
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

Route36NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	writetext Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText
	waitbutton
	closetext
	end

Route36ParkGate_DayToText:
	jumpstd DayToTextScript
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant1BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant1BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant2BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant2BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant3BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant3BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant4BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant4BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant5BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant5BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant6BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant6BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant7BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant7BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant8BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant8BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant9BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant9BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant10BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant10BStillCompetingText
	waitbutton
	closetext
	end

Route36NationalParkGateBugCatchingContestExplanationSign:
	jumptext Route36NationalParkGateBugCatchingContestExplanationText

Route36NationalParkGatePlayerWaitWithContestantsMovement:
	big_step DOWN
	big_step RIGHT
	turn_head UP
	step_end

Route36NationalParkGateOfficer1AskToParticipateText:
	text "On est @"
	text_ram wStringBuffer3
	text "."
	line "Ca veut dire que"

	para "le Concours de"
	line "Capture d'insecte"
	cont "est aujourd'hui."

	para "Les règles sont"
	line "simples."

	para "Avec un #MON"
	line "de l'équipe, il"

	para "faut attraper un"
	line "#MON insecte"
	cont "qui sera noté."

	para "Alors? On tente"
	line "sa chance?"
	done

Route36NationalParkGateOfficer1GiveParkBallsText:
	text "Voici des PARC"
	line "BALLS pour le"
	cont "concours."
	done

Route36NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> reçoit"
	line "{d:BUG_CONTEST_BALLS} PARC BALLS."
	done

Route36NationalParkGateOfficer1ExplainsRulesText:
	text "La personne qui"
	line "capture le #-"
	cont "MON insecte le"
	cont "plus puissant est"
	cont "désignée vain-"
	cont "queur."

	para "La partie dure"
	line "{d:BUG_CONTEST_MINUTES} minutes."

	para "Si toutes les"
	line "PARC BALLS sont"
	cont "épuisées, c'est"
	cont "fini!"

	para "Le dernier #MON"
	line "attrapé peut être"
	cont "gardé."

	para "Allez hop! C'est"
	line "la chasse aux"
	cont "#MON insecte!"
	done

Route36NationalParkGateOfficer1AskToUseFirstMonText:
	text "Oh-oh..."

	para "Tu as plus d'un"
	line "#MON."

	para "Tu dois utiliser"
	line "@"
	text_ram wStringBuffer3
	text ", le"

	para "premier #MON de"
	line "ton équipe."

	para "Tu es d'accord?"
	done

Route36NationalParkGateOfficer1WellHoldYourMonText:
	text "Parfait. Je vais"
	line "garder les autres"
	cont "#MON pendant le"
	cont "concours."
	done

Route36NationalParkGatePlayersMonLeftWithHelperText:
	text "<PLAYER> confie"
	line "ses #MON au"
	cont "RECEPTIONNISTE."
	done

Route36NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Choisis le #MON"
	line "à utiliser pendant"

	para "le concours et"
	line "viens me voir."
	done

Route36NationalParkGateOfficer1TakePartInFutureText:
	text "OK."
	line "A la prochaine."
	done

Route36NationalParkGateOfficer1FirstMonCantBattleText:
	text "Oh-oh..."
	line "Le premier #MON"

	para "de ton équipe ne"
	line "peut combattre."

	para "Change-le avec le"
	line "#MON de ton"

	para "choix et reviens"
	line "me voir."
	done

Route36NationalParkGateOfficer1MakeRoomText:
	text "Oh-oh... Ton"
	line "équipe et ta BOITE"
	cont "PC sont pleines."

	para "Tu n'as pas de"
	line "place pour le"
	cont "#MON insecte"
	cont "à attraper."

	para "Fais de la place"
	line "dans l'équipe ou"

	para "dans la BOITE PC"
	line "et viens me voir."
	done

Route36NationalParkGateOfficer1EggAsFirstMonText:
	text "Oh-oh... Tu as un"
	line "OEUF en premier"
	cont "dans ton équipe."

	para "Change-le avec le"
	line "#MON de ton"

	para "choix et reviens"
	line "me voir."
	done

Route36NationalParkGateOfficer1WantToFinishText:
	text "Tu as encore @"
	text_ram wStringBuffer3
	text_start
	line "Minute(s)."

	para "Veux-tu t'arrêter"
	line "maintenant?"
	done

Route36NationalParkGateOfficer1WaitHereForAnnouncementText:
	text "OK. Attends ici"
	line "pour connaître"

	para "le nom des"
	line "vainqueurs."
	done

Route36NationalParkGateOfficer1OkGoFinishText:
	text "OK. Retourne de-"
	line "hors et termine."
	done

Route36NationalParkGateOfficer1ContestIsOverText:
	text "Le concours d'au-"
	line "jourd'hui est ter-"

	para "miné. Reviens une"
	line "autre fois."
	done

Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText:
	text "Certains #MON"
	line "n'apparaissent que"
	cont "dans le PARC."
	done

BugCatchingContestant1BText:
	text "JEAN-RAOUL: Oh! Tu"
	line "m'as battu! T'es"
	cont "balèze, toi."
	done

BugCatchingContestant1BStillCompetingText:
	text "JEAN-RAOUL:"
	line "La chance compte"
	cont "beaucoup."

	para "Tu ne sais jamais"
	line "quel #MON va"
	cont "apparaître."
	done

BugCatchingContestant2BText:
	text "ODILON: T'as trop"
	line "de bol. Et moi"
	cont "j'suis maudit."
	done

BugCatchingContestant2BStillCompetingText:
	text "ODILON: T'as gagné"
	line "avec un gros #-"
	cont "MON?"
	done

BugCatchingContestant3BText:
	text "NICK: Bien joué!"
	line "Je vais mieux en-"
	cont "traîner mes #-"
	cont "MON."
	done

BugCatchingContestant3BStillCompetingText:
	text "NICK: On gagne"
	line "peut-être plus de"

	para "points avec un"
	line "#MON d'une"
	cont "couleur bizarre."
	done

BugCatchingContestant4BText:
	text "MARCEL: Tu as"
	line "gagné? Qu'as-tu"
	cont "attrapé?"
	done

BugCatchingContestant4BStillCompetingText:
	text "MARCEL: En tout"
	line "cas je suis"

	para "content: j'ai"
	line "attrapé le #MON"
	cont "que je voulais."
	done

BugCatchingContestant5BText:
	text "FOULQUE: Bien!"
	line "J'te respecte,"
	cont "toi!"
	done

BugCatchingContestant5BStillCompetingText:
	text "FOULQUE: J'ai eu"
	line "un INSECATEUR une"
	cont "fois mais j'ai"
	cont "perdu."
	done

BugCatchingContestant6BText:
	text "RENE: Le #MON"
	line "que tu as chopé..."
	cont "Il est bien!"
	done

BugCatchingContestant6BStillCompetingText:
	text "RENE: C'est plus"
	line "facile de gagner"

	para "en attrapant un"
	line "#MON de haut"
	cont "niveau."

	para "Mais je crois qu'"
	line "ils prennent d'au-"
	cont "tres points en"
	cont "compte."
	done

BugCatchingContestant7BText:
	text "SANDY: T'as gagné?"
	line "Mais c'est cool!"

	para "Tu veux chercher"
	line "des #MON"
	cont "insecte avec moi?"
	done

BugCatchingContestant7BStillCompetingText:
	text "SANDY: Moi j'aime"
	line "les #MON"
	cont "insecte!"
	done

BugCatchingContestant8BText:
	text "ARNAUD: J'ai..."
	line "Perdu...au..."
	cont "Concours..."
	done

BugCatchingContestant8BStillCompetingText:
	text "ARNAUD: On dit que"
	line "quelqu'un a gagné"
	cont "avec un CHENIPAN!"
	done

BugCatchingContestant9BText:
	text "GONTRAND: Je vais"
	line "gagner la prochai-"
	cont "ne fois."
	done

BugCatchingContestant9BStillCompetingText:
	text "GONTRAND: Zut!"
	line "Je pensais vrai-"
	cont "ment gagner..."
	done

BugCatchingContestant10BText:
	text "CYRIL: Tu veux"
	line "bien me donner"

	para "des conseils?"
	line "J'aime ton style."
	done

BugCatchingContestant10BStillCompetingText:
	text "CYRIL: J'étudie"
	line "beaucoup mais ce"
	cont "n'est pas assez."
	done

UnusedSilphScope2Text: ; unreferenced
; This text is referring to Sudowoodo.
; The SILPHSCOPE2 was later reworked into the SQUIRTBOTTLE.
	text "On dit qu'il y a"
	line "un #MON qui"
	cont "ressemble à un"
	cont "arbre."

	para "On peut l'identi-"
	line "fier en utilisant"
	cont "un SCOPE SYLPHE 2."
	done

Route36NationalParkGateBugCatchingContestExplanationText:
	text "Le Concours de"
	line "Capture se déroule"

	para "le mardi, le jeudi"
	line "et le samedi."

	para "On peut y gagner"
	line "un prix rien qu'en"

	para "participant mais"
	line "on garde aussi le"

	para "#MON insecte"
	line "que l'on chope"

	para "pendant le con-"
	line "cours."
	done

Route36NationalParkGateOfficer1WellHoldPrizeText:
	text "Oh-oh... Ton SAC"
	line "est plein."

	para "On va garder ton"
	line "prix. Mais juste"
	cont "pour aujourd'hui."

	para "Fais de la place"
	line "et viens me voir."
	done

Route36NationalParkGateOfficer1HeresThePrizeText:
	text "<PLAYER>?"

	para "Voilà ton prix."
	line "On l'a gardé pour"
	cont "toi."
	done

Route36NationalParkGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	def_coord_events

	def_bg_events
	bg_event  6,  0, BGEVENT_READ, Route36NationalParkGateBugCatchingContestExplanationSign

	def_object_events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36NationalParkGateOfficerScript, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
