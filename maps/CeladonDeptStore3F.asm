CeladonDeptStore3F_MapScriptHeader: ; 0x70d27
	; trigger count
	db 0

	; callback count
	db 0
; 0x70d29

UnknownScript_0x70d29: ; 0x70d29
	faceplayer
	loadfont
	pokemart $0, $0019
	loadmovesprites
	end
; 0x70d31

UnknownScript_0x70d31: ; 0x70d31
	jumptextfaceplayer UnknownText_0x70d53
; 0x70d34

UnknownScript_0x70d34: ; 0x70d34
	faceplayer
	loadfont
	2writetext UnknownText_0x70d86
	closetext
	loadmovesprites
	spriteface $4, $0
	end
; 0x70d3f

UnknownScript_0x70d3f: ; 0x70d3f
	faceplayer
	loadfont
	2writetext UnknownText_0x70dc7
	closetext
	loadmovesprites
	spriteface $5, $0
	end
; 0x70d4a

UnknownScript_0x70d4a: ; 0x70d4a
	jumptextfaceplayer UnknownText_0x70e61
; 0x70d4d

MapCeladonDeptStore3FSignpost1Script: ; 0x70d4d
	jumpstd $0014
; 0x70d50

MapCeladonDeptStore3FSignpost0Script: ; 0x70d50
	jumptext UnknownText_0x70e85
; 0x70d53

UnknownText_0x70d53: ; 0x70d53
	db $0, "I can't decide", $4f
	db "which #MON I", $51
	db "should use this TM", $4f
	db "on…", $57
; 0x70d86

UnknownText_0x70d86: ; 0x70d86
	db $0, "Uh-oh! I traded my", $4f
	db "#MON without", $51
	db "removing the UP-", $4f
	db "GRADE from it.", $57
; 0x70dc7

UnknownText_0x70dc7: ; 0x70dc7
	db $0, "Yeah! I'm finally", $4f
	db "getting a PORYGON!", $51
	db "I'm no good at the", $4f
	db "slots, so I could", $51
	db "never get enough", $4f
	db "coins…", $51
	db "…Huh?", $51
	db "The traded PORYGON", $4f
	db "turned into a dif-", $55
	db "ferent #MON!", $57
; 0x70e61

UnknownText_0x70e61: ; 0x70e61
	db $0, "The TM SHOP sells", $4f
	db "some rare moves.", $57
; 0x70e85

UnknownText_0x70e85: ; 0x70e85
	db $0, "3F: TM SHOP", $51
	db "Make Your #MON", $4f
	db "Stronger!", $57
; 0x70eab

CeladonDeptStore3F_MapEventHeader: ; 0x70eab
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_CELADON_DEPT_STORE_2F, MAP_CELADON_DEPT_STORE_2F
	warp_def $0, $f, 2, GROUP_CELADON_DEPT_STORE_4F, MAP_CELADON_DEPT_STORE_4F
	warp_def $0, $2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapCeladonDeptStore3FSignpost0Script
	signpost 0, 3, $0, MapCeladonDeptStore3FSignpost1Script

	; people-events
	db 5
	person_event $39, 5, 11, $6, $0, 255, 255, $90, 0, UnknownScript_0x70d29, $ffff
	person_event $27, 8, 10, $4, $10, 255, 255, $a0, 0, UnknownScript_0x70d31, $ffff
	person_event $3, 5, 13, $6, $0, 255, 255, $80, 0, UnknownScript_0x70d34, $ffff
	person_event $3, 5, 14, $6, $0, 255, 255, $90, 0, UnknownScript_0x70d3f, $ffff
	person_event $2b, 8, 17, $2, $11, 255, 255, $80, 0, UnknownScript_0x70d4a, $ffff
; 0x70f0b

