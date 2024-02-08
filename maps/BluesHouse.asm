	object_const_def
	const BLUESHOUSE_DAISY

BluesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

DaisyScript:
	faceplayer
	opentext
	readvar VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutToWhite
	playmusic MUSIC_HEAL
	pause 60
	special FadeInFromWhite
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	promptbutton
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end

DaisyHelloText:
	text "NINA: Salut! Mon"
	line "petit frère est le"

	para "CHAMPION de l'ARE-"
	line "NE de JADIELLE."

	para "Mais il se balade"
	line "beaucoup, ce qui"

	para "embête pas mal de"
	line "dresseurs."
	done

DaisyOfferGroomingText:
	text "NINA: Salut! Ca"
	line "tombe bien, j'al-"
	cont "lais faire du thé."

	para "En veux-tu?"

	para "Oh, tes #MON"
	line "sont sales."

	para "Tu veux que j'en"
	line "bichonne un?"
	done

DaisyWhichMonText:
	text "NINA: Lequel dois-"
	line "je bichonner?"
	done

DaisyAlrightText:
	text "NINA: OK, je vais"
	line "le faire beau en"
	cont "deux secondes."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " a l'air"
	line "heureux."
	done

DaisyAllDoneText:
	text "NINA: Voilààà!"
	line "C'est fini!"

	para "Alors? Il est pas"
	line "trop beau, hein?"

	para "Un joli petit"
	line "#MON."
	done

DaisyAlreadyGroomedText:
	text "NINA: Je me fais"
	line "du thé toujours à"

	para "cette heure. Tu"
	line "peux rester."
	done

DaisyRefusedText:
	text "NINA: Tu ne veux"
	line "pas que je m'en"

	para "occupe? OK. Un peu"
	line "de thé, alors..."
	done

DaisyCantGroomEggText:
	text "NINA: Oh, désolée."
	line "Je ne peux pas"
	cont "m'occuper d'un"
	cont "OEUF."
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
