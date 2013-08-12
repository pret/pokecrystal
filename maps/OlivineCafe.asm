OlivineCafe_MapScriptHeader: ; 0x9c8bf
	; trigger count
	db 0

	; callback count
	db 0
; 0x9c8c1

SailorScript_0x9c8c1: ; 0x9c8c1
	faceplayer
	loadfont
	checkbit1 $0013
	iftrue UnknownScript_0x9c8d3
	2writetext UnknownText_0x9c8df
	keeptextopen
	verbosegiveitem HM_04, 1
	setbit1 $0013
UnknownScript_0x9c8d3: ; 0x9c8d3
	2writetext UnknownText_0x9c965
	closetext
	loadmovesprites
	end
; 0x9c8d9

FishingGuruScript_0x9c8d9: ; 0x9c8d9
	jumptextfaceplayer UnknownText_0x9c9c5
; 0x9c8dc

SailorScript_0x9c8dc: ; 0x9c8dc
	jumptextfaceplayer UnknownText_0x9ca09
; 0x9c8df

UnknownText_0x9c8df: ; 0x9c8df
	db $0, "Hah! Your #MON", $4f
	db "sure look like", $55
	db "lightweights!", $51
	db "They don't have", $4f
	db "the power to move", $55
	db "boulders aside.", $51
	db "Here, use this", $4f
	db "and teach them", $55
	db "STRENGTH!", $57
; 0x9c965

UnknownText_0x9c965: ; 0x9c965
	db $0, "On the sea, the", $4f
	db "only thing you can", $51
	db "count on is your", $4f
	db "own good self!", $51
	db "I'm so proud of my", $4f
	db "buff bod!", $57
; 0x9c9c5

UnknownText_0x9c9c5: ; 0x9c9c5
	db $0, "OLIVINE CAFE's", $4f
	db "menu is chock full", $51
	db "of hearty fare for", $4f
	db "beefy SAILORS!", $57
; 0x9ca09

UnknownText_0x9ca09: ; 0x9ca09
	db $0, "Whenever I roll", $4f
	db "into this town, I", $51
	db "always visit the", $4f
	db "OLIVINE CAFE.", $51
	db "Everything on the", $4f
	db "menu makes me feel", $51
	db "stronger. I can't", $4f
	db "stop eating!", $57
; 0x9ca8e

OlivineCafe_MapEventHeader: ; 0x9ca8e
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 7, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 7, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_SAILOR, 7, 8, $8, $0, 255, 255, $0, 0, SailorScript_0x9c8c1, $ffff
	person_event SPRITE_FISHING_GURU, 7, 11, $4, $10, 255, 255, $0, 0, FishingGuruScript_0x9c8d9, $ffff
	person_event SPRITE_SAILOR, 10, 10, $7, $0, 255, 255, $0, 0, SailorScript_0x9c8dc, $ffff
; 0x9cac5

