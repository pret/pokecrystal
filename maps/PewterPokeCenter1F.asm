PewterPokeCenter1F_MapScriptHeader: ; 0x1a2ee5
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a2ee7

UnknownScript_0x1a2ee7: ; 0x1a2ee7
	jumpstd $0000
; 0x1a2eea

UnknownScript_0x1a2eea: ; 0x1a2eea
	jumptextfaceplayer UnknownText_0x1a2f01
; 0x1a2eed

UnknownScript_0x1a2eed: ; 0x1a2eed
	loadfont
	2writetext UnknownText_0x1a2f5d
	cry JIGGLYPUFF
	closetext
	loadmovesprites
	end
; 0x1a2ef7

UnknownScript_0x1a2ef7: ; 0x1a2ef7
	jumptextfaceplayer UnknownText_0x1a2f75
; 0x1a2efa

UnknownScript_0x1a2efa: ; 0x1a2efa
	faceplayer
	loadfont
	trade $4
	closetext
	loadmovesprites
	end
; 0x1a2f01

UnknownText_0x1a2f01: ; 0x1a2f01
	db $0, "…Yeah, and the", $4f
	db "GYM in CINNABAR's", $51
	db "gone. I was really", $4f
	db "amazed.", $51
	db "…Yes? I'm on the", $4f
	db "phone. Go away!", $57
; 0x1a2f5d

UnknownText_0x1a2f5d: ; 0x1a2f5d
	db $0, "JIGGLYPUFF: Puu", $4f
	db "pupuu.", $57
; 0x1a2f75

UnknownText_0x1a2f75: ; 0x1a2f75
	db $0, "Most #MON get", $4f
	db "drowsy if they", $51
	db "hear a JIGGLYPUFF", $4f
	db "singing.", $51
	db "There are several", $4f
	db "moves that can be", $51
	db "used only while a", $4f
	db "#MON is asleep.", $57
; 0x1a2ff4

PewterPokeCenter1F_MapEventHeader: ; 0x1a2ff4
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 4, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $4, 4, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x1a2ee7, $ffff
	person_event $29, 10, 12, $6, $0, 255, 255, $a0, 0, UnknownScript_0x1a2eea, $ffff
	person_event $94, 7, 5, $16, $0, 255, 255, $0, 0, UnknownScript_0x1a2eed, $ffff
	person_event $25, 7, 6, $6, $0, 255, 255, $90, 0, UnknownScript_0x1a2ef7, $ffff
	person_event $2d, 6, 11, $6, $0, 255, 255, $80, 0, UnknownScript_0x1a2efa, $ffff
; 0x1a304a

