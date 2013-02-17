OlivineLighthouse2F_MapScriptHeader: ; 0x5af6f
	; trigger count
	db 0

	; callback count
	db 0
; 0x5af71

TrainerGentlemanAlfred: ; 0x5af71
	; bit/flag number
	dw $49e

	; trainer group && trainer id
	db GENTLEMAN, ALFRED

	; text when seen
	dw GentlemanAlfredSeenText

	; text when trainer beaten
	dw GentlemanAlfredBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GentlemanAlfredScript
; 0x5af7d

GentlemanAlfredScript: ; 0x5af7d
	talkaftercancel
	loadfont
	2writetext UnknownText_0x5b13e
	closetext
	loadmovesprites
	end
; 0x5af85

TrainerSailorHuey1: ; 0x5af85
	; bit/flag number
	dw $576

	; trainer group && trainer id
	db SAILOR, HUEY1

	; text when seen
	dw SailorHuey1SeenText

	; text when trainer beaten
	dw SailorHuey1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorHuey1Script
; 0x5af91

SailorHuey1Script: ; 0x5af91
	writecode $17, $7
	talkaftercancel
	loadfont
	checkbit2 $0066
	iftrue UnknownScript_0x5afc7
	checkcellnum $7
	iftrue UnknownScript_0x5b05f
	checkbit1 $0263
	iftrue UnknownScript_0x5afb0
	setbit1 $0263
	2call UnknownScript_0x5b053
	2jump UnknownScript_0x5afb3
; 0x5afb0

UnknownScript_0x5afb0: ; 0x5afb0
	2call UnknownScript_0x5b057
UnknownScript_0x5afb3: ; 0x5afb3
	askforphonenumber $7
	if_equal $1, UnknownScript_0x5b067
	if_equal $2, UnknownScript_0x5b063
	trainertotext SAILOR, HUEY1, $0
	2call UnknownScript_0x5b05b
	2jump UnknownScript_0x5b05f
; 0x5afc7

UnknownScript_0x5afc7: ; 0x5afc7
	2call UnknownScript_0x5b06b
	winlosstext SailorHuey1BeatenText, $0000
	copybytetovar $d9f4
	if_equal $3, UnknownScript_0x5afe2
	if_equal $2, UnknownScript_0x5afe8
	if_equal $1, UnknownScript_0x5afee
	if_equal $0, UnknownScript_0x5aff4
UnknownScript_0x5afe2: ; 0x5afe2
	checkbit1 $00cd
	iftrue UnknownScript_0x5b01b
UnknownScript_0x5afe8: ; 0x5afe8
	checkbit1 $0044
	iftrue UnknownScript_0x5b00e
UnknownScript_0x5afee: ; 0x5afee
	checkbit1 $0021
	iftrue UnknownScript_0x5b001
UnknownScript_0x5aff4: ; 0x5aff4
	loadtrainer SAILOR, HUEY1
	startbattle
	returnafterbattle
	loadvar $d9f4, $1
	clearbit2 $0066
	end
; 0x5b001

UnknownScript_0x5b001: ; 0x5b001
	loadtrainer SAILOR, HUEY2
	startbattle
	returnafterbattle
	loadvar $d9f4, $2
	clearbit2 $0066
	end
; 0x5b00e

UnknownScript_0x5b00e: ; 0x5b00e
	loadtrainer SAILOR, HUEY3
	startbattle
	returnafterbattle
	loadvar $d9f4, $3
	clearbit2 $0066
	end
; 0x5b01b

UnknownScript_0x5b01b: ; 0x5b01b
	loadtrainer SAILOR, HUEY4
	startbattle
	returnafterbattle
	clearbit2 $0066
	checkbit1 $0337
	iftrue UnknownScript_0x5b03f
	checkbit1 $0265
	iftrue UnknownScript_0x5b03e
	2call UnknownScript_0x5b076
	verbosegiveitem PROTEIN, 1
	iffalse UnknownScript_0x5b06f
	setbit1 $0265
	2jump UnknownScript_0x5b05f
; 0x5b03e

UnknownScript_0x5b03e: ; 0x5b03e
	end
; 0x5b03f

UnknownScript_0x5b03f: ; 0x5b03f
	loadfont
	2writetext UnknownText_0x5b1b6
	closetext
	verbosegiveitem PROTEIN, 1
	iffalse UnknownScript_0x5b06f
	clearbit1 $0337
	setbit1 $0265
	2jump UnknownScript_0x5b05f
; 0x5b053

UnknownScript_0x5b053: ; 0x5b053
	jumpstd $0019
	end
; 0x5b057

UnknownScript_0x5b057: ; 0x5b057
	jumpstd $001a
	end
; 0x5b05b

UnknownScript_0x5b05b: ; 0x5b05b
	jumpstd $001b
	end
; 0x5b05f

UnknownScript_0x5b05f: ; 0x5b05f
	jumpstd $001c
	end
; 0x5b063

UnknownScript_0x5b063: ; 0x5b063
	jumpstd $001d
	end
; 0x5b067

UnknownScript_0x5b067: ; 0x5b067
	jumpstd $001e
	end
; 0x5b06b

UnknownScript_0x5b06b: ; 0x5b06b
	jumpstd $001f
	end
; 0x5b06f

UnknownScript_0x5b06f: ; 0x5b06f
	setbit1 $0337
	jumpstd $0021
	end
; 0x5b076

UnknownScript_0x5b076: ; 0x5b076
	jumpstd $0022
	end
; 0x5b07a

SailorHuey1SeenText: ; 0x5b07a
	db $0, "Men of the sea are", $4f
	db "always spoiling", $55
	db "for a good fight!", $57
; 0x5b0b0

SailorHuey1BeatenText: ; 0x5b0b0
	db $0, "Urf!", $4f
	db "I lose!", $57
; 0x5b0be

; possibly unused
UnknownText_0x5b0be: ; 0x5b0be
	db $0, "What power!", $4f
	db "How would you like", $51
	db "to sail the seas", $4f
	db "with me?", $57
; 0x5b0f8

GentlemanAlfredSeenText: ; 0x5b0f8
	db $0, "Hm? This is no", $4f
	db "place for playing.", $57
; 0x5b11b

GentlemanAlfredBeatenText: ; 0x5b11b
	db $0, "Ah! I can see that", $4f
	db "you're serious.", $57
; 0x5b13e

UnknownText_0x5b13e: ; 0x5b13e
	db $0, "Up top is a #-", $4f
	db "MON that keeps the", $55
	db "LIGHTHOUSE lit.", $51
	db "But I hear that", $4f
	db "it's sick now and", $51
	db "can't be cured by", $4f
	db "ordinary medicine.", $57
; 0x5b1b6

UnknownText_0x5b1b6: ; 0x5b1b6
	db $0, "Man! You're as", $4f
	db "tough as ever!", $51
	db "Anyway, here's", $4f
	db "that medicine from", $55
	db "before.", $57
; 0x5b1fd

OlivineLighthouse2F_MapEventHeader: ; 0x5b1fd
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $b, $3, 3, GROUP_OLIVINE_LIGHTHOUSE_1F, MAP_OLIVINE_LIGHTHOUSE_1F
	warp_def $3, $5, 2, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $d, $10, 4, GROUP_OLIVINE_LIGHTHOUSE_1F, MAP_OLIVINE_LIGHTHOUSE_1F
	warp_def $d, $11, 5, GROUP_OLIVINE_LIGHTHOUSE_1F, MAP_OLIVINE_LIGHTHOUSE_1F
	warp_def $b, $10, 4, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F
	warp_def $b, $11, 5, GROUP_OLIVINE_LIGHTHOUSE_3F, MAP_OLIVINE_LIGHTHOUSE_3F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event $49, 7, 13, $9, $0, 255, 255, $92, 3, TrainerSailorHuey1, $ffff
	person_event $40, 12, 21, $8, $0, 255, 255, $92, 3, TrainerGentlemanAlfred, $ffff
; 0x5b23b

