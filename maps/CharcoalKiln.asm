CharcoalKiln_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

CharcoalKilnBoss:
	faceplayer
	loadfont
	checkevent EVENT_GOT_HM01_CUT
	iftrue .GotCut
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue .SavedSlowpoke
	writetext CharcoalKilnBossText1
	closetext
	loadmovesprites
	end

.SavedSlowpoke
	writetext CharcoalKilnBossText2
	closetext
	loadmovesprites
	end

.GotCut
	writetext CharcoalKilnBossText3
	closetext
	loadmovesprites
	end

CharcoalKilnApprentice:
	faceplayer
	loadfont
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue .YoureTheCoolest
	checkevent EVENT_GOT_HM01_CUT
	iftrue .Thanks
	writetext CharcoalKilnApprenticeText1
	closetext
	loadmovesprites
	end

.Thanks
	writetext CharcoalKilnApprenticeText2
	keeptextopen
	verbosegiveitem CHARCOAL, 1
	iffalse .Done
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	loadmovesprites
	end

.YoureTheCoolest
	writetext CharcoalKilnApprenticeText3
	closetext
.Done
	loadmovesprites
	end

CharcoalKilnFarfetchd:
	faceplayer
	loadfont
	writetext FarfetchdText
	cry FARFETCH_D
	closetext
	loadmovesprites
	end

CharcoalKilnBookshelf:
	jumpstd magazinebookshelf

CharcoalKilnRadio:
	jumpstd radio2

CharcoalKilnBossText1:
	text "All the SLOWPOKE"
	line "have disappeared"
	cont "from the town."

	para "The forest's pro-"
	line "tector may be"
	cont "angry with us…"

	para "It may be a bad"
	line "omen. We should"
	cont "stay in."
	done

CharcoalKilnBossText2:
	text "The SLOWPOKE have"
	line "returned…"

	para "But my APPRENTICE"
	line "hasn't come back"
	cont "from ILEX FOREST."

	para "Where in the world"
	line "is that lazy guy?"
	done

CharcoalKilnBossText3:
	text "You chased off"
	line "TEAM ROCKET and"

	para "went to ILEX"
	line "FOREST alone?"

	para "That takes guts!"
	line "I like that. Come"
	cont "train with us."
	done

CharcoalKilnApprenticeText1:
	text "Where have all the"
	line "SLOWPOKE gone?"

	para "Are they out play-"
	line "ing somewhere?"
	done

CharcoalKilnApprenticeText2:
	text "I'm sorry--I for-"
	line "got to thank you."

	para "This is CHARCOAL"
	line "that I made."

	para "Fire-type #MON"
	line "would be happy to"
	cont "hold that."
	done

CharcoalKilnApprenticeText3:
	text "The SLOWPOKE came"
	line "back, and you even"
	cont "found FARFETCH'D."

	para "You're the cool-"
	line "est, man!"
	done

FarfetchdText:
	text "FARFETCH'D: Kwaa!"
	done

CharcoalKiln_MapEventHeader: ; 0x18dff8
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $3, 2, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, CharcoalKilnBookshelf
	signpost 1, 1, $0, CharcoalKilnBookshelf
	signpost 1, 7, $0, CharcoalKilnRadio

	; people-events
	db 3
	person_event SPRITE_BLACK_BELT, 7, 6, $3, $0, 255, 255, $0, 0, CharcoalKilnBoss, $06f7
	person_event SPRITE_YOUNGSTER, 7, 9, $2, $11, 255, 255, $0, 0, CharcoalKilnApprentice, $06f6
	person_event SPRITE_MOLTRES, 10, 9, $16, $22, 255, 255, $b0, 0, CharcoalKilnFarfetchd, $06f5
