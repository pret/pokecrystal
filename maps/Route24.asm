	object_const_def
	const ROUTE24_ROCKET

Route24_MapScripts:
	def_scene_scripts

	def_callbacks

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInQuickly
	playmapmusic
	end

Route24RocketSeenText:
	text "Hé toi! Moi"
	line "yé souis dé la"
	cont "TEAM ROCKET!"

	para "Yé souis de oune"
	line "autre pays. Mé moi"
	cont "souper pouissant!"

	para "Si arrété énérgie"
	line "ici pas bien pour"
	cont "lé amis à moi!"

	para "Ma mission cé oune"
	line "sécré alors pas"
	cont "té dire!"

	para "Mé! Si toi mé"
	line "gagné, cé dé"

	para "l'honor de té dire"
	line "lé secret à moi."

	para "Alors!"
	line "COMBAT!"
	done

Route24RocketBeatenText:
	text "Ayiéééé! No yé lé"
	line "crois pas!"

	para "Té qui toi, no?"
	line "Yé souis pas dé"
	cont "la hauteur!"
	done

Route24RocketAfterBattleText:
	text "OK. Moi lé dire"
	line "la secret."

	para "PARTIE MACH. jé"
	line "la volé moi."

	para "La planqué aussi"
	line "dans ARENE AZURIA."

	para "Dans l'eau tu la"
	line "cherches au"
	cont "milieu."

	para "Dans l'ARENE, OK?"
	line "Tout compris?"

	para "Ma toi tu oublies"
	line "pas moi!"

	para "TEAM ROCKET te"
	line "battre!"

	para "Ils viennent de"
	line "JOHTO mes amis et"

	para "ta tête te la"
	line "cassent, oh oui."
	done

Route24RocketDisappearsText:
	text "..."

	para "Qué dit? TEAM"
	line "ROCKET cassé?"
	cont "Par toi en plous?"

	para "Oh, non! Qué yé"
	line "dois faire moi?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
