MobileBattleRoom_MapScripts:
	def_scene_scripts
	scene_script .InitializeMobileBattleRoom ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.InitializeMobileBattleRoom:
	prioritysjump .InitializeAndPreparePokecenter2F
	end

.DummyScene:
	end

.InitializeAndPreparePokecenter2F:
	setscene SCENE_FINISHED
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
