const_value set 2
	const BLACKTHORNPOKECENTER1F_NURSE
	const BLACKTHORNPOKECENTER1F_GENTLEMAN
	const BLACKTHORNPOKECENTER1F_TWIN
	const BLACKTHORNPOKECENTER1F_COOLTRAINER_M

BlackthornPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x195b79:
	jumpstd pokecenternurse

GentlemanScript_0x195b7c:
	jumptextfaceplayer UnknownText_0x195b85

TwinScript_0x195b7f:
	jumptextfaceplayer UnknownText_0x195bfd

CooltrainerMScript_0x195b82:
	jumpstd happinesschecknpc

UnknownText_0x195b85:
	text "Deep inside far-"
	line "off INDIGO PLATEAU"

	para "is the #MON"
	line "LEAGUE."

	para "I hear the best"
	line "trainers gather"

	para "there from around"
	line "the country."
	done

UnknownText_0x195bfd:
	text "There was this"
	line "move I just had"

	para "to teach my #-"
	line "MON."

	para "So I got the MOVE"
	line "DELETER to make it"
	cont "forget an HM move."
	done

BlackthornPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 5, BLACKTHORN_CITY
	warp_def $7, $4, 5, BLACKTHORN_CITY
	warp_def $7, $0, 1, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x195b79, -1
	person_event SPRITE_GENTLEMAN, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x195b7c, -1
	person_event SPRITE_TWIN, 4, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TwinScript_0x195b7f, -1
	person_event SPRITE_COOLTRAINER_M, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x195b82, -1
