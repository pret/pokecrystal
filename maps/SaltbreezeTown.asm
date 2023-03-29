	object_const_def
	const SALTBREEZE_BULBASAUR ; [E-1]

SaltbreezeTown_MapScripts:
	def_scene_scripts

	def_callbacks
BulbasaurScript: ; [E-1]
	opentext
	writetext PlayerTakeThisBulbasaurText
	promptbutton
	disappear SALTBREEZE_BULBASAUR
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedBulbasaurText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 10
	setevent EVENT_GOT_BULBASAUR
	writetext PlayerHeadOutText
	waitbutton
	closetext
	end

.NoRoom: ; [E-1]
	writetext BulbasaurPartyFullText
	waitbutton
	closetext
	end

SaltbreezeSign: ; [BG-1]
	jumptext SaltbreezeSignText

PlayersHouseSign: ; [BG-2]
	jumptext PlayersHouseSignText

WarrensHouseSign: ; [BG-3]
	jumptext WarrensHouseSignText

SaltbreezePokemonCenterSign: ; [BG-4]
	jumptext SaltbreezePokemonCenterSignText

SaltbreezeDirectionsSign: ; [BG-5]
	jumptext SaltbreezeDirectionsText

PlayerTakeThisBulbasaurText: ; [E-1]
	text "YOU: Oh, I almost"
	line "forgot!"
	
	para "I shouldn't go"
	line "alone."
	done

ReceivedBulbasaurText: ; [E-1]
	text "<PLAYER> received"
	line "Bulbasaur!"
	done

PlayerHeadOutText: ; [E-1]
	text "YOU: Now I can"
	line "leave safely!"
	done

BulbasaurPartyFullText: ; [E-1]
	text "What? How is my"
	line "party full?"
	done

SaltbreezeSignText: ; [BG-1]
	text "Saltbreeze Town,"
	line "a place to get"
	cont "away from it all."
	done

PlayersHouseSignText: ; [BG-2]
	text "<PLAYER>'s House"
	done

WarrensHouseSignText: ; [BG-3]
	text "Warren and"
	line "Clarissa's House"
	done

SaltbreezePokemonCenterSignText: ; [BG-4]
	text "Saltbreeze Town"
	line "#MON Center"
	done

SaltbreezeDirectionsText: ; [BG-5]
	text "Saltbreeze Town"
	line "▲ Sunglow Harbor"
	cont "← ??? Forest"
	cont "→ Sunglow Trail"
	cont "▼ ??? Path"

	para "Wild #mon"
	line "Lv. ???-???"
	done

SaltbreezeTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  27,  45, MY_HOUSE_1F, 1
	warp_event  15,  39, SALTBREEZE_POKECENTER_1F, 1
	warp_event   9,  45, WARRENS_HOUSE_1F, 2
 
	def_coord_events

	def_bg_events
	bg_event 23, 33, BGEVENT_READ, SaltbreezeSign ; [BG-1]
	bg_event 26, 45, BGEVENT_READ, PlayersHouseSign ; [BG-2]
	bg_event  8, 45, BGEVENT_READ, WarrensHouseSign ; [BG-3]
	bg_event 16, 39, BGEVENT_READ, SaltbreezePokemonCenterSign ; [BG-4]
	bg_event 24, 39, BGEVENT_READ, SaltbreezeDirectionsSign ; [BG-5]

	def_object_events
	object_event 25, 45, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BulbasaurScript, EVENT_GOT_BULBASAUR ; [E-1]
