Route14_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x1ad47f:
	faceplayer
	loadfont
	trade $5
	closetext
	loadmovesprites
	end

TrainerPokefanmCarter:
	trainer EVENT_BEAT_POKEFANM_CARTER, POKEFANM, CARTER, PokefanmCarterSeenText, PokefanmCarterBeatenText, $0000, PokefanmCarterScript

PokefanmCarterScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad508
	closetext
	loadmovesprites
	end

TrainerBird_keeperRoy:
	trainer EVENT_BEAT_BIRD_KEEPER_ROY, BIRD_KEEPER, ROY, Bird_keeperRoySeenText, Bird_keeperRoyBeatenText, $0000, Bird_keeperRoyScript

Bird_keeperRoyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad5a4
	closetext
	loadmovesprites
	end

TrainerPokefanmTrevor:
	trainer EVENT_BEAT_POKEFANM_TREVOR, POKEFANM, TREVOR, PokefanmTrevorSeenText, PokefanmTrevorBeatenText, $0000, PokefanmTrevorScript

PokefanmTrevorScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ad660
	closetext
	loadmovesprites
	end

PokefanmCarterSeenText:
	text "Let me tell you,"
	line "I had a hard time"

	para "catching my prized"
	line "#MON."
	done

PokefanmCarterBeatenText:
	text "Awaaah!"
	done

UnknownText_0x1ad508:
	text "SQUIRTLE, CHARMAN-"
	line "DER and BULBASAUR…"

	para "I think that's a"
	line "well-balanced mix."
	done

Bird_keeperRoySeenText:
	text "My dream is to fly"
	line "with my beloved"
	cont "bird #MON."
	done

Bird_keeperRoyBeatenText:
	text "I can dream, but I"
	line "can't ever fly…"
	done

UnknownText_0x1ad5a4:
	text "You have #MON"
	line "that know the HM"

	para "move FLY, don't"
	line "you? I envy you."
	done

PokefanmTrevorSeenText:
	text "Hi. Did you know…?"

	para "#MON get more"
	line "friendly if you"

	para "train them in a"
	line "place that they"
	cont "remember."
	done

PokefanmTrevorBeatenText:
	text "Where did I meet"
	line "this PSYDUCK?"
	done

UnknownText_0x1ad660:
	text "If only there were"
	line "an easy way to"

	para "identify where I"
	line "got my #MON…"
	done

Route14_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 0

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_POKEFAN_M, 19, 15, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerPokefanmCarter, -1
	person_event SPRITE_YOUNGSTER, 31, 15, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerBird_keeperRoy, -1
	person_event SPRITE_POKEFAN_M, 15, 10, OW_LEFT | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerPokefanmTrevor, -1
	person_event SPRITE_TEACHER, 9, 11, OW_UP | $1, $1, -1, -1, (PAL_OW_GREEN << 4) | $80, 4, TeacherScript_0x1ad47f, -1
