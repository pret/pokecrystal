Route12SuperRodHouse_MapScriptHeader: ; 0x7f482
	; trigger count
	db 0

	; callback count
	db 0
; 0x7f484

FishingGuruScript_0x7f484: ; 0x7f484
	faceplayer
	loadfont
	checkevent EVENT_GOT_SUPER_ROD
	iftrue UnknownScript_0x7f4a0
	writetext UnknownText_0x7f4af
	yesorno
	iffalse UnknownScript_0x7f4a6
	writetext UnknownText_0x7f52f
	keeptextopen
	verbosegiveitem SUPER_ROD, 1
	iffalse UnknownScript_0x7f4aa
	setevent EVENT_GOT_SUPER_ROD
UnknownScript_0x7f4a0: ; 0x7f4a0
	writetext UnknownText_0x7f57c
	closetext
	loadmovesprites
	end
; 0x7f4a6

UnknownScript_0x7f4a6: ; 0x7f4a6
	writetext UnknownText_0x7f5ec
	closetext
UnknownScript_0x7f4aa: ; 0x7f4aa
	loadmovesprites
	end
; 0x7f4ac

UnknownScript_0x7f4ac: ; 0x7f4ac
	jumpstd picturebookshelf
; 0x7f4af

UnknownText_0x7f4af: ; 0x7f4af
	text "I'm the FISHING"
	line "GURU's younger"
	cont "brother."

	para "I can see that you"
	line "like fishing."

	para "There's no doubt"
	line "in my mind at all!"

	para "So? I know I'm"
	line "right."
	done
; 0x7f52f

UnknownText_0x7f52f: ; 0x7f52f
	text "Yes, yes. Just as"
	line "I thought!"

	para "Here, fishing fan!"
	line "Take this--it's a"
	cont "SUPER ROD."
	done
; 0x7f57c

UnknownText_0x7f57c: ; 0x7f57c
	text "Try your hand at"
	line "fishing wherever"
	cont "there is water."

	para "Remember--you can"
	line "catch different"

	para "#MON using"
	line "different RODS."
	done
; 0x7f5ec

UnknownText_0x7f5ec: ; 0x7f5ec
	text "Huh? My own eyes"
	line "deceived me?"
	done
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
