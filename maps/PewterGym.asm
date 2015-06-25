PewterGym_MapScriptHeader: ; 0x1a2862
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a2864

BrockScript_0x1a2864: ; 0x1a2864
	faceplayer
	loadfont
	checkflag $0023
	iftrue UnknownScript_0x1a2892
	writetext UnknownText_0x1a28d0
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1a29bb, $0000
	loadtrainer BROCK, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	loadfont
	writetext UnknownText_0x1a2a3d
	playsound SFX_GET_BADGE
	waitbutton
	setflag $0023
	writetext UnknownText_0x1a2a57
	closetext
	loadmovesprites
	end
; 0x1a2892

UnknownScript_0x1a2892: ; 0x1a2892
	writetext UnknownText_0x1a2ada
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
	writetext UnknownText_0x1a2c0f
	closetext
	loadmovesprites
	end
; 0x1a28ac

PewterGymGuyScript: ; 0x1a28ac
	faceplayer
	loadfont
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuyWinScript
	writetext PewterGymGuyText
	closetext
	loadmovesprites
	end

.PewterGymGuyWinScript
	writetext PewterGymGuyWinText
	closetext
	loadmovesprites
	end
; 0x1a28c0

MapPewterGymSignpost1Script: ; 0x1a28c0
	checkflag $0023
	iftrue UnknownScript_0x1a28c9
	jumpstd gymstatue1
; 0x1a28c9

UnknownScript_0x1a28c9: ; 0x1a28c9
	trainertotext BROCK, 1, $1
	jumpstd gymstatue2
; 0x1a28d0

UnknownText_0x1a28d0: ; 0x1a28d0
	text "BROCK: Wow, it's"
	line "not often that we"

	para "get a challenger"
	line "from JOHTO."

	para "I'm BROCK, the"
	line "PEWTER GYM LEADER."

	para "I'm an expert on"
	line "rock-type #MON."

	para "My #MON are im-"
	line "pervious to most"

	para "physical attacks."
	line "You'll have a hard"

	para "time inflicting"
	line "any damage."

	para "Come on!"
	done
; 0x1a29bb

UnknownText_0x1a29bb: ; 0x1a29bb
	text "BROCK: Your #-"
	line "MON's powerful at-"
	cont "tacks overcame my"
	cont "rock-hard defense…"

	para "You're stronger"
	line "than I expected…"

	para "Go ahead--take"
	line "this BADGE."
	done
; 0x1a2a3d

UnknownText_0x1a2a3d: ; 0x1a2a3d
	text $52, " received"
	line "BOULDERBADGE."
	done
; 0x1a2a57

UnknownText_0x1a2a57: ; 0x1a2a57
	text "BROCK: ", $14, ","
	line "thanks. I enjoyed"

	para "battling you, even"
	line "though I am a bit"
	cont "upset."

	para "That BOULDERBADGE"
	line "will make your"

	para "#MON even more"
	line "powerful."
	done
; 0x1a2ada

UnknownText_0x1a2ada: ; 0x1a2ada
	text "BROCK: The world"
	line "is huge. There are"

	para "still many strong"
	line "trainers like you."

	para "Just wait and see."
	line "I'm going to be-"
	cont "come a lot strong-"
	cont "er too."
	done
; 0x1a2b62

CamperJerrySeenText: ; 0x1a2b62
	text "The trainers of"
	line "this GYM use rock-"
	cont "type #MON."

	para "The rock-type has"
	line "high DEFENSE."

	para "Battles could end"
	line "up going a long"

	para "time. Are you"
	line "ready for this?"
	done
; 0x1a2bf1

CamperJerryBeatenText: ; 0x1a2bf1
	text "I have to win"
	line "these battles…"
	done
; 0x1a2c0f

UnknownText_0x1a2c0f: ; 0x1a2c0f
	text "Hey, you! Trainer"
	line "from JOHTO! BROCK"

	para "is tough. He'll"
	line "punish you if you"

	para "don't take him"
	line "seriously."
	done
; 0x1a2c6e

PewterGymGuyText: ; 0x1a2c6e
	text "Yo! CHAMP in"
	line "making! You're"

	para "really rocking."
	line "Are you battling"

	para "the GYM LEADERS of"
	line "KANTO?"

	para "They're strong and"
	line "dedicated people,"

	para "just like JOHTO's"
	line "GYM LEADERS."
	done
; 0x1a2d07

PewterGymGuyWinText: ; 0x1a2d07
	text "Yo! CHAMP in"
	line "making! That GYM"

	para "didn't give you"
	line "much trouble."

	para "The way you took"
	line "charge was really"

	para "inspiring. I mean"
	line "that seriously."
	done
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
	person_event SPRITE_BROCK, 5, 9, $6, $0, 255, 255, $b0, 0, BrockScript_0x1a2864, $ffff
	person_event SPRITE_YOUNGSTER, 9, 6, $9, $0, 255, 255, $a2, 3, TrainerCamperJerry, $ffff
	person_event SPRITE_GYM_GUY, 15, 10, $6, $0, 255, 255, $90, 1, PewterGymGuyScript, $ffff
; 0x1a2dc9
