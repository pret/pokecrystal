CeruleanCity_MapScriptHeader: ; 0x184000
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x184005
; 0x184005

UnknownScript_0x184005: ; 0x184005
	setflag $0038
	return
; 0x184009

CooltrainerMScript_0x184009: ; 0x184009
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x184017
	writetext UnknownText_0x1840bc
	closetext
	loadmovesprites
	end
; 0x184017

UnknownScript_0x184017: ; 0x184017
	writetext UnknownText_0x184144
	closetext
	loadmovesprites
	end
; 0x18401d

SuperNerdScript_0x18401d: ; 0x18401d
	jumptextfaceplayer UnknownText_0x1841a8
; 0x184020

SlowpokeScript_0x184020: ; 0x184020
	loadfont
	writetext UnknownText_0x1841e9
	cry SLOWBRO
	closetext
	loadmovesprites
	end
; 0x18402a

CooltrainerFScript_0x18402a: ; 0x18402a
	faceplayer
	loadfont
	writetext UnknownText_0x1841fa
	closetext
	loadmovesprites
	spriteface $5, $2
	loadfont
	writetext UnknownText_0x184229
	closetext
	loadmovesprites
	loadfont
	writetext UnknownText_0x1841e9
	cry SLOWBRO
	closetext
	loadmovesprites
	loadfont
	writetext UnknownText_0x18424b
	closetext
	loadmovesprites
	end
; 0x18404a

FisherScript_0x18404a: ; 0x18404a
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x184058
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue UnknownScript_0x18405e
UnknownScript_0x184058: ; 0x184058
	writetext UnknownText_0x18424e
	closetext
	loadmovesprites
	end
; 0x18405e

UnknownScript_0x18405e: ; 0x18405e
	writetext UnknownText_0x184275
	closetext
	loadmovesprites
	end
; 0x184064

YoungsterScript_0x184064: ; 0x184064
	faceplayer
	loadfont
	writetext UnknownText_0x1842a9
	closetext
	loadmovesprites
	checkevent $00fa
	iffalse UnknownScript_0x184072
	end
; 0x184072

UnknownScript_0x184072: ; 0x184072
	waitbutton
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitbutton
	playsound SFX_TRANSACTION
	waitbutton
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitbutton
	playsound SFX_TRANSACTION
	waitbutton
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitbutton
	playsound SFX_TRANSACTION
	waitbutton
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitbutton
	playsound SFX_TRANSACTION
	waitbutton
	showemote $0, $7, 15
	spriteface $7, $2
	loadfont
	writetext UnknownText_0x1842ee
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
	jumpstd pokecentersign
; 0x1840b6

MapCeruleanCitySignpost7Script: ; 0x1840b6
	jumpstd martsign
; 0x1840b9

MapCeruleanCitySignpostItem8: ; 0x1840b9
	dw $00fa
	db BERSERK_GENE
	
; 0x1840bc

UnknownText_0x1840bc: ; 0x1840bc
	text "KANTO's POWER"
	line "PLANT?"

	para "It's near the end"
	line "of ROUTE 9, the"

	para "road that heads"
	line "east from here."

	para "I think there was"
	line "an accident of"
	cont "some sort there."
	done
; 0x184144

UnknownText_0x184144: ; 0x184144
	text "You're collecting"
	line "every single kind"
	cont "of #MON?"

	para "That must be quite"
	line "a challenge, but"
	cont "it sounds fun too."
	done
; 0x1841a8

UnknownText_0x1841a8: ; 0x1841a8
	text "The CAPE in the"
	line "north is a good"

	para "place for dates."
	line "Girls like it!"
	done
; 0x1841e9

UnknownText_0x1841e9: ; 0x1841e9
	text "SLOWBRO: Yarah?"
	done
; 0x1841fa

UnknownText_0x1841fa: ; 0x1841fa
	text "My SLOWBRO and I"
	line "make an awesome"
	cont "combination!"
	done
; 0x184229

UnknownText_0x184229: ; 0x184229
	text "SLOWBRO, show me"
	line "your CONFUSION!"
	done
; 0x18424b

UnknownText_0x18424b: ; 0x18424b
	text "…"
	done
; 0x18424e

UnknownText_0x18424e: ; 0x18424e
	text "I'm a huge fan of"
	line "CERULEAN GYM's"
	cont "MISTY."
	done
; 0x184275

UnknownText_0x184275: ; 0x184275
	text "I saw this shady"
	line "guy go off toward"
	cont "CERULEAN's CAPE."
	done
; 0x1842a9

UnknownText_0x1842a9: ; 0x1842a9
	text "There used to be a"
	line "cave here that had"

	para "horribly powerful"
	line "#MON in it."
	done
; 0x1842ee

UnknownText_0x1842ee: ; 0x1842ee
	text "Ayuh?"

	para "My ITEMFINDER is"
	line "responding…"
	done
; 0x184312

UnknownText_0x184312: ; 0x184312
	text "CERULEAN CITY"

	para "A Mysterious Blue"
	line "Aura Surrounds It"
	done
; 0x184345

UnknownText_0x184345: ; 0x184345
	text "CERULEAN CITY"
	line "#MON GYM"
	cont "LEADER: MISTY"

	para "The Tomboyish"
	line "Mermaid"
	done
; 0x184381

UnknownText_0x184381: ; 0x184381
	text "There's a notice"
	line "here…"

	para "The BIKE SHOP has"
	line "moved to GOLDENROD"
	cont "CITY in JOHTO…"
	done
; 0x1843cc

UnknownText_0x1843cc: ; 0x1843cc
	text "There's a notice"
	line "here…"

	para "Stamp out thievery"
	line "and make the city"

	para "a friendlier, more"
	line "cheerful place!"

	para "CERULEAN POLICE"
	done
; 0x18443b

UnknownText_0x18443b: ; 0x18443b
	text "CERULEAN CAPE"
	line "AHEAD"
	done
; 0x184450

UnknownText_0x184450: ; 0x184450
	text "It's locked…"
	done
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
