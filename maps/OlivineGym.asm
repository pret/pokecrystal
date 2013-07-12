OlivineGym_MapScriptHeader: ; 0x9c12d
	; trigger count
	db 0

	; callback count
	db 0
; 0x9c12f

JasmineScript_0x9c12f: ; 0x9c12f
	faceplayer
	loadfont
	checkbit1 $04c1
	iftrue UnknownScript_0x9c159
	2writetext UnknownText_0x9c1b9
	closetext
	loadmovesprites
	winlosstext UnknownText_0x9c2bb, $0000
	loadtrainer JASMINE, 1
	startbattle
	returnafterbattle
	setbit1 $04c1
	loadfont
	2writetext UnknownText_0x9c33a
	playsound $009c
	waitbutton
	setbit2 $001f
	checkcode $7
	2call UnknownScript_0x9c178
UnknownScript_0x9c159: ; 0x9c159
	checkbit1 $000d
	iftrue UnknownScript_0x9c172
	2writetext UnknownText_0x9c354
	keeptextopen
	verbosegiveitem TM_23, 1
	iffalse UnknownScript_0x9c176
	setbit1 $000d
	2writetext UnknownText_0x9c3a5
	closetext
	loadmovesprites
	end
; 0x9c172

UnknownScript_0x9c172: ; 0x9c172
	2writetext UnknownText_0x9c3d1
	closetext
UnknownScript_0x9c176: ; 0x9c176
	loadmovesprites
	end
; 0x9c178

UnknownScript_0x9c178: ; 0x9c178
	if_equal $7, UnknownScript_0x9c184
	if_equal $6, UnknownScript_0x9c181
	end
; 0x9c181

UnknownScript_0x9c181: ; 0x9c181
	jumpstd $0012
; 0x9c184

UnknownScript_0x9c184: ; 0x9c184
	jumpstd $0013
; 0x9c187

OlivineGymGuyScript: ; 0x9c187
	faceplayer
	checkbit1 $04c1
	iftrue .OlivineGymGuyWinScript
	checkbit1 $0020
	iffalse .OlivineGymGuyPreScript
	loadfont
	2writetext OlivineGymGuyText
	closetext
	loadmovesprites
	end
; 0x9c19b

.OlivineGymGuyWinScript
	loadfont
	2writetext OlivineGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x9c1a2

.OlivineGymGuyPreScript
	loadfont
	2writetext OlivineGymGuyPreText
	closetext
	loadmovesprites
	end
; 0x9c1a9

MapOlivineGymSignpost1Script: ; 0x9c1a9
	checkbit2 $001f
	iftrue UnknownScript_0x9c1b2
	jumpstd $002d
; 0x9c1b2

UnknownScript_0x9c1b2: ; 0x9c1b2
	trainertotext JASMINE, 1, $1
	jumpstd $002e
; 0x9c1b9

UnknownText_0x9c1b9: ; 0x9c1b9
	db $0, "…Thank you for", $4f
	db "your help at the", $55
	db "LIGHTHOUSE…", $51
	db "But this is dif-", $4f
	db "ferent. Please", $51
	db "allow me to intro-", $4f
	db "duce myself.", $51
	db "I am JASMINE, a", $4f
	db "GYM LEADER. I use", $55
	db "the steel-type.", $51
	db "…Do you know about", $4f
	db "the steel-type?", $51
	db "It's a type that", $4f
	db "was only recently", $55
	db "discovered.", $51
	db "…Um… May I begin?", $57
; 0x9c2bb

UnknownText_0x9c2bb: ; 0x9c2bb
	db $0, "…You are a better", $4f
	db "trainer than me,", $51
	db "in both skill and", $4f
	db "kindness.", $51
	db "In accordance with", $4f
	db "LEAGUE rules, I", $51
	db "confer upon you", $4f
	db "this BADGE.", $57
; 0x9c33a

UnknownText_0x9c33a: ; 0x9c33a
	db $0, $52, " received", $4f
	db "MINERALBADGE.", $57
; 0x9c354

UnknownText_0x9c354: ; 0x9c354
	db $0, "MINERALBADGE", $4f
	db "raises #MON's", $55
	db "DEFENSE.", $51
	db "…Um… Please take", $4f
	db "this too…", $57
; 0x9c393

UnknownText_0x9c393: ; 0x9c393
	db $0, $52, " received", $4f
	db "TM09.", $57
; 0x9c3a5

UnknownText_0x9c3a5: ; 0x9c3a5
	db $0, "…You could use", $4f
	db "that TM to teach", $55
	db "IRON TAIL.", $57
; 0x9c3d1

UnknownText_0x9c3d1: ; 0x9c3d1
	db $0, "Um… I don't know", $4f
	db "how to say this,", $55
	db "but good luck…", $57
; 0x9c402

OlivineGymGuyText: ; 0x9c402
	db $0, "JASMINE uses the", $4f
	db "newly discovered", $55
	db "steel-type.", $51
	db "I don't know very", $4f
	db "much about it.", $57
; 0x9c451

OlivineGymGuyWinText: ; 0x9c451
	db $0, "That was awesome.", $51
	db "The steel-type,", $4f
	db "huh?", $51
	db "That was a close", $4f
	db "encounter of an", $55
	db "unknown kind!", $57
; 0x9c4a8

OlivineGymGuyPreText: ; 0x9c4a8
	db $0, "JASMINE, the GYM", $4f
	db "LEADER, is at the", $55
	db "LIGHTHOUSE.", $51
	db "She's been tending", $4f
	db "to a sick #MON.", $51
	db "A strong trainer", $4f
	db "has to be compas-", $55
	db "sionate.", $57
; 0x9c526

OlivineGym_MapEventHeader: ; 0x9c526
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $4, 2, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $f, $5, 2, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 3, $0, MapOlivineGymSignpost1Script
	signpost 13, 6, $0, MapOlivineGymSignpost1Script

	; people-events
	db 2
	person_event SPRITE_JASMINE, 7, 9, $6, $0, 255, 255, $80, 0, JasmineScript_0x9c12f, $06d3
	person_event SPRITE_GYM_GUY, 17, 11, $6, $0, 255, 255, $80, 0, OlivineGymGuyScript, $ffff
; 0x9c55a

