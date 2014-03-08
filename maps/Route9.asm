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
	text "I came to explore"
	line "ROCK TUNNEL."
	done
; 0x1aafc5

CamperDeanBeatenText: ; 0x1aafc5
	text "Whoa! Danger, man."
	done
; 0x1aafd9

UnknownText_0x1aafd9: ; 0x1aafd9
	text "My #MON were"
	line "hurt before even"

	para "entering ROCK"
	line "TUNNEL."

	para "I'd better take"
	line "them to a #MON"
	cont "CENTER right away."
	done
; 0x1ab03f

PicnickerHeidiSeenText: ; 0x1ab03f
	text "Have you ever been"
	line "to a picnic?"

	para "They're so much"
	line "fun!"
	done
; 0x1ab074

PicnickerHeidiBeatenText: ; 0x1ab074
	text "Ohhhh!"
	done
; 0x1ab07c

UnknownText_0x1ab07c: ; 0x1ab07c
	text "We bake lots of"
	line "goodies and share"

	para "them all around."
	line "They're delicious!"
	done
; 0x1ab0c2

CamperSidSeenText: ; 0x1ab0c2
	text "Hey, you!"
	line "Don't litter!"
	done
; 0x1ab0da

CamperSidBeatenText: ; 0x1ab0da
	text "I was just point-"
	line "ing out…"
	done
; 0x1ab0f6

UnknownText_0x1ab0f6: ; 0x1ab0f6
	text "Sorry. You weren't"
	line "littering. It was"
	cont "my mistake."
	done
; 0x1ab127

PicnickerEdnaSeenText: ; 0x1ab127
	text "People shouldn't"
	line "leave any litter"
	cont "behind."
	done
; 0x1ab151

PicnickerEdnaBeatenText: ; 0x1ab151
	text "Ohh… I lost…"
	done
; 0x1ab15f

UnknownText_0x1ab15f: ; 0x1ab15f
	text "Conserving energy"
	line "is important, but"

	para "the environment is"
	line "even more vital."
	done
; 0x1ab1a8

HikerTimSeenText: ; 0x1ab1a8
	text "She'll be coming"
	line "'round MT.SILVER"
	cont "when she comes…"

	para "MT.SILVER is in"
	line "JOHTO, right?"
	done
; 0x1ab1f7

HikerTimBeatenText: ; 0x1ab1f7
	text "I was too busy"
	line "singing…"
	done
; 0x1ab210

UnknownText_0x1ab210: ; 0x1ab210
	text "Battles are about"
	line "concentration."
	done
; 0x1ab232

HikerSidneySeenText: ; 0x1ab232
	text "I'll tell you a"
	line "secret."

	para "But first, we"
	line "battle!"
	done
; 0x1ab260

HikerSidneyBeatenText: ; 0x1ab260
	text "Oh, dang!"
	line "I lost that…"
	done
; 0x1ab278

UnknownText_0x1ab278: ; 0x1ab278
	text "The POWER PLANT is"
	line "across a small"
	cont "river."
	done
; 0x1ab2a2

UnknownText_0x1ab2a2: ; 0x1ab2a2
	text "ROUTE 9"

	para "CERULEAN CITY -"
	line "ROCK TUNNEL"
	done
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
	person_event SPRITE_YOUNGSTER, 15, 27, $8, $0, 255, 255, $a2, 3, TrainerCamperDean, $ffff
	person_event SPRITE_LASS, 12, 43, $a, $0, 255, 255, $a2, 3, TrainerPicnickerHeidi, $ffff
	person_event SPRITE_YOUNGSTER, 8, 15, $a, $0, 255, 255, $a2, 5, TrainerCamperSid, $ffff
	person_event SPRITE_LASS, 19, 16, $7, $0, 255, 255, $a2, 1, TrainerPicnickerEdna, $ffff
	person_event SPRITE_POKEFAN_M, 7, 32, $9, $0, 255, 255, $b2, 2, TrainerHikerTim, $ffff
	person_event SPRITE_POKEFAN_M, 19, 40, $9, $0, 255, 255, $b2, 4, TrainerHikerSidney, $ffff
; 0x1ab32a

