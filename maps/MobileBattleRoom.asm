MobileBattleRoom_MapScripts:
	def_scene_scripts
	scene_script MobileBattleRoomInitializeScene, SCENE_MOBILEBATTLEROOM_INITIALIZE
	scene_script MobileBattleRoomNoopScene,       SCENE_MOBILEBATTLEROOM_NOOP

	def_callbacks

MobileBattleRoomInitializeScene:
	sdefer MobileBattleRoomInitializeAndPreparePokecenter2FScript
	end

MobileBattleRoomNoopScene:
	end

MobileBattleRoomInitializeAndPreparePokecenter2FScript:
	setscene SCENE_MOBILEBATTLEROOM_NOOP
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_MOBILE_BATTLE_ROOM
	end

MobileBattleRoomConsoleScript:
	refreshscreen
	special Function1037c2
	ifequal $1, .one
	special Function1037eb
	iffalse .false
	ifequal $1, .one_
	ifequal $2, .two_
	sjump .false

.one_
	writetext MobileBattleRoom_HealText
	pause 20
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	special LoadMapPalettes
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	refreshscreen
.two_
	special StubbedTrainerRankings_Healings
	special HealParty
	special Function10383c
	iftrue .false
.one
	special Function10387b
	writetext MobileBattleRoom_EstablishingCommsText
	waitbutton
	reloadmappart
	special Function101225
.false
	closetext
	end

MobileBattleRoom_EstablishingCommsText:
	text "Establishing"
	line "communications…"
	done

MobileBattleRoom_HealText:
	text "Your #MON will"
	line "be fully healed"
	cont "before battle."
	done

MobileBattleRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, POKECENTER_2F, 6
	warp_event  5,  7, POKECENTER_2F, 6

	def_coord_events

	def_bg_events
	bg_event  4,  2, BGEVENT_UP, MobileBattleRoomConsoleScript

	def_object_events
