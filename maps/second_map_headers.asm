map_header_2: MACRO
; label, map, border block, connections
\1_SecondMapHeader::
	db \3
\2\@HEIGHT EQUS "\2_HEIGHT"
\2\@WIDTH  EQUS "\2_WIDTH"
	db \2\@HEIGHT, \2\@WIDTH
	db BANK(\1_BlockData)
	dw \1_BlockData
	db BANK(\1_MapScriptHeader)
	dw \1_MapScriptHeader
	dw \1_MapEventHeader
	db \4
ENDM

	map_header_2 NewBarkTown, NEW_BARK_TOWN, $5, WEST | EAST ; 0x94dd8

	; WEST to Route 29
	map ROUTE_29
	dw (Route29_BlockData + ROUTE_29_WIDTH - 3) ; strip pointer
	dw $c830 ; strip destination
	db 9, ROUTE_29_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_29_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window

	; EAST to Route 27
	map ROUTE_27
	dw (Route27_BlockData) ; strip pointer
	dw $c83d ; strip destination
	db 9, ROUTE_27_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_27_WIDTH) ; window
; 0x94dfc

	map_header_2 CherrygroveCity, CHERRYGROVE_CITY, $35, NORTH | EAST ; 0x94dfc

	; NORTH to Route 30
	map ROUTE_30
	dw (Route30_BlockData + (ROUTE_30_HEIGHT * ROUTE_30_WIDTH) - (ROUTE_30_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_30_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_30_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_30_HEIGHT * 6) + (ROUTE_30_HEIGHT * ROUTE_30_WIDTH))) ; window

	; EAST to Route 29
	map ROUTE_29
	dw (Route29_BlockData) ; strip pointer
	dw $c865 ; strip destination
	db 9, ROUTE_29_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_29_WIDTH) ; window
; 0x94e20

	map_header_2 VioletCity, VIOLET_CITY, $5, SOUTH | WEST | EAST ; 0x94e20

	; SOUTH to Route 32
	map ROUTE_32
	dw (Route32_BlockData) ; strip pointer
	dw ($C703 + 256 + ((VIOLET_CITY_HEIGHT + 3) * (VIOLET_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_32_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_32_WIDTH) ; window

	; WEST to Route 36
	map ROUTE_36
	dw (Route36_BlockData + ROUTE_36_WIDTH - 3) ; strip pointer
	dw $c84e ; strip destination
	db 9, ROUTE_36_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_36_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window

	; EAST to Route 31
	map ROUTE_31
	dw (Route31_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_31_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_31_WIDTH) ; window
; 0x94e50

	map_header_2 AzaleaTown, AZALEA_TOWN, $5, WEST | EAST ; 0x94e50

	; WEST to Route 34
	map ROUTE_34
	dw (Route34_BlockData + (((ROUTE_34_HEIGHT - AZALEA_TOWN_HEIGHT) * ROUTE_34_WIDTH) - (ROUTE_34_WIDTH * 3) + (ROUTE_34_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, ROUTE_34_WIDTH ; (connection strip length, connected map width)
	db 36, ((ROUTE_34_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 33
	map ROUTE_33
	dw (Route33_BlockData) ; strip pointer
	dw $c865 ; strip destination
	db 9, ROUTE_33_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_33_WIDTH) ; window
; 0x94e74

	map_header_2 CianwoodCity, CIANWOOD_CITY, $35, EAST ; 0x94e74

	; EAST to Route 41
	map ROUTE_41
	dw (Route41_BlockData) ; strip pointer
	dw $c851 ; strip destination
	db 27, ROUTE_41_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_41_WIDTH) ; window
; 0x94e8c

	map_header_2 GoldenrodCity, GOLDENROD_CITY, $35, NORTH | SOUTH ; 0x94e8c

	; NORTH to Route 35
	map ROUTE_35
	dw (Route35_BlockData + (ROUTE_35_HEIGHT * ROUTE_35_WIDTH) - (ROUTE_35_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_35_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_35_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_35_HEIGHT * 6) + (ROUTE_35_HEIGHT * ROUTE_35_WIDTH))) ; window

	; SOUTH to Route 34
	map ROUTE_34
	dw (Route34_BlockData) ; strip pointer
	dw ($C703 + 261 + ((GOLDENROD_CITY_HEIGHT + 3) * (GOLDENROD_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_34_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_34_WIDTH) ; window
; 0x94eb0

	map_header_2 OlivineCity, OLIVINE_CITY, $35, NORTH | WEST ; 0x94eb0

	; NORTH to Route 39
	map ROUTE_39
	dw (Route39_BlockData + (ROUTE_39_HEIGHT * ROUTE_39_WIDTH) - (ROUTE_39_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_39_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_39_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_39_HEIGHT * 6) + (ROUTE_39_HEIGHT * ROUTE_39_WIDTH))) ; window

	; WEST to Route 40
	map ROUTE_40
	dw (Route40_BlockData + ROUTE_40_WIDTH - 3) ; strip pointer
	dw $c938 ; strip destination
	db 12, ROUTE_40_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_40_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window
; 0x94ed4

	map_header_2 EcruteakCity, ECRUTEAK_CITY, $5, SOUTH | WEST | EAST ; 0x94ed4

	; SOUTH to Route 37
	map ROUTE_37
	dw (Route37_BlockData) ; strip pointer
	dw ($C703 + 261 + ((ECRUTEAK_CITY_HEIGHT + 3) * (ECRUTEAK_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_37_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_37_WIDTH) ; window

	; WEST to Route 38
	map ROUTE_38
	dw (Route38_BlockData + ROUTE_38_WIDTH - 3) ; strip pointer
	dw $c8d0 ; strip destination
	db 9, ROUTE_38_WIDTH ; (connection strip length, connected map width)
	db 246, ((ROUTE_38_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Route 42
	map ROUTE_42
	dw (Route42_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_42_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_42_WIDTH) ; window
; 0x94f04

	map_header_2 MahoganyTown, MAHOGANY_TOWN, $71, NORTH | WEST | EAST ; 0x94f04

	; NORTH to Route 43
	map ROUTE_43
	dw (Route43_BlockData + (ROUTE_43_HEIGHT * ROUTE_43_WIDTH) - (ROUTE_43_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_43_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_43_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_43_HEIGHT * 6) + (ROUTE_43_HEIGHT * ROUTE_43_WIDTH))) ; window

	; WEST to Route 42
	map ROUTE_42
	dw (Route42_BlockData + ROUTE_42_WIDTH - 3) ; strip pointer
	dw $c830 ; strip destination
	db 9, ROUTE_42_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_42_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window

	; EAST to Route 44
	map ROUTE_44
	dw (Route44_BlockData) ; strip pointer
	dw $c83d ; strip destination
	db 9, ROUTE_44_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_44_WIDTH) ; window
; 0x94f34

	map_header_2 LakeofRage, LAKE_OF_RAGE, $5, SOUTH ; 0x94f34

	; SOUTH to Route 43
	map ROUTE_43
	dw (Route43_BlockData) ; strip pointer
	dw ($C703 + 261 + ((LAKE_OF_RAGE_HEIGHT + 3) * (LAKE_OF_RAGE_WIDTH + 6))) ; strip destination
	db 10, ROUTE_43_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_43_WIDTH) ; window
; 0x94f4c

	map_header_2 BlackthornCity, BLACKTHORN_CITY, $71, SOUTH | WEST ; 0x94f4c

	; SOUTH to Route 45
	map ROUTE_45
	dw (Route45_BlockData) ; strip pointer
	dw ($C703 + 256 + ((BLACKTHORN_CITY_HEIGHT + 3) * (BLACKTHORN_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_45_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_45_WIDTH) ; window

	; WEST to Route 44
	map ROUTE_44
	dw (Route44_BlockData + ROUTE_44_WIDTH - 3) ; strip pointer
	dw $c938 ; strip destination
	db 9, ROUTE_44_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_44_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window
; 0x94f70

	map_header_2 SilverCaveOutside, SILVER_CAVE_OUTSIDE, $2c, EAST ; 0x94f70

	; EAST to Route 28
	map ROUTE_28
	dw (Route28_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_28_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_28_WIDTH) ; window
; 0x94f88

	map_header_2 Route26, ROUTE_26, $5, WEST ; 0x94f88

	; WEST to Route 27
	map ROUTE_27
	dw (Route27_BlockData + ROUTE_27_WIDTH - 3) ; strip pointer
	dw $cb00 ; strip destination
	db 9, ROUTE_27_WIDTH ; (connection strip length, connected map width)
	db 166, ((ROUTE_27_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 79) ; window
; 0x94fa0

	map_header_2 Route27, ROUTE_27, $35, WEST | EAST ; 0x94fa0

	; WEST to New Bark Town
	map NEW_BARK_TOWN
	dw (NewBarkTown_BlockData + NEW_BARK_TOWN_WIDTH - 3) ; strip pointer
	dw $c88a ; strip destination
	db 9, NEW_BARK_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, ((NEW_BARK_TOWN_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 26
	map ROUTE_26
	dw (Route26_BlockData + ((ROUTE_26_HEIGHT - 12) * ROUTE_26_WIDTH)) ; strip pointer
	dw $c82b ; strip destination
	db 12, ROUTE_26_WIDTH ; (connection strip length, connected map width)
	db 90, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_26_WIDTH) ; window
; 0x94fc4

	map_header_2 Route28, ROUTE_28, $2c, WEST ; 0x94fc4

	; WEST to Silver Cave Outside
	map SILVER_CAVE_OUTSIDE
	dw (SilverCaveOutside_BlockData + (((SILVER_CAVE_OUTSIDE_HEIGHT - ROUTE_28_HEIGHT) * SILVER_CAVE_OUTSIDE_WIDTH) - (SILVER_CAVE_OUTSIDE_WIDTH * 3) + (SILVER_CAVE_OUTSIDE_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, SILVER_CAVE_OUTSIDE_WIDTH ; (connection strip length, connected map width)
	db 18, ((SILVER_CAVE_OUTSIDE_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x94fdc

	map_header_2 Route29, ROUTE_29, $5, NORTH | WEST | EAST ; 0x94fdc

	; NORTH to Route 46
	map ROUTE_46
	dw (Route46_BlockData + (ROUTE_46_HEIGHT * ROUTE_46_WIDTH) - (ROUTE_46_WIDTH * 3)) ; strip pointer
	dw ($C703 + 266) ; strip destination
	db 10, ROUTE_46_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_46_HEIGHT * 2) - 1), 236 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_46_HEIGHT * 6) + (ROUTE_46_HEIGHT * ROUTE_46_WIDTH))) ; window

	; WEST to Cherrygrove City
	map CHERRYGROVE_CITY
	dw (CherrygroveCity_BlockData + CHERRYGROVE_CITY_WIDTH - 3) ; strip pointer
	dw $c86c ; strip destination
	db 9, CHERRYGROVE_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, ((CHERRYGROVE_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to New Bark Town
	map NEW_BARK_TOWN
	dw (NewBarkTown_BlockData) ; strip pointer
	dw $c88d ; strip destination
	db 9, NEW_BARK_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + NEW_BARK_TOWN_WIDTH) ; window
; 0x9500c

	map_header_2 Route30, ROUTE_30, $5, NORTH | SOUTH ; 0x9500c

	; NORTH to Route 31
	map ROUTE_31
	dw (Route31_BlockData + ((ROUTE_31_HEIGHT - 3) * ROUTE_31_WIDTH) + 7) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 13, ROUTE_31_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_31_HEIGHT * 2) - 1), 20 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_31_HEIGHT * 6) + (ROUTE_31_HEIGHT * ROUTE_31_WIDTH))) ; window

	; SOUTH to Cherrygrove City
	map CHERRYGROVE_CITY
	dw (CherrygroveCity_BlockData + ((10 - 16 + ROUTE_30_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_30_HEIGHT + 3) * (ROUTE_30_WIDTH + 6))) ; strip destination
	db 16, CHERRYGROVE_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + CHERRYGROVE_CITY_WIDTH) ; window
; 0x95030

	map_header_2 Route31, ROUTE_31, $5, SOUTH | WEST ; 0x95030

	; SOUTH to Route 30
	map ROUTE_30
	dw (Route30_BlockData) ; strip pointer
	dw ($C703 + 266 + ((ROUTE_31_HEIGHT + 3) * (ROUTE_31_WIDTH + 6))) ; strip destination
	db 10, ROUTE_30_WIDTH ; (connection strip length, connected map width)
	db 0, 236 ; yoffset, xoffset
	dw ($C807 + ROUTE_30_WIDTH) ; window

	; WEST to Violet City
	map VIOLET_CITY
	dw (VioletCity_BlockData + (((VIOLET_CITY_HEIGHT - ROUTE_31_HEIGHT) * VIOLET_CITY_WIDTH) - (VIOLET_CITY_WIDTH * 3) + (VIOLET_CITY_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, VIOLET_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, ((VIOLET_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x95054

	map_header_2 Route32, ROUTE_32, $5, NORTH | SOUTH ; 0x95054

	; NORTH to Violet City
	map VIOLET_CITY
	dw (VioletCity_BlockData + (VIOLET_CITY_HEIGHT * VIOLET_CITY_WIDTH) - (VIOLET_CITY_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, VIOLET_CITY_WIDTH ; (connection strip length, connected map width)
	db ((VIOLET_CITY_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((VIOLET_CITY_HEIGHT * 6) + (VIOLET_CITY_HEIGHT * VIOLET_CITY_WIDTH))) ; window

	; SOUTH to Route 33
	map ROUTE_33
	dw (Route33_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_32_HEIGHT + 3) * (ROUTE_32_WIDTH + 6))) ; strip destination
	db 10, ROUTE_33_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_33_WIDTH) ; window
; 0x95078

	map_header_2 Route33, ROUTE_33, $5, NORTH | WEST ; 0x95078

	; NORTH to Route 32
	map ROUTE_32
	dw (Route32_BlockData + (ROUTE_32_HEIGHT * ROUTE_32_WIDTH) - (ROUTE_32_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_32_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_32_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_32_HEIGHT * 6) + (ROUTE_32_HEIGHT * ROUTE_32_WIDTH))) ; window

	; WEST to Azalea Town
	map AZALEA_TOWN
	dw (AzaleaTown_BlockData + AZALEA_TOWN_WIDTH - 3) ; strip pointer
	dw $c830 ; strip destination
	db 9, AZALEA_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, ((AZALEA_TOWN_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x9509c

	map_header_2 Route34, ROUTE_34, $5, NORTH | EAST ; 0x9509c

	; NORTH to Goldenrod City
	map GOLDENROD_CITY
	dw (GoldenrodCity_BlockData + GOLDENROD_CITY_WIDTH + 10 + (16 * GOLDENROD_CITY_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, GOLDENROD_CITY_WIDTH ; (connection strip length, connected map width)
	db ((GOLDENROD_CITY_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((GOLDENROD_CITY_HEIGHT * 6) + (GOLDENROD_CITY_HEIGHT * GOLDENROD_CITY_WIDTH))) ; window

	; EAST to Azalea Town
	map AZALEA_TOWN
	dw (AzaleaTown_BlockData) ; strip pointer
	dw $c95d ; strip destination
	db 9, AZALEA_TOWN_WIDTH ; (connection strip length, connected map width)
	db 220, 0 ; yoffset, xoffset
	dw ($C807 + AZALEA_TOWN_WIDTH) ; window
; 0x950c0

	map_header_2 Route35, ROUTE_35, $5, NORTH | SOUTH ; 0x950c0

	; NORTH to Route 36
	map ROUTE_36
	dw (Route36_BlockData + (ROUTE_36_HEIGHT * ROUTE_36_WIDTH) - (ROUTE_36_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, ROUTE_36_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_36_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_36_HEIGHT * 6) + (ROUTE_36_HEIGHT * ROUTE_36_WIDTH))) ; window

	; SOUTH to Goldenrod City
	map GOLDENROD_CITY
	dw (GoldenrodCity_BlockData + ((10 - 16 + ROUTE_35_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_35_HEIGHT + 3) * (ROUTE_35_WIDTH + 6))) ; strip destination
	db 16, GOLDENROD_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + GOLDENROD_CITY_WIDTH) ; window
; 0x950e4

	map_header_2 Route36, ROUTE_36, $5, NORTH | SOUTH | EAST ; 0x950e4

	; NORTH to Route 37
	map ROUTE_37
	dw (Route37_BlockData + (ROUTE_37_HEIGHT * ROUTE_37_WIDTH) - (ROUTE_37_WIDTH * 3)) ; strip pointer
	dw ($C703 + 266) ; strip destination
	db 10, ROUTE_37_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_37_HEIGHT * 2) - 1), 236 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_37_HEIGHT * 6) + (ROUTE_37_HEIGHT * ROUTE_37_WIDTH))) ; window

	; SOUTH to Route 35
	map ROUTE_35
	dw (Route35_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_36_HEIGHT + 3) * (ROUTE_36_WIDTH + 6))) ; strip destination
	db 10, ROUTE_35_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_35_WIDTH) ; window

	; EAST to Violet City
	map VIOLET_CITY
	dw (VioletCity_BlockData) ; strip pointer
	dw $c88d ; strip destination
	db 12, VIOLET_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + VIOLET_CITY_WIDTH) ; window
; 0x95114

	map_header_2 Route37, ROUTE_37, $5, NORTH | SOUTH ; 0x95114

	; NORTH to Ecruteak City
	map ECRUTEAK_CITY
	dw (EcruteakCity_BlockData + ECRUTEAK_CITY_WIDTH + 10 + (16 * ECRUTEAK_CITY_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, ECRUTEAK_CITY_WIDTH ; (connection strip length, connected map width)
	db ((ECRUTEAK_CITY_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((ECRUTEAK_CITY_HEIGHT * 6) + (ECRUTEAK_CITY_HEIGHT * ECRUTEAK_CITY_WIDTH))) ; window

	; SOUTH to Route 36
	map ROUTE_36
	dw (Route36_BlockData + ((20 - 16 + ROUTE_37_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_37_HEIGHT + 3) * (ROUTE_37_WIDTH + 6))) ; strip destination
	db 16, ROUTE_36_WIDTH ; (connection strip length, connected map width)
	db 0, 20 ; yoffset, xoffset
	dw ($C807 + ROUTE_36_WIDTH) ; window
; 0x95138

	map_header_2 Route38, ROUTE_38, $5, WEST | EAST ; 0x95138

	; WEST to Route 39
	map ROUTE_39
	dw (Route39_BlockData + ROUTE_39_WIDTH - 3) ; strip pointer
	dw $c84e ; strip destination
	db 12, ROUTE_39_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_39_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Ecruteak City
	map ECRUTEAK_CITY
	dw (EcruteakCity_BlockData + ((100 - (ECRUTEAK_CITY_WIDTH * 4)) * 2)) ; strip pointer
	dw $c817 ; strip destination
	db 15, ECRUTEAK_CITY_WIDTH ; (connection strip length, connected map width)
	db 10, 0 ; yoffset, xoffset
	dw ($C807 + ECRUTEAK_CITY_WIDTH) ; window
; 0x9515c

	map_header_2 Route39, ROUTE_39, $5, SOUTH | EAST ; 0x9515c

	; SOUTH to Olivine City
	map OLIVINE_CITY
	dw (OlivineCity_BlockData + ((10 - 16 + ROUTE_39_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_39_HEIGHT + 3) * (ROUTE_39_WIDTH + 6))) ; strip destination
	db 16, OLIVINE_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + OLIVINE_CITY_WIDTH) ; window

	; EAST to Route 38
	map ROUTE_38
	dw (Route38_BlockData) ; strip pointer
	dw $c83d ; strip destination
	db 9, ROUTE_38_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_38_WIDTH) ; window
; 0x95180

	map_header_2 Route40, ROUTE_40, $35, SOUTH | EAST ; 0x95180

	; SOUTH to Route 41
	map ROUTE_41
	dw (Route41_BlockData + (((30 - 13 + ROUTE_40_WIDTH) / 2) - 1)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_40_HEIGHT + 3) * (ROUTE_40_WIDTH + 6))) ; strip destination
	db 13, ROUTE_41_WIDTH ; (connection strip length, connected map width)
	db 0, 30 ; yoffset, xoffset
	dw ($C807 + ROUTE_41_WIDTH) ; window

	; EAST to Olivine City
	map OLIVINE_CITY
	dw (OlivineCity_BlockData + ((OLIVINE_CITY_HEIGHT - 12) * OLIVINE_CITY_WIDTH)) ; strip pointer
	dw $c80d ; strip destination
	db 12, OLIVINE_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + OLIVINE_CITY_WIDTH) ; window
; 0x951a4

	map_header_2 Route41, ROUTE_41, $35, NORTH | WEST ; 0x951a4

	; NORTH to Route 40
	map ROUTE_40
	dw (Route40_BlockData + (ROUTE_40_HEIGHT * ROUTE_40_WIDTH) - (ROUTE_40_WIDTH * 3)) ; strip pointer
	dw ($C703 + 271) ; strip destination
	db 10, ROUTE_40_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_40_HEIGHT * 2) - 1), 226 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_40_HEIGHT * 6) + (ROUTE_40_HEIGHT * ROUTE_40_WIDTH))) ; window

	; WEST to Cianwood City
	map CIANWOOD_CITY
	dw (CianwoodCity_BlockData + CIANWOOD_CITY_WIDTH - 3) ; strip pointer
	dw $c85d ; strip destination
	db 27, CIANWOOD_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, ((CIANWOOD_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 29) ; window
; 0x951c8

	map_header_2 Route42, ROUTE_42, $5, WEST | EAST ; 0x951c8

	; WEST to Ecruteak City
	map ECRUTEAK_CITY
	dw (EcruteakCity_BlockData + (((ECRUTEAK_CITY_HEIGHT - ROUTE_42_HEIGHT) * ECRUTEAK_CITY_WIDTH) - (ECRUTEAK_CITY_WIDTH * 3) + (ECRUTEAK_CITY_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, ECRUTEAK_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, ((ECRUTEAK_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Mahogany Town
	map MAHOGANY_TOWN
	dw (MahoganyTown_BlockData) ; strip pointer
	dw $c88d ; strip destination
	db 9, MAHOGANY_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + MAHOGANY_TOWN_WIDTH) ; window
; 0x951ec

	map_header_2 Route43, ROUTE_43, $5, NORTH | SOUTH ; 0x951ec

	; NORTH to Lake of Rage
	map LAKE_OF_RAGE
	dw (LakeofRage_BlockData + LAKE_OF_RAGE_WIDTH + 10 + (16 * LAKE_OF_RAGE_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, LAKE_OF_RAGE_WIDTH ; (connection strip length, connected map width)
	db ((LAKE_OF_RAGE_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((LAKE_OF_RAGE_HEIGHT * 6) + (LAKE_OF_RAGE_HEIGHT * LAKE_OF_RAGE_WIDTH))) ; window

	; SOUTH to Mahogany Town
	map MAHOGANY_TOWN
	dw (MahoganyTown_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_43_HEIGHT + 3) * (ROUTE_43_WIDTH + 6))) ; strip destination
	db 10, MAHOGANY_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + MAHOGANY_TOWN_WIDTH) ; window
; 0x95210

	map_header_2 Route44, ROUTE_44, $71, WEST | EAST ; 0x95210

	; WEST to Mahogany Town
	map MAHOGANY_TOWN
	dw (MahoganyTown_BlockData + MAHOGANY_TOWN_WIDTH - 3) ; strip pointer
	dw $c86c ; strip destination
	db 9, MAHOGANY_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, ((MAHOGANY_TOWN_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Blackthorn City
	map BLACKTHORN_CITY
	dw (BlackthornCity_BlockData + ((BLACKTHORN_CITY_HEIGHT - 12) * BLACKTHORN_CITY_WIDTH)) ; strip pointer
	dw $c821 ; strip destination
	db 12, BLACKTHORN_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + BLACKTHORN_CITY_WIDTH) ; window
; 0x95234

	map_header_2 Route45, ROUTE_45, $71, NORTH | WEST ; 0x95234

	; NORTH to Blackthorn City
	map BLACKTHORN_CITY
	dw (BlackthornCity_BlockData + (BLACKTHORN_CITY_HEIGHT * BLACKTHORN_CITY_WIDTH) - (BLACKTHORN_CITY_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, BLACKTHORN_CITY_WIDTH ; (connection strip length, connected map width)
	db ((BLACKTHORN_CITY_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((BLACKTHORN_CITY_HEIGHT * 6) + (BLACKTHORN_CITY_HEIGHT * BLACKTHORN_CITY_WIDTH))) ; window

	; WEST to Route 46
	map ROUTE_46
	dw (Route46_BlockData + ROUTE_46_WIDTH - 3) ; strip pointer
	dw $ca70 ; strip destination
	db 12, ROUTE_46_WIDTH ; (connection strip length, connected map width)
	db 184, ((ROUTE_46_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window
; 0x95258

	map_header_2 Route46, ROUTE_46, $5, SOUTH | EAST ; 0x95258

	; SOUTH to Route 29
	map ROUTE_29
	dw (Route29_BlockData + ((20 - 16 + ROUTE_46_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_46_HEIGHT + 3) * (ROUTE_46_WIDTH + 6))) ; strip destination
	db 16, ROUTE_29_WIDTH ; (connection strip length, connected map width)
	db 0, 20 ; yoffset, xoffset
	dw ($C807 + ROUTE_29_WIDTH) ; window

	; EAST to Route 45
	map ROUTE_45
	dw (Route45_BlockData + ((ROUTE_45_HEIGHT - 12) * ROUTE_45_WIDTH)) ; strip pointer
	dw $c80d ; strip destination
	db 12, ROUTE_45_WIDTH ; (connection strip length, connected map width)
	db 72, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_45_WIDTH) ; window
; 0x9527c

	map_header_2 PewterCity, PEWTER_CITY, $f, SOUTH | EAST ; 0x9527c

	; SOUTH to Route 2
	map ROUTE_2
	dw (Route2_BlockData) ; strip pointer
	dw ($C703 + 261 + ((PEWTER_CITY_HEIGHT + 3) * (PEWTER_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_2_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_2_WIDTH) ; window

	; EAST to Route 3
	map ROUTE_3
	dw (Route3_BlockData) ; strip pointer
	dw $c8e7 ; strip destination
	db 9, ROUTE_3_WIDTH ; (connection strip length, connected map width)
	db 246, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_3_WIDTH) ; window
; 0x952a0

	map_header_2 Route2, ROUTE_2, $f, NORTH | SOUTH ; 0x952a0

	; NORTH to Pewter City
	map PEWTER_CITY
	dw (PewterCity_BlockData + PEWTER_CITY_WIDTH + 10 + (16 * PEWTER_CITY_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, PEWTER_CITY_WIDTH ; (connection strip length, connected map width)
	db ((PEWTER_CITY_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((PEWTER_CITY_HEIGHT * 6) + (PEWTER_CITY_HEIGHT * PEWTER_CITY_WIDTH))) ; window

	; SOUTH to Viridian City
	map VIRIDIAN_CITY
	dw (ViridianCity_BlockData + ((10 - 16 + ROUTE_2_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_2_HEIGHT + 3) * (ROUTE_2_WIDTH + 6))) ; strip destination
	db 16, VIRIDIAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + VIRIDIAN_CITY_WIDTH) ; window
; 0x952c4

	map_header_2 ViridianCity, VIRIDIAN_CITY, $f, NORTH | SOUTH | WEST ; 0x952c4

	; NORTH to Route 2
	map ROUTE_2
	dw (Route2_BlockData + (ROUTE_2_HEIGHT * ROUTE_2_WIDTH) - (ROUTE_2_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_2_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_2_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_2_HEIGHT * 6) + (ROUTE_2_HEIGHT * ROUTE_2_WIDTH))) ; window

	; SOUTH to Route 1
	map ROUTE_1
	dw (Route1_BlockData) ; strip pointer
	dw ($C703 + 266 + ((VIRIDIAN_CITY_HEIGHT + 3) * (VIRIDIAN_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_1_WIDTH ; (connection strip length, connected map width)
	db 0, 236 ; yoffset, xoffset
	dw ($C807 + ROUTE_1_WIDTH) ; window

	; WEST to Route 22
	map ROUTE_22
	dw (Route22_BlockData + ROUTE_22_WIDTH - 3) ; strip pointer
	dw $c8b6 ; strip destination
	db 9, ROUTE_22_WIDTH ; (connection strip length, connected map width)
	db 248, ((ROUTE_22_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x952f4

	map_header_2 Route22, ROUTE_22, $2c, EAST ; 0x952f4

	; EAST to Viridian City
	map VIRIDIAN_CITY
	dw (ViridianCity_BlockData + 100 - (VIRIDIAN_CITY_WIDTH * 4)) ; strip pointer
	dw $c817 ; strip destination
	db 15, VIRIDIAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 8, 0 ; yoffset, xoffset
	dw ($C807 + VIRIDIAN_CITY_WIDTH) ; window
; 0x9530c

	map_header_2 Route1, ROUTE_1, $f, NORTH | SOUTH ; 0x9530c

	; NORTH to Viridian City
	map VIRIDIAN_CITY
	dw (ViridianCity_BlockData + ((VIRIDIAN_CITY_HEIGHT - 3) * VIRIDIAN_CITY_WIDTH) + 7) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 13, VIRIDIAN_CITY_WIDTH ; (connection strip length, connected map width)
	db ((VIRIDIAN_CITY_HEIGHT * 2) - 1), 20 ; yoffset, xoffset
	dw ($C801 + ((VIRIDIAN_CITY_HEIGHT * 6) + (VIRIDIAN_CITY_HEIGHT * VIRIDIAN_CITY_WIDTH))) ; window

	; SOUTH to Pallet Town
	map PALLET_TOWN
	dw (PalletTown_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_1_HEIGHT + 3) * (ROUTE_1_WIDTH + 6))) ; strip destination
	db 10, PALLET_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + PALLET_TOWN_WIDTH) ; window
; 0x95330

	map_header_2 PalletTown, PALLET_TOWN, $f, NORTH | SOUTH ; 0x95330

	; NORTH to Route 1
	map ROUTE_1
	dw (Route1_BlockData + (ROUTE_1_HEIGHT * ROUTE_1_WIDTH) - (ROUTE_1_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_1_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_1_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_1_HEIGHT * 6) + (ROUTE_1_HEIGHT * ROUTE_1_WIDTH))) ; window

	; SOUTH to Route 21
	map ROUTE_21
	dw (Route21_BlockData) ; strip pointer
	dw ($C703 + 256 + ((PALLET_TOWN_HEIGHT + 3) * (PALLET_TOWN_WIDTH + 6))) ; strip destination
	db 10, ROUTE_21_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_21_WIDTH) ; window
; 0x95354

	map_header_2 Route21, ROUTE_21, $43, NORTH | SOUTH ; 0x95354

	; NORTH to Pallet Town
	map PALLET_TOWN
	dw (PalletTown_BlockData + (PALLET_TOWN_HEIGHT * PALLET_TOWN_WIDTH) - (PALLET_TOWN_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, PALLET_TOWN_WIDTH ; (connection strip length, connected map width)
	db ((PALLET_TOWN_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((PALLET_TOWN_HEIGHT * 6) + (PALLET_TOWN_HEIGHT * PALLET_TOWN_WIDTH))) ; window

	; SOUTH to Cinnabar Island
	map CINNABAR_ISLAND
	dw (CinnabarIsland_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_21_HEIGHT + 3) * (ROUTE_21_WIDTH + 6))) ; strip destination
	db 10, CINNABAR_ISLAND_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + CINNABAR_ISLAND_WIDTH) ; window
; 0x95378

	map_header_2 CinnabarIsland, CINNABAR_ISLAND, $43, NORTH | EAST ; 0x95378

	; NORTH to Route 21
	map ROUTE_21
	dw (Route21_BlockData + (ROUTE_21_HEIGHT * ROUTE_21_WIDTH) - (ROUTE_21_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_21_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_21_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_21_HEIGHT * 6) + (ROUTE_21_HEIGHT * ROUTE_21_WIDTH))) ; window

	; EAST to Route 20
	map ROUTE_20
	dw (Route20_BlockData) ; strip pointer
	dw $c83d ; strip destination
	db 9, ROUTE_20_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_20_WIDTH) ; window
; 0x9539c

	map_header_2 Route20, ROUTE_20, $43, WEST | EAST ; 0x9539c

	; WEST to Cinnabar Island
	map CINNABAR_ISLAND
	dw (CinnabarIsland_BlockData + CINNABAR_ISLAND_WIDTH - 3) ; strip pointer
	dw $c86c ; strip destination
	db 9, CINNABAR_ISLAND_WIDTH ; (connection strip length, connected map width)
	db 0, ((CINNABAR_ISLAND_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 19
	map ROUTE_19
	dw (Route19_BlockData + ((ROUTE_19_HEIGHT - 12) * ROUTE_19_WIDTH)) ; strip pointer
	dw $c821 ; strip destination
	db 12, ROUTE_19_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_19_WIDTH) ; window
; 0x953c0

	map_header_2 Route19, ROUTE_19, $43, NORTH | WEST ; 0x953c0

	; NORTH to Fuchsia City
	map FUCHSIA_CITY
	dw (FuchsiaCity_BlockData + (FUCHSIA_CITY_HEIGHT * FUCHSIA_CITY_WIDTH) - (FUCHSIA_CITY_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, FUCHSIA_CITY_WIDTH ; (connection strip length, connected map width)
	db ((FUCHSIA_CITY_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((FUCHSIA_CITY_HEIGHT * 6) + (FUCHSIA_CITY_HEIGHT * FUCHSIA_CITY_WIDTH))) ; window

	; WEST to Route 20
	map ROUTE_20
	dw (Route20_BlockData + ROUTE_20_WIDTH - 3) ; strip pointer
	dw $c8c0 ; strip destination
	db 9, ROUTE_20_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_20_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window
; 0x953e4

	map_header_2 FuchsiaCity, FUCHSIA_CITY, $f, SOUTH | WEST | EAST ; 0x953e4

	; SOUTH to Route 19
	map ROUTE_19
	dw (Route19_BlockData) ; strip pointer
	dw ($C703 + 256 + ((FUCHSIA_CITY_HEIGHT + 3) * (FUCHSIA_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_19_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_19_WIDTH) ; window

	; WEST to Route 18
	map ROUTE_18
	dw (Route18_BlockData + ROUTE_18_WIDTH - 3) ; strip pointer
	dw $c904 ; strip destination
	db 9, ROUTE_18_WIDTH ; (connection strip length, connected map width)
	db 242, ((ROUTE_18_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 15
	map ROUTE_15
	dw (Route15_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_15_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_15_WIDTH) ; window
; 0x95414

	map_header_2 Route18, ROUTE_18, $43, WEST | EAST ; 0x95414

	; WEST to Route 17
	map ROUTE_17
	dw (Route17_BlockData + ((ROUTE_17_HEIGHT - 10) * ROUTE_17_WIDTH) + 7) ; strip pointer
	dw $c800 ; strip destination
	db 10, ROUTE_17_WIDTH ; (connection strip length, connected map width)
	db 76, ((ROUTE_17_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Fuchsia City
	map FUCHSIA_CITY
	dw (FuchsiaCity_BlockData + ((FUCHSIA_CITY_HEIGHT - 14) * FUCHSIA_CITY_WIDTH)) ; strip pointer
	dw $c80d ; strip destination
	db 14, FUCHSIA_CITY_WIDTH ; (connection strip length, connected map width)
	db 14, 0 ; yoffset, xoffset
	dw ($C807 + FUCHSIA_CITY_WIDTH) ; window
; 0x95438

	map_header_2 Route17, ROUTE_17, $43, NORTH | EAST ; 0x95438

	; NORTH to Route 16
	map ROUTE_16
	dw (Route16_BlockData + (ROUTE_16_HEIGHT * ROUTE_16_WIDTH) - (ROUTE_16_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_16_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_16_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_16_HEIGHT * 6) + (ROUTE_16_HEIGHT * ROUTE_16_WIDTH))) ; window

	; EAST to Route 18
	map ROUTE_18
	dw (Route18_BlockData) ; strip pointer
	dw $ca9d ; strip destination
	db 9, ROUTE_18_WIDTH ; (connection strip length, connected map width)
	db 180, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_18_WIDTH) ; window
; 0x9545c

	map_header_2 Route16, ROUTE_16, $f, SOUTH | EAST ; 0x9545c

	; SOUTH to Route 17
	map ROUTE_17
	dw (Route17_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_16_HEIGHT + 3) * (ROUTE_16_WIDTH + 6))) ; strip destination
	db 10, ROUTE_17_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_17_WIDTH) ; window

	; EAST to Celadon City
	map CELADON_CITY
	dw (CeladonCity_BlockData + ((CELADON_CITY_HEIGHT - 12) * CELADON_CITY_WIDTH)) ; strip pointer
	dw $c80d ; strip destination
	db 12, CELADON_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + CELADON_CITY_WIDTH) ; window
; 0x95480

	map_header_2 CeladonCity, CELADON_CITY, $f, WEST | EAST ; 0x95480

	; WEST to Route 16
	map ROUTE_16
	dw (Route16_BlockData + ROUTE_16_WIDTH - 3) ; strip pointer
	dw $c938 ; strip destination
	db 9, ROUTE_16_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_16_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 7
	map ROUTE_7
	dw (Route7_BlockData) ; strip pointer
	dw $c8e7 ; strip destination
	db 9, ROUTE_7_WIDTH ; (connection strip length, connected map width)
	db 246, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_7_WIDTH) ; window
; 0x954a4

	map_header_2 Route7, ROUTE_7, $f, WEST | EAST ; 0x954a4

	; WEST to Celadon City
	map CELADON_CITY
	dw (CeladonCity_BlockData + 21 + (CELADON_CITY_HEIGHT * 2)) ; strip pointer
	dw $c800 ; strip destination
	db 15, CELADON_CITY_WIDTH ; (connection strip length, connected map width)
	db 10, ((CELADON_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Saffron City
	map SAFFRON_CITY
	dw (SaffronCity_BlockData + ((SAFFRON_CITY_HEIGHT - 12) * SAFFRON_CITY_WIDTH)) ; strip pointer
	dw $c80d ; strip destination
	db 12, SAFFRON_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + SAFFRON_CITY_WIDTH) ; window
; 0x954c8

	map_header_2 Route15, ROUTE_15, $f, WEST | EAST ; 0x954c8

	; WEST to Fuchsia City
	map FUCHSIA_CITY
	dw (FuchsiaCity_BlockData + (((FUCHSIA_CITY_HEIGHT - ROUTE_15_HEIGHT) * FUCHSIA_CITY_WIDTH) - (FUCHSIA_CITY_WIDTH * 3) + (FUCHSIA_CITY_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, FUCHSIA_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, ((FUCHSIA_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Route 14
	map ROUTE_14
	dw (Route14_BlockData + ((ROUTE_14_HEIGHT - 12) * ROUTE_14_WIDTH)) ; strip pointer
	dw $c817 ; strip destination
	db 12, ROUTE_14_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_14_WIDTH) ; window
; 0x954ec

	map_header_2 Route14, ROUTE_14, $43, NORTH | WEST ; 0x954ec

	; NORTH to Route 13
	map ROUTE_13
	dw (Route13_BlockData + (ROUTE_13_HEIGHT * ROUTE_13_WIDTH) - (ROUTE_13_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, ROUTE_13_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_13_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_13_HEIGHT * 6) + (ROUTE_13_HEIGHT * ROUTE_13_WIDTH))) ; window

	; WEST to Route 15
	map ROUTE_15
	dw (Route15_BlockData + ROUTE_15_WIDTH - 3) ; strip pointer
	dw $c8c0 ; strip destination
	db 9, ROUTE_15_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_15_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x95510

	map_header_2 Route13, ROUTE_13, $43, NORTH | SOUTH ; 0x95510

	; NORTH to Route 12
	map ROUTE_12
	dw (Route12_BlockData + (ROUTE_12_HEIGHT * ROUTE_12_WIDTH) - (ROUTE_12_WIDTH * 3)) ; strip pointer
	dw ($C703 + 276) ; strip destination
	db 10, ROUTE_12_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_12_HEIGHT * 2) - 1), 216 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_12_HEIGHT * 6) + (ROUTE_12_HEIGHT * ROUTE_12_WIDTH))) ; window

	; SOUTH to Route 14
	map ROUTE_14
	dw (Route14_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_13_HEIGHT + 3) * (ROUTE_13_WIDTH + 6))) ; strip destination
	db 10, ROUTE_14_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_14_WIDTH) ; window
; 0x95534

	map_header_2 Route12, ROUTE_12, $43, NORTH | SOUTH | WEST ; 0x95534

	; NORTH to Lavender Town
	map LAVENDER_TOWN
	dw (LavenderTown_BlockData + (LAVENDER_TOWN_HEIGHT * LAVENDER_TOWN_WIDTH) - (LAVENDER_TOWN_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, LAVENDER_TOWN_WIDTH ; (connection strip length, connected map width)
	db ((LAVENDER_TOWN_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((LAVENDER_TOWN_HEIGHT * 6) + (LAVENDER_TOWN_HEIGHT * LAVENDER_TOWN_WIDTH))) ; window

	; SOUTH to Route 13
	map ROUTE_13
	dw (Route13_BlockData + (((40 - 13 + ROUTE_12_WIDTH) / 2) - 1)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_12_HEIGHT + 3) * (ROUTE_12_WIDTH + 6))) ; strip destination
	db 13, ROUTE_13_WIDTH ; (connection strip length, connected map width)
	db 0, 40 ; yoffset, xoffset
	dw ($C807 + ROUTE_13_WIDTH) ; window

	; WEST to Route 11
	map ROUTE_11
	dw (Route11_BlockData + ROUTE_11_WIDTH - 3) ; strip pointer
	dw $c8c0 ; strip destination
	db 9, ROUTE_11_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_11_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x95564

	map_header_2 Route11, ROUTE_11, $f, WEST | EAST ; 0x95564

	; WEST to Vermilion City
	map VERMILION_CITY
	dw (VermilionCity_BlockData + VERMILION_CITY_WIDTH - 3) ; strip pointer
	dw $c84e ; strip destination
	db 12, VERMILION_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, ((VERMILION_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Route 12
	map ROUTE_12
	dw (Route12_BlockData + 100 - (ROUTE_12_WIDTH * 4)) ; strip pointer
	dw $c817 ; strip destination
	db 15, ROUTE_12_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_12_WIDTH) ; window
; 0x95588

	map_header_2 LavenderTown, LAVENDER_TOWN, $2c, NORTH | SOUTH | WEST ; 0x95588

	; NORTH to Route 10 South
	map ROUTE_10_SOUTH
	dw (Route10South_BlockData + (ROUTE_10_SOUTH_HEIGHT * ROUTE_10_SOUTH_WIDTH) - (ROUTE_10_SOUTH_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_10_SOUTH_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_10_SOUTH_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_10_SOUTH_HEIGHT * 6) + (ROUTE_10_SOUTH_HEIGHT * ROUTE_10_SOUTH_WIDTH))) ; window

	; SOUTH to Route 12
	map ROUTE_12
	dw (Route12_BlockData) ; strip pointer
	dw ($C703 + 256 + ((LAVENDER_TOWN_HEIGHT + 3) * (LAVENDER_TOWN_WIDTH + 6))) ; strip destination
	db 10, ROUTE_12_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_12_WIDTH) ; window

	; WEST to Route 8
	map ROUTE_8
	dw (Route8_BlockData + ROUTE_8_WIDTH - 3) ; strip pointer
	dw $c830 ; strip destination
	db 9, ROUTE_8_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_8_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x955b8

	map_header_2 VermilionCity, VERMILION_CITY, $43, NORTH | EAST ; 0x955b8

	; NORTH to Route 6
	map ROUTE_6
	dw (Route6_BlockData + (ROUTE_6_HEIGHT * ROUTE_6_WIDTH) - (ROUTE_6_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_6_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_6_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_6_HEIGHT * 6) + (ROUTE_6_HEIGHT * ROUTE_6_WIDTH))) ; window

	; EAST to Route 11
	map ROUTE_11
	dw (Route11_BlockData) ; strip pointer
	dw $c865 ; strip destination
	db 9, ROUTE_11_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_11_WIDTH) ; window
; 0x955dc

	map_header_2 Route6, ROUTE_6, $f, NORTH | SOUTH ; 0x955dc

	; NORTH to Saffron City
	map SAFFRON_CITY
	dw (SaffronCity_BlockData + SAFFRON_CITY_WIDTH + 10 + (16 * SAFFRON_CITY_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, SAFFRON_CITY_WIDTH ; (connection strip length, connected map width)
	db ((SAFFRON_CITY_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((SAFFRON_CITY_HEIGHT * 6) + (SAFFRON_CITY_HEIGHT * SAFFRON_CITY_WIDTH))) ; window

	; SOUTH to Vermilion City
	map VERMILION_CITY
	dw (VermilionCity_BlockData + ((10 - 16 + ROUTE_6_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_6_HEIGHT + 3) * (ROUTE_6_WIDTH + 6))) ; strip destination
	db 16, VERMILION_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + VERMILION_CITY_WIDTH) ; window
; 0x95600

	map_header_2 SaffronCity, SAFFRON_CITY, $f, NORTH | SOUTH | WEST | EAST ; 0x95600

	; NORTH to Route 5
	map ROUTE_5
	dw (Route5_BlockData + (ROUTE_5_HEIGHT * ROUTE_5_WIDTH) - (ROUTE_5_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_5_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_5_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_5_HEIGHT * 6) + (ROUTE_5_HEIGHT * ROUTE_5_WIDTH))) ; window

	; SOUTH to Route 6
	map ROUTE_6
	dw (Route6_BlockData) ; strip pointer
	dw ($C703 + 261 + ((SAFFRON_CITY_HEIGHT + 3) * (SAFFRON_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_6_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_6_WIDTH) ; window

	; WEST to Route 7
	map ROUTE_7
	dw (Route7_BlockData + ROUTE_7_WIDTH - 3) ; strip pointer
	dw $c938 ; strip destination
	db 9, ROUTE_7_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_7_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 8
	map ROUTE_8
	dw (Route8_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_8_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_8_WIDTH) ; window
; 0x9563c

	map_header_2 Route5, ROUTE_5, $f, NORTH | SOUTH ; 0x9563c

	; NORTH to Cerulean City
	map CERULEAN_CITY
	dw (CeruleanCity_BlockData + CERULEAN_CITY_WIDTH + 10 + (16 * CERULEAN_CITY_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, CERULEAN_CITY_WIDTH ; (connection strip length, connected map width)
	db ((CERULEAN_CITY_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((CERULEAN_CITY_HEIGHT * 6) + (CERULEAN_CITY_HEIGHT * CERULEAN_CITY_WIDTH))) ; window

	; SOUTH to Saffron City
	map SAFFRON_CITY
	dw (SaffronCity_BlockData + ((10 - 16 + ROUTE_5_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_5_HEIGHT + 3) * (ROUTE_5_WIDTH + 6))) ; strip destination
	db 16, SAFFRON_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + SAFFRON_CITY_WIDTH) ; window
; 0x95660

	map_header_2 CeruleanCity, CERULEAN_CITY, $f, NORTH | SOUTH | WEST | EAST ; 0x95660

	; NORTH to Route 24
	map ROUTE_24
	dw (Route24_BlockData + (ROUTE_24_HEIGHT * ROUTE_24_WIDTH) - (ROUTE_24_WIDTH * 3)) ; strip pointer
	dw ($C703 + 262) ; strip destination
	db 10, ROUTE_24_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_24_HEIGHT * 2) - 1), 244 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_24_HEIGHT * 6) + (ROUTE_24_HEIGHT * ROUTE_24_WIDTH))) ; window

	; SOUTH to Route 5
	map ROUTE_5
	dw (Route5_BlockData) ; strip pointer
	dw ($C703 + 261 + ((CERULEAN_CITY_HEIGHT + 3) * (CERULEAN_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_5_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_5_WIDTH) ; window

	; WEST to Route 4
	map ROUTE_4
	dw (Route4_BlockData + ROUTE_4_WIDTH - 3) ; strip pointer
	dw $c8d0 ; strip destination
	db 9, ROUTE_4_WIDTH ; (connection strip length, connected map width)
	db 246, ((ROUTE_4_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Route 9
	map ROUTE_9
	dw (Route9_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_9_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_9_WIDTH) ; window
; 0x9569c

	map_header_2 Route9, ROUTE_9, $2c, SOUTH | WEST ; 0x9569c

	; SOUTH to Route 10 North
	map ROUTE_10_NORTH
	dw (Route10North_BlockData) ; strip pointer
	dw ($C703 + 276 + ((ROUTE_9_HEIGHT + 3) * (ROUTE_9_WIDTH + 6))) ; strip destination
	db 10, ROUTE_10_NORTH_WIDTH ; (connection strip length, connected map width)
	db 0, 216 ; yoffset, xoffset
	dw ($C807 + ROUTE_10_NORTH_WIDTH) ; window

	; WEST to Cerulean City
	map CERULEAN_CITY
	dw (CeruleanCity_BlockData + (((CERULEAN_CITY_HEIGHT - ROUTE_9_HEIGHT) * CERULEAN_CITY_WIDTH) - (CERULEAN_CITY_WIDTH * 3) + (CERULEAN_CITY_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, CERULEAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, ((CERULEAN_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x956c0

	map_header_2 Route24, ROUTE_24, $2c, NORTH | SOUTH ; 0x956c0

	; NORTH to Route 25
	map ROUTE_25
	dw (Route25_BlockData + (ROUTE_25_HEIGHT * ROUTE_25_WIDTH) - (ROUTE_25_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, ROUTE_25_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_25_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_25_HEIGHT * 6) + (ROUTE_25_HEIGHT * ROUTE_25_WIDTH))) ; window

	; SOUTH to Cerulean City
	map CERULEAN_CITY
	dw (CeruleanCity_BlockData + ((12 - 16 + ROUTE_24_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_24_HEIGHT + 3) * (ROUTE_24_WIDTH + 6))) ; strip destination
	db 16, CERULEAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 12 ; yoffset, xoffset
	dw ($C807 + CERULEAN_CITY_WIDTH) ; window
; 0x956e4

	map_header_2 Route25, ROUTE_25, $2c, SOUTH ; 0x956e4

	; SOUTH to Route 24
	map ROUTE_24
	dw (Route24_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_25_HEIGHT + 3) * (ROUTE_25_WIDTH + 6))) ; strip destination
	db 10, ROUTE_24_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_24_WIDTH) ; window
; 0x956fc

	map_header_2 Route3, ROUTE_3, $2c, WEST | EAST ; 0x956fc

	; WEST to Pewter City
	map PEWTER_CITY
	dw (PewterCity_BlockData + 21 + (PEWTER_CITY_HEIGHT * 2)) ; strip pointer
	dw $c800 ; strip destination
	db 15, PEWTER_CITY_WIDTH ; (connection strip length, connected map width)
	db 10, ((PEWTER_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Route 4
	map ROUTE_4
	dw (Route4_BlockData) ; strip pointer
	dw $c88d ; strip destination
	db 9, ROUTE_4_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_4_WIDTH) ; window
; 0x95720

	map_header_2 Route4, ROUTE_4, $2c, WEST | EAST ; 0x95720

	; WEST to Route 3
	map ROUTE_3
	dw (Route3_BlockData + ROUTE_3_WIDTH - 3) ; strip pointer
	dw $c84e ; strip destination
	db 9, ROUTE_3_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_3_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window

	; EAST to Cerulean City
	map CERULEAN_CITY
	dw (CeruleanCity_BlockData + ((100 - (CERULEAN_CITY_WIDTH * 4)) * 2)) ; strip pointer
	dw $c817 ; strip destination
	db 15, CERULEAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 10, 0 ; yoffset, xoffset
	dw ($C807 + CERULEAN_CITY_WIDTH) ; window
; 0x95744

	map_header_2 Route8, ROUTE_8, $2c, WEST | EAST ; 0x95744

	; WEST to Saffron City
	map SAFFRON_CITY
	dw (SaffronCity_BlockData + (((SAFFRON_CITY_HEIGHT - ROUTE_8_HEIGHT) * SAFFRON_CITY_WIDTH) - (SAFFRON_CITY_WIDTH * 3) + (SAFFRON_CITY_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, SAFFRON_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, ((SAFFRON_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Lavender Town
	map LAVENDER_TOWN
	dw (LavenderTown_BlockData) ; strip pointer
	dw $c865 ; strip destination
	db 9, LAVENDER_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + LAVENDER_TOWN_WIDTH) ; window
; 0x95768

	map_header_2 Route10North, ROUTE_10_NORTH, $2c, NORTH | SOUTH ; 0x95768

	; NORTH to Route 9
	map ROUTE_9
	dw (Route9_BlockData + ((ROUTE_9_HEIGHT - 3) * ROUTE_9_WIDTH) + 17) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 13, ROUTE_9_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_9_HEIGHT * 2) - 1), 40 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_9_HEIGHT * 6) + (ROUTE_9_HEIGHT * ROUTE_9_WIDTH))) ; window

	; SOUTH to Route 10 South
	map ROUTE_10_SOUTH
	dw (Route10South_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_10_NORTH_HEIGHT + 3) * (ROUTE_10_NORTH_WIDTH + 6))) ; strip destination
	db 10, ROUTE_10_SOUTH_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_10_SOUTH_WIDTH) ; window
; 0x9578c

	map_header_2 Route10South, ROUTE_10_SOUTH, $2c, NORTH | SOUTH ; 0x9578c

	; NORTH to Route 10 North
	map ROUTE_10_NORTH
	dw (Route10North_BlockData + (ROUTE_10_NORTH_HEIGHT * ROUTE_10_NORTH_WIDTH) - (ROUTE_10_NORTH_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_10_NORTH_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_10_NORTH_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_10_NORTH_HEIGHT * 6) + (ROUTE_10_NORTH_HEIGHT * ROUTE_10_NORTH_WIDTH))) ; window

	; SOUTH to Lavender Town
	map LAVENDER_TOWN
	dw (LavenderTown_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_10_SOUTH_HEIGHT + 3) * (ROUTE_10_SOUTH_WIDTH + 6))) ; strip destination
	db 10, LAVENDER_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + LAVENDER_TOWN_WIDTH) ; window
; 0x957b0

	map_header_2 Route23, ROUTE_23, $f, NONE ; 0x957b0
	map_header_2 SproutTower1F, SPROUT_TOWER_1F, $0, NONE ; 0x957bc
	map_header_2 SproutTower2F, SPROUT_TOWER_2F, $0, NONE ; 0x957c8
	map_header_2 SproutTower3F, SPROUT_TOWER_3F, $0, NONE ; 0x957d4
	map_header_2 TinTower1F, TIN_TOWER_1F, $0, NONE ; 0x957e0
	map_header_2 TinTower2F, TIN_TOWER_2F, $0, NONE ; 0x957ec
	map_header_2 TinTower3F, TIN_TOWER_3F, $0, NONE ; 0x957f8
	map_header_2 TinTower4F, TIN_TOWER_4F, $0, NONE ; 0x95804
	map_header_2 TinTower5F, TIN_TOWER_5F, $0, NONE ; 0x95810
	map_header_2 TinTower6F, TIN_TOWER_6F, $0, NONE ; 0x9581c
	map_header_2 TinTower7F, TIN_TOWER_7F, $0, NONE ; 0x95828
	map_header_2 TinTower8F, TIN_TOWER_8F, $0, NONE ; 0x95834
	map_header_2 TinTower9F, TIN_TOWER_9F, $0, NONE ; 0x95840
	map_header_2 BurnedTower1F, BURNED_TOWER_1F, $0, NONE ; 0x9584c
	map_header_2 BurnedTowerB1F, BURNED_TOWER_B1F, $9, NONE ; 0x95858
	map_header_2 NationalPark, NATIONAL_PARK, $0, NONE ; 0x95864
	map_header_2 NationalParkBugContest, NATIONAL_PARK_BUG_CONTEST, $0, NONE ; 0x95870
	map_header_2 RadioTower1F, RADIO_TOWER_1F, $0, NONE ; 0x9587c
	map_header_2 RadioTower2F, RADIO_TOWER_2F, $0, NONE ; 0x95888
	map_header_2 RadioTower3F, RADIO_TOWER_3F, $0, NONE ; 0x95894
	map_header_2 RadioTower4F, RADIO_TOWER_4F, $0, NONE ; 0x958a0
	map_header_2 RadioTower5F, RADIO_TOWER_5F, $0, NONE ; 0x958ac
	map_header_2 RuinsofAlphOutside, RUINS_OF_ALPH_OUTSIDE, $5, NONE ; 0x958b8
	map_header_2 RuinsofAlphHoOhChamber, RUINS_OF_ALPH_HO_OH_CHAMBER, $0, NONE ; 0x958c4
	map_header_2 RuinsofAlphKabutoChamber, RUINS_OF_ALPH_KABUTO_CHAMBER, $0, NONE ; 0x958d0
	map_header_2 RuinsofAlphOmanyteChamber, RUINS_OF_ALPH_OMANYTE_CHAMBER, $0, NONE ; 0x958dc
	map_header_2 RuinsofAlphAerodactylChamber, RUINS_OF_ALPH_AERODACTYL_CHAMBER, $0, NONE ; 0x958e8
	map_header_2 RuinsofAlphInnerChamber, RUINS_OF_ALPH_INNER_CHAMBER, $0, NONE ; 0x958f4
	map_header_2 RuinsofAlphResearchCenter, RUINS_OF_ALPH_RESEARCH_CENTER, $0, NONE ; 0x95900
	map_header_2 RuinsofAlphHoOhItemRoom, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, $0, NONE ; 0x9590c
	map_header_2 RuinsofAlphKabutoItemRoom, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, $0, NONE ; 0x95918
	map_header_2 RuinsofAlphOmanyteItemRoom, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, $0, NONE ; 0x95924
	map_header_2 RuinsofAlphAerodactylItemRoom, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM, $0, NONE ; 0x95930
	map_header_2 RuinsofAlphHoOhWordRoom, RUINS_OF_ALPH_HO_OH_WORD_ROOM, $0, NONE ; 0x9593c
	map_header_2 RuinsofAlphKabutoWordRoom, RUINS_OF_ALPH_KABUTO_WORD_ROOM, $0, NONE ; 0x95948
	map_header_2 RuinsofAlphOmanyteWordRoom, RUINS_OF_ALPH_OMANYTE_WORD_ROOM, $0, NONE ; 0x95954
	map_header_2 RuinsofAlphAerodactylWordRoom, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, $0, NONE ; 0x95960
	map_header_2 UnionCave1F, UNION_CAVE_1F, $9, NONE ; 0x9596c
	map_header_2 UnionCaveB1F, UNION_CAVE_B1F, $9, NONE ; 0x95978
	map_header_2 UnionCaveB2F, UNION_CAVE_B2F, $9, NONE ; 0x95984
	map_header_2 SlowpokeWellB1F, SLOWPOKE_WELL_B1F, $9, NONE ; 0x95990
	map_header_2 SlowpokeWellB2F, SLOWPOKE_WELL_B2F, $9, NONE ; 0x9599c
	map_header_2 OlivineLighthouse1F, OLIVINE_LIGHTHOUSE_1F, $0, NONE ; 0x959a8
	map_header_2 OlivineLighthouse2F, OLIVINE_LIGHTHOUSE_2F, $0, NONE ; 0x959b4
	map_header_2 OlivineLighthouse3F, OLIVINE_LIGHTHOUSE_3F, $0, NONE ; 0x959c0
	map_header_2 OlivineLighthouse4F, OLIVINE_LIGHTHOUSE_4F, $0, NONE ; 0x959cc
	map_header_2 OlivineLighthouse5F, OLIVINE_LIGHTHOUSE_5F, $0, NONE ; 0x959d8
	map_header_2 OlivineLighthouse6F, OLIVINE_LIGHTHOUSE_6F, $0, NONE ; 0x959e4
	map_header_2 MahoganyMart1F, MAHOGANY_MART_1F, $0, NONE ; 0x959f0
	map_header_2 TeamRocketBaseB1F, TEAM_ROCKET_BASE_B1F, $0, NONE ; 0x959fc
	map_header_2 TeamRocketBaseB2F, TEAM_ROCKET_BASE_B2F, $0, NONE ; 0x95a08
	map_header_2 TeamRocketBaseB3F, TEAM_ROCKET_BASE_B3F, $0, NONE ; 0x95a14
	map_header_2 IlexForest, ILEX_FOREST, $5, NONE ; 0x95a20
	map_header_2 WarehouseEntrance, WAREHOUSE_ENTRANCE, $0, NONE ; 0x95a2c
	map_header_2 UndergroundPathSwitchRoomEntrances, UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, $0, NONE ; 0x95a38
	map_header_2 GoldenrodDeptStoreB1F, GOLDENROD_DEPT_STORE_B1F, $0, NONE ; 0x95a44
	map_header_2 UndergroundWarehouse, UNDERGROUND_WAREHOUSE, $0, NONE ; 0x95a50
	map_header_2 MountMortar1FOutside, MOUNT_MORTAR_1F_OUTSIDE, $9, NONE ; 0x95a5c
	map_header_2 MountMortar1FInside, MOUNT_MORTAR_1F_INSIDE, $9, NONE ; 0x95a68
	map_header_2 MountMortar2FInside, MOUNT_MORTAR_2F_INSIDE, $9, NONE ; 0x95a74
	map_header_2 MountMortarB1F, MOUNT_MORTAR_B1F, $9, NONE ; 0x95a80
	map_header_2 IcePath1F, ICE_PATH_1F, $9, NONE ; 0x95a8c
	map_header_2 IcePathB1F, ICE_PATH_B1F, $19, NONE ; 0x95a98
	map_header_2 IcePathB2FMahoganySide, ICE_PATH_B2F_MAHOGANY_SIDE, $19, NONE ; 0x95aa4
	map_header_2 IcePathB2FBlackthornSide, ICE_PATH_B2F_BLACKTHORN_SIDE, $19, NONE ; 0x95ab0
	map_header_2 IcePathB3F, ICE_PATH_B3F, $19, NONE ; 0x95abc
	map_header_2 WhirlIslandNW, WHIRL_ISLAND_NW, $9, NONE ; 0x95ac8
	map_header_2 WhirlIslandNE, WHIRL_ISLAND_NE, $9, NONE ; 0x95ad4
	map_header_2 WhirlIslandSW, WHIRL_ISLAND_SW, $9, NONE ; 0x95ae0
	map_header_2 WhirlIslandCave, WHIRL_ISLAND_CAVE, $9, NONE ; 0x95aec
	map_header_2 WhirlIslandSE, WHIRL_ISLAND_SE, $f, NONE ; 0x95af8
	map_header_2 WhirlIslandB1F, WHIRL_ISLAND_B1F, $9, NONE ; 0x95b04
	map_header_2 WhirlIslandB2F, WHIRL_ISLAND_B2F, $2e, NONE ; 0x95b10
	map_header_2 WhirlIslandLugiaChamber, WHIRL_ISLAND_LUGIA_CHAMBER, $f, NONE ; 0x95b1c
	map_header_2 SilverCaveRoom1, SILVER_CAVE_ROOM_1, $9, NONE ; 0x95b28
	map_header_2 SilverCaveRoom2, SILVER_CAVE_ROOM_2, $9, NONE ; 0x95b34
	map_header_2 SilverCaveRoom3, SILVER_CAVE_ROOM_3, $9, NONE ; 0x95b40
	map_header_2 SilverCaveItemRooms, SILVER_CAVE_ITEM_ROOMS, $9, NONE ; 0x95b4c
	map_header_2 DarkCaveVioletEntrance, DARK_CAVE_VIOLET_ENTRANCE, $9, NONE ; 0x95b58
	map_header_2 DarkCaveBlackthornEntrance, DARK_CAVE_BLACKTHORN_ENTRANCE, $9, NONE ; 0x95b64
	map_header_2 DragonsDen1F, DRAGONS_DEN_1F, $9, NONE ; 0x95b70
	map_header_2 DragonsDenB1F, DRAGONS_DEN_B1F, $71, NONE ; 0x95b7c
	map_header_2 DragonShrine, DRAGON_SHRINE, $0, NONE ; 0x95b88
	map_header_2 TohjoFalls, TOHJO_FALLS, $9, NONE ; 0x95b94
	map_header_2 OlivinePokeCenter1F, OLIVINE_POKECENTER_1F, $0, NONE ; 0x95ba0
	map_header_2 OlivineGym, OLIVINE_GYM, $0, NONE ; 0x95bac
	map_header_2 OlivineVoltorbHouse, OLIVINE_VOLTORB_HOUSE, $0, NONE ; 0x95bb8
	map_header_2 OlivineHouseBeta, OLIVINE_HOUSE_BETA, $0, NONE ; 0x95bc4
	map_header_2 OlivinePunishmentSpeechHouse, OLIVINE_PUNISHMENT_SPEECH_HOUSE, $0, NONE ; 0x95bd0
	map_header_2 OlivineGoodRodHouse, OLIVINE_GOOD_ROD_HOUSE, $0, NONE ; 0x95bdc
	map_header_2 OlivineCafe, OLIVINE_CAFE, $0, NONE ; 0x95be8
	map_header_2 OlivineMart, OLIVINE_MART, $0, NONE ; 0x95bf4
	map_header_2 Route38EcruteakGate, ROUTE_38_ECRUTEAK_GATE, $0, NONE ; 0x95c00
	map_header_2 Route39Barn, ROUTE_39_BARN, $0, NONE ; 0x95c0c
	map_header_2 Route39Farmhouse, ROUTE_39_FARMHOUSE, $0, NONE ; 0x95c18
	map_header_2 MahoganyRedGyaradosSpeechHouse, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, $0, NONE ; 0x95c24
	map_header_2 MahoganyGym, MAHOGANY_GYM, $0, NONE ; 0x95c30
	map_header_2 MahoganyPokeCenter1F, MAHOGANY_POKECENTER_1F, $0, NONE ; 0x95c3c
	map_header_2 Route42EcruteakGate, ROUTE_42_ECRUTEAK_GATE, $0, NONE ; 0x95c48
	map_header_2 DiglettsCave, DIGLETTS_CAVE, $9, NONE ; 0x95c54
	map_header_2 MountMoon, MOUNT_MOON, $9, NONE ; 0x95c60
	map_header_2 Underground, UNDERGROUND, $0, NONE ; 0x95c6c
	map_header_2 RockTunnel1F, ROCK_TUNNEL_1F, $9, NONE ; 0x95c78
	map_header_2 RockTunnelB1F, ROCK_TUNNEL_B1F, $9, NONE ; 0x95c84
	map_header_2 SafariZoneFuchsiaGateBeta, SAFARI_ZONE_FUCHSIA_GATE_BETA, $0, NONE ; 0x95c90
	map_header_2 SafariZoneBeta, SAFARI_ZONE_BETA, $13, NONE ; 0x95c9c
	map_header_2 VictoryRoad, VICTORY_ROAD, $1d, NONE ; 0x95ca8
	map_header_2 EcruteakHouse, ECRUTEAK_HOUSE, $0, NONE ; 0x95cb4
	map_header_2 WiseTriosRoom, WISE_TRIOS_ROOM, $0, NONE ; 0x95cc0
	map_header_2 EcruteakPokeCenter1F, ECRUTEAK_POKECENTER_1F, $0, NONE ; 0x95ccc
	map_header_2 EcruteakLugiaSpeechHouse, ECRUTEAK_LUGIA_SPEECH_HOUSE, $0, NONE ; 0x95cd8
	map_header_2 DanceTheatre, DANCE_THEATRE, $0, NONE ; 0x95ce4
	map_header_2 EcruteakMart, ECRUTEAK_MART, $0, NONE ; 0x95cf0
	map_header_2 EcruteakGym, ECRUTEAK_GYM, $0, NONE ; 0x95cfc
	map_header_2 EcruteakItemfinderHouse, ECRUTEAK_ITEMFINDER_HOUSE, $0, NONE ; 0x95d08
	map_header_2 BlackthornGym1F, BLACKTHORN_GYM_1F, $0, NONE ; 0x95d14
	map_header_2 BlackthornGym2F, BLACKTHORN_GYM_2F, $0, NONE ; 0x95d20
	map_header_2 BlackthornDragonSpeechHouse, BLACKTHORN_DRAGON_SPEECH_HOUSE, $0, NONE ; 0x95d2c
	map_header_2 BlackthornDodrioTradeHouse, BLACKTHORN_DODRIO_TRADE_HOUSE, $0, NONE ; 0x95d38
	map_header_2 BlackthornMart, BLACKTHORN_MART, $0, NONE ; 0x95d44
	map_header_2 BlackthornPokeCenter1F, BLACKTHORN_POKECENTER_1F, $0, NONE ; 0x95d50
	map_header_2 MoveDeletersHouse, MOVE_DELETERS_HOUSE, $0, NONE ; 0x95d5c
	map_header_2 CinnabarPokeCenter1F, CINNABAR_POKECENTER_1F, $0, NONE ; 0x95d68
	map_header_2 CinnabarPokeCenter2FBeta, CINNABAR_POKECENTER_2F_BETA, $0, NONE ; 0x95d74
	map_header_2 Route19FuchsiaGate, ROUTE_19___FUCHSIA_GATE, $0, NONE ; 0x95d80
	map_header_2 SeafoamGym, SEAFOAM_GYM, $9, NONE ; 0x95d8c
	map_header_2 CeruleanGymBadgeSpeechHouse, CERULEAN_GYM_BADGE_SPEECH_HOUSE, $0, NONE ; 0x95d98
	map_header_2 CeruleanPoliceStation, CERULEAN_POLICE_STATION, $0, NONE ; 0x95da4
	map_header_2 CeruleanTradeSpeechHouse, CERULEAN_TRADE_SPEECH_HOUSE, $0, NONE ; 0x95db0
	map_header_2 CeruleanPokeCenter1F, CERULEAN_POKECENTER_1F, $0, NONE ; 0x95dbc
	map_header_2 CeruleanPokeCenter2FBeta, CERULEAN_POKECENTER_2F_BETA, $0, NONE ; 0x95dc8
	map_header_2 CeruleanGym, CERULEAN_GYM, $0, NONE ; 0x95dd4
	map_header_2 CeruleanMart, CERULEAN_MART, $0, NONE ; 0x95de0
	map_header_2 Route10PokeCenter1F, ROUTE_10_POKECENTER_1F, $0, NONE ; 0x95dec
	map_header_2 Route10PokeCenter2FBeta, ROUTE_10_POKECENTER_2F_BETA, $0, NONE ; 0x95df8
	map_header_2 PowerPlant, POWER_PLANT, $0, NONE ; 0x95e04
	map_header_2 BillsHouse, BILLS_HOUSE, $0, NONE ; 0x95e10
	map_header_2 AzaleaPokeCenter1F, AZALEA_POKECENTER_1F, $0, NONE ; 0x95e1c
	map_header_2 CharcoalKiln, CHARCOAL_KILN, $0, NONE ; 0x95e28
	map_header_2 AzaleaMart, AZALEA_MART, $0, NONE ; 0x95e34
	map_header_2 KurtsHouse, KURTS_HOUSE, $0, NONE ; 0x95e40
	map_header_2 AzaleaGym, AZALEA_GYM, $0, NONE ; 0x95e4c
	map_header_2 LakeofRageHiddenPowerHouse, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, $0, NONE ; 0x95e58
	map_header_2 LakeofRageMagikarpHouse, LAKE_OF_RAGE_MAGIKARP_HOUSE, $0, NONE ; 0x95e64
	map_header_2 Route43MahoganyGate, ROUTE_43_MAHOGANY_GATE, $0, NONE ; 0x95e70
	map_header_2 Route43Gate, ROUTE_43_GATE, $0, NONE ; 0x95e7c
	map_header_2 VioletMart, VIOLET_MART, $0, NONE ; 0x95e88
	map_header_2 VioletGym, VIOLET_GYM, $0, NONE ; 0x95e94
	map_header_2 EarlsPokemonAcademy, EARLS_POKEMON_ACADEMY, $0, NONE ; 0x95ea0
	map_header_2 VioletNicknameSpeechHouse, VIOLET_NICKNAME_SPEECH_HOUSE, $0, NONE ; 0x95eac
	map_header_2 VioletPokeCenter1F, VIOLET_POKECENTER_1F, $0, NONE ; 0x95eb8
	map_header_2 VioletOnixTradeHouse, VIOLET_ONIX_TRADE_HOUSE, $0, NONE ; 0x95ec4
	map_header_2 Route32RuinsofAlphGate, ROUTE_32_RUINS_OF_ALPH_GATE, $0, NONE ; 0x95ed0
	map_header_2 Route32PokeCenter1F, ROUTE_32_POKECENTER_1F, $0, NONE ; 0x95edc
	map_header_2 Route35Goldenrodgate, ROUTE_35_GOLDENROD_GATE, $0, NONE ; 0x95ee8
	map_header_2 Route35NationalParkgate, ROUTE_35_NATIONAL_PARK_GATE, $0, NONE ; 0x95ef4
	map_header_2 Route36RuinsofAlphgate, ROUTE_36_RUINS_OF_ALPH_GATE, $0, NONE ; 0x95f00
	map_header_2 Route36NationalParkgate, ROUTE_36_NATIONAL_PARK_GATE, $0, NONE ; 0x95f0c
	map_header_2 GoldenrodGym, GOLDENROD_GYM, $0, NONE ; 0x95f18
	map_header_2 GoldenrodBikeShop, GOLDENROD_BIKE_SHOP, $0, NONE ; 0x95f24
	map_header_2 GoldenrodHappinessRater, GOLDENROD_HAPPINESS_RATER, $0, NONE ; 0x95f30
	map_header_2 GoldenrodBillsHouse, GOLDENROD_BILLS_HOUSE, $0, NONE ; 0x95f3c
	map_header_2 GoldenrodMagnetTrainStation, GOLDENROD_MAGNET_TRAIN_STATION, $0, NONE ; 0x95f48
	map_header_2 GoldenrodFlowerShop, GOLDENROD_FLOWER_SHOP, $0, NONE ; 0x95f54
	map_header_2 GoldenrodPPSpeechHouse, GOLDENROD_PP_SPEECH_HOUSE, $0, NONE ; 0x95f60
	map_header_2 GoldenrodNameRatersHouse, GOLDENROD_NAME_RATERS_HOUSE, $0, NONE ; 0x95f6c
	map_header_2 GoldenrodDeptStore1F, GOLDENROD_DEPT_STORE_1F, $0, NONE ; 0x95f78
	map_header_2 GoldenrodDeptStore2F, GOLDENROD_DEPT_STORE_2F, $0, NONE ; 0x95f84
	map_header_2 GoldenrodDeptStore3F, GOLDENROD_DEPT_STORE_3F, $0, NONE ; 0x95f90
	map_header_2 GoldenrodDeptStore4F, GOLDENROD_DEPT_STORE_4F, $0, NONE ; 0x95f9c
	map_header_2 GoldenrodDeptStore5F, GOLDENROD_DEPT_STORE_5F, $0, NONE ; 0x95fa8
	map_header_2 GoldenrodDeptStore6F, GOLDENROD_DEPT_STORE_6F, $0, NONE ; 0x95fb4
	map_header_2 GoldenrodDeptStoreElevator, GOLDENROD_DEPT_STORE_ELEVATOR, $0, NONE ; 0x95fc0
	map_header_2 GoldenrodDeptStoreRoof, GOLDENROD_DEPT_STORE_ROOF, $24, NONE ; 0x95fcc
	map_header_2 GoldenrodGameCorner, GOLDENROD_GAME_CORNER, $0, NONE ; 0x95fd8
	map_header_2 GoldenrodPokeCenter1F, GOLDENROD_POKECENTER_1F, $0, NONE ; 0x95fe4
	map_header_2 GoldenrodPokeComCenter2FMobile, GOLDENROD_POKECOM_CENTER_2F_MOBILE, $0, NONE ; 0x95ff0
	map_header_2 IlexForestAzaleaGate, ILEX_FOREST_AZALEA_GATE, $0, NONE ; 0x95ffc
	map_header_2 Route34IlexForestGate, ROUTE_34_ILEX_FOREST_GATE, $0, NONE ; 0x96008
	map_header_2 DayCare, DAY_CARE, $0, NONE ; 0x96014
	map_header_2 VermilionHouseFishingSpeechHouse, VERMILION_HOUSE_FISHING_SPEECH_HOUSE, $0, NONE ; 0x96020
	map_header_2 VermilionPokeCenter1F, VERMILION_POKECENTER_1F, $0, NONE ; 0x9602c
	map_header_2 VermilionPokeCenter2FBeta, VERMILION_POKECENTER_2F_BETA, $0, NONE ; 0x96038
	map_header_2 PokemonFanClub, POKEMON_FAN_CLUB, $0, NONE ; 0x96044
	map_header_2 VermilionMagnetTrainSpeechHouse, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, $0, NONE ; 0x96050
	map_header_2 VermilionMart, VERMILION_MART, $0, NONE ; 0x9605c
	map_header_2 VermilionHouseDiglettsCaveSpeechHouse, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE, $0, NONE ; 0x96068
	map_header_2 VermilionGym, VERMILION_GYM, $0, NONE ; 0x96074
	map_header_2 Route6SaffronGate, ROUTE_6_SAFFRON_GATE, $0, NONE ; 0x96080
	map_header_2 Route6UndergroundEntrance, ROUTE_6_UNDERGROUND_ENTRANCE, $0, NONE ; 0x9608c
	map_header_2 RedsHouse1F, REDS_HOUSE_1F, $0, NONE ; 0x96098
	map_header_2 RedsHouse2F, REDS_HOUSE_2F, $0, NONE ; 0x960a4
	map_header_2 BluesHouse, BLUES_HOUSE, $0, NONE ; 0x960b0
	map_header_2 OaksLab, OAKS_LAB, $0, NONE ; 0x960bc
	map_header_2 PewterNidoranSpeechHouse, PEWTER_NIDORAN_SPEECH_HOUSE, $0, NONE ; 0x960c8
	map_header_2 PewterGym, PEWTER_GYM, $0, NONE ; 0x960d4
	map_header_2 PewterMart, PEWTER_MART, $0, NONE ; 0x960e0
	map_header_2 PewterPokeCenter1F, PEWTER_POKECENTER_1F, $0, NONE ; 0x960ec
	map_header_2 PewterPokeCEnter2FBeta, PEWTER_POKECENTER_2F_BETA, $0, NONE ; 0x960f8
	map_header_2 PewterSnoozeSpeechHouse, PEWTER_SNOOZE_SPEECH_HOUSE, $0, NONE ; 0x96104
	map_header_2 OlivinePort, OLIVINE_PORT, $a, NONE ; 0x96110
	map_header_2 VermilionPort, VERMILION_PORT, $a, NONE ; 0x9611c
	map_header_2 FastShip1F, FAST_SHIP_1F, $0, NONE ; 0x96128
	map_header_2 FastShipCabins_NNW_NNE_NE, FAST_SHIP_CABINS_NNW_NNE_NE, $0, NONE ; 0x96134
	map_header_2 FastShipCabins_SW_SSW_NW, FAST_SHIP_CABINS_SW_SSW_NW, $0, NONE ; 0x96140
	map_header_2 FastShipCabins_SE_SSE_CaptainsCabin, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN, $0, NONE ; 0x9614c
	map_header_2 FastShipB1F, FAST_SHIP_B1F, $0, NONE ; 0x96158
	map_header_2 OlivinePortPassage, OLIVINE_PORT_PASSAGE, $0, NONE ; 0x96164
	map_header_2 VermilionPortPassage, VERMILION_PORT_PASSAGE, $0, NONE ; 0x96170
	map_header_2 MountMoonSquare, MOUNT_MOON_SQUARE, $2d, NONE ; 0x9617c
	map_header_2 MountMoonGiftShop, MOUNT_MOON_GIFT_SHOP, $0, NONE ; 0x96188
	map_header_2 TinTowerRoof, TIN_TOWER_ROOF, $0, NONE ; 0x96194
	map_header_2 IndigoPlateauPokeCenter1F, INDIGO_PLATEAU_POKECENTER_1F, $0, NONE ; 0x961a0
	map_header_2 WillsRoom, WILLS_ROOM, $0, NONE ; 0x961ac
	map_header_2 KogasRoom, KOGAS_ROOM, $0, NONE ; 0x961b8
	map_header_2 BrunosRoom, BRUNOS_ROOM, $0, NONE ; 0x961c4
	map_header_2 KarensRoom, KARENS_ROOM, $0, NONE ; 0x961d0
	map_header_2 LancesRoom, LANCES_ROOM, $0, NONE ; 0x961dc
	map_header_2 HallOfFame, HALL_OF_FAME, $0, NONE ; 0x961e8
	map_header_2 FuchsiaMart, FUCHSIA_MART, $0, NONE ; 0x961f4
	map_header_2 SafariZoneMainOffice, SAFARI_ZONE_MAIN_OFFICE, $0, NONE ; 0x96200
	map_header_2 FuchsiaGym, FUCHSIA_GYM, $0, NONE ; 0x9620c
	map_header_2 FuchsiaBillSpeechHouse, FUCHSIA_BILL_SPEECH_HOUSE, $0, NONE ; 0x96218
	map_header_2 FuchsiaPokeCenter1F, FUCHSIA_POKECENTER_1F, $0, NONE ; 0x96224
	map_header_2 FuchsiaPokeCenter2FBeta, FUCHSIA_POKECENTER_2F_BETA, $0, NONE ; 0x96230
	map_header_2 SafariZoneWardensHome, SAFARI_ZONE_WARDENS_HOME, $0, NONE ; 0x9623c
	map_header_2 Route15FuchsiaGate, ROUTE_15_FUCHSIA_GATE, $0, NONE ; 0x96248
	map_header_2 LavenderPokeCenter1F, LAVENDER_POKECENTER_1F, $0, NONE ; 0x96254
	map_header_2 LavenderPokeCenter2FBeta, LAVENDER_POKECENTER_2F_BETA, $0, NONE ; 0x96260
	map_header_2 MrFujisHouse, MR_FUJIS_HOUSE, $0, NONE ; 0x9626c
	map_header_2 LavenderTownSpeechHouse, LAVENDER_TOWN_SPEECH_HOUSE, $0, NONE ; 0x96278
	map_header_2 LavenderNameRater, LAVENDER_NAME_RATER, $0, NONE ; 0x96284
	map_header_2 LavenderMart, LAVENDER_MART, $0, NONE ; 0x96290
	map_header_2 SoulHouse, SOUL_HOUSE, $0, NONE ; 0x9629c
	map_header_2 LavRadioTower1F, LAV_RADIO_TOWER_1F, $0, NONE ; 0x962a8
	map_header_2 Route8SaffronGate, ROUTE_8_SAFFRON_GATE, $0, NONE ; 0x962b4
	map_header_2 Route12SuperRodHouse, ROUTE_12_SUPER_ROD_HOUSE, $0, NONE ; 0x962c0
	map_header_2 SilverCavePokeCenter1F, SILVER_CAVE_POKECENTER_1F, $0, NONE ; 0x962cc
	map_header_2 Route28FamousSpeechHouse, ROUTE_28_FAMOUS_SPEECH_HOUSE, $0, NONE ; 0x962d8
	map_header_2 PokeCenter2F, POKECENTER_2F, $0, NONE ; 0x962e4
	map_header_2 TradeCenter, TRADE_CENTER, $0, NONE ; 0x962f0
	map_header_2 Colosseum, COLOSSEUM, $0, NONE ; 0x962fc
	map_header_2 TimeCapsule, TIME_CAPSULE, $0, NONE ; 0x96308
	map_header_2 MobileTradeRoomMobile, MOBILE_TRADE_ROOM_MOBILE, $0, NONE ; 0x96314
	map_header_2 MobileBattleRoom, MOBILE_BATTLE_ROOM, $0, NONE ; 0x96320
	map_header_2 CeladonDeptStore1F, CELADON_DEPT_STORE_1F, $0, NONE ; 0x9632c
	map_header_2 CeladonDeptStore2F, CELADON_DEPT_STORE_2F, $0, NONE ; 0x96338
	map_header_2 CeladonDeptStore3F, CELADON_DEPT_STORE_3F, $0, NONE ; 0x96344
	map_header_2 CeladonDeptStore4F, CELADON_DEPT_STORE_4F, $0, NONE ; 0x96350
	map_header_2 CeladonDeptStore5F, CELADON_DEPT_STORE_5F, $0, NONE ; 0x9635c
	map_header_2 CeladonDeptStore6F, CELADON_DEPT_STORE_6F, $0, NONE ; 0x96368
	map_header_2 CeladonDeptStoreElevator, CELADON_DEPT_STORE_ELEVATOR, $0, NONE ; 0x96374
	map_header_2 CeladonMansion1F, CELADON_MANSION_1F, $0, NONE ; 0x96380
	map_header_2 CeladonMansion2F, CELADON_MANSION_2F, $0, NONE ; 0x9638c
	map_header_2 CeladonMansion3F, CELADON_MANSION_3F, $0, NONE ; 0x96398
	map_header_2 CeladonMansionRoof, CELADON_MANSION_ROOF, $1, NONE ; 0x963a4
	map_header_2 CeladonMansionRoofHouse, CELADON_MANSION_ROOF_HOUSE, $0, NONE ; 0x963b0
	map_header_2 CeladonPokeCenter1F, CELADON_POKECENTER_1F, $0, NONE ; 0x963bc
	map_header_2 CeladonPokeCenter2FBeta, CELADON_POKECENTER_2F_BETA, $0, NONE ; 0x963c8
	map_header_2 CeladonGameCorner, CELADON_GAME_CORNER, $0, NONE ; 0x963d4
	map_header_2 CeladonGameCornerPrizeRoom, CELADON_GAME_CORNER_PRIZE_ROOM, $0, NONE ; 0x963e0
	map_header_2 CeladonGym, CELADON_GYM, $0, NONE ; 0x963ec
	map_header_2 CeladonCafe, CELADON_CAFE, $0, NONE ; 0x963f8
	map_header_2 Route16FuchsiaSpeechHouse, ROUTE_16_FUCHSIA_SPEECH_HOUSE, $0, NONE ; 0x96404
	map_header_2 Route16Gate, ROUTE_16_GATE, $0, NONE ; 0x96410
	map_header_2 Route7SaffronGate, ROUTE_7_SAFFRON_GATE, $0, NONE ; 0x9641c
	map_header_2 Route1718Gate, ROUTE_17_18_GATE, $0, NONE ; 0x96428
	map_header_2 ManiasHouse, MANIAS_HOUSE, $0, NONE ; 0x96434
	map_header_2 CianwoodGym, CIANWOOD_GYM, $0, NONE ; 0x96440
	map_header_2 CianwoodPokeCenter1F, CIANWOOD_POKECENTER_1F, $0, NONE ; 0x9644c
	map_header_2 CianwoodPharmacy, CIANWOOD_PHARMACY, $0, NONE ; 0x96458
	map_header_2 CianwoodCityPhotoStudio, CIANWOOD_CITY_PHOTO_STUDIO, $0, NONE ; 0x96464
	map_header_2 CianwoodLugiaSpeechHouse, CIANWOOD_LUGIA_SPEECH_HOUSE, $0, NONE ; 0x96470
	map_header_2 PokeSeersHouse, POKE_SEERS_HOUSE, $0, NONE ; 0x9647c
	map_header_2 BattleTower1F, BATTLE_TOWER_1F, $0, NONE ; 0x96488
	map_header_2 BattleTowerBattleRoom, BATTLE_TOWER_BATTLE_ROOM, $0, NONE ; 0x96494
	map_header_2 BattleTowerElevator, BATTLE_TOWER_ELEVATOR, $0, NONE ; 0x964a0
	map_header_2 BattleTowerHallway, BATTLE_TOWER_HALLWAY, $0, NONE ; 0x964ac
	map_header_2 Route40BattleTowerGate, ROUTE_40_BATTLE_TOWER_GATE, $0, NONE ; 0x964b8
	map_header_2 BattleTowerOutside, BATTLE_TOWER_OUTSIDE, $5, NONE ; 0x964c4
	map_header_2 ViridianGym, VIRIDIAN_GYM, $0, NONE ; 0x964d0
	map_header_2 ViridianNicknameSpeechHouse, VIRIDIAN_NICKNAME_SPEECH_HOUSE, $0, NONE ; 0x964dc
	map_header_2 TrainerHouse1F, TRAINER_HOUSE_1F, $0, NONE ; 0x964e8
	map_header_2 TrainerHouseB1F, TRAINER_HOUSE_B1F, $0, NONE ; 0x964f4
	map_header_2 ViridianMart, VIRIDIAN_MART, $0, NONE ; 0x96500
	map_header_2 ViridianPokeCenter1F, VIRIDIAN_POKECENTER_1F, $0, NONE ; 0x9650c
	map_header_2 ViridianPokeCenter2FBeta, VIRIDIAN_POKECENTER_2F_BETA, $0, NONE ; 0x96518
	map_header_2 Route2NuggetSpeechHouse, ROUTE_2_NUGGET_SPEECH_HOUSE, $0, NONE ; 0x96524
	map_header_2 Route2Gate, ROUTE_2_GATE, $0, NONE ; 0x96530
	map_header_2 VictoryRoadGate, VICTORY_ROAD_GATE, $0, NONE ; 0x9653c
	map_header_2 ElmsLab, ELMS_LAB, $0, NONE ; 0x96548
	map_header_2 KrissHouse1F, KRISS_HOUSE_1F, $0, NONE ; 0x96554
	map_header_2 KrissHouse2F, KRISS_HOUSE_2F, $0, NONE ; 0x96560
	map_header_2 KrissNeighborsHouse, KRISS_NEIGHBORS_HOUSE, $0, NONE ; 0x9656c
	map_header_2 ElmsHouse, ELMS_HOUSE, $0, NONE ; 0x96578
	map_header_2 Route26HealSpeechHouse, ROUTE_26_HEAL_SPEECH_HOUSE, $0, NONE ; 0x96584
	map_header_2 Route26DayofWeekSiblingsHouse, ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE, $0, NONE ; 0x96590
	map_header_2 Route27SandstormHouse, ROUTE_27_SANDSTORM_HOUSE, $0, NONE ; 0x9659c
	map_header_2 Route2946Gate, ROUTE_29_46_GATE, $0, NONE ; 0x965a8
	map_header_2 FightingDojo, FIGHTING_DOJO, $0, NONE ; 0x965b4
	map_header_2 SaffronGym, SAFFRON_GYM, $0, NONE ; 0x965c0
	map_header_2 SaffronMart, SAFFRON_MART, $0, NONE ; 0x965cc
	map_header_2 SaffronPokeCenter1F, SAFFRON_POKECENTER_1F, $0, NONE ; 0x965d8
	map_header_2 SaffronPokeCenter2FBeta, SAFFRON_POKECENTER_2F_BETA, $0, NONE ; 0x965e4
	map_header_2 MrPsychicsHouse, MR_PSYCHICS_HOUSE, $0, NONE ; 0x965f0
	map_header_2 SaffronTrainStation, SAFFRON_TRAIN_STATION, $0, NONE ; 0x965fc
	map_header_2 SilphCo1F, SILPH_CO_1F, $0, NONE ; 0x96608
	map_header_2 CopycatsHouse1F, COPYCATS_HOUSE_1F, $0, NONE ; 0x96614
	map_header_2 CopycatsHouse2F, COPYCATS_HOUSE_2F, $0, NONE ; 0x96620
	map_header_2 Route5UndergroundEntrance, ROUTE_5_UNDERGROUND_ENTRANCE, $0, NONE ; 0x9662c
	map_header_2 Route5SaffronCityGate, ROUTE_5_SAFFRON_CITY_GATE, $0, NONE ; 0x96638
	map_header_2 Route5CleanseTagSpeechHouse, ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE, $0, NONE ; 0x96644
	map_header_2 CherrygroveMart, CHERRYGROVE_MART, $0, NONE ; 0x96650
	map_header_2 CherrygrovePokeCenter1F, CHERRYGROVE_POKECENTER_1F, $0, NONE ; 0x9665c
	map_header_2 CherrygroveGymSpeechHouse, CHERRYGROVE_GYM_SPEECH_HOUSE, $0, NONE ; 0x96668
	map_header_2 GuideGentsHouse, GUIDE_GENTS_HOUSE, $0, NONE ; 0x96674
	map_header_2 CherrygroveEvolutionSpeechHouse, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, $0, NONE ; 0x96680
	map_header_2 Route30BerrySpeechHouse, ROUTE_30_BERRY_SPEECH_HOUSE, $0, NONE ; 0x9668c
	map_header_2 MrPokemonsHouse, MR_POKEMONS_HOUSE, $0, NONE ; 0x96698
	map_header_2 Route31VioletGate, ROUTE_31_VIOLET_GATE, $0, NONE ; 0x966a4
