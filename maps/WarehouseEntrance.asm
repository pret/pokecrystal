WarehouseEntrance_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 3

	; callbacks

	dbw 5, UnknownScript_0x7c043

	dbw 1, UnknownScript_0x7c076

	dbw 2, UnknownScript_0x7c082

UnknownScript_0x7c043:
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

UnknownScript_0x7c076:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse UnknownScript_0x7c07d
	return

UnknownScript_0x7c07d:
	changeblock $12, $6, $3d
	return

UnknownScript_0x7c082:
	checkcode VAR_WEEKDAY
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

UnknownScript_0x7c0a5:
	disappear $7
	checkmorn
	iffalse UnknownScript_0x7c0ae
	appear $7
UnknownScript_0x7c0ae:
	disappear $8
	disappear $9
	disappear $a
	return

UnknownScript_0x7c0b5:
	disappear $7
	appear $8
	disappear $9
	disappear $a
	return

UnknownScript_0x7c0be:
	disappear $7
	disappear $8
	appear $9
	disappear $a
	return

UnknownScript_0x7c0c7:
	disappear $7
	appear $8
	disappear $9
	disappear $a
	return

UnknownScript_0x7c0d0:
	disappear $7
	disappear $8
	appear $9
	disappear $a
	return

UnknownScript_0x7c0d9:
	disappear $7
	appear $8
	disappear $9
	appear $a
	return

TrainerSupernerdEric:
	; bit/flag number
	dw EVENT_BEAT_SUPER_NERD_ERIC

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

SupernerdEricScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7c36c
	closetext
	loadmovesprites
	end

TrainerSupernerdTeru:
	; bit/flag number
	dw EVENT_BEAT_SUPER_NERD_TERU

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

SupernerdTeruScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7c410
	closetext
	loadmovesprites
	end

TrainerPokemaniacIssac:
	; bit/flag number
	dw EVENT_BEAT_POKEMANIAC_ISSAC

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

PokemaniacIssacScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7c498
	closetext
	loadmovesprites
	end

TrainerPokemaniacDonald:
	; bit/flag number
	dw EVENT_BEAT_POKEMANIAC_DONALD

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

PokemaniacDonaldScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7c52f
	closetext
	loadmovesprites
	end

GrannyScript_0x7c132:
	loadfont
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, UnknownScript_0x7c140
	if_equal SATURDAY, UnknownScript_0x7c140
	jump UnknownScript_0x7c300

UnknownScript_0x7c140:
	pokemart $1, $0021
	loadmovesprites
	end

GrampsScript_0x7c146:
	loadfont
	checkflag ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	iftrue UnknownScript_0x7c300
	checkcode VAR_WEEKDAY
	if_equal MONDAY, UnknownScript_0x7c156
	jump UnknownScript_0x7c300

UnknownScript_0x7c156:
	checkmorn
	iffalse UnknownScript_0x7c300
	pokemart $2, $0000
	loadmovesprites
	end

SuperNerdScript_0x7c161:
	loadfont
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, UnknownScript_0x7c173
	if_equal THURSDAY, UnknownScript_0x7c173
	if_equal SATURDAY, UnknownScript_0x7c173
	jump UnknownScript_0x7c300

UnknownScript_0x7c173:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue UnknownScript_0x7c208
	special Function24ae8
	writetext UnknownText_0x7c5f9
	yesorno
	iffalse UnknownScript_0x7c1fc
	checkmoney $0, 500
	if_equal $2, UnknownScript_0x7c202
	writetext UnknownText_0x7c69a
	keeptextopen
	special Function7413
	if_equal $0, UnknownScript_0x7c1fc
	if_equal $1, UnknownScript_0x7c1fc
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	if_equal $2, UnknownScript_0x7c1a9
	if_equal $3, UnknownScript_0x7c1b5
	jump UnknownScript_0x7c1c1

UnknownScript_0x7c1a9:
	setevent EVENT_000
	clearevent EVENT_001
	clearevent EVENT_002
	jump UnknownScript_0x7c1cd

UnknownScript_0x7c1b5:
	clearevent EVENT_000
	setevent EVENT_001
	clearevent EVENT_002
	jump UnknownScript_0x7c1cd

UnknownScript_0x7c1c1:
	clearevent EVENT_000
	clearevent EVENT_001
	setevent EVENT_002
	jump UnknownScript_0x7c1cd

UnknownScript_0x7c1cd:
	takemoney $0, 500
	special Function24ae8
	writetext UnknownText_0x7c6b8
	closetext
	loadmovesprites
	special Function8c084
	playmusic MUSIC_HEAL
	pause 60
	special Function8c079
	special RestartMapMusic
	loadfont
	writetext UnknownText_0x7c6d8
	closetext
	checkevent EVENT_000
	iftrue UnknownScript_0x7c2bb
	checkevent EVENT_001
	iftrue UnknownScript_0x7c2c4
	jump UnknownScript_0x7c2cd

UnknownScript_0x7c1fc:
	writetext UnknownText_0x7c6ea
	closetext
	loadmovesprites
	end

UnknownScript_0x7c202:
	writetext UnknownText_0x7c709
	closetext
	loadmovesprites
	end

UnknownScript_0x7c208:
	writetext UnknownText_0x7c72b
	closetext
	loadmovesprites
	end

SuperNerdScript_0x7c20e:
	loadfont
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, UnknownScript_0x7c220
	if_equal WEDNESDAY, UnknownScript_0x7c220
	if_equal FRIDAY, UnknownScript_0x7c220
	jump UnknownScript_0x7c300

UnknownScript_0x7c220:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue UnknownScript_0x7c2b5
	special Function24ae8
	writetext UnknownText_0x7c75c
	yesorno
	iffalse UnknownScript_0x7c2a9
	checkmoney $0, 300
	if_equal $2, UnknownScript_0x7c2af
	writetext UnknownText_0x7c7f1
	keeptextopen
	special Function7418
	if_equal $0, UnknownScript_0x7c2a9
	if_equal $1, UnknownScript_0x7c2a9
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	if_equal $2, UnknownScript_0x7c256
	if_equal $3, UnknownScript_0x7c262
	jump UnknownScript_0x7c26e

UnknownScript_0x7c256:
	setevent EVENT_000
	clearevent EVENT_001
	clearevent EVENT_002
	jump UnknownScript_0x7c27a

UnknownScript_0x7c262:
	clearevent EVENT_000
	setevent EVENT_001
	clearevent EVENT_002
	jump UnknownScript_0x7c27a

UnknownScript_0x7c26e:
	clearevent EVENT_000
	clearevent EVENT_001
	setevent EVENT_002
	jump UnknownScript_0x7c27a

UnknownScript_0x7c27a:
	takemoney $0, 300
	special Function24ae8
	writetext UnknownText_0x7c80e
	closetext
	loadmovesprites
	special Function8c084
	playmusic MUSIC_HEAL
	pause 60
	special Function8c079
	special RestartMapMusic
	loadfont
	writetext UnknownText_0x7c82a
	closetext
	checkevent EVENT_000
	iftrue UnknownScript_0x7c2bb
	checkevent EVENT_001
	iftrue UnknownScript_0x7c2c4
	jump UnknownScript_0x7c2cd

UnknownScript_0x7c2a9:
	writetext UnknownText_0x7c842
	closetext
	loadmovesprites
	end

UnknownScript_0x7c2af:
	writetext UnknownText_0x7c85b
	closetext
	loadmovesprites
	end

UnknownScript_0x7c2b5:
	writetext UnknownText_0x7c87b
	closetext
	loadmovesprites
	end

UnknownScript_0x7c2bb:
	writetext UnknownText_0x7c8bf
	special Functionc472
	closetext
	loadmovesprites
	end

UnknownScript_0x7c2c4:
	writetext UnknownText_0x7c8dc
	special Functionc472
	closetext
	loadmovesprites
	end

UnknownScript_0x7c2cd:
	writetext UnknownText_0x7c8ee
	special Functionc472
	closetext
	loadmovesprites
	end

MapWarehouseEntranceSignpost0Script::
	loadfont
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue UnknownScript_0x7c2fa
	checkitem BASEMENT_KEY
	iftrue UnknownScript_0x7c2e8
	writetext UnknownText_0x7c5b0
	closetext
	loadmovesprites
	end

UnknownScript_0x7c2e8:
	playsound SFX_TRANSACTION
	writetext UnknownText_0x7c5d6
	closetext
	loadmovesprites
	changeblock $12, $6, $2e
	reloadmappart
	loadmovesprites
	setevent EVENT_USED_BASEMENT_KEY
	end

UnknownScript_0x7c2fa:
	writetext UnknownText_0x7c5c3
	closetext
	loadmovesprites
	end

UnknownScript_0x7c300:
	writetext UnknownText_0x7c904
	closetext
	loadmovesprites
	end

ItemFragment_0x7c306:
	db COIN_CASE, 1

MapWarehouseEntranceSignpost1Script:
	jumptext UnknownText_0x7c91a

MapWarehouseEntranceSignpostItem2:
	dw $008b
	db PARLYZ_HEAL
	

MapWarehouseEntranceSignpostItem3:
	dw $008c
	db SUPER_POTION
	

MapWarehouseEntranceSignpostItem4:
	dw $008d
	db ANTIDOTE
	

SupernerdEricSeenText:
	text "I got booted out"
	line "of the GAME COR-"
	cont "NER."

	para "I was trying to"
	line "cheat using my"
	cont "#MON…"
	done

SupernerdEricBeatenText:
	text "…Grumble…"
	done

UnknownText_0x7c36c:
	text "I guess I have to"
	line "do things fair and"
	cont "square…"
	done

SupernerdTeruSeenText:
	text "Do you consider"
	line "type alignments in"
	cont "battle?"

	para "If you know your"
	line "type advantages,"

	para "you'll do better"
	line "in battle."
	done

SupernerdTeruBeatenText:
	text "Ow, ow, ow!"
	done

UnknownText_0x7c410:
	text "I know my #MON"
	line "type alignments."

	para "But I only use one"
	line "type of #MON."
	done

PokemaniacIssacSeenText:
	text "My #MON just"
	line "got a haircut!"

	para "I'll show you how"
	line "strong it is!"
	done

PokemaniacIssacBeatenText:
	text "Aiyeeee!"
	done

UnknownText_0x7c498:
	text "Your #MON will"
	line "like you more if"

	para "you give them"
	line "haircuts."
	done

PokemaniacDonaldSeenText:
	text "I think you have"
	line "some rare #MON"
	cont "with you."

	para "Let me see them!"
	done

PokemaniacDonaldBeatenText:
	text "Gaah! I lost!"
	line "That makes me mad!"
	done

UnknownText_0x7c52f:
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

UnknownText_0x7c5b0:
	text "The door's locked…"
	done

UnknownText_0x7c5c3:
	text "The door is open."
	done

UnknownText_0x7c5d6:
	text "The BASEMENT KEY"
	line "opened the door."
	done

UnknownText_0x7c5f9:
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

UnknownText_0x7c69a:
	text "Which #MON"
	line "should I work on?"
	done

UnknownText_0x7c6b8:
	text "OK! Watch it"
	line "become beautiful!"
	done

UnknownText_0x7c6d8:
	text "There! All done!"
	done

UnknownText_0x7c6ea:
	text "Is that right?"
	line "That's a shame!"
	done

UnknownText_0x7c709:
	text "You'll need more"
	line "money than that."
	done

UnknownText_0x7c72b:
	text "I do only one"
	line "haircut a day. I'm"
	cont "done for today."
	done

UnknownText_0x7c75c:
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

UnknownText_0x7c7f1:
	text "OK, which #MON"
	line "should I do?"
	done

UnknownText_0x7c80e:
	text "OK! I'll make it"
	line "look cool!"
	done

UnknownText_0x7c82a:
	text "There we go!"
	line "All done!"
	done

UnknownText_0x7c842:
	text "No? "
	line "How disappointing!"
	done

UnknownText_0x7c85b:
	text "You're a little"
	line "short on funds."
	done

UnknownText_0x7c87b:
	text "I can do only one"
	line "haircut a day."

	para "Sorry, but I'm all"
	line "done for today."
	done

UnknownText_0x7c8bf:
	text_from_ram StringBuffer3
	text " looks a"
	line "little happier."
	done

UnknownText_0x7c8dc:
	text_from_ram StringBuffer3
	text " looks"
	line "happy."
	done

UnknownText_0x7c8ee:
	text_from_ram StringBuffer3
	text " looks"
	line "delighted!"
	done

UnknownText_0x7c904:
	text "We're not open"
	line "today."
	done

UnknownText_0x7c91a:
	text "NO ENTRY BEYOND"
	line "THIS POINT"
	done

WarehouseEntrance_MapEventHeader:
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
	person_event SPRITE_SUPER_NERD, 35, 9, $8, $0, 255, 255, $b2, 3, TrainerSupernerdEric, -1
	person_event SPRITE_SUPER_NERD, 13, 10, $7, $0, 255, 255, $b2, 2, TrainerSupernerdTeru, -1
	person_event SPRITE_SUPER_NERD, 31, 7, $a, $0, 255, 255, $92, 2, TrainerPokemaniacIssac, -1
	person_event SPRITE_SUPER_NERD, 10, 6, $9, $0, 255, 255, $92, 3, TrainerPokemaniacDonald, -1
	person_event SPRITE_POKE_BALL, 29, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x7c306, EVENT_672
	person_event SPRITE_GRAMPS, 15, 11, $8, $0, 255, 255, $b0, 0, GrampsScript_0x7c146, EVENT_753
	person_event SPRITE_SUPER_NERD, 18, 11, $8, $0, 255, 255, $90, 0, SuperNerdScript_0x7c161, EVENT_754
	person_event SPRITE_SUPER_NERD, 19, 11, $8, $0, 255, 255, $a0, 0, SuperNerdScript_0x7c20e, EVENT_755
	person_event SPRITE_GRANNY, 25, 11, $8, $0, 255, 255, $b0, 0, GrannyScript_0x7c132, EVENT_752
