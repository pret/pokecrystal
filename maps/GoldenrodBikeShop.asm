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
	playsound $0091
	waitbutton
	itemnotify
	setbit2 $0014
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
	db $0, "…sigh… I moved", $4f
	db "here, but I can't", $51
	db "sell my BICYCLES.", $4f
	db "Why is that?", $51
	db "Could you ride a", $4f
	db "BICYCLE and adver-", $55
	db "tise for me?", $57
; 0x547f8

UnknownText_0x547f8: ; 0x547f8
	db $0, "Really? Great!", $51
	db "Give me your name", $4f
	db "and phone number,", $51
	db "and I'll loan you", $4f
	db "a BICYCLE.", $57
; 0x54848

UnknownText_0x54848: ; 0x54848
	db $0, $52, " borrowed a", $4f
	db "BICYCLE.", $57
; 0x5485f

UnknownText_0x5485f: ; 0x5485f
	db $0, "My BICYCLES are", $4f
	db "first-rate! You", $51
	db "can ride them", $4f
	db "anywhere.", $57
; 0x54898

UnknownText_0x54898: ; 0x54898
	db $0, "…sigh… Oh, for", $4f
	db "the kindness of", $55
	db "people…", $57
; 0x548c0

; possibly unused
UnknownText_0x548c0: ; 0x548c0
	db $0, "Just released!", $51
	db "First-rate compact", $4f
	db "BICYCLES!", $57
; 0x548ed

UnknownText_0x548ed: ; 0x548ed
	db $0, "It's a shiny new", $4f
	db "BICYCLE!", $57
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

