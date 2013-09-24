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
	playsound $0014
	applymovement $d, MovementData_0x1a00da
	spriteface $0, $0
	pause 15
	playsound $0014
	applymovement $d, MovementData_0x1a00e0
	disappear $d
	pause 10
	dotrigger $0
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	domaptrigger GROUP_ROUTE_42, MAP_ROUTE_42, $1
	checkevent $0333
	iftrue UnknownScript_0x1a0083
	setevent $0333
	playmusic $0061
	appear $c
	applymovement $c, MovementData_0x1a00e7
	loadfont
	2writetext UnknownText_0x1a0433
	closetext
	loadmovesprites
	winlosstext UnknownText_0x1a05a1, $0000
	setlasttalked $c
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	reloadmapmusic
	returnafterbattle
	playmusic $0061
	loadfont
	2writetext UnknownText_0x1a05c3
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
	2writetext UnknownText_0x1a00f1
	keeptextopen
	checkevent EVENT_BEAT_CHUCK
	iftrue UnknownScript_0x1a009c
	2writetext UnknownText_0x1a0163
	closetext
	loadmovesprites
	end
; 0x1a009c

UnknownScript_0x1a009c: ; 0x1a009c
	2writetext UnknownText_0x1a01e3
	keeptextopen
	verbosegiveitem HM_02, 1
	iffalse UnknownScript_0x1a00b1
	setevent EVENT_GOT_HM02_FLY
	2writetext UnknownText_0x1a021d
	keeptextopen
UnknownScript_0x1a00ad: ; 0x1a00ad
	2writetext UnknownText_0x1a0277
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
	db $0, "You crossed the", $4f
	db "sea to get here?", $51
	db "That must have", $4f
	db "been hard.", $51
	db "It would be much", $4f
	db "easier if your", $51
	db "#MON knew how", $4f
	db "to FLY…", $57
; 0x1a0163

UnknownText_0x1a0163: ; 0x1a0163
	db $0, "But you can't use", $4f
	db "FLY without this", $55
	db "city's GYM BADGE.", $51
	db "If you beat the", $4f
	db "GYM LEADER here,", $55
	db "come see me.", $51
	db "I'll have a nice", $4f
	db "gift for you.", $57
; 0x1a01e3

UnknownText_0x1a01e3: ; 0x1a01e3
	db $0, "That's CIANWOOD's", $4f
	db "GYM BADGE!", $51
	db "Then you should", $4f
	db "take this HM.", $57
; 0x1a021d

UnknownText_0x1a021d: ; 0x1a021d
	db $0, "Teach FLY to your", $4f
	db "#MON.", $51
	db "You will be able", $4f
	db "to FLY instantly", $51
	db "to anywhere you ", $4f
	db "have visited.", $57
; 0x1a0277

UnknownText_0x1a0277: ; 0x1a0277
	db $0, "My husband lost to", $4f
	db "you, so he needs", $55
	db "to train harder.", $51
	db "That's good, since", $4f
	db "he was getting a", $55
	db "little chubby.", $57
; 0x1a02df

UnknownText_0x1a02df: ; 0x1a02df
	db $0, "If you use FLY,", $4f
	db "you can get back", $51
	db "to OLIVINE in-", $4f
	db "stantly.", $57
; 0x1a0319

UnknownText_0x1a0319: ; 0x1a0319
	db $0, "Boulders to the", $4f
	db "north of town can", $55
	db "be crushed.", $51
	db "They may be hiding", $4f
	db "something.", $51
	db "Your #MON could", $4f
	db "use ROCK SMASH to", $55
	db "break them.", $57
; 0x1a0394

UnknownText_0x1a0394: ; 0x1a0394
	db $0, "CHUCK, the GYM", $4f
	db "LEADER, spars with", $51
	db "his fighting #-", $4f
	db "MON.", $57
; 0x1a03cc

; possibly unused
UnknownText_0x1a03cc: ; 0x1a03cc
	db $0, "There are several", $4f
	db "islands between", $55
	db "here and OLIVINE.", $51
	db "A mythical sea", $4f
	db "creature supposed-", $55
	db "ly lives there.", $57
; 0x1a0433

UnknownText_0x1a0433: ; 0x1a0433
	db $0, "EUSINE: Yo,", $4f
	db $52, ".", $51
	db "Wasn't that", $4f
	db "SUICUNE just now?", $51
	db "I only caught a", $4f
	db "quick glimpse, but", $51
	db "I thought I saw", $4f
	db "SUICUNE running on", $55
	db "the waves.", $51
	db "SUICUNE is beau-", $4f
	db "tiful and grand.", $51
	db "And it races", $4f
	db "through towns and", $51
	db "roads at simply", $4f
	db "awesome speeds.", $51
	db "It's wonderful…", $51
	db "I want to see", $4f
	db "SUICUNE up close…", $51
	db "I've decided.", $51
	db "I'll battle you as", $4f
	db "a trainer to earn", $55
	db "SUICUNE's respect!", $51
	db "Come on, ", $52, ".", $4f
	db "Let's battle now!", $57
; 0x1a05a1

UnknownText_0x1a05a1: ; 0x1a05a1
	db $0, "I hate to admit", $4f
	db "it, but you win.", $57
; 0x1a05c3

UnknownText_0x1a05c3: ; 0x1a05c3
	db $0, "You're amazing,", $4f
	db $52, "!", $51
	db "No wonder #MON", $4f
	db "gravitate to you.", $51
	db "I get it now.", $51
	db "I'm going to keep", $4f
	db "searching for", $55
	db "SUICUNE.", $51
	db "I'm sure we'll see", $4f
	db "each other again.", $51
	db "See you around!", $57
; 0x1a0660

UnknownText_0x1a0660: ; 0x1a0660
	db $0, "CIANWOOD CITY", $51
	db "A Port Surrounded", $4f
	db "by Rough Seas", $57
; 0x1a068f

UnknownText_0x1a068f: ; 0x1a068f
	db $0, "CIANWOOD CITY", $4f
	db "#MON GYM", $51
	db "LEADER: CHUCK", $51
	db "His Roaring Fists", $4f
	db "Do the Talking", $57
; 0x1a06d6

UnknownText_0x1a06d6: ; 0x1a06d6
	db $0, "500 Years of", $4f
	db "Tradition", $51
	db "CIANWOOD CITY", $4f
	db "PHARMACY", $51
	db "We Await Your", $4f
	db "Medicinal Queries", $57
; 0x1a0725

UnknownText_0x1a0725: ; 0x1a0725
	db $0, "CIANWOOD CITY", $4f
	db "PHOTO STUDIO", $51
	db "Take a Snapshot as", $4f
	db "a Keepsake!", $57
; 0x1a0760

UnknownText_0x1a0760: ; 0x1a0760
	db $0, "THE # SEER", $4f
	db "AHEAD", $57
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

