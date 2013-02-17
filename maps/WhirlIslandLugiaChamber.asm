WhirlIslandLugiaChamber_MapScriptHeader: ; 0x18c4ff
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x18c504
; 0x18c504

UnknownScript_0x18c504: ; 0x18c504
	checkbit1 $0318
	iftrue UnknownScript_0x18c515
	checkitem SILVER_WING
	iftrue UnknownScript_0x18c512
	2jump UnknownScript_0x18c515
; 0x18c512

UnknownScript_0x18c512: ; 0x18c512
	appear $2
	return
; 0x18c515

UnknownScript_0x18c515: ; 0x18c515
	disappear $2
	return
; 0x18c518

UnknownScript_0x18c518: ; 0x18c518
	faceplayer
	loadfont
	2writetext UnknownText_0x18c531
	cry LUGIA
	pause 15
	loadmovesprites
	setbit1 $0318
	writecode $3, $a
	loadpokedata LUGIA, 60
	startbattle
	disappear $2
	returnafterbattle
	end
; 0x18c531

UnknownText_0x18c531: ; 0x18c531
	db $0, "Gyaaas!", $57
; 0x18c53a

WhirlIslandLugiaChamber_MapEventHeader: ; 0x18c53a
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $d, $9, 3, GROUP_WHIRL_ISLAND_B2F, MAP_WHIRL_ISLAND_B2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event $a1, 9, 13, $16, $0, 255, 255, $90, 0, UnknownScript_0x18c518, $073d
; 0x18c552

