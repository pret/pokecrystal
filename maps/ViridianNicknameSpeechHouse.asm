ViridianNicknameSpeechHouse_MapScriptHeader: ; 0x9ae38
	; trigger count
	db 0

	; callback count
	db 0
; 0x9ae3a

PokefanMScript_0x9ae3a: ; 0x9ae3a
	jumptextfaceplayer UnknownText_0x9ae54
; 0x9ae3d

LassScript_0x9ae3d: ; 0x9ae3d
	jumptextfaceplayer UnknownText_0x9aecb
; 0x9ae40

MoltresScript_0x9ae40: ; 0x9ae40
	loadfont
	writetext UnknownText_0x9aefe
	cry SPEAROW
	closetext
	loadmovesprites
	end
; 0x9ae4a

GrowlitheScript_0x9ae4a: ; 0x9ae4a
	loadfont
	writetext UnknownText_0x9af10
	cry RATTATA
	closetext
	loadmovesprites
	end
; 0x9ae54

UnknownText_0x9ae54: ; 0x9ae54
	text "Do you put a lot"
	line "of thought into"

	para "naming your"
	line "#MON?"

	para "Giving them good"
	line "nicknames adds to"

	para "the fun of trading"
	line "with others."
	done
; 0x9aecb

UnknownText_0x9aecb: ; 0x9aecb
	text "They're SPEARY--"
	line "a SPEAROW--and"
	cont "RATTEY--a RATTATA."
	done
; 0x9aefe

UnknownText_0x9aefe: ; 0x9aefe
	text "SPEARY: Ch-chun!"
	done
; 0x9af10

UnknownText_0x9af10: ; 0x9af10
	text "RATTEY: Kikiii!"
	done
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
	person_event SPRITE_POKEFAN_M, 8, 6, $9, $0, 255, 255, $80, 0, PokefanMScript_0x9ae3a, $ffff
	person_event SPRITE_LASS, 8, 9, $7, $0, 255, 255, $a0, 0, LassScript_0x9ae3d, $ffff
	person_event SPRITE_MOLTRES, 6, 9, $16, $2, 255, 255, $b0, 0, MoltresScript_0x9ae40, $ffff
	person_event SPRITE_GROWLITHE, 7, 10, $16, $2, 255, 255, $90, 0, GrowlitheScript_0x9ae4a, $ffff
; 0x9af65

