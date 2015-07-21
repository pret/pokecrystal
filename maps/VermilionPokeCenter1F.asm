VermilionPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x191603:
	jumpstd pokecenternurse

FishingGuruScript_0x191606:
	faceplayer
	loadfont
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue UnknownScript_0x191614
	writetext UnknownText_0x191620
	closetext
	loadmovesprites
	end

UnknownScript_0x191614:
	writetext UnknownText_0x191698
	closetext
	loadmovesprites
	end

SailorScript_0x19161a:
	jumptextfaceplayer UnknownText_0x1916fe

BugCatcherScript_0x19161d:
	jumptextfaceplayer UnknownText_0x19173b

UnknownText_0x191620:
	text "A sleeping #MON"
	line "is lying in front"
	cont "of DIGLETT'S CAVE."

	para "It's a fantastic"
	line "opportunity to get"

	para "it, but how do you"
	line "wake it up?"
	done

UnknownText_0x191698:
	text "There used to be a"
	line "sleeping #MON"

	para "lying in front of"
	line "DIGLETT'S CAVE."

	para "But it seems to"
	line "have disappeared."
	done

UnknownText_0x1916fe:
	text "The FAST SHIP is a"
	line "great place to"

	para "meet and battle"
	line "trainers."
	done

UnknownText_0x19173b:
	text "Oh? You have some"
	line "BADGES I've never"
	cont "seen before."

	para "Oh, I get it. You"
	line "got them in JOHTO."
	done

VermilionPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 2, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $4, 2, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 5, 7, OW_UP | $2, $0, -1, -1, $0, 0, NurseScript_0x191603, -1
	person_event SPRITE_FISHING_GURU, 6, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, FishingGuruScript_0x191606, -1
	person_event SPRITE_SAILOR, 9, 10, OW_UP | $0, $10, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SailorScript_0x19161a, -1
	person_event SPRITE_BUG_CATCHER, 9, 5, OW_DOWN | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, BugCatcherScript_0x19161d, -1
