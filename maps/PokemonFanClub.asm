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
	2writetext UnknownText_0x191881
	yesorno
	iffalse UnknownScript_0x19181b
	2writetext UnknownText_0x191911
	keeptextopen
UnknownScript_0x191802: ; 0x191802
	2writetext UnknownText_0x191a3d
	keeptextopen
	verbosegiveitem RARE_CANDY, 1
	iffalse UnknownScript_0x19181f
	setevent EVENT_LISTENED_TO_FAN_CLUB_PRESIDENT
	2writetext UnknownText_0x191a72
	closetext
	loadmovesprites
	end
; 0x191815

UnknownScript_0x191815: ; 0x191815
	2writetext UnknownText_0x191ae0
	closetext
	loadmovesprites
	end
; 0x19181b

UnknownScript_0x19181b: ; 0x19181b
	2writetext UnknownText_0x191b38
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
	2writetext UnknownText_0x191ba0
	closetext
	loadmovesprites
	end
; 0x191838

UnknownScript_0x191838: ; 0x191838
	2writetext UnknownText_0x191bff
	checkevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	iftrue UnknownScript_0x191844
	closetext
	loadmovesprites
	end
; 0x191844

UnknownScript_0x191844: ; 0x191844
	keeptextopen
	2writetext UnknownText_0x191c5a
	keeptextopen
	waitbutton
	giveitem LOST_ITEM, $1
	iffalse UnknownScript_0x191865
	disappear $6
	2writetext UnknownText_0x191d0a
	playsound $0091
	waitbutton
	itemnotify
	setevent EVENT_GOT_LOST_ITEM_FROM_FAN_CLUB
	loadmovesprites
	end
; 0x19185f

UnknownScript_0x19185f: ; 0x19185f
	2writetext UnknownText_0x191d1e
	closetext
	loadmovesprites
	end
; 0x191865

UnknownScript_0x191865: ; 0x191865
	2writetext UnknownText_0x191d58
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
	2writetext UnknownText_0x191de9
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
	db $0, "I'm the CHAIRMAN", $4f
	db "of the #MON FAN", $55
	db "CLUB.", $51
	db "I've raised over", $4f
	db "150 #MON.", $51
	db "I'm very fussy", $4f
	db "when it comes to", $55
	db "#MON.", $51
	db "Did you visit just", $4f
	db "to hear about my", $55
	db "#MON?", $57
; 0x191911

UnknownText_0x191911: ; 0x191911
	db $0, "Good!", $4f
	db "Then listen up!", $51
	db "So… my favorite", $4f
	db "RAPIDASH…", $51
	db "It… cute… lovely…", $4f
	db "smart… unbearably…", $55
	db "plus… amazing… oh…", $55
	db "you think so?…", $55
	db "Too much… wild…", $55
	db "beautiful… kindly…", $55
	db "love it!", $51
	db "Hug it… when…", $4f
	db "sleeping… warm and", $55
	db "cuddly… Oh, and…", $55
	db "spectacular…", $55
	db "ravishing… simply", $55
	db "divine…", $55
	db "Oops! Look at the", $55
	db "time! I've kept", $55
	db "you too long!", $57
; 0x191a3d

UnknownText_0x191a3d: ; 0x191a3d
	db $0, "Thanks for hearing", $4f
	db "me out. I want you", $55
	db "to have this!", $57
; 0x191a72

UnknownText_0x191a72: ; 0x191a72
	db $0, "It's a RARE CANDY", $4f
	db "that makes #MON", $55
	db "stronger.", $51
	db "I prefer making my", $4f
	db "#MON stronger", $51
	db "by battling, so", $4f
	db "you can have it.", $57
; 0x191ae0

UnknownText_0x191ae0: ; 0x191ae0
	db $0, "Hello, ", $14, "!", $51
	db "Did you come see", $4f
	db "me about my #-", $55
	db "MON again?", $51
	db "No? Oh… I had more", $4f
	db "tales to tell…", $57
; 0x191b38

UnknownText_0x191b38: ; 0x191b38
	db $0, "How disappointing…", $51
	db "Come back if you", $4f
	db "want to listen.", $57
; 0x191b6d

UnknownText_0x191b6d: ; 0x191b6d
	db $0, "Our CHAIRMAN is", $4f
	db "very vocal when it", $55
	db "comes to #MON…", $57
; 0x191ba0

UnknownText_0x191ba0: ; 0x191ba0
	db $0, "I love the way", $4f
	db "CLEFAIRY waggles", $51
	db "its finger when", $4f
	db "it's trying to use", $51
	db "METRONOME.", $4f
	db "It's so adorable!", $57
; 0x191bff

UnknownText_0x191bff: ; 0x191bff
	db $0, "I love CLEFAIRY,", $4f
	db "but I could never", $51
	db "catch one. So I'm", $4f
	db "making do with a", $51
	db "# DOLL that I", $4f
	db "found.", $57
; 0x191c5a

UnknownText_0x191c5a: ; 0x191c5a
	db $0, "Oh, I see now. The", $4f
	db "girl who lost this", $51
	db "# DOLL is sad…", $51
	db "OK. Could you take", $4f
	db "this # DOLL", $51
	db "back to that poor", $4f
	db "little girl?", $51
	db "I'll befriend a", $4f
	db "real CLEFAIRY on", $51
	db "my own one day.", $4f
	db "No worries!", $57
; 0x191d0a

UnknownText_0x191d0a: ; 0x191d0a
	db $0, $52, " received", $4f
	db "# DOLL.", $57
; 0x191d1e

UnknownText_0x191d1e: ; 0x191d1e
	db $0, "You watch. I'm", $4f
	db "going to get a", $51
	db "real CLEFAIRY as", $4f
	db "my friend.", $57
; 0x191d58

UnknownText_0x191d58: ; 0x191d58
	db $0, "Your PACK is", $4f
	db "jammed full.", $57
; 0x191d73

UnknownText_0x191d73: ; 0x191d73
	db $0, "Look at my darling", $4f
	db "BAYLEEF!", $51
	db "The leaf on its", $4f
	db "head is so cute!", $57
; 0x191db1

UnknownText_0x191db1: ; 0x191db1
	db $0, "It's a CLEFAIRY!", $4f
	db "Huh?", $51
	db "Oh, right. It's a", $4f
	db "CLEFAIRY #", $55
	db "DOLL.", $57
; 0x191de9

UnknownText_0x191de9: ; 0x191de9
	db $0, "BAYLEEF: Li liif!", $57
; 0x191dfc

UnknownText_0x191dfc: ; 0x191dfc
	db $0, "Let's all listen", $4f
	db "politely to other", $55
	db "trainers.", $57
; 0x191e29

UnknownText_0x191e29: ; 0x191e29
	db $0, "If someone brags,", $4f
	db "brag right back!", $57
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

