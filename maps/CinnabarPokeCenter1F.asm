CinnabarPokeCenter1F_MapScriptHeader: ; 0x1ab32a
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ab32c

NurseScript_0x1ab32c: ; 0x1ab32c
	jumpstd $0000
; 0x1ab32f

CooltrainerFScript_0x1ab32f: ; 0x1ab32f
	jumptextfaceplayer UnknownText_0x1ab335
; 0x1ab332

FisherScript_0x1ab332: ; 0x1ab332
	jumptextfaceplayer UnknownText_0x1ab37f
; 0x1ab335

UnknownText_0x1ab335: ; 0x1ab335
	text "CINNABAR GYM's"
	line "BLAINE apparently"

	para "lives alone in the"
	line "SEAFOAM ISLANDS"
	cont "cave…"
	done
; 0x1ab37f

UnknownText_0x1ab37f: ; 0x1ab37f
	text "It's been a year"
	line "since the volcano"
	cont "erupted."
	done
; 0x1ab3ab

CinnabarPokeCenter1F_MapEventHeader: ; 0x1ab3ab
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND
	warp_def $7, $4, 1, GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x1ab32c, $ffff
	person_event SPRITE_COOLTRAINER_F, 10, 11, $5, $2, 255, 255, $80, 0, CooltrainerFScript_0x1ab32f, $ffff
	person_event SPRITE_FISHER, 8, 6, $6, $0, 255, 255, $a0, 0, FisherScript_0x1ab332, $ffff
; 0x1ab3e7

