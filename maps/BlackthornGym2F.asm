BlackthornGym2F_MapScriptHeader: ; 0x195722
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 3, UnknownScript_0x195727
; 0x195727

UnknownScript_0x195727: ; 0x195727
	writecmdqueue $572b
	return
; 0x19572b

INCBIN "baserom.gbc",$19572b,$33

UnknownScript_0x19575e: ; 0x19575e
	jumpstd $000e
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
	2writetext UnknownText_0x1957d5
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
	2writetext UnknownText_0x195883
	closetext
	loadmovesprites
	end
; 0x195789

CooltrainermCodySeenText: ; 0x195789
	db $0, "It's not as if we", $4f
	db "all use dragon-", $55
	db "type #MON.", $57
; 0x1957b6

CooltrainermCodyBeatenText: ; 0x1957b6
	db $0, "Rats! If only I", $4f
	db "had a dragon!", $57
; 0x1957d5

UnknownText_0x1957d5: ; 0x1957d5
	db $0, "Members of our", $4f
	db "dragon-user clan", $51
	db "can use dragon", $4f
	db "#MON only after", $51
	db "our MASTER allows", $4f
	db "it.", $57
; 0x19582b

CooltrainerfFranSeenText: ; 0x19582b
	db $0, "I can't allow a", $4f
	db "nameless trainer", $55
	db "past me!", $51
	db "CLAIR would be", $4f
	db "livid if I did!", $57
; 0x195874

CooltrainerfFranBeatenText: ; 0x195874
	db $0, "Awww… I lost…", $57
; 0x195883

UnknownText_0x195883: ; 0x195883
	db $0, "Uh-oh… CLAIR is", $4f
	db "going to be mad…", $57
; 0x1958a5

UnknownText_0x1958a5: ; 0x1958a5
	db $0, "The boulder fell", $4f
	db "through!", $57
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
	person_event $23, 5, 8, $9, $0, 255, 255, $82, 1, TrainerCooltrainermCody, $ffff
	person_event $24, 15, 8, $8, $0, 255, 255, $82, 1, TrainerCooltrainerfFran, $ffff
	person_event $5a, 6, 12, $19, $0, 255, 255, $0, 0, UnknownScript_0x19575e, $0706
	person_event $5a, 7, 6, $19, $0, 255, 255, $0, 0, UnknownScript_0x19575e, $0707
	person_event $5a, 20, 10, $19, $0, 255, 255, $0, 0, UnknownScript_0x19575e, $0708
	person_event $5a, 7, 7, $19, $0, 255, 255, $0, 0, UnknownScript_0x19575e, $ffff
	person_event $5a, 5, 10, $19, $0, 255, 255, $0, 0, UnknownScript_0x19575e, $ffff
	person_event $5a, 18, 12, $19, $0, 255, 255, $0, 0, UnknownScript_0x19575e, $ffff
; 0x195947

