	object_const_def
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUIDE
	const RADIOTOWER3F_COOLTRAINER_F
	const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RadioTower3FCardKeyShutterCallback

RadioTower3FCardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	endcallback

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	endcallback

RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

RadioTower3FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	writetext RadioTower3FGymGuideText_Rockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FGymGuideText
	waitbutton
	closetext
	end

RadioTower3FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	iftrue .GotSunnyDay
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	writetext RadioTower3FCooltrainerFPleaseSaveDirectorText
	waitbutton
	closetext
	end

.UsedCardKey:
	writetext RadioTower3FCooltrainerFIsDirectorSafeText
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	promptbutton
	verbosegiveitem TM_SUNNY_DAY
	iffalse .NoRoom
	writetext RadioTower3FCooltrainerFItsSunnyDayText
	waitbutton
	closetext
	setevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	end

.GotSunnyDay:
	writetext RadioTower3FCooltrainerFYouWereMarvelousText
	waitbutton
.NoRoom:
	closetext
	end

TrainerGruntM7:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM7AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	checkitem CARD_KEY
	iftrue .HaveCardKey
.UsedCardKey:
	closetext
	end

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	refreshmap
	closetext
	waitsfx
	end

RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonnelSignText

RadioTower3FPokemonMusicSign:
	jumptext RadioTower3FPokemonMusicSignText

RadioTower3FSuperNerdText:
	text "Nous avons un "
	line "enregistrement de"

	para "tous les cris de"
	line "#MON connus."

	para "Nous en avons près"
	line "de 200 différents."
	done

RadioTower3FGymGuideText_Rockets:
	text "Les #MON sont"
	line "les amis adorés"
	cont "des dresseurs."

	para "La TEAM ROCKET"
	line "tente de les con-"

	para "trôler... C'est"
	line "affreux, ça!"
	done

RadioTower3FGymGuideText:
	text "Nous diffusons des"
	line "émissions distray-"

	para "antes sans jamais"
	line "nous arrêter."

	para "Je vais essayer de"
	line "garder le micro"
	cont "24 heures sur 24!"
	done

RadioTower3FCooltrainerFPleaseSaveDirectorText:
	text "Le chef de la TEAM"
	line "ROCKET s'est en-"
	cont "fermé."

	para "Mais le DIRECTEUR"
	line "peut ouvrir."

	para "Il est au"
	line "quatrième."

	para "Sauve-le! Pitié!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "Le DIRECTEUR est-"
	line "il en sécurité?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "Merci!"
	line "Tu es trop cool!"

	para "Prends ceci en"
	line "récompense."
	done

RadioTower3FCooltrainerFItsSunnyDayText:
	text "C'est le ZENITH."
	line "Il renforce les"
	cont "attaques de FEU"
	cont "pendant un moment."
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	text "Tu es cool!"
	line "COOOOOOL!"
	done

GruntM7SeenText:
	text "On m'a donné des"
	line "ordres précis."

	para "Je dois casser"
	line "tous ceux qui sont"
	cont "contre la ROCKET!"
	done

GruntM7BeatenText:
	text "De quoi?!"
	done

GruntM7AfterBattleText:
	text "J'ai échoué..."
	line "Quel déshonneur."

	para "Je vais me faire"
	line "virer, c'est sûr."
	done

GruntM8SeenText:
	text "Commander les"
	line "#MON pour le"
	cont "crime, c'est cool."
	done

GruntM8BeatenText:
	text "Arrête ça!"
	done

GruntM8AfterBattleText:
	text "Pfff... Je me sens"
	line "super inutile!"

	para "Mes #MON sont"
	line "nuls et moches!"
	done

GruntM9SeenText:
	text "Pourquoi le truc"
	line "s'est ouvert?"

	para "C'est toi qui as"
	line "fait ça?"
	done

GruntM9BeatenText:
	text "J'suis fichu!"
	done

GruntM9AfterBattleText:
	text "Quoi?! Tu as"
	line "échappé à nos hom-"
	cont "mes du SOUTERRAIN?"

	para "Comment t'as fait?"
	done

ScientistMarcSeenText:
	text "Quelqu'un qui se"
	line "balade?"

	para "T'es qui toi?"
	done

ScientistMarcBeatenText:
	text "Psss! J'faisais"
	line "pas attention!"
	done

ScientistMarcAfterBattleText:
	text "Bwahahaha..."

	para "Je peux donner"
	line "l'alarme d'ici..."
	cont "Malin, non?"
	done

RadioTower3FCardKeySlotText:
	text "Un lecteur de"
	line "CARTE MAGN."
	done

InsertedTheCardKeyText:
	text "<PLAYER> insère"
	line "la CARTE MAGN."
	done

RadioTower3FPersonnelSignText:
	text "2EME PERSONNEL"
	done

RadioTower3FPokemonMusicSignText:
	text "MUSIQUE #MON"
	line "avec DJ BEN"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower3FPersonnelSign
	bg_event  9,  0, BGEVENT_READ, RadioTower3FPokemonMusicSign
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	def_object_events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuideScript, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
