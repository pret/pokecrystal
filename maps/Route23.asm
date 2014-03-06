Route23_MapScriptHeader: ; 0x1ae52e
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1ae533
; 0x1ae533

UnknownScript_0x1ae533: ; 0x1ae533
	setflag $0040
	return
; 0x1ae537

MapRoute23Signpost0Script: ; 0x1ae537
	jumptext UnknownText_0x1ae53a
; 0x1ae53a

UnknownText_0x1ae53a: ; 0x1ae53a
	text "INDIGO PLATEAU"

	para "The Ultimate Goal"
	line "for Trainers!"

	para "#MON LEAGUE HQ"
	done
; 0x1ae579

Route23_MapEventHeader: ; 0x1ae579
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $5, $9, 1, GROUP_INDIGO_PLATEAU_POKECENTER_1F, MAP_INDIGO_PLATEAU_POKECENTER_1F
	warp_def $5, $a, 2, GROUP_INDIGO_PLATEAU_POKECENTER_1F, MAP_INDIGO_PLATEAU_POKECENTER_1F
	warp_def $d, $9, 10, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $d, $a, 10, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 7, 11, $0, MapRoute23Signpost0Script

	; people-events
	db 0
; 0x1ae598

