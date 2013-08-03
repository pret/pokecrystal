CeruleanCity_MapScriptHeader: ; 0x184000
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x184005
; 0x184005

UnknownScript_0x184005: ; 0x184005
	setbit2 $0038
	return
; 0x184009

CooltrainerMScript_0x184009: ; 0x184009
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x184017
	2writetext UnknownText_0x1840bc
	closetext
	loadmovesprites
	end
; 0x184017

UnknownScript_0x184017: ; 0x184017
	2writetext UnknownText_0x184144
	closetext
	loadmovesprites
	end
; 0x18401d

SuperNerdScript_0x18401d: ; 0x18401d
	jumptextfaceplayer UnknownText_0x1841a8
; 0x184020

SlowpokeScript_0x184020: ; 0x184020
	loadfont
	2writetext UnknownText_0x1841e9
	cry SLOWBRO
	closetext
	loadmovesprites
	end
; 0x18402a

CooltrainerFScript_0x18402a: ; 0x18402a
	faceplayer
	loadfont
	2writetext UnknownText_0x1841fa
	closetext
	loadmovesprites
	spriteface $5, $2
	loadfont
	2writetext UnknownText_0x184229
	closetext
	loadmovesprites
	loadfont
	2writetext UnknownText_0x1841e9
	cry SLOWBRO
	closetext
	loadmovesprites
	loadfont
	2writetext UnknownText_0x18424b
	closetext
	loadmovesprites
	end
; 0x18404a

FisherScript_0x18404a: ; 0x18404a
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x184058
	checkbit1 $00cb
	iftrue UnknownScript_0x18405e
UnknownScript_0x184058: ; 0x184058
	2writetext UnknownText_0x18424e
	closetext
	loadmovesprites
	end
; 0x18405e

UnknownScript_0x18405e: ; 0x18405e
	2writetext UnknownText_0x184275
	closetext
	loadmovesprites
	end
; 0x184064

YoungsterScript_0x184064: ; 0x184064
	faceplayer
	loadfont
	2writetext UnknownText_0x1842a9
	closetext
	loadmovesprites
	checkbit1 $00fa
	iffalse UnknownScript_0x184072
	end
; 0x184072

UnknownScript_0x184072: ; 0x184072
	waitbutton
	playsound $0012
	waitbutton
	playsound $0022
	waitbutton
	playsound $0012
	waitbutton
	playsound $0022
	waitbutton
	playsound $0012
	waitbutton
	playsound $0022
	waitbutton
	playsound $0012
	waitbutton
	playsound $0022
	waitbutton
	showemote $0, $7, 15
	spriteface $7, $2
	loadfont
	2writetext UnknownText_0x1842ee
	closetext
	loadmovesprites
	end
; 0x1840a1

MapCeruleanCitySignpost0Script: ; 0x1840a1
	jumptext UnknownText_0x184312
; 0x1840a4

MapCeruleanCitySignpost1Script: ; 0x1840a4
	jumptext UnknownText_0x184345
; 0x1840a7

MapCeruleanCitySignpost2Script: ; 0x1840a7
	jumptext UnknownText_0x184381
; 0x1840aa

MapCeruleanCitySignpost3Script: ; 0x1840aa
	jumptext UnknownText_0x1843cc
; 0x1840ad

MapCeruleanCitySignpost4Script: ; 0x1840ad
	jumptext UnknownText_0x18443b
; 0x1840b0

MapCeruleanCitySignpost5Script: ; 0x1840b0
	jumptext UnknownText_0x184450
; 0x1840b3

MapCeruleanCitySignpost6Script: ; 0x1840b3
	jumpstd $0010
; 0x1840b6

MapCeruleanCitySignpost7Script: ; 0x1840b6
	jumpstd $0011
; 0x1840b9

MapCeruleanCitySignpostItem8: ; 0x1840b9
	dw $00fa
	db BERSERK_GENE
	
; 0x1840bc

UnknownText_0x1840bc: ; 0x1840bc
	db $0, "KANTO's POWER", $4f
	db "PLANT?", $51
	db "It's near the end", $4f
	db "of ROUTE 9, the", $51
	db "road that heads", $4f
	db "east from here.", $51
	db "I think there was", $4f
	db "an accident of", $55
	db "some sort there.", $57
; 0x184144

UnknownText_0x184144: ; 0x184144
	db $0, "You're collecting", $4f
	db "every single kind", $55
	db "of #MON?", $51
	db "That must be quite", $4f
	db "a challenge, but", $55
	db "it sounds fun too.", $57
; 0x1841a8

UnknownText_0x1841a8: ; 0x1841a8
	db $0, "The CAPE in the", $4f
	db "north is a good", $51
	db "place for dates.", $4f
	db "Girls like it!", $57
; 0x1841e9

UnknownText_0x1841e9: ; 0x1841e9
	db $0, "SLOWBRO: Yarah?", $57
; 0x1841fa

UnknownText_0x1841fa: ; 0x1841fa
	db $0, "My SLOWBRO and I", $4f
	db "make an awesome", $55
	db "combination!", $57
; 0x184229

UnknownText_0x184229: ; 0x184229
	db $0, "SLOWBRO, show me", $4f
	db "your CONFUSION!", $57
; 0x18424b

UnknownText_0x18424b: ; 0x18424b
	db $0, "…", $57
; 0x18424e

UnknownText_0x18424e: ; 0x18424e
	db $0, "I'm a huge fan of", $4f
	db "CERULEAN GYM's", $55
	db "MISTY.", $57
; 0x184275

UnknownText_0x184275: ; 0x184275
	db $0, "I saw this shady", $4f
	db "guy go off toward", $55
	db "CERULEAN's CAPE.", $57
; 0x1842a9

UnknownText_0x1842a9: ; 0x1842a9
	db $0, "There used to be a", $4f
	db "cave here that had", $51
	db "horribly powerful", $4f
	db "#MON in it.", $57
; 0x1842ee

UnknownText_0x1842ee: ; 0x1842ee
	db $0, "Ayuh?", $51
	db "My ITEMFINDER is", $4f
	db "responding…", $57
; 0x184312

UnknownText_0x184312: ; 0x184312
	db $0, "CERULEAN CITY", $51
	db "A Mysterious Blue", $4f
	db "Aura Surrounds It", $57
; 0x184345

UnknownText_0x184345: ; 0x184345
	db $0, "CERULEAN CITY", $4f
	db "#MON GYM", $55
	db "LEADER: MISTY", $51
	db "The Tomboyish", $4f
	db "Mermaid", $57
; 0x184381

UnknownText_0x184381: ; 0x184381
	db $0, "There's a notice", $4f
	db "here…", $51
	db "The BIKE SHOP has", $4f
	db "moved to GOLDENROD", $55
	db "CITY in JOHTO…", $57
; 0x1843cc

UnknownText_0x1843cc: ; 0x1843cc
	db $0, "There's a notice", $4f
	db "here…", $51
	db "Stamp out thievery", $4f
	db "and make the city", $51
	db "a friendlier, more", $4f
	db "cheerful place!", $51
	db "CERULEAN POLICE", $57
; 0x18443b

UnknownText_0x18443b: ; 0x18443b
	db $0, "CERULEAN CAPE", $4f
	db "AHEAD", $57
; 0x184450

UnknownText_0x184450: ; 0x184450
	db $0, "It's locked…", $57
; 0x18445d

CeruleanCity_MapEventHeader: ; 0x18445d
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $f, $7, 1, GROUP_CERULEAN_GYM_BADGE_SPEECH_HOUSE, MAP_CERULEAN_GYM_BADGE_SPEECH_HOUSE
	warp_def $11, $1c, 1, GROUP_CERULEAN_POLICE_STATION, MAP_CERULEAN_POLICE_STATION
	warp_def $13, $d, 1, GROUP_CERULEAN_TRADE_SPEECH_HOUSE, MAP_CERULEAN_TRADE_SPEECH_HOUSE
	warp_def $15, $13, 1, GROUP_CERULEAN_POKECENTER_1F, MAP_CERULEAN_POKECENTER_1F
	warp_def $17, $1e, 1, GROUP_CERULEAN_GYM, MAP_CERULEAN_GYM
	warp_def $1d, $19, 2, GROUP_CERULEAN_MART, MAP_CERULEAN_MART

	; xy triggers
	db 0

	; signposts
	db 9
	signpost 23, 23, $0, MapCeruleanCitySignpost0Script
	signpost 25, 27, $0, MapCeruleanCitySignpost1Script
	signpost 29, 11, $0, MapCeruleanCitySignpost2Script
	signpost 17, 25, $0, MapCeruleanCitySignpost3Script
	signpost 7, 23, $0, MapCeruleanCitySignpost4Script
	signpost 29, 14, $0, MapCeruleanCitySignpost5Script
	signpost 21, 20, $0, MapCeruleanCitySignpost6Script
	signpost 29, 26, $0, MapCeruleanCitySignpost7Script
	signpost 12, 2, $7, MapCeruleanCitySignpostItem8

	; people-events
	db 6
	person_event SPRITE_COOLTRAINER_M, 27, 19, $2, $22, 255, 255, $90, 0, CooltrainerMScript_0x184009, $ffff
	person_event SPRITE_SUPER_NERD, 19, 27, $2, $11, 255, 255, $90, 0, SuperNerdScript_0x18401d, $ffff
	person_event SPRITE_SLOWPOKE, 28, 24, $1, $0, 255, 255, $0, 0, SlowpokeScript_0x184020, $ffff
	person_event SPRITE_COOLTRAINER_F, 28, 25, $8, $0, 255, 255, $a0, 0, CooltrainerFScript_0x18402a, $ffff
	person_event SPRITE_FISHER, 30, 34, $5, $1, 255, 255, $80, 0, FisherScript_0x18404a, $ffff
	person_event SPRITE_YOUNGSTER, 16, 10, $3, $1, 255, 255, $80, 0, YoungsterScript_0x184064, $ffff
; 0x1844fc

