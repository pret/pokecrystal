FuchsiaCity_MapScriptHeader: ; 0x194b19
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x194b1e
; 0x194b1e

UnknownScript_0x194b1e: ; 0x194b1e
	setbit2 $003e
	return
; 0x194b22

UnknownScript_0x194b22: ; 0x194b22
	jumptextfaceplayer UnknownText_0x194b45
; 0x194b25

UnknownScript_0x194b25: ; 0x194b25
	jumptextfaceplayer UnknownText_0x194b83
; 0x194b28

UnknownScript_0x194b28: ; 0x194b28
	jumptextfaceplayer UnknownText_0x194bd3
; 0x194b2b

MapFuchsiaCitySignpost0Script: ; 0x194b2b
	jumptext UnknownText_0x194c22
; 0x194b2e

MapFuchsiaCitySignpost1Script: ; 0x194b2e
	jumptext UnknownText_0x194c4a
; 0x194b31

MapFuchsiaCitySignpost2Script: ; 0x194b31
	jumptext UnknownText_0x194c8b
; 0x194b34

MapFuchsiaCitySignpost3Script: ; 0x194b34
	jumptext UnknownText_0x194cd5
; 0x194b37

MapFuchsiaCitySignpost4Script: ; 0x194b37
	jumptext UnknownText_0x194cf0
; 0x194b3a

MapFuchsiaCitySignpost5Script: ; 0x194b3a
	jumptext UnknownText_0x194d37
; 0x194b3d

MapFuchsiaCitySignpost6Script: ; 0x194b3d
	jumpstd $0010
; 0x194b40

MapFuchsiaCitySignpost7Script: ; 0x194b40
	jumpstd $0011
; 0x194b43

UnknownScript_0x194b43: ; 0x194b43
	fruittree $1e
; 0x194b45

UnknownText_0x194b45: ; 0x194b45
	db $0, "One of the ELITE", $4f
	db "FOUR used to be", $51
	db "the LEADER of", $4f
	db "FUCHSIA's GYM.", $57
; 0x194b83

UnknownText_0x194b83: ; 0x194b83
	db $0, "KOGA's daughter", $4f
	db "succeeded him as", $51
	db "the GYM LEADER", $4f
	db "after he joined", $55
	db "the ELITE FOUR.", $57
; 0x194bd3

UnknownText_0x194bd3: ; 0x194bd3
	db $0, "The SAFARI ZONE is", $4f
	db "closed… It's sad,", $51
	db "considering it's", $4f
	db "FUCHSIA's main", $55
	db "attraction.", $57
; 0x194c22

UnknownText_0x194c22: ; 0x194c22
	db $0, "FUCHSIA CITY", $51
	db "Behold! It's", $4f
	db "Passion Pink!", $57
; 0x194c4a

UnknownText_0x194c4a: ; 0x194c4a
	db $0, "FUCHSIA CITY", $4f
	db "#MON GYM", $55
	db "LEADER: JANINE", $51
	db "The Poisonous", $4f
	db "Ninja Master", $57
; 0x194c8b

UnknownText_0x194c8b: ; 0x194c8b
	db $0, "There's a notice", $4f
	db "here…", $51
	db "SAFARI ZONE OFFICE", $4f
	db "is closed until", $55
	db "further notice.", $57
; 0x194cd5

UnknownText_0x194cd5: ; 0x194cd5
	db $0, "SAFARI ZONE", $4f
	db "WARDEN'S HOME", $57
; 0x194cf0

UnknownText_0x194cf0: ; 0x194cf0
	db $0, "The WARDEN is", $4f
	db "traveling abroad.", $51
	db "Therefore, the", $4f
	db "SAFARI ZONE is", $55
	db "closed.", $57
; 0x194d37

UnknownText_0x194d37: ; 0x194d37
	db $0, "No littering.", $51
	db "Please take your", $4f
	db "waste with you.", $57
; 0x194d67

FuchsiaCity_MapEventHeader: ; 0x194d67
	; filler
	db 0, 0

	; warps
	db 11
	warp_def $d, $5, 2, GROUP_FUCHSIA_MART, MAP_FUCHSIA_MART
	warp_def $d, $16, 1, GROUP_SAFARI_ZONE_MAIN_OFFICE, MAP_SAFARI_ZONE_MAIN_OFFICE
	warp_def $1b, $8, 1, GROUP_FUCHSIA_GYM, MAP_FUCHSIA_GYM
	warp_def $1b, $b, 1, GROUP_FUCHSIA_BILL_SPEECH_HOUSE, MAP_FUCHSIA_BILL_SPEECH_HOUSE
	warp_def $1b, $13, 1, GROUP_FUCHSIA_POKECENTER_1F, MAP_FUCHSIA_POKECENTER_1F
	warp_def $1b, $1b, 1, GROUP_SAFARI_ZONE_WARDENS_HOME, MAP_SAFARI_ZONE_WARDENS_HOME
	warp_def $3, $12, 3, GROUP_SAFARI_ZONE_FUCHSIA_GATE_BETA, MAP_SAFARI_ZONE_FUCHSIA_GATE_BETA
	warp_def $16, $25, 1, GROUP_ROUTE_15_FUCHSIA_GATE, MAP_ROUTE_15_FUCHSIA_GATE
	warp_def $17, $25, 2, GROUP_ROUTE_15_FUCHSIA_GATE, MAP_ROUTE_15_FUCHSIA_GATE
	warp_def $23, $7, 1, GROUP_ROUTE_19___FUCHSIA_GATE, MAP_ROUTE_19___FUCHSIA_GATE
	warp_def $23, $8, 2, GROUP_ROUTE_19___FUCHSIA_GATE, MAP_ROUTE_19___FUCHSIA_GATE

	; xy triggers
	db 0

	; signposts
	db 8
	signpost 15, 21, $0, MapFuchsiaCitySignpost0Script
	signpost 29, 5, $0, MapFuchsiaCitySignpost1Script
	signpost 15, 25, $0, MapFuchsiaCitySignpost2Script
	signpost 29, 27, $0, MapFuchsiaCitySignpost3Script
	signpost 5, 17, $0, MapFuchsiaCitySignpost4Script
	signpost 15, 13, $0, MapFuchsiaCitySignpost5Script
	signpost 27, 20, $0, MapFuchsiaCitySignpost6Script
	signpost 13, 6, $0, MapFuchsiaCitySignpost7Script

	; people-events
	db 4
	person_event $27, 22, 27, $2, $11, 255, 255, $a0, 0, UnknownScript_0x194b22, $ffff
	person_event $2d, 12, 17, $2, $11, 255, 255, $b0, 0, UnknownScript_0x194b25, $ffff
	person_event $29, 18, 20, $2, $11, 255, 255, $80, 0, UnknownScript_0x194b28, $ffff
	person_event $5d, 5, 12, $1, $0, 255, 255, $0, 0, UnknownScript_0x194b43, $ffff
; 0x194e00

