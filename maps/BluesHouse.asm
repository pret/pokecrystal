const_value set 2
	const BLUESHOUSE_DAISY

BluesHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

DaisyScript_0x19b0d0:
	faceplayer
	opentext
	checkcode VAR_HOUR
	if_equal $f, UnknownScript_0x19b0de
	writetext UnknownText_0x19b130
	waitbutton
	closetext
	end

UnknownScript_0x19b0de:
	checkflag ENGINE_TEA_IN_BLUES_HOUSE
	iftrue UnknownScript_0x19b11e
	writetext UnknownText_0x19b1b6
	yesorno
	iffalse UnknownScript_0x19b124
	writetext UnknownText_0x19b244
	waitbutton
	special Special_DaisyMassage
	if_equal 0, UnknownScript_0x19b124
	if_equal 1, UnknownScript_0x19b12a
	setflag ENGINE_TEA_IN_BLUES_HOUSE
	writetext UnknownText_0x19b266
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext UnknownText_0x19b296
	special PlayCurMonCry
	buttonsound
	writetext UnknownText_0x19b2aa
	waitbutton
	closetext
	end

UnknownScript_0x19b11e:
	writetext UnknownText_0x19b2fa
	waitbutton
	closetext
	end

UnknownScript_0x19b124:
	writetext UnknownText_0x19b334
	waitbutton
	closetext
	end

UnknownScript_0x19b12a:
	writetext UnknownText_0x19b377
	waitbutton
	closetext
	end

UnknownText_0x19b130:
	text "DAISY: Hi! My kid"
	line "brother is the GYM"

	para "LEADER in VIRIDIAN"
	line "CITY."

	para "But he goes out"
	line "of town so often,"

	para "it causes problems"
	line "for the trainers."
	done

UnknownText_0x19b1b6:
	text "DAISY: Hi! Good"
	line "timing. I'm about"
	cont "to have some tea."

	para "Would you like to"
	line "join me?"

	para "Oh, your #MON"
	line "are a bit dirty."

	para "Would you like me"
	line "to groom one?"
	done

UnknownText_0x19b244:
	text "DAISY: Which one"
	line "should I groom?"
	done

UnknownText_0x19b266:
	text "DAISY: OK, I'll"
	line "get it looking"
	cont "nice in no time."
	done

UnknownText_0x19b296:
	text_from_ram StringBuffer3
	text " looks"
	line "content."
	done

UnknownText_0x19b2aa:
	text "DAISY: There you"
	line "go! All done."

	para "See? Doesn't it"
	line "look nice?"

	para "It's such a cute"
	line "#MON."
	done

UnknownText_0x19b2fa:
	text "DAISY: I always"
	line "have tea around"

	para "this time. Come"
	line "join me."
	done

UnknownText_0x19b334:
	text "DAISY: You don't"
	line "want to have one"

	para "groomed? OK, we'll"
	line "just have tea."
	done

UnknownText_0x19b377:
	text "DAISY: Oh, sorry."
	line "I honestly can't"
	cont "groom an EGG."
	done

BluesHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, PALLET_TOWN
	warp_def $7, $3, 2, PALLET_TOWN

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_DAISY, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DaisyScript_0x19b0d0, -1
