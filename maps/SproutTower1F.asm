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
	2writetext UnknownText_0x184583
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
	db $0, "We stand guard in", $4f
	db "this tower.", $51
	db "Here, we express", $4f
	db "our gratitude to", $55
	db "honor all #MON.", $57
; 0x184574

SageChowBeatenText: ; 0x184574
	db $0, "Th-Thank you!", $57
; 0x184583

UnknownText_0x184583: ; 0x184583
	db $0, "All living beings", $4f
	db "coexist through", $55
	db "cooperation.", $51
	db "We must always be", $4f
	db "thankful for this.", $57
; 0x1845d8

UnknownText_0x1845d8: ; 0x1845d8
	db $0, "Only if you reach", $4f
	db "the top will you", $55
	db "obtain an HM.", $57
; 0x18460a

UnknownText_0x18460a: ; 0x18460a
	db $0, "SPROUT TOWER was", $4f
	db "built long ago", $51
	db "as a place for", $4f
	db "#MON training.", $57
; 0x184649

UnknownText_0x184649: ; 0x184649
	db $0, "A BELLSPROUT over", $4f
	db "100 feet tall…", $51
	db "People say that it", $4f
	db "became the center", $55
	db "pillar here.", $57
; 0x18469d

UnknownText_0x18469d: ; 0x18469d
	db $0, "See the pillar", $4f
	db "shaking?", $51
	db "People are train-", $4f
	db "ing upstairs.", $57
; 0x1846d6

UnknownText_0x1846d6: ; 0x1846d6
	db $0, "A #MON statue…", $51
	db "It looks very", $4f
	db "distinguished.", $57
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

