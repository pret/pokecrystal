Route8_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBikerDwayne:
	trainer EVENT_BEAT_BIKER_DWAYNE, BIKER, DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, $0000, BikerDwayneScript

BikerDwayneScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6c0c8
	closetext
	loadmovesprites
	end

TrainerBikerHarris:
	trainer EVENT_BEAT_BIKER_HARRIS, BIKER, HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, $0000, BikerHarrisScript

BikerHarrisScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6c143
	closetext
	loadmovesprites
	end

TrainerBikerZeke:
	trainer EVENT_BEAT_BIKER_ZEKE, BIKER, ZEKE, BikerZekeSeenText, BikerZekeBeatenText, $0000, BikerZekeScript

BikerZekeScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6c1a3
	closetext
	loadmovesprites
	end

TrainerSupernerdSam:
	trainer EVENT_BEAT_SUPER_NERD_SAM, SUPER_NERD, SAM, SupernerdSamSeenText, SupernerdSamBeatenText, $0000, SupernerdSamScript

SupernerdSamScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6c219
	closetext
	loadmovesprites
	end

TrainerSupernerdTom:
	trainer EVENT_BEAT_SUPER_NERD_TOM, SUPER_NERD, TOM, SupernerdTomSeenText, SupernerdTomBeatenText, $0000, SupernerdTomScript

SupernerdTomScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6c27e
	closetext
	loadmovesprites
	end

MapRoute8Signpost1Script:
	jumptext UnknownText_0x6c2aa

MapRoute8Signpost0Script:
	jumptext UnknownText_0x6c2b7

FruitTreeScript_0x6c06c:
	fruittree $1b

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

UnknownText_0x6c2aa:
	text "It's locked…"
	done

UnknownText_0x6c2b7:
	text "The flyer's torn."

	para "It's impossible to"
	line "read…"
	done

Route8_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $4, $4, 3, GROUP_ROUTE_8_SAFFRON_GATE, MAP_ROUTE_8_SAFFRON_GATE
	warp_def $5, $4, 4, GROUP_ROUTE_8_SAFFRON_GATE, MAP_ROUTE_8_SAFFRON_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 7, 11, SIGNPOST_READ, MapRoute8Signpost0Script
	signpost 5, 10, SIGNPOST_READ, MapRoute8Signpost1Script

.PersonEvents:
	db 6
	person_event SPRITE_BIKER, 12, 14, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 5, TrainerBikerDwayne, -1
	person_event SPRITE_BIKER, 13, 14, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 5, TrainerBikerHarris, -1
	person_event SPRITE_BIKER, 14, 14, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 5, TrainerBikerZeke, -1
	person_event SPRITE_SUPER_NERD, 6, 27, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerSupernerdSam, -1
	person_event SPRITE_SUPER_NERD, 16, 35, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 4, TrainerSupernerdTom, -1
	person_event SPRITE_FRUIT_TREE, 9, 37, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x6c06c, -1
