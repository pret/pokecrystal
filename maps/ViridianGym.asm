ViridianGym_MapScriptHeader: ; 0x9aa24
	; trigger count
	db 0

	; callback count
	db 0
; 0x9aa26

BlueScript_0x9aa26: ; 0x9aa26
	faceplayer
	loadfont
	checkbit2 $002a
	iftrue UnknownScript_0x9aa51
	2writetext UnknownText_0x9aa7b
	closetext
	loadmovesprites
	winlosstext UnknownText_0x9abae, $0000
	loadtrainer BLUE, 1
	startbattle
	returnafterbattle
	setbit1 $04cc
	loadfont
	2writetext UnknownText_0x9ac0f
	playsound $009c
	waitbutton
	setbit2 $002a
	2writetext UnknownText_0x9ac27
	closetext
	loadmovesprites
	end
; 0x9aa51

UnknownScript_0x9aa51: ; 0x9aa51
	2writetext UnknownText_0x9acab
	closetext
	loadmovesprites
	end
; 0x9aa57

ViridianGymGuyScript: ; 0x9aa57
	faceplayer
	loadfont
	checkbit1 $04cc
	iftrue .ViridianGymGuyWinScript
	2writetext ViridianGymGuyText
	closetext
	loadmovesprites
	end

.ViridianGymGuyWinScript
	2writetext ViridianGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x9aa6b

MapViridianGymSignpost1Script: ; 0x9aa6b
	checkbit2 $002a
	iftrue UnknownScript_0x9aa74
	jumpstd $002d
; 0x9aa74

UnknownScript_0x9aa74: ; 0x9aa74
	trainertotext BLUE, 1, $1
	jumpstd $002e
; 0x9aa7b

UnknownText_0x9aa7b: ; 0x9aa7b
	db $0, "BLUE: Yo! Finally", $4f
	db "got here, huh?", $51
	db "I wasn't in the", $4f
	db "mood at CINNABAR,", $51
	db "but now I'm ready", $4f
	db "to battle you.", $51
	db "…", $51
	db "You're telling me", $4f
	db "you conquered all", $55
	db "the GYMS in JOHTO?", $51
	db "Heh! JOHTO's GYMS", $4f
	db "must be pretty", $55
	db "pathetic then.", $51
	db "Hey, don't worry", $4f
	db "about it.", $51
	db "I'll know if you", $4f
	db "are good or not by", $51
	db "battling you right", $4f
	db "now.", $51
	db "Ready, JOHTO", $4f
	db "CHAMP?", $57
; 0x9abae

UnknownText_0x9abae: ; 0x9abae
	db $0, "BLUE: What?", $51
	db "How the heck did I", $4f
	db "lose to you?", $51
	db "…", $51
	db "Tch, all right…", $4f
	db "Here, take this--", $55
	db "it's EARTHBADGE.", $57
; 0x9ac0f

UnknownText_0x9ac0f: ; 0x9ac0f
	db $0, $52, " received", $4f
	db "EARTHBADGE.", $57
; 0x9ac27

UnknownText_0x9ac27: ; 0x9ac27
	db $0, "BLUE: …", $51
	db "All right, I was", $4f
	db "wrong. You're the", $51
	db "real deal. You are", $4f
	db "a good trainer.", $51
	db "But I'm going to", $4f
	db "beat you someday.", $51
	db "Don't you forget", $4f
	db "it!", $57
; 0x9acab

UnknownText_0x9acab: ; 0x9acab
	db $0, "BLUE: Listen, you.", $51
	db "You'd better not", $4f
	db "lose until I beat", $55
	db "you. Got it?", $57
; 0x9acee

ViridianGymGuyText: ; 0x9acee
	db $0, "Yo, CHAMP in", $4f
	db "making!", $51
	db "How's it going?", $4f
	db "Looks like you're", $55
	db "on a roll.", $51
	db "The GYM LEADER is", $4f
	db "a guy who battled", $51
	db "the CHAMPION three", $4f
	db "years ago.", $51
	db "He's no pushover.", $51
	db "Give it everything", $4f
	db "you've got!", $57
; 0x9ada0

ViridianGymGuyWinText: ; 0x9ada0
	db $0, "Man, you are truly", $4f
	db "tough…", $51
	db "That was a heck of", $4f
	db "an inspirational", $51
	db "battle. It brought", $4f
	db "tears to my eyes.", $57
; 0x9ae04

ViridianGym_MapEventHeader: ; 0x9ae04
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $11, $4, 1, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $11, $5, 1, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 3, $0, MapViridianGymSignpost1Script
	signpost 13, 6, $0, MapViridianGymSignpost1Script

	; people-events
	db 2
	person_event SPRITE_BLUE, 7, 9, $6, $0, 255, 255, $0, 0, BlueScript_0x9aa26, $0776
	person_event SPRITE_GYM_GUY, 17, 11, $6, $0, 255, 255, $90, 0, ViridianGymGuyScript, $0776
; 0x9ae38

