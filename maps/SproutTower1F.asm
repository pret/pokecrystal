SproutTower1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

SageScript_0x1844fe:
	jumptextfaceplayer UnknownText_0x1845d8

SageScript_0x184501:
	jumptextfaceplayer UnknownText_0x18460a

GrannyScript_0x184504:
	jumptextfaceplayer UnknownText_0x184649

TeacherScript_0x184507:
	jumptextfaceplayer UnknownText_0x18469d

TrainerSageChow:
	; bit/flag number
	dw EVENT_BEAT_SAGE_CHOW

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

SageChowScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x184583
	closetext
	loadmovesprites
	end

ItemFragment_0x18451e:
	db PARLYZ_HEAL, 1

MapSproutTower1FSignpost1Script:
	jumptext UnknownText_0x1846d6

SageChowSeenText:
	text "We stand guard in"
	line "this tower."

	para "Here, we express"
	line "our gratitude to"
	cont "honor all #MON."
	done

SageChowBeatenText:
	text "Th-Thank you!"
	done

UnknownText_0x184583:
	text "All living beings"
	line "coexist through"
	cont "cooperation."

	para "We must always be"
	line "thankful for this."
	done

UnknownText_0x1845d8:
	text "Only if you reach"
	line "the top will you"
	cont "obtain an HM."
	done

UnknownText_0x18460a:
	text "SPROUT TOWER was"
	line "built long ago"

	para "as a place for"
	line "#MON training."
	done

UnknownText_0x184649:
	text "A BELLSPROUT over"
	line "100 feet tall…"

	para "People say that it"
	line "became the center"
	cont "pillar here."
	done

UnknownText_0x18469d:
	text "See the pillar"
	line "shaking?"

	para "People are train-"
	line "ing upstairs."
	done

UnknownText_0x1846d6:
	text "A #MON statue…"

	para "It looks very"
	line "distinguished."
	done

SproutTower1F_MapEventHeader:
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
	person_event SPRITE_SAGE, 8, 11, $6, $0, 255, 255, $90, 0, SageScript_0x1844fe, EVENT_ALWAYS_THERE
	person_event SPRITE_SAGE, 11, 10, $2, $11, 255, 255, $90, 0, SageScript_0x184501, EVENT_ALWAYS_THERE
	person_event SPRITE_GRANNY, 16, 15, $8, $0, 255, 255, $0, 0, GrannyScript_0x184504, EVENT_ALWAYS_THERE
	person_event SPRITE_TEACHER, 13, 13, $7, $0, 255, 255, $0, 0, TeacherScript_0x184507, EVENT_ALWAYS_THERE
	person_event SPRITE_SAGE, 9, 7, $7, $0, 255, 255, $92, 4, TrainerSageChow, EVENT_ALWAYS_THERE
	person_event SPRITE_POKE_BALL, 11, 20, $1, $0, 255, 255, $1, 0, ItemFragment_0x18451e, EVENT_647
