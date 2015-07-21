BlackthornGym2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw 3, .Boulders

.Boulders
	writecmdqueue .BoulderCmdQueue
	return

.BoulderCmdQueue
	dbw 2, .BoulderTable ; check if any stones are sitting on a warp
	db 0, 0 ; filler

.BoulderTable
	db 5, 4 ; warp, person
	dw .Disappear4

	db 3, 5 ; warp, person
	dw .Disappear5

	db 4, 6 ; warp, person
	dw .Disappear6

	db $ff ; end

.Disappear4
	disappear 4
	jump .Fall

.Disappear5
	disappear 5
	jump .Fall

.Disappear6
	disappear 6
	jump .Fall

.Fall
	pause 30
	scall .FX
	loadfont
	writetext BlackthornGym2FBoulderFellText
	closetext
	loadmovesprites
	end

.FX
	playsound SFX_STRENGTH
	earthquake 80
	end


BlackthornGymBoulder:
	jumpstd strengthboulder

TrainerCooltrainermCody:
	trainer EVENT_BEAT_COOLTRAINERM_CODY, COOLTRAINERM, CODY, CooltrainermCodySeenText, CooltrainermCodyBeatenText, $0000, CooltrainermCodyScript

CooltrainermCodyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1957d5
	closetext
	loadmovesprites
	end

TrainerCooltrainerfFran:
	trainer EVENT_BEAT_COOLTRAINERF_FRAN, COOLTRAINERF, FRAN, CooltrainerfFranSeenText, CooltrainerfFranBeatenText, $0000, CooltrainerfFranScript

CooltrainerfFranScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x195883
	closetext
	loadmovesprites
	end

CooltrainermCodySeenText:
	text "It's not as if we"
	line "all use dragon-"
	cont "type #MON."
	done

CooltrainermCodyBeatenText:
	text "Rats! If only I"
	line "had a dragon!"
	done

UnknownText_0x1957d5:
	text "Members of our"
	line "dragon-user clan"

	para "can use dragon"
	line "#MON only after"

	para "our MASTER allows"
	line "it."
	done

CooltrainerfFranSeenText:
	text "I can't allow a"
	line "nameless trainer"
	cont "past me!"

	para "CLAIR would be"
	line "livid if I did!"
	done

CooltrainerfFranBeatenText:
	text "Awww… I lost…"
	done

UnknownText_0x195883:
	text "Uh-oh… CLAIR is"
	line "going to be mad…"
	done

BlackthornGym2FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

BlackthornGym2F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $7, $1, 3, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $9, $7, 4, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $5, $2, 5, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $7, $8, 6, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $3, $8, 7, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 8
	person_event SPRITE_COOLTRAINER_M, 5, 8, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerCooltrainermCody, -1
	person_event SPRITE_COOLTRAINER_F, 15, 8, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 1, TrainerCooltrainerfFran, -1
	person_event SPRITE_BOULDER, 6, 12, OW_LEFT | $11, $0, -1, -1, $0, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	person_event SPRITE_BOULDER, 7, 6, OW_LEFT | $11, $0, -1, -1, $0, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	person_event SPRITE_BOULDER, 20, 10, OW_LEFT | $11, $0, -1, -1, $0, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	person_event SPRITE_BOULDER, 7, 7, OW_LEFT | $11, $0, -1, -1, $0, 0, BlackthornGymBoulder, -1
	person_event SPRITE_BOULDER, 5, 10, OW_LEFT | $11, $0, -1, -1, $0, 0, BlackthornGymBoulder, -1
	person_event SPRITE_BOULDER, 18, 12, OW_LEFT | $11, $0, -1, -1, $0, 0, BlackthornGymBoulder, -1
