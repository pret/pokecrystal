LakeofRageHiddenPowerHouse_MapScriptHeader: ; 0x19a525
	; trigger count
	db 0

	; callback count
	db 0
; 0x19a527

UnknownScript_0x19a527: ; 0x19a527
	faceplayer
	loadfont
	checkbit1 $0058
	iftrue UnknownScript_0x19a542
	2writetext UnknownText_0x19a54b
	keeptextopen
	verbosegiveitem TM_10, 1
	iffalse UnknownScript_0x19a546
	setbit1 $0058
	2writetext UnknownText_0x19a5de
	closetext
	loadmovesprites
	end
; 0x19a542

UnknownScript_0x19a542: ; 0x19a542
	2writetext UnknownText_0x19a673
	closetext
UnknownScript_0x19a546: ; 0x19a546
	loadmovesprites
	end
; 0x19a548

MapLakeofRageHiddenPowerHouseSignpost1Script: ; 0x19a548
	jumpstd $0001
; 0x19a54b

UnknownText_0x19a54b: ; 0x19a54b
	db $0, "…You have strayed", $4f
	db "far…", $51
	db "Here I have medi-", $4f
	db "tated. Inside me,", $51
	db "a new power has", $4f
	db "been awakened.", $51
	db "Let me share my", $4f
	db "power with your", $51
	db "#MON.", $4f
	db "Take this, child.", $57
; 0x19a5de

UnknownText_0x19a5de: ; 0x19a5de
	db $0, "Do you see it? It", $4f
	db "is HIDDEN POWER!", $51
	db "It draws out the", $4f
	db "power of #MON", $55
	db "for attacking.", $51
	db "Remember this: its", $4f
	db "type and power de-", $55
	db "pend on the #-", $55
	db "MON using it.", $57
; 0x19a673

UnknownText_0x19a673: ; 0x19a673
	db $0, "I am meditating…", $57
; 0x19a685

LakeofRageHiddenPowerHouse_MapEventHeader: ; 0x19a685
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_LAKE_OF_RAGE, MAP_LAKE_OF_RAGE
	warp_def $7, $3, 1, GROUP_LAKE_OF_RAGE, MAP_LAKE_OF_RAGE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapLakeofRageHiddenPowerHouseSignpost1Script
	signpost 1, 1, $0, MapLakeofRageHiddenPowerHouseSignpost1Script

	; people-events
	db 1
	person_event $3a, 7, 6, $3, $0, 255, 255, $0, 0, UnknownScript_0x19a527, $ffff
; 0x19a6ac

