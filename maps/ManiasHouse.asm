ManiasHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RockerScript_0x9d278:
	faceplayer
	loadfont
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue UnknownScript_0x9d2fa
	checkevent EVENT_GOT_SHUCKIE
	iftrue UnknownScript_0x9d2a4
	writetext UnknownText_0x9d303
	yesorno
	iffalse UnknownScript_0x9d2b6
	special SpecialGiveShuckle
	iffalse UnknownScript_0x9d2b0
	writetext UnknownText_0x9d3ed
	keeptextopen
	waitbutton
	writetext UnknownText_0x9d41b
	playsound SFX_KEY_ITEM
	waitbutton
	loadmovesprites
	setevent EVENT_GOT_SHUCKIE
	end

UnknownScript_0x9d2a4:
	checkflag ENGINE_SHUCKLE_GIVEN
	iffalse UnknownScript_0x9d2bc
	writetext UnknownText_0x9d3ed
	closetext
	loadmovesprites
	end

UnknownScript_0x9d2b0:
	writetext UnknownText_0x9d42f
	closetext
	loadmovesprites
	end

UnknownScript_0x9d2b6:
	writetext UnknownText_0x9d449
	closetext
	loadmovesprites
	end

UnknownScript_0x9d2bc:
	writetext UnknownText_0x9d470
	yesorno
	iffalse UnknownScript_0x9d2ee
	special SpecialReturnShuckle
	if_equal $0, UnknownScript_0x9d2df
	if_equal $1, UnknownScript_0x9d2ee
	if_equal $3, UnknownScript_0x9d2e5
	if_equal $4, UnknownScript_0x9d2fa
	writetext UnknownText_0x9d4b1
	closetext
	loadmovesprites
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

UnknownScript_0x9d2df:
	writetext UnknownText_0x9d4bd
	closetext
	loadmovesprites
	end

UnknownScript_0x9d2e5:
	writetext UnknownText_0x9d4e3
	closetext
	loadmovesprites
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

UnknownScript_0x9d2ee:
	writetext UnknownText_0x9d53f
	closetext
	loadmovesprites
	end

UnknownScript_0x9d2f4:
	writetext UnknownText_0x9d5b0
	closetext
	loadmovesprites
	end

UnknownScript_0x9d2fa:
	writetext UnknownText_0x9d56c
	closetext
	loadmovesprites
	end

UnknownScript_0x9d300:
	jumpstd picturebookshelf

UnknownText_0x9d303:
	text "I, I'm in shock!"

	para "A guy about your"
	line "age with piercing"

	para "eyes and long hair"
	line "came in."

	para "He scared me into"
	line "giving him my"
	cont "prized #MON!"

	para "I still have one"
	line "left, but what if"
	cont "he comes back?"

	para "You look strong."
	line "Could you look"

	para "after my #MON"
	line "for a while?"
	done

UnknownText_0x9d3ed:
	text "Oh, thank you!"

	para "Take good care of"
	line "it, please!"
	done

UnknownText_0x9d41b:
	text "<PLAYER> received a"
	line "#MON."
	done

UnknownText_0x9d42f:
	text "Your #MON party"
	line "is full."
	done

UnknownText_0x9d449:
	text "Oh, no… What'll"
	line "I do if he comes"
	cont "back?"
	done

UnknownText_0x9d470:
	text "Hi! How's my #-"
	line "MON?"

	para "I think I'm safe"
	line "now, so may I have"
	cont "it back?"
	done

UnknownText_0x9d4b1:
	text "Thank you!"
	done

UnknownText_0x9d4bd:
	text "Hey, you don't"
	line "have my #MON"
	cont "with you."
	done

UnknownText_0x9d4e3:
	text "My #MON has"
	line "come to like you."

	para "All right, you"
	line "should keep it."

	para "But promise to"
	line "be good to it!"
	done

UnknownText_0x9d53f:
	text "Oh, no, no… That's"
	line "the same as being"
	cont "robbed."
	done

UnknownText_0x9d56c:
	text "For #MON, hap-"
	line "piness is being"

	para "with a person who"
	line "treats them well."
	done

UnknownText_0x9d5b0:
	text "If I take my #-"
	line "MON back, what are"

	para "you going to use"
	line "in battle?"
	done

ManiasHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 1, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_ROCKER, 8, 6, OW_DOWN | $3, $0, -1, -1, $0, 0, RockerScript_0x9d278, -1
