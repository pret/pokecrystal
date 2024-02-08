	object_const_def
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_YOUNGSTER

SaffronPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SaffronPokecenter1FTeacherScript:
	special CheckMobileAdapterStatusSpecial
	iftrue .mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherText

.mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherMobileText

SaffronPokecenter1FFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .SolvedKantoPowerCrisis
	writetext SaffronPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedKantoPowerCrisis:
	writetext SaffronPokecenter1FFisherReturnedMachinePartText
	waitbutton
	closetext
	end

SaffronPokecenter1FYoungsterScript:
	jumptextfaceplayer SaffronPokecenter1FYoungsterText

SaffronPokecenter1FTeacherText:
	text "Comment sont les"
	line "CENTRES #MON"
	cont "de JOHTO?"

	para "...Je vois."
	line "Ils sont comme"
	cont "ceux de KANTO."

	para "Je peux aller à"
	line "JOHTO sans crainte"
	cont "dans ce cas!"
	done

SaffronPokecenter1FTeacherMobileText:
	text "Comment sont les"
	line "CENTRES #MON"
	cont "de JOHTO?"

	para "...Je vois."
	line "Ils te laissent te"

	para "connecter avec des"
	line "gens très éloi-"
	cont "gnés?"

	para "Je vais dire à mon"
	line "ami de JOHTO d'at-"

	para "traper un MARILL"
	line "et de me l'échan-"
	cont "ger!"
	done

SaffronPokecenter1FFisherText:
	text "Je viens de tra-"
	line "verser la GROTTE."

	para "Il y avait du gra-"
	line "buge à la CENTRALE"
	cont "je crois..."
	done

SaffronPokecenter1FFisherReturnedMachinePartText:
	text "Les cavernes s'ef-"
	line "fondrent facile-"
	cont "ment."

	para "Plusieurs ont dis-"
	line "paru au cours des"

	para "années. Tout comme"
	line "celle près"
	cont "d'AZURIA."

	para "Et ouais. Seul un"
	line "pro d'la montagne"
	cont "sait tout ça."
	done

SaffronPokecenter1FYoungsterText:
	text "Les BUREAUX de la"
	line "SYLPHE SARL et la"

	para "STATION du TRAIN"
	line "MAGNET sont les"

	para "choses à voir à"
	line "SAFRANIA."
	done

SaffronPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SAFFRON_CITY, 4
	warp_event  4,  7, SAFFRON_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FTeacherScript, -1
	object_event  8,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FFisherScript, -1
	object_event  1,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FYoungsterScript, -1
