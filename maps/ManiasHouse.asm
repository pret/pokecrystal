ManiasHouse_MapScriptHeader: ; 0x9d276
	; trigger count
	db 0

	; callback count
	db 0
; 0x9d278

RockerScript_0x9d278: ; 0x9d278
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
; 0x9d2a4

UnknownScript_0x9d2a4: ; 0x9d2a4
	checkflag $0055
	iffalse UnknownScript_0x9d2bc
	writetext UnknownText_0x9d3ed
	closetext
	loadmovesprites
	end
; 0x9d2b0

UnknownScript_0x9d2b0: ; 0x9d2b0
	writetext UnknownText_0x9d42f
	closetext
	loadmovesprites
	end
; 0x9d2b6

UnknownScript_0x9d2b6: ; 0x9d2b6
	writetext UnknownText_0x9d449
	closetext
	loadmovesprites
	end
; 0x9d2bc

UnknownScript_0x9d2bc: ; 0x9d2bc
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
; 0x9d2df

UnknownScript_0x9d2df: ; 0x9d2df
	writetext UnknownText_0x9d4bd
	closetext
	loadmovesprites
	end
; 0x9d2e5

UnknownScript_0x9d2e5: ; 0x9d2e5
	writetext UnknownText_0x9d4e3
	closetext
	loadmovesprites
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end
; 0x9d2ee

UnknownScript_0x9d2ee: ; 0x9d2ee
	writetext UnknownText_0x9d53f
	closetext
	loadmovesprites
	end
; 0x9d2f4

UnknownScript_0x9d2f4: ; 0x9d2f4
	writetext UnknownText_0x9d5b0
	closetext
	loadmovesprites
	end
; 0x9d2fa

UnknownScript_0x9d2fa: ; 0x9d2fa
	writetext UnknownText_0x9d56c
	closetext
	loadmovesprites
	end
; 0x9d300

UnknownScript_0x9d300: ; 0x9d300
	jumpstd picturebookshelf
; 0x9d303

UnknownText_0x9d303: ; 0x9d303
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
; 0x9d3ed

UnknownText_0x9d3ed: ; 0x9d3ed
	text "Oh, thank you!"

	para "Take good care of"
	line "it, please!"
	done
; 0x9d41b

UnknownText_0x9d41b: ; 0x9d41b
	text "<PLAYER> received a"
	line "#MON."
	done
; 0x9d42f

UnknownText_0x9d42f: ; 0x9d42f
	text "Your #MON party"
	line "is full."
	done
; 0x9d449

UnknownText_0x9d449: ; 0x9d449
	text "Oh, no… What'll"
	line "I do if he comes"
	cont "back?"
	done
; 0x9d470

UnknownText_0x9d470: ; 0x9d470
	text "Hi! How's my #-"
	line "MON?"

	para "I think I'm safe"
	line "now, so may I have"
	cont "it back?"
	done
; 0x9d4b1

UnknownText_0x9d4b1: ; 0x9d4b1
	text "Thank you!"
	done
; 0x9d4bd

UnknownText_0x9d4bd: ; 0x9d4bd
	text "Hey, you don't"
	line "have my #MON"
	cont "with you."
	done
; 0x9d4e3

UnknownText_0x9d4e3: ; 0x9d4e3
	text "My #MON has"
	line "come to like you."

	para "All right, you"
	line "should keep it."

	para "But promise to"
	line "be good to it!"
	done
; 0x9d53f

UnknownText_0x9d53f: ; 0x9d53f
	text "Oh, no, no… That's"
	line "the same as being"
	cont "robbed."
	done
; 0x9d56c

UnknownText_0x9d56c: ; 0x9d56c
	text "For #MON, hap-"
	line "piness is being"

	para "with a person who"
	line "treats them well."
	done
; 0x9d5b0

UnknownText_0x9d5b0: ; 0x9d5b0
	text "If I take my #-"
	line "MON back, what are"

	para "you going to use"
	line "in battle?"
	done
; 0x9d5f0

ManiasHouse_MapEventHeader: ; 0x9d5f0
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 1, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_ROCKER, 8, 6, $3, $0, 255, 255, $0, 0, RockerScript_0x9d278, $ffff
; 0x9d60d
