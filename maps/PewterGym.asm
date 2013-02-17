PewterGym_MapScriptHeader: ; 0x1a2862
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a2864

UnknownScript_0x1a2864: ; 0x1a2864
	faceplayer
	loadfont
	checkbit2 $0023
	iftrue UnknownScript_0x1a2892
	2writetext UnknownText_0x1a28d0
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1a29bb, $0000
	loadtrainer BROCK, 1
	startbattle
	returnafterbattle
	setbit1 $04c5
	setbit1 $042b
	loadfont
	2writetext UnknownText_0x1a2a3d
	playsound $009c
	waitbutton
	setbit2 $0023
	2writetext UnknownText_0x1a2a57
	closetext
	loadmovesprites
	end
; 0x1a2892

UnknownScript_0x1a2892: ; 0x1a2892
	2writetext UnknownText_0x1a2ada
	closetext
	loadmovesprites
	end
; 0x1a2898

TrainerCamperJerry: ; 0x1a2898
	; bit/flag number
	dw $42b

	; trainer group && trainer id
	db CAMPER, JERRY

	; text when seen
	dw CamperJerrySeenText

	; text when trainer beaten
	dw CamperJerryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperJerryScript
; 0x1a28a4

CamperJerryScript: ; 0x1a28a4
	talkaftercancel
	loadfont
	2writetext UnknownText_0x1a2c0f
	closetext
	loadmovesprites
	end
; 0x1a28ac

PewterGymGuyScript: ; 0x1a28ac
	faceplayer
	loadfont
	checkbit1 $04c5
	iftrue .PewterGymGuyWinScript
	2writetext PewterGymGuyText
	closetext
	loadmovesprites
	end

.PewterGymGuyWinScript
	2writetext PewterGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x1a28c0

MapPewterGymSignpost1Script: ; 0x1a28c0
	checkbit2 $0023
	iftrue UnknownScript_0x1a28c9
	jumpstd $002d
; 0x1a28c9

UnknownScript_0x1a28c9: ; 0x1a28c9
	trainertotext BROCK, 1, $1
	jumpstd $002e
; 0x1a28d0

UnknownText_0x1a28d0: ; 0x1a28d0
	db $0, "BROCK: Wow, it's", $4f
	db "not often that we", $51
	db "get a challenger", $4f
	db "from JOHTO.", $51
	db "I'm BROCK, the", $4f
	db "PEWTER GYM LEADER.", $51
	db "I'm an expert on", $4f
	db "rock-type #MON.", $51
	db "My #MON are im-", $4f
	db "pervious to most", $51
	db "physical attacks.", $4f
	db "You'll have a hard", $51
	db "time inflicting", $4f
	db "any damage.", $51
	db "Come on!", $57
; 0x1a29bb

UnknownText_0x1a29bb: ; 0x1a29bb
	db $0, "BROCK: Your #-", $4f
	db "MON's powerful at-", $55
	db "tacks overcame my", $55
	db "rock-hard defense…", $51
	db "You're stronger", $4f
	db "than I expected…", $51
	db "Go ahead--take", $4f
	db "this BADGE.", $57
; 0x1a2a3d

UnknownText_0x1a2a3d: ; 0x1a2a3d
	db $0, $52, " received", $4f
	db "BOULDERBADGE.", $57
; 0x1a2a57

UnknownText_0x1a2a57: ; 0x1a2a57
	db $0, "BROCK: ", $14, ",", $4f
	db "thanks. I enjoyed", $51
	db "battling you, even", $4f
	db "though I am a bit", $55
	db "upset.", $51
	db "That BOULDERBADGE", $4f
	db "will make your", $51
	db "#MON even more", $4f
	db "powerful.", $57
; 0x1a2ada

UnknownText_0x1a2ada: ; 0x1a2ada
	db $0, "BROCK: The world", $4f
	db "is huge. There are", $51
	db "still many strong", $4f
	db "trainers like you.", $51
	db "Just wait and see.", $4f
	db "I'm going to be-", $55
	db "come a lot strong-", $55
	db "er too.", $57
; 0x1a2b62

CamperJerrySeenText: ; 0x1a2b62
	db $0, "The trainers of", $4f
	db "this GYM use rock-", $55
	db "type #MON.", $51
	db "The rock-type has", $4f
	db "high DEFENSE.", $51
	db "Battles could end", $4f
	db "up going a long", $51
	db "time. Are you", $4f
	db "ready for this?", $57
; 0x1a2bf1

CamperJerryBeatenText: ; 0x1a2bf1
	db $0, "I have to win", $4f
	db "these battles…", $57
; 0x1a2c0f

UnknownText_0x1a2c0f: ; 0x1a2c0f
	db $0, "Hey, you! Trainer", $4f
	db "from JOHTO! BROCK", $51
	db "is tough. He'll", $4f
	db "punish you if you", $51
	db "don't take him", $4f
	db "seriously.", $57
; 0x1a2c6e

PewterGymGuyText: ; 0x1a2c6e
	db $0, "Yo! CHAMP in", $4f
	db "making! You're", $51
	db "really rocking.", $4f
	db "Are you battling", $51
	db "the GYM LEADERS of", $4f
	db "KANTO?", $51
	db "They're strong and", $4f
	db "dedicated people,", $51
	db "just like JOHTO's", $4f
	db "GYM LEADERS.", $57
; 0x1a2d07

PewterGymGuyWinText: ; 0x1a2d07
	db $0, "Yo! CHAMP in", $4f
	db "making! That GYM", $51
	db "didn't give you", $4f
	db "much trouble.", $51
	db "The way you took", $4f
	db "charge was really", $51
	db "inspiring. I mean", $4f
	db "that seriously.", $57
; 0x1a2d88

PewterGym_MapEventHeader: ; 0x1a2d88
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $d, $4, 2, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $d, $5, 2, GROUP_PEWTER_CITY, MAP_PEWTER_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 2, $0, MapPewterGymSignpost1Script
	signpost 11, 7, $0, MapPewterGymSignpost1Script

	; people-events
	db 3
	person_event $1a, 5, 9, $6, $0, 255, 255, $b0, 0, UnknownScript_0x1a2864, $ffff
	person_event $27, 9, 6, $9, $0, 255, 255, $a2, 3, TrainerCamperJerry, $ffff
	person_event $48, 15, 10, $6, $0, 255, 255, $90, 1, PewterGymGuyScript, $ffff
; 0x1a2dc9

