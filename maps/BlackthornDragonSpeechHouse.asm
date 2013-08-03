BlackthornDragonSpeechHouse_MapScriptHeader: ; 0x195947
	; trigger count
	db 0

	; callback count
	db 0
; 0x195949

GrannyScript_0x195949: ; 0x195949
	jumptextfaceplayer UnknownText_0x19595c
; 0x19594c

EkansScript_0x19594c: ; 0x19594c
	loadfont
	2writetext UnknownText_0x1959ee
	cry DRATINI
	closetext
	loadmovesprites
	end
; 0x195956

UnknownText_0x195956: ; 0x195956
	limited_interpret_data 2
	db $0, "ズ", $03, $00

UnknownText_0x19595c: ; 0x19595c
	db $0, "A clan of trainers", $4f
	db "who can freely", $51
	db "command dragons", $4f
	db "live right here in", $55
	db "BLACKTHORN.", $51
	db "As a result, there", $4f
	db "are many legends", $51
	db "about dragons in", $4f
	db "this town.", $57
; 0x1959ee

UnknownText_0x1959ee: ; 0x1959ee
	db $0, "DRATINI: Draa!", $57
; 0x1959fe

BlackthornDragonSpeechHouse_MapEventHeader: ; 0x1959fe
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $3, 2, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_GRANNY, 7, 6, $3, $0, 255, 255, $0, 0, GrannyScript_0x195949, $ffff
	person_event SPRITE_EKANS, 9, 9, $16, $0, 255, 255, $90, 0, EkansScript_0x19594c, $ffff
; 0x195a28

