CeladonGym_MapScriptHeader: ; 0x72a68
	; trigger count
	db 0

	; callback count
	db 0
; 0x72a6a

ErikaScript_0x72a6a: ; 0x72a6a
	faceplayer
	loadfont
	checkflag $0026
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
	playsound SFX_GET_BADGE
	waitbutton
	setflag $0026
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
	checkflag $0026
	iftrue UnknownScript_0x72b21
	jumpstd $002d
; 0x72b21

UnknownScript_0x72b21: ; 0x72b21
	trainertotext ERIKA, 1, $1
	jumpstd $002e
; 0x72b28

UnknownText_0x72b28: ; 0x72b28
	text "ERIKA: Hello…"
	line "Lovely weather,"

	para "isn't it?"
	line "It's so pleasant…"

	para "…I'm afraid I may"
	line "doze off…"

	para "My name is ERIKA."
	line "I am the LEADER of"
	cont "CELADON GYM."

	para "…Oh? All the way"
	line "from JOHTO, you"
	cont "say? How nice…"

	para "Oh. I'm sorry, I"
	line "didn't realize"

	para "that you wished to"
	line "challenge me."

	para "Very well, but I"
	line "shall not lose."
	done
; 0x72c3e

UnknownText_0x72c3e: ; 0x72c3e
	text "ERIKA: Oh!"
	line "I concede defeat…"

	para "You are remarkably"
	line "strong…"

	para "I shall give you"
	line "RAINBOWBADGE…"
	done
; 0x72c96

UnknownText_0x72c96: ; 0x72c96
	text $52, " received"
	line "RAINBOWBADGE."
	done
; 0x72cb0

UnknownText_0x72cb0: ; 0x72cb0
	text "ERIKA: That was a"
	line "delightful match."

	para "I felt inspired."
	line "Please, I wish you"
	cont "to have this TM."

	para "It is GIGA DRAIN."

	para "It is a wonderful"
	line "move that drains"

	para "half the damage it"
	line "inflicts to heal"
	cont "your #MON."

	para "Please use it if"
	line "it pleases you…"
	done
; 0x72d8f

UnknownText_0x72d8f: ; 0x72d8f
	text "ERIKA: Losing"
	line "leaves a bitter"
	cont "aftertaste…"

	para "But knowing that"
	line "there are strong"

	para "trainers spurs me"
	line "to do better…"
	done
; 0x72dfc

LassMichelleSeenText: ; 0x72dfc
	text "Do you think a"
	line "girls-only GYM"
	cont "is rare?"
	done
; 0x72e24

LassMichelleBeatenText: ; 0x72e24
	text "Oh, bleah!"
	done
; 0x72e30

UnknownText_0x72e30: ; 0x72e30
	text "I just got care-"
	line "less, that's all!"
	done
; 0x72e53

PicnickerTanyaSeenText: ; 0x72e53
	text "Oh, a battle?"
	line "That's kind of"
	cont "scary, but OK!"
	done
; 0x72e7f

PicnickerTanyaBeatenText: ; 0x72e7f
	text "Oh, that's it?"
	done
; 0x72e8e

UnknownText_0x72e8e: ; 0x72e8e
	text "Oh, look at all"
	line "your BADGES. No"

	para "wonder I couldn't"
	line "win!"
	done
; 0x72ec5

BeautyJuliaSeenText: ; 0x72ec5
	text "Were you looking"
	line "at these flowers"
	cont "or at me?"
	done
; 0x72ef2

BeautyJuliaBeatenText: ; 0x72ef2
	text "How annoying!"
	done
; 0x72f01

UnknownText_0x72f01: ; 0x72f01
	text "How do I go about"
	line "becoming ladylike"
	cont "like ERIKA?"
	done
; 0x72f32

TwinsJoandzoe1SeenText: ; 0x72f32
	text "We'll show you"
	line "#MON moves that"
	cont "ERIKA taught us!"
	done
; 0x72f62

TwinsJoandzoe1BeatenText: ; 0x72f62
	text "Oh… We lost…"
	done
; 0x72f70

UnknownText_0x72f70: ; 0x72f70
	text "ERIKA will get you"
	line "back for us!"
	done
; 0x72f91

TwinsJoandzoe2SeenText: ; 0x72f91
	text "We're going to"
	line "protect ERIKA!"
	done
; 0x72faf

TwinsJoandzoe2BeatenText: ; 0x72faf
	text "We couldn't win…"
	done
; 0x72fc0

UnknownText_0x72fc0: ; 0x72fc0
	text "ERIKA is much,"
	line "much stronger!"
	done
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

