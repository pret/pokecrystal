	const_def
	const PAL_TOWNMAP_BORDER   ; 0
	const PAL_TOWNMAP_EARTH    ; 1
	const PAL_TOWNMAP_MOUNTAIN ; 2
	const PAL_TOWNMAP_CITY     ; 3
	const PAL_TOWNMAP_POI      ; 4
	const PAL_TOWNMAP_POI_MTN  ; 5

townmappals: MACRO
rept _NARG / 2
	dn PAL_TOWNMAP_\2, PAL_TOWNMAP_\1
	shift
	shift
endr
ENDM

; gfx/pokegear/town_map.png
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN
	townmappals BORDER,   BORDER,   EARTH,    EARTH,    CITY,     EARTH
	townmappals POI,      POI_MTN,  POI,      POI_MTN,  EARTH,    EARTH
	townmappals EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals EARTH,    EARTH,    BORDER,   EARTH,    EARTH,    BORDER
	townmappals BORDER,   BORDER,   EARTH,    EARTH,    EARTH,    MOUNTAIN
	townmappals MOUNTAIN, MOUNTAIN, BORDER,   BORDER,   BORDER,   BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
; gfx/pokegear/pokegear.png
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   POI,      POI
	townmappals POI,      BORDER,   BORDER,   BORDER,   BORDER,   BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   CITY,     CITY
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY
	townmappals CITY,     BORDER,   CITY,     CITY,     CITY,     CITY
	townmappals CITY,     CITY,     CITY,     CITY,     BORDER,   BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
