CianwoodCity_MapScriptHeader: ; 0x1a0000
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1a000d, $0000
	dw UnknownScript_0x1a000e, $0000

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1a000f
; 0x1a000d

UnknownScript_0x1a000d: ; 0x1a000d
	end
; 0x1a000e

UnknownScript_0x1a000e: ; 0x1a000e
	end
; 0x1a000f

UnknownScript_0x1a000f: ; 0x1a000f
	setflag $0045
	setevent $07aa
	checkevent $0333
	iffalse UnknownScript_0x1a001d
	disappear $c
UnknownScript_0x1a001d: ; 0x1a001d
	return
; 0x1a001e

UnknownScript_0x1a001e: ; 0x1a001e
	spriteface $0, $1
	showemote $0, $0, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement $d, MovementData_0x1a00da
	spriteface $0, $0
	pause 15
	playsound SFX_WARP_FROM
	applymovement $d, MovementData_0x1a00e0
	disappear $d
	pause 10
	dotrigger $0
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	domaptrigger GROUP_ROUTE_42, MAP_ROUTE_42, $1
	checkevent $0333
	iftrue UnknownScript_0x1a0083
	setevent $0333
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear $c
	applymovement $c, MovementData_0x1a00e7
	loadfont
	writetext UnknownText_0x1a0433
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1a05a1, $0000
	setlasttalked $c
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	reloadmapmusic
	returnafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	loadfont
	writetext UnknownText_0x1a05c3
	closetext
	loadmovesprites
	applymovement $c, MovementData_0x1a00ec
	disappear $c
	pause 20
	special $006a
	playmapmusic
	pause 10
UnknownScript_0x1a0083: ; 0x1a0083
	end
; 0x1a0084

PokefanFScript_0x1a0084: ; 0x1a0084
	faceplayer
	loadfont
	checkevent EVENT_GOT_HM02_FLY
	iftrue UnknownScript_0x1a00ad
	writetext UnknownText_0x1a00f1
	keeptextopen
	checkevent EVENT_BEAT_CHUCK
	iftrue UnknownScript_0x1a009c
	writetext UnknownText_0x1a0163
	closetext
	loadmovesprites
	end
; 0x1a009c

UnknownScript_0x1a009c: ; 0x1a009c
	writetext UnknownText_0x1a01e3
	keeptextopen
	verbosegiveitem HM_02, 1
	iffalse UnknownScript_0x1a00b1
	setevent EVENT_GOT_HM02_FLY
	writetext UnknownText_0x1a021d
	keeptextopen
UnknownScript_0x1a00ad: ; 0x1a00ad
	writetext UnknownText_0x1a0277
	closetext
UnknownScript_0x1a00b1: ; 0x1a00b1
	loadmovesprites
	end
; 0x1a00b3

StandingYoungsterScript_0x1a00b3: ; 0x1a00b3
	jumptextfaceplayer UnknownText_0x1a02df
; 0x1a00b6

PokefanMScript_0x1a00b6: ; 0x1a00b6
	jumptextfaceplayer UnknownText_0x1a0319
; 0x1a00b9

LassScript_0x1a00b9: ; 0x1a00b9
	jumptextfaceplayer UnknownText_0x1a0394
; 0x1a00bc

UnknownScript_0x1a00bc: ; 0x1a00bc
	jumptextfaceplayer UnknownText_0x1a03cc
; 0x1a00bf

MapCianwoodCitySignpost0Script: ; 0x1a00bf
	jumptext UnknownText_0x1a0660
; 0x1a00c2

MapCianwoodCitySignpost1Script: ; 0x1a00c2
	jumptext UnknownText_0x1a068f
; 0x1a00c5

MapCianwoodCitySignpost3Script: ; 0x1a00c5
	jumptext UnknownText_0x1a06d6
; 0x1a00c8

MapCianwoodCitySignpost4Script: ; 0x1a00c8
	jumptext UnknownText_0x1a0725
; 0x1a00cb

MapCianwoodCitySignpost5Script: ; 0x1a00cb
	jumptext UnknownText_0x1a0760
; 0x1a00ce

MapCianwoodCitySignpost2Script: ; 0x1a00ce
	jumpstd $0010
; 0x1a00d1

RockScript_0x1a00d1: ; 0x1a00d1
	jumpstd $000f
; 0x1a00d4

MapCianwoodCitySignpostItem6: ; 0x1a00d4
	dw $00b2
	db REVIVE
	
; 0x1a00d7

MapCianwoodCitySignpostItem7: ; 0x1a00d7
	dw $00b3
	db MAX_ETHER
	
; 0x1a00da

MovementData_0x1a00da: ; 0x1a00da
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	db $38 ; movement
	step_end
; 0x1a00e0

MovementData_0x1a00e0: ; 0x1a00e0
	db $39 ; movement
	fast_jump_step_right
	fast_jump_step_up
	fast_jump_step_right
	fast_jump_step_right
	db $38 ; movement
	step_end
; 0x1a00e7

MovementData_0x1a00e7: ; 0x1a00e7
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x1a00ec

MovementData_0x1a00ec: ; 0x1a00ec
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x1a00f1

UnknownText_0x1a00f1: ; 0x1a00f1
	text "You crossed the"
	line "sea to get here?"

	para "That must have"
	line "been hard."

	para "It would be much"
	line "easier if your"

	para "#MON knew how"
	line "to FLY…"
	done
; 0x1a0163

UnknownText_0x1a0163: ; 0x1a0163
	text "But you can't use"
	line "FLY without this"
	cont "city's GYM BADGE."

	para "If you beat the"
	line "GYM LEADER here,"
	cont "come see me."

	para "I'll have a nice"
	line "gift for you."
	done
; 0x1a01e3

UnknownText_0x1a01e3: ; 0x1a01e3
	text "That's CIANWOOD's"
	line "GYM BADGE!"

	para "Then you should"
	line "take this HM."
	done
; 0x1a021d

UnknownText_0x1a021d: ; 0x1a021d
	text "Teach FLY to your"
	line "#MON."

	para "You will be able"
	line "to FLY instantly"

	para "to anywhere you "
	line "have visited."
	done
; 0x1a0277

UnknownText_0x1a0277: ; 0x1a0277
	text "My husband lost to"
	line "you, so he needs"
	cont "to train harder."

	para "That's good, since"
	line "he was getting a"
	cont "little chubby."
	done
; 0x1a02df

UnknownText_0x1a02df: ; 0x1a02df
	text "If you use FLY,"
	line "you can get back"

	para "to OLIVINE in-"
	line "stantly."
	done
; 0x1a0319

UnknownText_0x1a0319: ; 0x1a0319
	text "Boulders to the"
	line "north of town can"
	cont "be crushed."

	para "They may be hiding"
	line "something."

	para "Your #MON could"
	line "use ROCK SMASH to"
	cont "break them."
	done
; 0x1a0394

UnknownText_0x1a0394: ; 0x1a0394
	text "CHUCK, the GYM"
	line "LEADER, spars with"

	para "his fighting #-"
	line "MON."
	done
; 0x1a03cc

; possibly unused
UnknownText_0x1a03cc: ; 0x1a03cc
	text "There are several"
	line "islands between"
	cont "here and OLIVINE."

	para "A mythical sea"
	line "creature supposed-"
	cont "ly lives there."
	done
; 0x1a0433

UnknownText_0x1a0433: ; 0x1a0433
	text "EUSINE: Yo,"
	line $52, "."

	para "Wasn't that"
	line "SUICUNE just now?"

	para "I only caught a"
	line "quick glimpse, but"

	para "I thought I saw"
	line "SUICUNE running on"
	cont "the waves."

	para "SUICUNE is beau-"
	line "tiful and grand."

	para "And it races"
	line "through towns and"

	para "roads at simply"
	line "awesome speeds."

	para "It's wonderful…"

	para "I want to see"
	line "SUICUNE up close…"

	para "I've decided."

	para "I'll battle you as"
	line "a trainer to earn"
	cont "SUICUNE's respect!"

	para "Come on, ", $52, "."
	line "Let's battle now!"
	done
; 0x1a05a1

UnknownText_0x1a05a1: ; 0x1a05a1
	text "I hate to admit"
	line "it, but you win."
	done
; 0x1a05c3

UnknownText_0x1a05c3: ; 0x1a05c3
	text "You're amazing,"
	line $52, "!"

	para "No wonder #MON"
	line "gravitate to you."

	para "I get it now."

	para "I'm going to keep"
	line "searching for"
	cont "SUICUNE."

	para "I'm sure we'll see"
	line "each other again."

	para "See you around!"
	done
; 0x1a0660

UnknownText_0x1a0660: ; 0x1a0660
	text "CIANWOOD CITY"

	para "A Port Surrounded"
	line "by Rough Seas"
	done
; 0x1a068f

UnknownText_0x1a068f: ; 0x1a068f
	text "CIANWOOD CITY"
	line "#MON GYM"

	para "LEADER: CHUCK"

	para "His Roaring Fists"
	line "Do the Talking"
	done
; 0x1a06d6

UnknownText_0x1a06d6: ; 0x1a06d6
	text "500 Years of"
	line "Tradition"

	para "CIANWOOD CITY"
	line "PHARMACY"

	para "We Await Your"
	line "Medicinal Queries"
	done
; 0x1a0725

UnknownText_0x1a0725: ; 0x1a0725
	text "CIANWOOD CITY"
	line "PHOTO STUDIO"

	para "Take a Snapshot as"
	line "a Keepsake!"
	done
; 0x1a0760

UnknownText_0x1a0760: ; 0x1a0760
	text "THE # SEER"
	line "AHEAD"
	done
; 0x1a0772

CianwoodCity_MapEventHeader: ; 0x1a0772
	; filler
	db 0, 0

	; warps
	db 7
	warp_def $29, $11, 1, GROUP_MANIAS_HOUSE, MAP_MANIAS_HOUSE
	warp_def $2b, $8, 1, GROUP_CIANWOOD_GYM, MAP_CIANWOOD_GYM
	warp_def $2b, $17, 1, GROUP_CIANWOOD_POKECENTER_1F, MAP_CIANWOOD_POKECENTER_1F
	warp_def $2f, $f, 1, GROUP_CIANWOOD_PHARMACY, MAP_CIANWOOD_PHARMACY
	warp_def $1f, $9, 1, GROUP_CIANWOOD_CITY_PHOTO_STUDIO, MAP_CIANWOOD_CITY_PHOTO_STUDIO
	warp_def $25, $f, 1, GROUP_CIANWOOD_LUGIA_SPEECH_HOUSE, MAP_CIANWOOD_LUGIA_SPEECH_HOUSE
	warp_def $11, $5, 1, GROUP_POKE_SEERS_HOUSE, MAP_POKE_SEERS_HOUSE

	; xy triggers
	db 1
	xy_trigger 1, $10, $b, $0, UnknownScript_0x1a001e, $0, $0

	; signposts
	db 8
	signpost 34, 20, $0, MapCianwoodCitySignpost0Script
	signpost 45, 7, $0, MapCianwoodCitySignpost1Script
	signpost 43, 24, $0, MapCianwoodCitySignpost2Script
	signpost 47, 19, $0, MapCianwoodCitySignpost3Script
	signpost 32, 8, $0, MapCianwoodCitySignpost4Script
	signpost 24, 8, $0, MapCianwoodCitySignpost5Script
	signpost 19, 4, $7, MapCianwoodCitySignpostItem6
	signpost 29, 5, $7, MapCianwoodCitySignpostItem7

	; people-events
	db 12
	person_event SPRITE_STANDING_YOUNGSTER, 41, 25, $3, $0, 255, 255, $a0, 0, StandingYoungsterScript_0x1a00b3, $ffff
	person_event SPRITE_POKEFAN_M, 37, 21, $5, $1, 255, 255, $0, 0, PokefanMScript_0x1a00b6, $ffff
	person_event SPRITE_LASS, 46, 18, $4, $20, 255, 255, $0, 0, LassScript_0x1a00b9, $ffff
	person_event SPRITE_ROCK, 20, 12, $18, $0, 255, 255, $0, 0, RockScript_0x1a00d1, $ffff
	person_event SPRITE_ROCK, 21, 13, $18, $0, 255, 255, $0, 0, RockScript_0x1a00d1, $ffff
	person_event SPRITE_ROCK, 29, 8, $18, $0, 255, 255, $0, 0, RockScript_0x1a00d1, $ffff
	person_event SPRITE_ROCK, 33, 9, $18, $0, 255, 255, $0, 0, RockScript_0x1a00d1, $ffff
	person_event SPRITE_ROCK, 31, 14, $18, $0, 255, 255, $0, 0, RockScript_0x1a00d1, $ffff
	person_event SPRITE_ROCK, 23, 8, $18, $0, 255, 255, $0, 0, RockScript_0x1a00d1, $ffff
	person_event SPRITE_POKEFAN_F, 50, 14, $5, $1, 255, 255, $0, 0, PokefanFScript_0x1a0084, $ffff
	person_event SPRITE_SUPER_NERD, 25, 15, $7, $0, 255, 255, $90, 0, ObjectEvent, $07ad
	person_event SPRITE_SUICUNE, 18, 14, $1, $0, 255, 255, $90, 0, ObjectEvent, $07ae
; 0x1a0867

