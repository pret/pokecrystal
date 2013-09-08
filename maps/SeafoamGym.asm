SeafoamGym_MapScriptHeader: ; 0x1ab4f4
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x1ab4fa, $0000

	; callback count
	db 0
; 0x1ab4fa

UnknownScript_0x1ab4fa: ; 0x1ab4fa
	end
; 0x1ab4fb

BlaineScript_0x1ab4fb: ; 0x1ab4fb
	faceplayer
	loadfont
	checkbit2 $0029
	iftrue UnknownScript_0x1ab52b
	2writetext UnknownText_0x1ab548
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1ab646, $0000
	loadtrainer BLAINE, 1
	startbattle
	iftrue UnknownScript_0x1ab516
	appear $3
UnknownScript_0x1ab516: ; 0x1ab516
	returnafterbattle
	setbit1 $04cb
	loadfont
	2writetext UnknownText_0x1ab683
	playsound $009c
	waitbutton
	setbit2 $0029
	2writetext UnknownText_0x1ab69d
	closetext
	loadmovesprites
	end
; 0x1ab52b

UnknownScript_0x1ab52b: ; 0x1ab52b
	2writetext UnknownText_0x1ab71c
	closetext
	loadmovesprites
	end
; 0x1ab531

SeafoamGymGuyScript: ; 0x1ab531
	faceplayer
	loadfont
	checkbit1 EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue .TalkedToSeafoamGymGuyScript
	2writetext SeafoamGymGuyWinText
	closetext
	loadmovesprites
	setbit1 EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	end

.TalkedToSeafoamGymGuyScript
	2writetext SeafoamGymGuyWinText2
	closetext
	loadmovesprites
	end
; 0x1ab548

UnknownText_0x1ab548: ; 0x1ab548
	db $0, "BLAINE: Waaah!", $51
	db "My GYM in CINNABAR", $4f
	db "burned down.", $51
	db "My fire-breathing", $4f
	db "#MON and I are", $51
	db "homeless because", $4f
	db "of the volcano.", $51
	db "Waaah!", $51
	db "But I'm back in", $4f
	db "business as a GYM", $51
	db "LEADER here in", $4f
	db "this cave.", $51
	db "If you can beat", $4f
	db "me, I'll give you", $55
	db "a BADGE.", $51
	db "Ha! You'd better", $4f
	db "have BURN HEAL!", $57
; 0x1ab646

UnknownText_0x1ab646: ; 0x1ab646
	db $0, "BLAINE: Awesome.", $4f
	db "I've burned out…", $51
	db "You've earned", $4f
	db "VOLCANOBADGE!", $57
; 0x1ab683

UnknownText_0x1ab683: ; 0x1ab683
	db $0, $52, " received", $4f
	db "VOLCANOBADGE.", $57
; 0x1ab69d

UnknownText_0x1ab69d: ; 0x1ab69d
	db $0, "BLAINE: I did lose", $4f
	db "this time, but I'm", $51
	db "going to win the", $4f
	db "next time.", $51
	db "When I rebuild my", $4f
	db "CINNABAR GYM,", $51
	db "we'll have to have", $4f
	db "a rematch.", $57
; 0x1ab71c

UnknownText_0x1ab71c: ; 0x1ab71c
	db $0, "BLAINE: My fire", $4f
	db "#MON will be", $51
	db "even stronger.", $4f
	db "Just you watch!", $57
; 0x1ab759

SeafoamGymGuyWinText: ; 0x1ab759
	db $0, "Yo!", $51
	db "… Huh? It's over", $4f
	db "already?", $51
	db "Sorry, sorry!", $51
	db "CINNABAR GYM was", $4f
	db "gone, so I didn't", $51
	db "know where to find", $4f
	db "you.", $51
	db "But, hey, you're", $4f
	db "plenty strong even", $51
	db "without my advice.", $4f
	db "I knew you'd win!", $57
; 0x1ab806

SeafoamGymGuyWinText2: ; 0x1ab806
	db $0, "A #MON GYM can", $4f
	db "be anywhere as", $51
	db "long as the GYM", $4f
	db "LEADER is there.", $51
	db "There's no need", $4f
	db "for a building.", $57
; 0x1ab865

SeafoamGym_MapEventHeader: ; 0x1ab865
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $5, $5, 1, GROUP_ROUTE_20, MAP_ROUTE_20

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_BLAINE, 6, 9, $6, $0, 255, 255, $b0, 0, BlaineScript_0x1ab4fb, $ffff
	person_event SPRITE_GYM_GUY, 9, 10, $7, $0, 255, 255, $90, 0, SeafoamGymGuyScript, $0777
; 0x1ab88a



