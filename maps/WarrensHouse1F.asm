	object_const_def
	const WARRENSHOUSE1F_WARREN_MORNDAY ; [E-1]
	const WARRENSHOUSE1F_WARREN_EVENITE ; [E-2]
	const WARRENSHOUSE1F_CLARISSA_MORN ; [E-3]
	const WARRENSHOUSE1F_CLARISSA_EVE ; [E-4]

WarrensHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks
	
WarrenMornDayScript: ; [E-1]
	faceplayer
	opentext
	checktime MORN
	iftrue .WarrenMornScript
	checktime DAY
	iftrue .WarrenDayScript

.WarrenMornScript: ; [E-1]
	writetext WarrenMornIntroText
	promptbutton
	sjump .WarrenMornDayMain

.WarrenDayScript: ; [E-1]
	writetext WarrenDayIntroText
	promptbutton
	sjump .WarrenMornDayMain
	
.WarrenMornDayMain: ; [E-1]
	writetext WarrenMornDayMainText
	waitbutton
	closetext
	turnobject WARRENSHOUSE1F_WARREN_MORNDAY, LEFT
	end
	
WarrenEveNiteScript: ; [E-2]
	faceplayer
	opentext
	checktime EVE | NITE
	iftrue .WarrenEveNiteScript
	
.WarrenEveNiteScript: ; [E-2]
	writetext WarrenEveNiteText
	waitbutton
	sjump .WarrenEveNiteEnd
	
.WarrenEveNiteEnd: ; [E-2]
	closetext
	turnobject WARRENSHOUSE1F_WARREN_EVENITE, UP
	end
	
ClarissaMornScript: ; [E-3]
	faceplayer
	opentext
	writetext ClarissaMornText
	waitbutton
	closetext
	turnobject WARRENSHOUSE1F_CLARISSA_MORN, RIGHT
	end
	
ClarissaEveScript: ; [E-4]
	faceplayer
	opentext
	writetext ClarissaEveText
	waitbutton
	closetext
	turnobject WARRENSHOUSE1F_CLARISSA_EVE, UP
	end
	
WarrenMornIntroText: ; [E-1]
	text "Warren: Good"
	line "morning, <PLAY_G>!"
	done
	
WarrenDayIntroText: ; [E-1]
	text "Warren: Good"
	line "afternoon, "
	cont "<PLAY_G>."
	done
	
WarrenMornDayMainText: ; [E-1]
	text "Our granddaughter"
	line "comes to visit us"
	cont "on weekends."
	
	para "We had our old"
	line "home theater"
	
	para "renovated into a"
	line "room for her."
	
	para "She wants to be a"
	line "#MON trainer"
	cont "like you!"
	done
	
WarrenEveNiteText: ; [E-2]
	text "Warren: This"
	line "is one of my"
	cont "favorite episodes."
	done
	
ClarissaMornText: ; [E-3]
	text "Clarissa: Good"
	line "morning <PLAY_G>."
	
	para "How are you doing"
	line "today?"
	done
	
ClarissaEveText: ; [E-4]
	text "Clarissa: Good"
	line "evening <PLAY_G>."
	
	para "We're having"
	line "pasta tonight."
	
	para "Do you want to"
	line "join us?"
	done

WarrensHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 0, 0, WARRENS_HOUSE_2F, 1
	warp_event 4, 7, SALTBREEZE_TOWN, 3
	warp_event 5, 7, SALTBREEZE_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, MORN | DAY, 0, OBJECTTYPE_SCRIPT, 0, WarrenMornDayScript, -1
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, EVE | NITE, 0, OBJECTTYPE_SCRIPT, 0, WarrenEveNiteScript, -1
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, ClarissaMornScript, -1
	object_event  12, 2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, EVE, 0, OBJECTTYPE_SCRIPT, 0, ClarissaEveScript, -1
