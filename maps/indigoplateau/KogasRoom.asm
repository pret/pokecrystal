const_value set 2
	const KOGASROOM_KOGA

KogasRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x180728, 0
	dw UnknownScript_0x18072c, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, UnknownScript_0x18072d

UnknownScript_0x180728:
	priorityjump UnknownScript_0x180742
	end

UnknownScript_0x18072c:
	end

UnknownScript_0x18072d:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x180737
	changeblock $4, $e, $2a
UnknownScript_0x180737:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x180741
	changeblock $4, $2, $16
UnknownScript_0x180741:
	return

UnknownScript_0x180742:
	applymovement PLAYER, MovementData_0x18078e
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	closetext
	dotrigger $1
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogaScript_0x18075a:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue UnknownScript_0x180788
	writetext UnknownText_0x180793
	waitbutton
	closetext
	winlosstext UnknownText_0x1808a9, 0
	loadtrainer KOGA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	writetext UnknownText_0x1808ca
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

UnknownScript_0x180788:
	writetext UnknownText_0x1808ca
	waitbutton
	closetext
	end

MovementData_0x18078e:
	step UP
	step UP
	step UP
	step UP
	step_end

UnknownText_0x180793:
	text "Fwahahahaha!"

	para "I am KOGA of the"
	line "ELITE FOUR."

	para "I live in shadows,"
	line "a ninja!"

	para "My intricate style"
	line "will confound and"
	cont "destroy you!"

	para "Confusion, sleep,"
	line "poison…"

	para "Prepare to be the"
	line "victim of my sin-"
	cont "ister technique!"

	para "Fwahahahaha!"

	para "#MON is not"
	line "merely about brute"

	para "force--you shall"
	line "see soon enough!"
	done

UnknownText_0x1808a9:
	text "Ah!"
	line "You have proven"
	cont "your worth!"
	done

UnknownText_0x1808ca:
	text "I subjected you to"
	line "everything I could"
	cont "muster."

	para "But my efforts"
	line "failed. I must"
	cont "hone my skills."

	para "Go on to the next"
	line "room, and put your"
	cont "abilities to test!"
	done

KogasRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $11, $4, 2, WILLS_ROOM
	warp_def $11, $5, 3, WILLS_ROOM
	warp_def $2, $4, 1, BRUNOS_ROOM
	warp_def $2, $5, 2, BRUNOS_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_KOGA, 7, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KogaScript_0x18075a, -1
