const_value set 2
	const GOLDENRODBIKESHOP_CLERK

GoldenrodBikeShop_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

UnknownScript_0x5474f:
	end

ClerkScript_0x54750:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue UnknownScript_0x54775
	writetext UnknownText_0x54787
	yesorno
	iffalse UnknownScript_0x5477b
	writetext UnknownText_0x547f8
	buttonsound
	waitsfx
	giveitem BICYCLE
	writetext UnknownText_0x54848
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
UnknownScript_0x54775:
	writetext UnknownText_0x5485f
	waitbutton
	closetext
	end

UnknownScript_0x5477b:
	writetext UnknownText_0x54898
	waitbutton
	closetext
	end

; possibly unused
UnknownScript_0x54781:
	jumptext UnknownText_0x548c0

MapGoldenrodBikeShopSignpost8Script:
	jumptext UnknownText_0x548ed

UnknownText_0x54787:
	text "…sigh… I moved"
	line "here, but I can't"

	para "sell my BICYCLES."
	line "Why is that?"

	para "Could you ride a"
	line "BICYCLE and adver-"
	cont "tise for me?"
	done

UnknownText_0x547f8:
	text "Really? Great!"

	para "Give me your name"
	line "and phone number,"

	para "and I'll loan you"
	line "a BICYCLE."
	done

UnknownText_0x54848:
	text "<PLAYER> borrowed a"
	line "BICYCLE."
	done

UnknownText_0x5485f:
	text "My BICYCLES are"
	line "first-rate! You"

	para "can ride them"
	line "anywhere."
	done

UnknownText_0x54898:
	text "…sigh… Oh, for"
	line "the kindness of"
	cont "people…"
	done

; possibly unused
UnknownText_0x548c0:
	text "Just released!"

	para "First-rate compact"
	line "BICYCLES!"
	done

UnknownText_0x548ed:
	text "It's a shiny new"
	line "BICYCLE!"
	done

GoldenrodBikeShop_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, GOLDENROD_CITY
	warp_def $7, $3, 2, GOLDENROD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 9
	signpost 2, 1, SIGNPOST_READ, MapGoldenrodBikeShopSignpost8Script
	signpost 3, 0, SIGNPOST_READ, MapGoldenrodBikeShopSignpost8Script
	signpost 3, 1, SIGNPOST_READ, MapGoldenrodBikeShopSignpost8Script
	signpost 5, 0, SIGNPOST_READ, MapGoldenrodBikeShopSignpost8Script
	signpost 5, 1, SIGNPOST_READ, MapGoldenrodBikeShopSignpost8Script
	signpost 6, 0, SIGNPOST_READ, MapGoldenrodBikeShopSignpost8Script
	signpost 6, 1, SIGNPOST_READ, MapGoldenrodBikeShopSignpost8Script
	signpost 6, 6, SIGNPOST_READ, MapGoldenrodBikeShopSignpost8Script
	signpost 6, 7, SIGNPOST_READ, MapGoldenrodBikeShopSignpost8Script

.PersonEvents:
	db 1
	person_event SPRITE_CLERK, 2, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ClerkScript_0x54750, -1
