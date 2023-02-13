	object_const_def
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_RIVAL
	const CHERRYGROVECITY_TEACHER
	const CHERRYGROVECITY_YOUNGSTER
	const CHERRYGROVECITY_FISHER

CherrygroveCity_MapScripts:
	def_scene_scripts
	scene_script CherrygroveCityNoop1Scene, SCENE_CHERRYGROVECITY_NOOP
	scene_script CherrygroveCityNoop2Scene, SCENE_CHERRYGROVECITY_MEET_RIVAL

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CherrygroveCityFlypointCallback

CherrygroveCityNoop1Scene:
	end

CherrygroveCityNoop2Scene:
	end

CherrygroveCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	endcallback

CherrygroveCityGuideGent:
	faceplayer
	opentext
	writetext GuideGentIntroText
	yesorno
	iffalse .No
	sjump .Yes
.Yes:
	writetext GuideGentTourText1
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow CHERRYGROVECITY_GRAMPS, PLAYER
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement1
	opentext
	writetext GuideGentPokecenterText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement2
	turnobject PLAYER, UP
	opentext
	writetext GuideGentMartText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement3
	turnobject PLAYER, UP
	opentext
	writetext GuideGentRoute30Text
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement4
	turnobject PLAYER, LEFT
	opentext
	writetext GuideGentSeaText
	waitbutton
	closetext
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement5
	turnobject PLAYER, UP
	pause 60
	turnobject CHERRYGROVECITY_GRAMPS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GuideGentGiftText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .JumpstdReceiveItem
	setflag ENGINE_MAP_CARD
	writetext GotMapCardText
	promptbutton
	writetext GuideGentPokegearText
	waitbutton
	closetext
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	applymovement CHERRYGROVECITY_GRAMPS, GuideGentMovement6
	playsound SFX_ENTER_DOOR
	disappear CHERRYGROVECITY_GRAMPS
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	waitsfx
	end

.JumpstdReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "CPN CARTE@"

.No:
	writetext GuideGentNoText
	waitbutton
	closetext
	end

CherrygroveRivalSceneSouth:
	moveobject CHERRYGROVECITY_RIVAL, 39, 7
CherrygroveRivalSceneNorth:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear CHERRYGROVECITY_RIVAL
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalWalksToYou
	turnobject PLAYER, RIGHT
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext CherrygroveRivalText_Seen
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_TOTODILE
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Totodile:
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_CHIKORITA
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.Chikorita:
	winlosstext RivalCherrygroveWinText, RivalCherrygroveLossText
	setlasttalked CHERRYGROVECITY_RIVAL
	loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmap
	iftrue .AfterVictorious
	sjump .AfterYourDefeat

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouWon
	waitbutton
	closetext
	sjump .FinishRival

.AfterYourDefeat:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext CherrygroveRivalText_YouLost
	waitbutton
	closetext
.FinishRival:
	playsound SFX_TACKLE
	applymovement PLAYER, CherrygroveCity_RivalPushesYouOutOfTheWay
	turnobject PLAYER, LEFT
	applymovement CHERRYGROVECITY_RIVAL, CherrygroveCity_RivalExitsStageLeft
	disappear CHERRYGROVECITY_RIVAL
	setscene SCENE_CHERRYGROVECITY_NOOP
	special HealParty
	playmapmusic
	end

CherrygroveTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext CherrygroveTeacherText_NoMapCard
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext CherrygroveTeacherText_HaveMapCard
	waitbutton
	closetext
	end

CherrygroveYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext CherrygroveYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext CherrygroveYoungsterText_HavePokedex
	waitbutton
	closetext
	end

MysticWaterGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue .After
	writetext MysticWaterGuyTextBefore
	promptbutton
	verbosegiveitem MYSTIC_WATER
	iffalse .Exit
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
.After:
	writetext MysticWaterGuyTextAfter
	waitbutton
.Exit:
	closetext
	end

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CherrygroveCityPokecenterSign:
	jumpstd PokecenterSignScript

CherrygroveCityMartSign:
	jumpstd MartSignScript

GuideGentMovement1:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head UP
	step_end

GuideGentMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement3:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

GuideGentMovement4:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	turn_head LEFT
	step_end

GuideGentMovement5:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

GuideGentMovement6:
	step UP
	step UP
	step_end

CherrygroveCity_RivalWalksToYou:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

CherrygroveCity_RivalPushesYouOutOfTheWay:
	big_step DOWN
	turn_head UP
	step_end

CherrygroveCity_UnusedMovementData: ; unreferenced
	step LEFT
	turn_head DOWN
	step_end

CherrygroveCity_RivalExitsStageLeft:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	step_end

GuideGentIntroText:
	text "Toi, tu débutes,"
	line "non? Ca se voit!"

	para "C'est bon! Tout le"
	line "monde a des"
	cont "défauts!"

	para "Si tu veux, je"
	line "peux t'apprendre"
	cont "deux, trois petits"
	cont "trucs sympa!"
	done

GuideGentTourText1:
	text "Bon allez!"
	line "Suis-moi!"
	done

GuideGentPokecenterText:
	text "C'est un CENTRE"
	line "#MON. On y"

	para "soigne les #-"
	line "MON en moins de"
	cont "temps qu'il n'en"
	cont "faut pour le dire!"

	para "Tu en auras grand"
	line "besoin pendant ta"

	para "quête, alors"
	line "apprends à les"
	cont "utiliser."
	done

GuideGentMartText:
	text "C'est une BOUTIQUE"
	line "#MON."

	para "On y vend des"
	line "BALLS permettant"

	para "de capturer les"
	line "#MON et"
	cont "plein d'autres"
	cont "objets utiles."
	done

GuideGentRoute30Text:
	text "La ROUTE 30 est"
	line "par-là."

	para "Les dresseurs"
	line "s'y affrontent"

	para "avec leurs #MON"
	line "favoris."
	done

GuideGentSeaText:
	text "Voici la mer."

	para "Certains #MON"
	line "se trouvent"
	cont "uniquement dans"
	cont "l'eau."
	done

GuideGentGiftText:
	text "Voilà."

	para "C'est chez moi!"
	line "Merci de m'avoir"
	cont "tenu compagnie."

	para "Je vais te donner"
	line "un p'tit truc."
	done

GotMapCardText:
	text "Le #MATOS de"
	line "<PLAYER> contient"
	cont "maintenant une"
	cont "CARTE!"
	done

GuideGentPokegearText:
	text "Le #MATOS"
	line "est plus utile"
	cont "lorsqu'on y ajou-"
	cont "te des COUPONS."

	para "Je te souhaite"
	line "bonne chance!"
	done

GuideGentNoText:
	text "Oh..."
	line "D'accord."

	para "Viens me voir"
	line "quand tu veux."
	done

CherrygroveRivalText_Seen:
	text "<……> <……> <……>"

	para "Tu as un #MON"
	line "du LABO."

	para "Du gâchis, ouais!"
	line "Une mauviette"
	cont "comme toi..."

	para "<……> <……> <……>"

	para "Bon."
	line "J't'aime pas."

	para "Je vais te montrer"
	line "le bon #MON"
	cont "que j'ai moi!"
	done

RivalCherrygroveWinText:
	text "Alors?"
	line "C'est la joie?"
	done

CherrygroveRivalText_YouLost:
	text "<……> <……> <……>"

	para "Mon nom est ???."

	para "Je serai le plus"
	line "grand dresseur de"
	cont "#MON du"
	cont "monde."
	done

RivalCherrygroveLossText:
	text "Pfff. Une perte"
	line "de temps."
	done

CherrygroveRivalText_YouWon:
	text "<……> <……> <……>"

	para "Mon nom est ???."

	para "Je serai le plus"
	line "grand dresseur de"
	cont "#MON du"
	cont "monde."
	done

CherrygroveTeacherText_NoMapCard:
	text "As-tu parlé au"
	line "vieil homme près"
	cont "du CENTRE"
	cont "#MON?"

	para "Il déposera une"
	line "CARTE de JOHTO"
	cont "dans ton"
	cont "#MATOS."
	done

CherrygroveTeacherText_HaveMapCard:
	text "C'est trop bien"
	line "de se balader avec"
	cont "ses #MON!"
	done

CherrygroveYoungsterText_NoPokedex:
	text "La maison de"
	line "M.#MON est un"
	cont "peu plus loin."
	done

CherrygroveYoungsterText_HavePokedex:
	text "J'ai combattu"
	line "un paquet de"
	cont "dresseurs sur la"
	cont "route."

	para "Mes #MON ont"
	line "perdu avec honneur"

	para "mais bon, le"
	line "résultat est là."
	cont "Je dois aller vite"
	cont "fait dans un"
	cont "CENTRE #MON."
	done

MysticWaterGuyTextBefore:
	text "Le #MON que"
	line "j'ai attrapé avait"
	cont "un objet."

	para "Je crois que c'est"
	line "de l'EAU MYSTIQUE."

	para "Je n'en ai pas"
	line "besoin..."
	cont "La veux-tu?"
	done

MysticWaterGuyTextAfter:
	text "Allez hop, retour"
	line "à la pêche."
	done

CherrygroveCitySignText:
	text "VILLE GRIOTTE"

	para "La ville aux"
	line "fleurs parfumées"
	done

GuideGentsHouseSignText:
	text "MAISON DES GUIDES"
	done

CherrygroveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23,  3, CHERRYGROVE_MART, 2
	warp_event 29,  3, CHERRYGROVE_POKECENTER_1F, 1
	warp_event 17,  7, CHERRYGROVE_GYM_SPEECH_HOUSE, 1
	warp_event 25,  9, GUIDE_GENTS_HOUSE, 1
	warp_event 31, 11, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 1

	def_coord_events
	coord_event 33,  6, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveRivalSceneNorth
	coord_event 33,  7, SCENE_CHERRYGROVECITY_MEET_RIVAL, CherrygroveRivalSceneSouth

	def_bg_events
	bg_event 30,  8, BGEVENT_READ, CherrygroveCitySign
	bg_event 23,  9, BGEVENT_READ, GuideGentsHouseSign
	bg_event 24,  3, BGEVENT_READ, CherrygroveCityMartSign
	bg_event 30,  3, BGEVENT_READ, CherrygroveCityPokecenterSign

	def_object_events
	object_event 32,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	object_event 39,  6, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_CHERRYGROVE_CITY
	object_event 27, 12, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	object_event 23,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	object_event  7, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MysticWaterGuy, -1
