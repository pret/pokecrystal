CeladonGym_MapScriptHeader: ; 0x72a68
	; trigger count
	db 0

	; callback count
	db 0
; 0x72a6a

ErikaScript_0x72a6a: ; 0x72a6a
	faceplayer
	loadfont
	checkbit2 $0026
	iftrue UnknownScript_0x72a9b
	2writetext UnknownText_0x72b28
	closetext
	loadmovesprites
	winlosstext UnknownText_0x72c3e, $0000
	loadtrainer ERIKA, 1
	startbattle
	returnafterbattle
	setevent $04c8
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	loadfont
	2writetext UnknownText_0x72c96
	playsound $009c
	waitbutton
	setbit2 $0026
UnknownScript_0x72a9b: ; 0x72a9b
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue UnknownScript_0x72aae
	2writetext UnknownText_0x72cb0
	keeptextopen
	verbosegiveitem TM_19, 1
	iffalse UnknownScript_0x72aae
	setevent EVENT_GOT_TM19_GIGA_DRAIN
UnknownScript_0x72aae: ; 0x72aae
	2writetext UnknownText_0x72d8f
	closetext
	loadmovesprites
	end
; 0x72ab4

TrainerLassMichelle: ; 0x72ab4
	; bit/flag number
	dw $51d

	; trainer group && trainer id
	db LASS, MICHELLE

	; text when seen
	dw LassMichelleSeenText

	; text when trainer beaten
	dw LassMichelleBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassMichelleScript
; 0x72ac0

LassMichelleScript: ; 0x72ac0
	talkaftercancel
	loadfont
	2writetext UnknownText_0x72e30
	closetext
	loadmovesprites
	end
; 0x72ac8

TrainerPicnickerTanya: ; 0x72ac8
	; bit/flag number
	dw $490

	; trainer group && trainer id
	db PICNICKER, TANYA

	; text when seen
	dw PicnickerTanyaSeenText

	; text when trainer beaten
	dw PicnickerTanyaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerTanyaScript
; 0x72ad4

PicnickerTanyaScript: ; 0x72ad4
	talkaftercancel
	loadfont
	2writetext UnknownText_0x72e8e
	closetext
	loadmovesprites
	end
; 0x72adc

TrainerBeautyJulia: ; 0x72adc
	; bit/flag number
	dw $4ba

	; trainer group && trainer id
	db BEAUTY, JULIA

	; text when seen
	dw BeautyJuliaSeenText

	; text when trainer beaten
	dw BeautyJuliaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BeautyJuliaScript
; 0x72ae8

BeautyJuliaScript: ; 0x72ae8
	talkaftercancel
	loadfont
	2writetext UnknownText_0x72f01
	closetext
	loadmovesprites
	end
; 0x72af0

TrainerTwinsJoandzoe1: ; 0x72af0
	; bit/flag number
	dw $468

	; trainer group && trainer id
	db TWINS, JOANDZOE1

	; text when seen
	dw TwinsJoandzoe1SeenText

	; text when trainer beaten
	dw TwinsJoandzoe1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsJoandzoe1Script
; 0x72afc

TwinsJoandzoe1Script: ; 0x72afc
	talkaftercancel
	loadfont
	2writetext UnknownText_0x72f70
	closetext
	loadmovesprites
	end
; 0x72b04

TrainerTwinsJoandzoe2: ; 0x72b04
	; bit/flag number
	dw $468

	; trainer group && trainer id
	db TWINS, JOANDZOE2

	; text when seen
	dw TwinsJoandzoe2SeenText

	; text when trainer beaten
	dw TwinsJoandzoe2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw TwinsJoandzoe2Script
; 0x72b10

TwinsJoandzoe2Script: ; 0x72b10
	talkaftercancel
	loadfont
	2writetext UnknownText_0x72fc0
	closetext
	loadmovesprites
	end
; 0x72b18

MapCeladonGymSignpost1Script: ; 0x72b18
	checkbit2 $0026
	iftrue UnknownScript_0x72b21
	jumpstd $002d
; 0x72b21

UnknownScript_0x72b21: ; 0x72b21
	trainertotext ERIKA, 1, $1
	jumpstd $002e
; 0x72b28

UnknownText_0x72b28: ; 0x72b28
	db $0, "ERIKA: Hello…", $4f
	db "Lovely weather,", $51
	db "isn't it?", $4f
	db "It's so pleasant…", $51
	db "…I'm afraid I may", $4f
	db "doze off…", $51
	db "My name is ERIKA.", $4f
	db "I am the LEADER of", $55
	db "CELADON GYM.", $51
	db "…Oh? All the way", $4f
	db "from JOHTO, you", $55
	db "say? How nice…", $51
	db "Oh. I'm sorry, I", $4f
	db "didn't realize", $51
	db "that you wished to", $4f
	db "challenge me.", $51
	db "Very well, but I", $4f
	db "shall not lose.", $57
; 0x72c3e

UnknownText_0x72c3e: ; 0x72c3e
	db $0, "ERIKA: Oh!", $4f
	db "I concede defeat…", $51
	db "You are remarkably", $4f
	db "strong…", $51
	db "I shall give you", $4f
	db "RAINBOWBADGE…", $57
; 0x72c96

UnknownText_0x72c96: ; 0x72c96
	db $0, $52, " received", $4f
	db "RAINBOWBADGE.", $57
; 0x72cb0

UnknownText_0x72cb0: ; 0x72cb0
	db $0, "ERIKA: That was a", $4f
	db "delightful match.", $51
	db "I felt inspired.", $4f
	db "Please, I wish you", $55
	db "to have this TM.", $51
	db "It is GIGA DRAIN.", $51
	db "It is a wonderful", $4f
	db "move that drains", $51
	db "half the damage it", $4f
	db "inflicts to heal", $55
	db "your #MON.", $51
	db "Please use it if", $4f
	db "it pleases you…", $57
; 0x72d8f

UnknownText_0x72d8f: ; 0x72d8f
	db $0, "ERIKA: Losing", $4f
	db "leaves a bitter", $55
	db "aftertaste…", $51
	db "But knowing that", $4f
	db "there are strong", $51
	db "trainers spurs me", $4f
	db "to do better…", $57
; 0x72dfc

LassMichelleSeenText: ; 0x72dfc
	db $0, "Do you think a", $4f
	db "girls-only GYM", $55
	db "is rare?", $57
; 0x72e24

LassMichelleBeatenText: ; 0x72e24
	db $0, "Oh, bleah!", $57
; 0x72e30

UnknownText_0x72e30: ; 0x72e30
	db $0, "I just got care-", $4f
	db "less, that's all!", $57
; 0x72e53

PicnickerTanyaSeenText: ; 0x72e53
	db $0, "Oh, a battle?", $4f
	db "That's kind of", $55
	db "scary, but OK!", $57
; 0x72e7f

PicnickerTanyaBeatenText: ; 0x72e7f
	db $0, "Oh, that's it?", $57
; 0x72e8e

UnknownText_0x72e8e: ; 0x72e8e
	db $0, "Oh, look at all", $4f
	db "your BADGES. No", $51
	db "wonder I couldn't", $4f
	db "win!", $57
; 0x72ec5

BeautyJuliaSeenText: ; 0x72ec5
	db $0, "Were you looking", $4f
	db "at these flowers", $55
	db "or at me?", $57
; 0x72ef2

BeautyJuliaBeatenText: ; 0x72ef2
	db $0, "How annoying!", $57
; 0x72f01

UnknownText_0x72f01: ; 0x72f01
	db $0, "How do I go about", $4f
	db "becoming ladylike", $55
	db "like ERIKA?", $57
; 0x72f32

TwinsJoandzoe1SeenText: ; 0x72f32
	db $0, "We'll show you", $4f
	db "#MON moves that", $55
	db "ERIKA taught us!", $57
; 0x72f62

TwinsJoandzoe1BeatenText: ; 0x72f62
	db $0, "Oh… We lost…", $57
; 0x72f70

UnknownText_0x72f70: ; 0x72f70
	db $0, "ERIKA will get you", $4f
	db "back for us!", $57
; 0x72f91

TwinsJoandzoe2SeenText: ; 0x72f91
	db $0, "We're going to", $4f
	db "protect ERIKA!", $57
; 0x72faf

TwinsJoandzoe2BeatenText: ; 0x72faf
	db $0, "We couldn't win…", $57
; 0x72fc0

UnknownText_0x72fc0: ; 0x72fc0
	db $0, "ERIKA is much,", $4f
	db "much stronger!", $57
; 0x72fdf

CeladonGym_MapEventHeader: ; 0x72fdf
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $11, $4, 8, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $11, $5, 8, GROUP_CELADON_CITY, MAP_CELADON_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 15, 3, $0, MapCeladonGymSignpost1Script
	signpost 15, 6, $0, MapCeladonGymSignpost1Script

	; people-events
	db 6
	person_event SPRITE_ERIKA, 7, 9, $6, $0, 255, 255, $a0, 0, ErikaScript_0x72a6a, $ffff
	person_event SPRITE_LASS, 12, 11, $8, $0, 255, 255, $92, 2, TrainerLassMichelle, $ffff
	person_event SPRITE_LASS, 12, 6, $9, $0, 255, 255, $a2, 2, TrainerPicnickerTanya, $ffff
	person_event SPRITE_BUENA, 9, 7, $9, $0, 255, 255, $92, 2, TrainerBeautyJulia, $ffff
	person_event SPRITE_TWIN, 14, 8, $6, $0, 255, 255, $82, 1, TrainerTwinsJoandzoe1, $ffff
	person_event SPRITE_TWIN, 14, 9, $6, $0, 255, 255, $82, 1, TrainerTwinsJoandzoe2, $ffff
; 0x73047

