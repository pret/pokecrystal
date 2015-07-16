MobileBattleRoom_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000

	; callback count
	db 0

.Trigger1:
	priorityjump MobileBattleRoom_Initialize
	end

.Trigger2:
	end

MobileBattleRoom_Initialize:
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $5
	end

MapMobileBattleRoomSignpost0Script:
	refreshscreen $0
	special Function1037c2
	if_equal $1, .one
	special Function1037eb
	iffalse .false
	if_equal $1, .one_
	if_equal $2, .two_
	jump .false

.one_:
	writetext MobileBattleRoom_HealText
	pause 20
	loadmovesprites
	special Function8c084
	playmusic MUSIC_HEAL
	special Function1047eb
	pause 60
	special Function8c079
	special RestartMapMusic
	refreshscreen $0
.two_:
	special Mobile_HealParty
	special HealParty
	special Function10383c
	iftrue .false
.one:
	special Function10387b
	writetext MobileBattleRoom_EstablishingCommsText
	closetext
	reloadmappart
	special Function101225
.false:
	loadmovesprites
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

MobileBattleRoom_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $4, 6, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $7, $5, 6, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 2, 4, SIGNPOST_UP, MapMobileBattleRoomSignpost0Script

	; people-events
	db 0
