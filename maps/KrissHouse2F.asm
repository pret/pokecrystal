KrissHouse2F_MapScriptHeader: ; 0x7abab
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x7abb4

	dbw 1, UnknownScript_0x7abc5
; 0x7abb3

UnknownScript_0x7abb3: ; 0x7abb3
	end
; 0x7abb4

UnknownScript_0x7abb4: ; 0x7abb4
	special $004a
	setbit1 $0007
	checkbit1 $0036
	iftrue UnknownScript_0x7abc4
	jumpstd $0018
	return
; 0x7abc4

UnknownScript_0x7abc4: ; 0x7abc4
	return
; 0x7abc5

UnknownScript_0x7abc5: ; 0x7abc5
	special $0049
	return
; 0x7abc9

INCBIN "baserom.gbc",$7abc9,$7abcc - $7abc9

UnknownScript_0x7abcc: ; 0x7abcc
	describedecoration $1
	describedecoration $2
	describedecoration $3
	describedecoration $4
	unknown0xcc
; 0x7abd5

INCBIN "baserom.gbc",$7abd5,$3d

MapKrissHouse2FSignpost2Script: ; 0x7ac12
	jumpstd $0002
; 0x7ac15

MapKrissHouse2FSignpost0Script: ; 0x7ac15
	loadfont
	special $001d
	iftrue UnknownScript_0x7ac1e
	loadmovesprites
	end
; 0x7ac1e

UnknownScript_0x7ac1e: ; 0x7ac1e
	warp 0, 0, $0, $0
	end
; 0x7ac24

UnknownText_0x7ac24: ; 0x7ac24
	db $0, "PROF.OAK'S #MON", $4f
	db "TALK! Please tune", $55
	db "in next time!", $57
; 0x7ac55

UnknownText_0x7ac55: ; 0x7ac55
	db $0, "#MON CHANNEL!", $57
; 0x7ac64

UnknownText_0x7ac64: ; 0x7ac64
	db $0, "This is DJ MARY,", $4f
	db "your co-host!", $57
; 0x7ac84

UnknownText_0x7ac84: ; 0x7ac84
	db $0, "#MON!", $4f
	db "#MON CHANNEL…", $57
; 0x7ac99

KrissHouse2F_MapEventHeader: ; 0x7ac99
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $0, $7, 3, GROUP_KRISS_HOUSE_1F, MAP_KRISS_HOUSE_1F

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 1, 2, $1, MapKrissHouse2FSignpost0Script
	signpost 1, 3, $0, $6bda
	signpost 1, 5, $0, MapKrissHouse2FSignpost2Script
	signpost 0, 6, $5, $6bd4

	; people-events
	db 4
	person_event $f0, 6, 8, $1, $0, 255, 255, $0, 0, $6bd2, $0741
	person_event $f1, 8, 8, $1, $0, 255, 255, $0, 0, UnknownScript_0x7abcc, $0742
	person_event $f2, 8, 9, $1, $0, 255, 255, $0, 0, $6bce, $0743
	person_event $f3, 5, 4, $21, $0, 255, 255, $0, 0, $6bd0, $0744
; 0x7acec

