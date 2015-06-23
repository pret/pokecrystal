Route19FuchsiaGate_MapScriptHeader: ; 0x1ab3f4
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ab3f6

OfficerScript_0x1ab3f6: ; 0x1ab3f6
	faceplayer
	loadfont
	checkevent $00d7
	iftrue UnknownScript_0x1ab404
	writetext UnknownText_0x1ab40a
	closetext
	loadmovesprites
	end
; 0x1ab404

UnknownScript_0x1ab404: ; 0x1ab404
	writetext UnknownText_0x1ab48a
	closetext
	loadmovesprites
	end
; 0x1ab40a

UnknownText_0x1ab40a: ; 0x1ab40a
	text "CINNABAR's volcano"
	line "erupted."

	para "It hurled boulders"
	line "that cut off ROUTE"
	cont "19 indefinitely."

	para "I wonder if the"
	line "people of CINNABAR"
	cont "are safe…"
	done
; 0x1ab48a

UnknownText_0x1ab48a: ; 0x1ab48a
	text "No CINNABAR citi-"
	line "zens were injured"

	para "by the eruption."
	line "That's great!"
	done
; 0x1ab4cd

Route19FuchsiaGate_MapEventHeader: ; 0x1ab4cd
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 10, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $0, $5, 11, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $4, 1, GROUP_ROUTE_19, MAP_ROUTE_19
	warp_def $7, $5, 1, GROUP_ROUTE_19, MAP_ROUTE_19

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 8, 4, $9, $0, 255, 255, $90, 0, OfficerScript_0x1ab3f6, $ffff
; 0x1ab4f4
