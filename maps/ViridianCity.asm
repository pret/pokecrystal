ViridianCity_MapScriptHeader: ; 0x1a9a43
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a9a48
; 0x1a9a48

UnknownScript_0x1a9a48: ; 0x1a9a48
	setbit2 $0036
	return
; 0x1a9a4c

GrampsScript_0x1a9a4c: ; 0x1a9a4c
	faceplayer
	loadfont
	2writetext UnknownText_0x1a9aa5
	yesorno
	iffalse UnknownScript_0x1a9a5b
	2writetext UnknownText_0x1a9b6f
	closetext
	loadmovesprites
	end
; 0x1a9a5b

UnknownScript_0x1a9a5b: ; 0x1a9a5b
	2writetext UnknownText_0x1a9bb7
	closetext
	loadmovesprites
	end
; 0x1a9a61

GrampsScript_0x1a9a61: ; 0x1a9a61
	faceplayer
	loadfont
	checkbit1 $0775
	iftrue UnknownScript_0x1a9a6f
	2writetext UnknownText_0x1a9c11
	closetext
	loadmovesprites
	end
; 0x1a9a6f

UnknownScript_0x1a9a6f: ; 0x1a9a6f
	2writetext UnknownText_0x1a9c7e
	closetext
	loadmovesprites
	end
; 0x1a9a75

FisherScript_0x1a9a75: ; 0x1a9a75
	faceplayer
	loadfont
	checkbit1 EVENT_GOT_TM42_DREAM_EATER
	iftrue UnknownScript_0x1a9a8a
	2writetext UnknownText_0x1a9cc4
	keeptextopen
	verbosegiveitem TM_42, 1
	iffalse UnknownScript_0x1a9a8e
	setbit1 EVENT_GOT_TM42_DREAM_EATER
UnknownScript_0x1a9a8a: ; 0x1a9a8a
	2writetext UnknownText_0x1a9d86
	closetext
UnknownScript_0x1a9a8e: ; 0x1a9a8e
	loadmovesprites
	end
; 0x1a9a90

YoungsterScript_0x1a9a90: ; 0x1a9a90
	jumptextfaceplayer UnknownText_0x1a9daa
; 0x1a9a93

MapViridianCitySignpost0Script: ; 0x1a9a93
	jumptext UnknownText_0x1a9def
; 0x1a9a96

MapViridianCitySignpost1Script: ; 0x1a9a96
	jumptext UnknownText_0x1a9e1b
; 0x1a9a99

MapViridianCitySignpost2Script: ; 0x1a9a99
	jumptext UnknownText_0x1a9e60
; 0x1a9a9c

MapViridianCitySignpost3Script: ; 0x1a9a9c
	jumptext UnknownText_0x1a9e99
; 0x1a9a9f

MapViridianCitySignpost4Script: ; 0x1a9a9f
	jumpstd $0010
; 0x1a9aa2

MapViridianCitySignpost5Script: ; 0x1a9aa2
	jumpstd $0011
; 0x1a9aa5

UnknownText_0x1a9aa5: ; 0x1a9aa5
	db $0, "Hey, kid! I just", $4f
	db "had a double shot", $51
	db "of espresso, and", $4f
	db "I am wired!", $51
	db "I need to talk to", $4f
	db "someone, so you'll", $55
	db "have to do!", $51
	db "I might not look", $4f
	db "like much now, but", $51
	db "I was an expert at", $4f
	db "catching #MON.", $51
	db "Do you believe me?", $57
; 0x1a9b6f

UnknownText_0x1a9b6f: ; 0x1a9b6f
	db $0, "Good, good. Yes, I", $4f
	db "was something out", $51
	db "of the ordinary,", $4f
	db "let me tell you!", $57
; 0x1a9bb7

UnknownText_0x1a9bb7: ; 0x1a9bb7
	db $0, "What? You little", $4f
	db "whelp!", $51
	db "If I were just a", $4f
	db "bit younger, I'd", $51
	db "show you a thing", $4f
	db "or two. Humph!", $57
; 0x1a9c11

UnknownText_0x1a9c11: ; 0x1a9c11
	db $0, "This GYM didn't", $4f
	db "have a LEADER", $55
	db "until recently.", $51
	db "A young man from", $4f
	db "PALLET became the", $51
	db "LEADER, but he's", $4f
	db "often away.", $57
; 0x1a9c7e

UnknownText_0x1a9c7e: ; 0x1a9c7e
	db $0, "Are you going to", $4f
	db "battle the LEADER?", $51
	db "Good luck to you.", $4f
	db "You'll need it.", $57
; 0x1a9cc4

UnknownText_0x1a9cc4: ; 0x1a9cc4
	db $0, "Yawn!", $51
	db "I must have dozed", $4f
	db "off in the sun.", $51
	db "…I had this dream", $4f
	db "about a DROWZEE", $51
	db "eating my dream.", $4f
	db "Weird, huh?", $51
	db "Huh?", $4f
	db "What's this?", $51
	db "Where did this TM", $4f
	db "come from?", $51
	db "This is spooky!", $4f
	db "Here, you can have", $55
	db "this TM.", $57
; 0x1a9d86

UnknownText_0x1a9d86: ; 0x1a9d86
	db $0, "TM42 contains", $4f
	db "DREAM EATER…", $51
	db "…Zzzzz…", $57
; 0x1a9daa

UnknownText_0x1a9daa: ; 0x1a9daa
	db $0, "I heard that there", $4f
	db "are many items on", $51
	db "the ground in", $4f
	db "VIRIDIAN FOREST.", $57
; 0x1a9def

UnknownText_0x1a9def: ; 0x1a9def
	db $0, "VIRIDIAN CITY", $51
	db "The Eternally", $4f
	db "Green Paradise", $57
; 0x1a9e1b

UnknownText_0x1a9e1b: ; 0x1a9e1b
	db $0, "VIRIDIAN CITY", $4f
	db "#MON GYM", $55
	db "LEADER: …", $51
	db "The rest of the", $4f
	db "text is illegible…", $57
; 0x1a9e60

UnknownText_0x1a9e60: ; 0x1a9e60
	db $0, "WELCOME TO", $4f
	db "VIRIDIAN CITY,", $51
	db "THE GATEWAY TO", $4f
	db "INDIGO PLATEAU", $57
; 0x1a9e99

UnknownText_0x1a9e99: ; 0x1a9e99
	db $0, "TRAINER HOUSE", $51
	db "The Club for Top", $4f
	db "Trainer Battles", $57
; 0x1a9ec9

ViridianCity_MapEventHeader: ; 0x1a9ec9
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $7, $20, 1, GROUP_VIRIDIAN_GYM, MAP_VIRIDIAN_GYM
	warp_def $9, $15, 1, GROUP_VIRIDIAN_NICKNAME_SPEECH_HOUSE, MAP_VIRIDIAN_NICKNAME_SPEECH_HOUSE
	warp_def $f, $17, 1, GROUP_TRAINER_HOUSE_1F, MAP_TRAINER_HOUSE_1F
	warp_def $13, $1d, 2, GROUP_VIRIDIAN_MART, MAP_VIRIDIAN_MART
	warp_def $19, $17, 1, GROUP_VIRIDIAN_POKECENTER_1F, MAP_VIRIDIAN_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 6
	signpost 17, 17, $0, MapViridianCitySignpost0Script
	signpost 7, 27, $0, MapViridianCitySignpost1Script
	signpost 1, 19, $0, MapViridianCitySignpost2Script
	signpost 15, 21, $0, MapViridianCitySignpost3Script
	signpost 25, 24, $0, MapViridianCitySignpost4Script
	signpost 19, 30, $0, MapViridianCitySignpost5Script

	; people-events
	db 4
	person_event SPRITE_GRAMPS, 9, 22, $2, $22, 255, 255, $0, 0, GrampsScript_0x1a9a4c, $ffff
	person_event SPRITE_GRAMPS, 12, 34, $6, $0, 255, 255, $90, 0, GrampsScript_0x1a9a61, $ffff
	person_event SPRITE_FISHER, 27, 10, $6, $0, 255, 255, $80, 0, FisherScript_0x1a9a75, $ffff
	person_event SPRITE_YOUNGSTER, 25, 21, $2, $33, 255, 255, $a0, 0, YoungsterScript_0x1a9a90, $ffff
; 0x1a9f3a

