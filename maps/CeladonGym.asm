CeladonGym_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ErikaScript_0x72a6a:
	faceplayer
	loadfont
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext UnknownText_0x72b28
	closetext
	loadmovesprites
	winlosstext UnknownText_0x72c3e, $0000
	loadtrainer ERIKA, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	loadfont
	writetext UnknownText_0x72c96
	playsound SFX_GET_BADGE
	waitbutton
	setflag ENGINE_RAINBOWBADGE
.FightDone
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue UnknownScript_0x72aae
	writetext UnknownText_0x72cb0
	keeptextopen
	verbosegiveitem TM_GIGA_DRAIN, 1
	iffalse UnknownScript_0x72aae
	setevent EVENT_GOT_TM19_GIGA_DRAIN
UnknownScript_0x72aae:
	writetext UnknownText_0x72d8f
	closetext
	loadmovesprites
	end

TrainerLassMichelle:
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

LassMichelleScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x72e30
	closetext
	loadmovesprites
	end

TrainerPicnickerTanya:
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

PicnickerTanyaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x72e8e
	closetext
	loadmovesprites
	end

TrainerBeautyJulia:
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

BeautyJuliaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x72f01
	closetext
	loadmovesprites
	end

TrainerTwinsJoandzoe1:
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

TwinsJoandzoe1Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x72f70
	closetext
	loadmovesprites
	end

TrainerTwinsJoandzoe2:
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

TwinsJoandzoe2Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x72fc0
	closetext
	loadmovesprites
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext ERIKA, 1, $1
	jumpstd gymstatue2

UnknownText_0x72b28:
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

UnknownText_0x72c3e:
	text "ERIKA: Oh!"
	line "I concede defeat…"

	para "You are remarkably"
	line "strong…"

	para "I shall give you"
	line "RAINBOWBADGE…"
	done

UnknownText_0x72c96:
	text "<PLAYER> received"
	line "RAINBOWBADGE."
	done

UnknownText_0x72cb0:
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

UnknownText_0x72d8f:
	text "ERIKA: Losing"
	line "leaves a bitter"
	cont "aftertaste…"

	para "But knowing that"
	line "there are strong"

	para "trainers spurs me"
	line "to do better…"
	done

LassMichelleSeenText:
	text "Do you think a"
	line "girls-only GYM"
	cont "is rare?"
	done

LassMichelleBeatenText:
	text "Oh, bleah!"
	done

UnknownText_0x72e30:
	text "I just got care-"
	line "less, that's all!"
	done

PicnickerTanyaSeenText:
	text "Oh, a battle?"
	line "That's kind of"
	cont "scary, but OK!"
	done

PicnickerTanyaBeatenText:
	text "Oh, that's it?"
	done

UnknownText_0x72e8e:
	text "Oh, look at all"
	line "your BADGES. No"

	para "wonder I couldn't"
	line "win!"
	done

BeautyJuliaSeenText:
	text "Were you looking"
	line "at these flowers"
	cont "or at me?"
	done

BeautyJuliaBeatenText:
	text "How annoying!"
	done

UnknownText_0x72f01:
	text "How do I go about"
	line "becoming ladylike"
	cont "like ERIKA?"
	done

TwinsJoandzoe1SeenText:
	text "We'll show you"
	line "#MON moves that"
	cont "ERIKA taught us!"
	done

TwinsJoandzoe1BeatenText:
	text "Oh… We lost…"
	done

UnknownText_0x72f70:
	text "ERIKA will get you"
	line "back for us!"
	done

TwinsJoandzoe2SeenText:
	text "We're going to"
	line "protect ERIKA!"
	done

TwinsJoandzoe2BeatenText:
	text "We couldn't win…"
	done

UnknownText_0x72fc0:
	text "ERIKA is much,"
	line "much stronger!"
	done

CeladonGym_MapEventHeader:
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
	signpost 15, 3, $0, CeladonGymStatue
	signpost 15, 6, $0, CeladonGymStatue

	; people-events
	db 6
	person_event SPRITE_ERIKA, 7, 9, $6, $0, 255, 255, $a0, 0, ErikaScript_0x72a6a, $ffff
	person_event SPRITE_LASS, 12, 11, $8, $0, 255, 255, $92, 2, TrainerLassMichelle, $ffff
	person_event SPRITE_LASS, 12, 6, $9, $0, 255, 255, $a2, 2, TrainerPicnickerTanya, $ffff
	person_event SPRITE_BUENA, 9, 7, $9, $0, 255, 255, $92, 2, TrainerBeautyJulia, $ffff
	person_event SPRITE_TWIN, 14, 8, $6, $0, 255, 255, $82, 1, TrainerTwinsJoandzoe1, $ffff
	person_event SPRITE_TWIN, 14, 9, $6, $0, 255, 255, $82, 1, TrainerTwinsJoandzoe2, $ffff
