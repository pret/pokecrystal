	object_const_def
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5

Route41_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock: ; unreferenced
	jumpstd SmashRockScript

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

SwimmermCharlieSeenText:
	text "L'eau est bonne"
	line "par ici."

	para "Tu veux combattre?"
	line "Pas de problème!"
	done

SwimmermCharlieBeatenText:
	text "J'suis tout fripé!"
	done

SwimmermCharlieAfterBattleText:
	text "C'est trop relax"
	line "de faire la plan-"
	cont "che!"
	done

SwimmermGeorgeSeenText:
	text "J'suis fatigué."
	line "Si je gagne, tu me"
	cont "prêtes tes #-"
	cont "MON, OK?"
	done

SwimmermGeorgeBeatenText:
	text "Pfff...pff..."
	done

SwimmermGeorgeAfterBattleText:
	text "IRISIA est si"
	line "loin."

	para "Mais retourner à"
	line "OLIVILLE... Ca"
	cont "fait une trotte!"

	para "Que faire?"
	done

SwimmermBerkeSeenText:
	text "Tu vois ces îles"
	line "bloquées par des"
	cont "siphons?"

	para "Il doit y avoir"
	line "quelque chose de"
	cont "secret!"
	done

SwimmermBerkeBeatenText:
	text "Pourquoi t'es"
	line "cool, toi?"
	done

SwimmermBerkeAfterBattleText:
	text "Par une nuit noire"
	line "et profonde..."

	para "J'ai vu ce #MON"
	line "géant voler depuis"
	cont "les îles."

	para "Il répandait ses"
	line "plumes de ses"
	cont "ailes d'argent."
	done

SwimmermKirkSeenText:
	text "Les vagues sont"
	line "dangereuses ici."

	para "Elles empêchent de"
	line "nager calmement."
	done

SwimmermKirkBeatenText:
	text "J'suis crevé!"
	done

SwimmermKirkAfterBattleText:
	text "Les courants m'em-"
	line "pêchent d'attein-"
	cont "dre cette île."
	done

SwimmermMathewSeenText:
	text "Tu cherches le"
	line "secret des"
	cont "TOURB'ILES?"
	done

SwimmermMathewBeatenText:
	text "Ooh!!! Quelle"
	line "endurance!"
	done

SwimmermMathewAfterBattleText:
	text "Il y a un secret"
	line "aux TOURB'ILES..."

	para "Il y fait noir!"
	line "Ca c'est sûr!"
	done

SwimmerfKayleeSeenText:
	text "Je vais aux"
	line "TOURB'ILES."

	para "Je vais les explo-"
	line "rer avec un ami."
	done

SwimmerfKayleeBeatenText:
	text "C'est tout?"
	done

SwimmerfKayleeAfterBattleText:
	text "On dit qu'il y a"
	line "un gros #MON"
	cont "au fond des"
	cont "TOURB'ILES."

	para "Je me demande ce"
	line "que c'est..."
	done

SwimmerfSusieSeenText:
	text "Cool, t'es à dada"
	line "sur ton #MON."
	done

SwimmerfSusieBeatenText:
	text "Tout perdu..."
	done

SwimmerfSusieAfterBattleText:
	text "Ca fait quel effet"
	line "de monter sur un"
	cont "#MON?"
	done

SwimmerfDeniseSeenText:
	text "Il fait si beau!"
	line "C'est la fête!"
	cont "Youkiii!"
	done

SwimmerfDeniseBeatenText:
	text "Ohhh!"
	done

SwimmerfDeniseAfterBattleText:
	text "Un coup de soleil"
	line "est vite arrivé."

	para "Moi je mets pas"
	line "de crème."

	para "Je veux garder"
	line "l'eau propre."
	done

SwimmerfKaraSeenText:
	text "Si tu es naze,"
	line "fais la planche!"

	para "Bon..."
	line "On s'bat?"
	done

SwimmerfKaraBeatenText:
	text "Oh! Tu en as de"
	line "l'énergie, toi."
	done

SwimmerfKaraAfterBattleText:
	text "J'entends des cris"
	line "venant des ILES."
	done

SwimmerfWendySeenText:
	text "La nuit tombée,"
	line "des STARI se réu-"
	cont "nissent à la sur-"
	cont "face de l'eau."
	done

SwimmerfWendyBeatenText:
	text "Oh..."
	done

SwimmerfWendyAfterBattleText:
	text "Le coeur des STARI"
	line "s'allume en même"
	cont "temps."

	para "C'est beau mais..."
	line "Ca fait peur."
	done

Route41_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	def_coord_events

	def_bg_events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	def_object_events
	object_event 32,  6, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
