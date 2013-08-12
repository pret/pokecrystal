Route12SuperRodHouse_MapScriptHeader: ; 0x7f482
	; trigger count
	db 0

	; callback count
	db 0
; 0x7f484

FishingGuruScript_0x7f484: ; 0x7f484
	faceplayer
	loadfont
	checkbit1 $0019
	iftrue UnknownScript_0x7f4a0
	2writetext UnknownText_0x7f4af
	yesorno
	iffalse UnknownScript_0x7f4a6
	2writetext UnknownText_0x7f52f
	keeptextopen
	verbosegiveitem SUPER_ROD, 1
	iffalse UnknownScript_0x7f4aa
	setbit1 $0019
UnknownScript_0x7f4a0: ; 0x7f4a0
	2writetext UnknownText_0x7f57c
	closetext
	loadmovesprites
	end
; 0x7f4a6

UnknownScript_0x7f4a6: ; 0x7f4a6
	2writetext UnknownText_0x7f5ec
	closetext
UnknownScript_0x7f4aa: ; 0x7f4aa
	loadmovesprites
	end
; 0x7f4ac

UnknownScript_0x7f4ac: ; 0x7f4ac
	jumpstd $0002
; 0x7f4af

UnknownText_0x7f4af: ; 0x7f4af
	db $0, "I'm the FISHING", $4f
	db "GURU's younger", $55
	db "brother.", $51
	db "I can see that you", $4f
	db "like fishing.", $51
	db "There's no doubt", $4f
	db "in my mind at all!", $51
	db "So? I know I'm", $4f
	db "right.", $57
; 0x7f52f

UnknownText_0x7f52f: ; 0x7f52f
	db $0, "Yes, yes. Just as", $4f
	db "I thought!", $51
	db "Here, fishing fan!", $4f
	db "Take this--it's a", $55
	db "SUPER ROD.", $57
; 0x7f57c

UnknownText_0x7f57c: ; 0x7f57c
	db $0, "Try your hand at", $4f
	db "fishing wherever", $55
	db "there is water.", $51
	db "Remember--you can", $4f
	db "catch different", $51
	db "#MON using", $4f
	db "different RODS.", $57
; 0x7f5ec

UnknownText_0x7f5ec: ; 0x7f5ec
	db $0, "Huh? My own eyes", $4f
	db "deceived me?", $57
; 0x7f60b

Route12SuperRodHouse_MapEventHeader: ; 0x7f60b
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_12, MAP_ROUTE_12
	warp_def $7, $3, 1, GROUP_ROUTE_12, MAP_ROUTE_12

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_FISHING_GURU, 7, 9, $6, $0, 255, 255, $80, 0, FishingGuruScript_0x7f484, $ffff
; 0x7f628

