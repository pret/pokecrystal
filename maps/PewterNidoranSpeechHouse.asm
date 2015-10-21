PewterNidoranSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 2
	warp_def $7, $2, 1, PEWTER_CITY
	warp_def $7, $3, 1, PEWTER_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_SUPER_NERD, 5 + 4, 3 + 4, $9, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, 0, 0, SuperNerdScript_0x1a2807, -1
	person_event SPRITE_GROWLITHE, 5 + 4, 4 + 4, $16, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, 0, 0, GrowlitheScript_0x1a280a, -1
