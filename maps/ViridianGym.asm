	object_const_def
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUIDE

ViridianGym_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

ViridianGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideText
	waitbutton
	closetext
	end

.ViridianGymGuideWinScript:
	writetext ViridianGymGuideWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd GymStatue2Script

LeaderBlueBeforeText:
	text "BLUE: Yo! Te voilà"
	line "enfin!"

	para "J'avais pas trop"
	line "envie à CRAMOIS'"

	para "ILE mais là je"
	line "vais te battre."

	para "…"

	para "Tu dis quoi?"
	line "Tu as passé toutes"
	cont "les ARENES de"
	cont "JOHTO?"

	para "Ils sont nuls à"
	line "JOHTO alors..."

	para "Mais t'en fais"
	line "pas..."

	para "Je vais tout de"
	line "suite te dire si"

	para "tu as du talent"
	line "ou non."

	para "C'est parti,"
	line "minable de JOHTO!"
	done

LeaderBlueWinText:
	text "BLUE: Quoi?"

	para "Comment c'est-y"
	line "possible, ça?"

	para "..."

	para "Pfff..."
	line "Tiens, prends ce"
	cont "BADGE TERRE."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> reçoit"
	line "le BADGE TERRE."
	done

LeaderBlueAfterText:
	text "BLUE: ..."

	para "OK. J'avais tort."
	line "Je le reconnais:"

	para "tu as du talent"
	line "comme dresseur."

	para "Mais bon... Je te"
	line "battrai un jour."
	cont "T'inquiète pas."
	done

LeaderBlueEpilogueText:
	text "BLUE: Ecoute voir."

	para "Reste cool jusqu'à"
	line "notre prochain"
	cont "combat, d'accord?"
	done

ViridianGymGuideText:
	text "Salut, graine de"
	line "star!"
	cont "Tout va bien?"

	para "Le CHAMPION est"
	line "celui qui a com-"

	para "battu le MAITRE il"
	line "y a trois ans."

	para "C'est pas un"
	line "tendre."

	para "Alors... Heu..."
	line "Bonne chance!"
	done

ViridianGymGuideWinText:
	text "Fiiou! Alors toi,"
	line "t'es cool!"

	para "Ca c'était du"
	line "combat!"

	para "J'en ai les larmes"
	line "aux yeux."
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, EVENT_VIRIDIAN_GYM_BLUE
