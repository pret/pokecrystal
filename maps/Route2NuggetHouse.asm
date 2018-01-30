const_value set 2
	const ROUTE2NUGGETHOUSE_FISHER

Route2NuggetHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FisherScript_0x9b847:
	faceplayer
	opentext
	checkevent EVENT_GOT_NUGGET_FROM_GUY
	iftrue .GotItem
	writetext UnknownText_0x9b865
	buttonsound
	verbosegiveitem NUGGET
	iffalse .Done
	setevent EVENT_GOT_NUGGET_FROM_GUY
.GotItem:
	writetext UnknownText_0x9b8e5
	waitbutton
.Done:
	closetext
	end

Route2NuggetHouseBookshelf:
; unused
	jumpstd difficultbookshelf

UnknownText_0x9b865:
	text "Hi! Wow, I'm glad"
	line "to see you."

	para "You're the first"
	line "visitor I've had"
	cont "in a long time."

	para "I'm super-happy!"
	line "Let me give you a"
	cont "little present."
	done

UnknownText_0x9b8e5:
	text "That's a NUGGET."

	para "I can't give you"
	line "any nuggets of"

	para "wisdom, so that'll"
	line "have to do!"
	done

Route2NuggetHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, 1, ROUTE_2
	warp_event 3, 7, 1, ROUTE_2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 2, 4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FisherScript_0x9b847, -1
