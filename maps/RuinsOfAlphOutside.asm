const_value set 2
	const RUINSOFALPHOUTSIDE_YOUNGSTER1
	const RUINSOFALPHOUTSIDE_SCIENTIST
	const RUINSOFALPHOUTSIDE_FISHER
	const RUINSOFALPHOUTSIDE_YOUNGSTER2
	const RUINSOFALPHOUTSIDE_YOUNGSTER3

RuinsOfAlphOutside_MapScriptHeader:
.SceneScripts:
	db 2
	scene_script .DummyScene0
	scene_script .DummyScene1

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftrue .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .MaybeScientist
	jump .NoScientist

.MaybeScientist:
	checkcode VAR_UNOWNCOUNT
	if_greater_than 2, .YesScientist
	jump .NoScientist

.YesScientist:
	appear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene 1
	return

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene 0
	return

RuinsOfAlphOutsideScientistScene1:
	spriteface RUINSOFALPHOUTSIDE_SCIENTIST, UP
	spriteface PLAYER, DOWN
	jump UnknownScript_0x58044

RuinsOfAlphOutsideScientistScene2:
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
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, 1
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
	trainer EVENT_BEAT_PSYCHIC_NATHAN, PSYCHIC_T, NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PsychicNathanAfterBattleText
	waitbutton
	closetext
	end


TrainerSuperNerdStan:
	trainer EVENT_BEAT_SUPER_NERD_STAN, SUPER_NERD, STAN, UnknownText_0x581e5, UnknownText_0x58217, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SuperNerdStanAfterBattleText
	waitbutton
	closetext
	end


RuinsOfAlphOutsideSignpost0Script:
	jumptext UnknownText_0x58325

RuinsOfAlphOutsideSignpost1Script:
	jumptext UnknownText_0x58342

RuinsOfAlphOutsideSignpost2Script:
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

SuperNerdStanAfterBattleText:
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

PsychicNathanAfterBattleText:
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

RuinsOfAlphOutside_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 11
	warp_def 2, 17, 1, RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def 14, 7, 1, RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def 2, 29, 1, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def 16, 33, 1, RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def 10, 13, 1, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def 17, 11, 1, RUINS_OF_ALPH_RESEARCH_CENTER
	warp_def 6, 19, 1, UNION_CAVE_B1F
	warp_def 6, 27, 2, UNION_CAVE_B1F
	warp_def 7, 5, 3, ROUTE_36_RUINS_OF_ALPH_GATE
	warp_def 13, 20, 1, ROUTE_32_RUINS_OF_ALPH_GATE
	warp_def 13, 21, 2, ROUTE_32_RUINS_OF_ALPH_GATE

.CoordEvents:
	db 2
	coord_event 11, 14, 1, RuinsOfAlphOutsideScientistScene1
	coord_event 10, 15, 1, RuinsOfAlphOutsideScientistScene2

.BGEvents:
	db 3
	bg_event 16, 8, BGEVENT_READ, RuinsOfAlphOutsideSignpost0Script
	bg_event 12, 16, BGEVENT_READ, RuinsOfAlphOutsideSignpost1Script
	bg_event 18, 12, BGEVENT_READ, RuinsOfAlphOutsideSignpost2Script

.ObjectEvents:
	db 5
	object_event 4, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ScientistScript_0x58043, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 13, 17, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FisherScript_0x58061, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x58076, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 12, 8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x5807e, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
