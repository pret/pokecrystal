const_value set 2
	const VERMILIONPOKECENTER1F_NURSE
	const VERMILIONPOKECENTER1F_FISHING_GURU
	const VERMILIONPOKECENTER1F_SAILOR
	const VERMILIONPOKECENTER1F_BUG_CATCHER

VermilionPokecenter1F_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x191603:
	jumpstd pokecenternurse

FishingGuruScript_0x191606:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SNORLAX
	iftrue UnknownScript_0x191614
	writetext UnknownText_0x191620
	waitbutton
	closetext
	end

UnknownScript_0x191614:
	writetext UnknownText_0x191698
	waitbutton
	closetext
	end

VermilionPokecenter1FSailorScript:
	jumptextfaceplayer VermilionPokecenter1FSailorText

VermilionPokecenter1FBugCatcherScript:
	jumptextfaceplayer VermilionPokecenter1FBugCatcherText

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

VermilionPokecenter1FSailorText:
	text "The FAST SHIP is a"
	line "great place to"

	para "meet and battle"
	line "trainers."
	done

VermilionPokecenter1FBugCatcherText:
	text "Oh? You have some"
	line "BADGES I've never"
	cont "seen before."

	para "Oh, I get it. You"
	line "got them in JOHTO."
	done

VermilionPokecenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 2, VERMILION_CITY
	warp_def $7, $4, 2, VERMILION_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 4
	object_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NurseScript_0x191603, -1
	object_event SPRITE_FISHING_GURU, 2, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FishingGuruScript_0x191606, -1
	object_event SPRITE_SAILOR, 5, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FSailorScript, -1
	object_event SPRITE_BUG_CATCHER, 5, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FBugCatcherScript, -1
