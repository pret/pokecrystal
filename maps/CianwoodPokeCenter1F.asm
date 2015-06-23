CianwoodPokeCenter1F_MapScriptHeader: ; 0x9dbcd
	; trigger count
	db 0

	; callback count
	db 0
; 0x9dbcf

NurseScript_0x9dbcf: ; 0x9dbcf
	jumpstd pokecenternurse
; 0x9dbd2

LassScript_0x9dbd2: ; 0x9dbd2
	jumptextfaceplayer UnknownText_0x9dbed
; 0x9dbd5

CianwoodGymGuyScript: ; 0x9dbd5
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
; 0x9dbea

SuperNerdScript_0x9dbea: ; 0x9dbea
	jumptextfaceplayer UnknownText_0x9ded7
; 0x9dbed

UnknownText_0x9dbed: ; 0x9dbed
	text "Did you meet the"
	line "#MANIAC?"

	para "He's always brag-"
	line "ging about his"
	cont "rare #MON."
	done
; 0x9dc33

CianwoodGymGuyText: ; 0x9dc33
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
; 0x9ddc5

CianwoodGymGuyWinText: ; 0x9ddc5
	text $52, "! You won!"
	line "I could tell by"
	cont "looking at you!"
	done
; 0x9ddf2

UnknownText_0x9ddf2: ; 0x9ddf2
	text "Don't you get the"
	line "urge to show off"

	para "your #MON to"
	line "friends?"

	para "I wish I could"
	line "show the #MON I"

	para "raised to my pal"
	line "in VIOLET."
	done
; 0x9de66

UnknownText_0x9de66: ; 0x9de66
	text "I've been battling"
	line "my pal in VIOLET"

	para "using a MOBILE"
	line "ADAPTER link."

	para "I'm down 5-7"
	line "against him. I've"
	cont "gotta crank it up!"
	done
; 0x9ded7

UnknownText_0x9ded7: ; 0x9ded7
	text "I love showing off"
	line "the #MON that"

	para "I've raised."
	line "Don't you?"

	para "I'm going to get"
	line "into a bunch of"

	para "battles, and show"
	line "off my #MON!"
	done
; 0x9df4e

CianwoodPokeCenter1F_MapEventHeader: ; 0x9df4e
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 3, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $4, 3, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x9dbcf, $ffff
	person_event SPRITE_LASS, 9, 5, $4, $10, 255, 255, $a0, 0, LassScript_0x9dbd2, $ffff
	person_event SPRITE_GYM_GUY, 7, 9, $6, $0, 255, 255, $80, 0, CianwoodGymGuyScript, $ffff
	person_event SPRITE_SUPER_NERD, 10, 12, $5, $1, 255, 255, $90, 0, SuperNerdScript_0x9dbea, $ffff
; 0x9df97
