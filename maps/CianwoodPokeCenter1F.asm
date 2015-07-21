CianwoodPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

NurseScript_0x9dbcf:
	jumpstd pokecenternurse

LassScript_0x9dbd2:
	jumptextfaceplayer UnknownText_0x9dbed

CianwoodGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuyWinScript
	loadfont
	writetext CianwoodGymGuyText
	closetext
	loadmovesprites
	end

.CianwoodGymGuyWinScript
	loadfont
	writetext CianwoodGymGuyWinText
	closetext
	loadmovesprites
	end

SuperNerdScript_0x9dbea:
	jumptextfaceplayer UnknownText_0x9ded7

UnknownText_0x9dbed:
	text "Did you meet the"
	line "#MANIAC?"

	para "He's always brag-"
	line "ging about his"
	cont "rare #MON."
	done

CianwoodGymGuyText:
	text "The #MON GYM"
	line "trainers here are"
	cont "macho bullies."

	para "If I stick around,"
	line "they might come"
	cont "after me."

	para "Here's some ad-"
	line "vice: the GYM"

	para "LEADER uses the"
	line "fighting-type."

	para "So you should"
	line "confound him with"
	cont "psychic #MON."

	para "Wipe out his #-"
	line "MON before they"

	para "can use their"
	line "physical strength."

	para "And those boulders"
	line "in the middle of"
	cont "the GYM?"

	para "If you don't move"
	line "them correctly,"

	para "you won't reach"
	line "the GYM LEADER."

	para "If you get stuck,"
	line "go outside."
	done

CianwoodGymGuyWinText:
	text "<PLAYER>! You won!"
	line "I could tell by"
	cont "looking at you!"
	done

UnknownText_0x9ddf2:
	text "Don't you get the"
	line "urge to show off"

	para "your #MON to"
	line "friends?"

	para "I wish I could"
	line "show the #MON I"

	para "raised to my pal"
	line "in VIOLET."
	done

UnknownText_0x9de66:
	text "I've been battling"
	line "my pal in VIOLET"

	para "using a MOBILE"
	line "ADAPTER link."

	para "I'm down 5-7"
	line "against him. I've"
	cont "gotta crank it up!"
	done

UnknownText_0x9ded7:
	text "I love showing off"
	line "the #MON that"

	para "I've raised."
	line "Don't you?"

	para "I'm going to get"
	line "into a bunch of"

	para "battles, and show"
	line "off my #MON!"
	done

CianwoodPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $3, 3, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $4, 3, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_NURSE, 5, 7, OW_UP | $2, $0, -1, -1, $0, 0, NurseScript_0x9dbcf, -1
	person_event SPRITE_LASS, 9, 5, OW_UP | $0, $10, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LassScript_0x9dbd2, -1
	person_event SPRITE_GYM_GUY, 7, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, CianwoodGymGuyScript, -1
	person_event SPRITE_SUPER_NERD, 10, 12, OW_UP | $1, $1, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SuperNerdScript_0x9dbea, -1
