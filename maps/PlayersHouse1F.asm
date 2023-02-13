	object_const_def
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FNoop1Scene, SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_script PlayersHouse1FNoop2Scene, SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

PlayersHouse1FNoop1Scene:
	end

PlayersHouse1FNoop2Scene:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	writetext ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

PokegearName:
	db "#MATOS@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_PLAYERSHOUSE1F_MEET_MOM
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	promptbutton
	sjump .Main

.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "Ah, <PLAYER>...!"
	line "Notre voisin, le"

	para "PROF.ORME, te"
	line "cherchait."

	para "Il voulait que"
	line "tu fasses quelque"
	cont "chose pour lui."

	para "Oh! J'allais"
	line "oublier! Ton"

	para "MATOS #MON est"
	line "revenu de chez le"
	cont "réparateur."

	para "Tiens!"
	done

MomGivesPokegearText:
	text "Le MATOS #MON,"
	line "ou simplement"
	cont "#MATOS..."

	para "...est primordial"
	line "si tu veux devenir"
	cont "dresseur."

	para "Oh! Le jour de la"
	line "semaine n'est pas"
	cont "paramétré."

	para "N'oublie pas ça!"
	done

IsItDSTText:
	text "Changement d'heure"
	line "à activer?"
	done

ComeHomeForDSTText:
	text "Reviens à la"
	line "maison pour le"

	para "changement"
	line "d'heure."

	para "Par ailleurs,"
	line "sais-tu comment"
	cont "utiliser le"
	cont "TELEPHONE?"
	done

KnowTheInstructionsText:
	text "As-tu allumé le"
	line "#MATOS et"

	para "sélectionné"
	line "l'icône TELEPHONE?"
	done

DontKnowTheInstructionsText:
	text "Je vais lire le"
	line "manuel."

	para "Allume le"
	line "#MATOS et"
	cont "sélectionne"
	cont "l'icône TELEPHONE."
	done

InstructionsNextText:
	text "Les numéros de"
	line "téléphone sont"

	para "enregistrés dans"
	line "la mémoire."
	cont "Choisis le nom de"
	cont "celui que tu veux"
	cont "appeler."

	para "C'est pas trop"
	line "compliqué, non?"
	done

HurryUpElmIsWaitingText:
	text "Le PROF.ORME"
	line "t'attend."

	para "Dépêche-toi, mon"
	line "poussin!"
	done

SoWhatWasProfElmsErrandText:
	text "Alors, quelle"
	line "était la commis-"
	cont "sion du PROF.ORME?"

	para "..."

	para "Ca a l'air"
	line "difficile."

	para "Mais c'est impor-"
	line "tant que l'on te"
	cont "fasse confiance."
	done

ImBehindYouText:
	text "<PLAYER>, courage!"

	para "Je suis avec toi!"
	done

NeighborMornIntroText:
	text "Bonjour,"
	line "<PLAY_G>!"

	para "Je suis de"
	line "passage!"
	done

NeighborDayIntroText:
	text "Bonjour,"
	line "<PLAY_G>!"

	para "Je suis de"
	line "passage!"
	done

NeighborNiteIntroText:
	text "Bonjour,"
	line "<PLAY_G>!"

	para "Je suis de"
	line "passage!"
	done

NeighborText:
	text "<PLAY_G>, es-tu"
	line "au courant?"

	para "Ma fille veut"
	line "devenir l'assis-"

	para "tante du PROF."
	line "ORME."

	para "Elle adoooore les"
	line "#MON!"
	done

PlayersHouse1FStoveText:
	text "La spécialité de"
	line "Maman!"

	para "Un bon BURGER"
	line "style CRAMOIS'ILE!"
	done

PlayersHouse1FSinkText:
	text "L'évier est nickel"
	line "de chez nickel."
	cont "Maman est assez"
	cont "maniaque."
	done

PlayersHouse1FFridgeText:
	text "Voyons voir ce"
	line "qui se trame"
	cont "dans le frigo..."

	para "De l'EAU FRAICHE"
	line "et de la bonne"
	cont "LIMONADE!"
	done

PlayersHouse1FTVText:
	text "Un film à la TV:"
	line "On Se Calme Et On"

	para "Boit Frais à"
	line "Saint-Tropez..."

	para "Ca a l'air trop"
	line "fort!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event  8,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomLeftScript
	coord_event  9,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomRightScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
