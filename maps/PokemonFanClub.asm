PokemonFanClub_MapScriptHeader: ; 0x1917e7
	; trigger count
	db 0

	; callback count
	db 0
; 0x1917e9

GentlemanScript_0x1917e9: ; 0x1917e9
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
UnknownScript_0x191802: ; 0x191802
	writetext UnknownText_0x191a3d
	keeptextopen
	verbosegiveitem RARE_CANDY, 1
	iffalse UnknownScript_0x19181f
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	writetext UnknownText_0x191a72
	closetext
	loadmovesprites
	end
; 0x191815

UnknownScript_0x191815: ; 0x191815
	writetext UnknownText_0x191ae0
	closetext
	loadmovesprites
	end
; 0x19181b

UnknownScript_0x19181b: ; 0x19181b
	writetext UnknownText_0x191b38
	closetext
UnknownScript_0x19181f: ; 0x19181f
	loadmovesprites
	end
; 0x191821

ReceptionistScript_0x191821: ; 0x191821
	jumptextfaceplayer UnknownText_0x191b6d
; 0x191824

FisherScript_0x191824: ; 0x191824
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
; 0x191838

UnknownScript_0x191838: ; 0x191838
	writetext UnknownText_0x191bff
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue UnknownScript_0x191844
	closetext
	loadmovesprites
	end
; 0x191844

UnknownScript_0x191844: ; 0x191844
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
; 0x19185f

UnknownScript_0x19185f: ; 0x19185f
	writetext UnknownText_0x191d1e
	closetext
	loadmovesprites
	end
; 0x191865

UnknownScript_0x191865: ; 0x191865
	writetext UnknownText_0x191d58
	closetext
	loadmovesprites
	end
; 0x19186b

TeacherScript_0x19186b: ; 0x19186b
	jumptextfaceplayer UnknownText_0x191d73
; 0x19186e

FairyScript_0x19186e: ; 0x19186e
	jumptext UnknownText_0x191db1
; 0x191871

OddishScript_0x191871: ; 0x191871
	loadfont
	writetext UnknownText_0x191de9
	cry BAYLEEF
	closetext
	loadmovesprites
	end
; 0x19187b

MapPokemonFanClubSignpost0Script: ; 0x19187b
	jumptext UnknownText_0x191dfc
; 0x19187e

MapPokemonFanClubSignpost1Script: ; 0x19187e
	jumptext UnknownText_0x191e29
; 0x191881

UnknownText_0x191881: ; 0x191881
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
; 0x191911

UnknownText_0x191911: ; 0x191911
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
; 0x191a3d

UnknownText_0x191a3d: ; 0x191a3d
	text "Thanks for hearing"
	line "me out. I want you"
	cont "to have this!"
	done
; 0x191a72

UnknownText_0x191a72: ; 0x191a72
	text "It's a RARE CANDY"
	line "that makes #MON"
	cont "stronger."

	para "I prefer making my"
	line "#MON stronger"

	para "by battling, so"
	line "you can have it."
	done
; 0x191ae0

UnknownText_0x191ae0: ; 0x191ae0
	text "Hello, ", $14, "!"

	para "Did you come see"
	line "me about my #-"
	cont "MON again?"

	para "No? Oh… I had more"
	line "tales to tell…"
	done
; 0x191b38

UnknownText_0x191b38: ; 0x191b38
	text "How disappointing…"

	para "Come back if you"
	line "want to listen."
	done
; 0x191b6d

UnknownText_0x191b6d: ; 0x191b6d
	text "Our CHAIRMAN is"
	line "very vocal when it"
	cont "comes to #MON…"
	done
; 0x191ba0

UnknownText_0x191ba0: ; 0x191ba0
	text "I love the way"
	line "CLEFAIRY waggles"

	para "its finger when"
	line "it's trying to use"

	para "METRONOME."
	line "It's so adorable!"
	done
; 0x191bff

UnknownText_0x191bff: ; 0x191bff
	text "I love CLEFAIRY,"
	line "but I could never"

	para "catch one. So I'm"
	line "making do with a"

	para "# DOLL that I"
	line "found."
	done
; 0x191c5a

UnknownText_0x191c5a: ; 0x191c5a
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
; 0x191d0a

UnknownText_0x191d0a: ; 0x191d0a
	text $52, " received"
	line "# DOLL."
	done
; 0x191d1e

UnknownText_0x191d1e: ; 0x191d1e
	text "You watch. I'm"
	line "going to get a"

	para "real CLEFAIRY as"
	line "my friend."
	done
; 0x191d58

UnknownText_0x191d58: ; 0x191d58
	text "Your PACK is"
	line "jammed full."
	done
; 0x191d73

UnknownText_0x191d73: ; 0x191d73
	text "Look at my darling"
	line "BAYLEEF!"

	para "The leaf on its"
	line "head is so cute!"
	done
; 0x191db1

UnknownText_0x191db1: ; 0x191db1
	text "It's a CLEFAIRY!"
	line "Huh?"

	para "Oh, right. It's a"
	line "CLEFAIRY #"
	cont "DOLL."
	done
; 0x191de9

UnknownText_0x191de9: ; 0x191de9
	text "BAYLEEF: Li liif!"
	done
; 0x191dfc

UnknownText_0x191dfc: ; 0x191dfc
	text "Let's all listen"
	line "politely to other"
	cont "trainers."
	done
; 0x191e29

UnknownText_0x191e29: ; 0x191e29
	text "If someone brags,"
	line "brag right back!"
	done
; 0x191e4d

PokemonFanClub_MapEventHeader: ; 0x191e4d
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $3, 3, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 7, $0, MapPokemonFanClubSignpost0Script
	signpost 0, 9, $0, MapPokemonFanClubSignpost1Script

	; people-events
	db 6
	person_event SPRITE_GENTLEMAN, 5, 7, $6, $0, 255, 255, $0, 0, GentlemanScript_0x1917e9, $ffff
	person_event SPRITE_RECEPTIONIST, 5, 8, $6, $0, 255, 255, $a0, 0, ReceptionistScript_0x191821, $ffff
	person_event SPRITE_FISHER, 7, 6, $9, $0, 255, 255, $0, 0, FisherScript_0x191824, $ffff
	person_event SPRITE_TEACHER, 6, 11, $8, $0, 255, 255, $0, 0, TeacherScript_0x19186b, $ffff
	person_event SPRITE_FAIRY, 8, 6, $6, $0, 255, 255, $0, 0, FairyScript_0x19186e, $0774
	person_event SPRITE_ODDISH, 7, 11, $16, $0, 255, 255, $a0, 0, OddishScript_0x191871, $ffff
; 0x191eb5

