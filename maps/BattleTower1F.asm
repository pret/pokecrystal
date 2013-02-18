BattleTower1F_MapScriptHeader: ; 0x9e393
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x9e39d, $0000
	dw $63d3, $0000

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

UnknownScript_0x9e3e2: ; 0x9e3e2
	writebyte $2
	special $0086
	if_equal $3, $74e4 ; wtf ?
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
	applymovement $0, $6576
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

INCBIN "baserom.gbc",$9e4be,$9e4e4 - $9e4be

UnknownScript_0x9e4e4: ; 0x9e4e4
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

UnknownScript_0x9e55d: ; 0x9e55d
	faceplayer
	loadfont
	2writetext UnknownText_0x9f264
	closetext
	loadmovesprites
	spriteface $3, $3
	end
; 0x9e568

UnknownScript_0x9e568: ; 0x9e568
	jumptextfaceplayer UnknownText_0x9f2a4
; 0x9e56b

UnknownScript_0x9e56b: ; 0x9e56b
	jumptextfaceplayer UnknownText_0x9f35b
; 0x9e56e

UnknownScript_0x9e56e: ; 0x9e56e
	jumptextfaceplayer UnknownText_0x9f2e3
; 0x9e571

MovementData_0x9e571: ; 0x9e571
	step_up
	step_up
	step_up
	step_up
	step_up
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
	step_left
	step_left
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
	db $0, "BATTLE TOWER", $4f
	db "welcomes you!", $51
	db "I could show you", $4f
	db "to a BATTLE ROOM.", $57
; 0x9e5ea

UnknownText_0x9e5ea: ; 0x9e5ea
	db $0, "Want to go into a", $4f
	db "BATTLE ROOM?", $57
; 0x9e60a

UnknownText_0x9e60a: ; 0x9e60a
	db $0, "Right this way to", $4f
	db "your BATTLE ROOM.", $57
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
	db $0, "Please confirm on", $4f
	db "this monitor.", $57
; 0x9ea3c

UnknownText_0x9ea3c: ; 0x9ea3c
	db $0, "Thank you!", $51
	db $57
; 0x9ea49

UnknownText_0x9ea49: ; 0x9ea49
	db $0, "Thanks for", $4f
	db "visiting!", $57
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
	db $0, "Would you like to", $4f
	db "register your", $51
	db "record with the", $4f
	db "CENTER?", $57
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
	db $0, "Oops, your PACK is", $4f
	db "stuffed full.", $51
	db "Please make room", $4f
	db "and come back.", $57
; 0x9ebd6

UnknownText_0x9ebd6: ; 0x9ebd6
	db $0, "Your registration", $4f
	db "is complete.", $51
	db "Please come again!", $57
; 0x9ec09

UnknownText_0x9ec09: ; 0x9ec09
	db $0, "We hope to serve", $4f
	db "you again.", $57
; 0x9ec26

UnknownText_0x9ec26: ; 0x9ec26
	db $0, "Please step this", $4f
	db "way.", $57
; 0x9ec3d

UnknownText_0x9ec3d: ; 0x9ec3d
	db $0, "Would you like to", $4f
	db "hear about the", $55
	db "BATTLE TOWER?", $57
; 0x9ec6d

UnknownText_0x9ec6d: ; 0x9ec6d
	db $0, "Your record from", $4f
	db "the previous", $51
	db "BATTLE ROOM can't", $4f
	db "be registered. OK?", $57
; 0x9ecb0

UnknownText_0x9ecb0: ; 0x9ecb0
	db $0, "Your record from", $4f
	db "the previous", $51
	db "BATTLE ROOM can't", $4f
	db "be registered.", $51
	db "Also, the existing", $4f
	db "record will be", $55
	db "deleted. OK?", $57
; 0x9ed1e

UnknownText_0x9ed1e: ; 0x9ed1e
	db $0, "Check the LEADER", $4f
	db "HONOR ROLL?", $57
; 0x9ed3c

UnknownText_0x9ed3c: ; 0x9ed3c
	db $0, "BATTLE TOWER rules", $4f
	db "are written here.", $51
	db "Read the rules?", $57
; 0x9ed72

UnknownText_0x9ed72: ; 0x9ed72
	db $0, "Three #MON may", $4f
	db "enter battles.", $51
	db "All three must be", $4f
	db "different.", $51
	db "The items they", $4f
	db "hold must also be", $55
	db "different.", $51
	db "Certain #MON", $4f
	db "may also have", $51
	db "level restrictions", $4f
	db "placed on them.", $57
; 0x9ee18

UnknownText_0x9ee18: ; 0x9ee18
	db $0, "Excuse me!", $4f
	db "You didn't SAVE", $51
	db "before exiting", $4f
	db "the BATTLE ROOM.", $51
	db "I'm awfully sorry,", $4f
	db "but your challenge", $51
	db "will be declared", $4f
	db "invalid.", $57
; 0x9ee92

UnknownText_0x9ee92: ; 0x9ee92
	db $0, "Your #MON will", $4f
	db "be healed to full", $55
	db "health.", $57
; 0x9eebc

UnknownText_0x9eebc: ; 0x9eebc
	db $0, "Next up, opponent", $4f
	db "no.@"
	text_from_ram $d099
	db $0, ". Ready?", $57
; 0x9eee0

UnknownText_0x9eee0: ; 0x9eee0
	db $0, "Your session will", $4f
	db "be SAVED before", $51
	db "connecting with", $4f
	db "the CENTER.", $57
; 0x9ef1f

UnknownText_0x9ef1f: ; 0x9ef1f
	db $0, "Before entering", $4f
	db "the BATTLE ROOM,", $51
	db "your progress will", $4f
	db "be saved.", $57
; 0x9ef5e

UnknownText_0x9ef5e: ; 0x9ef5e
	db $0, "SAVE and end the", $4f
	db "session?", $57
; 0x9ef79

UnknownText_0x9ef79: ; 0x9ef79
	db $0, "Your record will", $4f
	db "be SAVED before", $51
	db "you go back into", $4f
	db "the previous ROOM.", $57
; 0x9efbf

UnknownText_0x9efbf: ; 0x9efbf
	db $0, "Cancel your BATTLE", $4f
	db "ROOM challenge?", $57
; 0x9efe3

UnknownText_0x9efe3: ; 0x9efe3
	db $0, "We have your", $4f
	db "previous record on", $51
	db "file. Would you", $4f
	db "like to register", $55
	db "it at the CENTER?", $57
; 0x9f037

UnknownText_0x9f037: ; 0x9f037
	db $0, "We've been waiting", $4f
	db "for you. This way", $51
	db "to a BATTLE ROOM,", $4f
	db "please.", $57
; 0x9f076

UnknownText_0x9f076: ; 0x9f076
	db $0, "You may enter only", $4f
	db "five BATTLE ROOMS", $55
	db "each day.", $51
	db "Please come back", $4f
	db "tomorrow.", $57
; 0x9f0c1

UnknownText_0x9f0c1: ; 0x9f0c1
	db $0, "Sorry, but it's", $4f
	db "not possible to", $51
	db "register your", $4f
	db "current record at", $51
	db "the CENTER because", $4f
	db "too much time has", $51
	db "elapsed since the", $4f
	db "start of your", $55
	db "challenge.", $57
; 0x9f151

; a dupe?
UnknownText_0x9f151: ; 0x9f151
	db $0, "Sorry, but it's", $4f
	db "not possible to", $51
	db "register your most", $4f
	db "recent record at", $51
	db "the CENTER because", $4f
	db "too much time has", $51
	db "elapsed since the", $4f
	db "start of your", $55
	db "challenge.", $57
; 0x9f1e5

UnknownText_0x9f1e5: ; 0x9f1e5
	db $0, "One or more of", $4f
	db "your #MON's", $55
	db "levels exceeds @"
	deciram ScriptVar, $13
	db $0, ".", $57
; 0x9f217

UnknownText_0x9f217: ; 0x9f217
	text_from_ram $cd49
	db $0, " may not", $4f
	db "enter a BATTLE", $55
	db "ROOM under L70.", $51
	db "This BATTLE ROOM", $4f
	db "is for L@"
	deciram ScriptVar, $13
	db $0, ".", $57
; 0x9f264

UnknownText_0x9f264: ; 0x9f264
	db $0, "Destroyed by the", $4f
	db "first opponent in", $51
	db "no time at all…", $4f
	db "I'm no good…", $57
; 0x9f2a4

UnknownText_0x9f2a4: ; 0x9f2a4
	db $0, "There are lots of", $4f
	db "BATTLE ROOMS, but", $51
	db "I'm going to win", $4f
	db "them all!", $57
; 0x9f2e3

UnknownText_0x9f2e3: ; 0x9f2e3
	db $0, "It's a grueling", $4f
	db "task, not being", $51
	db "able to use items", $4f
	db "in battle.", $51
	db "Making your", $4f
	db "#MON hold items", $51
	db "is the key to", $4f
	db "winning battles.", $57
; 0x9f35b

UnknownText_0x9f35b: ; 0x9f35b
	db $0, "I'm trying to see", $4f
	db "how far I can go", $51
	db "using just bug", $4f
	db "#MON.", $51
	db "Don't let there be", $4f
	db "any fire #MON…", $57
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
	person_event $42, 10, 11, $6, $0, 255, 255, $0, 0, UnknownScript_0x9e3e2, $ffff
	person_event $27, 13, 18, $9, $0, 255, 255, $b0, 0, UnknownScript_0x9e55d, $ffff
	person_event $24, 13, 8, $5, $1, 255, 255, $80, 0, UnknownScript_0x9e568, $ffff
	person_event $25, 7, 5, $2, $11, 255, 255, $90, 0, UnknownScript_0x9e56b, $ffff
	person_event $30, 7, 18, $4, $10, 255, 255, $0, 0, UnknownScript_0x9e56e, $ffff
; 0x9f40f

