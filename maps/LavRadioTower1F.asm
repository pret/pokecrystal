LavRadioTower1F_MapScriptHeader: ; 0x7ee61
	; trigger count
	db 0

	; callback count
	db 0
; 0x7ee63

ReceptionistScript_0x7ee63: ; 0x7ee63
	jumptextfaceplayer UnknownText_0x7eebf
; 0x7ee66

OfficerScript_0x7ee66: ; 0x7ee66
	jumptextfaceplayer UnknownText_0x7eefa
; 0x7ee69

SuperNerdScript_0x7ee69: ; 0x7ee69
	jumptextfaceplayer UnknownText_0x7ef90
; 0x7ee6c

GentlemanScript_0x7ee6c: ; 0x7ee6c
	faceplayer
	loadfont
	checkflag $0003
	iftrue .UnknownScript_0x7ee8e
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .UnknownScript_0x7ee80
	2writetext UnknownText_0x7effb
	closetext
	loadmovesprites
	end
; 0x7ee80

.UnknownScript_0x7ee80: ; 0x7ee80
	2writetext UnknownText_0x7f0a1
	keeptextopen
	stringtotext .expncardname, $1
	2call .UnknownScript_0x7ee94
	setflag $0003
.UnknownScript_0x7ee8e ; 0x7ee8e
	2writetext UnknownText_0x7f141
	closetext
	loadmovesprites
	end
; 0x7ee94

.UnknownScript_0x7ee94 ; 0x7ee94
	jumpstd $002f
	end
; 0x7ee98

.expncardname ; 0x7ee98
	db "EXPN CARD@"
; 0x7eea2

SuperNerdScript_0x7eea2: ; 0x7eea2
	faceplayer
	loadfont
	checkflag $0003
	iftrue UnknownScript_0x7eeb0
	2writetext UnknownText_0x7f193
	closetext
	loadmovesprites
	end
; 0x7eeb0

UnknownScript_0x7eeb0: ; 0x7eeb0
	2writetext UnknownText_0x7f248
	closetext
	loadmovesprites
	end
; 0x7eeb6

MapLavRadioTower1FSignpost0Script: ; 0x7eeb6
	jumptext UnknownText_0x7f2e3
; 0x7eeb9

MapLavRadioTower1FSignpost1Script: ; 0x7eeb9
	jumptext UnknownText_0x7f32d
; 0x7eebc

UnknownScript_0x7eebc: ; 0x7eebc
	jumptext UnknownText_0x7f36b
; 0x7eebf

UnknownText_0x7eebf: ; 0x7eebf
	db $0, "Welcome!", $4f
	db "Feel free to look", $51
	db "around anywhere on", $4f
	db "this floor.", $57
; 0x7eefa

UnknownText_0x7eefa: ; 0x7eefa
	db $0, "Sorry, but you can", $4f
	db "only tour the", $55
	db "ground floor.", $51
	db "Ever since JOHTO's", $4f
	db "RADIO TOWER was", $51
	db "taken over by a", $4f
	db "criminal gang, we", $51
	db "have had to step", $4f
	db "up our security.", $57
; 0x7ef90

UnknownText_0x7ef90: ; 0x7ef90
	db $0, "Many people are", $4f
	db "hard at work here", $51
	db "in the RADIO", $4f
	db "TOWER.", $51
	db "They must be doing", $4f
	db "their best to put", $55
	db "on good shows.", $57
; 0x7effb

UnknownText_0x7effb: ; 0x7effb
	db $0, "Oh, no, no, no!", $51
	db "We've been off the", $4f
	db "air ever since the", $51
	db "POWER PLANT shut", $4f
	db "down.", $51
	db "All my efforts to", $4f
	db "start this station", $51
	db "would be wasted if", $4f
	db "I can't broadcast.", $51
	db "I'll be ruined!", $57
; 0x7f0a1

UnknownText_0x7f0a1: ; 0x7f0a1
	db $0, "Ah! So you're the", $4f
	db $14, " who solved", $51
	db "the POWER PLANT's", $4f
	db "problem?", $51
	db "Thanks to you, I", $4f
	db "never lost my job.", $51
	db "I tell you, you're", $4f
	db "a real lifesaver!", $51
	db "Please take this", $4f
	db "as my thanks.", $57
; 0x7f141

UnknownText_0x7f141: ; 0x7f141
	db $0, "With that thing,", $4f
	db "you can tune into", $51
	db "the radio programs", $4f
	db "here in KANTO.", $51
	db "Gahahahaha!", $57
; 0x7f193

UnknownText_0x7f193: ; 0x7f193
	db $0, "Hey there!", $51
	db "I am the super", $4f
	db "MUSIC DIRECTOR!", $51
	db "Huh? Your #GEAR", $4f
	db "can't tune into my", $51
	db "music programs.", $4f
	db "How unfortunate!", $51
	db "If you get an EXPN", $4f
	db "CARD upgrade, you", $51
	db "can tune in. You'd", $4f
	db "better get one!", $57
; 0x7f248

UnknownText_0x7f248: ; 0x7f248
	db $0, "Hey there!", $51
	db "I am the super", $4f
	db "MUSIC DIRECTOR!", $51
	db "I'm responsible", $4f
	db "for the gorgeous", $51
	db "melodies that go", $4f
	db "out over the air.", $51
	db "Don't be square.", $4f
	db "Grab your music", $55
	db "off the air!", $57
; 0x7f2e3

UnknownText_0x7f2e3: ; 0x7f2e3
	db $0, "1F RECEPTION", $4f
	db "2F SALES", $51
	db "3F PERSONNEL", $4f
	db "4F PRODUCTION", $51
	db "5F DIRECTOR'S", $4f
	db "   OFFICE", $57
; 0x7f32d

UnknownText_0x7f32d: ; 0x7f32d
	db $0, "Perk Up #MON", $4f
	db "with Mellow Sounds", $51
	db "of the # FLUTE", $4f
	db "on CHANNEL 20", $57
; 0x7f36b

UnknownText_0x7f36b: ; 0x7f36b
	db $0, "Wow! A full rack", $4f
	db "of #MON CDs and", $55
	db "videos.", $51
	db "This must be the", $4f
	db "reference library.", $57
; 0x7f3b9

LavRadioTower1F_MapEventHeader: ; 0x7f3b9
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 7, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $3, 7, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 11, $0, MapLavRadioTower1FSignpost0Script
	signpost 0, 5, $0, MapLavRadioTower1FSignpost1Script

	; people-events
	db 5
	person_event SPRITE_RECEPTIONIST, 10, 10, $7, $0, 255, 255, $a0, 0, ReceptionistScript_0x7ee63, $ffff
	person_event SPRITE_OFFICER, 5, 19, $6, $0, 255, 255, $a0, 0, OfficerScript_0x7ee66, $ffff
	person_event SPRITE_SUPER_NERD, 7, 5, $2, $11, 255, 255, $80, 0, SuperNerdScript_0x7ee69, $ffff
	person_event SPRITE_GENTLEMAN, 5, 13, $7, $0, 255, 255, $0, 0, GentlemanScript_0x7ee6c, $ffff
	person_event SPRITE_SUPER_NERD, 10, 18, $9, $0, 255, 255, $0, 0, SuperNerdScript_0x7eea2, $ffff
; 0x7f414

