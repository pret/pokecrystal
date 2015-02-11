MountMoon_MapScriptHeader: ; 0x7407f
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x74089, $0000
	dw UnknownScript_0x7408d, $0000

	; callback count
	db 0
; 0x74089

UnknownScript_0x74089: ; 0x74089
	priorityjump UnknownScript_0x7408e
	end
; 0x7408d

UnknownScript_0x7408d: ; 0x7408d
	end
; 0x7408e

UnknownScript_0x7408e: ; 0x7408e
	spriteface $0, $3
	showemote $0, $0, 15
	special Functionc48f
	pause 15
	applymovement $2, MovementData_0x740f9
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x74105
	closetext
	loadmovesprites
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x740c3
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x740d3
	winlosstext UnknownText_0x7419d, UnknownText_0x742e0
	setlasttalked $2
	loadtrainer RIVAL2, 3
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x740e3
; 0x740c3

UnknownScript_0x740c3: ; 0x740c3
	winlosstext UnknownText_0x7419d, UnknownText_0x742e0
	setlasttalked $2
	loadtrainer RIVAL2, 1
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x740e3
; 0x740d3

UnknownScript_0x740d3: ; 0x740d3
	winlosstext UnknownText_0x7419d, UnknownText_0x742e0
	setlasttalked $2
	loadtrainer RIVAL2, 2
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x740e3
; 0x740e3

UnknownScript_0x740e3: ; 0x740e3
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x741fa
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x740fd
	disappear $2
	dotrigger $1
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end
; 0x740f9

MovementData_0x740f9: ; 0x740f9
	step_left
	step_left
	step_left
	step_end
; 0x740fd

MovementData_0x740fd: ; 0x740fd
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x74105

UnknownText_0x74105: ; 0x74105
	text $56, " ", $56, " ", $56

	para "It's been a while,"
	line $52, "."

	para "…Since I lost to"
	line "you, I thought"

	para "about what I was"
	line "lacking with my"
	cont "#MON…"

	para "And we came up"
	line "with an answer."

	para $52, ", now we'll"
	line "show you!"
	done
; 0x7419d

UnknownText_0x7419d: ; 0x7419d
	text $56, " ", $56, " ", $56

	para "I thought I raised"
	line "my #MON to be"

	para "the best they"
	line "could be…"

	para "…But it still "
	line "wasn't enough…"
	done
; 0x741fa

UnknownText_0x741fa: ; 0x741fa
	text $56, " ", $56, " ", $56

	para "…You won, fair"
	line "and square."

	para "I admit it. But"
	line "this isn't the"
	cont "end."

	para "I'm going to be"
	line "the greatest #-"
	cont "MON trainer ever."

	para "Because these guys"
	line "are behind me."

	para "…Listen, ", $52, "."

	para "One of these days"
	line "I'm going to prove"

	para "how good I am by"
	line "beating you."
	done
; 0x742e0

UnknownText_0x742e0: ; 0x742e0
	text $56, " ", $56, " ", $56

	para "I've repaid my"
	line "debt to you."

	para "With my #MON,"
	line "I'm going to beat"

	para "the CHAMPION and"
	line "become the world's"
	cont "greatest trainer."
	done
; 0x74356

MountMoon_MapEventHeader: ; 0x74356
	; filler
	db 0, 0

	; warps
	db 8
	warp_def $3, $3, 1, GROUP_ROUTE_3, MAP_ROUTE_3
	warp_def $f, $f, 1, GROUP_ROUTE_4, MAP_ROUTE_4
	warp_def $3, $d, 7, GROUP_MOUNT_MOON, MAP_MOUNT_MOON
	warp_def $b, $f, 8, GROUP_MOUNT_MOON, MAP_MOUNT_MOON
	warp_def $5, $19, 1, GROUP_MOUNT_MOON_SQUARE, MAP_MOUNT_MOON_SQUARE
	warp_def $f, $19, 2, GROUP_MOUNT_MOON_SQUARE, MAP_MOUNT_MOON_SQUARE
	warp_def $3, $19, 3, GROUP_MOUNT_MOON, MAP_MOUNT_MOON
	warp_def $d, $19, 4, GROUP_MOUNT_MOON, MAP_MOUNT_MOON

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_SILVER, 7, 11, $8, $0, 255, 255, $0, 0, ObjectEvent, $077a
; 0x74391

