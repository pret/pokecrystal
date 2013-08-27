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
	2writetext UnknownText_0x68b3b
	yesorno
	iffalse UnknownScript_0x68a70
	2writetext UnknownText_0x68bbd
	yesorno
	iffalse UnknownScript_0x68a7d
UnknownScript_0x68a70: ; 0x68a70
	2writetext UnknownText_0x68c51
	yesorno
	iffalse UnknownScript_0x68a7d
	2writetext UnknownText_0x68c7b
	closetext
	loadmovesprites
	end
; 0x68a7d

UnknownScript_0x68a7d: ; 0x68a7d
	2writetext UnknownText_0x68d31
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
	2writetext UnknownText_0x68dda
	closetext
	loadmovesprites
	spriteface $4, $0
	end
; 0x68a91

GameboyKidScript_0x68a91: ; 0x68a91
	faceplayer
	loadfont
	2writetext UnknownText_0x68e07
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
	2writetext UnknownText_0x68eb2
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
	2writetext UnknownText_0x68efe
	closetext
	2jump UnknownScript_0x68aa3
; 0x68ac5

UnknownScript_0x68ac5: ; 0x68ac5
	2writetext UnknownText_0x68f80
	closetext
	2jump UnknownScript_0x68aa3
; 0x68acc

UnknownScript_0x68acc: ; 0x68acc
	2writetext UnknownText_0x68fe2
	closetext
	2jump UnknownScript_0x68aa3
; 0x68ad3

UnknownScript_0x68ad3: ; 0x68ad3
	2writetext UnknownText_0x69055
	closetext
	2jump UnknownScript_0x68aa3
; 0x68ada

UnknownScript_0x68ada: ; 0x68ada
	2writetext UnknownText_0x690cb
	closetext
	2jump UnknownScript_0x68aa3
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
	2writetext UnknownText_0x69136
	yesorno
	iffalse UnknownScript_0x68b25
	2writetext UnknownText_0x69197
	yesorno
	iffalse UnknownScript_0x68b25
	2writetext UnknownText_0x69207
	yesorno
	iffalse UnknownScript_0x68b25
	2writetext UnknownText_0x69287
	closetext
UnknownScript_0x68b25: ; 0x68b25
	loadmovesprites
	end
; 0x68b27

UnknownScript_0x68b27: ; 0x68b27
	jumptext UnknownText_0x69344
; 0x68b2a

MapEarlsPokemonAcademySignpost1Script: ; 0x68b2a
	jumpstd $0001
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
	db $0, "EARL, I am!", $51
	db "Wonderful are", $4f
	db "#MON, yes!", $51
	db "Teach you I will", $4f
	db "to be a better", $55
	db "trainer!", $51
	db "What you want to", $4f
	db "know? Want to be", $55
	db "a winner is you?", $57
; 0x68bbd

UnknownText_0x68bbd: ; 0x68bbd
	db $0, "Good! Teach you,", $4f
	db "I will!", $51
	db "In battle, #MON", $4f
	db "top on list jump", $55
	db "out first!", $51
	db "Change order in", $4f
	db "list, make battle", $55
	db "easy, maybe!", $51
	db "More from me you", $4f
	db "want to hear?", $57
; 0x68c51

UnknownText_0x68c51: ; 0x68c51
	db $0, "So, want to know", $4f
	db "how to raise", $55
	db "#MON well?", $57
; 0x68c7b

UnknownText_0x68c7b: ; 0x68c7b
	db $0, "Fine! Teach you,", $4f
	db "I will!", $51
	db "If #MON come", $4f
	db "out in battle even", $51
	db "briefly, some EXP.", $4f
	db "Points it gets.", $51
	db "At top of list put", $4f
	db "weak #MON.", $51
	db "Switch in battle", $4f
	db "quick!", $51
	db "This way, weak", $4f
	db "#MON strong", $55
	db "become!", $57
; 0x68d31

UnknownText_0x68d31: ; 0x68d31
	db $0, "Oh! Smart student", $4f
	db "you are! Nothing", $55
	db "more do I teach!", $51
	db "Good to #MON", $4f
	db "you must be!", $57
; 0x68d80

UnknownText_0x68d80: ; 0x68d80
	db $0, "I'm taking notes", $4f
	db "of the teacher's", $55
	db "lecture.", $51
	db "I'd better copy", $4f
	db "the stuff on the", $55
	db "blackboard too.", $57
; 0x68dda

UnknownText_0x68dda: ; 0x68dda
	db $0, "I traded my best", $4f
	db "#MON to the", $55
	db "guy beside me.", $57
; 0x68e07

UnknownText_0x68e07: ; 0x68e07
	db $0, "Huh? The #MON I", $4f
	db "just got is hold-", $55
	db "ing something!", $57
; 0x68e39

UnknownText_0x68e39: ; 0x68e39
	db $0, "A #MON holding", $4f
	db "a BERRY will heal", $55
	db "itself in battle.", $51
	db "Many other items", $4f
	db "can be held by", $55
	db "#MON…", $51
	db "It sure is tough", $4f
	db "taking notes…", $57
; 0x68eb2

UnknownText_0x68eb2: ; 0x68eb2
	db $0, "The blackboard", $4f
	db "describes #MON", $51
	db "status changes in", $4f
	db "battle.", $57
; 0x68eeb

UnknownText_0x68eeb: ; 0x68eeb
	db $0, "Read which topic?", $57
; 0x68efe

UnknownText_0x68efe: ; 0x68efe
	db $0, "If poisoned, a", $4f
	db "#MON steadily", $55
	db "loses HP.", $51
	db "Poison lingers", $4f
	db "after the battle,", $51
	db "and HP is lost as", $4f
	db "you walk.", $51
	db "To cure it, use an", $4f
	db "ANTIDOTE.", $57
; 0x68f80

UnknownText_0x68f80: ; 0x68f80
	db $0, "Paralysis reduces", $4f
	db "speed and may", $55
	db "prevent movement.", $51
	db "It remains after", $4f
	db "battle, so use", $55
	db "a PARLYZ HEAL.", $57
; 0x68fe2

UnknownText_0x68fe2: ; 0x68fe2
	db $0, "If asleep, your", $4f
	db "#MON can't make", $55
	db "a move.", $51
	db "A sleeping #MON", $4f
	db "doesn't wake up", $55
	db "after battle.", $51
	db "Wake it up with", $4f
	db "an AWAKENING.", $57
; 0x69055

UnknownText_0x69055: ; 0x69055
	db $0, "A burn steadily", $4f
	db "consumes HP.", $51
	db "It also reduces", $4f
	db "attack power.", $51
	db "A burn lingers", $4f
	db "after battle.", $51
	db "Use a BURN HEAL as", $4f
	db "the cure.", $57
; 0x690cb

UnknownText_0x690cb: ; 0x690cb
	db $0, "If your #MON is", $4f
	db "frozen, it can't", $55
	db "do a thing.", $51
	db "It remains frozen", $4f
	db "after battle.", $51
	db "Thaw it out with", $4f
	db "an ICE HEAL.", $57
; 0x69136

UnknownText_0x69136: ; 0x69136
	db $0, "It's this kid's", $4f
	db "notebook…", $51
	db "Catch #MON", $4f
	db "using # BALLS.", $51
	db "Up to six can be", $4f
	db "in your party.", $51
	db "Keep reading?", $57
; 0x69197

UnknownText_0x69197: ; 0x69197
	db $0, "Before throwing a", $4f
	db "# BALL, weaken", $55
	db "the target first.", $51
	db "A poisoned or", $4f
	db "burned #MON is", $55
	db "easier to catch.", $51
	db "Keep reading?", $57
; 0x69207

UnknownText_0x69207: ; 0x69207
	db $0, "Some moves may", $4f
	db "cause confusion.", $51
	db "Confusion may make", $4f
	db "a #MON attack", $55
	db "itself.", $51
	db "Leaving battle", $4f
	db "clears up any", $55
	db "confusion.", $51
	db "Keep reading?", $57
; 0x69287

UnknownText_0x69287: ; 0x69287
	db $0, "People who catch", $4f
	db "and use #MON", $51
	db "in battle are", $4f
	db "#MON trainers.", $51
	db "They are expected", $4f
	db "to visit #MON", $51
	db "GYMS and defeat", $4f
	db "other trainers.", $51
	db "The next page", $4f
	db "is… Blank!", $51
	db "Boy: E-he-he…", $51
	db "I haven't written", $4f
	db "anymore…", $57
; 0x69344

UnknownText_0x69344: ; 0x69344
	db $0, "This super machine", $4f
	db "prints data out as", $51
	db "stickers!", $57
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

