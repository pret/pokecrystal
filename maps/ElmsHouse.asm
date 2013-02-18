ElmsHouse_MapScriptHeader: ; 0x7aee9
	; trigger count
	db 0

	; callback count
	db 0
; 0x7aeeb

UnknownScript_0x7aeeb: ; 0x7aeeb
	jumptextfaceplayer UnknownText_0x7aef7
; 0x7aeee

UnknownScript_0x7aeee: ; 0x7aeee
	jumptextfaceplayer UnknownText_0x7af6b
; 0x7aef1

MapElmsHouseSignpost0Script: ; 0x7aef1
	jumptext UnknownText_0x7b01b
; 0x7aef4

MapElmsHouseSignpost2Script: ; 0x7aef4
	jumpstd $0001
; 0x7aef7

UnknownText_0x7aef7: ; 0x7aef7
	db $0, "Hi, ", $14, "! My", $4f
	db "husband's always", $51
	db "so busy--I hope", $4f
	db "he's OK.", $51
	db "When he's caught", $4f
	db "up in his #MON", $51
	db "research, he even", $4f
	db "forgets to eat.", $57
; 0x7af6b

UnknownText_0x7af6b: ; 0x7af6b
	db $0, "When I grow up,", $4f
	db "I'm going to help", $55
	db "my dad!", $51
	db "I'm going to be a", $4f
	db "great #MON", $55
	db "professor!", $57
; 0x7afbc

UnknownText_0x7afbc: ; 0x7afbc
	db $0, "There's some food", $4f
	db "here. It must be", $55
	db "for the LAB.", $57
; 0x7afec

UnknownText_0x7afec: ; 0x7afec
	db $0, "There's some food", $4f
	db "here. This must be", $55
	db "for #MON.", $57
; 0x7b01b

UnknownText_0x7b01b: ; 0x7b01b
	db $0, "#MON. Where do", $4f
	db "they come from? ", $51
	db "Where are they", $4f
	db "going?", $51
	db "Why has no one", $4f
	db "ever witnessed a", $55
	db "#MON's birth?", $51
	db "I want to know! I", $4f
	db "will dedicate my", $51
	db "life to the study", $4f
	db "of #MON!", $51
	db "…", $51
	db "It's a part of", $4f
	db "PROF.ELM's re-", $55
	db "search papers.", $57
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
	person_event $29, 9, 5, $4, $10, 255, 255, $a0, 0, UnknownScript_0x7aeeb, $ffff
	person_event $25, 8, 9, $7, $0, 255, 255, $0, 0, UnknownScript_0x7aeee, $ffff
; 0x7b123

