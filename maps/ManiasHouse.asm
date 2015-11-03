ManiasHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ManiaScript:
	faceplayer
	loadfont
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckle
	yesorno
	iffalse .refusetotakeshuckie
	special SpecialGiveShuckle
	iffalse .partyfull
	writetext ManiaText_TakeCareOfShuckle
	keeptextopen
	waitbutton
	writetext ManiaText_GotShuckle
	playsound SFX_KEY_ITEM
	waitbutton
	loadmovesprites
	setevent EVENT_GOT_SHUCKIE
	end

.alreadyhaveshuckie:
	checkflag ENGINE_SHUCKLE_GIVEN
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfShuckle
	closetext
	loadmovesprites
	end

.partyfull:
	writetext ManiaText_PartyFull
	closetext
	loadmovesprites
	end

.refusetotakeshuckie:
	writetext ManiaText_IfHeComesBack
	closetext
	loadmovesprites
	end

.returnshuckie:
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special SpecialReturnShuckle
	if_equal $0, .wrong
	if_equal $1, .refused
	if_equal $3, .superhappy
	if_equal $4, .default_postevent
	writetext ManiaText_ThankYou
	closetext
	loadmovesprites
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong:
	writetext ManiaText_ShuckleNotThere
	closetext
	loadmovesprites
	end

.superhappy:
	writetext ManiaText_ShuckleLikesYou
	closetext
	loadmovesprites
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused:
	writetext ManiaText_SameAsBeingRobbed
	closetext
	loadmovesprites
	end

.nothingleft:
	writetext ManiaText_ShuckleIsYourLastMon
	closetext
	loadmovesprites
	end

.default_postevent:
	writetext ManiaText_HappinessSpeech
	closetext
	loadmovesprites
	end

UnknownScript_0x9d300:
	jumpstd picturebookshelf

ManiaText_AskLookAfterShuckle:
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

ManiaText_TakeCareOfShuckle:
	text "Oh, thank you!"

	para "Take good care of"
	line "it, please!"
	done

ManiaText_GotShuckle:
	text "<PLAYER> received a"
	line "#MON."
	done

ManiaText_PartyFull:
	text "Your #MON party"
	line "is full."
	done

ManiaText_IfHeComesBack:
	text "Oh, no… What'll"
	line "I do if he comes"
	cont "back?"
	done

ManiaText_CanIHaveMyMonBack:
	text "Hi! How's my #-"
	line "MON?"

	para "I think I'm safe"
	line "now, so may I have"
	cont "it back?"
	done

ManiaText_ThankYou:
	text "Thank you!"
	done

ManiaText_ShuckleNotThere:
	text "Hey, you don't"
	line "have my #MON"
	cont "with you."
	done

ManiaText_ShuckleLikesYou:
	text "My #MON has"
	line "come to like you."

	para "All right, you"
	line "should keep it."

	para "But promise to"
	line "be good to it!"
	done

ManiaText_SameAsBeingRobbed:
	text "Oh, no, no… That's"
	line "the same as being"
	cont "robbed."
	done

ManiaText_HappinessSpeech:
	text "For #MON, hap-"
	line "piness is being"

	para "with a person who"
	line "treats them well."
	done

ManiaText_ShuckleIsYourLastMon:
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
	warp_def $7, $2, 1, CIANWOOD_CITY
	warp_def $7, $3, 1, CIANWOOD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_ROCKER, 4, 2, SPRITEMOVEDATA_03, 0, 0, -1, -1, 0, 0, 0, ManiaScript, -1
