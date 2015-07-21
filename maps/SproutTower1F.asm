SproutTower1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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
	trainer EVENT_BEAT_SAGE_CHOW, SAGE, CHOW, SageChowSeenText, SageChowBeatenText, $0000, SageChowScript

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

.Warps:
	db 5
	warp_def $f, $9, 7, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $f, $a, 7, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $4, $6, 1, GROUP_SPROUT_TOWER_2F, MAP_SPROUT_TOWER_2F
	warp_def $6, $2, 2, GROUP_SPROUT_TOWER_2F, MAP_SPROUT_TOWER_2F
	warp_def $3, $11, 3, GROUP_SPROUT_TOWER_2F, MAP_SPROUT_TOWER_2F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 15, 7, SIGNPOST_READ, MapSproutTower1FSignpost1Script
	signpost 15, 12, SIGNPOST_READ, MapSproutTower1FSignpost1Script

.PersonEvents:
	db 6
	person_event SPRITE_SAGE, 8, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SageScript_0x1844fe, -1
	person_event SPRITE_SAGE, 11, 10, OW_DOWN | $2, $11, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SageScript_0x184501, -1
	person_event SPRITE_GRANNY, 16, 15, OW_LEFT | $0, $0, -1, -1, $0, 0, GrannyScript_0x184504, -1
	person_event SPRITE_TEACHER, 13, 13, OW_UP | $3, $0, -1, -1, $0, 0, TeacherScript_0x184507, -1
	person_event SPRITE_SAGE, 9, 7, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 4, TrainerSageChow, -1
	person_event SPRITE_POKE_BALL, 11, 20, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18451e, EVENT_SPROUT_TOWER1F_PARLYZ_HEAL
