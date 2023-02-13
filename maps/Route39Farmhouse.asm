DEF ROUTE39FARMHOUSE_MILK_PRICE EQU 500

	object_const_def
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScripts:
	def_scene_scripts

	def_callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	promptbutton
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetext FarmerFText_InTrouble
	waitbutton
	closetext
	end

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	promptbutton
	verbosegiveitem TM_SNORE
	iffalse FarmerFScript_NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetext FarmerFText_SnoreSpeech
	waitbutton
FarmerFScript_NoRoomForSnore:
	closetext
	end

FarmhouseBookshelf:
	jumpstd PictureBookshelfScript

FarmerMText_SickCow:
	text "Ma chtite ECREMEUH"
	line "m'donne plus eud'"
	cont "lait."

	para "Et pourtant qu'il"
	line "était bien bon"
	cont "not'lait d'ici."

	para "Et tout eul'monde"
	line "y veut à boire."

	para "Si j'en avais des"
	line "BAIES à lui donner"

	para "elle m'donnerait"
	line "aussi du lait, par"
	cont "le fait."
	done

FarmerMText_BuyMilk:
	text "Ca te dit du bon"
	line "LAIT MEUMEU?"

	para "C'est ma fierté et"
	line "ma joie, poussin."

	para "Donnes-en à tes"
	line "#MON pour en"
	cont "gagner des PV!"

	para "Pour juste {d:ROUTE39FARMHOUSE_MILK_PRICE}¥"
	line "je te l'offre."
	cont "Pour sûr!"
	done

FarmerMText_GotMilk:
	text "Tiens, poussin!"
	line "Bien à toi!"
	done

FarmerMText_NoMoney:
	text "Dommage, t'as pas"
	line "de mitraille!"
	done

FarmerMText_NoRoom:
	text "T'as pas de place,"
	line "mon poussin."
	done

FarmerMText_NoSale:
	text "Il en veut pas?"
	line "A plus tard."
	done

FarmerMText_Milking:
	text "Bon. J'ai à"
	line "traire."
	done

FarmerFText_InTrouble:
	text "Notre lait est mê-"
	line "me vendu à KANTO."

	para "Si notre fidèle"
	line "ECREMEUH ne donne"

	para "plus de lait,"
	line "c'est la faillite."
	done

FarmerFText_HealedMiltank:
	text "Tu nous as soigné"
	line "not'ECREMEUH! Elle"

	para "en donne à nouveau"
	line "du bon LAIT!"

	para "Voilà pour"
	line "toi, poussin."
	done

Text_ReceivedTM13: ; unreferenced
	text "<PLAYER> reçoit"
	line "CT13."
	done

FarmerFText_SnoreSpeech:
	text "C'est eul'fameux"
	line "RONFLEMENT."

	para "C'est un coup rare"
	line "qui marche que"

	para "quand eul'#MON"
	line "il dort."

	para "Alors à toi eud'"
	line "faire ta stratégie"
	cont "mon p'tit poussin."
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	def_object_events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
