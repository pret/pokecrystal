	object_const_def
	const MYHOUSE1F_POKEPHONE

MyHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

PokephoneScript: ; [E-1]
	opentext
	writetext CantLeaveWithoutPhoneText
	promptbutton
	getstring STRING_BUFFER_4, PokephoneName
	scall MyHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
	setflag ENGINE_RADIO_CARD
	setflag ENGINE_POKEDEX
	setscene SCENE_FINISHED
	setevent EVENT_OBTAIN_POKEPHONE
	disappear MYHOUSE1F_POKEPHONE
	waitbutton
	closetext
	end

PokephoneName: ; [E-1]
	db "#PHONE@"

MyHouse1FReceiveItemStd: ; [E-1]
	jumpstd ReceiveItemScript
	end
	
CantLeaveWithoutPhoneText: ; [E-1]
	text "ME: Oh, good."
	line "My #PHONE is"
	cont "at full charge."
	done

MyHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SALTBREEZE_TOWN, 1
	warp_event  3,  7, SALTBREEZE_TOWN, 1
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  3, SPRITE_PHONE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PokephoneScript, EVENT_OBTAIN_POKEPHONE
