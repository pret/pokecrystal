CinnabarIsland_MapScriptHeader: ; 0x1ac9a7
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1ac9ac
; 0x1ac9ac

UnknownScript_0x1ac9ac: ; 0x1ac9ac
	setflag $003f
	return
; 0x1ac9b0

BlueScript_0x1ac9b0: ; 0x1ac9b0
	faceplayer
	loadfont
	2writetext UnknownText_0x1ac9d2
	closetext
	loadmovesprites
	playsound $0013
	applymovement $2, MovementData_0x1ac9d0
	disappear $2
	clearevent $0776
	end
; 0x1ac9c4

MapCinnabarIslandSignpost1Script: ; 0x1ac9c4
	jumptext UnknownText_0x1acc73
; 0x1ac9c7

MapCinnabarIslandSignpost2Script: ; 0x1ac9c7
	jumptext UnknownText_0x1accc2
; 0x1ac9ca

MapCinnabarIslandSignpost0Script: ; 0x1ac9ca
	jumpstd $0010
; 0x1ac9cd

MapCinnabarIslandSignpostItem3: ; 0x1ac9cd
	dw $00fe
	db RARE_CANDY
	
; 0x1ac9d0

MovementData_0x1ac9d0: ; 0x1ac9d0
	teleport_from
	step_end
; 0x1ac9d2

UnknownText_0x1ac9d2: ; 0x1ac9d2
	db $0, "Who are you?", $51
	db "Well, it's plain", $4f
	db "to see that you're", $55
	db "a trainer…", $51
	db "My name's BLUE.", $51
	db "I was once the", $4f
	db "CHAMPION, although", $51
	db "it was for only a", $4f
	db "short time…", $51
	db "That meddling RED", $4f
	db "did me in…", $51
	db "Anyway, what do", $4f
	db "you want? You want", $51
	db "to challenge me or", $4f
	db "something?", $51
	db "…I hate to say", $4f
	db "it, but I'm not in", $51
	db "the mood for a", $4f
	db "battle now.", $51
	db "Take a good look", $4f
	db "around you…", $51
	db "A volcano erupts,", $4f
	db "and just like", $51
	db "that, a whole town", $4f
	db "disappears.", $51
	db "We can go on win-", $4f
	db "ning and losing in", $51
	db "#MON. But if", $4f
	db "nature so much as", $51
	db "twitches, we can", $4f
	db "lose in a second.", $51
	db "…", $51
	db "That's the way it", $4f
	db "is…", $51
	db "But, anyway, I'm", $4f
	db "still a trainer.", $51
	db "If I see a strong", $4f
	db "opponent, it makes", $55
	db "me want to battle.", $51
	db "If you want to", $4f
	db "battle me, come to", $55
	db "the VIRIDIAN GYM.", $51
	db "I'll take you on", $4f
	db "then.", $57
; 0x1acc73

UnknownText_0x1acc73: ; 0x1acc73
	db $0, "There's a notice", $4f
	db "here…", $51
	db "CINNABAR GYM has", $4f
	db "relocated to SEA-", $55
	db "FOAM ISLANDS.", $51
	db "BLAINE", $57
; 0x1accc2

UnknownText_0x1accc2: ; 0x1accc2
	db $0, "CINNABAR ISLAND", $51
	db "The Fiery Town of", $4f
	db "Burning Desire", $57
; 0x1accf4

CinnabarIsland_MapEventHeader: ; 0x1accf4
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $b, $b, 1, GROUP_CINNABAR_POKECENTER_1F, MAP_CINNABAR_POKECENTER_1F

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 11, 12, $0, MapCinnabarIslandSignpost0Script
	signpost 11, 9, $0, MapCinnabarIslandSignpost1Script
	signpost 7, 7, $0, MapCinnabarIslandSignpost2Script
	signpost 1, 9, $7, MapCinnabarIslandSignpostItem3

	; people-events
	db 1
	person_event SPRITE_BLUE, 10, 13, $3, $0, 255, 255, $0, 0, BlueScript_0x1ac9b0, $0775
; 0x1acd20

