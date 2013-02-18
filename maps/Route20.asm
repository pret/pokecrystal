Route20_MapScriptHeader: ; 0x1acd20
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1acd25
; 0x1acd25

UnknownScript_0x1acd25: ; 0x1acd25
	setbit1 $00d7
	return
; 0x1acd29

TrainerSwimmerfNicole: ; 0x1acd29
	; bit/flag number
	dw $3f5

	; trainer group && trainer id
	db SWIMMERF, NICOLE

	; text when seen
	dw SwimmerfNicoleSeenText

	; text when trainer beaten
	dw SwimmerfNicoleBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfNicoleScript
; 0x1acd35

SwimmerfNicoleScript: ; 0x1acd35
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1acd93
	closetext
	loadmovesprites
	end
; 0x1acd3d

TrainerSwimmerfLori: ; 0x1acd3d
	; bit/flag number
	dw $3f6

	; trainer group && trainer id
	db SWIMMERF, LORI

	; text when seen
	dw SwimmerfLoriSeenText

	; text when trainer beaten
	dw SwimmerfLoriBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfLoriScript
; 0x1acd49

SwimmerfLoriScript: ; 0x1acd49
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ace15
	closetext
	loadmovesprites
	end
; 0x1acd51

TrainerSwimmermCameron: ; 0x1acd51
	; bit/flag number
	dw $5a4

	; trainer group && trainer id
	db SWIMMERM, CAMERON

	; text when seen
	dw SwimmermCameronSeenText

	; text when trainer beaten
	dw SwimmermCameronBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermCameronScript
; 0x1acd5d

SwimmermCameronScript: ; 0x1acd5d
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ace8b
	closetext
	loadmovesprites
	end
; 0x1acd65

MapRoute20Signpost0Script: ; 0x1acd65
	jumptext UnknownText_0x1acec2
; 0x1acd68

SwimmerfNicoleSeenText: ; 0x1acd68
	db $0, "I feel so much", $4f
	db "lighter in water.", $57
; 0x1acd8a

SwimmerfNicoleBeatenText: ; 0x1acd8a
	db $0, "Oh, no!", $57
; 0x1acd93

UnknownText_0x1acd93: ; 0x1acd93
	db $0, "Swimming exercises", $4f
	db "your full body.", $51
	db "It's really good", $4f
	db "for you.", $57
; 0x1acdd0

SwimmerfLoriSeenText: ; 0x1acdd0
	db $0, "What an impressive", $4f
	db "collection of GYM", $51
	db "BADGES. We should", $4f
	db "battle!", $57
; 0x1ace10

SwimmerfLoriBeatenText: ; 0x1ace10
	db $0, "No!", $57
; 0x1ace15

UnknownText_0x1ace15: ; 0x1ace15
	db $0, "SURF is no longer", $4f
	db "the only HM move", $55
	db "you use in water.", $57
; 0x1ace4b

SwimmermCameronSeenText: ; 0x1ace4b
	db $0, "I guess it's im-", $4f
	db "possible to swim", $51
	db "all the way to", $4f
	db "JOHTO.", $57
; 0x1ace83

SwimmermCameronBeatenText: ; 0x1ace83
	db $0, "Aiyah!", $57
; 0x1ace8b

UnknownText_0x1ace8b: ; 0x1ace8b
	db $0, "Besides the sea, I", $4f
	db "can also swim in", $55
	db "ponds and rivers.", $57
; 0x1acec2

UnknownText_0x1acec2: ; 0x1acec2
	db $0, "What does this", $4f
	db "sign say?", $51
	db "CINNABAR GYM", $4f
	db "LEADER: BLAINE", $57
; 0x1acef8

Route20_MapEventHeader: ; 0x1acef8
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $26, 1, GROUP_SEAFOAM_GYM, MAP_SEAFOAM_GYM

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 11, 37, $0, MapRoute20Signpost0Script

	; people-events
	db 3
	person_event $32, 12, 56, $a, $0, 255, 255, $a2, 3, TrainerSwimmerfNicole, $ffff
	person_event $32, 17, 49, $a, $0, 255, 255, $a2, 3, TrainerSwimmerfLori, $ffff
	person_event $31, 17, 16, $a, $0, 255, 255, $82, 3, TrainerSwimmermCameron, $ffff
; 0x1acf2f

