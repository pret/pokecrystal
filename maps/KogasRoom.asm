const_value set 2
	const KOGASROOM_KOGA

KogasRoom_MapScriptHeader:
.SceneScripts:
	db 2
	scene_script .LockDoor
	scene_script .DummyScene

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_TILES, .KogasRoomDoors

.LockDoor:
	priorityjump .KogasDoorLocksBehindYou
	end

.DummyScene:
	end

.KogasRoomDoors:
	checkevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepDoorsClosed
	changeblock 4, 14, $2a
.KeepDoorsClosed:
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse .OpenDoors
	changeblock 4, 2, $16
.OpenDoors:
	return

.KogasDoorLocksBehindYou:
	applymovement PLAYER, MovementData_0x18078e
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a
	reloadmappart
	closetext
	setscene 1
	setevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KogaScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue UnknownScript_0x180788
	writetext KogaScript_KogaBeforeText
	waitbutton
	closetext
	winlosstext KogaScript_KogaBeatenText, 0
	loadtrainer KOGA, KOGA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	opentext
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16
	reloadmappart
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

UnknownScript_0x180788:
	writetext KogaScript_KogaDefeatText
	waitbutton
	closetext
	end

MovementData_0x18078e:
	step UP
	step UP
	step UP
	step UP
	step_end

KogaScript_KogaBeforeText:
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

KogaScript_KogaBeatenText:
	text "Ah!"
	line "You have proven"
	cont "your worth!"
	done

KogaScript_KogaDefeatText:
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
	warp_def 4, 17, 2, WILLS_ROOM
	warp_def 5, 17, 3, WILLS_ROOM
	warp_def 4, 2, 1, BRUNOS_ROOM
	warp_def 5, 2, 2, BRUNOS_ROOM

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 5, 7, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, KogaScript_Battle, -1
