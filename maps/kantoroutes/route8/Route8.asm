const_value set 2
	const ROUTE8_BIKER1
	const ROUTE8_BIKER2
	const ROUTE8_BIKER3
	const ROUTE8_SUPER_NERD1
	const ROUTE8_SUPER_NERD2
	const ROUTE8_FRUIT_TREE

Route8_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBikerDwayne:
	trainer EVENT_BEAT_BIKER_DWAYNE, BIKER, DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, BikerDwayneScript

BikerDwayneScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6c0c8
	waitbutton
	closetext
	end

TrainerBikerHarris:
	trainer EVENT_BEAT_BIKER_HARRIS, BIKER, HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, BikerHarrisScript

BikerHarrisScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6c143
	waitbutton
	closetext
	end

TrainerBikerZeke:
	trainer EVENT_BEAT_BIKER_ZEKE, BIKER, ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, BikerZekeScript

BikerZekeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6c1a3
	waitbutton
	closetext
	end

TrainerSupernerdSam:
	trainer EVENT_BEAT_SUPER_NERD_SAM, SUPER_NERD, SAM, SupernerdSamSeenText, SupernerdSamBeatenText, 0, SupernerdSamScript

SupernerdSamScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6c219
	waitbutton
	closetext
	end

TrainerSupernerdTom:
	trainer EVENT_BEAT_SUPER_NERD_TOM, SUPER_NERD, TOM, SupernerdTomSeenText, SupernerdTomBeatenText, 0, SupernerdTomScript

SupernerdTomScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6c27e
	waitbutton
	closetext
	end

Route8LockedDoor:
	jumptext Route8LockedDoorText

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

FruitTreeScript_0x6c06c:
	fruittree FRUITTREE_ROUTE_8

BikerDwayneSeenText:
	text "We're the KANTO"
	line "#MON FEDERATION"
	cont "trainer group."

	para "We'll drive you"
	line "under our wheels!"
	done

BikerDwayneBeatenText:
	text "S-sorry!"
	done

UnknownText_0x6c0c8:
	text "The KANTO #MON"
	line "FEDERATION will"
	cont "never fall!"
	done

BikerHarrisSeenText:
	text "The cops shut down"
	line "our UNDERGROUND"

	para "PATH! That really"
	line "fries me!"
	done

BikerHarrisBeatenText:
	text "F-forgive me!"
	done

UnknownText_0x6c143:
	text "Wiped out by some"
	line "punk from JOHTO…"
	done

BikerZekeSeenText:
	text "We're the KANTO"
	line "#MON FEDERA-"
	cont "TION!"
	cont "Right on!"
	done

BikerZekeBeatenText:
	text "Yikes! Sorry!"
	done

UnknownText_0x6c1a3:
	text "We'll try not to"
	line "disturb anyone"
	cont "from now on…"
	done

SupernerdSamSeenText:
	text "How does the MAG-"
	line "NET TRAIN work?"
	done

SupernerdSamBeatenText:
	text "I just want to see"
	line "the MAGNET TRAIN…"
	done

UnknownText_0x6c219:
	text "The power of mag-"
	line "nets is awesome!"
	done

SupernerdTomSeenText:
	text "Hm… You've got"
	line "many GYM BADGES."
	done

SupernerdTomBeatenText:
	text "Just as I thought…"
	line "You're tough!"
	done

UnknownText_0x6c27e:
	text "GYM BADGES give"
	line "you advantages in"
	cont "battles."
	done

Route8LockedDoorText:
	text "It's locked…"
	done

Route8UndergroundPathSignText:
	text "The flyer's torn."

	para "It's impossible to"
	line "read…"
	done

Route8_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $4, $4, 3, ROUTE_8_SAFFRON_GATE
	warp_def $5, $4, 4, ROUTE_8_SAFFRON_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 7, 11, SIGNPOST_READ, Route8UndergroundPathSign
	signpost 5, 10, SIGNPOST_READ, Route8LockedDoor

.PersonEvents:
	db 6
	person_event SPRITE_BIKER, 8, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 5, TrainerBikerDwayne, -1
	person_event SPRITE_BIKER, 9, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 5, TrainerBikerHarris, -1
	person_event SPRITE_BIKER, 10, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 5, TrainerBikerZeke, -1
	person_event SPRITE_SUPER_NERD, 2, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerSupernerdSam, -1
	person_event SPRITE_SUPER_NERD, 12, 31, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 4, TrainerSupernerdTom, -1
	person_event SPRITE_FRUIT_TREE, 5, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x6c06c, -1
