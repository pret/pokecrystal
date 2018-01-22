const_value set 2
	const BLACKTHORNGYM2F_COOLTRAINER_M
	const BLACKTHORNGYM2F_COOLTRAINER_F
	const BLACKTHORNGYM2F_BOULDER1
	const BLACKTHORNGYM2F_BOULDER2
	const BLACKTHORNGYM2F_BOULDER3
	const BLACKTHORNGYM2F_BOULDER4
	const BLACKTHORNGYM2F_BOULDER5
	const BLACKTHORNGYM2F_BOULDER6

BlackthornGym2F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	callback MAPCALLBACK_CMDQUEUE, .SetUpStoneTable

.SetUpStoneTable:
	writecmdqueue .CommandQueue
	return

.CommandQueue:
	cmdqueue CMDQUEUE_STONETABLE, .StoneTable ; check if any stones are sitting on a warp

.StoneTable:
	stonetable 5, BLACKTHORNGYM2F_BOULDER1, .Boulder1
	stonetable 3, BLACKTHORNGYM2F_BOULDER2, .Boulder2
	stonetable 4, BLACKTHORNGYM2F_BOULDER3, .Boulder3
	db -1 ; end

.Boulder1:
	disappear BLACKTHORNGYM2F_BOULDER1
	jump .Fall

.Boulder2:
	disappear BLACKTHORNGYM2F_BOULDER2
	jump .Fall

.Boulder3:
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
	trainer EVENT_BEAT_COOLTRAINERM_CODY, COOLTRAINERM, CODY, CooltrainermCodySeenText, CooltrainermCodyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainermCodyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfFran:
	trainer EVENT_BEAT_COOLTRAINERF_FRAN, COOLTRAINERF, FRAN, CooltrainerfFranSeenText, CooltrainerfFranBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerfFranAfterBattleText
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

CooltrainermCodyAfterBattleText:
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

CooltrainerfFranAfterBattleText:
	text "Uh-oh… CLAIR is"
	line "going to be mad…"
	done

BlackthornGym2FBoulderFellText:
	text "The boulder fell"
	line "through!"
	done

BlackthornGym2F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def 1, 7, 3, BLACKTHORN_GYM_1F
	warp_def 7, 9, 4, BLACKTHORN_GYM_1F
	warp_def 2, 5, 5, BLACKTHORN_GYM_1F ; hole
	warp_def 8, 7, 6, BLACKTHORN_GYM_1F ; hole
	warp_def 8, 3, 7, BLACKTHORN_GYM_1F ; hole

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 8
	object_event 4, 1, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermCody, -1
	object_event 4, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfFran, -1
	object_event 8, 2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	object_event 2, 3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	object_event 6, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	object_event 3, 3, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
	object_event 6, 1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
	object_event 8, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGymBoulder, -1
