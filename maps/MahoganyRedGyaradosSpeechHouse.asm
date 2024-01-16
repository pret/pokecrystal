	object_const_def
	const MAHOGANYREDGYARADOSSPEECHHOUSE_BLACK_BELT
	const MAHOGANYREDGYARADOSSPEECHHOUSE_TEACHER
	const MAHOGANYREDGYARADOSSPEECHHOUSE_SCIENTIST

MahoganyRedGyaradosSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyRedGyaradosSpeechHouseBlackBeltScript:
	jumptextfaceplayer MahoganyRedGyaradosSpeechHouseBlackBeltText

MahoganyRedGyaradosSpeechHouseTeacherScript:
	faceplayer
	opentext
	writetext MahoganyRedGyaradosSpeechHouseTeacherText
	waitbutton
	closetext
	end
	
FossilScientist:
	faceplayer
	opentext
	checkevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	iftrue .GiveAerodactyl
	checkevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	iftrue .GiveKabuto
	checkevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	iftrue .GiveOmanyte
	writetext FossilScientistIntroText
	waitbutton
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal REVIVE_OLD_AMBER, .OldAmber
	ifequal REVIVE_DOME_FOSSIL, .DomeFossil
	ifequal REVIVE_HELIX_FOSSIL, .HelixFossil
	sjump .No

.OldAmber
	checkitem OLD_AMBER
	iffalse .No
	getmonname STRING_BUFFER_3, AERODACTYL
	writetext FossilScientistMonText
	promptbutton
	setevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	takeitem OLD_AMBER
	writetext FossilScientistGiveText
	waitbutton
	sjump .GaveScientistFossil

.DomeFossil:
	checkitem DOME_FOSSIL
	iffalse .No
	getmonname STRING_BUFFER_3, KABUTO
	writetext FossilScientistMonText
	promptbutton
	setevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	takeitem DOME_FOSSIL
	writetext FossilScientistGiveText
	waitbutton
	sjump .GaveScientistFossil

.HelixFossil:
	checkitem HELIX_FOSSIL
	iffalse .No
	getmonname STRING_BUFFER_3, OMANYTE
	writetext FossilScientistMonText
	promptbutton
	setevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	takeitem HELIX_FOSSIL
	writetext FossilScientistGiveText
	waitbutton
	sjump .GaveScientistFossil

.No
	writetext FossilScientistNoText
	waitbutton
	closetext
	end

.GaveScientistFossil:
	writetext FossilScientistTimeText
	waitbutton
	sjump FossilScientist
	closetext

.GiveAerodactyl:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	clearevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	writetext FossilScientistDoneText
	promptbutton
	getmonname STRING_BUFFER_3, AERODACTYL
	writetext FossilScientistReceiveText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	givepoke AERODACTYL, 40
	closetext
	end

.GiveKabuto:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	clearevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	writetext FossilScientistDoneText
	promptbutton
	getmonname STRING_BUFFER_3, KABUTO
	writetext FossilScientistReceiveText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	givepoke KABUTO, 40
	closetext
	end

.GiveOmanyte:
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	clearevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	writetext FossilScientistDoneText
	promptbutton
	getmonname STRING_BUFFER_3, OMANYTE
	writetext FossilScientistReceiveText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	givepoke OMANYTE, 40
	closetext
	end

.NoRoom:
	writetext FossilScientistPartyFullText
	waitbutton
	closetext
	end

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "OLD AMBER@"
	db "DOME FOSSIL@"
	db "HELIX FOSSIL@"
	db "CANCEL@"

MahoganyRedGyaradosSpeechHouseUnusedBookshelf1: ; unreferenced
	jumpstd PictureBookshelfScript

MahoganyRedGyaradosSpeechHouseUnusedBookshelf2: ; unreferenced
	jumpstd MagazineBookshelfScript

MahoganyRedGyaradosSpeechHouseBlackBeltText:
	text "I heard that a red"
	line "GYARADOS appeared"
	cont "at the LAKE."

	para "That's odd, since"
	line "even ordinary"

	para "GYARADOS are rare"
	line "in that lake…"
	done

MahoganyRedGyaradosSpeechHouseTeacherText:
	text "My favorite radio"
	line "program? I'd say"
	cont "#MON MUSIC."
	done

FossilScientistIntroText:
	text "Hello!"
	
	para "I used to work on"
	line "CINNABAR ISLAND."
	
	para "But after a"
	line "volcanic eruption"
	cont "I moved here to"
	cont "MAHOGANY."

	para "I study about"
	line "#MON fossils."

	para "In particular I"
	line "am interested in"
	cont "reviving ancient"
	cont "#MON."

	para "Do you have a"
	line "fossil by any"
	cont "chance?"
	done 

FossilScientistNoText:
	text "I see."

	para "Come again when"
	line "you have one."
	done

FossilScientistPartyFullText:
	text "I'm sorry."

	para "Your party is"
	line "already full!"
	done

FossilScientistTimeText:
	text "I'll get right"
	line "to it!"
	done 

FossilScientistDoneText:
	text "Amazing…"
	
	para "I am done with"
	line "this fossil."
	done 

FossilScientistMonText:
	text "It's the fossil of"
	line "@"
	text_ram wStringBuffer3
	text ", a"

	para "#MON that is"
	line "already extinct."

	para "But I am confident"
    line "that I will be"
	cont "able to bring it"
	cont "back to life."
	done

FossilScientistGiveText:
	text "Would you mind"
	line "if I take this?"

	para "<PLAYER> handed"
	line "over the fossil."
	done

FossilScientistReceiveText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

MahoganyRedGyaradosSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MAHOGANY_TOWN, 2
	warp_event  3,  7, MAHOGANY_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseBlackBeltScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseTeacherScript, -1
	object_event  5,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FossilScientist, -1
