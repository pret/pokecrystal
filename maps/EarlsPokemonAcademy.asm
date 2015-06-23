EarlsPokemonAcademy_MapScriptHeader: ; 0x68a5a
	; trigger count
	db 0

	; callback count
	db 0
; 0x68a5c

FisherScript_0x68a5c: ; 0x68a5c
	applymovement $2, MovementData_0x68b2d
	faceplayer
	loadfont
	writetext UnknownText_0x68b3b
	yesorno
	iffalse UnknownScript_0x68a70
	writetext UnknownText_0x68bbd
	yesorno
	iffalse UnknownScript_0x68a7d
UnknownScript_0x68a70: ; 0x68a70
	writetext UnknownText_0x68c51
	yesorno
	iffalse UnknownScript_0x68a7d
	writetext UnknownText_0x68c7b
	closetext
	loadmovesprites
	end
; 0x68a7d

UnknownScript_0x68a7d: ; 0x68a7d
	writetext UnknownText_0x68d31
	closetext
	loadmovesprites
	end
; 0x68a83

YoungsterScript_0x68a83: ; 0x68a83
	jumptextfaceplayer UnknownText_0x68d80
; 0x68a86

GameboyKidScript_0x68a86: ; 0x68a86
	faceplayer
	loadfont
	writetext UnknownText_0x68dda
	closetext
	loadmovesprites
	spriteface $4, $0
	end
; 0x68a91

GameboyKidScript_0x68a91: ; 0x68a91
	faceplayer
	loadfont
	writetext UnknownText_0x68e07
	closetext
	loadmovesprites
	spriteface $5, $0
	end
; 0x68a9c

YoungsterScript_0x68a9c: ; 0x68a9c
	jumptextfaceplayer UnknownText_0x68e39
; 0x68a9f

MapEarlsPokemonAcademySignpost3Script: ; 0x68a9f
	loadfont
	writetext UnknownText_0x68eb2
UnknownScript_0x68aa3: ; 0x68aa3
	loadmenudata MenuDataHeader_0x68ae1
	interpretmenu
	writebackup
	if_equal $1, UnknownScript_0x68abe
	if_equal $2, UnknownScript_0x68ac5
	if_equal $3, UnknownScript_0x68acc
	if_equal $4, UnknownScript_0x68ad3
	if_equal $5, UnknownScript_0x68ada
	loadmovesprites
	end
; 0x68abe

UnknownScript_0x68abe: ; 0x68abe
	writetext UnknownText_0x68efe
	closetext
	jump UnknownScript_0x68aa3
; 0x68ac5

UnknownScript_0x68ac5: ; 0x68ac5
	writetext UnknownText_0x68f80
	closetext
	jump UnknownScript_0x68aa3
; 0x68acc

UnknownScript_0x68acc: ; 0x68acc
	writetext UnknownText_0x68fe2
	closetext
	jump UnknownScript_0x68aa3
; 0x68ad3

UnknownScript_0x68ad3: ; 0x68ad3
	writetext UnknownText_0x69055
	closetext
	jump UnknownScript_0x68aa3
; 0x68ada

UnknownScript_0x68ada: ; 0x68ada
	writetext UnknownText_0x690cb
	closetext
	jump UnknownScript_0x68aa3
; 0x68ae1


MenuDataHeader_0x68ae1: ; 0x68ae1
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 11 ; end coords
	dw MenuData2_0x68ae9
	db 1 ; default option
; 0x68ae9

MenuData2_0x68ae9: ; 0x68ae9
	db $80 ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dbw BANK(UnknownText_0x68af2), UnknownText_0x68af2
	dbw $1a, $0000
; 0x68af2

UnknownText_0x68af2: ; 0x68af2
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"
; 0x68b0b


PokedexScript_0x68b0b: ; 0x68b0b
	loadfont
	writetext UnknownText_0x69136
	yesorno
	iffalse UnknownScript_0x68b25
	writetext UnknownText_0x69197
	yesorno
	iffalse UnknownScript_0x68b25
	writetext UnknownText_0x69207
	yesorno
	iffalse UnknownScript_0x68b25
	writetext UnknownText_0x69287
	closetext
UnknownScript_0x68b25: ; 0x68b25
	loadmovesprites
	end
; 0x68b27

UnknownScript_0x68b27: ; 0x68b27
	jumptext UnknownText_0x69344
; 0x68b2a

MapEarlsPokemonAcademySignpost1Script: ; 0x68b2a
	jumpstd difficultbookshelf
; 0x68b2d

MovementData_0x68b2d: ; 0x68b2d
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	step_end
; 0x68b3b

UnknownText_0x68b3b: ; 0x68b3b
	text "EARL, I am!"

	para "Wonderful are"
	line "#MON, yes!"

	para "Teach you I will"
	line "to be a better"
	cont "trainer!"

	para "What you want to"
	line "know? Want to be"
	cont "a winner is you?"
	done
; 0x68bbd

UnknownText_0x68bbd: ; 0x68bbd
	text "Good! Teach you,"
	line "I will!"

	para "In battle, #MON"
	line "top on list jump"
	cont "out first!"

	para "Change order in"
	line "list, make battle"
	cont "easy, maybe!"

	para "More from me you"
	line "want to hear?"
	done
; 0x68c51

UnknownText_0x68c51: ; 0x68c51
	text "So, want to know"
	line "how to raise"
	cont "#MON well?"
	done
; 0x68c7b

UnknownText_0x68c7b: ; 0x68c7b
	text "Fine! Teach you,"
	line "I will!"

	para "If #MON come"
	line "out in battle even"

	para "briefly, some EXP."
	line "Points it gets."

	para "At top of list put"
	line "weak #MON."

	para "Switch in battle"
	line "quick!"

	para "This way, weak"
	line "#MON strong"
	cont "become!"
	done
; 0x68d31

UnknownText_0x68d31: ; 0x68d31
	text "Oh! Smart student"
	line "you are! Nothing"
	cont "more do I teach!"

	para "Good to #MON"
	line "you must be!"
	done
; 0x68d80

UnknownText_0x68d80: ; 0x68d80
	text "I'm taking notes"
	line "of the teacher's"
	cont "lecture."

	para "I'd better copy"
	line "the stuff on the"
	cont "blackboard too."
	done
; 0x68dda

UnknownText_0x68dda: ; 0x68dda
	text "I traded my best"
	line "#MON to the"
	cont "guy beside me."
	done
; 0x68e07

UnknownText_0x68e07: ; 0x68e07
	text "Huh? The #MON I"
	line "just got is hold-"
	cont "ing something!"
	done
; 0x68e39

UnknownText_0x68e39: ; 0x68e39
	text "A #MON holding"
	line "a BERRY will heal"
	cont "itself in battle."

	para "Many other items"
	line "can be held by"
	cont "#MON…"

	para "It sure is tough"
	line "taking notes…"
	done
; 0x68eb2

UnknownText_0x68eb2: ; 0x68eb2
	text "The blackboard"
	line "describes #MON"

	para "status changes in"
	line "battle."
	done
; 0x68eeb

UnknownText_0x68eeb: ; 0x68eeb
	text "Read which topic?"
	done
; 0x68efe

UnknownText_0x68efe: ; 0x68efe
	text "If poisoned, a"
	line "#MON steadily"
	cont "loses HP."

	para "Poison lingers"
	line "after the battle,"

	para "and HP is lost as"
	line "you walk."

	para "To cure it, use an"
	line "ANTIDOTE."
	done
; 0x68f80

UnknownText_0x68f80: ; 0x68f80
	text "Paralysis reduces"
	line "speed and may"
	cont "prevent movement."

	para "It remains after"
	line "battle, so use"
	cont "a PARLYZ HEAL."
	done
; 0x68fe2

UnknownText_0x68fe2: ; 0x68fe2
	text "If asleep, your"
	line "#MON can't make"
	cont "a move."

	para "A sleeping #MON"
	line "doesn't wake up"
	cont "after battle."

	para "Wake it up with"
	line "an AWAKENING."
	done
; 0x69055

UnknownText_0x69055: ; 0x69055
	text "A burn steadily"
	line "consumes HP."

	para "It also reduces"
	line "attack power."

	para "A burn lingers"
	line "after battle."

	para "Use a BURN HEAL as"
	line "the cure."
	done
; 0x690cb

UnknownText_0x690cb: ; 0x690cb
	text "If your #MON is"
	line "frozen, it can't"
	cont "do a thing."

	para "It remains frozen"
	line "after battle."

	para "Thaw it out with"
	line "an ICE HEAL."
	done
; 0x69136

UnknownText_0x69136: ; 0x69136
	text "It's this kid's"
	line "notebook…"

	para "Catch #MON"
	line "using # BALLS."

	para "Up to six can be"
	line "in your party."

	para "Keep reading?"
	done
; 0x69197

UnknownText_0x69197: ; 0x69197
	text "Before throwing a"
	line "# BALL, weaken"
	cont "the target first."

	para "A poisoned or"
	line "burned #MON is"
	cont "easier to catch."

	para "Keep reading?"
	done
; 0x69207

UnknownText_0x69207: ; 0x69207
	text "Some moves may"
	line "cause confusion."

	para "Confusion may make"
	line "a #MON attack"
	cont "itself."

	para "Leaving battle"
	line "clears up any"
	cont "confusion."

	para "Keep reading?"
	done
; 0x69287

UnknownText_0x69287: ; 0x69287
	text "People who catch"
	line "and use #MON"

	para "in battle are"
	line "#MON trainers."

	para "They are expected"
	line "to visit #MON"

	para "GYMS and defeat"
	line "other trainers."

	para "The next page"
	line "is… Blank!"

	para "Boy: E-he-he…"

	para "I haven't written"
	line "anymore…"
	done
; 0x69344

UnknownText_0x69344: ; 0x69344
	text "This super machine"
	line "prints data out as"

	para "stickers!"
	done
; 0x69375

EarlsPokemonAcademy_MapEventHeader: ; 0x69375
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $3, 3, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $f, $4, 3, GROUP_VIOLET_CITY, MAP_VIOLET_CITY

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 1, 0, $0, MapEarlsPokemonAcademySignpost1Script
	signpost 1, 1, $0, MapEarlsPokemonAcademySignpost1Script
	signpost 0, 3, $0, MapEarlsPokemonAcademySignpost3Script
	signpost 0, 4, $0, MapEarlsPokemonAcademySignpost3Script

	; people-events
	db 6
	person_event SPRITE_FISHER, 6, 8, $6, $0, 255, 255, $a0, 0, FisherScript_0x68a5c, $06cb
	person_event SPRITE_YOUNGSTER, 9, 6, $7, $0, 255, 255, $80, 0, YoungsterScript_0x68a83, $ffff
	person_event SPRITE_GAMEBOY_KID, 15, 7, $6, $0, 255, 255, $0, 0, GameboyKidScript_0x68a86, $ffff
	person_event SPRITE_GAMEBOY_KID, 15, 8, $8, $0, 255, 255, $80, 0, GameboyKidScript_0x68a91, $ffff
	person_event SPRITE_YOUNGSTER, 11, 8, $7, $0, 255, 255, $0, 0, YoungsterScript_0x68a9c, $ffff
	person_event SPRITE_POKEDEX, 8, 6, $1, $0, 255, 255, $0, 0, PokedexScript_0x68b0b, $ffff
; 0x693e7
