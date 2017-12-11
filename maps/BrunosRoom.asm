const_value set 2
	const BRUNOSROOM_BRUNO

BrunosRoom_MapScriptHeader:
.MapTriggers:
	db 2
	maptrigger .LockDoor
	maptrigger .DummyTrigger

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_TILES, .BrunosRoomDoors

.LockDoor:
	priorityjump .BrunosDoorLocksBehindYou
	end

.DummyTrigger:
	end

.BrunosRoomDoors:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepDoorClosed
	changeblock $4, $e, $2a
.KeepDoorClosed:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .OpenDoor
	changeblock $4, $2, $16
.OpenDoor:
	return

.BrunosDoorLocksBehindYou:
	applymovement PLAYER, MovementData_0x1809f9
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	closetext
	dotrigger $1
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue UnknownScript_0x1809f3
	writetext BrunoScript_BrunoBeforeText
	waitbutton
	closetext
	winlosstext BrunoScript_BrunoBeatenText, 0
	loadtrainer BRUNO, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
	opentext
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

UnknownScript_0x1809f3:
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	end

MovementData_0x1809f9:
	step UP
	step UP
	step UP
	step UP
	step_end

BrunoScript_BrunoBeforeText:
	text "I am BRUNO of the"
	line "ELITE FOUR."

	para "I always train to"
	line "the extreme be-"
	cont "cause I believe in"
	cont "our potential."

	para "That is how we"
	line "became strong."

	para "Can you withstand"
	line "our power?"

	para "Hm? I see no fear"
	line "in you. You look"

	para "determined. Per-"
	line "fect for battle!"

	para "Ready, <PLAYER>?"
	line "You will bow down"

	para "to our overwhelm-"
	line "ing power!"

	para "Hoo hah!"
	done

BrunoScript_BrunoBeatenText:
	text "Why? How could we"
	line "lose?"
	done

BrunoScript_BrunoDefeatText:
	text "Having lost, I"
	line "have no right to"
	cont "say anything…"

	para "Go face your next"
	line "challenge!"
	done

BrunosRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $11, $4, 3, KOGAS_ROOM
	warp_def $11, $5, 4, KOGAS_ROOM
	warp_def $2, $4, 1, KARENS_ROOM
	warp_def $2, $5, 2, KARENS_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_BRUNO, 7, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, BrunoScript_Battle, -1
