const_value set 2
	const ROUTE2NUGGETSPEECHHOUSE_FISHER

Route2NuggetSpeechHouse_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

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

Route2NuggetSpeechHouseBookshelf:
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

Route2NuggetSpeechHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 1, ROUTE_2
	warp_def 3, 7, 1, ROUTE_2

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 2, 4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FisherScript_0x9b847, -1
