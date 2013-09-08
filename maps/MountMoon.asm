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
	special $006a
	pause 15
	applymovement $2, MovementData_0x740f9
	playmusic $001f
	loadfont
	2writetext UnknownText_0x74105
	closetext
	loadmovesprites
	checkbit1 EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x740c3
	checkbit1 EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x740d3
	winlosstext UnknownText_0x7419d, UnknownText_0x742e0
	setlasttalked $2
	loadtrainer RIVAL2, 3
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x740e3
; 0x740c3

UnknownScript_0x740c3: ; 0x740c3
	winlosstext UnknownText_0x7419d, UnknownText_0x742e0
	setlasttalked $2
	loadtrainer RIVAL2, 1
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x740e3
; 0x740d3

UnknownScript_0x740d3: ; 0x740d3
	winlosstext UnknownText_0x7419d, UnknownText_0x742e0
	setlasttalked $2
	loadtrainer RIVAL2, 2
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x740e3
; 0x740e3

UnknownScript_0x740e3: ; 0x740e3
	playmusic $0020
	loadfont
	2writetext UnknownText_0x741fa
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x740fd
	disappear $2
	dotrigger $1
	setbit1 EVENT_BEAT_RIVAL_IN_MT_MOON
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
	db $0, $56, " ", $56, " ", $56, $51
	db "It's been a while,", $4f
	db $52, ".", $51
	db "…Since I lost to", $4f
	db "you, I thought", $51
	db "about what I was", $4f
	db "lacking with my", $55
	db "#MON…", $51
	db "And we came up", $4f
	db "with an answer.", $51
	db $52, ", now we'll", $4f
	db "show you!", $57
; 0x7419d

UnknownText_0x7419d: ; 0x7419d
	db $0, $56, " ", $56, " ", $56, $51
	db "I thought I raised", $4f
	db "my #MON to be", $51
	db "the best they", $4f
	db "could be…", $51
	db "…But it still ", $4f
	db "wasn't enough…", $57
; 0x741fa

UnknownText_0x741fa: ; 0x741fa
	db $0, $56, " ", $56, " ", $56, $51
	db "…You won, fair", $4f
	db "and square.", $51
	db "I admit it. But", $4f
	db "this isn't the", $55
	db "end.", $51
	db "I'm going to be", $4f
	db "the greatest #-", $55
	db "MON trainer ever.", $51
	db "Because these guys", $4f
	db "are behind me.", $51
	db "…Listen, ", $52, ".", $51
	db "One of these days", $4f
	db "I'm going to prove", $51
	db "how good I am by", $4f
	db "beating you.", $57
; 0x742e0

UnknownText_0x742e0: ; 0x742e0
	db $0, $56, " ", $56, " ", $56, $51
	db "I've repaid my", $4f
	db "debt to you.", $51
	db "With my #MON,", $4f
	db "I'm going to beat", $51
	db "the CHAMPION and", $4f
	db "become the world's", $55
	db "greatest trainer.", $57
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

