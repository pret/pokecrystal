	object_const_def
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts:
	def_scene_scripts

	def_callbacks

FastShipCabins_SE_SSE_CaptainsCabinNoopScene: ; unreferenced
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end

.LaterTrip:
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	opentext
	writetext SSAquaGranddaughterCaptainPlayWithMeText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext SSAquaGranddaughterHasToFindGrandpaText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, SSAquaCaptainsCabinWarpsToGrandpasCabinMovement
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	special FadeInQuickly
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, SSAquaGranddaughterEntersCabinMovement
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	opentext
	writetext SSAquaGranddaughterWasPlayingMText
	waitbutton
	closetext
	sjump .cont

.PlayerIsFemale:
	opentext
	writetext SSAquaGranddaughterWasPlayingFText
	waitbutton
	closetext
.cont:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, SSAquaGrandpaApproachesPlayerMovement
	opentext
	writetext SSAquaEntertainedGranddaughterText
	promptbutton
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	sjump SSAquaMetalCoatAndDocking

SSAquaGrandpa:
	faceplayer
	opentext
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue SSAquaGotMetalCoat
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftrue SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_NOOP
	end

SSAquaMetalCoatAndDocking:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	closetext
	end

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	promptbutton
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	end

SSAquaGotMetalCoat:
	writetext SSAquaGrandpaTravellingText
	waitbutton
	closetext
	end

SSAquaGranddaughterAfter:
	faceplayer
	opentext
	writetext SSAquaGranddaughterHadFunText
	waitbutton
	closetext
	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd TrashCanScript

SSAquaCaptainsCabinWarpsToGrandpasCabinMovement:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

SSAquaGranddaughterEntersCabinMovement:
	step UP
	step UP
	turn_head LEFT
	step_end

SSAquaGrandpaApproachesPlayerMovement:
	step DOWN
	step_end

SSAquaCaptainExhaustingText:
	text "Fouiii! Merci"
	line "d'être là."

	para "S'occuper de cette"
	line "petite fille est"
	cont "crevant."
	done

SSAquaCaptainHowDoYouLikeText:
	text "Tu aimes bien"
	line "l'AQUARIA?"

	para "Il vole sur les"
	line "vagues..."
	done

SSAquaCantFindGranddaughterText:
	text "Oh, bonjour..."

	para "Je ne trouve tou-"
	line "jours pas ma"
	cont "petite-fille."

	para "Elle peut être"
	line "assez soûlante,"

	para "j'espère qu'elle"
	line "n'embête personne."
	done

SSAquaEntertainedGranddaughterText:
	text "<PLAY_G>, c'est ça?"
	line "On m'a dit que tu"
	cont "as pris soin de ma"
	cont "petite-fille."

	para "Je tiens à te"
	line "remercier."
	done

SSAquaGrandpaHaveThisText:
	text "Je tiens à ce que"
	line "tu acceptes ceci!"
	done

SSAquaGrandpaTravellingText:
	text "Nous voyageons"
	line "autour du monde."
	done

SSAquaGranddaughterCaptainPlayWithMeText:
	text "Hé CAPITAINE! Tu"
	line "joues avec moi?"

	para "Vazy steuplait!"
	line "Vazy m'sieur!"
	done

SSAquaGranddaughterHasToFindGrandpaText:
	text "Tu viens jouer"
	line "avec moi?"

	para "...Oh!"

	para "Pépé s'inquiète"
	line "pour moi?"

	para "J'y vais!"

	para "J'dois trouver mon"
	line "p'tit pépé!"
	done

SSAquaGranddaughterWasPlayingMText:
	text "Me voilà pépé!"
	line "Je jouais avec le"

	para "CAPITAINE et ce"
	line "garçon!"
	done

SSAquaGranddaughterWasPlayingFText:
	text "Me voilà pépé!"
	line "Je jouais avec le"

	para "CAPITAINE et cette"
	line "fille!"
	done

SSAquaGranddaughterHadFunText:
	text "Je me suis"
	line "super amusée!"
	done

PokefanmColinSeenText:
	text "Toi! Veux-tu te"
	line "battre avec moi?"
	done

PokefanmColinBeatenText:
	text "T'es balèze!"
	done

PokefanmColinAfterBattleText:
	text "Tu voyages?"

	para "Et ta maman elle"
	line "s'inquiète pas?"
	done

TwinsMegandpeg1SeenText:
	text "Tu me prends pour"
	line "un bébé?"
	cont "Ouiiiin!"
	done

TwinsMegandpeg1BeatenText:
	text "Oh! Perdu!"
	done

TwinsMegandpeg1AfterBattleText:
	text "On est des filles!"
	line "Pas des bébés!"
	cont "Compris?"
	done

TwinsMegandpeg2SeenText:
	text "On n'est pas des"
	line "bébés mais des"
	cont "belles dames!"
	done

TwinsMegandpeg2BeatenText:
	text "Oh! Perdu!"
	done

TwinsMegandpeg2AfterBattleText:
	text "Les enfants sont"
	line "plus malins que"
	cont "les adultes!"
	done

PsychicRodneySeenText:
	text "Silence! Mon cer-"
	line "veau capte un"
	cont "signal radio!"
	done

PsychicRodneyBeatenText:
	text "... J'entends"
	line "quelque chose!"
	done

PsychicRodneyAfterBattleText:
	text "Je sais: tu peux"
	line "écouter la radio"
	cont "de JOHTO sur le"
	cont "BATEAU EXPRESS."
	done

PokefanmJeremySeenText:
	text "Qu'en penses-tu?"
	line "Mes #MON sont"
	cont "beaux, non?"
	done

PokefanmJeremyBeatenText:
	text "Oh, non! Mes beaux"
	line "#MON!"
	done

PokefanmJeremyAfterBattleText:
	text "Je dois aller au"
	line "SALON #MON et"
	cont "les toiletter!"
	done

PokefanfGeorgiaSeenText:
	text "Je vais faire mes"
	line "courses au GRAND"
	cont "MAGASIN et puis..."
	done

PokefanfGeorgiaBeatenText:
	text "Qu'est-ce que je"
	line "devais faire?"
	done

PokefanfGeorgiaAfterBattleText:
	text "Ah oui! Je dois"
	line "aller chercher mon"
	cont "#MON à la"
	cont "PENSION!"
	done

SupernerdShawnSeenText:
	text "Quels types de"
	line "# BALLS as-tu"
	cont "sur toi?"
	done

SupernerdShawnBeatenText:
	text "Attends! Stop!"
	line "Pitié!"
	done

SupernerdShawnAfterBattleText:
	text "Il faut utiliser"
	line "les bonnes BALLS"
	cont "en fonction de la"
	cont "situation."
	done

SSAquaHasArrivedVermilionText:
	text "Le BATEAU EXPRESS"
	line "AQUARIA est arrivé"
	cont "à CARMIN SUR MER."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	def_coord_events

	def_bg_events
	bg_event  4, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	def_object_events
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterAfter, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
