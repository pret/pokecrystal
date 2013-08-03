SoulHouse_MapScriptHeader: ; 0x7ec45
	; trigger count
	db 0

	; callback count
	db 0
; 0x7ec47

GrampsScript_0x7ec47: ; 0x7ec47
	jumptextfaceplayer UnknownText_0x7ec53
; 0x7ec4a

TeacherScript_0x7ec4a: ; 0x7ec4a
	jumptextfaceplayer UnknownText_0x7ed4d
; 0x7ec4d

LassScript_0x7ec4d: ; 0x7ec4d
	jumptextfaceplayer UnknownText_0x7edb1
; 0x7ec50

GrannyScript_0x7ec50: ; 0x7ec50
	jumptextfaceplayer UnknownText_0x7eddb
; 0x7ec53

UnknownText_0x7ec53: ; 0x7ec53
	db $0, "MR.FUJI: Welcome.", $51
	db "Hmm… You appear to", $4f
	db "be raising your", $51
	db "#MON in a kind", $4f
	db "and loving manner.", $51
	db "#MON lovers", $4f
	db "come here to pay", $51
	db "their respects to", $4f
	db "departed #MON.", $51
	db "Please offer con-", $4f
	db "dolences for the", $51
	db "souls of the de-", $4f
	db "parted #MON.", $51
	db "I'm sure that will", $4f
	db "make them happy.", $57
; 0x7ed4d

UnknownText_0x7ed4d: ; 0x7ed4d
	db $0, "There are other", $4f
	db "graves of #MON", $55
	db "here, I think.", $51
	db "There are many", $4f
	db "chambers that only", $55
	db "MR.FUJI may enter.", $57
; 0x7edb1

UnknownText_0x7edb1: ; 0x7edb1
	db $0, "I came with my mom", $4f
	db "to visit #MON", $55
	db "graves…", $57
; 0x7eddb

UnknownText_0x7eddb: ; 0x7eddb
	db $0, "The #MON that", $4f
	db "lived with me…", $51
	db "I loved them like", $4f
	db "my grandchildren…", $57
; 0x7ee1d

SoulHouse_MapEventHeader: ; 0x7ee1d
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $4, 6, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
	warp_def $7, $5, 6, GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_GRAMPS, 6, 8, $6, $0, 255, 255, $90, 0, GrampsScript_0x7ec47, $ffff
	person_event SPRITE_TEACHER, 7, 11, $5, $1, 255, 255, $90, 0, TeacherScript_0x7ec4a, $ffff
	person_event SPRITE_LASS, 9, 6, $7, $0, 255, 255, $90, 0, LassScript_0x7ec4d, $ffff
	person_event SPRITE_GRANNY, 7, 5, $7, $0, 255, 255, $90, 0, GrannyScript_0x7ec50, $ffff
; 0x7ee61

