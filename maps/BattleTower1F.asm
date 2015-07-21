BattleTower1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x9e39d, $0000
	dw UnknownScript_0x9e3d3, $0000

.MapCallbacks:
	db 0

UnknownScript_0x9e39d:
	writebyte $9
	special Function170687
	iffalse UnknownScript_0x9e3d1
	writebyte $2
	special Function170687
	if_equal $0, UnknownScript_0x9e3d1
	if_equal $2, UnknownScript_0x9e3c4
	if_equal $3, UnknownScript_0x9e3d1
	if_equal $4, UnknownScript_0x9e3d1
	loadfont
	writetext UnknownText_0x9f037
	closetext
	loadmovesprites
	priorityjump UnknownScript_0x9e44e
	end

UnknownScript_0x9e3c4:
	priorityjump UnknownScript_0x9e555

UnknownScript_0x9e3c7:
	writebyte $4
	special Function170687
	writebyte $6
	special Function170687
UnknownScript_0x9e3d1:
	dotrigger $1
UnknownScript_0x9e3d3:
	end

MapBattleTower1FSignpost0Script:
	loadfont
	writetext UnknownText_0x9ed3c
	yesorno
	iffalse UnknownScript_0x9e3e0
	writetext UnknownText_0x9ed72
	closetext
UnknownScript_0x9e3e0:
	loadmovesprites
	end

ReceptionistScript_0x9e3e2:
	writebyte $2
	special Function170687
	if_equal $3, BattleTowerBattleRoomScript_0x9f4e4
	loadfont
	writetext UnknownText_0x9e5ab
	keeptextopen
	writebyte $0
	special Function170687
	if_not_equal $0, UnknownScript_0x9e3fc
	jump UnknownScript_0x9e49e

UnknownScript_0x9e3fc:
	writetext UnknownText_0x9e5ea
	writebyte $1
	special Function17d224
	if_equal $1, UnknownScript_0x9e40f
	if_equal $2, UnknownScript_0x9e4a5
	jump UnknownScript_0x9e4b0

UnknownScript_0x9e40f:
	writebyte $1a
	special Function170687
	special Function170bd3
	if_not_equal $0, UnknownScript_0x9e4bb
	writetext UnknownText_0x9ef1f
	yesorno
	iffalse UnknownScript_0x9e3fc
	dotrigger $0
	special Special_TryQuickSave
	iffalse UnknownScript_0x9e3fc
	dotrigger $1
	writebyte $1
	special Function170687
	special Function1700b0
	if_equal $a, UnknownScript_0x9e3fc
	if_not_equal $0, UnknownScript_0x9e550
	writebyte $11
	special Function170687
	writetext UnknownText_0x9e60a
	closetext
	loadmovesprites
	writebyte $1e
	special Function170687
	jump UnknownScript_0x9e454

UnknownScript_0x9e44e:
	loadmovesprites
	writebyte $8
	special Function170687
UnknownScript_0x9e454:
	musicfadeout MUSIC_NONE, $8
	domaptrigger GROUP_BATTLE_TOWER_BATTLE_ROOM, MAP_BATTLE_TOWER_BATTLE_ROOM, $0
	domaptrigger GROUP_BATTLE_TOWER_ELEVATOR, MAP_BATTLE_TOWER_ELEVATOR, $0
	domaptrigger GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY, $0
	follow $2, $0
	applymovement $2, MovementData_0x9e571
	writebyte $a
	special Function170687
	warpsound
	disappear $2
	stopfollow
	applymovement $0, MovementData_0x9e576
	warpcheck
	end

UnknownScript_0x9e47a:
	writebyte $1c
	special Function170687
	writebyte $1b
	special Function170687
	if_equal $12, UnknownScript_0x9e498
	itemtotext $0, $1
	giveitem $ff, $5
	writetext UnknownText_0x9eb7e
	writebyte $1d
	special Function170687
	loadmovesprites
	end

UnknownScript_0x9e498:
	writetext UnknownText_0x9eb94
	closetext
	loadmovesprites
	end

UnknownScript_0x9e49e:
	writetext UnknownText_0x9ec3d
	yesorno
	iffalse UnknownScript_0x9e4a8
UnknownScript_0x9e4a5:
	writetext UnknownText_0x9e886
UnknownScript_0x9e4a8:
	writebyte $1
	special Function170687
	jump UnknownScript_0x9e3fc

UnknownScript_0x9e4b0:
	writetext UnknownText_0x9ec09
	closetext
	loadmovesprites
	end

UnknownScript_0x9e4b6:
	special Function17f53d
	loadmovesprites
	end

UnknownScript_0x9e4bb:
	closetext
	loadmovesprites
	end


UnknownScript_0x9e4be:
	writetext UnknownText_0x9ef1f
	yesorno
	iffalse UnknownScript_0x9e3fc
	special Special_TryQuickSave
	iffalse UnknownScript_0x9e3fc
	writebyte $1
	special Function170687
	special Function1700ba
	if_equal $a, UnknownScript_0x9e3fc
	if_not_equal $0, UnknownScript_0x9e550
	writetext UnknownText_0x9e9eb
	spriteface $2, LEFT
	writetext UnknownText_0x9ea1b
	closetext
	spriteface $2, DOWN
	loadmovesprites
	end

UnknownScript_0x9e4ea:
	writebyte $18
	special Function170687
	if_not_equal $0, UnknownScript_0x9e542
	writebyte $19
	special Function170687
	if_not_equal $0, UnknownScript_0x9e549
	special Function170bd3
	if_not_equal $0, UnknownScript_0x9e4bb
	writebyte $5
	special Function170687
	if_equal $0, UnknownScript_0x9e512
	writetext UnknownText_0x9ecb0
	jump UnknownScript_0x9e515

UnknownScript_0x9e512:
	writetext UnknownText_0x9ec6d
UnknownScript_0x9e515:
	yesorno
	iffalse UnknownScript_0x9e3fc
	writetext UnknownText_0x9ef79
	yesorno
	iffalse UnknownScript_0x9e3fc
	dotrigger $0
	special Special_TryQuickSave
	iffalse UnknownScript_0x9e3fc
	dotrigger $1
	writebyte $6
	special Function170687
	writebyte $12
	special Function170687
	writetext UnknownText_0x9e60a
	closetext
	jump UnknownScript_0x9e44e

UnknownScript_0x9e53b:
	writetext UnknownText_0x9f076
	closetext
	jump UnknownScript_0x9e4b0

UnknownScript_0x9e542:
	writetext UnknownText_0x9f1e5
	closetext
	jump UnknownScript_0x9e3fc

UnknownScript_0x9e549:
	writetext UnknownText_0x9f217
	closetext
	jump UnknownScript_0x9e3fc

UnknownScript_0x9e550:
	special Function17f53d
	loadmovesprites
	end

UnknownScript_0x9e555:
	loadfont
	writetext UnknownText_0x9ee18
	closetext
	jump UnknownScript_0x9e4b0

YoungsterScript_0x9e55d:
	faceplayer
	loadfont
	writetext UnknownText_0x9f264
	closetext
	loadmovesprites
	spriteface $3, RIGHT
	end

CooltrainerFScript_0x9e568:
	jumptextfaceplayer UnknownText_0x9f2a4

BugCatcherScript_0x9e56b:
	jumptextfaceplayer UnknownText_0x9f35b

GrannyScript_0x9e56e:
	jumptextfaceplayer UnknownText_0x9f2e3

MovementData_0x9e571:
	step_up
	step_up
	step_up
	step_up
	step_up
MovementData_0x9e576:
	step_up
	step_end

MovementData_0x9e578:
	step_down
	step_end

MovementData_0x9e57a:
	step_right
	step_right
MovementData_0x9e57c:
	step_right
	step_right
	step_up
	step_right
	turn_head_left
	step_end

MovementData_0x9e582:
	step_left
	step_left
MovementData_0x9e584:
	step_left
	step_left
MovementData_0x9e586:
	step_left
	step_left
	step_up
	step_left
	turn_head_right
	step_end

MovementData_0x9e58c:
	step_up
	step_up
	step_up
	step_up
	turn_head_right
	step_end

MovementData_0x9e592:
	slow_step_down
	slow_step_down
	slow_step_down
	turn_head_left
	step_end

MovementData_0x9e597:
	turn_head_up
	slow_step_up
	slow_step_up
	slow_step_up
	step_end

MovementData_0x9e59c:
	slow_step_right
	slow_step_right
	slow_step_up
	slow_step_up
	step_end

MovementData_0x9e5a1:
	slow_step_down
	slow_step_down
	slow_step_left
	slow_step_left
	turn_head_right
	step_end

MovementData_0x9e5a7:
	turn_head_down
	step_end

MovementData_0x9e5a9:
	turn_head_right
	step_end

UnknownText_0x9e5ab:
	text "BATTLE TOWER"
	line "welcomes you!"

	para "I could show you"
	line "to a BATTLE ROOM."
	done

UnknownText_0x9e5ea:
	text "Want to go into a"
	line "BATTLE ROOM?"
	done

UnknownText_0x9e60a:
	text "Right this way to"
	line "your BATTLE ROOM."
	done

UnknownText_0x9e62f:
	text "BATTLE TOWER is a"
	line "facility made for"
	cont "#MON battles."

	para "Countless #MON"
	line "trainers gather"

	para "from all over to"
	line "hold battles in"

	para "specially designed"
	line "BATTLE ROOMS."

	para "There are many"
	line "BATTLE ROOMS in"
	cont "the BATTLE TOWER."

	para "Each ROOM holds"
	line "seven trainers."

	para "If you defeat the"
	line "seven in a ROOM,"

	para "and you have a"
	line "good record, you"

	para "could become the"
	line "ROOM's LEADER."

	para "All LEADERS will"
	line "be recorded in the"

	para "HONOR ROLL for"
	line "posterity."

	para "You may challenge"
	line "in up to five"

	para "BATTLE ROOMS each"
	line "day."

	para "However, you may"
	line "battle only once a"

	para "day in any given"
	line "ROOM."

	para "To interrupt a"
	line "session, you must"

	para "SAVE. If not, you"
	line "won't be able to"

	para "resume your ROOM"
	line "challenge."

	para ""
	done

UnknownText_0x9e886:
	text "BATTLE TOWER is a"
	line "facility made for"
	cont "#MON battles."

	para "Countless #MON"
	line "trainers gather"

	para "from all over to"
	line "hold battles in"

	para "specially designed"
	line "BATTLE ROOMS."

	para "There are many"
	line "BATTLE ROOMS in"
	cont "the BATTLE TOWER."

	para "Each ROOM holds"
	line "seven trainers."

	para "Beat them all, and"
	line "win a prize."

	para "To interrupt a"
	line "session, you must"

	para "SAVE. If not, you"
	line "won't be able to"

	para "resume your ROOM"
	line "challenge."

	para ""
	done

UnknownText_0x9e9eb:
	text "Received a list of"
	line "LEADERS on the"
	cont "HONOR ROLL."

	para ""
	done

UnknownText_0x9ea1b:
	text "Please confirm on"
	line "this monitor."
	done

UnknownText_0x9ea3c:
	text "Thank you!"

	para ""
	done

UnknownText_0x9ea49:
	text "Thanks for"
	line "visiting!"
	done

UnknownText_0x9ea5f:
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers!"

	para "Your feat may be"
	line "worth registering,"

	para "<PLAYER>. With your"
	line "results, you may"

	para "be chosen as a"
	line "ROOM LEADER."

	para ""
	done

UnknownText_0x9eaef:
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers!"

	para "For that, you get"
	line "this great prize!"

	para ""
	done

UnknownText_0x9eb45:
	text "Would you like to"
	line "register your"

	para "record with the"
	line "CENTER?"
	done

UnknownText_0x9eb7e:
	text "<PLAYER> got five"
	line "@"
	text_from_ram StringBuffer4
	text "!@"
	sound0x0F
	text_waitbutton
	db "@"

UnknownText_0x9eb94:
	text "Oops, your PACK is"
	line "stuffed full."

	para "Please make room"
	line "and come back."
	done

UnknownText_0x9ebd6:
	text "Your registration"
	line "is complete."

	para "Please come again!"
	done

UnknownText_0x9ec09:
	text "We hope to serve"
	line "you again."
	done

UnknownText_0x9ec26:
	text "Please step this"
	line "way."
	done

UnknownText_0x9ec3d:
	text "Would you like to"
	line "hear about the"
	cont "BATTLE TOWER?"
	done

UnknownText_0x9ec6d:
	text "Your record from"
	line "the previous"

	para "BATTLE ROOM can't"
	line "be registered. OK?"
	done

UnknownText_0x9ecb0:
	text "Your record from"
	line "the previous"

	para "BATTLE ROOM can't"
	line "be registered."

	para "Also, the existing"
	line "record will be"
	cont "deleted. OK?"
	done

UnknownText_0x9ed1e:
	text "Check the LEADER"
	line "HONOR ROLL?"
	done

UnknownText_0x9ed3c:
	text "BATTLE TOWER rules"
	line "are written here."

	para "Read the rules?"
	done

UnknownText_0x9ed72:
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

UnknownText_0x9ee18:
	text "Excuse me!"
	line "You didn't SAVE"

	para "before exiting"
	line "the BATTLE ROOM."

	para "I'm awfully sorry,"
	line "but your challenge"

	para "will be declared"
	line "invalid."
	done

UnknownText_0x9ee92:
	text "Your #MON will"
	line "be healed to full"
	cont "health."
	done

UnknownText_0x9eebc:
	text "Next up, opponent"
	line "no.@"
	text_from_ram StringBuffer3
	text ". Ready?"
	done

UnknownText_0x9eee0:
	text "Your session will"
	line "be SAVED before"

	para "connecting with"
	line "the CENTER."
	done

UnknownText_0x9ef1f:
	text "Before entering"
	line "the BATTLE ROOM,"

	para "your progress will"
	line "be saved."
	done

UnknownText_0x9ef5e:
	text "SAVE and end the"
	line "session?"
	done

UnknownText_0x9ef79:
	text "Your record will"
	line "be SAVED before"

	para "you go back into"
	line "the previous ROOM."
	done

UnknownText_0x9efbf:
	text "Cancel your BATTLE"
	line "ROOM challenge?"
	done

UnknownText_0x9efe3:
	text "We have your"
	line "previous record on"

	para "file. Would you"
	line "like to register"
	cont "it at the CENTER?"
	done

UnknownText_0x9f037:
	text "We've been waiting"
	line "for you. This way"

	para "to a BATTLE ROOM,"
	line "please."
	done

UnknownText_0x9f076:
	text "You may enter only"
	line "five BATTLE ROOMS"
	cont "each day."

	para "Please come back"
	line "tomorrow."
	done

UnknownText_0x9f0c1:
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

; a dupe?
UnknownText_0x9f151:
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

UnknownText_0x9f1e5:
	text "One or more of"
	line "your #MON's"
	cont "levels exceeds @"
	deciram ScriptVar, $13
	text "."
	done

UnknownText_0x9f217:
	text_from_ram wcd49
	text " may not"
	line "enter a BATTLE"
	cont "ROOM under L70."

	para "This BATTLE ROOM"
	line "is for L@"
	deciram ScriptVar, $13
	text "."
	done

UnknownText_0x9f264:
	text "Destroyed by the"
	line "first opponent in"

	para "no time at all…"
	line "I'm no good…"
	done

UnknownText_0x9f2a4:
	text "There are lots of"
	line "BATTLE ROOMS, but"

	para "I'm going to win"
	line "them all!"
	done

UnknownText_0x9f2e3:
	text "It's a grueling"
	line "task, not being"

	para "able to use items"
	line "in battle."

	para "Making your"
	line "#MON hold items"

	para "is the key to"
	line "winning battles."
	done

UnknownText_0x9f35b:
	text "I'm trying to see"
	line "how far I can go"

	para "using just bug"
	line "#MON."

	para "Don't let there be"
	line "any fire #MON…"
	done

BattleTower1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $9, $7, 3, GROUP_BATTLE_TOWER_OUTSIDE, MAP_BATTLE_TOWER_OUTSIDE
	warp_def $9, $8, 4, GROUP_BATTLE_TOWER_OUTSIDE, MAP_BATTLE_TOWER_OUTSIDE
	warp_def $0, $7, 1, GROUP_BATTLE_TOWER_ELEVATOR, MAP_BATTLE_TOWER_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 6, 6, SIGNPOST_READ, MapBattleTower1FSignpost0Script

.PersonEvents:
	db 5
	person_event SPRITE_RECEPTIONIST, 10, 11, OW_UP | $2, $0, -1, -1, $0, 0, ReceptionistScript_0x9e3e2, -1
	person_event SPRITE_YOUNGSTER, 13, 18, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, YoungsterScript_0x9e55d, -1
	person_event SPRITE_COOLTRAINER_F, 13, 8, OW_UP | $1, $1, -1, -1, (PAL_OW_RED << 4) | $80, 0, CooltrainerFScript_0x9e568, -1
	person_event SPRITE_BUG_CATCHER, 7, 5, OW_DOWN | $2, $11, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, BugCatcherScript_0x9e56b, -1
	person_event SPRITE_GRANNY, 7, 18, OW_UP | $0, $10, -1, -1, $0, 0, GrannyScript_0x9e56e, -1
