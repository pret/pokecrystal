MobileTradeRoom_MapScripts:
	def_scene_scripts
	scene_script MobileTradeRoomInitializeScene, SCENE_MOBILETRADEROOM_INITIALIZE
	scene_script MobileTradeRoomNoopScene,       SCENE_MOBILETRADEROOM_NOOP

	def_callbacks

MobileTradeRoomInitializeScene:
	sdefer MobileTradeRoomInitializeAndPreparePokecenter2FScript
	end

MobileTradeRoomNoopScene:
	end

MobileTradeRoomInitializeAndPreparePokecenter2FScript:
	setscene SCENE_MOBILETRADEROOM_NOOP
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM
	end

MobileTradeRoomConsoleScript:
	refreshscreen
	special Function1037c2
	writetext MobileTradeRoom_EstablishingCommsText
	waitbutton
	reloadmappart
	special Function101231
	closetext
	end

MobileTradeRoom_EstablishingCommsText:
	text "Establishing"
	line "communications…"
	done

MobileTradeRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, POKECENTER_2F, 5
	warp_event  5,  7, POKECENTER_2F, 5

	def_coord_events

	def_bg_events
	bg_event  4,  2, BGEVENT_UP, MobileTradeRoomConsoleScript

	def_object_events
