Route9_MapScriptHeader: ; 0x1aaf25
	; trigger count
	db 0

	; callback count
	db 0
; 0x1aaf27

TrainerCamperDean: ; 0x1aaf27
	; bit/flag number
	dw $420

	; trainer group && trainer id
	db CAMPER, DEAN

	; text when seen
	dw CamperDeanSeenText

	; text when trainer beaten
	dw CamperDeanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperDeanScript
; 0x1aaf33

CamperDeanScript: ; 0x1aaf33
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1aafd9
	closetext
	loadmovesprites
	end
; 0x1aaf3b

TrainerPicnickerHeidi: ; 0x1aaf3b
	; bit/flag number
	dw $48a

	; trainer group && trainer id
	db PICNICKER, HEIDI

	; text when seen
	dw PicnickerHeidiSeenText

	; text when trainer beaten
	dw PicnickerHeidiBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerHeidiScript
; 0x1aaf47

PicnickerHeidiScript: ; 0x1aaf47
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ab07c
	closetext
	loadmovesprites
	end
; 0x1aaf4f

TrainerCamperSid: ; 0x1aaf4f
	; bit/flag number
	dw $421

	; trainer group && trainer id
	db CAMPER, SID

	; text when seen
	dw CamperSidSeenText

	; text when trainer beaten
	dw CamperSidBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperSidScript
; 0x1aaf5b

CamperSidScript: ; 0x1aaf5b
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ab0f6
	closetext
	loadmovesprites
	end
; 0x1aaf63

TrainerPicnickerEdna: ; 0x1aaf63
	; bit/flag number
	dw $48b

	; trainer group && trainer id
	db PICNICKER, EDNA

	; text when seen
	dw PicnickerEdnaSeenText

	; text when trainer beaten
	dw PicnickerEdnaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerEdnaScript
; 0x1aaf6f

PicnickerEdnaScript: ; 0x1aaf6f
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ab15f
	closetext
	loadmovesprites
	end
; 0x1aaf77

TrainerHikerTim: ; 0x1aaf77
	; bit/flag number
	dw $530

	; trainer group && trainer id
	db HIKER, TIM

	; text when seen
	dw HikerTimSeenText

	; text when trainer beaten
	dw HikerTimBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerTimScript
; 0x1aaf83

HikerTimScript: ; 0x1aaf83
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ab210
	closetext
	loadmovesprites
	end
; 0x1aaf8b

TrainerHikerSidney: ; 0x1aaf8b
	; bit/flag number
	dw $532

	; trainer group && trainer id
	db HIKER, SIDNEY

	; text when seen
	dw HikerSidneySeenText

	; text when trainer beaten
	dw HikerSidneyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerSidneyScript
; 0x1aaf97

HikerSidneyScript: ; 0x1aaf97
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1ab278
	closetext
	loadmovesprites
	end
; 0x1aaf9f

MapRoute9Signpost0Script: ; 0x1aaf9f
	jumptext UnknownText_0x1ab2a2
; 0x1aafa2

MapRoute9SignpostItem1: ; 0x1aafa2
	dw $00f2
	db ETHER
	
; 0x1aafa5

CamperDeanSeenText: ; 0x1aafa5
	db $0, "I came to explore", $4f
	db "ROCK TUNNEL.", $57
; 0x1aafc5

CamperDeanBeatenText: ; 0x1aafc5
	db $0, "Whoa! Danger, man.", $57
; 0x1aafd9

UnknownText_0x1aafd9: ; 0x1aafd9
	db $0, "My #MON were", $4f
	db "hurt before even", $51
	db "entering ROCK", $4f
	db "TUNNEL.", $51
	db "I'd better take", $4f
	db "them to a #MON", $55
	db "CENTER right away.", $57
; 0x1ab03f

PicnickerHeidiSeenText: ; 0x1ab03f
	db $0, "Have you ever been", $4f
	db "to a picnic?", $51
	db "They're so much", $4f
	db "fun!", $57
; 0x1ab074

PicnickerHeidiBeatenText: ; 0x1ab074
	db $0, "Ohhhh!", $57
; 0x1ab07c

UnknownText_0x1ab07c: ; 0x1ab07c
	db $0, "We bake lots of", $4f
	db "goodies and share", $51
	db "them all around.", $4f
	db "They're delicious!", $57
; 0x1ab0c2

CamperSidSeenText: ; 0x1ab0c2
	db $0, "Hey, you!", $4f
	db "Don't litter!", $57
; 0x1ab0da

CamperSidBeatenText: ; 0x1ab0da
	db $0, "I was just point-", $4f
	db "ing out…", $57
; 0x1ab0f6

UnknownText_0x1ab0f6: ; 0x1ab0f6
	db $0, "Sorry. You weren't", $4f
	db "littering. It was", $55
	db "my mistake.", $57
; 0x1ab127

PicnickerEdnaSeenText: ; 0x1ab127
	db $0, "People shouldn't", $4f
	db "leave any litter", $55
	db "behind.", $57
; 0x1ab151

PicnickerEdnaBeatenText: ; 0x1ab151
	db $0, "Ohh… I lost…", $57
; 0x1ab15f

UnknownText_0x1ab15f: ; 0x1ab15f
	db $0, "Conserving energy", $4f
	db "is important, but", $51
	db "the environment is", $4f
	db "even more vital.", $57
; 0x1ab1a8

HikerTimSeenText: ; 0x1ab1a8
	db $0, "She'll be coming", $4f
	db "'round MT.SILVER", $55
	db "when she comes…", $51
	db "MT.SILVER is in", $4f
	db "JOHTO, right?", $57
; 0x1ab1f7

HikerTimBeatenText: ; 0x1ab1f7
	db $0, "I was too busy", $4f
	db "singing…", $57
; 0x1ab210

UnknownText_0x1ab210: ; 0x1ab210
	db $0, "Battles are about", $4f
	db "concentration.", $57
; 0x1ab232

HikerSidneySeenText: ; 0x1ab232
	db $0, "I'll tell you a", $4f
	db "secret.", $51
	db "But first, we", $4f
	db "battle!", $57
; 0x1ab260

HikerSidneyBeatenText: ; 0x1ab260
	db $0, "Oh, dang!", $4f
	db "I lost that…", $57
; 0x1ab278

UnknownText_0x1ab278: ; 0x1ab278
	db $0, "The POWER PLANT is", $4f
	db "across a small", $55
	db "river.", $57
; 0x1ab2a2

UnknownText_0x1ab2a2: ; 0x1ab2a2
	db $0, "ROUTE 9", $51
	db "CERULEAN CITY -", $4f
	db "ROCK TUNNEL", $57
; 0x1ab2c7

Route9_MapEventHeader: ; 0x1ab2c7
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $f, $30, 1, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 7, 15, $0, MapRoute9Signpost0Script
	signpost 15, 41, $7, MapRoute9SignpostItem1

	; people-events
	db 6
	person_event $27, 15, 27, $8, $0, 255, 255, $a2, 3, TrainerCamperDean, $ffff
	person_event $28, 12, 43, $a, $0, 255, 255, $a2, 3, TrainerPicnickerHeidi, $ffff
	person_event $27, 8, 15, $a, $0, 255, 255, $a2, 5, TrainerCamperSid, $ffff
	person_event $28, 19, 16, $7, $0, 255, 255, $a2, 1, TrainerPicnickerEdna, $ffff
	person_event $2d, 7, 32, $9, $0, 255, 255, $b2, 2, TrainerHikerTim, $ffff
	person_event $2d, 19, 40, $9, $0, 255, 255, $b2, 4, TrainerHikerSidney, $ffff
; 0x1ab32a

