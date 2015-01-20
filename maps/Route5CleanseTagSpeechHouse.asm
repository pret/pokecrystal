Route5CleanseTagSpeechHouse_MapScriptHeader: ; 0x18b632
	; trigger count
	db 0

	; callback count
	db 0
; 0x18b634

GrannyScript_0x18b634: ; 0x18b634
	faceplayer
	loadfont
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue UnknownScript_0x18b649
	writetext UnknownText_0x18b655
	keeptextopen
	verbosegiveitem CLEANSE_TAG, 1
	iffalse UnknownScript_0x18b64d
	setevent EVENT_GOT_CLEANSE_TAG
UnknownScript_0x18b649: ; 0x18b649
	writetext UnknownText_0x18b6a7
	closetext
UnknownScript_0x18b64d: ; 0x18b64d
	loadmovesprites
	end
; 0x18b64f

TeacherScript_0x18b64f: ; 0x18b64f
	jumptextfaceplayer UnknownText_0x18b6de
; 0x18b652

MapRoute5CleanseTagSpeechHouseSignpost1Script: ; 0x18b652
	jumpstd $0001
; 0x18b655

UnknownText_0x18b655: ; 0x18b655
	text "Eeyaaaah!"

	para "I sense a sinister"
	line "shadow hovering"
	cont "over you."

	para "Take this to ward"
	line "it off!"
	done
; 0x18b6a7

UnknownText_0x18b6a7: ; 0x18b6a7
	text "You were in mortal"
	line "danger, but you"
	cont "are protected now."
	done
; 0x18b6de

UnknownText_0x18b6de: ; 0x18b6de
	text "My grandma is into"
	line "warding off what"

	para "she believes to be"
	line "evil spirits."

	para "I'm sorry that she"
	line "startled you."
	done
; 0x18b744

Route5CleanseTagSpeechHouse_MapEventHeader: ; 0x18b744
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_ROUTE_5, MAP_ROUTE_5
	warp_def $7, $3, 4, GROUP_ROUTE_5, MAP_ROUTE_5

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapRoute5CleanseTagSpeechHouseSignpost1Script
	signpost 1, 1, $0, MapRoute5CleanseTagSpeechHouseSignpost1Script

	; people-events
	db 2
	person_event SPRITE_GRANNY, 9, 6, $1f, $0, 255, 255, $b0, 0, GrannyScript_0x18b634, $ffff
	person_event SPRITE_TEACHER, 7, 9, $8, $0, 255, 255, $80, 0, TeacherScript_0x18b64f, $ffff
; 0x18b778



