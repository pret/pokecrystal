	object_const_def
	const EARLSPOKEMONACADEMY_EARL
	const EARLSPOKEMONACADEMY_YOUNGSTER1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID2
	const EARLSPOKEMONACADEMY_YOUNGSTER2
	const EARLSPOKEMONACADEMY_POKEDEX

EarlsPokemonAcademy_MapScripts:
	def_scene_scripts

	def_callbacks

AcademyEarl:
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalse .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyEarlTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyEarlNoMoreToTeachText
	waitbutton
	closetext
	end

EarlsPokemonAcademyYoungster1Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster1Text

EarlsPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

EarlsPokemonAcademyYoungster2Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	sjump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 12, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(@), NULL

.Text:
	db "PSN@"
	db "PAR@"
	db "SOM@"
	db "BRU@"
	db "GEL@"
	db "RET@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyStickerMachine: ; unreferenced
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd DifficultBookshelfScript

AcademyEarlSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

AcademyEarlIntroText:
	text "THEOPHILE est"
	line "mon nom!"

	para "Sensationnels sont"
	line "les #MON!"

	para "Te transmettre"
	line "quelques petits"
	cont "conseils au niveau"
	cont "me maintiendra!"

	para "Que veux-tu"
	line "savoir?"
	cont "Comment devenir"
	cont "MAITRE?"
	done

AcademyEarlTeachHowToWinText:
	text "Très bien!"
	line "Ton éducation je"
	cont "ferai!"

	para "En combat, le"
	line "premier #MON de"
	cont "ta liste sort le"
	cont "premier!"

	para "Changer l'ordre de"
	line "la liste peut"
	cont "t'aider à gagner"
	cont "ou perdre!"

	para "Tu veux en savoir"
	line "plus?"
	done

AcademyEarlTeachMoreText:
	text "Alors, on veut"
	line "savoir comment"
	cont "bien élever ses"
	cont "p'tits #MON?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "Qu'il en soit"
	line "ainsi."
	cont "Ton éducation"
	cont "je ferai!"

	para "Tout #MON qui"
	line "participe au"

	para "combat, même"
	line "brièvement, ga-"
	cont "gne des points"
	cont "d'EXP."

	para "Mets en première"
	line "ligne un #MON"

	para "faible et change-"
	line "le rapidement!"

	para "De cette façon,"
	line "les #MON fai-"
	cont "bles seront bons!"
	done

AcademyEarlNoMoreToTeachText:
	text "Tu fais attention!"
	line "C'est bien! Je"
	cont "n'ai plus rien à"
	cont "t'apprendre!"

	para "Aime fort tes"
	line "#MON!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Je prends note de"
	line "ce cours bien"
	cont "utile."

	para "C'est sûrement"
	line "utile de copier ce"
	cont "qu'il y a au"
	cont "tableau."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "J'ai échangé mon"
	line "meilleur #MON"
	cont "avec celui du gars"
	cont "à côté de moi."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "Hein? Le #MON"
	line "que je viens"
	cont "d'avoir tient"
	cont "quelque chose!"
	done

EarlsPokemonAcademyYoungster2Text:
	text "Un #MON tenant"
	line "une BAIE se soi-"
	cont "gnera tout seul en"
	cont "combat."

	para "Beaucoup d'autres"
	line "objets peuvent"
	cont "être tenus par les"
	cont "#MON..."

	para "Ecrire..."
	line "C'est dur..."
	done

AcademyBlackboardText:
	text "Le tableau indique"
	line "les changements de"

	para "statut des"
	line "#MON pendant"
	cont "les combats."
	done

AcademyBlackboardText2: ; unreferenced
	text "Lire quel sujet?"
	done

AcademyPoisonText:
	text "Empoisonné, votre"
	line "#MON perd"
	cont "régulièrement des"
	cont "PV."

	para "Le poison agit"
	line "même après le"

	para "combat et vous"
	line "perdrez des PV en"
	cont "marchant."

	para "Seul remède connu"
	line "à ce jour:"
	cont "l'ANTIDOTE."
	done

AcademyParalysisText:
	text "La paralysie"
	line "réduit la vitesse"
	cont "et peut empêcher"
	cont "de lancer une"
	cont "attaque."

	para "Elle dure même"
	line "après le combat."
	cont "L'ANTI-PARA peut"
	cont "l'annuler."
	done

AcademySleepText:
	text "Endormi, votre"
	line "#MON ne peut"
	cont "pas réagir."

	para "Un #MON endormi"
	line "ne se réveille pas"
	cont "après le combat."

	para "Réveillez-le avec"
	line "un REVEIL."
	done

AcademyBurnText:
	text "Une brûlure con-"
	line "somme des PV. Elle"

	para "réduit aussi la"
	line "force d'attaque."

	para "La brûlure conti-"
	line "nue même après le"
	cont "combat."

	para "Utilisez de"
	line "l'ANTI-BRULE pour"
	cont "la soigner."
	done

AcademyFreezeText:
	text "Si votre #MON"
	line "est gelé, il ne"
	cont "pourra rien faire."

	para "Le gel continue"
	line "après le combat."

	para "Mieux qu'un radia-"
	line "teur, l'ANTIGEL"
	cont "le réchauffera!"
	done

AcademyNotebookText:
	text "C'est le cahier de"
	line "ce gamin..."

	para "Attrapez les"
	line "#MON en lançant"
	cont "les # BALLS."

	para "Vous pouvez trans-"
	line "porter six #MON"
	cont "avec vous."

	para "Continuer à lire?"
	done

AcademyNotebookText1:
	text "Avant de lancer"
	line "une # BALL,"
	cont "affaiblissez le"
	cont "#MON."

	para "Un #MON brûlé"
	line "ou empoisonné est"
	cont "plus facile à"
	cont "attraper."

	para "Continuer à lire?"
	done

AcademyNotebookText2:
	text "Certaines capaci-"
	line "tés peuvent em-"
	cont "brouiller l'esprit"
	cont "du #MON"
	cont "adverse."

	para "Une fois confus,"
	line "le #MON peut"
	cont "s'attaquer lui-"
	cont "même."

	para "Fuir le combat"
	line "annule tout effet"
	cont "de confusion."

	para "Continuer à lire?"
	done

AcademyNotebookText3:
	text "Les personnes qui"
	line "attrapent et uti-"

	para "lisent les #MON"
	line "pour les combats"
	cont "sont des dresseurs"
	cont "de #MON."

	para "Leur but est de"
	line "défier et vaincre"

	para "tous les dresseurs"
	line "et CHAMPIONS"
	cont "d'ARENES."

	para "La page suivante"
	line "est...blanche!"

	para "Gamin: Maiiheuu..."

	para "J'ai rien écrit"
	line "d'autre..."
	done

AcademyStickerMachineText:
	text "Cette superbe ma-"
	line "chine imprime des"
	cont "données en auto-"
	cont "collants!"
	done

EarlsPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	def_object_events
	object_event  4,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
