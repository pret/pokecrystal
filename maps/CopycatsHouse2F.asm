	object_const_def
	const COPYCATSHOUSE2F_COPYCAT1 ; if player is male
	const COPYCATSHOUSE2F_DODRIO
	const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
	const COPYCATSHOUSE2F_MONSTERDOLL
	const COPYCATSHOUSE2F_BIRDDOLL
	const COPYCATSHOUSE2F_COPYCAT2 ; if player is female

CopycatsHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CopycatsHouse2FWhichGenderCallback

CopycatsHouse2FWhichGenderCallback:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	disappear COPYCATSHOUSE2F_COPYCAT2
	appear COPYCATSHOUSE2F_COPYCAT1
	sjump .Done
.Female:
	disappear COPYCATSHOUSE2F_COPYCAT1
	appear COPYCATSHOUSE2F_COPYCAT2
.Done:
	endcallback

Copycat:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .TryGivePassAgain
	checkitem LOST_ITEM
	iftrue .ReturnLostItem
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_1
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	sjump .Default_Merge_1

.Default_Female_1:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.Default_Merge_1:
	special LoadUsedSpritesGFX
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .TalkAboutLostItem
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_2a
	writetext CopycatText_Male_1
	sjump .Default_Merge_2a

.Default_Female_2a:
	writetext CopycatText_Female_1
.Default_Merge_2a:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_3a
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .Default_Merge_3a

.Default_Female_3a:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.Default_Merge_3a:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_QuickMimicking
	waitbutton
	closetext
	end

.TalkAboutLostItem:
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_2b
	writetext CopycatText_Male_2
	sjump .Default_Merge_2b

.Default_Female_2b:
	writetext CopycatText_Female_2
.Default_Merge_2b:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_3b
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .Default_Merge_3b

.Default_Female_3b:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.Default_Merge_3b:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Worried
	waitbutton
	closetext
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.ReturnLostItem:
	opentext
	writetext CopycatText_GiveDoll
	promptbutton
	takeitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjump .GivePass

.TryGivePassAgain:
	opentext
.GivePass:
	writetext CopycatText_GivePass
	promptbutton
	verbosegiveitem PASS
	iffalse .Cancel
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	writetext CopycatText_ExplainPass
	waitbutton
	closetext
	end

.GotPass:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_1
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	sjump .GotPass_Merge_1

.GotPass_Female_1:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.GotPass_Merge_1:
	special LoadUsedSpritesGFX
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_2
	writetext CopycatText_Male_3
	sjump .GotPass_Merge_2

.GotPass_Female_2:
	writetext CopycatText_Female_3
.GotPass_Merge_2:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_3
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .GotPass_Merge_3

.GotPass_Female_3:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.GotPass_Merge_3:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_ItsAScream
	waitbutton
.Cancel:
	closetext
	end

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry DODRIO
	promptbutton
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd PictureBookshelfScript

CopycatSpinAroundMovementData:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

CopycatText_Male_1:
	text "<PLAYER>: Salut! Tu"
	line "aimes les #MON?"

	para "<PLAYER>: Non. Toi."
	line "Tu les aimes?"

	para "<PLAYER>: Hein?"
	line "Tu m'cherches?"
	done

CopycatText_QuickMimicking:
	text "COPIEUSE: Hmm?"
	line "Arrêter de copier?"

	para "Mais... C'est"
	line "toute ma vie!"
	done

CopycatText_Male_2:
	text "<PLAYER>: Salut!"
	line "On dit que tu as"

	para "perdu ta #"
	line "POUPEE préférée."

	para "<PLAYER>: Si je la"
	line "trouves, tu me"
	cont "donnes un PASSE?"

	para "<PLAYER>: Je vais"
	line "la chercher."

	para "Tu l'as perdue en"
	line "allant à CARMIN"
	cont "SUR MER?"
	done

CopycatText_Worried:
	text "COPIEUSE: Pardon?"

	para "Tu ne veux pas"
	line "que je te dise"
	cont "comment faire?"

	para "Mais j'ai si peur!"
	line "Et si quelqu'un la"
	cont "trouve?"
	done

CopycatText_GiveDoll:
	text "COPIEUSE: Hé!"
	line "C'est ma #"
	cont "POUPEE MELOFEE!"

	para "Elle est un peu"
	line "déchirée près de"

	para "la jambe! C'est la"
	line "mienne!"
	done

CopycatText_GivePass:
	text "OK. Voilà le"
	line "PASSE du TRAIN"
	cont "comme promis!"
	done

CopycatText_ExplainPass:
	text "COPIEUSE: C'est le"
	line "PASSE pour le"
	cont "TRAIN MAGNET."

	para "On me l'a donné"
	line "quand ils ont tout"

	para "cassé ma maison"
	line "pour construire la"
	cont "STATION."
	done

CopycatText_Male_3:
	text "<PLAYER>: Salut!"
	line "Merci pour le"
	cont "PASSE!"

	para "<PLAYER>: Pardon?"

	para "<PLAYER>: Tu vas"
	line "t'arrêter de répé-"
	cont "ter c'que je dis!"
	done

CopycatText_ItsAScream:
	text "COPIEUSE: Copier"
	line "c'est mortel!"
	done

CopycatText_Female_1:
	text "<PLAYER>: Salut!"
	line "Tu aimes les"
	cont "#MON, non?"

	para "<PLAYER>: Non, pas"
	line "moi. Toi."

	para "<PLAYER>: Quoi?"
	line "T'es bizarre!"
	done

CopycatText_Female_2:
	text "<PLAYER>: Salut!"
	line "On dit que tu as"

	para "perdu ta #"
	line "POUPEE préférée."

	para "<PLAYER>: Si je la"
	line "trouve, tu me"
	cont "donnes un PASSE?"

	para "<PLAYER>: Je vais"
	line "la chercher."

	para "Tu l'as perdue en"
	line "allant à CARMIN"
	cont "SUR MER?"
	done

CopycatText_Female_3:
	text "<PLAYER>: Merci"
	line "pour le PASSE!"

	para "<PLAYER>: ...Quoi?"

	para "<PLAYER>: T'en as"
	line "jamais marre de"

	para "répéter tout ce"
	line "que je dis?"
	done

CopycatsDodrioText1:
	text "DODRIO: Driii!"
	done

CopycatsDodrioText2:
	text "MON BEAU MIROIR,"
	line "QUI EST LA PLUS"

	para "BELLE DE TOUTES?"
	line "HEIN? C'EST QUI?"
	done

CopycatsHouse2FDollText:
	text "C'est un #MON"
	line "super rare! Hein?"

	para "Une poupée..."
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	def_object_events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Copycat, EVENT_COPYCAT_1
	object_event  6,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Copycat, EVENT_COPYCAT_2
