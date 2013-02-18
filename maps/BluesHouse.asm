BluesHouse_MapScriptHeader: ; 0x19b0ce
	; trigger count
	db 0

	; callback count
	db 0
; 0x19b0d0

UnknownScript_0x19b0d0: ; 0x19b0d0
	faceplayer
	loadfont
	checkcode $a
	if_equal $f, UnknownScript_0x19b0de
	2writetext UnknownText_0x19b130
	closetext
	loadmovesprites
	end
; 0x19b0de

UnknownScript_0x19b0de: ; 0x19b0de
	checkbit2 $005c
	iftrue UnknownScript_0x19b11e
	2writetext UnknownText_0x19b1b6
	yesorno
	iffalse UnknownScript_0x19b124
	2writetext UnknownText_0x19b244
	closetext
	special $0063
	if_equal $0, UnknownScript_0x19b124
	if_equal $1, UnknownScript_0x19b12a
	setbit2 $005c
	2writetext UnknownText_0x19b266
	closetext
	loadmovesprites
	special $002e
	playmusic $000d
	pause 60
	special $0031
	special $003d
	loadfont
	2writetext UnknownText_0x19b296
	special $0064
	keeptextopen
	2writetext UnknownText_0x19b2aa
	closetext
	loadmovesprites
	end
; 0x19b11e

UnknownScript_0x19b11e: ; 0x19b11e
	2writetext UnknownText_0x19b2fa
	closetext
	loadmovesprites
	end
; 0x19b124

UnknownScript_0x19b124: ; 0x19b124
	2writetext UnknownText_0x19b334
	closetext
	loadmovesprites
	end
; 0x19b12a

UnknownScript_0x19b12a: ; 0x19b12a
	2writetext UnknownText_0x19b377
	closetext
	loadmovesprites
	end
; 0x19b130

UnknownText_0x19b130: ; 0x19b130
	db $0, "DAISY: Hi! My kid", $4f
	db "brother is the GYM", $51
	db "LEADER in VIRIDIAN", $4f
	db "CITY.", $51
	db "But he goes out", $4f
	db "of town so often,", $51
	db "it causes problems", $4f
	db "for the trainers.", $57
; 0x19b1b6

UnknownText_0x19b1b6: ; 0x19b1b6
	db $0, "DAISY: Hi! Good", $4f
	db "timing. I'm about", $55
	db "to have some tea.", $51
	db "Would you like to", $4f
	db "join me?", $51
	db "Oh, your #MON", $4f
	db "are a bit dirty.", $51
	db "Would you like me", $4f
	db "to groom one?", $57
; 0x19b244

UnknownText_0x19b244: ; 0x19b244
	db $0, "DAISY: Which one", $4f
	db "should I groom?", $57
; 0x19b266

UnknownText_0x19b266: ; 0x19b266
	db $0, "DAISY: OK, I'll", $4f
	db "get it looking", $55
	db "nice in no time.", $57
; 0x19b296

UnknownText_0x19b296: ; 0x19b296
	text_from_ram $d099
	db $0, " looks", $4f
	db "content.", $57
; 0x19b2aa

UnknownText_0x19b2aa: ; 0x19b2aa
	db $0, "DAISY: There you", $4f
	db "go! All done.", $51
	db "See? Doesn't it", $4f
	db "look nice?", $51
	db "It's such a cute", $4f
	db "#MON.", $57
; 0x19b2fa

UnknownText_0x19b2fa: ; 0x19b2fa
	db $0, "DAISY: I always", $4f
	db "have tea around", $51
	db "this time. Come", $4f
	db "join me.", $57
; 0x19b334

UnknownText_0x19b334: ; 0x19b334
	db $0, "DAISY: You don't", $4f
	db "want to have one", $51
	db "groomed? OK, we'll", $4f
	db "just have tea.", $57
; 0x19b377

UnknownText_0x19b377: ; 0x19b377
	db $0, "DAISY: Oh, sorry.", $4f
	db "I honestly can't", $55
	db "groom an EGG.", $57
; 0x19b3a8

BluesHouse_MapEventHeader: ; 0x19b3a8
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_PALLET_TOWN, MAP_PALLET_TOWN
	warp_def $7, $3, 2, GROUP_PALLET_TOWN, MAP_PALLET_TOWN

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event $f, 7, 6, $3, $0, 255, 255, $0, 0, UnknownScript_0x19b0d0, $ffff
; 0x19b3c5

