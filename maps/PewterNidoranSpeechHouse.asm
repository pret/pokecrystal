PewterNidoranSpeechHouse_MapScriptHeader: ; 0x1a2805
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a2807

UnknownScript_0x1a2807: ; 0x1a2807
	jumptextfaceplayer UnknownText_0x1a2814
; 0x1a280a

UnknownScript_0x1a280a: ; 0x1a280a
	loadfont
	2writetext UnknownText_0x1a2825
	cry NIDORAN_M
	closetext
	loadmovesprites
	end
; 0x1a2814

UnknownText_0x1a2814: ; 0x1a2814
	db $0, "NIDORAN, shake!", $57
; 0x1a2825

UnknownText_0x1a2825: ; 0x1a2825
	db $0, "NIDORAN: Gau gau!", $57
; 0x1a2838

PewterNidoranSpeechHouse_MapEventHeader: ; 0x1a2838
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $3, 1, GROUP_PEWTER_CITY, MAP_PEWTER_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event $2b, 9, 7, $9, $0, 255, 255, $a0, 0, UnknownScript_0x1a2807, $ffff
	person_event $82, 9, 8, $16, $0, 255, 255, $90, 0, UnknownScript_0x1a280a, $ffff
; 0x1a2862

