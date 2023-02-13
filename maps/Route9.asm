	object_const_def
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_YOUNGSTER2
	const ROUTE9_LASS2
	const ROUTE9_POKEFAN_M1
	const ROUTE9_POKEFAN_M2

Route9_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

CamperDeanSeenText:
	text "Je viens pour ex-"
	line "plorer la GROTTE."
	done

CamperDeanBeatenText:
	text "Whoa! Danger!"
	done

CamperDeanAfterBattleText:
	text "Mes #MON ont"
	line "été blessés avant"

	para "d'entrer dans la"
	line "GROTTE."

	para "Je devrais les"
	line "amener à un CENTRE"
	cont "#MON..."
	done

PicnickerHeidiSeenText:
	text "Tu aimes les"
	line "pique-niques?"
	cont "C'est trop cool!"
	done

PicnickerHeidiBeatenText:
	text "Ohhhh!"
	done

PicnickerHeidiAfterBattleText:
	text "On mange comme"
	line "des truies et on"

	para "fait des miettes."
	line "C'est mortel!"
	done

CamperSidSeenText:
	text "Toi, moi!"
	line "Combat, yaaah!"
	done

CamperSidBeatenText:
	text "OK."
	line "A gagné."
	done

CamperSidAfterBattleText:
	text "Ca va pour cette"
	line "fois. Je te laisse"
	cont "gagner. File!"
	done

PicnickerEdnaSeenText:
	text "Faire des saletés"
	line "dans les lieux pu-"
	cont "blics, c'est mal."
	done

PicnickerEdnaBeatenText:
	text "Ohh...pas glop."
	done

PicnickerEdnaAfterBattleText:
	text "Ne jette pas tes"
	line "papiers gras au"

	para "sol. Parce que"
	line "c'est mal."
	done

HikerTimSeenText:
	text "Elle descend du"
	line "MONT ARGENT à"
	cont "cheval..."
	cont "La la la la la..."

	para "Le MONT ARGENT est"
	line "à JOHTO, non?"
	done

HikerTimBeatenText:
	text "C'est trop bien"
	line "de chanter."
	done

HikerTimAfterBattleText:
	text "C'est la fête au"
	line "village..."
	cont "La la la la la..."
	done

HikerSidneySeenText:
	text "J'ai un secret"
	line "pour toi."

	para "Mais d'abord..."
	line "Combat!"
	done

HikerSidneyBeatenText:
	text "Zut de flûte!"
	line "Perdu!"
	done

HikerSidneyAfterBattleText:
	text "La CENTRALE est de"
	line "l'autre côté d'une"
	cont "rivière."
	done

Route9SignText:
	text "ROUTE 9"

	para "AZURIA -"
	line "GROTTE"
	done

Route9_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	def_object_events
	object_event 23, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperDean, -1
	object_event 39,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 11,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperSid, -1
	object_event 12, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 28,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerTim, -1
	object_event 36, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerSidney, -1
