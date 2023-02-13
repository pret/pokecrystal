	object_const_def
	const CELADONPOKECENTER1F_NURSE
	const CELADONPOKECENTER1F_GENTLEMAN
	const CELADONPOKECENTER1F_PHARMACIST
	const CELADONPOKECENTER1F_COOLTRAINER_F
	const CELADONPOKECENTER1F_EUSINE

CeladonPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

CeladonPokecenter1FGentlemanScript:
	jumpstd HappinessCheckScript

CeladonPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CeladonPokecenter1FCooltrainerFText

CeladonPokecenter1FPharmacistScript:
	jumptextfaceplayer CeladonPokecenter1FPharmacistText

CeladonEusine:
	faceplayer
	opentext
	writetext CeladonEusineText1
	promptbutton
	setval SUICUNE
	special MonCheck
	iffalse .NoSuicune
	special BeastsCheck
	iftrue .HoOh
	writetext NoBeastsText
	waitbutton
.NoSuicune:
	closetext
	end

.HoOh:
	writetext EusineLeavesCeladonText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .Location1
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement1
	sjump .Continue

.Location1:
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement2
.Continue:
	disappear CELADONPOKECENTER1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.Movement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.Movement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

CeladonPokecenter1FCooltrainerFText:
	text "ERIKA est la"
	line "maîtresse des"
	cont "#MON des"
	cont "plantes."

	para "Fais attention ou"
	line "tu le regretteras."
	done

CeladonPokecenter1FPharmacistText:
	text "La planque de la"
	line "TEAM ROCKET est au"

	para "sous-sol du"
	line "CASINO."

	para "Attends... C'était"
	line "il y a 3 ans, ça."
	done

CeladonEusineText1:
	text "EUSINE: Bonjour!"

	para "Je suis de retour"
	line "dans ma ville"
	cont "natale."

	para "Ca faisait bien"
	line "longtemps."
	done

EusineLeavesCeladonText:
	text "<PLAYER>, es-tu"
	line "au courant?"

	para "On raconte qu'un"
	line "#MON aux cou-"

	para "leurs de l'arc-"
	line "en-ciel est apparu"
	cont "à la TOUR"
	cont "FERRAILLE."

	para "Je viens de soi-"
	line "gner mon équipe."

	para "Je retourne à"
	line "ROSALIA."

	para "A très bientôt,"
	line "<PLAYER>!"
	done

NoBeastsText:
	text "Au fait,"
	line "<PLAYER>."

	para "As-tu attrapé les"
	line "#MON légendai-"

	para "res RAIKOU et"
	line "ENTEI?"

	para "<……><……><……>"

	para "D'accord..."

	para "Si tu en attrapes"
	line "un, préviens-moi."

	para "Je compte sur toi,"
	line "<PLAYER>!"
	done

CeladonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CELADON_CITY, 5
	warp_event  4,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FGentlemanScript, -1
	object_event  0,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FPharmacistScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FCooltrainerFScript, -1
	object_event  4,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_SET_WHEN_FOUGHT_HO_OH
