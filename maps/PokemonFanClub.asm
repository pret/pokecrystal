const_value set 2
	const POKEMONFANCLUB_GENTLEMAN
	const POKEMONFANCLUB_RECEPTIONIST
	const POKEMONFANCLUB_FISHER
	const POKEMONFANCLUB_TEACHER
	const POKEMONFANCLUB_FAIRY
	const POKEMONFANCLUB_ODDISH

PokemonFanClub_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

GentlemanScript_0x1917e9:
	faceplayer
	opentext
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue UnknownScript_0x191815
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue UnknownScript_0x191802
	writetext UnknownText_0x191881
	yesorno
	iffalse UnknownScript_0x19181b
	writetext UnknownText_0x191911
	buttonsound
UnknownScript_0x191802:
	writetext UnknownText_0x191a3d
	buttonsound
	verbosegiveitem RARE_CANDY
	iffalse UnknownScript_0x19181f
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext UnknownText_0x191a72
	waitbutton
	closetext
	end

UnknownScript_0x191815:
	writetext UnknownText_0x191ae0
	waitbutton
	closetext
	end

UnknownScript_0x19181b:
	writetext UnknownText_0x191b38
	waitbutton
UnknownScript_0x19181f:
	closetext
	end

PokemonFanClubReceptionistScript:
	jumptextfaceplayer PokemonFanClubReceptionistText

FisherScript_0x191824:
	faceplayer
	opentext
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue UnknownScript_0x19185f
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x191838
	writetext UnknownText_0x191ba0
	waitbutton
	closetext
	end

UnknownScript_0x191838:
	writetext UnknownText_0x191bff
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue UnknownScript_0x191844
	waitbutton
	closetext
	end

UnknownScript_0x191844:
	buttonsound
	writetext UnknownText_0x191c5a
	buttonsound
	waitsfx
	giveitem LOST_ITEM
	iffalse UnknownScript_0x191865
	disappear POKEMONFANCLUB_FAIRY
	writetext UnknownText_0x191d0a
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	closetext
	end

UnknownScript_0x19185f:
	writetext UnknownText_0x191d1e
	waitbutton
	closetext
	end

UnknownScript_0x191865:
	writetext UnknownText_0x191d58
	waitbutton
	closetext
	end

PokemonFanClubTeacherScript:
	jumptextfaceplayer PokemonFanClubTeacherText

ClefairyDoll:
	jumptext ClefairyDollText

FanClubBayleef:
	opentext
	writetext FanClubBayleefText
	cry BAYLEEF
	waitbutton
	closetext
	end

MapPokemonFanClubSignpost0Script:
	jumptext UnknownText_0x191dfc

MapPokemonFanClubSignpost1Script:
	jumptext UnknownText_0x191e29

UnknownText_0x191881:
	text "I'm the CHAIRMAN"
	line "of the #MON FAN"
	cont "CLUB."

	para "I've raised over"
	line "150 #MON."

	para "I'm very fussy"
	line "when it comes to"
	cont "#MON."

	para "Did you visit just"
	line "to hear about my"
	cont "#MON?"
	done

UnknownText_0x191911:
	text "Good!"
	line "Then listen up!"

	para "So… my favorite"
	line "RAPIDASH…"

	para "It… cute… lovely…"
	line "smart… unbearably…"
	cont "plus… amazing… oh…"
	cont "you think so?…"
	cont "Too much… wild…"
	cont "beautiful… kindly…"
	cont "love it!"

	para "Hug it… when…"
	line "sleeping… warm and"
	cont "cuddly… Oh, and…"
	cont "spectacular…"
	cont "ravishing… simply"
	cont "divine…"
	cont "Oops! Look at the"
	cont "time! I've kept"
	cont "you too long!"
	done

UnknownText_0x191a3d:
	text "Thanks for hearing"
	line "me out. I want you"
	cont "to have this!"
	done

UnknownText_0x191a72:
	text "It's a RARE CANDY"
	line "that makes #MON"
	cont "stronger."

	para "I prefer making my"
	line "#MON stronger"

	para "by battling, so"
	line "you can have it."
	done

UnknownText_0x191ae0:
	text "Hello, <PLAY_G>!"

	para "Did you come see"
	line "me about my #-"
	cont "MON again?"

	para "No? Oh… I had more"
	line "tales to tell…"
	done

UnknownText_0x191b38:
	text "How disappointing…"

	para "Come back if you"
	line "want to listen."
	done

PokemonFanClubReceptionistText:
	text "Our CHAIRMAN is"
	line "very vocal when it"
	cont "comes to #MON…"
	done

UnknownText_0x191ba0:
	text "I love the way"
	line "CLEFAIRY waggles"

	para "its finger when"
	line "it's trying to use"

	para "METRONOME."
	line "It's so adorable!"
	done

UnknownText_0x191bff:
	text "I love CLEFAIRY,"
	line "but I could never"

	para "catch one. So I'm"
	line "making do with a"

	para "# DOLL that I"
	line "found."
	done

UnknownText_0x191c5a:
	text "Oh, I see now. The"
	line "girl who lost this"

	para "# DOLL is sad…"

	para "OK. Could you take"
	line "this # DOLL"

	para "back to that poor"
	line "little girl?"

	para "I'll befriend a"
	line "real CLEFAIRY on"

	para "my own one day."
	line "No worries!"
	done

UnknownText_0x191d0a:
	text "<PLAYER> received"
	line "# DOLL."
	done

UnknownText_0x191d1e:
	text "You watch. I'm"
	line "going to get a"

	para "real CLEFAIRY as"
	line "my friend."
	done

UnknownText_0x191d58:
	text "Your PACK is"
	line "jammed full."
	done

PokemonFanClubTeacherText:
	text "Look at my darling"
	line "BAYLEEF!"

	para "The leaf on its"
	line "head is so cute!"
	done

ClefairyDollText:
	text "It's a CLEFAIRY!"
	line "Huh?"

	para "Oh, right. It's a"
	line "CLEFAIRY #"
	cont "DOLL."
	done

FanClubBayleefText:
	text "BAYLEEF: Li liif!"
	done

UnknownText_0x191dfc:
	text "Let's all listen"
	line "politely to other"
	cont "trainers."
	done

UnknownText_0x191e29:
	text "If someone brags,"
	line "brag right back!"
	done

PokemonFanClub_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 3, VERMILION_CITY
	warp_def 3, 7, 3, VERMILION_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 7, 0, BGEVENT_READ, MapPokemonFanClubSignpost0Script
	bg_event 9, 0, BGEVENT_READ, MapPokemonFanClubSignpost1Script

.ObjectEvents:
	db 6
	object_event 3, 1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GentlemanScript_0x1917e9, -1
	object_event 4, 1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokemonFanClubReceptionistScript, -1
	object_event 2, 3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FisherScript_0x191824, -1
	object_event 7, 2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokemonFanClubTeacherScript, -1
	object_event 2, 4, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ClefairyDoll, EVENT_VERMILION_FAN_CLUB_DOLL
	object_event 7, 3, SPRITE_ODDISH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FanClubBayleef, -1
