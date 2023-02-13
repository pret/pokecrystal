	object_const_def
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2

OlivineCafe_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	promptbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeStrengthSailorText:
	text "Ha! Tes #MON"
	line "ont l'air de"
	cont "mauviettes!"

	para "Ils ne peuvent"
	line "pas déplacer les"
	cont "rochers, je parie."

	para "Tiens! Apprends-"
	line "leur FORCE!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "En mer, la seule"
	line "et unique chose"

	para "sur laquelle tu"
	line "puisses compter"
	cont "c'est toi-même!"

	para "Et moi je me fais"
	line "bien confiance!"
	done

OlivineCafeFishingGuruText:
	text "Le CAFE d'OLIVILLE"
	line "fait des plats"

	para "pour les joyeux"
	line "marins!"
	done

OlivineCafeSailorText:
	text "A chaque passage"
	line "dans cette ville,"

	para "je vais au CAFE"
	line "d'OLIVILLE."

	para "La bouffe y est"
	line "trooooooooooooop"
	cont "bonne!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
