AzaleaMart_MapScriptHeader: ; 0x18e03e
	; trigger count
	db 0

	; callback count
	db 0
; 0x18e040

ClerkScript_0x18e040: ; 0x18e040
	loadfont
	pokemart $0, $0003
	loadmovesprites
	end
; 0x18e047

CooltrainerMScript_0x18e047: ; 0x18e047
	jumptextfaceplayer UnknownText_0x18e04d
; 0x18e04a

BugCatcherScript_0x18e04a: ; 0x18e04a
	jumptextfaceplayer UnknownText_0x18e0b6
; 0x18e04d

UnknownText_0x18e04d: ; 0x18e04d
	db $0, "There's no GREAT", $4f
	db "BALL here. #", $51
	db "BALLS will have", $4f
	db "to do.", $51
	db "I wish KURT would", $4f
	db "make me some of", $55
	db "his custom BALLS.", $57
; 0x18e0b6

UnknownText_0x18e0b6: ; 0x18e0b6
	db $0, "A GREAT BALL is", $4f
	db "better for catch-", $55
	db "ing #MON than a", $55
	db "# BALL.", $51
	db "But KURT's might", $4f
	db "be better some-", $55
	db "times.", $57
; 0x18e118

AzaleaMart_MapEventHeader: ; 0x18e118
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $3, 3, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x18e040, $ffff
	person_event SPRITE_COOLTRAINER_M, 9, 6, $7, $0, 255, 255, $0, 0, CooltrainerMScript_0x18e047, $ffff
	person_event SPRITE_BUG_CATCHER, 6, 11, $5, $2, 255, 255, $80, 0, BugCatcherScript_0x18e04a, $ffff
; 0x18e14f

