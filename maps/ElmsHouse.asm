ElmsHouse_MapScriptHeader: ; 0x7aee9
	; trigger count
	db 0

	; callback count
	db 0
; 0x7aeeb

TeacherScript_0x7aeeb: ; 0x7aeeb
	jumptextfaceplayer UnknownText_0x7aef7
; 0x7aeee

BugCatcherScript_0x7aeee: ; 0x7aeee
	jumptextfaceplayer UnknownText_0x7af6b
; 0x7aef1

MapElmsHouseSignpost0Script: ; 0x7aef1
	jumptext UnknownText_0x7b01b
; 0x7aef4

MapElmsHouseSignpost2Script: ; 0x7aef4
	jumpstd difficultbookshelf
; 0x7aef7

UnknownText_0x7aef7: ; 0x7aef7
	text "Hi, ", $14, "! My"
	line "husband's always"

	para "so busy--I hope"
	line "he's OK."

	para "When he's caught"
	line "up in his #MON"

	para "research, he even"
	line "forgets to eat."
	done
; 0x7af6b

UnknownText_0x7af6b: ; 0x7af6b
	text "When I grow up,"
	line "I'm going to help"
	cont "my dad!"

	para "I'm going to be a"
	line "great #MON"
	cont "professor!"
	done
; 0x7afbc

UnknownText_0x7afbc: ; 0x7afbc
	text "There's some food"
	line "here. It must be"
	cont "for the LAB."
	done
; 0x7afec

UnknownText_0x7afec: ; 0x7afec
	text "There's some food"
	line "here. This must be"
	cont "for #MON."
	done
; 0x7b01b

UnknownText_0x7b01b: ; 0x7b01b
	text "#MON. Where do"
	line "they come from? "

	para "Where are they"
	line "going?"

	para "Why has no one"
	line "ever witnessed a"
	cont "#MON's birth?"

	para "I want to know! I"
	line "will dedicate my"

	para "life to the study"
	line "of #MON!"

	para "…"

	para "It's a part of"
	line "PROF.ELM's re-"
	cont "search papers."
	done
; 0x7b0ea

ElmsHouse_MapEventHeader: ; 0x7b0ea
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
	warp_def $7, $3, 4, GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, MapElmsHouseSignpost0Script
	signpost 1, 6, $0, MapElmsHouseSignpost2Script
	signpost 1, 7, $0, MapElmsHouseSignpost2Script

	; people-events
	db 2
	person_event SPRITE_TEACHER, 9, 5, $4, $10, 255, 255, $a0, 0, TeacherScript_0x7aeeb, $ffff
	person_event SPRITE_BUG_CATCHER, 8, 9, $7, $0, 255, 255, $0, 0, BugCatcherScript_0x7aeee, $ffff
; 0x7b123
