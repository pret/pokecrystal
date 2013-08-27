Route3_MapScriptHeader: ; 0x1adf63
	; trigger count
	db 0

	; callback count
	db 0
; 0x1adf65

TrainerFirebreatherOtis: ; 0x1adf65
	; bit/flag number
	dw $446

	; trainer group && trainer id
	db FIREBREATHER, OTIS

	; text when seen
	dw FirebreatherOtisSeenText

	; text when trainer beaten
	dw FirebreatherOtisBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FirebreatherOtisScript
; 0x1adf71

FirebreatherOtisScript: ; 0x1adf71
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1adff7
	closetext
	loadmovesprites
	end
; 0x1adf79

TrainerYoungsterWarren: ; 0x1adf79
	; bit/flag number
	dw $5b1

	; trainer group && trainer id
	db YOUNGSTER, WARREN

	; text when seen
	dw YoungsterWarrenSeenText

	; text when trainer beaten
	dw YoungsterWarrenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterWarrenScript
; 0x1adf85

YoungsterWarrenScript: ; 0x1adf85
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ae051
	closetext
	loadmovesprites
	end
; 0x1adf8d

TrainerYoungsterJimmy: ; 0x1adf8d
	; bit/flag number
	dw $5b2

	; trainer group && trainer id
	db YOUNGSTER, JIMMY

	; text when seen
	dw YoungsterJimmySeenText

	; text when trainer beaten
	dw YoungsterJimmyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterJimmyScript
; 0x1adf99

YoungsterJimmyScript: ; 0x1adf99
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ae0a9
	closetext
	loadmovesprites
	end
; 0x1adfa1

TrainerFirebreatherBurt: ; 0x1adfa1
	; bit/flag number
	dw $449

	; trainer group && trainer id
	db FIREBREATHER, BURT

	; text when seen
	dw FirebreatherBurtSeenText

	; text when trainer beaten
	dw FirebreatherBurtBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FirebreatherBurtScript
; 0x1adfad

FirebreatherBurtScript: ; 0x1adfad
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ae118
	closetext
	loadmovesprites
	end
; 0x1adfb5

MapRoute3Signpost0Script: ; 0x1adfb5
	jumptext UnknownText_0x1ae163
; 0x1adfb8

FirebreatherOtisSeenText: ; 0x1adfb8
	db $0, "Ah! The weather's", $4f
	db "as fine as ever.", $57
; 0x1adfdb

FirebreatherOtisBeatenText: ; 0x1adfdb
	db $0, "It's sunny, but", $4f
	db "I'm all wet…", $57
; 0x1adff7

UnknownText_0x1adff7: ; 0x1adff7
	db $0, "When it rains,", $4f
	db "it's hard to get", $55
	db "ignition…", $57
; 0x1ae021

YoungsterWarrenSeenText: ; 0x1ae021
	db $0, "Hmmm… I don't know", $4f
	db "what to do…", $57
; 0x1ae040

YoungsterWarrenBeatenText: ; 0x1ae040
	db $0, "I knew I'd lose…", $57
; 0x1ae051

UnknownText_0x1ae051: ; 0x1ae051
	db $0, "You looked strong.", $51
	db "I was afraid to", $4f
	db "take you on…", $57
; 0x1ae082

YoungsterJimmySeenText: ; 0x1ae082
	db $0, "I can run like the", $4f
	db "wind!", $57
; 0x1ae09c

YoungsterJimmyBeatenText: ; 0x1ae09c
	db $0, "Blown away!", $57
; 0x1ae0a9

UnknownText_0x1ae0a9: ; 0x1ae0a9
	db $0, "I wear shorts the", $4f
	db "whole year round.", $51
	db "That's my fashion", $4f
	db "policy.", $57
; 0x1ae0e7

FirebreatherBurtSeenText: ; 0x1ae0e7
	db $0, "Step right up and", $4f
	db "take a look!", $57
; 0x1ae107

FirebreatherBurtBeatenText: ; 0x1ae107
	db $0, "Yow! That's hot!", $57
; 0x1ae118

UnknownText_0x1ae118: ; 0x1ae118
	db $0, "The greatest fire-", $4f
	db "breather in KANTO,", $55
	db "that's me.", $51
	db "But not the best", $4f
	db "trainer…", $57
; 0x1ae163

UnknownText_0x1ae163: ; 0x1ae163
	db $0, "MT.MOON SQUARE", $51
	db "Just go up the", $4f
	db "stairs.", $57
; 0x1ae18a

Route3_MapEventHeader: ; 0x1ae18a
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $1, $34, 1, GROUP_MOUNT_MOON, MAP_MOUNT_MOON

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 13, 49, $0, MapRoute3Signpost0Script

	; people-events
	db 4
	person_event SPRITE_FISHER, 16, 30, $7, $0, 255, 255, $82, 2, TrainerFirebreatherOtis, $ffff
	person_event SPRITE_YOUNGSTER, 11, 14, $8, $0, 255, 255, $92, 3, TrainerYoungsterWarren, $ffff
	person_event SPRITE_YOUNGSTER, 7, 20, $a, $0, 255, 255, $92, 1, TrainerYoungsterJimmy, $ffff
	person_event SPRITE_FISHER, 9, 53, $a, $0, 255, 255, $82, 3, TrainerFirebreatherBurt, $ffff
; 0x1ae1ce

