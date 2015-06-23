BlackthornGym2F_MapScriptHeader: ; 0x195722
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 3, UnknownScript_0x195727
; 0x195727

UnknownScript_0x195727: ; 0x195727
	writecmdqueue CmdQueue_0x19572b
	return
; 0x19572b

CmdQueue_0x19572b: ; 0x19572b
	dbw 2, StoneTable_0x195730 ; check if any stones are sitting on a warp
	db 0, 0 ; filler
; 0x195730

StoneTable_0x195730: ; 0x195730
	db 5, 4 ; warp, person
	dw UnknownScript_0x19573d

	db 3, 5 ; warp, person
	dw UnknownScript_0x195742

	db 4, 6 ; warp, person
	dw UnknownScript_0x195747

	db $ff ; end
; 0x19573d

UnknownScript_0x19573d: ; 0x19573d
	disappear 4
	jump UnknownScript_0x19574c
; 0x195742

UnknownScript_0x195742: ; 0x195742
	disappear 5
	jump UnknownScript_0x19574c
; 0x195747

UnknownScript_0x195747: ; 0x195747
	disappear 6
	jump UnknownScript_0x19574c
; 0x19574c

UnknownScript_0x19574c: ; 0x19574c
	pause 30
	scall UnknownScript_0x195758
	loadfont
	writetext UnknownText_0x1958a5
	closetext
	loadmovesprites
	end
; 0x195758

UnknownScript_0x195758: ; 0x195758
	playsound SFX_STRENGTH
	earthquake 80
	end
; 0x19575e


BoulderScript_0x19575e: ; 0x19575e
	jumpstd strengthboulder
; 0x195761

TrainerCooltrainermCody: ; 0x195761
	; bit/flag number
	dw $54b

	; trainer group && trainer id
	db COOLTRAINERM, CODY

	; text when seen
	dw CooltrainermCodySeenText

	; text when trainer beaten
	dw CooltrainermCodyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermCodyScript
; 0x19576d

CooltrainermCodyScript: ; 0x19576d
	talkaftercancel
	loadfont
	writetext UnknownText_0x1957d5
	closetext
	loadmovesprites
	end
; 0x195775

TrainerCooltrainerfFran: ; 0x195775
	; bit/flag number
	dw $55d

	; trainer group && trainer id
	db COOLTRAINERF, FRAN

	; text when seen
	dw CooltrainerfFranSeenText

	; text when trainer beaten
	dw CooltrainerfFranBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfFranScript
; 0x195781

CooltrainerfFranScript: ; 0x195781
	talkaftercancel
	loadfont
	writetext UnknownText_0x195883
	closetext
	loadmovesprites
	end
; 0x195789

CooltrainermCodySeenText: ; 0x195789
	text "It's not as if we"
	line "all use dragon-"
	cont "type #MON."
	done
; 0x1957b6

CooltrainermCodyBeatenText: ; 0x1957b6
	text "Rats! If only I"
	line "had a dragon!"
	done
; 0x1957d5

UnknownText_0x1957d5: ; 0x1957d5
	text "Members of our"
	line "dragon-user clan"

	para "can use dragon"
	line "#MON only after"

	para "our MASTER allows"
	line "it."
	done
; 0x19582b

CooltrainerfFranSeenText: ; 0x19582b
	text "I can't allow a"
	line "nameless trainer"
	cont "past me!"

	para "CLAIR would be"
	line "livid if I did!"
	done
; 0x195874

CooltrainerfFranBeatenText: ; 0x195874
	text "Awww… I lost…"
	done
; 0x195883

UnknownText_0x195883: ; 0x195883
	text "Uh-oh… CLAIR is"
	line "going to be mad…"
	done
; 0x1958a5

UnknownText_0x1958a5: ; 0x1958a5
	text "The boulder fell"
	line "through!"
	done
; 0x1958c0

BlackthornGym2F_MapEventHeader: ; 0x1958c0
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $7, $1, 3, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $9, $7, 4, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $5, $2, 5, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $7, $8, 6, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $3, $8, 7, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 8
	person_event SPRITE_COOLTRAINER_M, 5, 8, $9, $0, 255, 255, $82, 1, TrainerCooltrainermCody, $ffff
	person_event SPRITE_COOLTRAINER_F, 15, 8, $8, $0, 255, 255, $82, 1, TrainerCooltrainerfFran, $ffff
	person_event SPRITE_BOULDER, 6, 12, $19, $0, 255, 255, $0, 0, BoulderScript_0x19575e, $0706
	person_event SPRITE_BOULDER, 7, 6, $19, $0, 255, 255, $0, 0, BoulderScript_0x19575e, $0707
	person_event SPRITE_BOULDER, 20, 10, $19, $0, 255, 255, $0, 0, BoulderScript_0x19575e, $0708
	person_event SPRITE_BOULDER, 7, 7, $19, $0, 255, 255, $0, 0, BoulderScript_0x19575e, $ffff
	person_event SPRITE_BOULDER, 5, 10, $19, $0, 255, 255, $0, 0, BoulderScript_0x19575e, $ffff
	person_event SPRITE_BOULDER, 18, 12, $19, $0, 255, 255, $0, 0, BoulderScript_0x19575e, $ffff
; 0x195947
