	object_const_def
	const KURTSHOUSE_KURT1
	const KURTSHOUSE_TWIN1
	const KURTSHOUSE_SLOWPOKE
	const KURTSHOUSE_KURT2
	const KURTSHOUSE_TWIN2

KurtsHouse_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, KurtsHouseKurtCallback

KurtsHouseKurtCallback:
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse .Done
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .Done
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue .MakingBalls
	disappear KURTSHOUSE_KURT2
	appear KURTSHOUSE_KURT1
	disappear KURTSHOUSE_TWIN2
	appear KURTSHOUSE_TWIN1
	endcallback

.MakingBalls:
	disappear KURTSHOUSE_KURT1
	appear KURTSHOUSE_KURT2
	disappear KURTSHOUSE_TWIN1
	appear KURTSHOUSE_TWIN2
.Done:
	endcallback

Kurt1:
	faceplayer
	opentext
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue .GotLureBall
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedSlowpokeWell
	writetext KurtsHouseKurtMakingBallsMustWaitText
	waitbutton
	closetext
	special FadeOutMusic
	setevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	readvar VAR_FACING
	ifequal UP, .RunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.RunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	waitsfx
	special RestartMapMusic
	end

.ClearedSlowpokeWell:
	writetext KurtsHouseKurtHonoredToMakeBallsText
	promptbutton
	verbosegiveitem LURE_BALL
	iffalse .NoRoomForBall
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
.GotLureBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .WaitForApricorns
	checkevent EVENT_GAVE_KURT_RED_APRICORN
	iftrue .GiveLevelBall
	checkevent EVENT_GAVE_KURT_BLU_APRICORN
	iftrue .GiveLureBall
	checkevent EVENT_GAVE_KURT_YLW_APRICORN
	iftrue .GiveMoonBall
	checkevent EVENT_GAVE_KURT_GRN_APRICORN
	iftrue .GiveFriendBall
	checkevent EVENT_GAVE_KURT_WHT_APRICORN
	iftrue .GiveFastBall
	checkevent EVENT_GAVE_KURT_BLK_APRICORN
	iftrue .GiveHeavyBall
	checkevent EVENT_GAVE_KURT_PNK_APRICORN
	iftrue .GiveLoveBall
	checkevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	iftrue .CanGiveGSBallToKurt
.NoGSBall:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .CheckApricorns
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .CheckApricorns
	writetext KurtsHouseKurtBallsFromApricornsText
	waitbutton
.CheckApricorns:
	checkitem RED_APRICORN
	iftrue .AskApricorn
	checkitem BLU_APRICORN
	iftrue .AskApricorn
	checkitem YLW_APRICORN
	iftrue .AskApricorn
	checkitem GRN_APRICORN
	iftrue .AskApricorn
	checkitem WHT_APRICORN
	iftrue .AskApricorn
	checkitem BLK_APRICORN
	iftrue .AskApricorn
	checkitem PNK_APRICORN
	iftrue .AskApricorn
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .IMakeBallsFromApricorns
	closetext
	end

.IMakeBallsFromApricorns:
	writetext KurtsHouseKurtBallsFromApricornsText
	waitbutton
	closetext
	end

.AskApricorn:
	writetext KurtsHouseKurtAskYouHaveAnApricornText
	promptbutton
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal BLU_APRICORN, .Blu
	ifequal YLW_APRICORN, .Ylw
	ifequal GRN_APRICORN, .Grn
	ifequal WHT_APRICORN, .Wht
	ifequal BLK_APRICORN, .Blk
	ifequal PNK_APRICORN, .Pnk
; .Red
	setevent EVENT_GAVE_KURT_RED_APRICORN
	sjump .GaveKurtApricorns

.Blu:
	setevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump .GaveKurtApricorns

.Ylw:
	setevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump .GaveKurtApricorns

.Grn:
	setevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump .GaveKurtApricorns

.Wht:
	setevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump .GaveKurtApricorns

.Blk:
	setevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump .GaveKurtApricorns

.Pnk:
	setevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setflag ENGINE_KURT_MAKING_BALLS
.WaitForApricorns:
	writetext KurtsHouseKurtItWillTakeADayText
	waitbutton
	closetext
	end

.Cancel:
	writetext KurtsHouseKurtThatsALetdownText
	waitbutton
	closetext
	end

._ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
.ThatTurnedOutGreat:
	writetext KurtsHouseKurtTurnedOutGreatText
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveLevelBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LEVEL_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_RED_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLureBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LURE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLU_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveMoonBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar MOON_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_YLW_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFriendBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FRIEND_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_GRN_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveFastBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar FAST_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_WHT_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveHeavyBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar HEAVY_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_BLK_APRICORN
	sjump ._ThatTurnedOutGreat

.GiveLoveBall:
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue KurtMakingBallsScript
	writetext KurtsHouseKurtJustFinishedYourBallText
	promptbutton
	verbosegiveitemvar LOVE_BALL, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PNK_APRICORN
	sjump ._ThatTurnedOutGreat

.CanGiveGSBallToKurt:
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue .GaveGSBallToKurt
	checkitem GS_BALL
	iffalse .NoGSBall
	writetext KurtsHouseKurtWhatIsThatText
	waitbutton
	closetext
	setevent EVENT_GAVE_GS_BALL_TO_KURT
	takeitem GS_BALL
	setflag ENGINE_KURT_MAKING_BALLS
	end

.GaveGSBallToKurt:
	checkflag ENGINE_KURT_MAKING_BALLS
	iffalse .NotMakingBalls
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	writetext KurtsHouseKurtAhHaISeeText
	waitbutton
	closetext
	end

.NotMakingBalls:
	writetext KurtsHouseKurtThisBallStartedToShakeText
	waitbutton
	closetext
	setevent EVENT_FOREST_IS_RESTLESS
	clearevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	clearevent EVENT_GAVE_GS_BALL_TO_KURT
	special FadeOutMusic
	pause 20
	showemote EMOTE_SHOCK, KURTSHOUSE_KURT1, 30
	readvar VAR_FACING
	ifequal UP, .GSBallRunAround
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtExitHouseMovement
	sjump .KurtHasLeftTheBuilding

.GSBallRunAround:
	turnobject PLAYER, DOWN
	playsound SFX_FLY
	applymovement KURTSHOUSE_KURT1, KurtsHouseKurtGoAroundPlayerThenExitHouseMovement
.KurtHasLeftTheBuilding:
	playsound SFX_EXIT_BUILDING
	disappear KURTSHOUSE_KURT1
	clearevent EVENT_AZALEA_TOWN_KURT
	waitsfx
	special RestartMapMusic
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL
	end

Kurt2:
	faceplayer
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue KurtScript_ImCheckingItNow
KurtMakingBallsScript:
	checkevent EVENT_BUGGING_KURT_TOO_MUCH
	iffalse Script_FirstTimeBuggingKurt
	writetext KurtsHouseKurtDontBotherMeText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, UP
	end

Script_FirstTimeBuggingKurt:
	writetext KurtsHouseKurtGranddaughterHelpingWorkFasterText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT2, UP
	setevent EVENT_BUGGING_KURT_TOO_MUCH
	end

KurtScript_ImCheckingItNow:
	writetext KurtsHouseKurtImCheckingItNowText
	waitbutton
	turnobject KURTSHOUSE_KURT2, UP
	writetext KurtsHouseKurtAhHaISeeText
	waitbutton
	closetext
	end

KurtsGranddaughter1:
	faceplayer
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue KurtsGranddaughter2Subscript
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue KurtsGranddaughterFunScript
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .Lonely
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .Dad
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SlowpokeBack
	checkevent EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	iftrue .Lonely
	opentext
	writetext KurtsGranddaughterSlowpokeGoneText
	waitbutton
	closetext
	end

.SlowpokeBack:
	opentext
	writetext KurtsGranddaughterSlowpokeBackText
	waitbutton
	closetext
	end

.Lonely:
	opentext
	writetext KurtsGranddaughterLonelyText
	waitbutton
	closetext
	end

.Dad:
	opentext
	writetext KurtsGranddaughterDadText
	waitbutton
	closetext
	end

KurtsGranddaughter2:
	faceplayer
KurtsGranddaughter2Subscript:
	opentext
	checkevent EVENT_GAVE_GS_BALL_TO_KURT
	iftrue .GSBall
	writetext KurtsGranddaughterHelpText
	waitbutton
	closetext
	turnobject KURTSHOUSE_TWIN2, RIGHT
	end

.GSBall:
	writetext KurtsGranddaughterGSBallText
	waitbutton
	closetext
	turnobject KURTSHOUSE_TWIN2, RIGHT
	end

KurtsGranddaughterFunScript:
	opentext
	writetext KurtsGranddaughterFunText
	waitbutton
	closetext
	end

KurtsHouseSlowpoke:
	faceplayer
	opentext
	writetext KurtsHouseSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseCelebiStatue:
	jumptext KurtsHouseCelebiStatueText

KurtsHouseBookshelf:
	jumpstd DifficultBookshelfScript

KurtsHouseRadio:
	jumpstd Radio2Script

KurtsHouseKurtExitHouseMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

KurtsHouseKurtGoAroundPlayerThenExitHouseMovement:
	big_step RIGHT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

KurtsHouseKurtMakingBallsMustWaitText:
	text "Hum? Qui es-tu?"

	para "<PLAYER>? Tu"
	line "voudrais que je"
	cont "fabrique quelques"
	cont "BALLS?"

	para "Désolé mais ça"
	line "devra attendre."

	para "Connais-tu la TEAM"
	line "ROCKET? Je vais"

	para "t'en toucher deux"
	line "mots."

	para "La TEAM ROCKET est"
	line "plus redoutée que"

	para "la peste! Ils"
	line "utilisent les"
	cont "#MON à des"
	cont "fins crapuleuses."

	para "Ils ont cessé d'o-"
	line "pérer il y a de ça"
	cont "trois ans."

	para "Mais ils sont de"
	line "retour et frappent"

	para "de plus belle en"
	line "coupant les"
	cont "QUEUERAMOLOS pour"
	cont "les revendre!"

	para "Je m'en vais donc"
	line "leur montrer de"
	cont "quel bois je me"
	cont "chauffe, moi!"

	para "Tenez bon les"
	line "petits RAMOLOSS!"
	cont "Le bon vieux"
	cont "FARGAS arrive à"
	cont "la rescousse!"
	done

KurtsHouseKurtHonoredToMakeBallsText:
	text "FARGAS: Salut,"
	line "<PLAYER>!"

	para "Tu as bien combat-"
	line "tu au PUITS!"

	para "J'apprécie ton"
	line "style!"

	para "Je serais honoré"
	line "que tu acceptes"
	cont "mes BALLS."

	para "C'est tout ce que"
	line "j'ai pour le"
	cont "moment, cadeau!"
	done

KurtsHouseKurtBallsFromApricornsText:
	text "FARGAS: Je fais"
	line "des BALLS à partir"
	cont "des NOIGRUMES."

	para "Décroches-en"
	line "des arbres et"
	cont "rapporte-les moi."

	para "Je fabriquerai"
	line "alors des BALLS."
	done

KurtsHouseKurtAskYouHaveAnApricornText:
	text "FARGAS: As-tu un"
	line "NOIGRUME pour moi?"

	para "Excellent! Je vais"
	line "en faire une BALL."
	done

KurtsHouseKurtItWillTakeADayText:
	text "FARGAS: Ca va"
	line "prendre la journée"

	para "pour te faire une"
	line "BALL. Reviens plus"
	cont "tard."
	done

KurtsHouseKurtThatsALetdownText:
	text "FARGAS: Oh,oh...!"
	line "Quel dommage."
	done

KurtsHouseKurtDontBotherMeText:
	text "FARGAS: Je bosse!"
	line "Qu'on me laisse"
	cont "tranquille!"
	done

KurtsHouseKurtJustFinishedYourBallText:
	text "FARGAS: Ah,"
	line "<PLAYER>! Je viens"
	cont "de finir ta BALL!"
	cont "Tiens!"
	done

KurtsHouseKurtTurnedOutGreatText:
	text "FARGAS: Je suis"
	line "content du résul-"
	cont "tat."

	para "Va attraper"
	line "des #MON!"
	done

KurtsHouseKurtGranddaughterHelpingWorkFasterText:
	text "FARGAS: Avec"
	line "l'aide de ma"

	para "petite-fille, je"
	line "travaille plus"
	cont "vite."
	done

KurtsHouseKurtWhatIsThatText:
	text "C'est quoi donc?"

	para "Je n'avais jamais"
	line "vu ça."

	para "On dirait bien une"
	line "# BALL, mais"

	para "ça doit être autre"
	line "chose."

	para "Je vais regarder"
	line "ça."
	done

KurtsHouseKurtImCheckingItNowText:
	text "Je fais mes"
	line "recherches."
	done

KurtsHouseKurtAhHaISeeText:
	text "Ah-ha! Je vois!"
	line "Donc..."
	done

KurtsHouseKurtThisBallStartedToShakeText:
	text "<PLAYER>!"

	para "La BALL s'est mise"
	line "à bouger quand je"
	cont "la regardais."

	para "Y'a du mystère"
	line "dans l'air!"
	done

KurtsGranddaughterSlowpokeGoneText:
	text "Les RAMOLOSS sont"
	line "partis... Ont-ils"

	para "été enlevés par de"
	line "vilains gredins?"
	done

KurtsGranddaughterLonelyText:
	text "Pépé a filé..."
	line "Je suis si seule!"
	done

KurtsGranddaughterSlowpokeBackText:
	text "Le RAMOLOSS que"
	line "mon pôpa m'a"

	para "donné est de"
	line "retour! Et sa"
	cont "QUEUE a repoussé!"
	done

KurtsGranddaughterDadText:
	text "Pôpa travaille à"
	line "la SYLPHE SARL où"
	cont "il étudie les"
	cont "# BALLS."

	para "Je dois rester à"
	line "la maison avec mon"
	cont "pépé et mon"
	cont "RAMOLOSS."
	done

KurtsGranddaughterHelpText:
	text "J'aide mon joli"
	line "petit pépé!"

	para "On va en faire des"
	line "belles BALLS pour"
	cont "ta fraise!"
	done

KurtsGranddaughterFunText:
	text "C'est rigolo de"
	line "faire des BALLS!"
	done

KurtsGranddaughterGSBallText:
	text "Pépé examine une"
	line "BALL."

	para "Alors moi..."
	line "J'attends."
	done

KurtsHouseSlowpokeText:
	text "RAMOLOSS: ...."
	line "...(baille)..."
	done

KurtsHouseOakPhotoText:
	text "...Un jeune PROF."
	line "CHEN?"
	done

KurtsHouseCelebiStatueText:
	text "C'est une statue"
	line "du protecteur de"
	cont "la forêt."
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, KurtsHouseRadio
	bg_event  8,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  9,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  4,  1, BGEVENT_READ, KurtsHouseCelebiStatue

	def_object_events
	object_event  3,  2, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt1, EVENT_KURTS_HOUSE_KURT_1
	object_event  5,  3, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter1, EVENT_KURTS_HOUSE_GRANDDAUGHTER_1
	object_event  6,  3, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsHouseSlowpoke, EVENT_KURTS_HOUSE_SLOWPOKE
	object_event 14,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Kurt2, EVENT_KURTS_HOUSE_KURT_2
	object_event 11,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsGranddaughter2, EVENT_KURTS_HOUSE_GRANDDAUGHTER_2
