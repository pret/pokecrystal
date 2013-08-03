VermilionPokeCenter1F_MapScriptHeader: ; 0x191601
	; trigger count
	db 0

	; callback count
	db 0
; 0x191603

NurseScript_0x191603: ; 0x191603
	jumpstd $0000
; 0x191606

FishingGuruScript_0x191606: ; 0x191606
	faceplayer
	loadfont
	checkbit1 $0750
	iftrue UnknownScript_0x191614
	2writetext UnknownText_0x191620
	closetext
	loadmovesprites
	end
; 0x191614

UnknownScript_0x191614: ; 0x191614
	2writetext UnknownText_0x191698
	closetext
	loadmovesprites
	end
; 0x19161a

SailorScript_0x19161a: ; 0x19161a
	jumptextfaceplayer UnknownText_0x1916fe
; 0x19161d

BugCatcherScript_0x19161d: ; 0x19161d
	jumptextfaceplayer UnknownText_0x19173b
; 0x191620

UnknownText_0x191620: ; 0x191620
	db $0, "A sleeping #MON", $4f
	db "is lying in front", $55
	db "of DIGLETT'S CAVE.", $51
	db "It's a fantastic", $4f
	db "opportunity to get", $51
	db "it, but how do you", $4f
	db "wake it up?", $57
; 0x191698

UnknownText_0x191698: ; 0x191698
	db $0, "There used to be a", $4f
	db "sleeping #MON", $51
	db "lying in front of", $4f
	db "DIGLETT'S CAVE.", $51
	db "But it seems to", $4f
	db "have disappeared.", $57
; 0x1916fe

UnknownText_0x1916fe: ; 0x1916fe
	db $0, "The FAST SHIP is a", $4f
	db "great place to", $51
	db "meet and battle", $4f
	db "trainers.", $57
; 0x19173b

UnknownText_0x19173b: ; 0x19173b
	db $0, "Oh? You have some", $4f
	db "BADGES I've never", $55
	db "seen before.", $51
	db "Oh, I get it. You", $4f
	db "got them in JOHTO.", $57
; 0x191791

VermilionPokeCenter1F_MapEventHeader: ; 0x191791
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 2, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $4, 2, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x191603, $ffff
	person_event SPRITE_FISHING_GURU, 6, 11, $6, $0, 255, 255, $80, 0, FishingGuruScript_0x191606, $ffff
	person_event SPRITE_SAILOR, 9, 10, $4, $10, 255, 255, $90, 0, SailorScript_0x19161a, $ffff
	person_event SPRITE_BUG_CATCHER, 9, 5, $3, $0, 255, 255, $a0, 0, BugCatcherScript_0x19161d, $ffff
; 0x1917da

