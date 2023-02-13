	object_const_def
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	def_scene_scripts

	def_callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsMomText_BeforeEcruteak
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText_AfterEcruteak
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	promptbutton
	sjump .Refused

BillsHouseBookshelf1:
	jumpstd PictureBookshelfScript

BillsHouseBookshelf2:
	jumpstd MagazineBookshelfScript

BillsHouseRadio:
	jumpstd Radio2Script

BillTakeThisEeveeText:
	text "LEO: Salut,"
	line "<PLAYER>! Tu nous"
	cont "ferais bien du"
	cont "plaisir si tu"
	cont "t'occupais de cet"
	cont "EVOLI."

	para "Il est arrivé"
	line "lorsque j'étais en"
	cont "train de régler le"
	cont "BLOC TEMPOREL."

	para "Quelqu'un doit"
	line "s'en occuper mais"

	para "moi je suis trop"
	line "pressé."

	para "Puis-je compter"
	line "sur toi pour jouer"
	cont "avec, <PLAYER>?"
	done

BillImCountingOnYouText:
	text "LEO: Je savais"
	line "que je pouvais"

	para "compter sur toi!"
	line "T'es trop chou!"

	para "Prends-en soin!"
	done

ReceivedEeveeText:
	text "<PLAYER> reçoit"
	line "EVOLI!"
	done

BillEeveeMayEvolveText:
	text "LEO: Le PROF.ORME"
	line "affirme que les"

	para "EVOLI pourraient"
	line "évoluer en des"
	cont "formes encore"
	cont "inconnues."
	done

BillPartyFullText:
	text "Hop-hop, minute."
	line "Tu ne peux plus"
	cont "transporter de"
	cont "#MON!"
	done

BillNoEeveeText:
	text "Mais alors..."
	line "Que faire?"
	done

BillPopWontWorkText:
	text "LEO: Mon papa..."
	line "Il fait rien de la"
	cont "journée."

	para "On peut dire que"
	line "c'est un flemmard!"
	done

BillsMomText_BeforeEcruteak:
	text "Tu collectionnes"
	line "les #MON?"
	cont "Mon fils LEO est"
	cont "un expert."

	para "Il est allé au"
	line "CENTRE #MON"
	cont "de ROSALIA."

	para "Mon mari en re-"
	line "vanche est au"

	para "CASINO..."
	line "Ne cherche pas à"
	cont "comprendre..."
	done

BillsMomText_AfterEcruteak:
	text "Mon tendre époux"
	line "était jadis un"

	para "#MANIAC."
	line "LEO doit tenir"
	cont "de lui."
	done

BillsSisterUsefulNumberText:
	text "Es-tu dresseur?"

	para "J'ai un numéro de"
	line "téléphone utile"
	cont "pour toi."
	done

RecordedBillsNumberText:
	text "<PLAYER> enregistre"
	line "le numéro de télé-"
	cont "phone de LEO."
	done

BillsSisterRefusedNumberText:
	text "Mon frère a créé"
	line "un système de"
	cont "stockage pour les"
	cont "#MON par PC."

	para "J'allais te donner"
	line "le numéro de télé-"
	cont "phone de LEO..."
	done

BillsSisterPhoneFullText:
	text "Mais tu ne peux"
	line "plus enregistrer"
	cont "de numéros!"
	done

BillsSisterStorageSystemText:
	text "Mon grand frère"
	line "LEO a fait un"

	para "super système de"
	line "stockage de #-"
	cont "MON par PC."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
