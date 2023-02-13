	object_const_def
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScripts:
	def_scene_scripts

	def_callbacks

LavRadioTower1FReceptionistScript:
	jumptextfaceplayer LavRadioTower1FReceptionistText

LavRadioTower1FOfficerScript:
	jumptextfaceplayer LavRadioTower1FOfficerText

LavRadioTower1FSuperNerd1Script:
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavRadioTower1FGentlemanText_ReturnedMachinePart
	promptbutton
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavRadioTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd ReceiveItemScript
	end

.expncardname
	db "CPN EXPAN.@"

LavRadioTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavRadioTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavRadioTower1FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReferenceLibrary: ; unreferenced
	jumptext LavRadioTower1FReferenceLibraryText

LavRadioTower1FReceptionistText:
	text "Bienvenue!"
	line "Tu peux visiter"

	para "cet étage tant que"
	line "tu le veux."
	done

LavRadioTower1FOfficerText:
	text "Seul le rez-de-"
	line "chaussée est à"
	cont "visiter."

	para "Depuis l'attaque"
	line "de la TOUR RADIO"

	para "de JOHTO par un"
	line "gang criminel, on"

	para "a renforcé les me-"
	line "sures de sécurité."
	done

LavRadioTower1FSuperNerd1Text:
	text "Les gens travail-"
	line "lent dur ici, à"
	cont "la TOUR RADIO."

	para "Ils se donnent à"
	line "fond pour faire"
	cont "de bonnes émis-"
	cont "sions."
	done

LavRadioTower1FGentlemanText:
	text "Oh, non, non, non!"

	para "Nous ne sommes"
	line "plus à l'antenne"

	para "depuis la fermetu-"
	line "re de la CENTRALE."

	para "Je cours à la ca-"
	line "tastrophe si je ne"
	cont "peux plus émettre!"

	para "J'suis ruiné!"
	done

LavRadioTower1FGentlemanText_ReturnedMachinePart:
	text "Ah! C'est toi"
	line "<PLAY_G> qui a"

	para "réparé la"
	line "CENTRALE?"

	para "Grâce à toi, j'ai"
	line "pu garder mon job."
	cont "Tu es trop cool!"

	para "Prends ça!"
	done

LavRadioTower1FGentlemanText_GotExpnCard:
	text "Avec ceci, tu peux"
	line "écouter la radio"
	cont "depuis KANTO."

	para "Gahahahaha!"
	done

LavRadioTower1FSuperNerd2Text:
	text "Hé toi!"

	para "Je suis le"
	line "DIRECTEUR MUSICAL!"

	para "Hein? Ton #-"
	line "MATOS ne peut pas"

	para "capter les émis-"
	line "sions de radio..."
	cont "Quel dommage!"

	para "Avec un CPN EXPAN,"
	line "tu peux améliorer"

	para "ton matériel!"
	line "Va en trouver un!"
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "Hé toi!"

	para "Je suis le"
	line "DIRECTEUR MUSICAL!"

	para "Je suis à l'origi-"
	line "ne des belles mé-"

	para "lodies diffusées"
	line "à l'antenne."

	para "Alors écoute bien"
	line "nos belles"
	cont "émissions!"
	done

LavRadioTower1FDirectoryText:
	text "RDC  RECEPTION"
	line "1ER  VENTES"

	para "2EME PERSONNEL"
	line "3EME PRODUCTION"

	para "4EME BUREAU"
	line "     DIRECTION"
	done

LavRadioTower1FPokeFluteSignText:
	text "Animez vos #MON"
	line "avec des sons de"

	para "# FLUTE sur"
	line "l'ANTENNE 20"
	done

LavRadioTower1FReferenceLibraryText:
	text "Whoa! Plein de"
	line "cassettes et de"
	cont "CD #MON!"

	para "Ca doit être une"
	line "librairie offi-"
	cont "cielle."
	done

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7

	def_coord_events

	def_bg_events
	bg_event 11,  0, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  5,  0, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	def_object_events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, -1
	object_event  1,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
