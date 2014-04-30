WarehouseEntrance_MapScriptHeader: ; 0x7c038
	; trigger count
	db 0

	; callback count
	db 3

	; callbacks

	dbw 5, UnknownScript_0x7c043

	dbw 1, UnknownScript_0x7c076

	dbw 2, UnknownScript_0x7c082
; 0x7c043

UnknownScript_0x7c043: ; 0x7c043
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	writebyte $0
	copyvartobyte UndergroundSwitchPositions
	return
; 0x7c076

UnknownScript_0x7c076: ; 0x7c076
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse UnknownScript_0x7c07d
	return
; 0x7c07d

UnknownScript_0x7c07d: ; 0x7c07d
	changeblock $12, $6, $3d
	return
; 0x7c082

UnknownScript_0x7c082: ; 0x7c082
	checkcode $b
	if_equal MONDAY, UnknownScript_0x7c0a5
	if_equal TUESDAY, UnknownScript_0x7c0b5
	if_equal WEDNESDAY, UnknownScript_0x7c0be
	if_equal THURSDAY, UnknownScript_0x7c0c7
	if_equal FRIDAY, UnknownScript_0x7c0d0
	if_equal SATURDAY, UnknownScript_0x7c0d9
	disappear $7
	disappear $8
	appear $9
	appear $a
	return
; 0x7c0a5

UnknownScript_0x7c0a5: ; 0x7c0a5
	disappear $7
	checktime $1
	iffalse UnknownScript_0x7c0ae
	appear $7
UnknownScript_0x7c0ae: ; 0x7c0ae
	disappear $8
	disappear $9
	disappear $a
	return
; 0x7c0b5

UnknownScript_0x7c0b5: ; 0x7c0b5
	disappear $7
	appear $8
	disappear $9
	disappear $a
	return
; 0x7c0be

UnknownScript_0x7c0be: ; 0x7c0be
	disappear $7
	disappear $8
	appear $9
	disappear $a
	return
; 0x7c0c7

UnknownScript_0x7c0c7: ; 0x7c0c7
	disappear $7
	appear $8
	disappear $9
	disappear $a
	return
; 0x7c0d0

UnknownScript_0x7c0d0: ; 0x7c0d0
	disappear $7
	disappear $8
	appear $9
	disappear $a
	return
; 0x7c0d9

UnknownScript_0x7c0d9: ; 0x7c0d9
	disappear $7
	appear $8
	disappear $9
	appear $a
	return
; 0x7c0e2

TrainerSupernerdEric: ; 0x7c0e2
	; bit/flag number
	dw $582

	; trainer group && trainer id
	db SUPER_NERD, ERIC

	; text when seen
	dw SupernerdEricSeenText

	; text when trainer beaten
	dw SupernerdEricBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SupernerdEricScript
; 0x7c0ee

SupernerdEricScript: ; 0x7c0ee
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7c36c
	closetext
	loadmovesprites
	end
; 0x7c0f6

TrainerSupernerdTeru: ; 0x7c0f6
	; bit/flag number
	dw $58a

	; trainer group && trainer id
	db SUPER_NERD, TERU

	; text when seen
	dw SupernerdTeruSeenText

	; text when trainer beaten
	dw SupernerdTeruBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SupernerdTeruScript
; 0x7c102

SupernerdTeruScript: ; 0x7c102
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7c410
	closetext
	loadmovesprites
	end
; 0x7c10a

TrainerPokemaniacIssac: ; 0x7c10a
	; bit/flag number
	dw $4ee

	; trainer group && trainer id
	db POKEMANIAC, ISSAC

	; text when seen
	dw PokemaniacIssacSeenText

	; text when trainer beaten
	dw PokemaniacIssacBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacIssacScript
; 0x7c116

PokemaniacIssacScript: ; 0x7c116
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7c498
	closetext
	loadmovesprites
	end
; 0x7c11e

TrainerPokemaniacDonald: ; 0x7c11e
	; bit/flag number
	dw $4ef

	; trainer group && trainer id
	db POKEMANIAC, DONALD

	; text when seen
	dw PokemaniacDonaldSeenText

	; text when trainer beaten
	dw PokemaniacDonaldBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacDonaldScript
; 0x7c12a

PokemaniacDonaldScript: ; 0x7c12a
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7c52f
	closetext
	loadmovesprites
	end
; 0x7c132

GrannyScript_0x7c132: ; 0x7c132
	loadfont
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x7c140
	if_equal SATURDAY, UnknownScript_0x7c140
	2jump UnknownScript_0x7c300
; 0x7c140

UnknownScript_0x7c140: ; 0x7c140
	pokemart $1, $0021
	loadmovesprites
	end
; 0x7c146

GrampsScript_0x7c146: ; 0x7c146
	loadfont
	checkflag $0056
	iftrue UnknownScript_0x7c300
	checkcode $b
	if_equal MONDAY, UnknownScript_0x7c156
	2jump UnknownScript_0x7c300
; 0x7c156

UnknownScript_0x7c156: ; 0x7c156
	checktime $1
	iffalse UnknownScript_0x7c300
	pokemart $2, $0000
	loadmovesprites
	end
; 0x7c161

SuperNerdScript_0x7c161: ; 0x7c161
	loadfont
	checkcode $b
	if_equal TUESDAY, UnknownScript_0x7c173
	if_equal THURSDAY, UnknownScript_0x7c173
	if_equal SATURDAY, UnknownScript_0x7c173
	2jump UnknownScript_0x7c300
; 0x7c173

UnknownScript_0x7c173: ; 0x7c173
	checkflag $005a
	iftrue UnknownScript_0x7c208
	special $0051
	2writetext UnknownText_0x7c5f9
	yesorno
	iffalse UnknownScript_0x7c1fc
	checkmoney $0, 500
	if_equal $2, UnknownScript_0x7c202
	2writetext UnknownText_0x7c69a
	keeptextopen
	special $0061
	if_equal $0, UnknownScript_0x7c1fc
	if_equal $1, UnknownScript_0x7c1fc
	setflag $005a
	if_equal $2, UnknownScript_0x7c1a9
	if_equal $3, UnknownScript_0x7c1b5
	2jump UnknownScript_0x7c1c1
; 0x7c1a9

UnknownScript_0x7c1a9: ; 0x7c1a9
	setevent $0000
	clearevent $0001
	clearevent $0002
	2jump UnknownScript_0x7c1cd
; 0x7c1b5

UnknownScript_0x7c1b5: ; 0x7c1b5
	clearevent $0000
	setevent $0001
	clearevent $0002
	2jump UnknownScript_0x7c1cd
; 0x7c1c1

UnknownScript_0x7c1c1: ; 0x7c1c1
	clearevent $0000
	clearevent $0001
	setevent $0002
	2jump UnknownScript_0x7c1cd
; 0x7c1cd

UnknownScript_0x7c1cd: ; 0x7c1cd
	takemoney $0, 500
	special $0051
	2writetext UnknownText_0x7c6b8
	closetext
	loadmovesprites
	special $002e
	playmusic MUSIC_HEAL
	pause 60
	special $0031
	special $003d
	loadfont
	2writetext UnknownText_0x7c6d8
	closetext
	checkevent $0000
	iftrue UnknownScript_0x7c2bb
	checkevent $0001
	iftrue UnknownScript_0x7c2c4
	2jump UnknownScript_0x7c2cd
; 0x7c1fc

UnknownScript_0x7c1fc: ; 0x7c1fc
	2writetext UnknownText_0x7c6ea
	closetext
	loadmovesprites
	end
; 0x7c202

UnknownScript_0x7c202: ; 0x7c202
	2writetext UnknownText_0x7c709
	closetext
	loadmovesprites
	end
; 0x7c208

UnknownScript_0x7c208: ; 0x7c208
	2writetext UnknownText_0x7c72b
	closetext
	loadmovesprites
	end
; 0x7c20e

SuperNerdScript_0x7c20e: ; 0x7c20e
	loadfont
	checkcode $b
	if_equal SUNDAY, UnknownScript_0x7c220
	if_equal WEDNESDAY, UnknownScript_0x7c220
	if_equal FRIDAY, UnknownScript_0x7c220
	2jump UnknownScript_0x7c300
; 0x7c220

UnknownScript_0x7c220: ; 0x7c220
	checkflag $005a
	iftrue UnknownScript_0x7c2b5
	special $0051
	2writetext UnknownText_0x7c75c
	yesorno
	iffalse UnknownScript_0x7c2a9
	checkmoney $0, 300
	if_equal $2, UnknownScript_0x7c2af
	2writetext UnknownText_0x7c7f1
	keeptextopen
	special $0062
	if_equal $0, UnknownScript_0x7c2a9
	if_equal $1, UnknownScript_0x7c2a9
	setflag $005a
	if_equal $2, UnknownScript_0x7c256
	if_equal $3, UnknownScript_0x7c262
	2jump UnknownScript_0x7c26e
; 0x7c256

UnknownScript_0x7c256: ; 0x7c256
	setevent $0000
	clearevent $0001
	clearevent $0002
	2jump UnknownScript_0x7c27a
; 0x7c262

UnknownScript_0x7c262: ; 0x7c262
	clearevent $0000
	setevent $0001
	clearevent $0002
	2jump UnknownScript_0x7c27a
; 0x7c26e

UnknownScript_0x7c26e: ; 0x7c26e
	clearevent $0000
	clearevent $0001
	setevent $0002
	2jump UnknownScript_0x7c27a
; 0x7c27a

UnknownScript_0x7c27a: ; 0x7c27a
	takemoney $0, 300
	special $0051
	2writetext UnknownText_0x7c80e
	closetext
	loadmovesprites
	special $002e
	playmusic MUSIC_HEAL
	pause 60
	special $0031
	special $003d
	loadfont
	2writetext UnknownText_0x7c82a
	closetext
	checkevent $0000
	iftrue UnknownScript_0x7c2bb
	checkevent $0001
	iftrue UnknownScript_0x7c2c4
	2jump UnknownScript_0x7c2cd
; 0x7c2a9

UnknownScript_0x7c2a9: ; 0x7c2a9
	2writetext UnknownText_0x7c842
	closetext
	loadmovesprites
	end
; 0x7c2af

UnknownScript_0x7c2af: ; 0x7c2af
	2writetext UnknownText_0x7c85b
	closetext
	loadmovesprites
	end
; 0x7c2b5

UnknownScript_0x7c2b5: ; 0x7c2b5
	2writetext UnknownText_0x7c87b
	closetext
	loadmovesprites
	end
; 0x7c2bb

UnknownScript_0x7c2bb: ; 0x7c2bb
	2writetext UnknownText_0x7c8bf
	special $0064
	closetext
	loadmovesprites
	end
; 0x7c2c4

UnknownScript_0x7c2c4: ; 0x7c2c4
	2writetext UnknownText_0x7c8dc
	special $0064
	closetext
	loadmovesprites
	end
; 0x7c2cd

UnknownScript_0x7c2cd: ; 0x7c2cd
	2writetext UnknownText_0x7c8ee
	special $0064
	closetext
	loadmovesprites
	end
; 0x7c2d6

MapWarehouseEntranceSignpost0Script:: ; 0x7c2d6
	loadfont
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue UnknownScript_0x7c2fa
	checkitem BASEMENT_KEY
	iftrue UnknownScript_0x7c2e8
	2writetext UnknownText_0x7c5b0
	closetext
	loadmovesprites
	end
; 0x7c2e8

UnknownScript_0x7c2e8: ; 0x7c2e8
	playsound SFX_TRANSACTION
	2writetext UnknownText_0x7c5d6
	closetext
	loadmovesprites
	changeblock $12, $6, $2e
	reloadmappart
	loadmovesprites
	setevent EVENT_USED_BASEMENT_KEY
	end
; 0x7c2fa

UnknownScript_0x7c2fa: ; 0x7c2fa
	2writetext UnknownText_0x7c5c3
	closetext
	loadmovesprites
	end
; 0x7c300

UnknownScript_0x7c300: ; 0x7c300
	2writetext UnknownText_0x7c904
	closetext
	loadmovesprites
	end
; 0x7c306

ItemFragment_0x7c306: ; 0x7c306
	db COIN_CASE, 1
; 0x7c308

MapWarehouseEntranceSignpost1Script: ; 0x7c308
	jumptext UnknownText_0x7c91a
; 0x7c30b

MapWarehouseEntranceSignpostItem2: ; 0x7c30b
	dw $008b
	db PARLYZ_HEAL
	
; 0x7c30e

MapWarehouseEntranceSignpostItem3: ; 0x7c30e
	dw $008c
	db SUPER_POTION
	
; 0x7c311

MapWarehouseEntranceSignpostItem4: ; 0x7c311
	dw $008d
	db ANTIDOTE
	
; 0x7c314

SupernerdEricSeenText: ; 0x7c314
	text "I got booted out"
	line "of the GAME COR-"
	cont "NER."

	para "I was trying to"
	line "cheat using my"
	cont "#MON…"
	done
; 0x7c361

SupernerdEricBeatenText: ; 0x7c361
	text "…Grumble…"
	done
; 0x7c36c

UnknownText_0x7c36c: ; 0x7c36c
	text "I guess I have to"
	line "do things fair and"
	cont "square…"
	done
; 0x7c39a

SupernerdTeruSeenText: ; 0x7c39a
	text "Do you consider"
	line "type alignments in"
	cont "battle?"

	para "If you know your"
	line "type advantages,"

	para "you'll do better"
	line "in battle."
	done
; 0x7c403

SupernerdTeruBeatenText: ; 0x7c403
	text "Ow, ow, ow!"
	done
; 0x7c410

UnknownText_0x7c410: ; 0x7c410
	text "I know my #MON"
	line "type alignments."

	para "But I only use one"
	line "type of #MON."
	done
; 0x7c452

PokemaniacIssacSeenText: ; 0x7c452
	text "My #MON just"
	line "got a haircut!"

	para "I'll show you how"
	line "strong it is!"
	done
; 0x7c48e

PokemaniacIssacBeatenText: ; 0x7c48e
	text "Aiyeeee!"
	done
; 0x7c498

UnknownText_0x7c498: ; 0x7c498
	text "Your #MON will"
	line "like you more if"

	para "you give them"
	line "haircuts."
	done
; 0x7c4d1

PokemaniacDonaldSeenText: ; 0x7c4d1
	text "I think you have"
	line "some rare #MON"
	cont "with you."

	para "Let me see them!"
	done
; 0x7c50d

PokemaniacDonaldBeatenText: ; 0x7c50d
	text "Gaah! I lost!"
	line "That makes me mad!"
	done
; 0x7c52f

UnknownText_0x7c52f: ; 0x7c52f
	text "Are you making a"
	line "#DEX? Here's a"
	cont "hot tip."

	para "The HIKER on ROUTE"
	line "33, ANTHONY, is a"
	cont "good guy."

	para "He'll phone you if"
	line "he sees any rare"
	cont "#MON."
	done
; 0x7c5b0

UnknownText_0x7c5b0: ; 0x7c5b0
	text "The door's locked…"
	done
; 0x7c5c3

UnknownText_0x7c5c3: ; 0x7c5c3
	text "The door is open."
	done
; 0x7c5d6

UnknownText_0x7c5d6: ; 0x7c5d6
	text "The BASEMENT KEY"
	line "opened the door."
	done
; 0x7c5f9

UnknownText_0x7c5f9: ; 0x7c5f9
	text "Welcome!"

	para "I run the #MON"
	line "SALON!"

	para "I'm the older and"
	line "better of the two"
	cont "HAIRCUT BROTHERS."

	para "I can make your"
	line "#MON beautiful"
	cont "for just ¥500."

	para "Would you like me"
	line "to do that?"
	done
; 0x7c69a

UnknownText_0x7c69a: ; 0x7c69a
	text "Which #MON"
	line "should I work on?"
	done
; 0x7c6b8

UnknownText_0x7c6b8: ; 0x7c6b8
	text "OK! Watch it"
	line "become beautiful!"
	done
; 0x7c6d8

UnknownText_0x7c6d8: ; 0x7c6d8
	text "There! All done!"
	done
; 0x7c6ea

UnknownText_0x7c6ea: ; 0x7c6ea
	text "Is that right?"
	line "That's a shame!"
	done
; 0x7c709

UnknownText_0x7c709: ; 0x7c709
	text "You'll need more"
	line "money than that."
	done
; 0x7c72b

UnknownText_0x7c72b: ; 0x7c72b
	text "I do only one"
	line "haircut a day. I'm"
	cont "done for today."
	done
; 0x7c75c

UnknownText_0x7c75c: ; 0x7c75c
	text "Welcome to the"
	line "#MON SALON!"

	para "I'm the younger"
	line "and less expen-"
	cont "sive of the two"
	cont "HAIRCUT BROTHERS."

	para "I'll spiff up your"
	line "#MON for just"
	cont "¥300."

	para "So? How about it?"
	done
; 0x7c7f1

UnknownText_0x7c7f1: ; 0x7c7f1
	text "OK, which #MON"
	line "should I do?"
	done
; 0x7c80e

UnknownText_0x7c80e: ; 0x7c80e
	text "OK! I'll make it"
	line "look cool!"
	done
; 0x7c82a

UnknownText_0x7c82a: ; 0x7c82a
	text "There we go!"
	line "All done!"
	done
; 0x7c842

UnknownText_0x7c842: ; 0x7c842
	text "No? "
	line "How disappointing!"
	done
; 0x7c85b

UnknownText_0x7c85b: ; 0x7c85b
	text "You're a little"
	line "short on funds."
	done
; 0x7c87b

UnknownText_0x7c87b: ; 0x7c87b
	text "I can do only one"
	line "haircut a day."

	para "Sorry, but I'm all"
	line "done for today."
	done
; 0x7c8bf

UnknownText_0x7c8bf: ; 0x7c8bf
	text_from_ram $d099
	text " looks a"
	line "little happier."
	done
; 0x7c8dc

UnknownText_0x7c8dc: ; 0x7c8dc
	text_from_ram $d099
	text " looks"
	line "happy."
	done
; 0x7c8ee

UnknownText_0x7c8ee: ; 0x7c8ee
	text_from_ram $d099
	text " looks"
	line "delighted!"
	done
; 0x7c904

UnknownText_0x7c904: ; 0x7c904
	text "We're not open"
	line "today."
	done
; 0x7c91a

UnknownText_0x7c91a: ; 0x7c91a
	text "NO ENTRY BEYOND"
	line "THIS POINT"
	done
; 0x7c936

WarehouseEntrance_MapEventHeader: ; 0x7c936
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $2, $3, 7, GROUP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, MAP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def $22, $3, 4, GROUP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, MAP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def $6, $12, 4, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $1f, $15, 3, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $1f, $16, 3, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $1b, $16, 1, GROUP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, MAP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 6, 18, $0, MapWarehouseEntranceSignpost0Script
	signpost 6, 19, $0, MapWarehouseEntranceSignpost1Script
	signpost 13, 6, $7, MapWarehouseEntranceSignpostItem2
	signpost 18, 4, $7, MapWarehouseEntranceSignpostItem3
	signpost 8, 17, $7, MapWarehouseEntranceSignpostItem4

	; people-events
	db 9
	person_event SPRITE_SUPER_NERD, 35, 9, $8, $0, 255, 255, $b2, 3, TrainerSupernerdEric, $ffff
	person_event SPRITE_SUPER_NERD, 13, 10, $7, $0, 255, 255, $b2, 2, TrainerSupernerdTeru, $ffff
	person_event SPRITE_SUPER_NERD, 31, 7, $a, $0, 255, 255, $92, 2, TrainerPokemaniacIssac, $ffff
	person_event SPRITE_SUPER_NERD, 10, 6, $9, $0, 255, 255, $92, 3, TrainerPokemaniacDonald, $ffff
	person_event SPRITE_POKE_BALL, 29, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x7c306, $0672
	person_event SPRITE_GRAMPS, 15, 11, $8, $0, 255, 255, $b0, 0, GrampsScript_0x7c146, $0753
	person_event SPRITE_SUPER_NERD, 18, 11, $8, $0, 255, 255, $90, 0, SuperNerdScript_0x7c161, $0754
	person_event SPRITE_SUPER_NERD, 19, 11, $8, $0, 255, 255, $a0, 0, SuperNerdScript_0x7c20e, $0755
	person_event SPRITE_GRANNY, 25, 11, $8, $0, 255, 255, $b0, 0, GrannyScript_0x7c132, $0752
; 0x7c9e8

