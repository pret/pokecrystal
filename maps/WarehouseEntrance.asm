WarehouseEntrance_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 3

	; callbacks

	dbw 5, .ResetSwitches

	dbw 1, .CheckBasementKey

	dbw 2, .CheckDayOfWeek

.ResetSwitches:
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

.CheckBasementKey:
	checkevent EVENT_USED_BASEMENT_KEY
	iffalse .LockBasementDoor
	return

.LockBasementDoor:
	changeblock $12, $6, $3d
	return

.CheckDayOfWeek:
	checkcode VAR_WEEKDAY
	if_equal MONDAY, .Monday
	if_equal TUESDAY, .Tuesday
	if_equal WEDNESDAY, .Wednesday
	if_equal THURSDAY, .Thursday
	if_equal FRIDAY, .Friday
	if_equal SATURDAY, .Saturday

.Sunday:
	disappear $7
	disappear $8
	appear $9
	appear $a
	return

.Monday:
	disappear $7
	checkmorn
	iffalse .NotMondayMorning
	appear $7
.NotMondayMorning:
	disappear $8
	disappear $9
	disappear $a
	return

.Tuesday:
	disappear $7
	appear $8
	disappear $9
	disappear $a
	return

.Wednesday:
	disappear $7
	disappear $8
	appear $9
	disappear $a
	return

.Thursday:
	disappear $7
	appear $8
	disappear $9
	disappear $a
	return

.Friday:
	disappear $7
	disappear $8
	appear $9
	disappear $a
	return

.Saturday:
	disappear $7
	appear $8
	disappear $9
	appear $a
	return

TrainerSupernerdEric:
	trainer EVENT_BEAT_SUPER_NERD_ERIC, SUPER_NERD, ERIC, SupernerdEricSeenText, SupernerdEricBeatenText, $0000, SupernerdEricScript

SupernerdEricScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7c36c
	closetext
	loadmovesprites
	end

TrainerSupernerdTeru:
	trainer EVENT_BEAT_SUPER_NERD_TERU, SUPER_NERD, TERU, SupernerdTeruSeenText, SupernerdTeruBeatenText, $0000, SupernerdTeruScript

SupernerdTeruScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7c410
	closetext
	loadmovesprites
	end

TrainerPokemaniacIssac:
	trainer EVENT_BEAT_POKEMANIAC_ISSAC, POKEMANIAC, ISSAC, PokemaniacIssacSeenText, PokemaniacIssacBeatenText, $0000, PokemaniacIssacScript

PokemaniacIssacScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7c498
	closetext
	loadmovesprites
	end

TrainerPokemaniacDonald:
	trainer EVENT_BEAT_POKEMANIAC_DONALD, POKEMANIAC, DONALD, PokemaniacDonaldSeenText, PokemaniacDonaldBeatenText, $0000, PokemaniacDonaldScript

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
	if_equal SUNDAY, .Open
	if_equal SATURDAY, .Open
	jump WarehouseEntranceScript_ShopClosed

.Open:
	pokemart $1, $0021
	loadmovesprites
	end

GrampsScript_0x7c146:
	loadfont
	checkflag ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	iftrue WarehouseEntranceScript_ShopClosed
	checkcode VAR_WEEKDAY
	if_equal MONDAY, .CheckMorn
	jump WarehouseEntranceScript_ShopClosed

.CheckMorn:
	checkmorn
	iffalse WarehouseEntranceScript_ShopClosed
	pokemart $2, $0000
	loadmovesprites
	end

OlderHaircutBrotherScript:
	loadfont
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, .DoHaircut
	if_equal THURSDAY, .DoHaircut
	if_equal SATURDAY, .DoHaircut
	jump WarehouseEntranceScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special Function24ae8
	writetext UnknownText_0x7c5f9
	yesorno
	iffalse .Refused
	checkmoney $0, 500
	if_equal $2, .NotEnoughMoney
	writetext UnknownText_0x7c69a
	keeptextopen
	special Function7413
	if_equal $0, .Refused
	if_equal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	if_equal $2, .two
	if_equal $3, .three
	jump .else

.two:
	setevent EVENT_GAVE_KURT_APRICORNS
	clearevent EVENT_RECEIVED_BALLS_FROM_KURT
	clearevent EVENT_DRAGON_SHRINE_QUESTION_2
	jump .then

.three:
	clearevent EVENT_GAVE_KURT_APRICORNS
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	clearevent EVENT_DRAGON_SHRINE_QUESTION_2
	jump .then

.else:
	clearevent EVENT_GAVE_KURT_APRICORNS
	clearevent EVENT_RECEIVED_BALLS_FROM_KURT
	setevent EVENT_DRAGON_SHRINE_QUESTION_2
	jump .then

.then:
	takemoney $0, 500
	special Function24ae8
	writetext UnknownText_0x7c6b8
	closetext
	loadmovesprites
	special FadeBlackBGMap
	playmusic MUSIC_HEAL
	pause 60
	special FadeInBGMap
	special RestartMapMusic
	loadfont
	writetext UnknownText_0x7c6d8
	closetext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x7c2bb
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue UnknownScript_0x7c2c4
	jump UnknownScript_0x7c2cd

.Refused:
	writetext UnknownText_0x7c6ea
	closetext
	loadmovesprites
	end

.NotEnoughMoney:
	writetext UnknownText_0x7c709
	closetext
	loadmovesprites
	end

.AlreadyGotHaircut:
	writetext UnknownText_0x7c72b
	closetext
	loadmovesprites
	end

YoungerHaircutBrotherScript:
	loadfont
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, .DoHaircut
	if_equal WEDNESDAY, .DoHaircut
	if_equal FRIDAY, .DoHaircut
	jump WarehouseEntranceScript_ShopClosed

.DoHaircut:
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	special Function24ae8
	writetext UnknownText_0x7c75c
	yesorno
	iffalse .Refused
	checkmoney $0, 300
	if_equal $2, .NotEnoughMoney
	writetext UnknownText_0x7c7f1
	keeptextopen
	special Function7418
	if_equal $0, .Refused
	if_equal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	if_equal $2, .two
	if_equal $3, .three
	jump .else

.two:
	setevent EVENT_GAVE_KURT_APRICORNS
	clearevent EVENT_RECEIVED_BALLS_FROM_KURT
	clearevent EVENT_DRAGON_SHRINE_QUESTION_2
	jump .then

.three:
	clearevent EVENT_GAVE_KURT_APRICORNS
	setevent EVENT_RECEIVED_BALLS_FROM_KURT
	clearevent EVENT_DRAGON_SHRINE_QUESTION_2
	jump .then

.else:
	clearevent EVENT_GAVE_KURT_APRICORNS
	clearevent EVENT_RECEIVED_BALLS_FROM_KURT
	setevent EVENT_DRAGON_SHRINE_QUESTION_2
	jump .then

.then:
	takemoney $0, 300
	special Function24ae8
	writetext UnknownText_0x7c80e
	closetext
	loadmovesprites
	special FadeBlackBGMap
	playmusic MUSIC_HEAL
	pause 60
	special FadeInBGMap
	special RestartMapMusic
	loadfont
	writetext UnknownText_0x7c82a
	closetext
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue UnknownScript_0x7c2bb
	checkevent EVENT_RECEIVED_BALLS_FROM_KURT
	iftrue UnknownScript_0x7c2c4
	jump UnknownScript_0x7c2cd

.Refused:
	writetext UnknownText_0x7c842
	closetext
	loadmovesprites
	end

.NotEnoughMoney:
	writetext UnknownText_0x7c85b
	closetext
	loadmovesprites
	end

.AlreadyGotHaircut:
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

BasementDoorScript::
	loadfont
	checkevent EVENT_USED_BASEMENT_KEY
	iftrue .Open
	checkitem BASEMENT_KEY
	iftrue .Unlock
	writetext UnknownText_0x7c5b0
	closetext
	loadmovesprites
	end

.Unlock:
	playsound SFX_TRANSACTION
	writetext UnknownText_0x7c5d6
	closetext
	loadmovesprites
	changeblock $12, $6, $2e
	reloadmappart
	loadmovesprites
	setevent EVENT_USED_BASEMENT_KEY
	end

.Open:
	writetext UnknownText_0x7c5c3
	closetext
	loadmovesprites
	end

WarehouseEntranceScript_ShopClosed:
	writetext UnknownText_0x7c904
	closetext
	loadmovesprites
	end

ItemFragment_0x7c306:
	db COIN_CASE, 1

MapWarehouseEntranceSignpost1Script:
	jumptext UnknownText_0x7c91a

MapWarehouseEntranceSignpostItem2:
	dwb EVENT_WAREHOUSE_ENTRANCE_HIDDEN_PARLYZ_HEAL, PARLYZ_HEAL
	

MapWarehouseEntranceSignpostItem3:
	dwb EVENT_WAREHOUSE_ENTRANCE_HIDDEN_SUPER_POTION, SUPER_POTION
	

MapWarehouseEntranceSignpostItem4:
	dwb EVENT_WAREHOUSE_ENTRANCE_HIDDEN_ANTIDOTE, ANTIDOTE
	

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

.Warps:
	db 6
	warp_def $2, $3, 7, GROUP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, MAP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def $22, $3, 4, GROUP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, MAP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES
	warp_def $6, $12, 4, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $1f, $15, 3, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $1f, $16, 3, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $1b, $16, 1, GROUP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, MAP_UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES

.XYTriggers:
	db 0

.Signposts:
	db 5
	signpost 6, 18, SIGNPOST_READ, BasementDoorScript
	signpost 6, 19, SIGNPOST_READ, MapWarehouseEntranceSignpost1Script
	signpost 13, 6, SIGNPOST_ITEM, MapWarehouseEntranceSignpostItem2
	signpost 18, 4, SIGNPOST_ITEM, MapWarehouseEntranceSignpostItem3
	signpost 8, 17, SIGNPOST_ITEM, MapWarehouseEntranceSignpostItem4

.PersonEvents:
	db 9
	person_event SPRITE_SUPER_NERD, 35, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerSupernerdEric, -1
	person_event SPRITE_SUPER_NERD, 13, 10, OW_UP | $3, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 2, TrainerSupernerdTeru, -1
	person_event SPRITE_SUPER_NERD, 31, 7, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 2, TrainerPokemaniacIssac, -1
	person_event SPRITE_SUPER_NERD, 10, 6, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerPokemaniacDonald, -1
	person_event SPRITE_POKE_BALL, 29, 11, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7c306, EVENT_WAREHOUSE_ENTRANCE_COIN_CASE
	person_event SPRITE_GRAMPS, 15, 11, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, GrampsScript_0x7c146, EVENT_WAREHOUSE_ENTRANCE_GRAMPS
	person_event SPRITE_SUPER_NERD, 18, 11, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, OlderHaircutBrotherScript, EVENT_WAREHOUSE_ENTRANCE_OLDER_HAIRCUT_BROTHER
	person_event SPRITE_SUPER_NERD, 19, 11, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, YoungerHaircutBrotherScript, EVENT_WAREHOUSE_ENTRANCE_YOUNGER_HAIRCUT_BROTHER
	person_event SPRITE_GRANNY, 25, 11, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, GrannyScript_0x7c132, EVENT_WAREHOUSE_ENTRANCE_GRANNY
