const_value set 2
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .Trigger0, 0
	dw .Trigger1, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, .CheckDoor

.Trigger0:
	priorityjump LancesRoom_PlayerWalksIn_DoorsCloseBehind
	end

.Trigger1:
	end

.CheckDoor:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .LanceEntranceOpen
	changeblock $4, $16, $34
.LanceEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .LanceExitClosed
	changeblock $4, $0, $b
.LanceExitClosed:
	return

LancesRoom_PlayerWalksIn_DoorsCloseBehind:
	applymovement PLAYER, LancesRoom_PlayerWalksInMovementData
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $16, $34
	reloadmappart
	closetext
	dotrigger $1
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachLanceFromLeft:
	special Special_FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	jump LanceScript_0x180e7b

Script_ApproachLanceFromRight:
	special Special_FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromRight
LanceScript_0x180e7b:
	spriteface LANCESROOM_LANCE, LEFT
	opentext
	writetext LanceBattleIntroText
	waitbutton
	closetext
	winlosstext LanceBattleWinText, 0
	setlasttalked LANCESROOM_LANCE
	loadtrainer CHAMPION, LANCE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext LanceBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $4, $0, $b
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, $10
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	spriteface LANCESROOM_LANCE, DOWN
	pause 10
	spriteface PLAYER, DOWN
	appear LANCESROOM_MARY
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRushesIn
	opentext
	writetext UnknownText_0x1811dd
	waitbutton
	closetext
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksIn
	follow LANCESROOM_MARY, LANCESROOM_OAK
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryYieldsToOak
	stopfollow
	spriteface LANCESROOM_OAK, UP
	spriteface LANCESROOM_LANCE, LEFT
	opentext
	writetext UnknownText_0x18121b
	waitbutton
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryInterviewChampion
	spriteface PLAYER, LEFT
	opentext
	writetext UnknownText_0x18134b
	waitbutton
	closetext
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	spriteface PLAYER, UP
	opentext
	writetext UnknownText_0x18137b
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	spriteface LANCESROOM_MARY, UP
	spriteface LANCESROOM_OAK, UP
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryTriesToFollow
	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext
	writetext UnknownText_0x1813c5
	pause 30
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRunsBackAndForth
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, $4, $d
	end

LancesRoom_PlayerWalksInMovementData:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachLanceFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachLanceFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryRushesIn:
	big_step UP
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step_end

LancesRoomMovementData_MaryYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryInterviewChampion:
	big_step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

LancesRoomMovementData_LanceLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LancesRoomMovementData_MaryTriesToFollow:
	step UP
	step RIGHT
	turn_head UP
	step_end

LancesRoomMovementData_MaryRunsBackAndForth:
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

LanceBattleIntroText:
	text "LANCE: I've been"
	line "waiting for you."

	para "<PLAY_G>!"

	para "I knew that you,"
	line "with your skills,"

	para "would eventually"
	line "reach me here."

	para "There's no need"
	line "for words now."

	para "We will battle to"
	line "determine who is"

	para "the stronger of"
	line "the two of us."

	para "As the most power-"
	line "ful trainer and as"

	para "the #MON LEAGUE"
	line "CHAMPION…"

	para "I, LANCE the drag-"
	line "on master, accept"
	cont "your challenge!"
	done

LanceBattleWinText:
	text "…It's over."

	para "But it's an odd"
	line "feeling."

	para "I'm not angry that"
	line "I lost. In fact, I"
	cont "feel happy."

	para "Happy that I"
	line "witnessed the rise"

	para "of a great new"
	line "CHAMPION!"
	done

LanceBattleAfterText:
	text "…Whew."

	para "You have become"
	line "truly powerful,"
	cont "<PLAY_G>."

	para "Your #MON have"
	line "responded to your"

	para "strong and up-"
	line "standing nature."

	para "As a trainer, you"
	line "will continue to"

	para "grow strong with"
	line "your #MON."
	done

UnknownText_0x1811dd:
	text "MARY: Oh, no!"
	line "It's all over!"

	para "PROF.OAK, if you"
	line "weren't so slow…"
	done

UnknownText_0x18121b:
	text "PROF.OAK: Ah,"
	line "<PLAY_G>!"

	para "It's been a long"
	line "while."

	para "You certainly look"
	line "more impressive."

	para "Your conquest of"
	line "the LEAGUE is just"
	cont "fantastic!"

	para "Your dedication,"
	line "trust and love for"

	para "your #MON made"
	line "this happen."

	para "Your #MON were"
	line "outstanding too."

	para "Because they be-"
	line "lieved in you as a"

	para "trainer, they per-"
	line "severed."

	para "Congratulations,"
	line "<PLAY_G>!"
	done

UnknownText_0x18134b:
	text "MARY: Let's inter-"
	line "view the brand new"
	cont "CHAMPION!"
	done

UnknownText_0x18137b:
	text "LANCE: This is"
	line "getting to be a"
	cont "bit too noisy…"

	para "<PLAY_G>, could you"
	line "come with me?"
	done

UnknownText_0x1813c5:
	text "MARY: Oh, wait!"
	line "We haven't done"
	cont "the interview!"
	done

LancesRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $17, $4, 3, KARENS_ROOM
	warp_def $17, $5, 4, KARENS_ROOM
	warp_def $1, $4, 1, HALL_OF_FAME
	warp_def $1, $5, 2, HALL_OF_FAME

.XYTriggers:
	db 2
	xy_trigger 1, $5, $4, $0, Script_ApproachLanceFromLeft, $0, $0
	xy_trigger 1, $5, $5, $0, Script_ApproachLanceFromRight, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_LANCE, 3, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LanceScript_0x180e7b, -1
	person_event SPRITE_TEACHER, 7, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	person_event SPRITE_OAK, 7, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
