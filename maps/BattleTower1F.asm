BattleTower1F_MapScriptHeader: ; 0x9e393
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x9e39d, $0000
	dw UnknownScript_0x9e3d3, $0000

	; callback count
	db 0
; 0x9e39d

UnknownScript_0x9e39d: ; 0x9e39d
	writebyte $9
	special $0086
	iffalse UnknownScript_0x9e3d1
	writebyte $2
	special $0086
	if_equal $0, UnknownScript_0x9e3d1
	if_equal $2, UnknownScript_0x9e3c4
	if_equal $3, UnknownScript_0x9e3d1
	if_equal $4, UnknownScript_0x9e3d1
	loadfont
	2writetext UnknownText_0x9f037
	closetext
	loadmovesprites
	priorityjump UnknownScript_0x9e44e
	end
; 0x9e3c4

UnknownScript_0x9e3c4: ; 0x9e3c4
	priorityjump UnknownScript_0x9e555
; 0x9e3c7

UnknownScript_0x9e3c7: ; 0x9e3c7
	writebyte $4
	special $0086
	writebyte $6
	special $0086
UnknownScript_0x9e3d1: ; 0x9e3d1
	dotrigger $1
UnknownScript_0x9e3d3: ; 0x9e3d3
	end
; 0x9e3d4

MapBattleTower1FSignpost0Script: ; 0x9e3d4
	loadfont
	2writetext UnknownText_0x9ed3c
	yesorno
	iffalse UnknownScript_0x9e3e0
	2writetext UnknownText_0x9ed72
	closetext
UnknownScript_0x9e3e0: ; 0x9e3e0
	loadmovesprites
	end
; 0x9e3e2

ReceptionistScript_0x9e3e2: ; 0x9e3e2
	writebyte $2
	special $0086
	if_equal $3, BattleTowerBattleRoomScript_0x9f4e4
	loadfont
	2writetext UnknownText_0x9e5ab
	keeptextopen
	writebyte $0
	special $0086
	if_not_equal $0, UnknownScript_0x9e3fc
	2jump UnknownScript_0x9e49e
; 0x9e3fc

UnknownScript_0x9e3fc: ; 0x9e3fc
	2writetext UnknownText_0x9e5ea
	writebyte $1
	special $0088
	if_equal $1, UnknownScript_0x9e40f
	if_equal $2, UnknownScript_0x9e4a5
	2jump UnknownScript_0x9e4b0
; 0x9e40f

UnknownScript_0x9e40f: ; 0x9e40f
	writebyte $1a
	special $0086
	special $007c
	if_not_equal $0, UnknownScript_0x9e4bb
	2writetext UnknownText_0x9ef1f
	yesorno
	iffalse UnknownScript_0x9e3fc
	dotrigger $0
	special $0004
	iffalse UnknownScript_0x9e3fc
	dotrigger $1
	writebyte $1
	special $0086
	special $0074
	if_equal $a, UnknownScript_0x9e3fc
	if_not_equal $0, UnknownScript_0x9e550
	writebyte $11
	special $0086
	2writetext UnknownText_0x9e60a
	closetext
	loadmovesprites
	writebyte $1e
	special $0086
	2jump UnknownScript_0x9e454
; 0x9e44e

UnknownScript_0x9e44e: ; 0x9e44e
	loadmovesprites
	writebyte $8
	special $0086
UnknownScript_0x9e454: ; 0x9e454
	musicfadeout $0000, $8
	domaptrigger GROUP_BATTLE_TOWER_BATTLE_ROOM, MAP_BATTLE_TOWER_BATTLE_ROOM, $0
	domaptrigger GROUP_BATTLE_TOWER_ELEVATOR, MAP_BATTLE_TOWER_ELEVATOR, $0
	domaptrigger GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY, $0
	follow $2, $0
	applymovement $2, MovementData_0x9e571
	writebyte $a
	special $0086
	warpsound
	disappear $2
	stopfollow
	applymovement $0, MovementData_0x9e576
	warpcheck
	end
; 0x9e47a

UnknownScript_0x9e47a: ; 0x9e47a
	writebyte $1c
	special $0086
	writebyte $1b
	special $0086
	if_equal $12, UnknownScript_0x9e498
	itemtotext $0, $1
	giveitem $ff, $5
	2writetext UnknownText_0x9eb7e
	writebyte $1d
	special $0086
	loadmovesprites
	end
; 0x9e498

UnknownScript_0x9e498: ; 0x9e498
	2writetext UnknownText_0x9eb94
	closetext
	loadmovesprites
	end
; 0x9e49e

UnknownScript_0x9e49e: ; 0x9e49e
	2writetext UnknownText_0x9ec3d
	yesorno
	iffalse UnknownScript_0x9e4a8
UnknownScript_0x9e4a5: ; 0x9e4a5
	2writetext UnknownText_0x9e886
UnknownScript_0x9e4a8: ; 0x9e4a8
	writebyte $1
	special $0086
	2jump UnknownScript_0x9e3fc
; 0x9e4b0

UnknownScript_0x9e4b0: ; 0x9e4b0
	2writetext UnknownText_0x9ec09
	closetext
	loadmovesprites
	end
; 0x9e4b6

UnknownScript_0x9e4b6: ; 0x9e4b6
	special $008b
	loadmovesprites
	end
; 0x9e4bb

UnknownScript_0x9e4bb: ; 0x9e4bb
	closetext
	loadmovesprites
	end
; 0x9e4be


UnknownScript_0x9e4be: ; 0x9e4be
	2writetext UnknownText_0x9ef1f
	yesorno
	iffalse UnknownScript_0x9e3fc
	special $0004
	iffalse UnknownScript_0x9e3fc
	writebyte $1
	special $0086
	special $0075
	if_equal $a, UnknownScript_0x9e3fc
	if_not_equal $0, UnknownScript_0x9e550
	2writetext UnknownText_0x9e9eb
	spriteface $2, $2
	2writetext UnknownText_0x9ea1b
	closetext
	spriteface $2, $0
	loadmovesprites
	end
; 0x9e4ea

UnknownScript_0x9e4ea: ; 0x9e4ea
	writebyte $18
	special $0086
	if_not_equal $0, UnknownScript_0x9e542
	writebyte $19
	special $0086
	if_not_equal $0, UnknownScript_0x9e549
	special $007c
	if_not_equal $0, UnknownScript_0x9e4bb
	writebyte $5
	special $0086
	if_equal $0, UnknownScript_0x9e512
	2writetext UnknownText_0x9ecb0
	2jump UnknownScript_0x9e515
; 0x9e512

UnknownScript_0x9e512: ; 0x9e512
	2writetext UnknownText_0x9ec6d
UnknownScript_0x9e515: ; 0x9e515
	yesorno
	iffalse UnknownScript_0x9e3fc
	2writetext UnknownText_0x9ef79
	yesorno
	iffalse UnknownScript_0x9e3fc
	dotrigger $0
	special $0004
	iffalse UnknownScript_0x9e3fc
	dotrigger $1
	writebyte $6
	special $0086
	writebyte $12
	special $0086
	2writetext UnknownText_0x9e60a
	closetext
	2jump UnknownScript_0x9e44e
; 0x9e53b

UnknownScript_0x9e53b: ; 0x9e53b
	2writetext UnknownText_0x9f076
	closetext
	2jump UnknownScript_0x9e4b0
; 0x9e542

UnknownScript_0x9e542: ; 0x9e542
	2writetext UnknownText_0x9f1e5
	closetext
	2jump UnknownScript_0x9e3fc
; 0x9e549

UnknownScript_0x9e549: ; 0x9e549
	2writetext UnknownText_0x9f217
	closetext
	2jump UnknownScript_0x9e3fc
; 0x9e550

UnknownScript_0x9e550: ; 0x9e550
	special $008b
	loadmovesprites
	end
; 0x9e555

UnknownScript_0x9e555: ; 0x9e555
	loadfont
	2writetext UnknownText_0x9ee18
	closetext
	2jump UnknownScript_0x9e4b0
; 0x9e55d

YoungsterScript_0x9e55d: ; 0x9e55d
	faceplayer
	loadfont
	2writetext UnknownText_0x9f264
	closetext
	loadmovesprites
	spriteface $3, $3
	end
; 0x9e568

CooltrainerFScript_0x9e568: ; 0x9e568
	jumptextfaceplayer UnknownText_0x9f2a4
; 0x9e56b

BugCatcherScript_0x9e56b: ; 0x9e56b
	jumptextfaceplayer UnknownText_0x9f35b
; 0x9e56e

GrannyScript_0x9e56e: ; 0x9e56e
	jumptextfaceplayer UnknownText_0x9f2e3
; 0x9e571

MovementData_0x9e571: ; 0x9e571
	step_up
	step_up
	step_up
	step_up
	step_up
MovementData_0x9e576: ; 0x9e576
	step_up
	step_end
; 0x9e578

MovementData_0x9e578: ; 0x9e578
	step_down
	step_end
; 0x9e57a

MovementData_0x9e57a: ; 0x9e57a
	step_right
	step_right
MovementData_0x9e57c: ; 0x9e57c
	step_right
	step_right
	step_up
	step_right
	turn_head_left
	step_end
; 0x9e582

MovementData_0x9e582: ; 0x9e582
	step_left
	step_left
MovementData_0x9e584: ; 0x9e584
	step_left
	step_left
MovementData_0x9e586: ; 0x9e586
	step_left
	step_left
	step_up
	step_left
	turn_head_right
	step_end
; 0x9e58c

MovementData_0x9e58c: ; 0x9e58c
	step_up
	step_up
	step_up
	step_up
	turn_head_right
	step_end
; 0x9e592

MovementData_0x9e592: ; 0x9e592
	slow_step_down
	slow_step_down
	slow_step_down
	turn_head_left
	step_end
; 0x9e597

MovementData_0x9e597: ; 0x9e597
	turn_head_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end
; 0x9e59c

MovementData_0x9e59c: ; 0x9e59c
	slow_step_right
	slow_step_right
	slow_step_up
	slow_step_up
	step_end
; 0x9e5a1

MovementData_0x9e5a1: ; 0x9e5a1
	slow_step_down
	slow_step_down
	slow_step_left
	slow_step_left
	turn_head_right
	step_end
; 0x9e5a7

MovementData_0x9e5a7: ; 0x9e5a7
	turn_head_down
	step_end
; 0x9e5a9

MovementData_0x9e5a9: ; 0x9e5a9
	turn_head_right
	step_end
; 0x9e5ab

UnknownText_0x9e5ab: ; 0x9e5ab
	text "BATTLE TOWER"
	line "welcomes you!"

	para "I could show you"
	line "to a BATTLE ROOM."
	done
; 0x9e5ea

UnknownText_0x9e5ea: ; 0x9e5ea
	text "Want to go into a"
	line "BATTLE ROOM?"
	done
; 0x9e60a

UnknownText_0x9e60a: ; 0x9e60a
	text "Right this way to"
	line "your BATTLE ROOM."
	done
; 0x9e62f

UnknownText_0x9e62f: ; 0x9e62f
	db $0, "BATTLE TOWER is a", $4f
	db "facility made for", $55
	db "#MON battles.", $51
	db "Countless #MON", $4f
	db "trainers gather", $51
	db "from all over to", $4f
	db "hold battles in", $51
	db "specially designed", $4f
	db "BATTLE ROOMS.", $51
	db "There are many", $4f
	db "BATTLE ROOMS in", $55
	db "the BATTLE TOWER.", $51
	db "Each ROOM holds", $4f
	db "seven trainers.", $51
	db "If you defeat the", $4f
	db "seven in a ROOM,", $51
	db "and you have a", $4f
	db "good record, you", $51
	db "could become the", $4f
	db "ROOM's LEADER.", $51
	db "All LEADERS will", $4f
	db "be recorded in the", $51
	db "HONOR ROLL for", $4f
	db "posterity.", $51
	db "You may challenge", $4f
	db "in up to five", $51
	db "BATTLE ROOMS each", $4f
	db "day.", $51
	db "However, you may", $4f
	db "battle only once a", $51
	db "day in any given", $4f
	db "ROOM.", $51
	db "To interrupt a", $4f
	db "session, you must", $51
	db "SAVE. If not, you", $4f
	db "won't be able to", $51
	db "resume your ROOM", $4f
	db "challenge.", $51
	db $57
; 0x9e886

UnknownText_0x9e886: ; 0x9e886
	db $0, "BATTLE TOWER is a", $4f
	db "facility made for", $55
	db "#MON battles.", $51
	db "Countless #MON", $4f
	db "trainers gather", $51
	db "from all over to", $4f
	db "hold battles in", $51
	db "specially designed", $4f
	db "BATTLE ROOMS.", $51
	db "There are many", $4f
	db "BATTLE ROOMS in", $55
	db "the BATTLE TOWER.", $51
	db "Each ROOM holds", $4f
	db "seven trainers.", $51
	db "Beat them all, and", $4f
	db "win a prize.", $51
	db "To interrupt a", $4f
	db "session, you must", $51
	db "SAVE. If not, you", $4f
	db "won't be able to", $51
	db "resume your ROOM", $4f
	db "challenge.", $51
	db $57
; 0x9e9eb

UnknownText_0x9e9eb: ; 0x9e9eb
	db $0, "Received a list of", $4f
	db "LEADERS on the", $55
	db "HONOR ROLL.", $51
	db $57
; 0x9ea1b

UnknownText_0x9ea1b: ; 0x9ea1b
	text "Please confirm on"
	line "this monitor."
	done
; 0x9ea3c

UnknownText_0x9ea3c: ; 0x9ea3c
	db $0, "Thank you!", $51
	db $57
; 0x9ea49

UnknownText_0x9ea49: ; 0x9ea49
	text "Thanks for"
	line "visiting!"
	done
; 0x9ea5f

UnknownText_0x9ea5f: ; 0x9ea5f
	db $0, "Congratulations!", $51
	db "You've beaten all", $4f
	db "the trainers!", $51
	db "Your feat may be", $4f
	db "worth registering,", $51
	db $52, ". With your", $4f
	db "results, you may", $51
	db "be chosen as a", $4f
	db "ROOM LEADER.", $51
	db $57
; 0x9eaef

UnknownText_0x9eaef: ; 0x9eaef
	db $0, "Congratulations!", $51
	db "You've beaten all", $4f
	db "the trainers!", $51
	db "For that, you get", $4f
	db "this great prize!", $51
	db $57
; 0x9eb45

UnknownText_0x9eb45: ; 0x9eb45
	text "Would you like to"
	line "register your"

	para "record with the"
	line "CENTER?"
	done
; 0x9eb7e

UnknownText_0x9eb7e: ; 0x9eb7e
	db $0, $52, " got five", $4f
	db "@"
	text_from_ram $d0ac
	db $0, "!@"
	sound0x0F
	text_waitbutton
	db $50
; 0x9eb94

UnknownText_0x9eb94: ; 0x9eb94
	text "Oops, your PACK is"
	line "stuffed full."

	para "Please make room"
	line "and come back."
	done
; 0x9ebd6

UnknownText_0x9ebd6: ; 0x9ebd6
	text "Your registration"
	line "is complete."

	para "Please come again!"
	done
; 0x9ec09

UnknownText_0x9ec09: ; 0x9ec09
	text "We hope to serve"
	line "you again."
	done
; 0x9ec26

UnknownText_0x9ec26: ; 0x9ec26
	text "Please step this"
	line "way."
	done
; 0x9ec3d

UnknownText_0x9ec3d: ; 0x9ec3d
	text "Would you like to"
	line "hear about the"
	cont "BATTLE TOWER?"
	done
; 0x9ec6d

UnknownText_0x9ec6d: ; 0x9ec6d
	text "Your record from"
	line "the previous"

	para "BATTLE ROOM can't"
	line "be registered. OK?"
	done
; 0x9ecb0

UnknownText_0x9ecb0: ; 0x9ecb0
	text "Your record from"
	line "the previous"

	para "BATTLE ROOM can't"
	line "be registered."

	para "Also, the existing"
	line "record will be"
	cont "deleted. OK?"
	done
; 0x9ed1e

UnknownText_0x9ed1e: ; 0x9ed1e
	text "Check the LEADER"
	line "HONOR ROLL?"
	done
; 0x9ed3c

UnknownText_0x9ed3c: ; 0x9ed3c
	text "BATTLE TOWER rules"
	line "are written here."

	para "Read the rules?"
	done
; 0x9ed72

UnknownText_0x9ed72: ; 0x9ed72
	text "Three #MON may"
	line "enter battles."

	para "All three must be"
	line "different."

	para "The items they"
	line "hold must also be"
	cont "different."

	para "Certain #MON"
	line "may also have"

	para "level restrictions"
	line "placed on them."
	done
; 0x9ee18

UnknownText_0x9ee18: ; 0x9ee18
	text "Excuse me!"
	line "You didn't SAVE"

	para "before exiting"
	line "the BATTLE ROOM."

	para "I'm awfully sorry,"
	line "but your challenge"

	para "will be declared"
	line "invalid."
	done
; 0x9ee92

UnknownText_0x9ee92: ; 0x9ee92
	text "Your #MON will"
	line "be healed to full"
	cont "health."
	done
; 0x9eebc

UnknownText_0x9eebc: ; 0x9eebc
	text "Next up, opponent"
	line "no.@"
	text_from_ram $d099
	text ". Ready?"
	done
; 0x9eee0

UnknownText_0x9eee0: ; 0x9eee0
	text "Your session will"
	line "be SAVED before"

	para "connecting with"
	line "the CENTER."
	done
; 0x9ef1f

UnknownText_0x9ef1f: ; 0x9ef1f
	text "Before entering"
	line "the BATTLE ROOM,"

	para "your progress will"
	line "be saved."
	done
; 0x9ef5e

UnknownText_0x9ef5e: ; 0x9ef5e
	text "SAVE and end the"
	line "session?"
	done
; 0x9ef79

UnknownText_0x9ef79: ; 0x9ef79
	text "Your record will"
	line "be SAVED before"

	para "you go back into"
	line "the previous ROOM."
	done
; 0x9efbf

UnknownText_0x9efbf: ; 0x9efbf
	text "Cancel your BATTLE"
	line "ROOM challenge?"
	done
; 0x9efe3

UnknownText_0x9efe3: ; 0x9efe3
	text "We have your"
	line "previous record on"

	para "file. Would you"
	line "like to register"
	cont "it at the CENTER?"
	done
; 0x9f037

UnknownText_0x9f037: ; 0x9f037
	text "We've been waiting"
	line "for you. This way"

	para "to a BATTLE ROOM,"
	line "please."
	done
; 0x9f076

UnknownText_0x9f076: ; 0x9f076
	text "You may enter only"
	line "five BATTLE ROOMS"
	cont "each day."

	para "Please come back"
	line "tomorrow."
	done
; 0x9f0c1

UnknownText_0x9f0c1: ; 0x9f0c1
	text "Sorry, but it's"
	line "not possible to"

	para "register your"
	line "current record at"

	para "the CENTER because"
	line "too much time has"

	para "elapsed since the"
	line "start of your"
	cont "challenge."
	done
; 0x9f151

; a dupe?
UnknownText_0x9f151: ; 0x9f151
	text "Sorry, but it's"
	line "not possible to"

	para "register your most"
	line "recent record at"

	para "the CENTER because"
	line "too much time has"

	para "elapsed since the"
	line "start of your"
	cont "challenge."
	done
; 0x9f1e5

UnknownText_0x9f1e5: ; 0x9f1e5
	text "One or more of"
	line "your #MON's"
	cont "levels exceeds @"
	deciram ScriptVar, $13
	text "."
	done
; 0x9f217

UnknownText_0x9f217: ; 0x9f217
	text_from_ram $cd49
	text " may not"
	line "enter a BATTLE"
	cont "ROOM under L70."

	para "This BATTLE ROOM"
	line "is for L@"
	deciram ScriptVar, $13
	text "."
	done
; 0x9f264

UnknownText_0x9f264: ; 0x9f264
	text "Destroyed by the"
	line "first opponent in"

	para "no time at all…"
	line "I'm no good…"
	done
; 0x9f2a4

UnknownText_0x9f2a4: ; 0x9f2a4
	text "There are lots of"
	line "BATTLE ROOMS, but"

	para "I'm going to win"
	line "them all!"
	done
; 0x9f2e3

UnknownText_0x9f2e3: ; 0x9f2e3
	text "It's a grueling"
	line "task, not being"

	para "able to use items"
	line "in battle."

	para "Making your"
	line "#MON hold items"

	para "is the key to"
	line "winning battles."
	done
; 0x9f35b

UnknownText_0x9f35b: ; 0x9f35b
	text "I'm trying to see"
	line "how far I can go"

	para "using just bug"
	line "#MON."

	para "Don't let there be"
	line "any fire #MON…"
	done
; 0x9f3b4

BattleTower1F_MapEventHeader: ; 0x9f3b4
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $9, $7, 3, GROUP_BATTLE_TOWER_OUTSIDE, MAP_BATTLE_TOWER_OUTSIDE
	warp_def $9, $8, 4, GROUP_BATTLE_TOWER_OUTSIDE, MAP_BATTLE_TOWER_OUTSIDE
	warp_def $0, $7, 1, GROUP_BATTLE_TOWER_ELEVATOR, MAP_BATTLE_TOWER_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 6, 6, $0, MapBattleTower1FSignpost0Script

	; people-events
	db 5
	person_event SPRITE_RECEPTIONIST, 10, 11, $6, $0, 255, 255, $0, 0, ReceptionistScript_0x9e3e2, $ffff
	person_event SPRITE_YOUNGSTER, 13, 18, $9, $0, 255, 255, $b0, 0, YoungsterScript_0x9e55d, $ffff
	person_event SPRITE_COOLTRAINER_F, 13, 8, $5, $1, 255, 255, $80, 0, CooltrainerFScript_0x9e568, $ffff
	person_event SPRITE_BUG_CATCHER, 7, 5, $2, $11, 255, 255, $90, 0, BugCatcherScript_0x9e56b, $ffff
	person_event SPRITE_GRANNY, 7, 18, $4, $10, 255, 255, $0, 0, GrannyScript_0x9e56e, $ffff
; 0x9f40f

