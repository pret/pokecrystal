ViridianNicknameSpeechHouse_MapScriptHeader: ; 0x9ae38
	; trigger count
	db 0

	; callback count
	db 0
; 0x9ae3a

UnknownScript_0x9ae3a: ; 0x9ae3a
	jumptextfaceplayer UnknownText_0x9ae54
; 0x9ae3d

UnknownScript_0x9ae3d: ; 0x9ae3d
	jumptextfaceplayer UnknownText_0x9aecb
; 0x9ae40

UnknownScript_0x9ae40: ; 0x9ae40
	loadfont
	2writetext UnknownText_0x9aefe
	cry SPEAROW
	closetext
	loadmovesprites
	end
; 0x9ae4a

UnknownScript_0x9ae4a: ; 0x9ae4a
	loadfont
	2writetext UnknownText_0x9af10
	cry RATTATA
	closetext
	loadmovesprites
	end
; 0x9ae54

UnknownText_0x9ae54: ; 0x9ae54
	db $0, "Do you put a lot", $4f
	db "of thought into", $51
	db "naming your", $4f
	db "#MON?", $51
	db "Giving them good", $4f
	db "nicknames adds to", $51
	db "the fun of trading", $4f
	db "with others.", $57
; 0x9aecb

UnknownText_0x9aecb: ; 0x9aecb
	db $0, "They're SPEARY--", $4f
	db "a SPEAROW--and", $55
	db "RATTEY--a RATTATA.", $57
; 0x9aefe

UnknownText_0x9aefe: ; 0x9aefe
	db $0, "SPEARY: Ch-chun!", $57
; 0x9af10

UnknownText_0x9af10: ; 0x9af10
	db $0, "RATTEY: Kikiii!", $57
; 0x9af21

ViridianNicknameSpeechHouse_MapEventHeader: ; 0x9af21
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $7, $3, 2, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event $2d, 8, 6, $9, $0, 255, 255, $80, 0, UnknownScript_0x9ae3a, $ffff
	person_event $28, 8, 9, $7, $0, 255, 255, $a0, 0, UnknownScript_0x9ae3d, $ffff
	person_event $9e, 6, 9, $16, $2, 255, 255, $b0, 0, UnknownScript_0x9ae40, $ffff
	person_event $82, 7, 10, $16, $2, 255, 255, $90, 0, UnknownScript_0x9ae4a, $ffff
; 0x9af65

