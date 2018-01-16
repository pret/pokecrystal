; Maps that roaming monsters can be on, and possible maps they can jump to.
; Notably missing are Route 40 and Route 41, which are water routes.

roam_map: MACRO
; map, # of other maps, other maps
	map \1
	db  \2
rept \2
	map \3
	shift
endr
	db 0
ENDM

RoamMaps: ; 2a40f
; there are NUM_ROAMMON_MAPS entries
	roam_map ROUTE_29, 2, ROUTE_30, ROUTE_46
	roam_map ROUTE_30, 2, ROUTE_29, ROUTE_31
	roam_map ROUTE_31, 3, ROUTE_30, ROUTE_32, ROUTE_36
	roam_map ROUTE_32, 3, ROUTE_36, ROUTE_31, ROUTE_33
	roam_map ROUTE_33, 2, ROUTE_32, ROUTE_34
	roam_map ROUTE_34, 2, ROUTE_33, ROUTE_35
	roam_map ROUTE_35, 2, ROUTE_34, ROUTE_36
	roam_map ROUTE_36, 4, ROUTE_35, ROUTE_31, ROUTE_32, ROUTE_37
	roam_map ROUTE_37, 3, ROUTE_36, ROUTE_38, ROUTE_42
	roam_map ROUTE_38, 3, ROUTE_37, ROUTE_39, ROUTE_42
	roam_map ROUTE_39, 1, ROUTE_38
	roam_map ROUTE_42, 4, ROUTE_43, ROUTE_44, ROUTE_37, ROUTE_38
	roam_map ROUTE_43, 2, ROUTE_42, ROUTE_44
	roam_map ROUTE_44, 3, ROUTE_42, ROUTE_43, ROUTE_45
	roam_map ROUTE_45, 2, ROUTE_44, ROUTE_46
	roam_map ROUTE_46, 2, ROUTE_45, ROUTE_29
	db -1 ; end
; 2a4a0
