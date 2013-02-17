SafariZoneMainOffice_MapScriptHeader: ; 0x195da5
	; trigger count
	db 0

	; callback count
	db 0
; 0x195da7

SafariZoneMainOffice_MapEventHeader: ; 0x195da7
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $3, 2, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
; 0x195db7

