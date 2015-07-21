BlackthornMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x195a5d:
	loadfont
	pokemart $0, $0011
	loadmovesprites
	end

CooltrainerMScript_0x195a64:
	jumptextfaceplayer UnknownText_0x195a6a

BlackBeltScript_0x195a67:
	jumptextfaceplayer UnknownText_0x195ae9

UnknownText_0x195a6a:
	text "You can't buy MAX"
	line "REVIVE, but it"

	para "fully restores a"
	line "fainted #MON."

	para "Beware--it won't"
	line "restore PP, the"

	para "POWER POINTS"
	line "needed for moves."
	done

UnknownText_0x195ae9:
	text "MAX REPEL keeps"
	line "weak #MON away"
	cont "from you."

	para "It's the longest"
	line "lasting of the"
	cont "REPEL sprays."
	done

BlackthornMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 4, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $3, 4, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 7, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, ClerkScript_0x195a5d, -1
	person_event SPRITE_COOLTRAINER_M, 10, 11, OW_UP | $1, $2, -1, -1, $0, 0, CooltrainerMScript_0x195a64, -1
	person_event SPRITE_BLACK_BELT, 6, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, BlackBeltScript_0x195a67, -1
