SproutTower1F_MapScriptHeader: ; 0x1844fc
	; trigger count
	db 0

	; callback count
	db 0
; 0x1844fe

SageScript_0x1844fe: ; 0x1844fe
	jumptextfaceplayer UnknownText_0x1845d8
; 0x184501

SageScript_0x184501: ; 0x184501
	jumptextfaceplayer UnknownText_0x18460a
; 0x184504

GrannyScript_0x184504: ; 0x184504
	jumptextfaceplayer UnknownText_0x184649
; 0x184507

TeacherScript_0x184507: ; 0x184507
	jumptextfaceplayer UnknownText_0x18469d
; 0x18450a

TrainerSageChow: ; 0x18450a
	; bit/flag number
	dw $411

	; trainer group && trainer id
	db SAGE, CHOW

	; text when seen
	dw SageChowSeenText

	; text when trainer beaten
	dw SageChowBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SageChowScript
; 0x184516

SageChowScript: ; 0x184516
	talkaftercancel
	loadfont
	writetext UnknownText_0x184583
	closetext
	loadmovesprites
	end
; 0x18451e

ItemFragment_0x18451e: ; 0x18451e
	db PARLYZ_HEAL, 1
; 0x184520

MapSproutTower1FSignpost1Script: ; 0x184520
	jumptext UnknownText_0x1846d6
; 0x184523

SageChowSeenText: ; 0x184523
	text "We stand guard in"
	line "this tower."

	para "Here, we express"
	line "our gratitude to"
	cont "honor all #MON."
	done
; 0x184574

SageChowBeatenText: ; 0x184574
	text "Th-Thank you!"
	done
; 0x184583

UnknownText_0x184583: ; 0x184583
	text "All living beings"
	line "coexist through"
	cont "cooperation."

	para "We must always be"
	line "thankful for this."
	done
; 0x1845d8

UnknownText_0x1845d8: ; 0x1845d8
	text "Only if you reach"
	line "the top will you"
	cont "obtain an HM."
	done
; 0x18460a

UnknownText_0x18460a: ; 0x18460a
	text "SPROUT TOWER was"
	line "built long ago"

	para "as a place for"
	line "#MON training."
	done
; 0x184649

UnknownText_0x184649: ; 0x184649
	text "A BELLSPROUT over"
	line "100 feet tall…"

	para "People say that it"
	line "became the center"
	cont "pillar here."
	done
; 0x18469d

UnknownText_0x18469d: ; 0x18469d
	text "See the pillar"
	line "shaking?"

	para "People are train-"
	line "ing upstairs."
	done
; 0x1846d6

UnknownText_0x1846d6: ; 0x1846d6
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done
; 0x184703

SproutTower1F_MapEventHeader: ; 0x184703
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $f, $9, 7, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $f, $a, 7, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $4, $6, 1, GROUP_SPROUT_TOWER_2F, MAP_SPROUT_TOWER_2F
	warp_def $6, $2, 2, GROUP_SPROUT_TOWER_2F, MAP_SPROUT_TOWER_2F
	warp_def $3, $11, 3, GROUP_SPROUT_TOWER_2F, MAP_SPROUT_TOWER_2F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 15, 7, $0, MapSproutTower1FSignpost1Script
	signpost 15, 12, $0, MapSproutTower1FSignpost1Script

	; people-events
	db 6
	person_event SPRITE_SAGE, 8, 11, $6, $0, 255, 255, $90, 0, SageScript_0x1844fe, $ffff
	person_event SPRITE_SAGE, 11, 10, $2, $11, 255, 255, $90, 0, SageScript_0x184501, $ffff
	person_event SPRITE_GRANNY, 16, 15, $8, $0, 255, 255, $0, 0, GrannyScript_0x184504, $ffff
	person_event SPRITE_TEACHER, 13, 13, $7, $0, 255, 255, $0, 0, TeacherScript_0x184507, $ffff
	person_event SPRITE_SAGE, 9, 7, $7, $0, 255, 255, $92, 4, TrainerSageChow, $ffff
	person_event SPRITE_POKE_BALL, 11, 20, $1, $0, 255, 255, $1, 0, ItemFragment_0x18451e, $0647
; 0x18477a
