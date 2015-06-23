VermilionPokeCenter1F_MapScriptHeader: ; 0x191601
	; trigger count
	db 0

	; callback count
	db 0
; 0x191603

NurseScript_0x191603: ; 0x191603
	jumpstd pokecenternurse
; 0x191606

FishingGuruScript_0x191606: ; 0x191606
	faceplayer
	loadfont
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue UnknownScript_0x191614
	writetext UnknownText_0x191620
	closetext
	loadmovesprites
	end
; 0x191614

UnknownScript_0x191614: ; 0x191614
	writetext UnknownText_0x191698
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
	text "A sleeping #MON"
	line "is lying in front"
	cont "of DIGLETT'S CAVE."

	para "It's a fantastic"
	line "opportunity to get"

	para "it, but how do you"
	line "wake it up?"
	done
; 0x191698

UnknownText_0x191698: ; 0x191698
	text "There used to be a"
	line "sleeping #MON"

	para "lying in front of"
	line "DIGLETT'S CAVE."

	para "But it seems to"
	line "have disappeared."
	done
; 0x1916fe

UnknownText_0x1916fe: ; 0x1916fe
	text "The FAST SHIP is a"
	line "great place to"

	para "meet and battle"
	line "trainers."
	done
; 0x19173b

UnknownText_0x19173b: ; 0x19173b
	text "Oh? You have some"
	line "BADGES I've never"
	cont "seen before."

	para "Oh, I get it. You"
	line "got them in JOHTO."
	done
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
