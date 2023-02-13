	object_const_def
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL

RadioTower5F_MapScripts:
	def_scene_scripts
	scene_script RadioTower5FNoop1Scene, SCENE_RADIOTOWER5F_FAKE_DIRECTOR
	scene_script RadioTower5FNoop2Scene, SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script RadioTower5FNoop3Scene, SCENE_RADIOTOWER5F_NOOP

	def_callbacks

RadioTower5FNoop1Scene:
	end

RadioTower5FNoop2Scene:
	end

RadioTower5FNoop3Scene:
	end

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScript:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOOP
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_ECRUTEAKTINTOWERENTRANCE_SAGE_BLOCKS
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd MagazineBookshelfScript

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "T-toi! T-tu es là"
	line "pour me s-sauver?"
	done

FakeDirectorTextBefore2:
	text "Alors..."
	line "Tu t'y attendais?"

	para "Et oui! Je suis"
	line "un imposteur!"

	para "Cette mascarade"
	line "était nécessaire"

	para "à notre invasion!"
	line "Ha ha ha ha ha!"

	para "Veux-tu savoir où"
	line "est caché le vrai"
	cont "DIRECTEUR?"

	para "J'vais te le dire."
	line "Mais d'abord..."
	cont "COMBAT!!!!"
	done

FakeDirectorWinText:
	text "OK, OK. Je vais"
	line "parler."
	done

FakeDirectorTextAfter:
	text "On a planqué le"
	line "DIRECTEUR dans"

	para "l'ENTREPOT"
	line "SOUTERRAIN."

	para "C'est tout au bout"
	line "du SOUTERRAIN."

	para "Mais t'y arriveras"
	line "jamais... Ha!"
	done

Executivef1SeenText:
	text "Tu te souviens de"
	line "moi? Dans la"
	cont "PLANQUE d'ACAJOU?"

	para "J'avais perdu..."
	line "Mais cette fois..."
	done

Executivef1BeatenText:
	text "Mais c'est pas"
	line "possible!"

	para "J'me bats à fond"
	line "et je perds..."
	done

Executivef1AfterBattleText:
	text "<PLAYER>,"
	line "c'est ça?"

	para "Une peste comme"
	line "toi ne voit pas"

	para "la grandeur de"
	line "la TEAM ROCKET."

	para "C'est dommage."
	line "Tu as pourtant du"
	cont "talent."
	done

RadioTower5FRocketBossBeforeText:
	text "Oh? Tu es déjà"
	line "là?"

	para "Tu dois avoir un"
	line "sacré talent."

	para "Nous allons con-"
	line "trôler cette STA-"

	para "TION de RADIO pour"
	line "annoncer au monde"
	cont "notre retour."

	para "Cela devrait faire"
	line "revenir notre chef"

	para "GIOVANNI de son"
	line "entraînement solo."

	para "La gloire passée"
	line "de la TEAM sera"
	cont "restituée."

	para "Et toi minable,"
	line "tu vas pas nous"
	cont "agacer longtemps."
	done

RadioTower5FRocketBossWinText:
	text "Non! Pardon,"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "Impossible!"

	para "Nos rêves se"
	line "brisent."

	para "Je suis pas"
	line "digne."

	para "Comme GIOVANNI l'a"
	line "fait jadis, je"

	para "vais dissoudre la"
	line "TEAM ROCKET."

	para "Adieu."
	done

RadioTower5FDirectorThankYouText:
	text "DIRECTEUR:"
	line "Merci <PLAY_G>!"

	para "Ton courage a"
	line "sauvé les #MON"
	cont "du monde entier."

	para "Ce n'est pas grand"
	line "chose, mais c'est"
	cont "pour toi."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "Il y avait une"
	line "tour ici à DOU-"
	cont "BLONVILLE."

	para "Mais elle était"
	line "en mauvais état."

	para "On l'a alors rem-"
	line "placée par notre"
	cont "TOUR RADIO."

	para "Pendant les tra-"
	line "vaux, nous avons"
	cont "trouvé ce glas."

	para "On dit qu'une"
	line "multitude de #-"

	para "MON différents vi-"
	line "vaient ici."

	para "Alors..."

	para "Ce glas a"
	line "peut-être un lien"

	para "avec la TOUR FER-"
	line "RAILLE de ROSALIA."

	para "Ah!"

	para "Au fait..."

	para "J'ai entendu un"
	line "des types de la"
	cont "TEAM ROCKET."

	para "Apparemment, il se"
	line "passe des trucs à"
	cont "la TOUR FERRAILLE."

	para "A mon avis, tu"
	line "devrais y aller."

	para "OK, je retourne"
	line "au BUREAU."
	done

RadioTower5FDirectorText:
	text "DIRECTEUR: Salut,"
	line "<PLAY_G>!"

	para "Tu sais, j'adore"
	line "les #MON."

	para "J'ai construit"
	line "cette TOUR RADIO"

	para "pour crier au mon-"
	line "de mon amour."

	para "Mais les gens"
	line "aiment-ils nos"
	cont "émissions?"
	done

BenText:
	text "BEN: Tu écoutes"
	line "notre musique?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "4EME BUREAU"
	line "     DIRECTION"
	done

RadioTower5FStudio1SignText:
	text "4EME STUDIO 1"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_RADIOTOWER5F_FAKE_DIRECTOR, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScript

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
