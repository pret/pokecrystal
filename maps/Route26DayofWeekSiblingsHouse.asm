Route26DayofWeekSiblingsHouse_MapScriptHeader: ; 0x7b1e2
	; trigger count
	db 0

	; callback count
	db 0
; 0x7b1e4

UnknownScript_0x7b1e4: ; 0x7b1e4
	loadfont
	2writetext UnknownText_0x7b1f9
	yesorno
	iffalse UnknownText_0x7b1f7
	2writetext UnknownText_0x7b222
	yesorno
	iffalse UnknownText_0x7b1f7
	2writetext UnknownText_0x7b2b9
	closetext
UnknownText_0x7b1f7: ; 0x7b1f7
	loadmovesprites
	end
; 0x7b1f9

UnknownText_0x7b1f9: ; 0x7b1f9
	db $0, "There's something", $4f
	db "written here.", $51
	db "Read it?", $57
; 0x7b222

UnknownText_0x7b222: ; 0x7b222
	db $0, "To my brothers and", $4f
	db "sisters:", $51
	db "We take pride in", $4f
	db "serving #MON", $55
	db "trainers.", $51
	db "When trainers talk", $4f
	db "to you, give them", $55
	db "something useful.", $51
	db "Love,", $4f
	db "MONICA", $51
	db "Keep reading?", $57
; 0x7b2b9

UnknownText_0x7b2b9: ; 0x7b2b9
	db $0, "Monday, MONICA", $4f
	db "ROUTE 40", $51
	db "Tuesday, TUSCANY", $4f
	db "ROUTE 29", $51
	db "Wednesday, WESLEY", $4f
	db "LAKE OF RAGE", $51
	db "Thursday, ARTHUR", $4f
	db "ROUTE 36", $51
	db "Friday, FRIEDA", $4f
	db "ROUTE 32", $51
	db "Saturday, SANTOS", $4f
	db "BLACKTHORN CITY", $51
	db "Sunday, SUNNY", $4f
	db "ROUTE 37", $57
; 0x7b375

Route26DayofWeekSiblingsHouse_MapEventHeader: ; 0x7b375
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_ROUTE_26, MAP_ROUTE_26
	warp_def $7, $3, 3, GROUP_ROUTE_26, MAP_ROUTE_26

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event $55, 7, 7, $1, $0, 255, 255, $0, 0, UnknownScript_0x7b1e4, $ffff
; 0x7b392

