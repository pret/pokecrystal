IndigoPlateauPokeCenter1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x180009, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 5, UnknownScript_0x18000a

UnknownScript_0x180009:
	end

UnknownScript_0x18000a:
	domaptrigger GROUP_WILLS_ROOM, MAP_WILLS_ROOM, $0
	domaptrigger GROUP_KOGAS_ROOM, MAP_KOGAS_ROOM, $0
	domaptrigger GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM, $0
	domaptrigger GROUP_KARENS_ROOM, MAP_KARENS_ROOM, $0
	domaptrigger GROUP_LANCES_ROOM, MAP_LANCES_ROOM, $0
	domaptrigger GROUP_HALL_OF_FAME, MAP_HALL_OF_FAME, $0
	clearevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_WILLS_ROOM_EXIT_OPEN
	clearevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KOGAS_ROOM_EXIT_OPEN
	clearevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	clearevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KARENS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_WILL
	clearevent EVENT_BEAT_ELITE_4_KOGA
	clearevent EVENT_BEAT_ELITE_4_BRUNO
	clearevent EVENT_BEAT_ELITE_4_KAREN
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	return

UnknownScript_0x180053:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse UnknownScript_0x18012b
	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	iftrue UnknownScript_0x18012b
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, UnknownScript_0x18012b
	if_equal TUESDAY, UnknownScript_0x18012b
	if_equal THURSDAY, UnknownScript_0x18012b
	if_equal FRIDAY, UnknownScript_0x18012b
	if_equal SATURDAY, UnknownScript_0x18012b
	moveperson $5, $11, $9
	appear $5
	spriteface $0, DOWN
	showemote EMOTE_SHOCK, $0, 15
	special Functionc48f
	pause 15
	applymovement $5, MovementData_0x180164
	playmusic MUSIC_RIVAL_ENCOUNTER
	spriteface $0, RIGHT
	jump UnknownScript_0x1800ce

UnknownScript_0x180094:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse UnknownScript_0x18012b
	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	iftrue UnknownScript_0x18012b
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, UnknownScript_0x18012b
	if_equal TUESDAY, UnknownScript_0x18012b
	if_equal THURSDAY, UnknownScript_0x18012b
	if_equal FRIDAY, UnknownScript_0x18012b
	if_equal SATURDAY, UnknownScript_0x18012b
	appear $5
	spriteface $0, DOWN
	showemote EMOTE_SHOCK, $0, 15
	special Functionc48f
	pause 15
	applymovement $5, MovementData_0x18016b
	playmusic MUSIC_RIVAL_ENCOUNTER
	spriteface $0, LEFT
UnknownScript_0x1800ce:
	loadfont
	writetext UnknownText_0x1801f5
	closetext
	loadmovesprites
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x1800f3
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x180103
	winlosstext UnknownText_0x180295, UnknownText_0x1802fd
	setlasttalked $5
	loadtrainer RIVAL2, 6
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x180113

UnknownScript_0x1800f3:
	winlosstext UnknownText_0x180295, UnknownText_0x1802fd
	setlasttalked $5
	loadtrainer RIVAL2, 4
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x180113

UnknownScript_0x180103:
	winlosstext UnknownText_0x180295, UnknownText_0x1802fd
	setlasttalked $5
	loadtrainer RIVAL2, 5
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x180113

UnknownScript_0x180113:
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x1802a4
	closetext
	loadmovesprites
	spriteface $0, DOWN
	applymovement $5, MovementData_0x180172
	disappear $5
	dotrigger $0
	playmapmusic
	setflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
UnknownScript_0x18012b:
	end

NurseScript_0x18012c:
	jumpstd pokecenternurse

ClerkScript_0x18012f:
	loadfont
	pokemart $0, $0020
	loadmovesprites
	end

CooltrainerMScript_0x180136:
	jumptextfaceplayer UnknownText_0x180178

TeleportGuyScript:
	faceplayer
	loadfont
	writetext TeleportGuyText1
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	closetext
	loadmovesprites
	playsound SFX_WARP_TO
	special FadeBlackBGMap
	waitbutton
	warp GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN, $d, $6
	end

.No
	writetext TeleportGuyNoText
	closetext
	loadmovesprites
	end

AbraScript:
	loadfont
	writetext AbraText
	cry ABRA
	closetext
	loadmovesprites
	end

MovementData_0x180164:
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end

MovementData_0x18016b:
	step_up
	step_up
	step_up
	step_up
	step_up
	turn_head_right
	step_end

MovementData_0x180172:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

UnknownText_0x180178:
	text "At the #MON"
	line "LEAGUE, you'll get"

	para "tested by the"
	line "ELITE FOUR."

	para "You have to beat"
	line "them all. If you"

	para "lose, you have to"
	line "start all over!"
	done

UnknownText_0x1801f5:
	text "Hold it."

	para "You're going to"
	line "take the #MON"

	para "LEAGUE challenge"
	line "now?"

	para "That's not going"
	line "to happen."

	para "My super-well-"
	line "trained #MON"

	para "are going to pound"
	line "you."

	para "<PLAYER>!"
	line "I challenge you!"
	done

UnknownText_0x180295:
	text "…"

	para "OK--I lost…"
	done

UnknownText_0x1802a4:
	text "…Darn… I still"
	line "can't win…"

	para "I… I have to think"
	line "more about my"
	cont "#MON…"

	para "Humph! Try not to"
	line "lose!"
	done

UnknownText_0x1802fd:
	text "…"

	para "Whew…"
	line "With my partners,"

	para "I'm going to be"
	line "the CHAMPION!"
	done

TeleportGuyText1:
	text "Ah! You're chal-"
	line "lenging the ELITE"

	para "FOUR? Are you sure"
	line "you're ready?"

	para "If you need to"
	line "train some more,"

	para "my ABRA can help"
	line "you."

	para "It can TELEPORT"
	line "you home."

	para "Would you like to"
	line "go home now?"
	done

TeleportGuyYesText:
	text "OK, OK. Picture"
	line "your house in your"
	cont "mind…"
	done

TeleportGuyNoText:
	text "OK, OK. The best"
	line "of luck to you!"
	done

AbraText:
	text "ABRA: Aabra…"
	done

IndigoPlateauPokeCenter1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $d, $5, 1, GROUP_ROUTE_23, MAP_ROUTE_23
	warp_def $d, $6, 2, GROUP_ROUTE_23, MAP_ROUTE_23
	warp_def $d, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $3, $e, 1, GROUP_WILLS_ROOM, MAP_WILLS_ROOM

.XYTriggers:
	db 2
	xy_trigger 0, $4, $10, $0, UnknownScript_0x180053, $0, $0
	xy_trigger 0, $4, $11, $0, UnknownScript_0x180094, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 6
	person_event SPRITE_NURSE, 11, 7, OW_UP | $2, $0, -1, -1, $0, 0, NurseScript_0x18012c, -1
	person_event SPRITE_CLERK, 11, 15, OW_UP | $2, $0, -1, -1, $0, 0, ClerkScript_0x18012f, -1
	person_event SPRITE_COOLTRAINER_M, 15, 15, OW_DOWN | $2, $22, -1, -1, $0, 0, CooltrainerMScript_0x180136, -1
	person_event SPRITE_SILVER, 13, 20, OW_UP | $3, $0, -1, -1, $0, 0, ObjectEvent, EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	person_event SPRITE_GRAMPS, 13, 5, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	person_event SPRITE_JYNX, 13, 4, OW_UP | $12, $0, -1, -1, (PAL_OW_BROWN << 4) | $80, 0, AbraScript, EVENT_TELEPORT_GUY
