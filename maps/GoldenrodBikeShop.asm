GoldenrodBikeShop_MapScriptHeader: ; 0x5474d
	; trigger count
	db 0

	; callback count
	db 0
; 0x5474f

UnknownScript_0x5474f: ; 0x5474f
	end
; 0x54750

ClerkScript_0x54750: ; 0x54750
	faceplayer
	loadfont
	checkevent EVENT_GOT_BICYCLE
	iftrue UnknownScript_0x54775
	2writetext UnknownText_0x54787
	yesorno
	iffalse UnknownScript_0x5477b
	2writetext UnknownText_0x547f8
	keeptextopen
	waitbutton
	giveitem BICYCLE, $1
	2writetext UnknownText_0x54848
	playsound SFX_KEY_ITEM
	waitbutton
	itemnotify
	setflag $0014
	setevent EVENT_GOT_BICYCLE
UnknownScript_0x54775: ; 0x54775
	2writetext UnknownText_0x5485f
	closetext
	loadmovesprites
	end
; 0x5477b

UnknownScript_0x5477b: ; 0x5477b
	2writetext UnknownText_0x54898
	closetext
	loadmovesprites
	end
; 0x54781

; possibly unused
UnknownScript_0x54781: ; 0x54781
	jumptext UnknownText_0x548c0
; 0x54784

MapGoldenrodBikeShopSignpost8Script: ; 0x54784
	jumptext UnknownText_0x548ed
; 0x54787

UnknownText_0x54787: ; 0x54787
	text "…sigh… I moved"
	line "here, but I can't"

	para "sell my BICYCLES."
	line "Why is that?"

	para "Could you ride a"
	line "BICYCLE and adver-"
	cont "tise for me?"
	done
; 0x547f8

UnknownText_0x547f8: ; 0x547f8
	text "Really? Great!"

	para "Give me your name"
	line "and phone number,"

	para "and I'll loan you"
	line "a BICYCLE."
	done
; 0x54848

UnknownText_0x54848: ; 0x54848
	text $52, " borrowed a"
	line "BICYCLE."
	done
; 0x5485f

UnknownText_0x5485f: ; 0x5485f
	text "My BICYCLES are"
	line "first-rate! You"

	para "can ride them"
	line "anywhere."
	done
; 0x54898

UnknownText_0x54898: ; 0x54898
	text "…sigh… Oh, for"
	line "the kindness of"
	cont "people…"
	done
; 0x548c0

; possibly unused
UnknownText_0x548c0: ; 0x548c0
	text "Just released!"

	para "First-rate compact"
	line "BICYCLES!"
	done
; 0x548ed

UnknownText_0x548ed: ; 0x548ed
	text "It's a shiny new"
	line "BICYCLE!"
	done
; 0x54907

GoldenrodBikeShop_MapEventHeader: ; 0x54907
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 2, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 9
	signpost 2, 1, $0, MapGoldenrodBikeShopSignpost8Script
	signpost 3, 0, $0, MapGoldenrodBikeShopSignpost8Script
	signpost 3, 1, $0, MapGoldenrodBikeShopSignpost8Script
	signpost 5, 0, $0, MapGoldenrodBikeShopSignpost8Script
	signpost 5, 1, $0, MapGoldenrodBikeShopSignpost8Script
	signpost 6, 0, $0, MapGoldenrodBikeShopSignpost8Script
	signpost 6, 1, $0, MapGoldenrodBikeShopSignpost8Script
	signpost 6, 6, $0, MapGoldenrodBikeShopSignpost8Script
	signpost 6, 7, $0, MapGoldenrodBikeShopSignpost8Script

	; people-events
	db 1
	person_event SPRITE_CLERK, 6, 11, $8, $0, 255, 255, $80, 0, ClerkScript_0x54750, $ffff
; 0x54951

