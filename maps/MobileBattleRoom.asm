MobileBattleRoom_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1935ce, $0000
	dw UnknownScript_0x1935d2, $0000

	; callback count
	db 0

UnknownScript_0x1935ce:
	priorityjump UnknownScript_0x1935d3
	end

UnknownScript_0x1935d2:
	end

UnknownScript_0x1935d3:
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $5
	end

MapMobileBattleRoomSignpost0Script:
	refreshscreen $0
	special Function1037c2
	if_equal $1, UnknownScript_0x193619
	special Function1037eb
	iffalse UnknownScript_0x193624
	if_equal $1, UnknownScript_0x1935f4
	if_equal $2, UnknownScript_0x19360d
	jump UnknownScript_0x193624

UnknownScript_0x1935f4:
	writetext UnknownText_0x193644
	pause 20
	loadmovesprites
	special Function8c084
	playmusic MUSIC_HEAL
	special Function1047eb
	pause 60
	special Function8c079
	special RestartMapMusic
	refreshscreen $0
UnknownScript_0x19360d:
	special Function1060a2
	special HealParty
	special Function10383c
	iftrue UnknownScript_0x193624
UnknownScript_0x193619:
	special Function10387b
	writetext UnknownText_0x193626
	closetext
	reloadmappart
	special Function101225
UnknownScript_0x193624:
	loadmovesprites
	end

UnknownText_0x193626:
	text "Establishing"
	line "communications…"
	done

UnknownText_0x193644:
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
	signpost 2, 4, $1, MapMobileBattleRoomSignpost0Script

	; people-events
	db 0
