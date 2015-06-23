OaksLab_MapScriptHeader: ; 0x19b3c5
	; trigger count
	db 0

	; callback count
	db 0
; 0x19b3c7

UnknownScript_0x19b3c7: ; 0x19b3c7
	end
; 0x19b3c8

OakScript_0x19b3c8: ; 0x19b3c8
	faceplayer
	loadfont
	checkevent $074f
	iftrue UnknownScript_0x19b3ea
	checkevent $00e1
	iftrue UnknownScript_0x19b3dd
	writetext UnknownText_0x19b427
	keeptextopen
	setevent $00e1
UnknownScript_0x19b3dd: ; 0x19b3dd
	checkcode $7
	if_equal $10, UnknownScript_0x19b3f7
	if_equal $8, UnknownScript_0x19b401
	jump UnknownScript_0x19b408
; 0x19b3ea

UnknownScript_0x19b3ea: ; 0x19b3ea
	writetext UnknownText_0x19b4a2
	closetext
	special ProfOaksPCBoot
	writetext UnknownText_0x19b4c8
	closetext
	loadmovesprites
	end
; 0x19b3f7

UnknownScript_0x19b3f7: ; 0x19b3f7
	writetext UnknownText_0x19b4fc
	keeptextopen
	setevent $074f
	jump UnknownScript_0x19b3ea
; 0x19b401

UnknownScript_0x19b401: ; 0x19b401
	writetext UnknownText_0x19b6a2
	keeptextopen
	jump UnknownScript_0x19b3ea
; 0x19b408

UnknownScript_0x19b408: ; 0x19b408
	writetext UnknownText_0x19b73c
	keeptextopen
	jump UnknownScript_0x19b3ea
; 0x19b40f

ScientistScript_0x19b40f: ; 0x19b40f
	jumptextfaceplayer UnknownText_0x19b7fb
; 0x19b412

ScientistScript_0x19b412: ; 0x19b412
	jumptextfaceplayer UnknownText_0x19b859
; 0x19b415

ScientistScript_0x19b415: ; 0x19b415
	jumptextfaceplayer UnknownText_0x19b8a7
; 0x19b418

MapOaksLabSignpost11Script: ; 0x19b418
	jumpstd $0001
; 0x19b41b

MapOaksLabSignpost12Script: ; 0x19b41b
	jumptext UnknownText_0x19b8ea
; 0x19b41e

MapOaksLabSignpost13Script: ; 0x19b41e
	jumptext UnknownText_0x19b909
; 0x19b421

MapOaksLabSignpost14Script: ; 0x19b421
	jumptext UnknownText_0x19b945
; 0x19b424

MapOaksLabSignpost15Script: ; 0x19b424
	jumptext UnknownText_0x19b95e
; 0x19b427

UnknownText_0x19b427: ; 0x19b427
	text "OAK: Ah, ", $14, "!"
	line "It's good of you"

	para "to come all this"
	line "way to KANTO."

	para "What do you think"
	line "of the trainers"

	para "out here?"
	line "Pretty tough, huh?"
	done
; 0x19b4a2

UnknownText_0x19b4a2: ; 0x19b4a2
	text "How is your #-"
	line "DEX coming?"

	para "Let's see…"
	done
; 0x19b4c8

UnknownText_0x19b4c8: ; 0x19b4c8
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done
; 0x19b4fc

UnknownText_0x19b4fc: ; 0x19b4fc
	text "OAK: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "BADGES of GYMS in"
	cont "KANTO. Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Tell you what,"
	line $14, ". I'll make"

	para "arrangements so"
	line "that you can go to"
	cont "MT.SILVER."

	para "MT.SILVER is a big"
	line "mountain that is"

	para "home to many wild"
	line "#MON."

	para "It's too dangerous"
	line "for your average"

	para "trainer, so it's"
	line "off limits. But"

	para "we can make an"
	line "exception in your"
	cont "case, ", $14, "."

	para "Go up to INDIGO"
	line "PLATEAU. You can"

	para "reach MT.SILVER"
	line "from there."
	done
; 0x19b6a2

UnknownText_0x19b6a2: ; 0x19b6a2
	text "OAK: Hmm? You're"
	line "not collecting"
	cont "KANTO GYM BADGES?"

	para "The GYM LEADERS in"
	line "KANTO are as tough"

	para "as any you battled"
	line "in JOHTO."

	para "I recommend that"
	line "you challenge"
	cont "them."
	done
; 0x19b73c

UnknownText_0x19b73c: ; 0x19b73c
	text "OAK: Ah, you're"
	line "collecting KANTO"
	cont "GYM BADGES."

	para "I imagine that"
	line "it's hard, but the"

	para "experience is sure"
	line "to help you."

	para "Come see me when"
	line "you get them all."

	para "I'll have a gift"
	line "for you."

	para "Keep trying hard,"
	line $14, "!"
	done
; 0x19b7fb

UnknownText_0x19b7fb: ; 0x19b7fb
	text "The PROF's #MON"
	line "TALK radio program"

	para "isn't aired here"
	line "in KANTO."

	para "It's a shame--I'd"
	line "like to hear it."
	done
; 0x19b859

UnknownText_0x19b859: ; 0x19b859
	text "Thanks to your"
	line "work on the #-"
	cont "DEX, the PROF's"

	para "research is coming"
	line "along great."
	done
; 0x19b8a7

UnknownText_0x19b8a7: ; 0x19b8a7
	text "Don't tell anyone,"
	line "but PROF.OAK'S"

	para "#MON TALK isn't"
	line "a live broadcast."
	done
; 0x19b8ea

UnknownText_0x19b8ea: ; 0x19b8ea
	text "Press START to"
	line "open the MENU."
	done
; 0x19b909

UnknownText_0x19b909: ; 0x19b909
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done
; 0x19b945

UnknownText_0x19b945: ; 0x19b945
	text "There's nothing in"
	line "here…"
	done
; 0x19b95e

UnknownText_0x19b95e: ; 0x19b95e
	text "There's an e-mail"
	line "message on the PC."

	para "…"

	para "PROF.OAK, how is"
	line "your research"
	cont "coming along?"

	para "I'm still plugging"
	line "away."

	para "I heard rumors"
	line "that ", $14, " is"

	para "getting quite a"
	line "reputation."

	para "I'm delighted to"
	line "hear that."

	para "ELM in NEW BARK"
	line "TOWN 8-)"
	done
; 0x19ba33

OaksLab_MapEventHeader: ; 0x19ba33
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $b, $4, 3, GROUP_PALLET_TOWN, MAP_PALLET_TOWN
	warp_def $b, $5, 3, GROUP_PALLET_TOWN, MAP_PALLET_TOWN

	; xy triggers
	db 0

	; signposts
	db 16
	signpost 1, 6, $0, MapOaksLabSignpost11Script
	signpost 1, 7, $0, MapOaksLabSignpost11Script
	signpost 1, 8, $0, MapOaksLabSignpost11Script
	signpost 1, 9, $0, MapOaksLabSignpost11Script
	signpost 7, 0, $0, MapOaksLabSignpost11Script
	signpost 7, 1, $0, MapOaksLabSignpost11Script
	signpost 7, 2, $0, MapOaksLabSignpost11Script
	signpost 7, 3, $0, MapOaksLabSignpost11Script
	signpost 7, 6, $0, MapOaksLabSignpost11Script
	signpost 7, 7, $0, MapOaksLabSignpost11Script
	signpost 7, 8, $0, MapOaksLabSignpost11Script
	signpost 7, 9, $0, MapOaksLabSignpost11Script
	signpost 0, 4, $0, MapOaksLabSignpost12Script
	signpost 0, 5, $0, MapOaksLabSignpost13Script
	signpost 3, 9, $0, MapOaksLabSignpost14Script
	signpost 1, 0, $0, MapOaksLabSignpost15Script

	; people-events
	db 4
	person_event SPRITE_OAK, 6, 8, $6, $0, 255, 255, $0, 0, OakScript_0x19b3c8, $ffff
	person_event SPRITE_SCIENTIST, 12, 5, $5, $1, 255, 255, $90, 0, ScientistScript_0x19b40f, $ffff
	person_event SPRITE_SCIENTIST, 13, 12, $4, $10, 255, 255, $90, 0, ScientistScript_0x19b412, $ffff
	person_event SPRITE_SCIENTIST, 8, 5, $2, $11, 255, 255, $90, 0, ScientistScript_0x19b415, $ffff
; 0x19bac7
