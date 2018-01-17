MobileBattleRoom_MapScripts:
.SceneScripts:
	db 2
	scene_script .InitializeMobileBattleRoom
	scene_script .DummyScene

.MapCallbacks:
	db 0

.InitializeMobileBattleRoom:
	priorityjump .InitializeAndPreparePokecenter2F
	end

.DummyScene:
	end

.InitializeAndPreparePokecenter2F:
	setscene 1
	setmapscene POKECENTER_2F, 5
	end

MapMobileBattleRoomSignpost0Script:
	refreshscreen
	special Special_Function1037c2
	if_equal $1, .one
	special Special_Function1037eb
	iffalse .false
	if_equal $1, .one_
	if_equal $2, .two_
	jump .false

.one_
	writetext MobileBattleRoom_HealText
	pause 20
	closetext
	special Special_FadeOutPalettes
	playmusic MUSIC_HEAL
	special Special_LoadMapPalettes
	pause 60
	special Special_FadeInPalettes
	special RestartMapMusic
	refreshscreen
.two_
	special Special_StubbedTrainerRankings_Healings
	special HealParty
	special Special_Function10383c
	iftrue .false
.one
	special Special_Function10387b
	writetext MobileBattleRoom_EstablishingCommsText
	waitbutton
	reloadmappart
	special Special_Function101225
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
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 4, 7, 6, POKECENTER_2F
	warp_def 5, 7, 6, POKECENTER_2F

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 4, 2, BGEVENT_UP, MapMobileBattleRoomSignpost0Script

.ObjectEvents:
	db 0
