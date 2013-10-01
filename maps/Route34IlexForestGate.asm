Route34IlexForestGate_MapScriptHeader: ; 0x62d28
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x62d2d
; 0x62d2d

UnknownScript_0x62d2d: ; 0x62d2d
	checkevent $00c0
	iffalse UnknownScript_0x62d38
	disappear $2
	appear $5
	return
; 0x62d38

UnknownScript_0x62d38: ; 0x62d38
	disappear $5
	appear $2
	return
; 0x62d3d

UnknownScript_0x62d3d: ; 0x62d3d
	checkevent $00c0
	iffalse UnknownScript_0x62d62
	showemote $0, $5, 20
	spriteface $5, $2
	spriteface $0, $3
	follow $0, $5
	applymovement $0, MovementData_0x62d97
	stopfollow
	spriteface $0, $0
	loadfont
	2writetext UnknownText_0x62e41
	closetext
	loadmovesprites
	applymovement $5, MovementData_0x62d9a
UnknownScript_0x62d62: ; 0x62d62
	end
; 0x62d63

TeacherScript_0x62d63: ; 0x62d63
	faceplayer
	loadfont
	checkevent $00c0
	iftrue UnknownScript_0x62d84
	checkevent EVENT_GOT_TM12_SWEET_SCENT
	iftrue UnknownScript_0x62d7e
	2writetext UnknownText_0x62d9d
	keeptextopen
	verbosegiveitem TM_12, 1
	iffalse UnknownScript_0x62d82
	setevent EVENT_GOT_TM12_SWEET_SCENT
UnknownScript_0x62d7e: ; 0x62d7e
	2writetext UnknownText_0x62df6
	closetext
UnknownScript_0x62d82: ; 0x62d82
	loadmovesprites
	end
; 0x62d84

UnknownScript_0x62d84: ; 0x62d84
	2writetext UnknownText_0x62e41
	keeptextopen
	loadmovesprites
	end
; 0x62d8a

ButterfreeScript_0x62d8a: ; 0x62d8a
	loadfont
	2writetext UnknownText_0x62e83
	cry BUTTERFREE
	closetext
	loadmovesprites
	end
; 0x62d94

LassScript_0x62d94: ; 0x62d94
	jumptextfaceplayer UnknownText_0x62e97
; 0x62d97

MovementData_0x62d97: ; 0x62d97
	step_up
	step_up
	step_end
; 0x62d9a

MovementData_0x62d9a: ; 0x62d9a
	step_down
	step_right
	step_end
; 0x62d9d

UnknownText_0x62d9d: ; 0x62d9d
	db $0, "Oh, honey. You're", $4f
	db "making a #DEX?", $51
	db "It must be hard if", $4f
	db "#MON won't", $51
	db "appear. Try using", $4f
	db "this TM.", $57
; 0x62df6

UnknownText_0x62df6: ; 0x62df6
	db $0, "It's SWEET SCENT.", $51
	db "Use it wherever", $4f
	db "#MON appear.", $51
	db "#MON will be", $4f
	db "enticed by it.", $57
; 0x62e41

UnknownText_0x62e41: ; 0x62e41
	db $0, "Something's wrong", $4f
	db "in ILEX FOREST…", $51
	db "You should stay", $4f
	db "away right now.", $57
; 0x62e83

UnknownText_0x62e83: ; 0x62e83
	db $0, "BUTTERFREE: Freeh!", $57
; 0x62e97

UnknownText_0x62e97: ; 0x62e97
	db $0, "Did you see the", $4f
	db "shrine honoring", $55
	db "the protector?", $51
	db "It watches over", $4f
	db "the FOREST from", $55
	db "across time.", $51
	db "I think that it", $4f
	db "must be a grass-", $55
	db "type #MON.", $57
; 0x62f20

Route34IlexForestGate_MapEventHeader: ; 0x62f20
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 1, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $0, $5, 2, GROUP_ROUTE_34, MAP_ROUTE_34
	warp_def $7, $4, 1, GROUP_ILEX_FOREST, MAP_ILEX_FOREST
	warp_def $7, $5, 1, GROUP_ILEX_FOREST, MAP_ILEX_FOREST

	; xy triggers
	db 1
	xy_trigger 0, $7, $4, $0, UnknownScript_0x62d3d, $0, $0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_TEACHER, 7, 13, $8, $0, 255, 255, $90, 0, TeacherScript_0x62d63, $06ea
	person_event SPRITE_BUTTERFREE, 8, 13, $16, $0, 255, 255, $80, 0, ButterfreeScript_0x62d8a, $ffff
	person_event SPRITE_LASS, 8, 7, $4, $10, 255, 255, $a0, 0, LassScript_0x62d94, $06eb
	person_event SPRITE_TEACHER, 11, 9, $7, $0, 255, 255, $90, 0, TeacherScript_0x62d63, $06ec
; 0x62f76

