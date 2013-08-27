CianwoodPharmacy_MapScriptHeader: ; 0x9df97
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x9df9d, $0000

	; callback count
	db 0
; 0x9df9d

UnknownScript_0x9df9d: ; 0x9df9d
	end
; 0x9df9e

PharmacistScript_0x9df9e: ; 0x9df9e
	faceplayer
	loadfont
	checkbit1 $0023
	iftrue UnknownScript_0x9dfc4
	checkbit1 $0037
	iffalse UnknownScript_0x9dfc4
	2writetext UnknownText_0x9dfcd
	keeptextopen
	giveitem SECRETPOTION, $1
	2writetext UnknownText_0x9e056
	playsound $0091
	waitbutton
	itemnotify
	setbit1 $0023
	2writetext UnknownText_0x9e070
	closetext
	loadmovesprites
	end
; 0x9dfc4

UnknownScript_0x9dfc4: ; 0x9dfc4
	pokemart $3, $0004
	loadmovesprites
	end
; 0x9dfca

MapCianwoodPharmacySignpost1Script: ; 0x9dfca
	jumpstd $0001
; 0x9dfcd

UnknownText_0x9dfcd: ; 0x9dfcd
	db $0, "Your #MON ap-", $4f
	db "pear to be fine.", $51
	db "Is something wor- ", $4f
	db "rying you?", $51
	db "…", $51
	db "The LIGHTHOUSE", $4f
	db "#MON is in", $55
	db "trouble?", $51
	db "I got it!", $51
	db "This ought to do", $4f
	db "the trick.", $57
; 0x9e056

UnknownText_0x9e056: ; 0x9e056
	db $0, $52, " received", $4f
	db "SECRETPOTION.", $57
; 0x9e070

UnknownText_0x9e070: ; 0x9e070
	db $0, "My SECRETPOTION is", $4f
	db "a tad too strong.", $51
	db "I only offer it in", $4f
	db "an emergency.", $57
; 0x9e0b7

CianwoodPharmacy_MapEventHeader: ; 0x9e0b7
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 4, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapCianwoodPharmacySignpost1Script
	signpost 1, 1, $0, MapCianwoodPharmacySignpost1Script

	; people-events
	db 1
	person_event SPRITE_PHARMACIST, 7, 6, $6, $0, 255, 255, $80, 0, PharmacistScript_0x9df9e, $ffff
; 0x9e0de

