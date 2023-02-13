	object_const_def
	const ROUTE32POKECENTER1F_NURSE
	const ROUTE32POKECENTER1F_FISHING_GURU
	const ROUTE32POKECENTER1F_COOLTRAINER_F

Route32Pokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

Route32Pokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

Route32Pokecenter1FFishingGuruScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotOldRod
	writetext Route32Pokecenter1FFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext Route32Pokecenter1FFishingGuruText_Yes
	promptbutton
	verbosegiveitem OLD_ROD
	writetext Route32Pokecenter1FFishingGuruText_GiveOldRod
	waitbutton
	closetext
	setevent EVENT_GOT_OLD_ROD
	end

.Refused:
	writetext Route32Pokecenter1FFishingGuruText_No
	waitbutton
	closetext
	end

.GotOldRod:
	writetext Route32Pokecenter1FFishingGuruText_After
	waitbutton
	closetext
	end

Route32Pokecenter1FCooltrainerFScript:
	jumptextfaceplayer Route32Pokecenter1FCooltrainerFText

Route32Pokecenter1FFishingGuruText_Question:
	text "C'est un bon en-"
	line "droit pour pêcher."

	para "Tu as vu des"
	line "pêcheurs? Tu veux"
	cont "t'y mettre?"

	para "Tu veux une de mes"
	line "CANNES?"
	done

Route32Pokecenter1FFishingGuruText_Yes:
	text "Ha! C'est bien"
	line "mon petit."

	para "Tu es toi aussi un"
	line "vrai pêcheur!"
	done

Route32Pokecenter1FFishingGuruText_GiveOldRod:
	text "Pêcher c'est bien!"

	para "Essaie ta CANNE"
	line "dès qu'il y a la"

	para "mer ou un fleuve."
	line "Bonne chance."
	done

Route32Pokecenter1FFishingGuruText_No:
	text "Ah. C'est bien"
	line "dommage..."
	done

Route32Pokecenter1FFishingGuruText_After:
	text "Yo."
	line "Ca mord?"
	done

Route32Pokecenter1FCooltrainerFText:
	text "Que dois-je donner"
	line "à mon #MON?"

	para "Peut-être un objet"
	line "qui augmente son"
	cont "ATTAQUE..."
	done

Route32Pokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_32, 1
	warp_event  4,  7, ROUTE_32, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FFishingGuruScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route32Pokecenter1FCooltrainerFScript, -1
