const_value set 2
	const OLIVINELIGHTHOUSE2F_SAILOR
	const OLIVINELIGHTHOUSE2F_GENTLEMAN

OlivineLighthouse2F_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TrainerGentlemanAlfred:
	trainer EVENT_BEAT_GENTLEMAN_ALFRED, GENTLEMAN, ALFRED, GentlemanAlfredSeenText, GentlemanAlfredBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext GentlemanAlfredAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorHuey1:
	trainer EVENT_BEAT_SAILOR_HUEY, SAILOR, HUEY1, SailorHuey1SeenText, SailorHuey1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_SAILOR_HUEY
	end_if_just_battled
	opentext
	checkflag ENGINE_HUEY
	iftrue UnknownScript_0x5afc7
	checkcellnum PHONE_SAILOR_HUEY
	iftrue UnknownScript_0x5b05f
	checkevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x5afb0
	setevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x5b053
	jump UnknownScript_0x5afb3

UnknownScript_0x5afb0:
	scall UnknownScript_0x5b057
UnknownScript_0x5afb3:
	askforphonenumber PHONE_SAILOR_HUEY
	if_equal PHONE_CONTACTS_FULL, UnknownScript_0x5b067
	if_equal PHONE_CONTACT_REFUSED, UnknownScript_0x5b063
	trainertotext SAILOR, HUEY1, MEM_BUFFER_0
	scall UnknownScript_0x5b05b
	jump UnknownScript_0x5b05f

UnknownScript_0x5afc7:
	scall UnknownScript_0x5b06b
	winlosstext SailorHuey1BeatenText, 0
	copybytetovar wHueyFightCount
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SAILOR, HUEY1
	startbattle
	reloadmapafterbattle
	loadvar wHueyFightCount, 1
	clearflag ENGINE_HUEY
	end

.LoadFight1:
	loadtrainer SAILOR, HUEY2
	startbattle
	reloadmapafterbattle
	loadvar wHueyFightCount, 2
	clearflag ENGINE_HUEY
	end

.LoadFight2:
	loadtrainer SAILOR, HUEY3
	startbattle
	reloadmapafterbattle
	loadvar wHueyFightCount, 3
	clearflag ENGINE_HUEY
	end

.LoadFight3:
	loadtrainer SAILOR, HUEY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_HUEY
	checkevent EVENT_HUEY_PROTEIN
	iftrue UnknownScript_0x5b03f
	checkevent EVENT_GOT_PROTEIN_FROM_HUEY
	iftrue UnknownScript_0x5b03e
	scall UnknownScript_0x5b076
	verbosegiveitem PROTEIN
	iffalse UnknownScript_0x5b06f
	setevent EVENT_GOT_PROTEIN_FROM_HUEY
	jump UnknownScript_0x5b05f

UnknownScript_0x5b03e:
	end

UnknownScript_0x5b03f:
	opentext
	writetext UnknownText_0x5b1b6
	waitbutton
	verbosegiveitem PROTEIN
	iffalse UnknownScript_0x5b06f
	clearevent EVENT_HUEY_PROTEIN
	setevent EVENT_GOT_PROTEIN_FROM_HUEY
	jump UnknownScript_0x5b05f

UnknownScript_0x5b053:
	jumpstd asknumber1m
	end

UnknownScript_0x5b057:
	jumpstd asknumber2m
	end

UnknownScript_0x5b05b:
	jumpstd registerednumberm
	end

UnknownScript_0x5b05f:
	jumpstd numberacceptedm
	end

UnknownScript_0x5b063:
	jumpstd numberdeclinedm
	end

UnknownScript_0x5b067:
	jumpstd phonefullm
	end

UnknownScript_0x5b06b:
	jumpstd rematchm
	end

UnknownScript_0x5b06f:
	setevent EVENT_HUEY_PROTEIN
	jumpstd packfullm
	end

UnknownScript_0x5b076:
	jumpstd rematchgiftm
	end

SailorHuey1SeenText:
	text "Men of the sea are"
	line "always spoiling"
	cont "for a good fight!"
	done

SailorHuey1BeatenText:
	text "Urf!"
	line "I lose!"
	done

; possibly unused
UnknownText_0x5b0be:
	text "What power!"
	line "How would you like"

	para "to sail the seas"
	line "with me?"
	done

GentlemanAlfredSeenText:
	text "Hm? This is no"
	line "place for playing."
	done

GentlemanAlfredBeatenText:
	text "Ah! I can see that"
	line "you're serious."
	done

GentlemanAlfredAfterBattleText:
	text "Up top is a #-"
	line "MON that keeps the"
	cont "LIGHTHOUSE lit."

	para "But I hear that"
	line "it's sick now and"

	para "can't be cured by"
	line "ordinary medicine."
	done

UnknownText_0x5b1b6:
	text "Man! You're as"
	line "tough as ever!"

	para "Anyway, here's"
	line "that medicine from"
	cont "before."
	done

OlivineLighthouse2F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def 3, 11, 3, OLIVINE_LIGHTHOUSE_1F
	warp_def 5, 3, 2, OLIVINE_LIGHTHOUSE_3F
	warp_def 16, 13, 4, OLIVINE_LIGHTHOUSE_1F
	warp_def 17, 13, 5, OLIVINE_LIGHTHOUSE_1F
	warp_def 16, 11, 4, OLIVINE_LIGHTHOUSE_3F
	warp_def 17, 11, 5, OLIVINE_LIGHTHOUSE_3F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 2
	object_event 9, 3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorHuey1, -1
	object_event 17, 8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGentlemanAlfred, -1
