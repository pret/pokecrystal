Route5UndergroundEntrance_MapScriptHeader: ; 0x18b553
	; trigger count
	db 0

	; callback count
	db 0
; 0x18b555

UnknownScript_0x18b555: ; 0x18b555
	jumptextfaceplayer UnknownText_0x18b558
; 0x18b558

UnknownText_0x18b558: ; 0x18b558
	db $0, "Many cities in", $4f
	db "JOHTO have long", $51
	db "histories. I'd", $4f
	db "love to visit!", $57
; 0x18b595

Route5UndergroundEntrance_MapEventHeader: ; 0x18b595
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_ROUTE_5, MAP_ROUTE_5
	warp_def $7, $4, 1, GROUP_ROUTE_5, MAP_ROUTE_5
	warp_def $3, $4, 1, GROUP_UNDERGROUND, MAP_UNDERGROUND

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event $29, 6, 6, $2, $11, 255, 255, $a0, 0, UnknownScript_0x18b555, $ffff
; 0x18b5b7

