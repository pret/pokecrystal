TinTowerRoof_MapScriptHeader: ; 0x7722b
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x77230
; 0x77230

UnknownScript_0x77230: ; 0x77230
	checkbit1 $0317
	iftrue UnknownScript_0x77241
	checkitem RAINBOW_WING
	iftrue UnknownScript_0x7723e
	2jump UnknownScript_0x77241
; 0x7723e

UnknownScript_0x7723e: ; 0x7723e
	appear $2
	return
; 0x77241

UnknownScript_0x77241: ; 0x77241
	disappear $2
	return
; 0x77244

UnknownScript_0x77244: ; 0x77244
	faceplayer
	loadfont
	2writetext UnknownText_0x77260
	cry HO_OH
	pause 15
	loadmovesprites
	setbit1 $0317
	writecode $3, $a
	loadpokedata HO_OH, 60
	startbattle
	disappear $2
	returnafterbattle
	setbit1 $07b7
	end
; 0x77260

UnknownText_0x77260: ; 0x77260
	db $0, "Shaoooh!", $57
; 0x7726a

TinTowerRoof_MapEventHeader: ; 0x7726a
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $d, $9, 4, GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event $a2, 9, 13, $16, $0, 255, 255, $80, 0, UnknownScript_0x77244, $073c
; 0x77282



