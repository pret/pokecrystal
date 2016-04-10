const_value set 2
	const BLACKTHORNGYM2F_COOLTRAINER_M
	const BLACKTHORNGYM2F_COOLTRAINER_F
	const BLACKTHORNGYM2F_BOULDER1
	const BLACKTHORNGYM2F_BOULDER2
	const BLACKTHORNGYM2F_BOULDER3
	const BLACKTHORNGYM2F_BOULDER4
	const BLACKTHORNGYM2F_BOULDER5
	const BLACKTHORNGYM2F_BOULDER6

BlackthornGym2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_CMDQUEUE, .Boulders

.Boulders:
	writecmdqueue .BoulderCmdQueue
	return

.BoulderCmdQueue:
	dbw CMDQUEUE_STONETABLE, .BoulderTable ; check if any stones are sitting on a warp
	dw 0 ; filler

.BoulderTable:
	stonetable 5, BLACKTHORNGYM2F_BOULDER1, .Disappear4
	stonetable 3, BLACKTHORNGYM2F_BOULDER2, .Disappear5
	stonetable 4, BLACKTHORNGYM2F_BOULDER3, .Disappear6
	db -1 ; end

.Disappear4:
	disappear BLACKTHORNGYM2F_BOULDER1
	jump .Fall

.Disappear5:
	disappear BLACKTHORNGYM2F_BOULDER2
	jump .Fall

.Disappear6:
	disappear BLACKTHORNGYM2F_BOULDER3
	jump .Fall

.Fall:
	pause 30
	scall .FX
	opentext
	writetext BlackthornGym2FBoulderFellText
	waitbutton
	closetext
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	end


BlackthornGymBoulder:
	jumpstd strengthboulder

TrainerCooltrainermCody:
	trainer EVENT_BEAT_COOLTRAINERM_CODY, COOLTRAINERM, CODY, CooltrainermCodySeenText, CooltrainermCodyBeatenText, 0, CooltrainermCodyScript

CooltrainermCodyScript:
	end_if_just_battled
	opentext
	writetext CooltrainermCodyAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfFran:
	trainer EVENT_BEAT_COOLTRAINERF_FRAN, COOLTRAINERF, FRAN, CooltrainerfFranSeenText, CooltrainerfFranBeatenText, 0, CooltrainerfFranScript

CooltrainerfFranScript:
	end_if_just_battled
	opentext
	writetext CooltrainerfFranAfterText
	waitbutton
	closetext
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

CooltrainermCodyAfterText:
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

CooltrainerfFranAfterText:
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
	warp_def $7, $1, 3, BLACKTHORN_GYM_1F
	warp_def $9, $7, 4, BLACKTHORN_GYM_1F
	warp_def $5, $2, 5, BLACKTHORN_GYM_1F ; hole
	warp_def $7, $8, 6, BLACKTHORN_GYM_1F ; hole
	warp_def $3, $8, 7, BLACKTHORN_GYM_1F ; hole

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 8
	person_event SPRITE_COOLTRAINER_M, 1, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerCooltrainermCody, -1
	person_event SPRITE_COOLTRAINER_F, 11, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerCooltrainerfFran, -1
	person_event SPRITE_BOULDER, 2, 8, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	person_event SPRITE_BOULDER, 3, 2, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	person_event SPRITE_BOULDER, 16, 6, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	person_event SPRITE_BOULDER, 3, 3, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
	person_event SPRITE_BOULDER, 1, 6, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
	person_event SPRITE_BOULDER, 14, 8, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
