CeruleanTradeSpeechHouse_MapScriptHeader: ; 0x188131
	; trigger count
	db 0

	; callback count
	db 0
; 0x188133

GrannyScript_0x188133: ; 0x188133
	jumptextfaceplayer UnknownText_0x18814d
; 0x188136

GrampsScript_0x188136: ; 0x188136
	jumptextfaceplayer UnknownText_0x18818a
; 0x188139

RhydonScript_0x188139: ; 0x188139
	loadfont
	2writetext UnknownText_0x18819c
	cry KANGASKHAN
	closetext
	loadmovesprites
	end
; 0x188143

ZubatScript_0x188143: ; 0x188143
	loadfont
	2writetext UnknownText_0x1881b5
	cry ZUBAT
	closetext
	loadmovesprites
	end
; 0x18814d

UnknownText_0x18814d: ; 0x18814d
	db $0, "My husband lives", $4f
	db "happily with #-", $55
	db "MON he got through", $55
	db "trades.", $57
; 0x18818a

UnknownText_0x18818a: ; 0x18818a
	db $0, "Ah… I'm so happy…", $57
; 0x18819c

UnknownText_0x18819c: ; 0x18819c
	db $0, "KANGASKHAN: Garu", $4f
	db "garuu.", $57
; 0x1881b5

UnknownText_0x1881b5: ; 0x1881b5
	db $0, "ZUBAT: Zuba zubaa.", $57
; 0x1881c9

CeruleanTradeSpeechHouse_MapEventHeader: ; 0x1881c9
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $3, 3, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_GRANNY, 8, 6, $9, $0, 255, 255, $90, 0, GrannyScript_0x188133, $ffff
	person_event SPRITE_GRAMPS, 6, 5, $2, $0, 255, 255, $a0, 0, GrampsScript_0x188136, $ffff
	person_event SPRITE_RHYDON, 6, 9, $16, $0, 255, 255, $b0, 0, RhydonScript_0x188139, $ffff
	person_event SPRITE_ZUBAT, 10, 9, $16, $0, 255, 255, $0, 0, ZubatScript_0x188143, $ffff
; 0x18820d

