IcePathB1F_MapScriptHeader: ; 0x7e4b9
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 3, UnknownScript_0x7e4be
; 0x7e4be

UnknownScript_0x7e4be: ; 0x7e4be
	writecmdqueue $64c2
	return
; 0x7e4c2

INCBIN "baserom.gbc",$7e4c2,$7e50a - $7e4c2

UnknownScript_0x7e50a: ; 0x7e50a
	jumpstd $000e
; 0x7e50d

ItemFragment_0x7e50d: ; 0x7e50d
	db IRON, 1
; 0x7e50f

MapIcePathB1FSignpostItem0: ; 0x7e50f
	dw $0094
	db MAX_POTION
; 0x7e512

INCBIN "baserom.gbc",$7e512,$1b

IcePathB1F_MapEventHeader: ; 0x7e52d
	; filler
	db 0, 0

	; warps
	db 8
	warp_def $f, $3, 3, GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F
	warp_def $3, $11, 1, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $2, $b, 3, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $7, $4, 4, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $c, $5, 5, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $d, $c, 6, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $19, $5, 4, GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F
	warp_def $1b, $b, 1, GROUP_ICE_PATH_B2F_BLACKTHORN_SIDE, MAP_ICE_PATH_B2F_BLACKTHORN_SIDE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 30, 17, $7, MapIcePathB1FSignpostItem0

	; people-events
	db 5
	person_event $5a, 11, 15, $19, $0, 255, 255, $0, 0, UnknownScript_0x7e50a, $0709
	person_event $5a, 12, 11, $19, $0, 255, 255, $0, 0, UnknownScript_0x7e50a, $070a
	person_event $5a, 13, 12, $19, $0, 255, 255, $0, 0, UnknownScript_0x7e50a, $070b
	person_event $5a, 11, 21, $19, $0, 255, 255, $0, 0, UnknownScript_0x7e50a, $070c
	person_event $54, 39, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e50d, $068a
; 0x7e5a1

