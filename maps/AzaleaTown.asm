	object_const_def
	const AZALEATOWN_AZALEA_ROCKET1
	const AZALEATOWN_GRAMPS
	const AZALEATOWN_TEACHER
	const AZALEATOWN_YOUNGSTER
	const AZALEATOWN_SLOWPOKE1
	const AZALEATOWN_SLOWPOKE2
	const AZALEATOWN_SLOWPOKE3
	const AZALEATOWN_SLOWPOKE4
	const AZALEATOWN_FRUIT_TREE
	const AZALEATOWN_RIVAL
	const AZALEATOWN_AZALEA_ROCKET3
	const AZALEATOWN_KURT_OUTSIDE

AzaleaTown_MapScripts:
	def_scene_scripts
	scene_script AzaleaTownNoop1Scene, SCENE_AZALEATOWN_NOOP
	scene_script AzaleaTownNoop2Scene, SCENE_AZALEATOWN_RIVAL_BATTLE
	scene_script AzaleaTownNoop3Scene, SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL

	def_callbacks
	callback MAPCALLBACK_NEWMAP, AzaleaTownFlypointCallback

AzaleaTownNoop1Scene:
	end

AzaleaTownNoop2Scene:
	end

AzaleaTownNoop3Scene:
	end

AzaleaTownFlypointCallback:
	setflag ENGINE_FLYPOINT_AZALEA
	endcallback

AzaleaTownRivalBattleScene1:
	moveobject AZALEATOWN_RIVAL, 11, 11
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_RIVAL
	applymovement AZALEATOWN_RIVAL, AzaleaTownRivalBattleApproachMovement1
	turnobject PLAYER, DOWN
	sjump AzaleaTownRivalBattleScript

AzaleaTownRivalBattleScene2:
	turnobject PLAYER, RIGHT
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear AZALEATOWN_RIVAL
	applymovement AZALEATOWN_RIVAL, AzaleaTownRivalBattleApproachMovement2
	turnobject PLAYER, UP
AzaleaTownRivalBattleScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext AzaleaTownRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_AZALEA_TOWN
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.Totodile:
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.Chikorita:
	winlosstext AzaleaTownRivalWinText, AzaleaTownRivalLossText
	setlasttalked AZALEATOWN_RIVAL
	loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext AzaleaTownRivalAfterText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	applymovement AZALEATOWN_RIVAL, AzaleaTownRivalBattleExitMovement
	playsound SFX_EXIT_BUILDING
	disappear AZALEATOWN_RIVAL
	setscene SCENE_AZALEATOWN_NOOP
	waitsfx
	playmapmusic
	end

AzaleaTownRocket1Script:
	jumptextfaceplayer AzaleaTownRocket1Text

AzaleaTownRocket2Script:
	jumptextfaceplayer AzaleaTownRocket2Text

AzaleaTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .ClearedWell
	writetext AzaleaTownGrampsTextBefore
	waitbutton
	closetext
	end

.ClearedWell:
	writetext AzaleaTownGrampsTextAfter
	waitbutton
	closetext
	end

AzaleaTownTeacherScript:
	jumptextfaceplayer AzaleaTownTeacherText

AzaleaTownYoungsterScript:
	jumptextfaceplayer AzaleaTownYoungsterText

AzaleaTownSlowpokeScript:
	opentext
	writetext AzaleaTownSlowpokeText1
	pause 60
	writetext AzaleaTownSlowpokeText2
	cry SLOWPOKE
	waitbutton
	closetext
	end

UnusedWoosterScript: ; unreferenced
	faceplayer
	opentext
	writetext WoosterText
	cry QUAGSIRE
	waitbutton
	closetext
	end

AzaleaTownCelebiScene:
	applymovement PLAYER, AzaleaTownPlayerLeavesKurtsHouseMovement
	opentext
	writetext AzaleaTownKurtText1
	promptbutton
	turnobject AZALEATOWN_KURT_OUTSIDE, RIGHT
	writetext AzaleaTownKurtText2
	promptbutton
	writetext AzaleaTownKurtText3
	waitbutton
	verbosegiveitem GS_BALL
	turnobject AZALEATOWN_KURT_OUTSIDE, LEFT
	setflag ENGINE_FOREST_IS_RESTLESS
	clearevent EVENT_ILEX_FOREST_LASS
	setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	setscene SCENE_AZALEATOWN_NOOP
	closetext
	end

AzaleaTownKurtScript:
	faceplayer
	opentext
	writetext AzaleaTownKurtText3
	waitbutton
	turnobject AZALEATOWN_KURT_OUTSIDE, LEFT
	closetext
	end

AzaleaTownSign:
	jumptext AzaleaTownSignText

KurtsHouseSign:
	jumptext KurtsHouseSignText

AzaleaGymSign:
	jumptext AzaleaGymSignText

SlowpokeWellSign:
	jumptext SlowpokeWellSignText

CharcoalKilnSign:
	jumptext CharcoalKilnSignText

AzaleaTownIlextForestSign:
	jumptext AzaleaTownIlexForestSignText

AzaleaTownPokecenterSign:
	jumpstd PokecenterSignScript

AzaleaTownMartSign:
	jumpstd MartSignScript

WhiteApricornTree:
	fruittree FRUITTREE_AZALEA_TOWN

AzaleaTownHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_AZALEA_TOWN_HIDDEN_FULL_HEAL

AzaleaTownRivalBattleApproachMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

AzaleaTownRivalBattleApproachMovement2:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AzaleaTownRivalBattleExitMovement:
	step LEFT
	step LEFT
	step LEFT
	step_end

AzaleaTownPlayerLeavesKurtsHouseMovement:
	step LEFT
	step LEFT
	step UP
	turn_head LEFT
	step_end

AzaleaTownRivalBeforeText:
	text "...Dis-moi quelque"
	line "chose, p'tit"
	cont "bouchon..."

	para "Est-ce vrai que la"
	line "TEAM ROCKET est de"
	cont "retour?"

	para "Quoi? Tu les as"
	line "battus? Hah!"
	cont "Arrête de mentir."

	para "Naan, t'aimes"
	line "pas crâner, toi!"
	cont "Allez, baston..."
	done

AzaleaTownRivalWinText:
	text "...Humpff! Vilains"
	line "#MON!"

	para "Ouvre bien tes"
	line "oreilles mon p'tit"

	para "chat, t'as gagné"
	line "parce que mes"
	cont "#MON se sont"
	cont "couchés tard..."
	done

AzaleaTownRivalAfterText:
	text "Je déteste les"
	line "minus."

	para "#MON ou"
	line "dresseur, c'est"
	cont "du kif-kif."

	para "Je vais devenir"
	line "surpuissant et"
	cont "balayer les minus."

	para "Et c'est pareil"
	line "pour la TEAM"
	cont "ROCKET."

	para "Ils sont redoutés"
	line "parce qu'ils agis-"

	para "sent en groupe,"
	line "mais un par un ils"
	cont "sont faibles."

	para "Je les déteste"
	line "tous!"

	para "Hors de ma vue"
	line "minus! Quelqu'un"

	para "comme toi"
	line "ne peut rien"
	cont "m'apporter..."
	done

AzaleaTownRivalLossText:
	text "...Humpff! Je me"
	line "doutais bien que"
	cont "tu pipotais..."
	done

AzaleaTownRocket1Text:
	text "C'est dangereux"
	line "d'entrer ici, je"
	cont "monte la garde."

	para "J'suis trop cool,"
	line "tu ne trouves pas?"
	done

AzaleaTownRocket2Text:
	text "Que sais-tu sur la"
	line "QUEUERAMOLOS? On"
	cont "dit que c'est"
	cont "goûtu!"

	para "C'est trop bien"
	line "de savoir ça, non?"
	done

AzaleaTownGrampsTextBefore:
	text "Les RAMOLOSS ont"
	line "déserté la ville."

	para "On dit qu'on vend"
	line "leur QUEUE quelque"
	cont "part."
	done

AzaleaTownGrampsTextAfter:
	text "Les RAMOLOSS sont"
	line "de retour."

	para "A mon avis, ils"
	line "devaient traîner"
	cont "quelque part."
	done

AzaleaTownTeacherText:
	text "Es-tu ici pour"
	line "FARGAS, celui qui"
	cont "fabrique les"
	cont "BALLS?"

	para "Il n'y a pas que"
	line "toi."
	done

AzaleaTownYoungsterText:
	text "Passe par ECORCIA"
	line "et tu te retrou-"
	cont "veras au BOIS AUX"
	cont "CHENES."

	para "Mais ces petits"
	line "arbustes bloquent"
	cont "le passage."

	para "Le #MON du"
	line "CHARBONNIER peut"
	cont "couper les arbres."
	done

AzaleaTownSlowpokeText1:
	text "RAMOLOSS: ..."

	para ".................."
	done

AzaleaTownSlowpokeText2:
	text ".........gueuh?"
	done

WoosterText:
	text "KIKI: Gaaahh..."
	done

AzaleaTownKurtText1:
	text "Le BOIS AUX CHENES"
	line "est agité!"

	para "Que se passe-t-il?"
	done

AzaleaTownKurtText2:
	text "<PLAYER>, voilà"
	line "ta GS BALL!"
	done

AzaleaTownKurtText3:
	text "Peux-tu voir pour-"
	line "quoi le BOIS AUX"
	cont "CHENES est si"
	cont "agité?"
	done

AzaleaTownSignText:
	text "ECORCIA"
	line "La ville où les"

	para "gens et les petits"
	line "#MON sont"
	cont "bien contents"
	cont "d'habiter"
	done

KurtsHouseSignText:
	text "MAISON DE FARGAS"
	done

AzaleaGymSignText:
	text "CHAMPION d'ARENE"
	line "d'ECORCIA: HECTOR"

	para "L'expert des"
	line "#MON insecte!"
	done

SlowpokeWellSignText:
	text "PUITS RAMOLOSS"

	para "Aussi connu sous"
	line "le nom de..."
	cont "PUITS de PLUIE."

	para "Les gens du coin"
	line "pensent que le"
	cont "baillement du"
	cont "RAMOLOSS invoque"
	cont "la pluie."

	para "Les archives"
	line "montrent qu'un"

	para "baillement de"
	line "RAMOLOSS a mis fin"
	cont "à 400 ans de"
	cont "sécheresse."
	done

CharcoalKilnSignText:
	text "FOUR A CHARBON"
	done

AzaleaTownIlexForestSignText:
	text "BOIS AUX CHENES"

	para "On y entre par la"
	line "porte."
	done

AzaleaTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  9, AZALEA_POKECENTER_1F, 1
	warp_event 21, 13, CHARCOAL_KILN, 1
	warp_event 21,  5, AZALEA_MART, 2
	warp_event  9,  5, KURTS_HOUSE, 1
	warp_event 10, 15, AZALEA_GYM, 1
	warp_event 31,  7, SLOWPOKE_WELL_B1F, 1
	warp_event  2, 10, ILEX_FOREST_AZALEA_GATE, 3
	warp_event  2, 11, ILEX_FOREST_AZALEA_GATE, 4

	def_coord_events
	coord_event  5, 10, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene1
	coord_event  5, 11, SCENE_AZALEATOWN_RIVAL_BATTLE, AzaleaTownRivalBattleScene2
	coord_event  9,  6, SCENE_AZALEATOWN_KURT_RETURNS_GS_BALL, AzaleaTownCelebiScene

	def_bg_events
	bg_event 19,  9, BGEVENT_READ, AzaleaTownSign
	bg_event 10,  9, BGEVENT_READ, KurtsHouseSign
	bg_event 14, 15, BGEVENT_READ, AzaleaGymSign
	bg_event 29,  7, BGEVENT_READ, SlowpokeWellSign
	bg_event 19, 13, BGEVENT_READ, CharcoalKilnSign
	bg_event 16,  9, BGEVENT_READ, AzaleaTownPokecenterSign
	bg_event 22,  5, BGEVENT_READ, AzaleaTownMartSign
	bg_event  3,  9, BGEVENT_READ, AzaleaTownIlextForestSign
	bg_event 31,  6, BGEVENT_ITEM, AzaleaTownHiddenFullHeal

	def_object_events
	object_event 31,  9, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownRocket1Script, EVENT_AZALEA_TOWN_SLOWPOKETAIL_ROCKET
	object_event 21,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownGrampsScript, -1
	object_event 15, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaTownTeacherScript, -1
	object_event  7,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaTownYoungsterScript, -1
	object_event  8, 17, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 18,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 29,  9, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event 15, 15, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownSlowpokeScript, EVENT_AZALEA_TOWN_SLOWPOKES
	object_event  8,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhiteApricornTree, -1
	object_event 11, 10, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_AZALEA_TOWN
	object_event 10, 16, SPRITE_AZALEA_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownRocket2Script, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6,  5, SPRITE_KURT_OUTSIDE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AzaleaTownKurtScript, EVENT_AZALEA_TOWN_KURT
