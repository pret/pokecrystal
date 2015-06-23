FuchsiaCity_MapScriptHeader: ; 0x194b19
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x194b1e
; 0x194b1e

UnknownScript_0x194b1e: ; 0x194b1e
	setflag $003e
	return
; 0x194b22

YoungsterScript_0x194b22: ; 0x194b22
	jumptextfaceplayer UnknownText_0x194b45
; 0x194b25

PokefanMScript_0x194b25: ; 0x194b25
	jumptextfaceplayer UnknownText_0x194b83
; 0x194b28

TeacherScript_0x194b28: ; 0x194b28
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
	jumpstd pokecentersign
; 0x194b40

MapFuchsiaCitySignpost7Script: ; 0x194b40
	jumpstd martsign
; 0x194b43

FruitTreeScript_0x194b43: ; 0x194b43
	fruittree $1e
; 0x194b45

UnknownText_0x194b45: ; 0x194b45
	text "One of the ELITE"
	line "FOUR used to be"

	para "the LEADER of"
	line "FUCHSIA's GYM."
	done
; 0x194b83

UnknownText_0x194b83: ; 0x194b83
	text "KOGA's daughter"
	line "succeeded him as"

	para "the GYM LEADER"
	line "after he joined"
	cont "the ELITE FOUR."
	done
; 0x194bd3

UnknownText_0x194bd3: ; 0x194bd3
	text "The SAFARI ZONE is"
	line "closed… It's sad,"

	para "considering it's"
	line "FUCHSIA's main"
	cont "attraction."
	done
; 0x194c22

UnknownText_0x194c22: ; 0x194c22
	text "FUCHSIA CITY"

	para "Behold! It's"
	line "Passion Pink!"
	done
; 0x194c4a

UnknownText_0x194c4a: ; 0x194c4a
	text "FUCHSIA CITY"
	line "#MON GYM"
	cont "LEADER: JANINE"

	para "The Poisonous"
	line "Ninja Master"
	done
; 0x194c8b

UnknownText_0x194c8b: ; 0x194c8b
	text "There's a notice"
	line "here…"

	para "SAFARI ZONE OFFICE"
	line "is closed until"
	cont "further notice."
	done
; 0x194cd5

UnknownText_0x194cd5: ; 0x194cd5
	text "SAFARI ZONE"
	line "WARDEN'S HOME"
	done
; 0x194cf0

UnknownText_0x194cf0: ; 0x194cf0
	text "The WARDEN is"
	line "traveling abroad."

	para "Therefore, the"
	line "SAFARI ZONE is"
	cont "closed."
	done
; 0x194d37

UnknownText_0x194d37: ; 0x194d37
	text "No littering."

	para "Please take your"
	line "waste with you."
	done
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
	person_event SPRITE_YOUNGSTER, 22, 27, $2, $11, 255, 255, $a0, 0, YoungsterScript_0x194b22, $ffff
	person_event SPRITE_POKEFAN_M, 12, 17, $2, $11, 255, 255, $b0, 0, PokefanMScript_0x194b25, $ffff
	person_event SPRITE_TEACHER, 18, 20, $2, $11, 255, 255, $80, 0, TeacherScript_0x194b28, $ffff
	person_event SPRITE_FRUIT_TREE, 5, 12, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x194b43, $ffff
; 0x194e00
