	object_const_def
	const MOVEDELETERSHOUSE_SUPER_NERD

MoveDeletersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end
	
BlackthornTutorScript:
	faceplayer
	opentext
	writetext ShowAMoveText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 7000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext WhatMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RockSlide
	ifequal 2, .Submission
	ifequal 3, .Outrage
	sjump .Incompatible

.RockSlide:
	setval ROCK_SLIDE
	writetext BlackthornTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Submission:
	setval SUBMISSION
	writetext BlackthornTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Outrage:
	setval OUTRAGE 
	writetext BlackthornTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible
	
.Refused:
	writetext ComeAgainText
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext VisitOftenText
	waitbutton
	closetext
	end
	
.NotEnoughMoney:
	writetext BlackthornMoveTutorYouDontHaveEnoughMoneyText
	waitbutton
	closetext
	end

.TeachMove:
    playsound SFX_TRANSACTION
    takemoney YOUR_MONEY, 7000
	special PlaceMoneyTopRight
	writetext ThankYouText
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
	db "ROCK SLIDE@"
	db "SUBMISSION@"
	db "OUTRAGE@"
	db "CANCEL@"
	
ShowAMoveText:
	text "Hello. I am a"
	line "MOVE TUTOR."
	
	para "For ¥7000, I "
	line "can show your"
	cont "#MON how to"
	cont "use some"
	cont "powerful moves."
	
	para "Are you"
	line "interested?"
	done 

ComeAgainText:
	text "Come again if"
	line "you change"
	cont "your mind."
	done

WhatMoveShouldITeachText:
	text "Of course."

	para "Which move should"
	line "I teach?"
	done

ThankYouText:
	text "Thank you! Feel"
	line "free to visit as"
	cont "often as"
	cont "you want."
	done 

VisitOftenText:
	text "Thank you! Feel"
	line "free to visit as"
	cont "often as"
	cont "you want."
	done 
	
BlackthornMoveTutorYouDontHaveEnoughMoneyText:
	text "I'm sorry, but"
	line "you don't have"
	cont "enough money."
	done

BlackthornTutorMoveText:
	text_start
	done

MoveDeletersHouseBookshelf:
	jumpstd DifficultBookshelfScript

MoveDeletersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, BLACKTHORN_CITY, 6
	warp_event  3,  7, BLACKTHORN_CITY, 6

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MoveDeletersHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornTutorScript, -1
