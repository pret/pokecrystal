CeladonMansion3F_MapScriptHeader: ; 0x7166e
	; trigger count
	db 0

	; callback count
	db 0
; 0x71670

CooltrainerMScript_0x71670: ; 0x71670
	faceplayer
	loadfont
	2writetext UnknownText_0x716ce
	checkcode $5
	if_less_than $f8, UnknownScript_0x7167e
	closetext
	loadmovesprites
	end
; 0x7167e

UnknownScript_0x7167e: ; 0x7167e
	keeptextopen
	2writetext UnknownText_0x71725
	playsound $00a3
	waitbutton
	2writetext UnknownText_0x71760
	keeptextopen
	special $006b
	2writetext UnknownText_0x71763
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
	2writetext UnknownText_0x717b4
	closetext
	loadmovesprites
	end
; 0x716a4

UnknownScript_0x716a4: ; 0x716a4
	2writetext UnknownText_0x717d8
	yesorno
	iffalse UnknownScript_0x716b0
	special $006c
	loadmovesprites
	end
; 0x716b0

UnknownScript_0x716b0: ; 0x716b0
	2writetext UnknownText_0x71830
	closetext
	loadmovesprites
	end
; 0x716b6

UnknownScript_0x716b6: ; 0x716b6
	2writetext UnknownText_0x71863
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
	db $0, "Is that right?", $51
	db "I'm the GAME", $4f
	db "DESIGNER!", $51
	db "Filling up your", $4f
	db "#DEX is tough,", $55
	db "but don't give up!", $57
; 0x71725

UnknownText_0x71725: ; 0x71725
	db $0, "Wow! Excellent!", $4f
	db "You completed your", $55
	db "#DEX!", $51
	db "Congratulations!", $57
; 0x71760

UnknownText_0x71760: ; 0x71760
	db $0, "…", $57
; 0x71763

UnknownText_0x71763: ; 0x71763
	db $0, "The GRAPHIC ARTIST", $4f
	db "will print out a", $55
	db "DIPLOMA for you.", $51
	db "You should go show", $4f
	db "it off.", $57
; 0x717b4

UnknownText_0x717b4: ; 0x717b4
	db $0, "I'm the GRAPHIC", $4f
	db "ARTIST.", $51
	db "I drew you!", $57
; 0x717d8

UnknownText_0x717d8: ; 0x717d8
	db $0, "I'm the GRAPHIC", $4f
	db "ARTIST.", $51
	db "Oh, you completed", $4f
	db "your #DEX?", $51
	db "Want me to print", $4f
	db "out your DIPLOMA?", $57
; 0x71830

UnknownText_0x71830: ; 0x71830
	db $0, "Give me a shout if", $4f
	db "you want your", $55
	db "DIPLOMA printed.", $57
; 0x71863

UnknownText_0x71863: ; 0x71863
	db $0, "Something's wrong.", $4f
	db "I'll have to can-", $55
	db "cel printing.", $57
; 0x71895

UnknownText_0x71895: ; 0x71895
	db $0, "Who, me? I'm the", $4f
	db "PROGRAMMER.", $51
	db "Play the slot", $4f
	db "machines!", $57
; 0x718ca

UnknownText_0x718ca: ; 0x718ca
	db $0, "Aren't the TWINS", $4f
	db "adorable?", $51
	db "JASMINE's pretty", $4f
	db "too.", $51
	db "Oh, I love them!", $57
; 0x7190b

UnknownText_0x7190b: ; 0x7190b
	db $0, "GAME FREAK", $4f
	db "DEVELOPMENT ROOM", $57
; 0x71928

UnknownText_0x71928: ; 0x71928
	db $0, "It's a detailed", $4f
	db "drawing of a", $55
	db "pretty girl.", $57
; 0x71952

UnknownText_0x71952: ; 0x71952
	db $0, "It's the game", $4f
	db "program. Messing", $51
	db "with it could put", $4f
	db "a bug in the game!", $57
; 0x71996

UnknownText_0x71996: ; 0x71996
	db $0, "It's crammed with", $4f
	db "reference materi-", $55
	db "als. There's even", $55
	db "a # DOLL.", $57
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

