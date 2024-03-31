	object_const_def
	const POKESEERSHOUSE_GRANNY

PokeSeersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodTutorScript:
	faceplayer
	opentext
	writetext AskTeachAMoveText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext WhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .ThunderWave
	ifequal 2, .Reflect
	ifequal 3, .LightScreen
	sjump .Incompatible

.ThunderWave:
	setval THUNDER_WAVE
	writetext CianwoodTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Reflect:
	setval REFLECT
	writetext CianwoodTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.LightScreen:
	setval LIGHT_SCREEN
	writetext CianwoodTutorMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible
	
.Refused:
	writetext ComeBackAgainText
	waitbutton
	closetext
	end
	
.Incompatible:
	writetext TutorBButText
	waitbutton
	closetext
	end
	
.NotEnoughMoney:
	writetext CianwoodMoveTutorYouDontHaveEnoughMoneyText
	waitbutton
	closetext
	end

.TeachMove:
    playsound SFX_TRANSACTION
    takemoney YOUR_MONEY, 4000
	special PlaceMoneyTopRight
	writetext FarewellKidText
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
	db "THUNDER WAVE@"
	db "REFLECT@"
	db "LIGHT SCREEN@"
	db "CANCEL@"
	
AskTeachAMoveText:
	text "I can see that"
	line "you're a trainer"
	cont "and a skilled one"
	cont "at that!"
	
	para "For just ¥4000,"
	line "I can teach"
	cont "your #MON"
	cont "some very useful"
	cont "moves."
	
	para "How about it?"
	done 

ComeBackAgainText:
	text "Come back here"
	line "if you want to"
	
	para "teach your"
	line "#MON a new"
	cont "move!"
	done

WhichMoveShouldITeachText:
	text "Great! You won't"
	line "regret it!"

	para "Which move should"
	line "I teach?"
	done

FarewellKidText:
	text "Thanks kid! Come"
	line "back again" 
	cont "anytime!"
	done

TutorBButText:
	text "Thanks kid! Come"
	line "back again" 
	cont "anytime!"
	done
	
CianwoodMoveTutorYouDontHaveEnoughMoneyText:
	text "You don't have"
	line "enough money."
	done

CianwoodTutorMoveText:
	text_start
	done

PokeSeersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CIANWOOD_CITY, 7
	warp_event  3,  7, CIANWOOD_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodTutorScript, -1
