CeruleanPokeCenter1F_MapScriptHeader: ; 0x18820d
	; trigger count
	db 0

	; callback count
	db 0
; 0x18820f

NurseScript_0x18820f: ; 0x18820f
	jumpstd $0000
; 0x188212

SuperNerdScript_0x188212: ; 0x188212
	special $00a0
	iftrue UnknownScript_0x18821b
	jumptextfaceplayer UnknownText_0x188221
; 0x18821b

UnknownScript_0x18821b: ; 0x18821b
	jumptextfaceplayer UnknownText_0x18828c
; 0x18821e

GymGuyScript_0x18821e: ; 0x18821e
	jumptextfaceplayer UnknownText_0x1882ff
; 0x188221

UnknownText_0x188221: ; 0x188221
	db $0, "For battles, I'd", $4f
	db "much rather use", $51
	db "#MON I've been", $4f
	db "raising, even if", $51
	db "they're weaker", $4f
	db "than some newly", $55
	db "caught #MON.", $57
; 0x18828c

UnknownText_0x18828c: ; 0x18828c
	db $0, "Do you battle by", $4f
	db "mobile phone?", $51
	db "If time runs out", $4f
	db "during a battle,", $51
	db "waiting to see who", $4f
	db "won is really", $55
	db "nerve wracking.", $57
; 0x1882ff

UnknownText_0x1882ff: ; 0x1882ff
	db $0, "The MAGNET TRAIN", $4f
	db "travels at over", $51
	db "340 mph. It goes", $4f
	db "between KANTO and", $51
	db "JOHTO in almost no", $4f
	db "time at all.", $51
	db "It really makes", $4f
	db "JOHTO accessible.", $57
; 0x188386

CeruleanPokeCenter1F_MapEventHeader: ; 0x188386
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 4, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $4, 4, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x18820f, $ffff
	person_event SPRITE_SUPER_NERD, 8, 12, $5, $1, 255, 255, $0, 0, SuperNerdScript_0x188212, $ffff
	person_event SPRITE_GYM_GUY, 9, 5, $2, $11, 255, 255, $a0, 0, GymGuyScript_0x18821e, $ffff
; 0x1883c2

