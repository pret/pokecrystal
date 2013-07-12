CianwoodCityPhotoStudio_MapScriptHeader: ; 0x9e0de
	; trigger count
	db 0

	; callback count
	db 0
; 0x9e0e0

FishingGuruScript_0x9e0e0: ; 0x9e0e0
	faceplayer
	loadfont
	2writetext UnknownText_0x9e0f9
	yesorno
	iffalse UnknownScript_0x9e0f3
	2writetext UnknownText_0x9e142
	closetext
	special $0068
	closetext
	loadmovesprites
	end
; 0x9e0f3

UnknownScript_0x9e0f3: ; 0x9e0f3
	2writetext UnknownText_0x9e156
	closetext
	loadmovesprites
	end
; 0x9e0f9

UnknownText_0x9e0f9: ; 0x9e0f9
	db $0, "You have magnifi-", $4f
	db "cent #MON with", $55
	db "you.", $51
	db "How about a photo", $4f
	db "for a souvenir?", $57
; 0x9e142

UnknownText_0x9e142: ; 0x9e142
	db $0, "OK! Big smile now!", $57
; 0x9e156

UnknownText_0x9e156: ; 0x9e156
	db $0, "Oh, that's too", $4f
	db "bad. I thought it", $51
	db "would be a great", $4f
	db "memento…", $57
; 0x9e191

CianwoodCityPhotoStudio_MapEventHeader: ; 0x9e191
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 5, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_FISHING_GURU, 7, 6, $6, $0, 255, 255, $80, 0, FishingGuruScript_0x9e0e0, $ffff
; 0x9e1ae

