const_value set 2
	const OLIVINELIGHTHOUSE2F_SAILOR
	const OLIVINELIGHTHOUSE2F_GENTLEMAN

OlivineLighthouse2F_MapScripts:
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

TrainerSailorHuey:
	trainer EVENT_BEAT_SAILOR_HUEY, SAILOR, HUEY1, SailorHueySeenText, SailorHueyBeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_SAILOR_HUEY
	end_if_just_battled
	opentext
	checkflag ENGINE_HUEY
	iftrue .WantsBattle
	checkcellnum PHONE_SAILOR_HUEY
	iftrue .NumberAccepted
	checkevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	setevent EVENT_HUEY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .AskForNumber

.AskedBefore:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_SAILOR_HUEY
	if_equal PHONE_CONTACTS_FULL, .PhoneFull
	if_equal PHONE_CONTACT_REFUSED, .NumberDeclined
	trainertotext SAILOR, HUEY1, MEM_BUFFER_0
	scall .RegisteredNumber
	jump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext SailorHueyBeatenText, 0
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
	iftrue .HasProtein
	checkevent EVENT_GOT_PROTEIN_FROM_HUEY
	iftrue .SkipGift
	scall .RematchGift
	verbosegiveitem PROTEIN
	iffalse .PackFull
	setevent EVENT_GOT_PROTEIN_FROM_HUEY
	jump .NumberAccepted

.SkipGift:
	end

.HasProtein:
	opentext
	writetext UnknownText_0x5b1b6
	waitbutton
	verbosegiveitem PROTEIN
	iffalse .PackFull
	clearevent EVENT_HUEY_PROTEIN
	setevent EVENT_GOT_PROTEIN_FROM_HUEY
	jump .NumberAccepted

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Rematch:
	jumpstd rematchm
	end

.PackFull:
	setevent EVENT_HUEY_PROTEIN
	jumpstd packfullm
	end

.RematchGift:
	jumpstd rematchgiftm
	end

SailorHueySeenText:
	text "Men of the sea are"
	line "always spoiling"
	cont "for a good fight!"
	done

SailorHueyBeatenText:
	text "Urf!"
	line "I lose!"
	done

; unused
UnusedText_0x5b0be:
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

OlivineLighthouse2F_MapEvents:
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
	object_event 9, 3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorHuey, -1
	object_event 17, 8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGentlemanAlfred, -1
