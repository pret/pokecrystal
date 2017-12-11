treemon_map: macro
	map \1
	db  \2 ; treemon set
endm

TreeMonMaps: ; b825e
	treemon_map ROUTE_26, 4
	treemon_map ROUTE_27, 4
	treemon_map ROUTE_28, 0
	treemon_map ROUTE_29, 3
	treemon_map ROUTE_30, 3
	treemon_map ROUTE_31, 3
	treemon_map ROUTE_32, 4
	treemon_map ROUTE_33, 2
	treemon_map ROUTE_34, 3
	treemon_map ROUTE_35, 3
	treemon_map ROUTE_36, 3
	treemon_map ROUTE_37, 3
	treemon_map ROUTE_38, 3
	treemon_map ROUTE_39, 3
	treemon_map ROUTE_40, 0
	treemon_map ROUTE_41, 0
	treemon_map ROUTE_42, 2
	treemon_map ROUTE_43, 5
	treemon_map ROUTE_44, 1
	treemon_map ROUTE_45, 1
	treemon_map ROUTE_46, 1
	treemon_map NEW_BARK_TOWN, 0
	treemon_map CHERRYGROVE_CITY, 0
	treemon_map VIOLET_CITY, 0
	treemon_map AZALEA_TOWN, 2
	treemon_map CIANWOOD_CITY, 0
	treemon_map GOLDENROD_CITY, 0
	treemon_map OLIVINE_CITY, 0
	treemon_map ECRUTEAK_CITY, 0
	treemon_map MAHOGANY_TOWN, 0
	treemon_map LAKE_OF_RAGE, 5
	treemon_map BLACKTHORN_CITY, 0
	treemon_map SILVER_CAVE_OUTSIDE, 0
	treemon_map ILEX_FOREST, 6
	db -1
; b82c5

RockMonMaps: ; b82c5
	treemon_map CIANWOOD_CITY, 7
	treemon_map ROUTE_40, 7
	treemon_map DARK_CAVE_VIOLET_ENTRANCE, 7
	treemon_map SLOWPOKE_WELL_B1F, 7
	db -1
; b82d2
