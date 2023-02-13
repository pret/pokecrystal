	object_const_def
	const CELADONMANSION3F_COOLTRAINER_M
	const CELADONMANSION3F_GYM_GUIDE
	const CELADONMANSION3F_SUPER_NERD
	const CELADONMANSION3F_FISHER

CeladonMansion3F_MapScripts:
	def_scene_scripts

	def_callbacks

GameFreakGameDesignerScript:
	faceplayer
	opentext
	writetext GameFreakGameDesignerText
	readvar VAR_DEXCAUGHT
	ifgreater NUM_POKEMON - 2 - 1, .CompletedPokedex ; ignore Mew and Celebi
	waitbutton
	closetext
	end

.CompletedPokedex:
	promptbutton
	writetext GameFreakGameDesignerCompletedPokedexText
	playsound SFX_DEX_FANFARE_230_PLUS
	waitsfx
	writetext GameFreakGameDesignerPauseForDiplomaText
	promptbutton
	special Diploma
	writetext GameFreakGameDesignerAfterDiplomaText
	waitbutton
	closetext
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitbutton
	closetext
	end

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalse .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitbutton
	closetext
	end

.CancelPrinting: ; unreferenced
	writetext GameFreakGraphicArtistErrorText
	waitbutton
	closetext
	end

GameFreakProgrammerScript:
	jumptextfaceplayer GameFreakProgrammerText

GameFreakCharacterDesignerScript:
	jumptextfaceplayer GameFreakCharacterDesignerText

CeladonMansion3FDevRoomSign:
	jumptext CeladonMansion3FDevRoomSignText

CeladonMansion3FDrawing:
	jumptext CeladonMansion3FDrawingText

CeladonMansion3FGameProgram:
	jumptext CeladonMansion3FGameProgramText

CeladonMansion3FReferenceMaterial:
	jumptext CeladonMansion3FReferenceMaterialText

GameFreakGameDesignerText:
	text "Mmmmoui?"

	para "Je suis le DESI-"
	line "GNER du JEU!"

	para "Continue à remplir"
	line "ton #DEX!"
	done

GameFreakGameDesignerCompletedPokedexText:
	text "Whoa! Super!"
	line "Tu as complété ton"
	cont "#DEX!"

	para "Formidable!"
	done

GameFreakGameDesignerPauseForDiplomaText:
	text "......."
	done

GameFreakGameDesignerAfterDiplomaText:
	text "L'ARTISTE GRAPHI-"
	line "QUE va imprimer un"
	cont "DIPLOME pour toi."

	para "Va te vanter, mon"
	line "petit."
	done

GameFreakGraphicArtistText:
	text "Je suis l'ARTISTE"
	line "GRAPHIQUE."

	para "J'ai fait ton"
	line "dessin!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "Je suis l'ARTISTE"
	line "GRAPHIQUE."

	para "Tu as complété"
	line "ton #DEX?"

	para "Tu veux que j'im-"
	line "prime ton DIPLOME?"
	done

GameFreakGraphicArtistRefusedText:
	text "Appelle-moi si tu"
	line "veux que j'imprime"
	cont "ton DIPLOME."
	done

GameFreakGraphicArtistErrorText:
	text "Ca ne marche pas."
	line "Je ne peux pas"
	cont "imprimer."
	done

GameFreakProgrammerText:
	text "Moi? Je suis le"
	line "PROGRAMMEUR."

	para "Joue aux machines"
	line "à sous!"
	done

GameFreakCharacterDesignerText:
	text "Les JUMELLES sont"
	line "pas trop mimi?"

	para "JASMINE est trop"
	line "jolie, non?"

	para "Je...les aime!"
	done

CeladonMansion3FDevRoomSignText:
	text "GAME FREAK"
	line "SALLE de"
	cont "DEVELOPPEMENT"
	done

CeladonMansion3FDrawingText:
	text "C'est le dessin"
	line "d'une jolie fille."
	done

CeladonMansion3FGameProgramText:
	text "C'est le programme"
	line "du jeu. Si on y"

	para "touche, il y aura"
	line "des bogues!"
	done

CeladonMansion3FReferenceMaterialText:
	text "Il y a plein de"
	line "produits dérivés."
	cont "Il y a même une"
	cont "# POUPEE."
	done

CeladonMansion3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_ROOF, 1
	warp_event  1,  0, CELADON_MANSION_2F, 2
	warp_event  6,  0, CELADON_MANSION_2F, 3
	warp_event  7,  0, CELADON_MANSION_ROOF, 2

	def_coord_events

	def_bg_events
	bg_event  5,  8, BGEVENT_UP, CeladonMansion3FDevRoomSign
	bg_event  4,  3, BGEVENT_UP, CeladonMansion3FDrawing
	bg_event  1,  6, BGEVENT_UP, CeladonMansion3FGameProgram
	bg_event  1,  3, BGEVENT_UP, CeladonMansion3FReferenceMaterial

	def_object_events
	object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  3,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakProgrammerScript, -1
	object_event  0,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakCharacterDesignerScript, -1
