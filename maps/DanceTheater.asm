	object_const_def
	const DANCETHEATER_KIMONO_GIRL1
	const DANCETHEATER_KIMONO_GIRL2
	const DANCETHEATER_KIMONO_GIRL3
	const DANCETHEATER_KIMONO_GIRL4
	const DANCETHEATER_KIMONO_GIRL5
	const DANCETHEATER_GENTLEMAN
	const DANCETHEATER_RHYDON
	const DANCETHEATER_COOLTRAINER_M
	const DANCETHEATER_GRANNY

DanceTheater_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerKimonoGirlNaoko:
	trainer KIMONO_GIRL, NAOKO, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaokoSeenText, KimonoGirlNaokoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaokoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	promptbutton
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	sjump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	promptbutton
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end

DanceTheaterCooltrainerMScript:
	jumptextfaceplayer DanceTheaterCooltrainerMText

DanceTheaterGrannyScript:
	jumptextfaceplayer DanceTheaterGrannyText

DanceTheaterFancyPanel:
	jumptext DanceTheaterFancyPanelText

KimonoGirlNaokoSeenText:
	text "Tu as de jolis"
	line "#MON. On peut"
	cont "voir c'que ça"
	cont "donne en combat?"
	done

KimonoGirlNaokoBeatenText:
	text "Oh, bravo les"
	line "biscotos!!"
	done

KimonoGirlNaokoAfterBattleText:
	text "J'ai apprécié la"
	line "petite baston. On"
	cont "peut se revoir?"
	done

KimonoGirlSayoSeenText:
	text "Je danse toujours"
	line "avec mes #MON."

	para "Bien sûr, je les"
	line "entraîne aussi."
	done

KimonoGirlSayoBeatenText:
	text "Oh, presque!"
	line "J'ai failli"
	cont "t'avoir."
	done

KimonoGirlSayoAfterBattleText:
	text "Le rythme, c'est"
	line "un truc super"

	para "important pour la"
	line "danse et pour les"
	cont "#MON."
	done

KimonoGirlZukiSeenText:
	text "Elle est pas belle"
	line "ma barrette?"

	para "Oh! Un combat de"
	line "#MON?"
	done

KimonoGirlZukiBeatenText:
	text "Je n'ai plus de"
	line "#MON..."
	done

KimonoGirlZukiAfterBattleText:
	text "Tous les mois je"
	line "change de fleur"
	cont "pour ma barrette."
	cont "Bon des fois elle"
	cont "fane avant!"
	done

KimonoGirlKuniSeenText:
	text "Oh, t'es tout"
	line "mimi comme"
	cont "dresseur! Un petit"
	cont "combat en tête à"
	cont "tête?"
	done

KimonoGirlKuniBeatenText:
	text "Tu es plus cool"
	line "que tu n'en n'as"
	cont "pas l'air."
	done

KimonoGirlKuniAfterBattleText:
	text "Je me suis entraî-"
	line "née d'arrache-pied"

	para "et je pensais être"
	line "au niveau. Et bah"
	cont "non..."
	done

KimonoGirlMikiSeenText:
	text "Tu aimes mes pas"
	line "de danse? La pure"
	cont "classe, non?"
	cont "Mais je suis aussi"
	cont "forte en #MON."
	done

KimonoGirlMikiBeatenText:
	text ".... Heu... T'es"
	line "pas naze non"
	cont "plus toi!"
	done

KimonoGirlMikiAfterBattleText:
	text "Je continue de"
	line "danser! Les gens"
	cont "adorent ça!"

	para "Mes #MON aussi."
	done

SurfGuyNeverLeftAScratchText:
	text "Les KIMONO ne sont"
	line "pas seulement de"

	para "bonnes danseuses,"
	line "elles sont aussi"
	cont "douées en #MON."

	para "Je les défie"
	line "souvent..."
	done

SurfGuyLadGiftText:
	text "Hep! Si tu réussis"
	line "à vaincre toutes"

	para "les KIMONO, je te"
	line "donnerai alors un"
	cont "joli cadeau."
	done

SurfGuyLassieGiftText:
	text "Hep! Si tu réussis"
	line "à vaincre toutes"

	para "les KIMONO, je te"
	line "donnerai alors un"
	cont "joli cadeau."
	done

SurfGuyLikeADanceText:
	text "La façon dont tu"
	line "as combattu..."
	cont "C'était beau comme"
	cont "une danse."

	para "Beau comme une"
	line "pirouette!"

	para "Je veux que tu"
	line "acceptes ceci."
	cont "N'aie pas peur!"
	cont "Prends-le!"
	done

SurfGuySurfExplanationText:
	text "C'est SURF."

	para "Cette capacité"
	line "permet aux"
	cont "#MON de nager."
	done

SurfGuyElegantKimonoGirlsText:
	text "J'aimerais que mes"
	line "#MON soient"
	cont "aussi élégants que"
	cont "ceux des KIMONO..."
	done

RhydonText:
	text "RHINOFEROS: Ross!"
	line "Férrroosss!"
	done

DanceTheaterCooltrainerMText:
	text "Cet homme est"
	line "toujours avec son"
	cont "RHINOFEROS."

	para "Il dit vouloir"
	line "un #MON sachant"
	cont "surfer et danser."

	para "Est-ce qu'il veut"
	line "faire de la"
	cont "natation de #-"
	cont "MON synchronisée?"
	done

DanceTheaterGrannyText:
	text "Les KIMONO sont"
	line "très belles..."

	para "Mais elles doivent"
	line "suivre un"
	cont "entraînement de"
	cont "titan."

	para "Elles doivent"
	line "apprendre à suivre"

	para "des règles avant"
	line "de se montrer en"
	cont "public."

	para "Mais quand tu"
	line "aimes quelque"
	cont "chose, tout est"
	cont "possible."
	done

DanceTheaterFancyPanelText:
	text "C'est un joli"
	line "paravent décoré de"
	cont "fleurs."
	done

DanceTheater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	def_coord_events

	def_bg_events
	bg_event  5,  6, BGEVENT_UP, DanceTheaterFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheaterFancyPanel

	def_object_events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheaterCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterGrannyScript, -1
