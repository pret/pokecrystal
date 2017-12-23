const_value set 2
	const CINNABARPOKECENTER1F_NURSE
	const CINNABARPOKECENTER1F_COOLTRAINER_F
	const CINNABARPOKECENTER1F_FISHER

CinnabarPokecenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x1ab32c:
	jumpstd pokecenternurse

CinnabarPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CinnabarPokecenter1FCooltrainerFText

CinnabarPokecenter1FFisherScript:
	jumptextfaceplayer CinnabarPokecenter1FFisherText

CinnabarPokecenter1FCooltrainerFText:
	text "CINNABAR GYM's"
	line "BLAINE apparently"

	para "lives alone in the"
	line "SEAFOAM ISLANDS"
	cont "cave…"
	done

CinnabarPokecenter1FFisherText:
	text "It's been a year"
	line "since the volcano"
	cont "erupted."
	done

CinnabarPokecenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 1, CINNABAR_ISLAND
	warp_def $7, $4, 1, CINNABAR_ISLAND
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x1ab32c, -1
	person_event SPRITE_COOLTRAINER_F, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, CinnabarPokecenter1FCooltrainerFScript, -1
	person_event SPRITE_FISHER, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, CinnabarPokecenter1FFisherScript, -1
