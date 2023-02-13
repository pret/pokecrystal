	object_const_def
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK2
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_ROCK4
	const CIANWOODCITY_ROCK5
	const CIANWOODCITY_ROCK6
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE

CianwoodCity_MapScripts:
	def_scene_scripts
	scene_script CianwoodCityNoop1Scene, SCENE_CIANWOODCITY_NOOP
	scene_script CianwoodCityNoop2Scene, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CianwoodCityFlypointAndSuicuneCallback

CianwoodCityNoop1Scene:
	end

CianwoodCityNoop2Scene:
	end

CianwoodCityFlypointAndSuicuneCallback:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_FOUGHT_EUSINE
	iffalse .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	endcallback

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene SCENE_CIANWOODCITY_NOOP
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
	checkevent EVENT_FOUGHT_EUSINE
	iftrue .Done
	setevent EVENT_FOUGHT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	opentext
	writetext EusineSuicuneText
	waitbutton
	closetext
	winlosstext EusineBeatenText, 0
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext EusineAfterText
	waitbutton
	closetext
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special FadeOutMusic
	playmapmusic
	pause 10
.Done:
	end

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotFly
	writetext ChucksWifeEasierToFlyText
	promptbutton
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeBeatChuckText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeGiveHMText
	promptbutton
	verbosegiveitem HM_FLY
	iffalse .Done
	setevent EVENT_GOT_HM02_FLY
	writetext ChucksWifeFlySpeechText
	promptbutton
.GotFly:
	writetext ChucksWifeChubbyText
	waitbutton
.Done:
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCityUnusedScript: ; unreferenced
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	jumpstd PokecenterSignScript

CianwoodCityRock:
	jumpstd SmashRockScript

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

CianwoodCitySuicuneApproachMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCitySuicuneDepartMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCityEusineApproachMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

CianwoodCityEusineDepartMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ChucksWifeEasierToFlyText:
	text "Tu as traversé la"
	line "mer pour venir"

	para "ici. Ca a dû être"
	line "bien dur."

	para "Ce serait plus"
	line "facile si tes"

	para "#MON savaient"
	line "voler."
	done

ChucksWifeBeatChuckText:
	text "Mais tu ne peux"
	line "pas utiliser VOL"
	cont "sans le BADGE de"
	cont "cette ville."

	para "Si tu bats le"
	line "CHAMPION d'ARENE"
	cont "du coin, reviens"
	cont "me voir."

	para "J'aurai un joli"
	line "cadeau pour toi!"
	done

ChucksWifeGiveHMText:
	text "C'est le BADGE de"
	line "l'ARENE D'IRISIA!"

	para "Voilà pour toi:"
	line "une CS."
	done

ChucksWifeFlySpeechText:
	text "Apprends VOL à ton"
	line "#MON."

	para "Tu pourras voler"
	line "tout de suite et"

	para "te rendre dans"
	line "toutes les villes"
	cont "que tu as déjà"
	cont "visitées."
	done

ChucksWifeChubbyText:
	text "Mon mari a perdu"
	line "face à toi, il"
	cont "doit donc encore"
	cont "s'entraîner!"

	para "Ca tombe bien!"
	line "Il est un peu gros"
	cont "en ce moment."
	done

CianwoodCityYoungsterText:
	text "En utilisant VOL,"
	line "tu peux revenir à"

	para "OLIVILLE en un"
	line "instant."
	done

CianwoodCityPokefanMText:
	text "Des rochers au"
	line "Nord de la ville"
	cont "peuvent être"
	cont "écrasés."

	para "Ils cachent peut-"
	line "être quelque"
	cont "chose."

	para "Ton #MON peut"
	line "utiliser ECLATE-"
	cont "ROC pour les"
	cont "détruire."
	done

CianwoodCityLassText:
	text "CHUCK, le"
	line "CHAMPION d'ARENE"

	para "s'entraîne avec"
	line "ses #MON de"
	cont "type COMBAT."
	done

CianwoodCityUnusedText:
	text "Il y a plusieurs"
	line "îles entre ici et"
	cont "OLIVILLE."

	para "Une créature mari-"
	line "ne mythique est"
	cont "censée y vivre."
	done

EusineSuicuneText:
	text "EUSINE: Hé!"
	line "<PLAYER>!"

	para "C'était pas"
	line "SUICUNE?"

	para "Je l'ai juste"
	line "aperçu mais j'ai"

	para "vu SUICUNE courir"
	line "sur les vagues."

	para "SUICUNE est siiii"
	line "bôôô et vaillant!"

	para "Il court et tra-"
	line "verse les villes"

	para "à une telle vi-"
	line "tesse."

	para "C'est dingue..."

	para "Je veux voir"
	line "SUICUNE de près..."

	para "C'est décidé."

	para "Je vais t'affron-"
	line "ter pour montrer"
	cont "mon talent à"
	cont "SUICUNE!"

	para "Mais si c'est"
	line "logique!"
	cont "COMBAT!"
	done

EusineBeatenText:
	text "Bon d'accord."
	line "J'ai perdu."
	done

EusineAfterText:
	text "Tu es formidable,"
	line "<PLAYER>!"

	para "Les #MON"
	line "doivent t'adorer."

	para "Je comprends tout."

	para "Je vais encore"
	line "traquer le grand"
	cont "SUICUNE."

	para "On se reverra."

	para "A bientôt!"
	done

CianwoodCitySignText:
	text "IRISIA"

	para "Un port entouré"
	line "d'une mer bien"
	cont "déchaînée"
	done

CianwoodGymSignText:
	text "CHAMPION d'ARENE"
	line "d'IRISIA: CHUCK"

	para "Ses poings parlent"
	line "pour lui"
	done

CianwoodPharmacySignText:
	text "500 ans de"
	line "Tradition"

	para "PHARMACIE d'IRISIA"

	para "Malades..."
	line "Venez nombreux!"
	done

CianwoodPhotoStudioSignText:
	text "STUDIO PHOTO"
	line "D'IRISIA"

	para "Une petite photo"
	line "souvenir!"
	done

CianwoodPokeSeerSignText:
	text "#DEVIN"
	line "TOUT DROIT"
	done

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, POKE_SEERS_HOUSE, 1

	def_coord_events
	coord_event 11, 16, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	def_bg_events
	bg_event 20, 34, BGEVENT_READ, CianwoodCitySign
	bg_event  7, 45, BGEVENT_READ, CianwoodGymSign
	bg_event 24, 43, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 19, 47, BGEVENT_READ, CianwoodPharmacySign
	bg_event  8, 32, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event  8, 24, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event  4, 19, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  5, 29, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	def_object_events
	object_event 21, 37, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 17, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 14, 42, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event  8, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  9, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  5, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 46, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event 11, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	object_event 10, 14, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
