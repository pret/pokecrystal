; swarms in grass

; Dunsparce swarm
	db GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE
	db $0a,$0a,$0a ; encounter rates: morn/day/nite
	; morn
	db 3,GEODUDE
	db 3,DUNSPARCE
	db 2,ZUBAT
	db 2,GEODUDE
	db 2,DUNSPARCE
	db 4,DUNSPARCE
	db 4,DUNSPARCE
	; day
	db 3,GEODUDE
	db 3,DUNSPARCE
	db 2,ZUBAT
	db 2,GEODUDE
	db 2,DUNSPARCE
	db 4,DUNSPARCE
	db 4,DUNSPARCE
	; nite
	db 3,GEODUDE
	db 3,DUNSPARCE
	db 2,ZUBAT
	db 2,GEODUDE
	db 2,DUNSPARCE
	db 4,DUNSPARCE
	db 4,DUNSPARCE

; Yanma swarm
	db GROUP_ROUTE_35, MAP_ROUTE_35
	db $19,$19,$19 ; encounter rates: morn/day/nite
	; morn
	db 12,NIDORAN_M
	db 12,NIDORAN_F
	db 12,YANMA
	db 14,YANMA
	db 14,PIDGEY
	db 10,DITTO
	db 10,DITTO
	; day
	db 12,NIDORAN_M
	db 12,NIDORAN_F
	db 12,YANMA
	db 14,YANMA
	db 14,PIDGEY
	db 10,DITTO
	db 10,DITTO
	; nite
	db 12,NIDORAN_M
	db 12,NIDORAN_F
	db 12,YANMA
	db 14,YANMA
	db 14,HOOTHOOT
	db 10,DITTO
	db 10,DITTO

	db $ff ; end
