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

PlayerTakeThisBulbasaurText: ; [E-1]
	text "ME: Oh, I almost"
	line "forgot!"
	
	para "I shouldn't go"
	line "alone."
	done

ReceivedBulbasaurText: ; [E-1]
	text "<PLAYER> received"
	line "Bulbasaur!"
	done

PlayerHeadOutText: ; [E-1]
	text "ME: Now I can"
	line "leave safely!"
	done

BulbasaurPartyFullText: ; [E-1]
	text "What? How is my"
	line "party full?"
	done

SaltbreezeTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  27,  45, MY_HOUSE_1F, 1
	warp_event  15,  39, SALTBREEZE_POKECENTER_1F, 1
 
	def_coord_events

	def_bg_events

	def_object_events
	object_event 25, 45, SPRITE_BULBASAUR, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BulbasaurScript, EVENT_GOT_BULBASAUR ; [E-1]
