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
	checkbit1 $074f
	iftrue UnknownScript_0x19b3ea
	checkbit1 $00e1
	iftrue UnknownScript_0x19b3dd
	2writetext UnknownText_0x19b427
	keeptextopen
	setbit1 $00e1
UnknownScript_0x19b3dd: ; 0x19b3dd
	checkcode $7
	if_equal $10, UnknownScript_0x19b3f7
	if_equal $8, UnknownScript_0x19b401
	2jump UnknownScript_0x19b408
; 0x19b3ea

UnknownScript_0x19b3ea: ; 0x19b3ea
	2writetext UnknownText_0x19b4a2
	closetext
	special $0065
	2writetext UnknownText_0x19b4c8
	closetext
	loadmovesprites
	end
; 0x19b3f7

UnknownScript_0x19b3f7: ; 0x19b3f7
	2writetext UnknownText_0x19b4fc
	keeptextopen
	setbit1 $074f
	2jump UnknownScript_0x19b3ea
; 0x19b401

UnknownScript_0x19b401: ; 0x19b401
	2writetext UnknownText_0x19b6a2
	keeptextopen
	2jump UnknownScript_0x19b3ea
; 0x19b408

UnknownScript_0x19b408: ; 0x19b408
	2writetext UnknownText_0x19b73c
	keeptextopen
	2jump UnknownScript_0x19b3ea
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
	db $0, "OAK: Ah, ", $14, "!", $4f
	db "It's good of you", $51
	db "to come all this", $4f
	db "way to KANTO.", $51
	db "What do you think", $4f
	db "of the trainers", $51
	db "out here?", $4f
	db "Pretty tough, huh?", $57
; 0x19b4a2

UnknownText_0x19b4a2: ; 0x19b4a2
	db $0, "How is your #-", $4f
	db "DEX coming?", $51
	db "Let's see…", $57
; 0x19b4c8

UnknownText_0x19b4c8: ; 0x19b4c8
	db $0, "If you're in the", $4f
	db "area, I hope you", $55
	db "come visit again.", $57
; 0x19b4fc

UnknownText_0x19b4fc: ; 0x19b4fc
	db $0, "OAK: Wow! That's", $4f
	db "excellent!", $51
	db "You collected the", $4f
	db "BADGES of GYMS in", $55
	db "KANTO. Well done!", $51
	db "I was right in my", $4f
	db "assessment of you.", $51
	db "Tell you what,", $4f
	db $14, ". I'll make", $51
	db "arrangements so", $4f
	db "that you can go to", $55
	db "MT.SILVER.", $51
	db "MT.SILVER is a big", $4f
	db "mountain that is", $51
	db "home to many wild", $4f
	db "#MON.", $51
	db "It's too dangerous", $4f
	db "for your average", $51
	db "trainer, so it's", $4f
	db "off limits. But", $51
	db "we can make an", $4f
	db "exception in your", $55
	db "case, ", $14, ".", $51
	db "Go up to INDIGO", $4f
	db "PLATEAU. You can", $51
	db "reach MT.SILVER", $4f
	db "from there.", $57
; 0x19b6a2

UnknownText_0x19b6a2: ; 0x19b6a2
	db $0, "OAK: Hmm? You're", $4f
	db "not collecting", $55
	db "KANTO GYM BADGES?", $51
	db "The GYM LEADERS in", $4f
	db "KANTO are as tough", $51
	db "as any you battled", $4f
	db "in JOHTO.", $51
	db "I recommend that", $4f
	db "you challenge", $55
	db "them.", $57
; 0x19b73c

UnknownText_0x19b73c: ; 0x19b73c
	db $0, "OAK: Ah, you're", $4f
	db "collecting KANTO", $55
	db "GYM BADGES.", $51
	db "I imagine that", $4f
	db "it's hard, but the", $51
	db "experience is sure", $4f
	db "to help you.", $51
	db "Come see me when", $4f
	db "you get them all.", $51
	db "I'll have a gift", $4f
	db "for you.", $51
	db "Keep trying hard,", $4f
	db $14, "!", $57
; 0x19b7fb

UnknownText_0x19b7fb: ; 0x19b7fb
	db $0, "The PROF's #MON", $4f
	db "TALK radio program", $51
	db "isn't aired here", $4f
	db "in KANTO.", $51
	db "It's a shame--I'd", $4f
	db "like to hear it.", $57
; 0x19b859

UnknownText_0x19b859: ; 0x19b859
	db $0, "Thanks to your", $4f
	db "work on the #-", $55
	db "DEX, the PROF's", $51
	db "research is coming", $4f
	db "along great.", $57
; 0x19b8a7

UnknownText_0x19b8a7: ; 0x19b8a7
	db $0, "Don't tell anyone,", $4f
	db "but PROF.OAK'S", $51
	db "#MON TALK isn't", $4f
	db "a live broadcast.", $57
; 0x19b8ea

UnknownText_0x19b8ea: ; 0x19b8ea
	db $0, "Press START to", $4f
	db "open the MENU.", $57
; 0x19b909

UnknownText_0x19b909: ; 0x19b909
	db $0, "The SAVE option is", $4f
	db "on the MENU.", $51
	db "Use it in a timely", $4f
	db "manner.", $57
; 0x19b945

UnknownText_0x19b945: ; 0x19b945
	db $0, "There's nothing in", $4f
	db "here…", $57
; 0x19b95e

UnknownText_0x19b95e: ; 0x19b95e
	db $0, "There's an e-mail", $4f
	db "message on the PC.", $51
	db "…", $51
	db "PROF.OAK, how is", $4f
	db "your research", $55
	db "coming along?", $51
	db "I'm still plugging", $4f
	db "away.", $51
	db "I heard rumors", $4f
	db "that ", $14, " is", $51
	db "getting quite a", $4f
	db "reputation.", $51
	db "I'm delighted to", $4f
	db "hear that.", $51
	db "ELM in NEW BARK", $4f
	db "TOWN 8-)", $57
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



