CeladonMansionRoofHouse_MapScriptHeader: ; 0x71afb
	; trigger count
	db 0

	; callback count
	db 0
; 0x71afd

PharmacistScript_0x71afd: ; 0x71afd
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM03_CURSE
	iftrue UnknownScript_0x71b21
	writetext UnknownText_0x71b27
	keeptextopen
	checktime $4
	iftrue UnknownScript_0x71b14
	writetext UnknownText_0x71b4a
	closetext
	loadmovesprites
	end
; 0x71b14

UnknownScript_0x71b14: ; 0x71b14
	writetext UnknownText_0x71ba3
	keeptextopen
	verbosegiveitem TM_03, 1
	iffalse UnknownScript_0x71b25
	setevent EVENT_GOT_TM03_CURSE
UnknownScript_0x71b21: ; 0x71b21
	writetext UnknownText_0x71db3
	closetext
UnknownScript_0x71b25: ; 0x71b25
	loadmovesprites
	end
; 0x71b27

UnknownText_0x71b27: ; 0x71b27
	text "Let me recount a"
	line "terrifying tale…"
	done
; 0x71b4a

UnknownText_0x71b4a: ; 0x71b4a
	text "Then again, it's"
	line "not as scary while"

	para "it's still light"
	line "outside."

	para "Come back after"
	line "sunset, OK?"
	done
; 0x71ba3

UnknownText_0x71ba3: ; 0x71ba3
	text "Once upon a time,"
	line "there was a little"

	para "boy who was given"
	line "a new BICYCLE…"

	para "He wanted to try"
	line "it right away…"

	para "He was having so"
	line "much fun that he"

	para "didn't notice the"
	line "sun had set…"

	para "While riding home"
	line "in the pitch-black"

	para "night, the bike"
	line "suddenly slowed!"

	para "The pedals became"
	line "heavy!"

	para "When he stopped"
	line "pedaling, the bike"

	para "began slipping"
	line "backwards!"

	para "It was as if the"
	line "bike were cursed"

	para "and trying to drag"
	line "him into oblivion!"

	para "…"

	para "…"

	para "SHRIEEEEK!"

	para "The boy had been"
	line "riding uphill on"
	cont "CYCLING ROAD!"

	para "…"
	line "Ba-dum ba-dum!"

	para "For listening so"
	line "patiently, you may"
	cont "take this--TM03!"
	done
; 0x71db3

UnknownText_0x71db3: ; 0x71db3
	text "TM03 is CURSE."

	para "It's a terrifying"
	line "move that slowly"

	para "whittles down the"
	line "victim's HP."
	done
; 0x71e03

CeladonMansionRoofHouse_MapEventHeader: ; 0x71e03
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_CELADON_MANSION_ROOF, MAP_CELADON_MANSION_ROOF
	warp_def $7, $3, 3, GROUP_CELADON_MANSION_ROOF, MAP_CELADON_MANSION_ROOF

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_PHARMACIST, 6, 7, $6, $20, 255, 255, $a0, 0, PharmacistScript_0x71afd, $ffff
; 0x71e20
