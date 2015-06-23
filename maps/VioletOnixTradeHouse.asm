VioletOnixTradeHouse_MapScriptHeader: ; 0x6998b
	; trigger count
	db 0

	; callback count
	db 0
; 0x6998d

PokefanMScript_0x6998d: ; 0x6998d
	jumptextfaceplayer UnknownText_0x69997
; 0x69990

YoungsterScript_0x69990: ; 0x69990
	faceplayer
	loadfont
	trade $1
	closetext
	loadmovesprites
	end
; 0x69997

UnknownText_0x69997: ; 0x69997
	text "A #MON you get"
	line "in a trade grows"
	cont "quickly."

	para "But if you don't"
	line "have the right GYM"

	para "BADGE, they may"
	line "disobey you."
	done
; 0x69a01

VioletOnixTradeHouse_MapEventHeader: ; 0x69a01
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 6, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $7, $4, 6, GROUP_VIOLET_CITY, MAP_VIOLET_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_POKEFAN_M, 7, 6, $3, $0, 255, 255, $0, 0, PokefanMScript_0x6998d, $ffff
	person_event SPRITE_YOUNGSTER, 9, 10, $4, $20, 255, 255, $80, 0, YoungsterScript_0x69990, $ffff
; 0x69a2b
