const_value set 2
	const FUCHSIACITY_YOUNGSTER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_FRUIT_TREE

FuchsiaCity_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	return

FuchsiaCityYoungster:
	jumptextfaceplayer FuchsiaCityYoungsterText

FuchsiaCityPokefanM:
	jumptextfaceplayer FuchsiaCityPokefanMText

FuchsiaCityTeacher:
	jumptextfaceplayer FuchsiaCityTeacherText

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

NoLitteringSign:
	jumptext NoLitteringSignText

FuchsiaCityPokecenterSign:
	jumpstd pokecentersign

FuchsiaCityMartSign:
	jumpstd martsign

FuchsiaCityFruitTree:
	fruittree FRUITTREE_FUCHSIA_CITY

FuchsiaCityYoungsterText:
	text "One of the ELITE"
	line "FOUR used to be"

	para "the LEADER of"
	line "FUCHSIA's GYM."
	done

FuchsiaCityPokefanMText:
	text "KOGA's daughter"
	line "succeeded him as"

	para "the GYM LEADER"
	line "after he joined"
	cont "the ELITE FOUR."
	done

FuchsiaCityTeacherText:
	text "The SAFARI ZONE is"
	line "closed… It's sad,"

	para "considering it's"
	line "FUCHSIA's main"
	cont "attraction."
	done

FuchsiaCitySignText:
	text "FUCHSIA CITY"

	para "Behold! It's"
	line "Passion Pink!"
	done

FuchsiaGymSignText:
	text "FUCHSIA CITY"
	line "#MON GYM"
	cont "LEADER: JANINE"

	para "The Poisonous"
	line "Ninja Master"
	done

SafariZoneOfficeSignText:
	text "There's a notice"
	line "here…"

	para "SAFARI ZONE OFFICE"
	line "is closed until"
	cont "further notice."
	done

WardensHomeSignText:
	text "SAFARI ZONE"
	line "WARDEN'S HOME"
	done

SafariZoneClosedSignText:
	text "The WARDEN is"
	line "traveling abroad."

	para "Therefore, the"
	line "SAFARI ZONE is"
	cont "closed."
	done

NoLitteringSignText:
	text "No littering."

	para "Please take your"
	line "waste with you."
	done

FuchsiaCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 11
	warp_def $d, $5, 2, FUCHSIA_MART
	warp_def $d, $16, 1, SAFARI_ZONE_MAIN_OFFICE
	warp_def $1b, $8, 1, FUCHSIA_GYM
	warp_def $1b, $b, 1, FUCHSIA_BILL_SPEECH_HOUSE
	warp_def $1b, $13, 1, FUCHSIA_POKECENTER_1F
	warp_def $1b, $1b, 1, SAFARI_ZONE_WARDENS_HOME
	warp_def $3, $12, 3, SAFARI_ZONE_FUCHSIA_GATE_BETA
	warp_def $16, $25, 1, ROUTE_15_FUCHSIA_GATE
	warp_def $17, $25, 2, ROUTE_15_FUCHSIA_GATE
	warp_def $23, $7, 1, ROUTE_19___FUCHSIA_GATE
	warp_def $23, $8, 2, ROUTE_19___FUCHSIA_GATE

.CoordEvents:
	db 0

.BGEvents:
	db 8
	bg_event 15, 21, BGEVENT_READ, FuchsiaCitySign
	bg_event 29, 5, BGEVENT_READ, FuchsiaGymSign
	bg_event 15, 25, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 29, 27, BGEVENT_READ, WardensHomeSign
	bg_event 5, 17, BGEVENT_READ, SafariZoneClosedSign
	bg_event 15, 13, BGEVENT_READ, NoLitteringSign
	bg_event 27, 20, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event 13, 6, BGEVENT_READ, FuchsiaCityMartSign

.ObjectEvents:
	db 4
	object_event SPRITE_YOUNGSTER, 18, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster, -1
	object_event SPRITE_POKEFAN_M, 8, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM, -1
	object_event SPRITE_TEACHER, 14, 16, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, -1
	object_event SPRITE_FRUIT_TREE, 1, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFruitTree, -1
