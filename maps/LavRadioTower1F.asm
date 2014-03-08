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
	text "Welcome!"
	line "Feel free to look"

	para "around anywhere on"
	line "this floor."
	done
; 0x7eefa

UnknownText_0x7eefa: ; 0x7eefa
	text "Sorry, but you can"
	line "only tour the"
	cont "ground floor."

	para "Ever since JOHTO's"
	line "RADIO TOWER was"

	para "taken over by a"
	line "criminal gang, we"

	para "have had to step"
	line "up our security."
	done
; 0x7ef90

UnknownText_0x7ef90: ; 0x7ef90
	text "Many people are"
	line "hard at work here"

	para "in the RADIO"
	line "TOWER."

	para "They must be doing"
	line "their best to put"
	cont "on good shows."
	done
; 0x7effb

UnknownText_0x7effb: ; 0x7effb
	text "Oh, no, no, no!"

	para "We've been off the"
	line "air ever since the"

	para "POWER PLANT shut"
	line "down."

	para "All my efforts to"
	line "start this station"

	para "would be wasted if"
	line "I can't broadcast."

	para "I'll be ruined!"
	done
; 0x7f0a1

UnknownText_0x7f0a1: ; 0x7f0a1
	text "Ah! So you're the"
	line $14, " who solved"

	para "the POWER PLANT's"
	line "problem?"

	para "Thanks to you, I"
	line "never lost my job."

	para "I tell you, you're"
	line "a real lifesaver!"

	para "Please take this"
	line "as my thanks."
	done
; 0x7f141

UnknownText_0x7f141: ; 0x7f141
	text "With that thing,"
	line "you can tune into"

	para "the radio programs"
	line "here in KANTO."

	para "Gahahahaha!"
	done
; 0x7f193

UnknownText_0x7f193: ; 0x7f193
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "Huh? Your #GEAR"
	line "can't tune into my"

	para "music programs."
	line "How unfortunate!"

	para "If you get an EXPN"
	line "CARD upgrade, you"

	para "can tune in. You'd"
	line "better get one!"
	done
; 0x7f248

UnknownText_0x7f248: ; 0x7f248
	text "Hey there!"

	para "I am the super"
	line "MUSIC DIRECTOR!"

	para "I'm responsible"
	line "for the gorgeous"

	para "melodies that go"
	line "out over the air."

	para "Don't be square."
	line "Grab your music"
	cont "off the air!"
	done
; 0x7f2e3

UnknownText_0x7f2e3: ; 0x7f2e3
	text "1F RECEPTION"
	line "2F SALES"

	para "3F PERSONNEL"
	line "4F PRODUCTION"

	para "5F DIRECTOR'S"
	line "   OFFICE"
	done
; 0x7f32d

UnknownText_0x7f32d: ; 0x7f32d
	text "Perk Up #MON"
	line "with Mellow Sounds"

	para "of the # FLUTE"
	line "on CHANNEL 20"
	done
; 0x7f36b

UnknownText_0x7f36b: ; 0x7f36b
	text "Wow! A full rack"
	line "of #MON CDs and"
	cont "videos."

	para "This must be the"
	line "reference library."
	done
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

