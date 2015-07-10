SafariZoneFuchsiaGateBeta_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

SafariZoneFuchsiaGateBeta_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 1, GROUP_SAFARI_ZONE_BETA, MAP_SAFARI_ZONE_BETA
	warp_def $0, $5, 2, GROUP_SAFARI_ZONE_BETA, MAP_SAFARI_ZONE_BETA
	warp_def $7, $4, 7, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $5, 7, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
