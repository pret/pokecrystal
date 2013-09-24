Route19_MapScriptHeader: ; 0x19e9d9
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x19e9de
; 0x19e9de

UnknownScript_0x19e9de: ; 0x19e9de
	checkevent $00d7
	iftrue UnknownScript_0x19e9fc
	changeblock $6, $6, $7a
	changeblock $8, $6, $7a
	changeblock $a, $6, $7a
	changeblock $c, $8, $7a
	changeblock $4, $8, $7a
	changeblock $a, $a, $7a
UnknownScript_0x19e9fc: ; 0x19e9fc
	return
; 0x19e9fd

TrainerSwimmerfDawn: ; 0x19e9fd
	; bit/flag number
	dw $3f3

	; trainer group && trainer id
	db SWIMMERF, DAWN

	; text when seen
	dw SwimmerfDawnSeenText

	; text when trainer beaten
	dw SwimmerfDawnBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfDawnScript
; 0x19ea09

SwimmerfDawnScript: ; 0x19ea09
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19ebad
	closetext
	loadmovesprites
	end
; 0x19ea11

TrainerSwimmermHarold: ; 0x19ea11
	; bit/flag number
	dw $594

	; trainer group && trainer id
	db SWIMMERM, HAROLD

	; text when seen
	dw SwimmermHaroldSeenText

	; text when trainer beaten
	dw SwimmermHaroldBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermHaroldScript
; 0x19ea1d

SwimmermHaroldScript: ; 0x19ea1d
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19eab4
	closetext
	loadmovesprites
	end
; 0x19ea25

TrainerSwimmermJerome: ; 0x19ea25
	; bit/flag number
	dw $5a1

	; trainer group && trainer id
	db SWIMMERM, JEROME

	; text when seen
	dw SwimmermJeromeSeenText

	; text when trainer beaten
	dw SwimmermJeromeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermJeromeScript
; 0x19ea31

SwimmermJeromeScript: ; 0x19ea31
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19ec7e
	closetext
	loadmovesprites
	end
; 0x19ea39

TrainerSwimmermTucker: ; 0x19ea39
	; bit/flag number
	dw $5a2

	; trainer group && trainer id
	db SWIMMERM, TUCKER

	; text when seen
	dw SwimmermTuckerSeenText

	; text when trainer beaten
	dw SwimmermTuckerBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermTuckerScript
; 0x19ea45

SwimmermTuckerScript: ; 0x19ea45
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19eb3b
	closetext
	loadmovesprites
	end
; 0x19ea4d

FisherScript_0x19ea4d: ; 0x19ea4d
	faceplayer
	loadfont
	checkevent $00d7
	iftrue UnknownScript_0x19ea5b
	2writetext UnknownText_0x19ecaf
	closetext
	loadmovesprites
	end
; 0x19ea5b

UnknownScript_0x19ea5b: ; 0x19ea5b
	2writetext UnknownText_0x19ed24
	closetext
	loadmovesprites
	end
; 0x19ea61

FisherScript_0x19ea61: ; 0x19ea61
	faceplayer
	loadfont
	checkevent $00d7
	iftrue UnknownScript_0x19ea6f
	2writetext UnknownText_0x19ed45
	closetext
	loadmovesprites
	end
; 0x19ea6f

UnknownScript_0x19ea6f: ; 0x19ea6f
	2writetext UnknownText_0x19ed7d
	closetext
	loadmovesprites
	end
; 0x19ea75

MapRoute19Signpost0Script: ; 0x19ea75
	jumptext UnknownText_0x19edbc
; 0x19ea78

MapRoute19Signpost1Script: ; 0x19ea78
	jumptext UnknownText_0x19ede5
; 0x19ea7b

SwimmermHaroldSeenText: ; 0x19ea7b
	db $0, "Have you ever gone", $4f
	db "swimming in the", $55
	db "sea at night?", $57
; 0x19eaad

SwimmermHaroldBeatenText: ; 0x19eaad
	db $0, "Glub…", $57
; 0x19eab4

UnknownText_0x19eab4: ; 0x19eab4
	db $0, "At night, the sea", $4f
	db "turns black. It", $51
	db "feels like it will", $4f
	db "swallow you up.", $57
; 0x19eafa

SwimmermTuckerSeenText: ; 0x19eafa
	db $0, "Pant, pant…", $4f
	db "Just… a little…", $51
	db "farther… to…", $4f
	db "FUCHSIA…", $57
; 0x19eb2d

SwimmermTuckerBeatenText: ; 0x19eb2d
	db $0, "I'm drowning!", $57
; 0x19eb3b

UnknownText_0x19eb3b: ; 0x19eb3b
	db $0, "I… asked my girl-", $4f
	db "friend to swim to", $55
	db "FUCHSIA… Gasp…", $57
; 0x19eb6f

SwimmerfDawnSeenText: ; 0x19eb6f
	db $0, "I'm disgusted by", $4f
	db "wimpy people!", $57
; 0x19eb8e

SwimmerfDawnBeatenText: ; 0x19eb8e
	db $0, "I could beat you", $4f
	db "at swimming…", $57
; 0x19ebad

UnknownText_0x19ebad: ; 0x19ebad
	db $0, "It's a quick swim", $4f
	db "between FUCHSIA", $51
	db "and SEAFOAM IS-", $4f
	db "LANDS…", $51
	db "Sheesh, some big", $4f
	db "man my boyfriend", $51
	db "is! What a wimp!", $57
; 0x19ec19

SwimmermJeromeSeenText: ; 0x19ec19
	db $0, "Swimming?", $4f
	db "I'm lousy at it.", $51
	db "I'm just splashing", $4f
	db "around in these", $55
	db "shallow waters.", $57
; 0x19ec66

SwimmermJeromeBeatenText: ; 0x19ec66
	db $0, "I thought I could", $4f
	db "win.", $57
; 0x19ec7e

UnknownText_0x19ec7e: ; 0x19ec7e
	db $0, "I might be bad at", $4f
	db "swimming, but I", $55
	db "love the sea.", $57
; 0x19ecaf

UnknownText_0x19ecaf: ; 0x19ecaf
	db $0, "Sorry. This road", $4f
	db "is closed for", $55
	db "construction.", $51
	db "If you want to get", $4f
	db "to CINNABAR, you'd", $51
	db "better go south", $4f
	db "from PALLET TOWN.", $57
; 0x19ed24

UnknownText_0x19ed24: ; 0x19ed24
	db $0, "I'm all sweaty.", $4f
	db "Time for a swim!", $57
; 0x19ed45

UnknownText_0x19ed45: ; 0x19ed45
	db $0, "Who knows how long", $4f
	db "it would take to", $55
	db "move this boulder…", $57
; 0x19ed7d

UnknownText_0x19ed7d: ; 0x19ed7d
	db $0, "The roadwork is", $4f
	db "finally finished.", $51
	db "Now I can go", $4f
	db "fishing again.", $57
; 0x19edbc

UnknownText_0x19edbc: ; 0x19edbc
	db $0, "ROUTE 19", $51
	db "FUCHSIA CITY -", $4f
	db "SEAFOAM ISLANDS", $57
; 0x19ede5

UnknownText_0x19ede5: ; 0x19ede5
	db $0, "Please be careful", $4f
	db "if you are swim-", $55
	db "ming to SEAFOAM", $55
	db "ISLANDS.", $51
	db "FUCHSIA POLICE", $57
; 0x19ee31

Route19_MapEventHeader: ; 0x19ee31
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $3, $7, 3, GROUP_ROUTE_19___FUCHSIA_GATE, MAP_ROUTE_19___FUCHSIA_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 11, $0, MapRoute19Signpost0Script
	signpost 1, 11, $0, MapRoute19Signpost1Script

	; people-events
	db 6
	person_event SPRITE_SWIMMER_GIRL, 27, 13, $8, $0, 255, 255, $a2, 0, TrainerSwimmerfDawn, $ffff
	person_event SPRITE_SWIMMER_GUY, 32, 17, $a, $0, 255, 255, $82, 3, TrainerSwimmermHarold, $ffff
	person_event SPRITE_SWIMMER_GUY, 21, 15, $a, $0, 255, 255, $82, 3, TrainerSwimmermJerome, $ffff
	person_event SPRITE_SWIMMER_GUY, 27, 12, $7, $0, 255, 255, $82, 0, TrainerSwimmermTucker, $ffff
	person_event SPRITE_FISHER, 9, 13, $6, $0, 255, 255, $80, 1, FisherScript_0x19ea4d, $ffff
	person_event SPRITE_FISHER, 9, 15, $5, $1, 255, 255, $90, 1, FisherScript_0x19ea61, $ffff
; 0x19ee94

