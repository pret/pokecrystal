CeladonCity_MapScriptHeader: ; 0x1a9f3a
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a9f3f
; 0x1a9f3f

UnknownScript_0x1a9f3f: ; 0x1a9f3f
	setbit2 $003d
	return
; 0x1a9f43

UnknownScript_0x1a9f43: ; 0x1a9f43
	jumptextfaceplayer UnknownText_0x1a9f7d
; 0x1a9f46

UnknownScript_0x1a9f46: ; 0x1a9f46
	loadfont
	2writetext UnknownText_0x1a9fcb
	cry POLIWRATH
	closetext
	loadmovesprites
	end
; 0x1a9f50

UnknownScript_0x1a9f50: ; 0x1a9f50
	jumptextfaceplayer UnknownText_0x1a9fde
; 0x1a9f53

UnknownScript_0x1a9f53: ; 0x1a9f53
	jumptextfaceplayer UnknownText_0x1aa043
; 0x1a9f56

UnknownScript_0x1a9f56: ; 0x1a9f56
	jumptextfaceplayer UnknownText_0x1aa0dc
; 0x1a9f59

UnknownScript_0x1a9f59: ; 0x1a9f59
	jumptextfaceplayer UnknownText_0x1aa115
; 0x1a9f5c

UnknownScript_0x1a9f5c: ; 0x1a9f5c
	jumptextfaceplayer UnknownText_0x1aa155
; 0x1a9f5f

UnknownScript_0x1a9f5f: ; 0x1a9f5f
	jumptextfaceplayer UnknownText_0x1aa1bd
; 0x1a9f62

UnknownScript_0x1a9f62: ; 0x1a9f62
	jumptextfaceplayer UnknownText_0x1aa306
; 0x1a9f65

MapCeladonCitySignpost0Script: ; 0x1a9f65
	jumptext UnknownText_0x1aa340
; 0x1a9f68

MapCeladonCitySignpost1Script: ; 0x1a9f68
	jumptext UnknownText_0x1aa369
; 0x1a9f6b

MapCeladonCitySignpost2Script: ; 0x1a9f6b
	jumptext UnknownText_0x1aa3a9
; 0x1a9f6e

MapCeladonCitySignpost3Script: ; 0x1a9f6e
	jumptext UnknownText_0x1aa3d4
; 0x1a9f71

MapCeladonCitySignpost4Script: ; 0x1a9f71
	jumptext UnknownText_0x1aa3e5
; 0x1a9f74

MapCeladonCitySignpost5Script: ; 0x1a9f74
	jumptext UnknownText_0x1aa418
; 0x1a9f77

MapCeladonCitySignpost6Script: ; 0x1a9f77
	jumpstd $0010
; 0x1a9f7a

MapCeladonCitySignpostItem7: ; 0x1a9f7a
	dw $00fd
	db PP_UP
	
; 0x1a9f7d

UnknownText_0x1a9f7d: ; 0x1a9f7d
	db $0, "This POLIWRATH is", $4f
	db "my partner.", $51
	db "I wonder if it'll", $4f
	db "ever evolve into a", $55
	db "frog #MON.", $57
; 0x1a9fcb

UnknownText_0x1a9fcb: ; 0x1a9fcb
	db $0, "POLIWRATH: Croak!", $57
; 0x1a9fde

UnknownText_0x1a9fde: ; 0x1a9fde
	db $0, "I lost at the slot", $4f
	db "machines again…", $51
	db "We girls also play", $4f
	db "the slots now.", $51
	db "You should check", $4f
	db "them out too.", $57
; 0x1aa043

UnknownText_0x1aa043: ; 0x1aa043
	db $0, "GRIMER have been", $4f
	db "appearing lately.", $51
	db "See that pond out", $4f
	db "in front of the", $51
	db "house? GRIMER live", $4f
	db "there now.", $51
	db "Where did they", $4f
	db "come from? This is", $55
	db "a serious problem…", $57
; 0x1aa0dc

UnknownText_0x1aa0dc: ; 0x1aa0dc
	db $0, "Nihihi! This GYM", $4f
	db "is great! Only", $51
	db "girls are allowed", $4f
	db "here!", $57
; 0x1aa115

UnknownText_0x1aa115: ; 0x1aa115
	db $0, "Want to know a", $4f
	db "secret?", $51
	db "CELADON MANSION", $4f
	db "has a hidden back", $55
	db "door.", $57
; 0x1aa155

UnknownText_0x1aa155: ; 0x1aa155
	db $0, "They're holding an", $4f
	db "eating contest at", $55
	db "the restaurant.", $51
	db "Just watching them", $4f
	db "go at it makes me", $55
	db "feel bloated…", $57
; 0x1aa1bd

UnknownText_0x1aa1bd: ; 0x1aa1bd
	db $0, "CELADON DEPT.STORE", $4f
	db "has the biggest", $51
	db "and best selection", $4f
	db "of merchandise.", $51
	db "If you can't get", $4f
	db "it there, you", $51
	db "can't get it any-", $4f
	db "where.", $51
	db "Gee… I sound like", $4f
	db "a sales clerk.", $57
; 0x1aa25b

; possibly unused
UnknownText_0x1aa25b: ; 0x1aa25b
	db $0, "I love being", $4f
	db "surrounded by tall", $55
	db "buildings!", $51
	db "Isn't it true that", $4f
	db "GOLDENROD #MON", $51
	db "CENTER was made", $4f
	db "much, much bigger?", $51
	db "That is so neat!", $4f
	db "I wish we had a", $51
	db "place like that in", $4f
	db "KANTO…", $57
; 0x1aa306

UnknownText_0x1aa306: ; 0x1aa306
	db $0, "Looking at the", $4f
	db "ground while I was", $51
	db "walking made me", $4f
	db "dizzy.", $57
; 0x1aa340

UnknownText_0x1aa340: ; 0x1aa340
	db $0, "CELADON CITY", $51
	db "The City of", $4f
	db "Rainbow Dreams", $57
; 0x1aa369

UnknownText_0x1aa369: ; 0x1aa369
	db $0, "CELADON CITY", $4f
	db "#MON GYM", $55
	db "LEADER: ERIKA", $51
	db "The Nature-Loving", $4f
	db "Princess", $57
; 0x1aa3a9

UnknownText_0x1aa3a9: ; 0x1aa3a9
	db $0, "Find What You", $4f
	db "Need at CELADON", $55
	db "DEPT.STORE!", $57
; 0x1aa3d4

UnknownText_0x1aa3d4: ; 0x1aa3d4
	db $0, "CELADON MANSION", $57
; 0x1aa3e5

UnknownText_0x1aa3e5: ; 0x1aa3e5
	db $0, "The Playground for", $4f
	db "Everybody--CELADON", $55
	db "GAME CORNER", $57
; 0x1aa418

UnknownText_0x1aa418: ; 0x1aa418
	db $0, "TRAINER TIPS", $51
	db "GUARD SPEC.", $4f
	db "protects #MON", $51
	db "against SPECIAL", $4f
	db "attacks such as", $55
	db "fire and water.", $51
	db "Get your items at", $4f
	db "CELADON DEPT.", $55
	db "STORE!", $57
; 0x1aa497

CeladonCity_MapEventHeader: ; 0x1aa497
	; filler
	db 0, 0

	; warps
	db 9
	warp_def $9, $4, 1, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F
	warp_def $9, $10, 1, GROUP_CELADON_MANSION_1F, MAP_CELADON_MANSION_1F
	warp_def $3, $10, 3, GROUP_CELADON_MANSION_1F, MAP_CELADON_MANSION_1F
	warp_def $3, $11, 3, GROUP_CELADON_MANSION_1F, MAP_CELADON_MANSION_1F
	warp_def $9, $1d, 1, GROUP_CELADON_POKECENTER_1F, MAP_CELADON_POKECENTER_1F
	warp_def $13, $12, 1, GROUP_CELADON_GAME_CORNER, MAP_CELADON_GAME_CORNER
	warp_def $13, $17, 1, GROUP_CELADON_GAME_CORNER_PRIZE_ROOM, MAP_CELADON_GAME_CORNER_PRIZE_ROOM
	warp_def $1d, $a, 1, GROUP_CELADON_GYM, MAP_CELADON_GYM
	warp_def $1d, $19, 1, GROUP_CELADON_CAFE, MAP_CELADON_CAFE

	; xy triggers
	db 0

	; signposts
	db 8
	signpost 21, 23, $0, MapCeladonCitySignpost0Script
	signpost 31, 11, $0, MapCeladonCitySignpost1Script
	signpost 9, 6, $0, MapCeladonCitySignpost2Script
	signpost 9, 13, $0, MapCeladonCitySignpost3Script
	signpost 21, 19, $0, MapCeladonCitySignpost4Script
	signpost 21, 29, $0, MapCeladonCitySignpost5Script
	signpost 9, 30, $0, MapCeladonCitySignpost6Script
	signpost 21, 37, $7, MapCeladonCitySignpostItem7

	; people-events
	db 9
	person_event $3a, 15, 30, $9, $0, 255, 255, $a0, 0, UnknownScript_0x1a9f43, $ffff
	person_event $8d, 15, 31, $16, $0, 255, 255, $90, 0, UnknownScript_0x1a9f46, $ffff
	person_event $29, 28, 24, $5, $2, 255, 255, $80, 0, UnknownScript_0x1a9f50, $ffff
	person_event $2f, 20, 18, $6, $0, 255, 255, $b0, 0, UnknownScript_0x1a9f53, $ffff
	person_event $2f, 35, 12, $7, $0, 255, 255, $80, 0, UnknownScript_0x1a9f56, $ffff
	person_event $27, 17, 22, $5, $2, 255, 255, $90, 0, UnknownScript_0x1a9f59, $ffff
	person_event $27, 37, 28, $7, $0, 255, 255, $a0, 0, UnknownScript_0x1a9f5c, $ffff
	person_event $29, 18, 10, $2, $22, 255, 255, $a0, 0, UnknownScript_0x1a9f5f, $ffff
	person_event $28, 26, 11, $4, $20, 255, 255, $80, 0, UnknownScript_0x1a9f62, $ffff
; 0x1aa567

