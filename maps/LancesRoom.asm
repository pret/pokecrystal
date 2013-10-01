LancesRoom_MapScriptHeader: ; 0x180e2c
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x180e39, $0000
	dw UnknownScript_0x180e3d, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x180e3e
; 0x180e39

UnknownScript_0x180e39: ; 0x180e39
	priorityjump UnknownScript_0x180e53
	end
; 0x180e3d

UnknownScript_0x180e3d: ; 0x180e3d
	end
; 0x180e3e

UnknownScript_0x180e3e: ; 0x180e3e
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x180e48
	changeblock $4, $16, $34
UnknownScript_0x180e48: ; 0x180e48
	checkevent $0312
	iffalse UnknownScript_0x180e52
	changeblock $4, $0, $b
UnknownScript_0x180e52: ; 0x180e52
	return
; 0x180e53

UnknownScript_0x180e53: ; 0x180e53
	applymovement $0, MovementData_0x180f33
	refreshscreen $86
	playsound $001b
	earthquake 80
	changeblock $4, $16, $34
	reloadmappart
	loadmovesprites
	dotrigger $1
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end
; 0x180e6a

UnknownScript_0x180e6a: ; 0x180e6a
	special $006a
	applymovement $0, MovementData_0x180f38
	2jump UnknownScript_0x180e7b
; 0x180e74

UnknownScript_0x180e74: ; 0x180e74
	special $006a
	applymovement $0, MovementData_0x180f3c
UnknownScript_0x180e7b: ; 0x180e7b
	spriteface $2, $2
	loadfont
	2writetext UnknownText_0x180f67
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1810a4, $0000
	setlasttalked $2
	loadtrainer CHAMPION, LANCE
	startbattle
	reloadmapmusic
	returnafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	loadfont
	2writetext UnknownText_0x181132
	closetext
	loadmovesprites
	playsound $001f
	changeblock $4, $0, $b
	reloadmappart
	loadmovesprites
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout $0038, $10
	pause 30
	showemote $0, $2, 15
	spriteface $2, $0
	pause 10
	spriteface $0, $0
	appear $3
	applymovement $3, MovementData_0x180f41
	loadfont
	2writetext UnknownText_0x1811dd
	closetext
	loadmovesprites
	appear $4
	applymovement $4, MovementData_0x180f46
	follow $3, $4
	applymovement $3, MovementData_0x180f49
	stopfollow
	spriteface $4, $1
	spriteface $2, $2
	loadfont
	2writetext UnknownText_0x18121b
	closetext
	loadmovesprites
	applymovement $3, MovementData_0x180f4c
	spriteface $0, $2
	loadfont
	2writetext UnknownText_0x18134b
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x180f4f
	spriteface $0, $1
	loadfont
	2writetext UnknownText_0x18137b
	closetext
	loadmovesprites
	follow $2, $0
	spriteface $3, $1
	spriteface $4, $1
	applymovement $2, MovementData_0x180f53
	stopfollow
	playsound $0023
	disappear $2
	applymovement $0, MovementData_0x180f55
	playsound $0023
	disappear $0
	applymovement $3, MovementData_0x180f57
	showemote $0, $3, 15
	loadfont
	2writetext UnknownText_0x1813c5
	pause 30
	loadmovesprites
	applymovement $3, MovementData_0x180f5b
	special $002e
	pause 15
	warpfacing $1, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME, $4, $d
	end
; 0x180f33

MovementData_0x180f33: ; 0x180f33
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x180f38

MovementData_0x180f38: ; 0x180f38
	step_up
	step_up
	turn_head_right
	step_end
; 0x180f3c

MovementData_0x180f3c: ; 0x180f3c
	step_up
	step_left
	step_up
	turn_head_right
	step_end
; 0x180f41

MovementData_0x180f41: ; 0x180f41
	big_step_up
	big_step_up
	big_step_up
	turn_head_down
	step_end
; 0x180f46

MovementData_0x180f46: ; 0x180f46
	step_up
	step_up
	step_end
; 0x180f49

MovementData_0x180f49: ; 0x180f49
	step_left
	turn_head_right
	step_end
; 0x180f4c

MovementData_0x180f4c: ; 0x180f4c
	big_step_up
	turn_head_right
	step_end
; 0x180f4f

MovementData_0x180f4f: ; 0x180f4f
	step_up
	step_left
	turn_head_down
	step_end
; 0x180f53

MovementData_0x180f53: ; 0x180f53
	step_up
	step_end
; 0x180f55

MovementData_0x180f55: ; 0x180f55
	step_up
	step_end
; 0x180f57

MovementData_0x180f57: ; 0x180f57
	step_up
	step_right
	turn_head_up
	step_end
; 0x180f5b

MovementData_0x180f5b: ; 0x180f5b
	big_step_right
	big_step_right
	big_step_left
	big_step_left
	big_step_left
	big_step_right
	big_step_right
	big_step_right
	big_step_left
	big_step_left
	turn_head_up
	step_end
; 0x180f67

UnknownText_0x180f67: ; 0x180f67
	db $0, "LANCE: I've been", $4f
	db "waiting for you.", $51
	db $14, "!", $51
	db "I knew that you,", $4f
	db "with your skills,", $51
	db "would eventually", $4f
	db "reach me here.", $51
	db "There's no need", $4f
	db "for words now.", $51
	db "We will battle to", $4f
	db "determine who is", $51
	db "the stronger of", $4f
	db "the two of us.", $51
	db "As the most power-", $4f
	db "ful trainer and as", $51
	db "the #MON LEAGUE", $4f
	db "CHAMPION…", $51
	db "I, LANCE the drag-", $4f
	db "on master, accept", $55
	db "your challenge!", $57
; 0x1810a4

UnknownText_0x1810a4: ; 0x1810a4
	db $0, "…It's over.", $51
	db "But it's an odd", $4f
	db "feeling.", $51
	db "I'm not angry that", $4f
	db "I lost. In fact, I", $55
	db "feel happy.", $51
	db "Happy that I", $4f
	db "witnessed the rise", $51
	db "of a great new", $4f
	db "CHAMPION!", $57
; 0x181132

UnknownText_0x181132: ; 0x181132
	db $0, "…Whew.", $51
	db "You have become", $4f
	db "truly powerful,", $55
	db $14, ".", $51
	db "Your #MON have", $4f
	db "responded to your", $51
	db "strong and up-", $4f
	db "standing nature.", $51
	db "As a trainer, you", $4f
	db "will continue to", $51
	db "grow strong with", $4f
	db "your #MON.", $57
; 0x1811dd

UnknownText_0x1811dd: ; 0x1811dd
	db $0, "MARY: Oh, no!", $4f
	db "It's all over!", $51
	db "PROF.OAK, if you", $4f
	db "weren't so slow…", $57
; 0x18121b

UnknownText_0x18121b: ; 0x18121b
	db $0, "PROF.OAK: Ah,", $4f
	db $14, "!", $51
	db "It's been a long", $4f
	db "while.", $51
	db "You certainly look", $4f
	db "more impressive.", $51
	db "Your conquest of", $4f
	db "the LEAGUE is just", $55
	db "fantastic!", $51
	db "Your dedication,", $4f
	db "trust and love for", $51
	db "your #MON made", $4f
	db "this happen.", $51
	db "Your #MON were", $4f
	db "outstanding too.", $51
	db "Because they be-", $4f
	db "lieved in you as a", $51
	db "trainer, they per-", $4f
	db "severed.", $51
	db "Congratulations,", $4f
	db $14, "!", $57
; 0x18134b

UnknownText_0x18134b: ; 0x18134b
	db $0, "MARY: Let's inter-", $4f
	db "view the brand new", $55
	db "CHAMPION!", $57
; 0x18137b

UnknownText_0x18137b: ; 0x18137b
	db $0, "LANCE: This is", $4f
	db "getting to be a", $55
	db "bit too noisy…", $51
	db $14, ", could you", $4f
	db "come with me?", $57
; 0x1813c5

UnknownText_0x1813c5: ; 0x1813c5
	db $0, "MARY: Oh, wait!", $4f
	db "We haven't done", $55
	db "the interview!", $57
; 0x1813f4

LancesRoom_MapEventHeader: ; 0x1813f4
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $17, $4, 3, GROUP_KARENS_ROOM, MAP_KARENS_ROOM
	warp_def $17, $5, 4, GROUP_KARENS_ROOM, MAP_KARENS_ROOM
	warp_def $1, $4, 1, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME
	warp_def $1, $5, 2, GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME

	; xy triggers
	db 2
	xy_trigger 1, $5, $4, $0, UnknownScript_0x180e6a, $0, $0
	xy_trigger 1, $5, $5, $0, UnknownScript_0x180e74, $0, $0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_LANCE, 7, 9, $6, $0, 255, 255, $0, 0, $4e7b, $ffff
	person_event SPRITE_TEACHER, 11, 8, $7, $0, 255, 255, $a0, 0, ObjectEvent, $075f
	person_event SPRITE_OAK, 11, 8, $7, $0, 255, 255, $0, 0, ObjectEvent, $075f
; 0x181445

