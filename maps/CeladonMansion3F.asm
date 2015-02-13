CeladonMansion3F_MapScriptHeader: ; 0x7166e
	; trigger count
	db 0

	; callback count
	db 0
; 0x71670

CooltrainerMScript_0x71670: ; 0x71670
	faceplayer
	loadfont
	writetext UnknownText_0x716ce
	checkcode $5
	if_greater_than $f8, UnknownScript_0x7167e
	closetext
	loadmovesprites
	end
; 0x7167e

UnknownScript_0x7167e: ; 0x7167e
	keeptextopen
	writetext UnknownText_0x71725
	playsound SFX_DEX_FANFARE_230_PLUS
	waitbutton
	writetext UnknownText_0x71760
	keeptextopen
	special Functionc49f
	writetext UnknownText_0x71763
	closetext
	loadmovesprites
	setevent EVENT_ENABLE_DIPLOMA_PRINTING
	end
; 0x71696

GymGuyScript_0x71696: ; 0x71696
	faceplayer
	loadfont
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue UnknownScript_0x716a4
	writetext UnknownText_0x717b4
	closetext
	loadmovesprites
	end
; 0x716a4

UnknownScript_0x716a4: ; 0x716a4
	writetext UnknownText_0x717d8
	yesorno
	iffalse UnknownScript_0x716b0
	special Functionc4ac
	loadmovesprites
	end
; 0x716b0

UnknownScript_0x716b0: ; 0x716b0
	writetext UnknownText_0x71830
	closetext
	loadmovesprites
	end
; 0x716b6

UnknownScript_0x716b6: ; 0x716b6
	writetext UnknownText_0x71863
	closetext
	loadmovesprites
	end
; 0x716bc

SuperNerdScript_0x716bc: ; 0x716bc
	jumptextfaceplayer UnknownText_0x71895
; 0x716bf

FisherScript_0x716bf: ; 0x716bf
	jumptextfaceplayer UnknownText_0x718ca
; 0x716c2

MapCeladonMansion3FSignpost0Script: ; 0x716c2
	jumptext UnknownText_0x7190b
; 0x716c5

MapCeladonMansion3FSignpost1Script: ; 0x716c5
	jumptext UnknownText_0x71928
; 0x716c8

MapCeladonMansion3FSignpost2Script: ; 0x716c8
	jumptext UnknownText_0x71952
; 0x716cb

MapCeladonMansion3FSignpost3Script: ; 0x716cb
	jumptext UnknownText_0x71996
; 0x716ce

UnknownText_0x716ce: ; 0x716ce
	text "Is that right?"

	para "I'm the GAME"
	line "DESIGNER!"

	para "Filling up your"
	line "#DEX is tough,"
	cont "but don't give up!"
	done
; 0x71725

UnknownText_0x71725: ; 0x71725
	text "Wow! Excellent!"
	line "You completed your"
	cont "#DEX!"

	para "Congratulations!"
	done
; 0x71760

UnknownText_0x71760: ; 0x71760
	text "…"
	done
; 0x71763

UnknownText_0x71763: ; 0x71763
	text "The GRAPHIC ARTIST"
	line "will print out a"
	cont "DIPLOMA for you."

	para "You should go show"
	line "it off."
	done
; 0x717b4

UnknownText_0x717b4: ; 0x717b4
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "I drew you!"
	done
; 0x717d8

UnknownText_0x717d8: ; 0x717d8
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "Oh, you completed"
	line "your #DEX?"

	para "Want me to print"
	line "out your DIPLOMA?"
	done
; 0x71830

UnknownText_0x71830: ; 0x71830
	text "Give me a shout if"
	line "you want your"
	cont "DIPLOMA printed."
	done
; 0x71863

UnknownText_0x71863: ; 0x71863
	text "Something's wrong."
	line "I'll have to can-"
	cont "cel printing."
	done
; 0x71895

UnknownText_0x71895: ; 0x71895
	text "Who, me? I'm the"
	line "PROGRAMMER."

	para "Play the slot"
	line "machines!"
	done
; 0x718ca

UnknownText_0x718ca: ; 0x718ca
	text "Aren't the TWINS"
	line "adorable?"

	para "JASMINE's pretty"
	line "too."

	para "Oh, I love them!"
	done
; 0x7190b

UnknownText_0x7190b: ; 0x7190b
	text "GAME FREAK"
	line "DEVELOPMENT ROOM"
	done
; 0x71928

UnknownText_0x71928: ; 0x71928
	text "It's a detailed"
	line "drawing of a"
	cont "pretty girl."
	done
; 0x71952

UnknownText_0x71952: ; 0x71952
	text "It's the game"
	line "program. Messing"

	para "with it could put"
	line "a bug in the game!"
	done
; 0x71996

UnknownText_0x71996: ; 0x71996
	text "It's crammed with"
	line "reference materi-"
	cont "als. There's even"
	cont "a # DOLL."
	done
; 0x719d5

CeladonMansion3F_MapEventHeader: ; 0x719d5
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $0, 1, GROUP_CELADON_MANSION_ROOF, MAP_CELADON_MANSION_ROOF
	warp_def $0, $1, 2, GROUP_CELADON_MANSION_2F, MAP_CELADON_MANSION_2F
	warp_def $0, $6, 3, GROUP_CELADON_MANSION_2F, MAP_CELADON_MANSION_2F
	warp_def $0, $7, 2, GROUP_CELADON_MANSION_ROOF, MAP_CELADON_MANSION_ROOF

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 8, 5, $1, MapCeladonMansion3FSignpost0Script
	signpost 3, 4, $1, MapCeladonMansion3FSignpost1Script
	signpost 6, 1, $1, MapCeladonMansion3FSignpost2Script
	signpost 3, 1, $1, MapCeladonMansion3FSignpost3Script

	; people-events
	db 4
	person_event SPRITE_COOLTRAINER_M, 10, 7, $3, $0, 255, 255, $80, 0, CooltrainerMScript_0x71670, $ffff
	person_event SPRITE_GYM_GUY, 8, 7, $7, $0, 255, 255, $90, 0, GymGuyScript_0x71696, $ffff
	person_event SPRITE_SUPER_NERD, 11, 4, $7, $0, 255, 255, $90, 0, SuperNerdScript_0x716bc, $ffff
	person_event SPRITE_FISHER, 8, 4, $7, $2, 255, 255, $80, 0, FisherScript_0x716bf, $ffff
; 0x71a37

