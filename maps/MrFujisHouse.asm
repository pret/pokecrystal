MrFujisHouse_MapScriptHeader: ; 0x7e8c8
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e8ca

UnknownScript_0x7e8ca: ; 0x7e8ca
	jumptextfaceplayer UnknownText_0x7e8f1
; 0x7e8cd

UnknownScript_0x7e8cd: ; 0x7e8cd
	jumptextfaceplayer UnknownText_0x7e940
; 0x7e8d0

UnknownScript_0x7e8d0: ; 0x7e8d0
	loadfont
	2writetext UnknownText_0x7e9b6
	cry PSYDUCK
	closetext
	loadmovesprites
	end
; 0x7e8da

UnknownScript_0x7e8da: ; 0x7e8da
	loadfont
	2writetext UnknownText_0x7e9c9
	cry NIDORINO
	closetext
	loadmovesprites
	end
; 0x7e8e4

UnknownScript_0x7e8e4: ; 0x7e8e4
	loadfont
	2writetext UnknownText_0x7e9da
	cry PIDGEY
	closetext
	loadmovesprites
	end
; 0x7e8ee

MapMrFujisHouseSignpost1Script: ; 0x7e8ee
	jumpstd $0001
; 0x7e8f1

UnknownText_0x7e8f1: ; 0x7e8f1
	db $0, "MR.FUJI does live", $4f
	db "here, but he's not", $51
	db "home now.", $51
	db "He should be at", $4f
	db "the SOUL HOUSE.", $57
; 0x7e940

UnknownText_0x7e940: ; 0x7e940
	db $0, "Some cold-hearted", $4f
	db "people stop caring", $55
	db "for their #MON.", $51
	db "Grandpa takes in", $4f
	db "the poor homeless", $51
	db "#MON and takes", $4f
	db "care of them.", $57
; 0x7e9b6

UnknownText_0x7e9b6: ; 0x7e9b6
	db $0, "PSYDUCK: Gu-guwa?", $57
; 0x7e9c9

UnknownText_0x7e9c9: ; 0x7e9c9
	db $0, "NIDORINO: Gyun!", $57
; 0x7e9da

UnknownText_0x7e9da: ; 0x7e9da
	db $0, "PIDGEY: Pijji!", $57
; 0x7e9ea

MrFujisHouse_MapEventHeader: ; 0x7e9ea
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $3, 2, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapMrFujisHouseSignpost1Script
	signpost 1, 1, $0, MapMrFujisHouseSignpost1Script

	; people-events
	db 5
	person_event $2b, 5, 8, $6, $0, 255, 255, $a0, 0, UnknownScript_0x7e8ca, $ffff
	person_event $28, 8, 7, $2, $11, 255, 255, $0, 0, UnknownScript_0x7e8cd, $ffff
	person_event $9d, 8, 11, $16, $0, 255, 255, $0, 0, UnknownScript_0x7e8d0, $ffff
	person_event $82, 9, 9, $16, $0, 255, 255, $90, 0, UnknownScript_0x7e8da, $ffff
	person_event $9e, 7, 5, $16, $0, 255, 255, $b0, 0, UnknownScript_0x7e8e4, $ffff
; 0x7ea45

