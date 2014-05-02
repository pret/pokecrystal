BluesHouse_MapScriptHeader: ; 0x19b0ce
	; trigger count
	db 0

	; callback count
	db 0
; 0x19b0d0

DaisyScript_0x19b0d0: ; 0x19b0d0
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
	checkflag $005c
	iftrue UnknownScript_0x19b11e
	2writetext UnknownText_0x19b1b6
	yesorno
	iffalse UnknownScript_0x19b124
	2writetext UnknownText_0x19b244
	closetext
	special $0063
	if_equal $0, UnknownScript_0x19b124
	if_equal $1, UnknownScript_0x19b12a
	setflag $005c
	2writetext UnknownText_0x19b266
	closetext
	loadmovesprites
	special $002e
	playmusic MUSIC_HEAL
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
	text "DAISY: Hi! My kid"
	line "brother is the GYM"

	para "LEADER in VIRIDIAN"
	line "CITY."

	para "But he goes out"
	line "of town so often,"

	para "it causes problems"
	line "for the trainers."
	done
; 0x19b1b6

UnknownText_0x19b1b6: ; 0x19b1b6
	text "DAISY: Hi! Good"
	line "timing. I'm about"
	cont "to have some tea."

	para "Would you like to"
	line "join me?"

	para "Oh, your #MON"
	line "are a bit dirty."

	para "Would you like me"
	line "to groom one?"
	done
; 0x19b244

UnknownText_0x19b244: ; 0x19b244
	text "DAISY: Which one"
	line "should I groom?"
	done
; 0x19b266

UnknownText_0x19b266: ; 0x19b266
	text "DAISY: OK, I'll"
	line "get it looking"
	cont "nice in no time."
	done
; 0x19b296

UnknownText_0x19b296: ; 0x19b296
	text_from_ram $d099
	text " looks"
	line "content."
	done
; 0x19b2aa

UnknownText_0x19b2aa: ; 0x19b2aa
	text "DAISY: There you"
	line "go! All done."

	para "See? Doesn't it"
	line "look nice?"

	para "It's such a cute"
	line "#MON."
	done
; 0x19b2fa

UnknownText_0x19b2fa: ; 0x19b2fa
	text "DAISY: I always"
	line "have tea around"

	para "this time. Come"
	line "join me."
	done
; 0x19b334

UnknownText_0x19b334: ; 0x19b334
	text "DAISY: You don't"
	line "want to have one"

	para "groomed? OK, we'll"
	line "just have tea."
	done
; 0x19b377

UnknownText_0x19b377: ; 0x19b377
	text "DAISY: Oh, sorry."
	line "I honestly can't"
	cont "groom an EGG."
	done
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
	person_event SPRITE_DAISY, 7, 6, $3, $0, 255, 255, $0, 0, DaisyScript_0x19b0d0, $ffff
; 0x19b3c5

