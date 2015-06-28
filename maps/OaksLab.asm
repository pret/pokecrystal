OaksLab_MapScriptHeader: ; 0x19b3c5
	; trigger count
	db 0

	; callback count
	db 0
; 0x19b3c7

UnknownScript_0x19b3c7: ; 0x19b3c7
	end
; 0x19b3c8

Oak:
	faceplayer
	loadfont
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	keeptextopen
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges
	checkcode $7
	if_equal 16, .OpenMtSilver
	if_equal 8, .Complain
	jump .AhGood

.CheckPokedex
	writetext OakLabDexCheckText
	closetext
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	closetext
	loadmovesprites
	end

.OpenMtSilver
	writetext OakOpenMtSilverText
	keeptextopen
	setevent EVENT_OPENED_MT_SILVER
	jump .CheckPokedex

.Complain
	writetext OakNoKantoBadgesText
	keeptextopen
	jump .CheckPokedex

.AhGood
	writetext OakYesKantoBadgesText
	keeptextopen
	jump .CheckPokedex

ScientistScript_0x19b40f: ; 0x19b40f
	jumptextfaceplayer UnknownText_0x19b7fb
; 0x19b412

ScientistScript_0x19b412: ; 0x19b412
	jumptextfaceplayer UnknownText_0x19b859
; 0x19b415

ScientistScript_0x19b415: ; 0x19b415
	jumptextfaceplayer UnknownText_0x19b8a7
; 0x19b418

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "OAK: Ah, <PLAY_G>!"
	line "It's good of you"

	para "to come all this"
	line "way to KANTO."

	para "What do you think"
	line "of the trainers"

	para "out here?"
	line "Pretty tough, huh?"
	done

OakLabDexCheckText:
	text "How is your #-"
	line "DEX coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OakOpenMtSilverText:
	text "OAK: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "BADGES of GYMS in"
	cont "KANTO. Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Tell you what,"
	line "<PLAY_G>. I'll make"

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
	cont "case, <PLAY_G>."

	para "Go up to INDIGO"
	line "PLATEAU. You can"

	para "reach MT.SILVER"
	line "from there."
	done

OakNoKantoBadgesText:
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

OakYesKantoBadgesText:
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
	line "<PLAY_G>!"
	done

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

OaksLabPoster1Text:
	text "Press START to"
	line "open the MENU."
	done

OaksLabPoster2Text:
	text "The SAVE option is"
	line "on the MENU."

	para "Use it in a timely"
	line "manner."
	done

OaksLabTrashcanText
	text "There's nothing in"
	line "here…"
	done

OaksLabPCText:
	text "There's an e-mail"
	line "message on the PC."

	para "…"

	para "PROF.OAK, how is"
	line "your research"
	cont "coming along?"

	para "I'm still plugging"
	line "away."

	para "I heard rumors"
	line "that <PLAY_G> is"

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
	signpost 1, 6, $0, OaksLabBookshelf
	signpost 1, 7, $0, OaksLabBookshelf
	signpost 1, 8, $0, OaksLabBookshelf
	signpost 1, 9, $0, OaksLabBookshelf
	signpost 7, 0, $0, OaksLabBookshelf
	signpost 7, 1, $0, OaksLabBookshelf
	signpost 7, 2, $0, OaksLabBookshelf
	signpost 7, 3, $0, OaksLabBookshelf
	signpost 7, 6, $0, OaksLabBookshelf
	signpost 7, 7, $0, OaksLabBookshelf
	signpost 7, 8, $0, OaksLabBookshelf
	signpost 7, 9, $0, OaksLabBookshelf
	signpost 0, 4, $0, OaksLabPoster1
	signpost 0, 5, $0, OaksLabPoster2
	signpost 3, 9, $0, OaksLabTrashcan
	signpost 1, 0, $0, OaksLabPC

	; people-events
	db 4
	person_event SPRITE_OAK, 6, 8, $6, $0, 255, 255, $0, 0, Oak, $ffff
	person_event SPRITE_SCIENTIST, 12, 5, $5, $1, 255, 255, $90, 0, ScientistScript_0x19b40f, $ffff
	person_event SPRITE_SCIENTIST, 13, 12, $4, $10, 255, 255, $90, 0, ScientistScript_0x19b412, $ffff
	person_event SPRITE_SCIENTIST, 8, 5, $2, $11, 255, 255, $90, 0, ScientistScript_0x19b415, $ffff
; 0x19bac7
