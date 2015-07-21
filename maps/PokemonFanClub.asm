PokemonFanClub_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GentlemanScript_0x1917e9:
	faceplayer
	loadfont
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	iftrue UnknownScript_0x191815
	checkevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT_BUT_BAG_WAS_FULL
	iftrue UnknownScript_0x191802
	writetext UnknownText_0x191881
	yesorno
	iffalse UnknownScript_0x19181b
	writetext UnknownText_0x191911
	keeptextopen
UnknownScript_0x191802:
	writetext UnknownText_0x191a3d
	keeptextopen
	verbosegiveitem RARE_CANDY, 1
	iffalse UnknownScript_0x19181f
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext UnknownText_0x191a72
	closetext
	loadmovesprites
	end

UnknownScript_0x191815:
	writetext UnknownText_0x191ae0
	closetext
	loadmovesprites
	end

UnknownScript_0x19181b:
	writetext UnknownText_0x191b38
	closetext
UnknownScript_0x19181f:
	loadmovesprites
	end

ReceptionistScript_0x191821:
	jumptextfaceplayer UnknownText_0x191b6d

FisherScript_0x191824:
	faceplayer
	loadfont
	checkevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	iftrue UnknownScript_0x19185f
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x191838
	writetext UnknownText_0x191ba0
	closetext
	loadmovesprites
	end

UnknownScript_0x191838:
	writetext UnknownText_0x191bff
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue UnknownScript_0x191844
	closetext
	loadmovesprites
	end

UnknownScript_0x191844:
	keeptextopen
	writetext UnknownText_0x191c5a
	keeptextopen
	waitbutton
	giveitem LOST_ITEM, $1
	iffalse UnknownScript_0x191865
	disappear $6
	writetext UnknownText_0x191d0a
	playsound SFX_KEY_ITEM
	waitbutton
	itemnotify
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	loadmovesprites
	end

UnknownScript_0x19185f:
	writetext UnknownText_0x191d1e
	closetext
	loadmovesprites
	end

UnknownScript_0x191865:
	writetext UnknownText_0x191d58
	closetext
	loadmovesprites
	end

TeacherScript_0x19186b:
	jumptextfaceplayer UnknownText_0x191d73

FairyScript_0x19186e:
	jumptext UnknownText_0x191db1

OddishScript_0x191871:
	loadfont
	writetext UnknownText_0x191de9
	cry BAYLEEF
	closetext
	loadmovesprites
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

UnknownText_0x191b6d:
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

UnknownText_0x191d73:
	text "Look at my darling"
	line "BAYLEEF!"

	para "The leaf on its"
	line "head is so cute!"
	done

UnknownText_0x191db1:
	text "It's a CLEFAIRY!"
	line "Huh?"

	para "Oh, right. It's a"
	line "CLEFAIRY #"
	cont "DOLL."
	done

UnknownText_0x191de9:
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

PokemonFanClub_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $3, 3, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 0, 7, SIGNPOST_READ, MapPokemonFanClubSignpost0Script
	signpost 0, 9, SIGNPOST_READ, MapPokemonFanClubSignpost1Script

.PersonEvents:
	db 6
	person_event SPRITE_GENTLEMAN, 5, 7, OW_UP | $2, $0, -1, -1, $0, 0, GentlemanScript_0x1917e9, -1
	person_event SPRITE_RECEPTIONIST, 5, 8, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, ReceptionistScript_0x191821, -1
	person_event SPRITE_FISHER, 7, 6, OW_LEFT | $1, $0, -1, -1, $0, 0, FisherScript_0x191824, -1
	person_event SPRITE_TEACHER, 6, 11, OW_LEFT | $0, $0, -1, -1, $0, 0, TeacherScript_0x19186b, -1
	person_event SPRITE_FAIRY, 8, 6, OW_UP | $2, $0, -1, -1, $0, 0, FairyScript_0x19186e, EVENT_VERMILION_FAN_CLUB_DOLL
	person_event SPRITE_ODDISH, 7, 11, OW_UP | $12, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, OddishScript_0x191871, -1
