HallOfFame_MapScriptHeader: ; 0x181445
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x18144f, $0000
	dw UnknownScript_0x181453, $0000

	; callback count
	db 0
; 0x18144f

UnknownScript_0x18144f: ; 0x18144f
	priorityjump UnknownScript_0x181454
	end
; 0x181453

UnknownScript_0x181453: ; 0x181453
	end
; 0x181454

UnknownScript_0x181454: ; 0x181454
	follow $2, $0
	applymovement $2, MovementData_0x181499
	stopfollow
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x1814a6
	closetext
	loadmovesprites
	spriteface $2, UP
	applymovement $0, MovementData_0x1814a4
	dotrigger $1
	pause 15
	writebyte $2
	special HealMachineAnim
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_TELEPORT_GUY
	setevent EVENT_RIVAL_SPROUT_TOWER
	clearevent EVENT_RED_IN_MT_SILVER
	setevent $0737
	clearevent $0738
	domaptrigger GROUP_SPROUT_TOWER_3F, MAP_SPROUT_TOWER_3F, $1
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue UnknownScript_0x181497
	specialphonecall $5
UnknownScript_0x181497: ; 0x181497
	halloffame
	end
; 0x181499

MovementData_0x181499: ; 0x181499
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	turn_head_left
	step_end
; 0x1814a4

MovementData_0x1814a4: ; 0x1814a4
	slow_step_up
	step_end
; 0x1814a6

UnknownText_0x1814a6: ; 0x1814a6
	text "LANCE: It's been a"
	line "long time since I"
	cont "last came here."

	para "This is where we"
	line "honor the LEAGUE"

	para "CHAMPIONS for all"
	line "eternity."

	para "Their courageous"
	line "#MON are also"
	cont "inducted."

	para "Here today, we"
	line "witnessed the rise"

	para "of a new LEAGUE"
	line "CHAMPION--a"

	para "trainer who feels"
	line "compassion for,"

	para "and trust toward,"
	line "all #MON."

	para "A trainer who"
	line "succeeded through"

	para "perseverance and"
	line "determination."

	para "The new LEAGUE"
	line "CHAMPION who has"

	para "all the makings"
	line "of greatness!"

	para $14, ", allow me"
	line "to register you"

	para "and your partners"
	line "as CHAMPIONS!"
	done
; 0x181678

HallOfFame_MapEventHeader: ; 0x181678
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $d, $4, 3, GROUP_LANCES_ROOM, MAP_LANCES_ROOM
	warp_def $d, $5, 4, GROUP_LANCES_ROOM, MAP_LANCES_ROOM

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_LANCE, 16, 8, $7, $0, 255, 255, $0, 0, ObjectEvent, $ffff
; 0x181695
