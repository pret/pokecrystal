Route5CleanseTagSpeechHouse_MapScriptHeader: ; 0x18b632
	; trigger count
	db 0

	; callback count
	db 0
; 0x18b634

UnknownScript_0x18b634: ; 0x18b634
	faceplayer
	loadfont
	checkbit1 $00db
	iftrue UnknownScript_0x18b649
	2writetext UnknownText_0x18b655
	keeptextopen
	verbosegiveitem CLEANSE_TAG, 1
	iffalse UnknownScript_0x18b64d
	setbit1 $00db
UnknownScript_0x18b649: ; 0x18b649
	2writetext UnknownText_0x18b6a7
	closetext
UnknownScript_0x18b64d: ; 0x18b64d
	loadmovesprites
	end
; 0x18b64f

UnknownScript_0x18b64f: ; 0x18b64f
	jumptextfaceplayer UnknownText_0x18b6de
; 0x18b652

MapRoute5CleanseTagSpeechHouseSignpost1Script: ; 0x18b652
	jumpstd $0001
; 0x18b655

UnknownText_0x18b655: ; 0x18b655
	db $0, "Eeyaaaah!", $51
	db "I sense a sinister", $4f
	db "shadow hovering", $55
	db "over you.", $51
	db "Take this to ward", $4f
	db "it off!", $57
; 0x18b6a7

UnknownText_0x18b6a7: ; 0x18b6a7
	db $0, "You were in mortal", $4f
	db "danger, but you", $55
	db "are protected now.", $57
; 0x18b6de

UnknownText_0x18b6de: ; 0x18b6de
	db $0, "My grandma is into", $4f
	db "warding off what", $51
	db "she believes to be", $4f
	db "evil spirits.", $51
	db "I'm sorry that she", $4f
	db "startled you.", $57
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
	person_event $30, 9, 6, $1f, $0, 255, 255, $b0, 0, UnknownScript_0x18b634, $ffff
	person_event $29, 7, 9, $8, $0, 255, 255, $80, 0, UnknownScript_0x18b64f, $ffff
; 0x18b778



