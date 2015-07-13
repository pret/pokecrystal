PewterNidoranSpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

SuperNerdScript_0x1a2807:
	jumptextfaceplayer UnknownText_0x1a2814

GrowlitheScript_0x1a280a:
	loadfont
	writetext UnknownText_0x1a2825
	cry NIDORAN_M
	closetext
	loadmovesprites
	end

UnknownText_0x1a2814:
	text "NIDORAN, shake!"
	done

UnknownText_0x1a2825:
	text "NIDORAN: Gau gau!"
	done

PewterNidoranSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $3, 1, GROUP_PEWTER_CITY, MAP_PEWTER_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_SUPER_NERD, 9, 7, $9, $0, 255, 255, $a0, 0, SuperNerdScript_0x1a2807, -1
	person_event SPRITE_GROWLITHE, 9, 8, $16, $0, 255, 255, $90, 0, GrowlitheScript_0x1a280a, -1
