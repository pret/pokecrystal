const_value set 2
	const RUINSOFALPHOUTSIDE_YOUNGSTER1
	const RUINSOFALPHOUTSIDE_SCIENTIST
	const RUINSOFALPHOUTSIDE_FISHER
	const RUINSOFALPHOUTSIDE_YOUNGSTER2
	const RUINSOFALPHOUTSIDE_YOUNGSTER3

RuinsofAlphOutside_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x5800d, 0
	dw UnknownScript_0x5800e, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, UnknownScript_0x5800f

UnknownScript_0x5800d:
	end

UnknownScript_0x5800e:
	end

UnknownScript_0x5800f:
	checkflag ENGINE_UNOWN_DEX
	iftrue UnknownScript_0x5802c
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue UnknownScript_0x5801e
	jump UnknownScript_0x5802c

UnknownScript_0x5801e:
	checkcode VAR_UNOWNCOUNT
	if_greater_than $2, UnknownScript_0x58027
	jump UnknownScript_0x5802c

UnknownScript_0x58027:
	appear RUINSOFALPHOUTSIDE_SCIENTIST
	dotrigger $1
	return

UnknownScript_0x5802c:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	dotrigger $0
	return

UnknownScript_0x58031:
	spriteface RUINSOFALPHOUTSIDE_SCIENTIST, UP
	spriteface PLAYER, DOWN
	jump UnknownScript_0x58044

UnknownScript_0x5803a:
	spriteface RUINSOFALPHOUTSIDE_SCIENTIST, LEFT
	spriteface PLAYER, RIGHT
	jump UnknownScript_0x58044

ScientistScript_0x58043:
	faceplayer
UnknownScript_0x58044:
	opentext
	writetext UnknownText_0x580c7
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow RUINSOFALPHOUTSIDE_SCIENTIST, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST, MovementData_0x580ba
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	stopfollow
	applymovement PLAYER, MovementData_0x580c5
	domaptrigger RUINS_OF_ALPH_RESEARCH_CENTER, $1
	warpcheck
	end

FisherScript_0x58061:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue .Next
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext UnknownText_0x583a4
	buttonsound
.Next:
	writetext UnknownText_0x58420
	waitbutton
	closetext
	end

YoungsterScript_0x58076:
	faceplayer
	opentext
	writetext UnknownText_0x58449
	waitbutton
	closetext
	end

YoungsterScript_0x5807e:
	faceplayer
	opentext
	writetext UnknownText_0x5848e
	waitbutton
	closetext
	spriteface RUINSOFALPHOUTSIDE_YOUNGSTER3, UP
	end

TrainerPsychicNathan:
	trainer EVENT_BEAT_PSYCHIC_NATHAN, PSYCHIC_T, NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, PsychicNathanScript

PsychicNathanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x5830e
	waitbutton
	closetext
	end


TrainerSuperNerdStan:
	trainer EVENT_BEAT_SUPER_NERD_STAN, SUPER_NERD, STAN, UnknownText_0x581e5, UnknownText_0x58217, 0, UnknownScript_0x580a9

UnknownScript_0x580a9:
	end_if_just_battled
	opentext
	writetext UnknownText_0x58250
	waitbutton
	closetext
	end


MapRuinsofAlphOutsideSignpost0Script:
	jumptext UnknownText_0x58325

MapRuinsofAlphOutsideSignpost1Script:
	jumptext UnknownText_0x58342

MapRuinsofAlphOutsideSignpost2Script:
	jumptext UnknownText_0x58362

MovementData_0x580ba:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

MovementData_0x580c5:
	step UP
	step_end

UnknownText_0x580c7:
	text "Hm? That's a #-"
	line "DEX, isn't it?"
	cont "May I see it?"

	para "There are so many"
	line "kinds of #MON."

	para "Hm? What's this?"

	para "What is this"
	line "#MON?"

	para "It looks like the"
	line "strange writing on"

	para "the walls of the"
	line "RUINS."

	para "If those drawings"
	line "are really #-"
	cont "MON, there should"
	cont "be many more."

	para "I know! Let me up-"
	line "grade your #-"
	cont "DEX. Follow me."
	done

UnknownText_0x581e5:
	text "What do you want?"
	line "I'm studying--"
	cont "don't disturb me!"
	done

UnknownText_0x58217:
	text "Sorry…"
	line "I'm frustrated by"

	para "our lack of real"
	line "understanding…"
	done

UnknownText_0x58250:
	text "The RUINS are from"
	line "about 1500 years"
	cont "ago."

	para "Nobody knows who"
	line "built them."

	para "It's also not"
	line "known if the #-"
	cont "MON statues have"
	cont "any meaning."

	para "It's all one big"
	line "mystery…"
	done

PsychicNathanSeenText:
	text "Hmmm… This is a"
	line "strange place."
	done

PsychicNathanBeatenText:
	text "…"
	done

UnknownText_0x5830e:
	text "I like thinking"
	line "here."
	done

UnknownText_0x58325:
	text "MYSTERY STONE"
	line "PANEL CHAMBER"
	done

UnknownText_0x58342:
	text "RUINS OF ALPH"
	line "VISITORS WELCOME"
	done

UnknownText_0x58362:
	text "RUINS OF ALPH"
	line "RESEARCH CENTER"

	para "THE AUTHORITY ON"
	line "THE RUINS OF ALPH"
	done

UnknownText_0x583a4:
	text "While exploring"
	line "the RUINS, we"

	para "suddenly noticed"
	line "an odd presence."

	para "We all got scared"
	line "and ran away."

	para "You should be"
	line "careful too."
	done

UnknownText_0x58420:
	text "The RUINS hide a"
	line "huge secret!"

	para "…I think…"
	done

UnknownText_0x58449:
	text "There are many"
	line "kinds of UNOWN, so"

	para "we use them for"
	line "our secret codes."
	done

UnknownText_0x5848e:
	text "A… H… E… A… D…"
	line "Hmm…"

	para "What?"

	para "I'm decoding this"
	line "message!"
	done

RuinsofAlphOutside_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 11
	warp_def $11, $2, 1, RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def $7, $e, 1, RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $1d, $2, 1, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $21, $10, 1, RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def $d, $a, 1, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $b, $11, 1, RUINS_OF_ALPH_RESEARCH_CENTER
	warp_def $13, $6, 1, UNION_CAVE_B1F
	warp_def $1b, $6, 2, UNION_CAVE_B1F
	warp_def $5, $7, 3, ROUTE_36_RUINS_OF_ALPH_GATE
	warp_def $14, $d, 1, ROUTE_32_RUINS_OF_ALPH_GATE
	warp_def $15, $d, 2, ROUTE_32_RUINS_OF_ALPH_GATE

.XYTriggers:
	db 2
	xy_trigger 1, $e, $b, $0, UnknownScript_0x58031, $0, $0
	xy_trigger 1, $f, $a, $0, UnknownScript_0x5803a, $0, $0

.Signposts:
	db 3
	signpost 8, 16, SIGNPOST_READ, MapRuinsofAlphOutsideSignpost0Script
	signpost 16, 12, SIGNPOST_READ, MapRuinsofAlphOutsideSignpost1Script
	signpost 12, 18, SIGNPOST_READ, MapRuinsofAlphOutsideSignpost2Script

.PersonEvents:
	db 5
	person_event SPRITE_YOUNGSTER, 20, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	person_event SPRITE_SCIENTIST, 15, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ScientistScript_0x58043, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	person_event SPRITE_FISHER, 17, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x58061, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	person_event SPRITE_YOUNGSTER, 11, 14, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x58076, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	person_event SPRITE_YOUNGSTER, 8, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x5807e, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
