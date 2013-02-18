CianwoodPokeCenter1F_MapScriptHeader: ; 0x9dbcd
	; trigger count
	db 0

	; callback count
	db 0
; 0x9dbcf

UnknownScript_0x9dbcf: ; 0x9dbcf
	jumpstd $0000
; 0x9dbd2

UnknownScript_0x9dbd2: ; 0x9dbd2
	jumptextfaceplayer UnknownText_0x9dbed
; 0x9dbd5

CianwoodGymGuyScript: ; 0x9dbd5
	faceplayer
	checkbit1 $04c2
	iftrue .CianwoodGymGuyWinScript
	loadfont
	2writetext CianwoodGymGuyText
	closetext
	loadmovesprites
	end

.CianwoodGymGuyWinScript
	loadfont
	2writetext CianwoodGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x9dbea

UnknownScript_0x9dbea: ; 0x9dbea
	jumptextfaceplayer UnknownText_0x9ded7
; 0x9dbed

UnknownText_0x9dbed: ; 0x9dbed
	db $0, "Did you meet the", $4f
	db "#MANIAC?", $51
	db "He's always brag-", $4f
	db "ging about his", $55
	db "rare #MON.", $57
; 0x9dc33

CianwoodGymGuyText: ; 0x9dc33
	db $0, "The #MON GYM", $4f
	db "trainers here are", $55
	db "macho bullies.", $51
	db "If I stick around,", $4f
	db "they might come", $55
	db "after me.", $51
	db "Here's some ad-", $4f
	db "vice: the GYM", $51
	db "LEADER uses the", $4f
	db "fighting-type.", $51
	db "So you should", $4f
	db "confound him with", $55
	db "psychic #MON.", $51
	db "Wipe out his #-", $4f
	db "MON before they", $51
	db "can use their", $4f
	db "physical strength.", $51
	db "And those boulders", $4f
	db "in the middle of", $55
	db "the GYM?", $51
	db "If you don't move", $4f
	db "them correctly,", $51
	db "you won't reach", $4f
	db "the GYM LEADER.", $51
	db "If you get stuck,", $4f
	db "go outside.", $57
; 0x9ddc5

CianwoodGymGuyWinText: ; 0x9ddc5
	db $0, $52, "! You won!", $4f
	db "I could tell by", $55
	db "looking at you!", $57
; 0x9ddf2

UnknownText_0x9ddf2: ; 0x9ddf2
	db $0, "Don't you get the", $4f
	db "urge to show off", $51
	db "your #MON to", $4f
	db "friends?", $51
	db "I wish I could", $4f
	db "show the #MON I", $51
	db "raised to my pal", $4f
	db "in VIOLET.", $57
; 0x9de66

UnknownText_0x9de66: ; 0x9de66
	db $0, "I've been battling", $4f
	db "my pal in VIOLET", $51
	db "using a MOBILE", $4f
	db "ADAPTER link.", $51
	db "I'm down 5-7", $4f
	db "against him. I've", $55
	db "gotta crank it up!", $57
; 0x9ded7

UnknownText_0x9ded7: ; 0x9ded7
	db $0, "I love showing off", $4f
	db "the #MON that", $51
	db "I've raised.", $4f
	db "Don't you?", $51
	db "I'm going to get", $4f
	db "into a bunch of", $51
	db "battles, and show", $4f
	db "off my #MON!", $57
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
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x9dbcf, $ffff
	person_event $28, 9, 5, $4, $10, 255, 255, $a0, 0, UnknownScript_0x9dbd2, $ffff
	person_event $48, 7, 9, $6, $0, 255, 255, $80, 0, CianwoodGymGuyScript, $ffff
	person_event $2b, 10, 12, $5, $1, 255, 255, $90, 0, UnknownScript_0x9dbea, $ffff
; 0x9df97

