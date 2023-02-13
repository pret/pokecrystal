	object_const_def
	const PLAYERSNEIGHBORSHOUSE_COOLTRAINER_F
	const PLAYERSNEIGHBORSHOUSE_POKEFAN_F

PlayersNeighborsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

PlayersNeighborsDaughterScript:
	jumptextfaceplayer PlayersNeighborsDaughterText

PlayersNeighborScript:
	jumptextfaceplayer PlayersNeighborText

PlayersNeighborsHouseBookshelfScript:
	jumpstd MagazineBookshelfScript

PlayersNeighborsHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 45
	writetext PlayerNeighborRadioText2
	pause 45
	writetext PlayerNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd Radio1Script
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	end

PlayersNeighborsDaughterText:
	text "PIKACHU est un"
	line "#MON évolué."

	para "Les découvertes du"
	line "PROF.ORME sont"
	cont "incroyables."

	para "Ses recherches sur"
	line "l'évolution des"
	cont "#MON sont"
	cont "brillantes."

	para "(soupir)"

	para "J'aimerais être"
	line "comme lui..."
	done

PlayersNeighborText:
	text "Ma fille veut"
	line "devenir l'assis-"

	para "tante du PROF."
	line "ORME."

	para "Elle adoooore les"
	line "#MON!"
	cont "Et moi aussi!"
	done

PlayerNeighborRadioText1:
	text "La CHRONIQUE PKMN"
	line "du PROF.CHEN!"
	cont "Bientôt de retour"
	cont "sur les ondes!"
	done

PlayerNeighborRadioText2:
	text "ANTENNE #MON!"
	done

PlayerNeighborRadioText3:
	text "Ici DJ LULA, votre"
	line "co-présentatrice!"
	done

PlayerNeighborRadioText4:
	text "#MON!"
	line "ANTENNE #MON..."
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  7,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborsDaughterScript, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
