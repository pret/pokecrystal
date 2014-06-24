NewBarkTown_SecondMapHeader: ; 0x94dd8
	db $5 ; border block
	db NEW_BARK_TOWN_HEIGHT, NEW_BARK_TOWN_WIDTH
	dbw BANK(NewBarkTown_BlockData), NewBarkTown_BlockData
	dbw BANK(NewBarkTown_MapScriptHeader), NewBarkTown_MapScriptHeader
	dw NewBarkTown_MapEventHeader

	db WEST | EAST ; connections

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

CherrygroveCity_SecondMapHeader: ; 0x94dfc
	db $35 ; border block
	db CHERRYGROVE_CITY_HEIGHT, CHERRYGROVE_CITY_WIDTH
	dbw BANK(CherrygroveCity_BlockData), CherrygroveCity_BlockData
	dbw BANK(CherrygroveCity_MapScriptHeader), CherrygroveCity_MapScriptHeader
	dw CherrygroveCity_MapEventHeader

	db NORTH | EAST ; connections

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

VioletCity_SecondMapHeader: ; 0x94e20
	db $5 ; border block
	db VIOLET_CITY_HEIGHT, VIOLET_CITY_WIDTH
	dbw BANK(VioletCity_BlockData), VioletCity_BlockData
	dbw BANK(VioletCity_MapScriptHeader), VioletCity_MapScriptHeader
	dw VioletCity_MapEventHeader

	db SOUTH | WEST | EAST ; connections

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

AzaleaTown_SecondMapHeader: ; 0x94e50
	db $5 ; border block
	db AZALEA_TOWN_HEIGHT, AZALEA_TOWN_WIDTH
	dbw BANK(AzaleaTown_BlockData), AzaleaTown_BlockData
	dbw BANK(AzaleaTown_MapScriptHeader), AzaleaTown_MapScriptHeader
	dw AzaleaTown_MapEventHeader

	db WEST | EAST ; connections

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

CianwoodCity_SecondMapHeader: ; 0x94e74
	db $35 ; border block
	db CIANWOOD_CITY_HEIGHT, CIANWOOD_CITY_WIDTH
	dbw BANK(CianwoodCity_BlockData), CianwoodCity_BlockData
	dbw BANK(CianwoodCity_MapScriptHeader), CianwoodCity_MapScriptHeader
	dw CianwoodCity_MapEventHeader

	db EAST ; connections

	; EAST to Route 41
	map ROUTE_41
	dw (Route41_BlockData) ; strip pointer
	dw $c851 ; strip destination
	db 27, ROUTE_41_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_41_WIDTH) ; window
; 0x94e8c

GoldenrodCity_SecondMapHeader: ; 0x94e8c
	db $35 ; border block
	db GOLDENROD_CITY_HEIGHT, GOLDENROD_CITY_WIDTH
	dbw BANK(GoldenrodCity_BlockData), GoldenrodCity_BlockData
	dbw BANK(GoldenrodCity_MapScriptHeader), GoldenrodCity_MapScriptHeader
	dw GoldenrodCity_MapEventHeader

	db NORTH | SOUTH ; connections

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

OlivineCity_SecondMapHeader: ; 0x94eb0
	db $35 ; border block
	db OLIVINE_CITY_HEIGHT, OLIVINE_CITY_WIDTH
	dbw BANK(OlivineCity_BlockData), OlivineCity_BlockData
	dbw BANK(OlivineCity_MapScriptHeader), OlivineCity_MapScriptHeader
	dw OlivineCity_MapEventHeader

	db NORTH | WEST ; connections

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

EcruteakCity_SecondMapHeader: ; 0x94ed4
	db $5 ; border block
	db ECRUTEAK_CITY_HEIGHT, ECRUTEAK_CITY_WIDTH
	dbw BANK(EcruteakCity_BlockData), EcruteakCity_BlockData
	dbw BANK(EcruteakCity_MapScriptHeader), EcruteakCity_MapScriptHeader
	dw EcruteakCity_MapEventHeader

	db SOUTH | WEST | EAST ; connections

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

MahoganyTown_SecondMapHeader: ; 0x94f04
	db $71 ; border block
	db MAHOGANY_TOWN_HEIGHT, MAHOGANY_TOWN_WIDTH
	dbw BANK(MahoganyTown_BlockData), MahoganyTown_BlockData
	dbw BANK(MahoganyTown_MapScriptHeader), MahoganyTown_MapScriptHeader
	dw MahoganyTown_MapEventHeader

	db NORTH | WEST | EAST ; connections

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

LakeofRage_SecondMapHeader: ; 0x94f34
	db $5 ; border block
	db LAKE_OF_RAGE_HEIGHT, LAKE_OF_RAGE_WIDTH
	dbw BANK(LakeofRage_BlockData), LakeofRage_BlockData
	dbw BANK(LakeofRage_MapScriptHeader), LakeofRage_MapScriptHeader
	dw LakeofRage_MapEventHeader

	db SOUTH ; connections

	; SOUTH to Route 43
	map ROUTE_43
	dw (Route43_BlockData) ; strip pointer
	dw ($C703 + 261 + ((LAKE_OF_RAGE_HEIGHT + 3) * (LAKE_OF_RAGE_WIDTH + 6))) ; strip destination
	db 10, ROUTE_43_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_43_WIDTH) ; window
; 0x94f4c

BlackthornCity_SecondMapHeader: ; 0x94f4c
	db $71 ; border block
	db BLACKTHORN_CITY_HEIGHT, BLACKTHORN_CITY_WIDTH
	dbw BANK(BlackthornCity_BlockData), BlackthornCity_BlockData
	dbw BANK(BlackthornCity_MapScriptHeader), BlackthornCity_MapScriptHeader
	dw BlackthornCity_MapEventHeader

	db SOUTH | WEST ; connections

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

SilverCaveOutside_SecondMapHeader: ; 0x94f70
	db $2c ; border block
	db SILVER_CAVE_OUTSIDE_HEIGHT, SILVER_CAVE_OUTSIDE_WIDTH
	dbw BANK(SilverCaveOutside_BlockData), SilverCaveOutside_BlockData
	dbw BANK(SilverCaveOutside_MapScriptHeader), SilverCaveOutside_MapScriptHeader
	dw SilverCaveOutside_MapEventHeader

	db EAST ; connections

	; EAST to Route 28
	map ROUTE_28
	dw (Route28_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_28_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_28_WIDTH) ; window
; 0x94f88

Route26_SecondMapHeader: ; 0x94f88
	db $5 ; border block
	db ROUTE_26_HEIGHT, ROUTE_26_WIDTH
	dbw BANK(Route26_BlockData), Route26_BlockData
	dbw BANK(Route26_MapScriptHeader), Route26_MapScriptHeader
	dw Route26_MapEventHeader

	db WEST ; connections

	; WEST to Route 27
	map ROUTE_27
	dw (Route27_BlockData + ROUTE_27_WIDTH - 3) ; strip pointer
	dw $cb00 ; strip destination
	db 9, ROUTE_27_WIDTH ; (connection strip length, connected map width)
	db 166, ((ROUTE_27_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 79) ; window
; 0x94fa0

Route27_SecondMapHeader: ; 0x94fa0
	db $35 ; border block
	db ROUTE_27_HEIGHT, ROUTE_27_WIDTH
	dbw BANK(Route27_BlockData), Route27_BlockData
	dbw BANK(Route27_MapScriptHeader), Route27_MapScriptHeader
	dw Route27_MapEventHeader

	db WEST | EAST ; connections

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

Route28_SecondMapHeader: ; 0x94fc4
	db $2c ; border block
	db ROUTE_28_HEIGHT, ROUTE_28_WIDTH
	dbw BANK(Route28_BlockData), Route28_BlockData
	dbw BANK(Route28_MapScriptHeader), Route28_MapScriptHeader
	dw Route28_MapEventHeader

	db WEST ; connections

	; WEST to Silver Cave Outside
	map SILVER_CAVE_OUTSIDE
	dw (SilverCaveOutside_BlockData + (((SILVER_CAVE_OUTSIDE_HEIGHT - ROUTE_28_HEIGHT) * SILVER_CAVE_OUTSIDE_WIDTH) - (SILVER_CAVE_OUTSIDE_WIDTH * 3) + (SILVER_CAVE_OUTSIDE_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, SILVER_CAVE_OUTSIDE_WIDTH ; (connection strip length, connected map width)
	db 18, ((SILVER_CAVE_OUTSIDE_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x94fdc

Route29_SecondMapHeader: ; 0x94fdc
	db $5 ; border block
	db ROUTE_29_HEIGHT, ROUTE_29_WIDTH
	dbw BANK(Route29_BlockData), Route29_BlockData
	dbw BANK(Route29_MapScriptHeader), Route29_MapScriptHeader
	dw Route29_MapEventHeader

	db NORTH | WEST | EAST ; connections

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

Route30_SecondMapHeader: ; 0x9500c
	db $5 ; border block
	db ROUTE_30_HEIGHT, ROUTE_30_WIDTH
	dbw BANK(Route30_BlockData), Route30_BlockData
	dbw BANK(Route30_MapScriptHeader), Route30_MapScriptHeader
	dw Route30_MapEventHeader

	db NORTH | SOUTH ; connections

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

Route31_SecondMapHeader: ; 0x95030
	db $5 ; border block
	db ROUTE_31_HEIGHT, ROUTE_31_WIDTH
	dbw BANK(Route31_BlockData), Route31_BlockData
	dbw BANK(Route31_MapScriptHeader), Route31_MapScriptHeader
	dw Route31_MapEventHeader

	db SOUTH | WEST ; connections

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

Route32_SecondMapHeader: ; 0x95054
	db $5 ; border block
	db ROUTE_32_HEIGHT, ROUTE_32_WIDTH
	dbw BANK(Route32_BlockData), Route32_BlockData
	dbw BANK(Route32_MapScriptHeader), Route32_MapScriptHeader
	dw Route32_MapEventHeader

	db NORTH | SOUTH ; connections

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

Route33_SecondMapHeader: ; 0x95078
	db $5 ; border block
	db ROUTE_33_HEIGHT, ROUTE_33_WIDTH
	dbw BANK(Route33_BlockData), Route33_BlockData
	dbw BANK(Route33_MapScriptHeader), Route33_MapScriptHeader
	dw Route33_MapEventHeader

	db NORTH | WEST ; connections

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

Route34_SecondMapHeader: ; 0x9509c
	db $5 ; border block
	db ROUTE_34_HEIGHT, ROUTE_34_WIDTH
	dbw BANK(Route34_BlockData), Route34_BlockData
	dbw BANK(Route34_MapScriptHeader), Route34_MapScriptHeader
	dw Route34_MapEventHeader

	db NORTH | EAST ; connections

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

Route35_SecondMapHeader: ; 0x950c0
	db $5 ; border block
	db ROUTE_35_HEIGHT, ROUTE_35_WIDTH
	dbw BANK(Route35_BlockData), Route35_BlockData
	dbw BANK(Route35_MapScriptHeader), Route35_MapScriptHeader
	dw Route35_MapEventHeader

	db NORTH | SOUTH ; connections

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

Route36_SecondMapHeader: ; 0x950e4
	db $5 ; border block
	db ROUTE_36_HEIGHT, ROUTE_36_WIDTH
	dbw BANK(Route36_BlockData), Route36_BlockData
	dbw BANK(Route36_MapScriptHeader), Route36_MapScriptHeader
	dw Route36_MapEventHeader

	db NORTH | SOUTH | EAST ; connections

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

Route37_SecondMapHeader: ; 0x95114
	db $5 ; border block
	db ROUTE_37_HEIGHT, ROUTE_37_WIDTH
	dbw BANK(Route37_BlockData), Route37_BlockData
	dbw BANK(Route37_MapScriptHeader), Route37_MapScriptHeader
	dw Route37_MapEventHeader

	db NORTH | SOUTH ; connections

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

Route38_SecondMapHeader: ; 0x95138
	db $5 ; border block
	db ROUTE_38_HEIGHT, ROUTE_38_WIDTH
	dbw BANK(Route38_BlockData), Route38_BlockData
	dbw BANK(Route38_MapScriptHeader), Route38_MapScriptHeader
	dw Route38_MapEventHeader

	db WEST | EAST ; connections

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

Route39_SecondMapHeader: ; 0x9515c
	db $5 ; border block
	db ROUTE_39_HEIGHT, ROUTE_39_WIDTH
	dbw BANK(Route39_BlockData), Route39_BlockData
	dbw BANK(Route39_MapScriptHeader), Route39_MapScriptHeader
	dw Route39_MapEventHeader

	db SOUTH | EAST ; connections

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

Route40_SecondMapHeader: ; 0x95180
	db $35 ; border block
	db ROUTE_40_HEIGHT, ROUTE_40_WIDTH
	dbw BANK(Route40_BlockData), Route40_BlockData
	dbw BANK(Route40_MapScriptHeader), Route40_MapScriptHeader
	dw Route40_MapEventHeader

	db SOUTH | EAST ; connections

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

Route41_SecondMapHeader: ; 0x951a4
	db $35 ; border block
	db ROUTE_41_HEIGHT, ROUTE_41_WIDTH
	dbw BANK(Route41_BlockData), Route41_BlockData
	dbw BANK(Route41_MapScriptHeader), Route41_MapScriptHeader
	dw Route41_MapEventHeader

	db NORTH | WEST ; connections

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

Route42_SecondMapHeader: ; 0x951c8
	db $5 ; border block
	db ROUTE_42_HEIGHT, ROUTE_42_WIDTH
	dbw BANK(Route42_BlockData), Route42_BlockData
	dbw BANK(Route42_MapScriptHeader), Route42_MapScriptHeader
	dw Route42_MapEventHeader

	db WEST | EAST ; connections

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

Route43_SecondMapHeader: ; 0x951ec
	db $5 ; border block
	db ROUTE_43_HEIGHT, ROUTE_43_WIDTH
	dbw BANK(Route43_BlockData), Route43_BlockData
	dbw BANK(Route43_MapScriptHeader), Route43_MapScriptHeader
	dw Route43_MapEventHeader

	db NORTH | SOUTH ; connections

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

Route44_SecondMapHeader: ; 0x95210
	db $71 ; border block
	db ROUTE_44_HEIGHT, ROUTE_44_WIDTH
	dbw BANK(Route44_BlockData), Route44_BlockData
	dbw BANK(Route44_MapScriptHeader), Route44_MapScriptHeader
	dw Route44_MapEventHeader

	db WEST | EAST ; connections

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

Route45_SecondMapHeader: ; 0x95234
	db $71 ; border block
	db ROUTE_45_HEIGHT, ROUTE_45_WIDTH
	dbw BANK(Route45_BlockData), Route45_BlockData
	dbw BANK(Route45_MapScriptHeader), Route45_MapScriptHeader
	dw Route45_MapEventHeader

	db NORTH | WEST ; connections

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

Route46_SecondMapHeader: ; 0x95258
	db $5 ; border block
	db ROUTE_46_HEIGHT, ROUTE_46_WIDTH
	dbw BANK(Route46_BlockData), Route46_BlockData
	dbw BANK(Route46_MapScriptHeader), Route46_MapScriptHeader
	dw Route46_MapEventHeader

	db SOUTH | EAST ; connections

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

PewterCity_SecondMapHeader: ; 0x9527c
	db $f ; border block
	db PEWTER_CITY_HEIGHT, PEWTER_CITY_WIDTH
	dbw BANK(PewterCity_BlockData), PewterCity_BlockData
	dbw BANK(PewterCity_MapScriptHeader), PewterCity_MapScriptHeader
	dw PewterCity_MapEventHeader

	db SOUTH | EAST ; connections

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

Route2_SecondMapHeader: ; 0x952a0
	db $f ; border block
	db ROUTE_2_HEIGHT, ROUTE_2_WIDTH
	dbw BANK(Route2_BlockData), Route2_BlockData
	dbw BANK(Route2_MapScriptHeader), Route2_MapScriptHeader
	dw Route2_MapEventHeader

	db NORTH | SOUTH ; connections

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

ViridianCity_SecondMapHeader: ; 0x952c4
	db $f ; border block
	db VIRIDIAN_CITY_HEIGHT, VIRIDIAN_CITY_WIDTH
	dbw BANK(ViridianCity_BlockData), ViridianCity_BlockData
	dbw BANK(ViridianCity_MapScriptHeader), ViridianCity_MapScriptHeader
	dw ViridianCity_MapEventHeader

	db NORTH | SOUTH | WEST ; connections

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

Route22_SecondMapHeader: ; 0x952f4
	db $2c ; border block
	db ROUTE_22_HEIGHT, ROUTE_22_WIDTH
	dbw BANK(Route22_BlockData), Route22_BlockData
	dbw BANK(Route22_MapScriptHeader), Route22_MapScriptHeader
	dw Route22_MapEventHeader

	db EAST ; connections

	; EAST to Viridian City
	map VIRIDIAN_CITY
	dw (ViridianCity_BlockData + 100 - (VIRIDIAN_CITY_WIDTH * 4)) ; strip pointer
	dw $c817 ; strip destination
	db 15, VIRIDIAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 8, 0 ; yoffset, xoffset
	dw ($C807 + VIRIDIAN_CITY_WIDTH) ; window
; 0x9530c

Route1_SecondMapHeader: ; 0x9530c
	db $f ; border block
	db ROUTE_1_HEIGHT, ROUTE_1_WIDTH
	dbw BANK(Route1_BlockData), Route1_BlockData
	dbw BANK(Route1_MapScriptHeader), Route1_MapScriptHeader
	dw Route1_MapEventHeader

	db NORTH | SOUTH ; connections

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

PalletTown_SecondMapHeader: ; 0x95330
	db $f ; border block
	db PALLET_TOWN_HEIGHT, PALLET_TOWN_WIDTH
	dbw BANK(PalletTown_BlockData), PalletTown_BlockData
	dbw BANK(PalletTown_MapScriptHeader), PalletTown_MapScriptHeader
	dw PalletTown_MapEventHeader

	db NORTH | SOUTH ; connections

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

Route21_SecondMapHeader: ; 0x95354
	db $43 ; border block
	db ROUTE_21_HEIGHT, ROUTE_21_WIDTH
	dbw BANK(Route21_BlockData), Route21_BlockData
	dbw BANK(Route21_MapScriptHeader), Route21_MapScriptHeader
	dw Route21_MapEventHeader

	db NORTH | SOUTH ; connections

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

CinnabarIsland_SecondMapHeader: ; 0x95378
	db $43 ; border block
	db CINNABAR_ISLAND_HEIGHT, CINNABAR_ISLAND_WIDTH
	dbw BANK(CinnabarIsland_BlockData), CinnabarIsland_BlockData
	dbw BANK(CinnabarIsland_MapScriptHeader), CinnabarIsland_MapScriptHeader
	dw CinnabarIsland_MapEventHeader

	db NORTH | EAST ; connections

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

Route20_SecondMapHeader: ; 0x9539c
	db $43 ; border block
	db ROUTE_20_HEIGHT, ROUTE_20_WIDTH
	dbw BANK(Route20_BlockData), Route20_BlockData
	dbw BANK(Route20_MapScriptHeader), Route20_MapScriptHeader
	dw Route20_MapEventHeader

	db WEST | EAST ; connections

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

Route19_SecondMapHeader: ; 0x953c0
	db $43 ; border block
	db ROUTE_19_HEIGHT, ROUTE_19_WIDTH
	dbw BANK(Route19_BlockData), Route19_BlockData
	dbw BANK(Route19_MapScriptHeader), Route19_MapScriptHeader
	dw Route19_MapEventHeader

	db NORTH | WEST ; connections

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

FuchsiaCity_SecondMapHeader: ; 0x953e4
	db $f ; border block
	db FUCHSIA_CITY_HEIGHT, FUCHSIA_CITY_WIDTH
	dbw BANK(FuchsiaCity_BlockData), FuchsiaCity_BlockData
	dbw BANK(FuchsiaCity_MapScriptHeader), FuchsiaCity_MapScriptHeader
	dw FuchsiaCity_MapEventHeader

	db SOUTH | WEST | EAST ; connections

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

Route18_SecondMapHeader: ; 0x95414
	db $43 ; border block
	db ROUTE_18_HEIGHT, ROUTE_18_WIDTH
	dbw BANK(Route18_BlockData), Route18_BlockData
	dbw BANK(Route18_MapScriptHeader), Route18_MapScriptHeader
	dw Route18_MapEventHeader

	db WEST | EAST ; connections

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

Route17_SecondMapHeader: ; 0x95438
	db $43 ; border block
	db ROUTE_17_HEIGHT, ROUTE_17_WIDTH
	dbw BANK(Route17_BlockData), Route17_BlockData
	dbw BANK(Route17_MapScriptHeader), Route17_MapScriptHeader
	dw Route17_MapEventHeader

	db NORTH | EAST ; connections

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

Route16_SecondMapHeader: ; 0x9545c
	db $f ; border block
	db ROUTE_16_HEIGHT, ROUTE_16_WIDTH
	dbw BANK(Route16_BlockData), Route16_BlockData
	dbw BANK(Route16_MapScriptHeader), Route16_MapScriptHeader
	dw Route16_MapEventHeader

	db SOUTH | EAST ; connections

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

CeladonCity_SecondMapHeader: ; 0x95480
	db $f ; border block
	db CELADON_CITY_HEIGHT, CELADON_CITY_WIDTH
	dbw BANK(CeladonCity_BlockData), CeladonCity_BlockData
	dbw BANK(CeladonCity_MapScriptHeader), CeladonCity_MapScriptHeader
	dw CeladonCity_MapEventHeader

	db WEST | EAST ; connections

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

Route7_SecondMapHeader: ; 0x954a4
	db $f ; border block
	db ROUTE_7_HEIGHT, ROUTE_7_WIDTH
	dbw BANK(Route7_BlockData), Route7_BlockData
	dbw BANK(Route7_MapScriptHeader), Route7_MapScriptHeader
	dw Route7_MapEventHeader

	db WEST | EAST ; connections

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

Route15_SecondMapHeader: ; 0x954c8
	db $f ; border block
	db ROUTE_15_HEIGHT, ROUTE_15_WIDTH
	dbw BANK(Route15_BlockData), Route15_BlockData
	dbw BANK(Route15_MapScriptHeader), Route15_MapScriptHeader
	dw Route15_MapEventHeader

	db WEST | EAST ; connections

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

Route14_SecondMapHeader: ; 0x954ec
	db $43 ; border block
	db ROUTE_14_HEIGHT, ROUTE_14_WIDTH
	dbw BANK(Route14_BlockData), Route14_BlockData
	dbw BANK(Route14_MapScriptHeader), Route14_MapScriptHeader
	dw Route14_MapEventHeader

	db NORTH | WEST ; connections

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

Route13_SecondMapHeader: ; 0x95510
	db $43 ; border block
	db ROUTE_13_HEIGHT, ROUTE_13_WIDTH
	dbw BANK(Route13_BlockData), Route13_BlockData
	dbw BANK(Route13_MapScriptHeader), Route13_MapScriptHeader
	dw Route13_MapEventHeader

	db NORTH | SOUTH ; connections

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

Route12_SecondMapHeader: ; 0x95534
	db $43 ; border block
	db ROUTE_12_HEIGHT, ROUTE_12_WIDTH
	dbw BANK(Route12_BlockData), Route12_BlockData
	dbw BANK(Route12_MapScriptHeader), Route12_MapScriptHeader
	dw Route12_MapEventHeader

	db NORTH | SOUTH | WEST ; connections

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

Route11_SecondMapHeader: ; 0x95564
	db $f ; border block
	db ROUTE_11_HEIGHT, ROUTE_11_WIDTH
	dbw BANK(Route11_BlockData), Route11_BlockData
	dbw BANK(Route11_MapScriptHeader), Route11_MapScriptHeader
	dw Route11_MapEventHeader

	db WEST | EAST ; connections

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

LavenderTown_SecondMapHeader: ; 0x95588
	db $2c ; border block
	db LAVENDER_TOWN_HEIGHT, LAVENDER_TOWN_WIDTH
	dbw BANK(LavenderTown_BlockData), LavenderTown_BlockData
	dbw BANK(LavenderTown_MapScriptHeader), LavenderTown_MapScriptHeader
	dw LavenderTown_MapEventHeader

	db NORTH | SOUTH | WEST ; connections

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

VermilionCity_SecondMapHeader: ; 0x955b8
	db $43 ; border block
	db VERMILION_CITY_HEIGHT, VERMILION_CITY_WIDTH
	dbw BANK(VermilionCity_BlockData), VermilionCity_BlockData
	dbw BANK(VermilionCity_MapScriptHeader), VermilionCity_MapScriptHeader
	dw VermilionCity_MapEventHeader

	db NORTH | EAST ; connections

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

Route6_SecondMapHeader: ; 0x955dc
	db $f ; border block
	db ROUTE_6_HEIGHT, ROUTE_6_WIDTH
	dbw BANK(Route6_BlockData), Route6_BlockData
	dbw BANK(Route6_MapScriptHeader), Route6_MapScriptHeader
	dw Route6_MapEventHeader

	db NORTH | SOUTH ; connections

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

SaffronCity_SecondMapHeader: ; 0x95600
	db $f ; border block
	db SAFFRON_CITY_HEIGHT, SAFFRON_CITY_WIDTH
	dbw BANK(SaffronCity_BlockData), SaffronCity_BlockData
	dbw BANK(SaffronCity_MapScriptHeader), SaffronCity_MapScriptHeader
	dw SaffronCity_MapEventHeader

	db NORTH | SOUTH | WEST | EAST ; connections

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

Route5_SecondMapHeader: ; 0x9563c
	db $f ; border block
	db ROUTE_5_HEIGHT, ROUTE_5_WIDTH
	dbw BANK(Route5_BlockData), Route5_BlockData
	dbw BANK(Route5_MapScriptHeader), Route5_MapScriptHeader
	dw Route5_MapEventHeader

	db NORTH | SOUTH ; connections

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

CeruleanCity_SecondMapHeader: ; 0x95660
	db $f ; border block
	db CERULEAN_CITY_HEIGHT, CERULEAN_CITY_WIDTH
	dbw BANK(CeruleanCity_BlockData), CeruleanCity_BlockData
	dbw BANK(CeruleanCity_MapScriptHeader), CeruleanCity_MapScriptHeader
	dw CeruleanCity_MapEventHeader

	db NORTH | SOUTH | WEST | EAST ; connections

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

Route9_SecondMapHeader: ; 0x9569c
	db $2c ; border block
	db ROUTE_9_HEIGHT, ROUTE_9_WIDTH
	dbw BANK(Route9_BlockData), Route9_BlockData
	dbw BANK(Route9_MapScriptHeader), Route9_MapScriptHeader
	dw Route9_MapEventHeader

	db SOUTH | WEST ; connections

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

Route24_SecondMapHeader: ; 0x956c0
	db $2c ; border block
	db ROUTE_24_HEIGHT, ROUTE_24_WIDTH
	dbw BANK(Route24_BlockData), Route24_BlockData
	dbw BANK(Route24_MapScriptHeader), Route24_MapScriptHeader
	dw Route24_MapEventHeader

	db NORTH | SOUTH ; connections

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

Route25_SecondMapHeader: ; 0x956e4
	db $2c ; border block
	db ROUTE_25_HEIGHT, ROUTE_25_WIDTH
	dbw BANK(Route25_BlockData), Route25_BlockData
	dbw BANK(Route25_MapScriptHeader), Route25_MapScriptHeader
	dw Route25_MapEventHeader

	db SOUTH ; connections

	; SOUTH to Route 24
	map ROUTE_24
	dw (Route24_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_25_HEIGHT + 3) * (ROUTE_25_WIDTH + 6))) ; strip destination
	db 10, ROUTE_24_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_24_WIDTH) ; window
; 0x956fc

Route3_SecondMapHeader: ; 0x956fc
	db $2c ; border block
	db ROUTE_3_HEIGHT, ROUTE_3_WIDTH
	dbw BANK(Route3_BlockData), Route3_BlockData
	dbw BANK(Route3_MapScriptHeader), Route3_MapScriptHeader
	dw Route3_MapEventHeader

	db WEST | EAST ; connections

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

Route4_SecondMapHeader: ; 0x95720
	db $2c ; border block
	db ROUTE_4_HEIGHT, ROUTE_4_WIDTH
	dbw BANK(Route4_BlockData), Route4_BlockData
	dbw BANK(Route4_MapScriptHeader), Route4_MapScriptHeader
	dw Route4_MapEventHeader

	db WEST | EAST ; connections

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

Route8_SecondMapHeader: ; 0x95744
	db $2c ; border block
	db ROUTE_8_HEIGHT, ROUTE_8_WIDTH
	dbw BANK(Route8_BlockData), Route8_BlockData
	dbw BANK(Route8_MapScriptHeader), Route8_MapScriptHeader
	dw Route8_MapEventHeader

	db WEST | EAST ; connections

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

Route10North_SecondMapHeader: ; 0x95768
	db $2c ; border block
	db ROUTE_10_NORTH_HEIGHT, ROUTE_10_NORTH_WIDTH
	dbw BANK(Route10North_BlockData), Route10North_BlockData
	dbw BANK(Route10North_MapScriptHeader), Route10North_MapScriptHeader
	dw Route10North_MapEventHeader

	db NORTH | SOUTH ; connections

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

Route10South_SecondMapHeader: ; 0x9578c
	db $2c ; border block
	db ROUTE_10_SOUTH_HEIGHT, ROUTE_10_SOUTH_WIDTH
	dbw BANK(Route10South_BlockData), Route10South_BlockData
	dbw BANK(Route10South_MapScriptHeader), Route10South_MapScriptHeader
	dw Route10South_MapEventHeader

	db NORTH | SOUTH ; connections

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

Route23_SecondMapHeader: ; 0x957b0
	db $f ; border block
	db ROUTE_23_HEIGHT, ROUTE_23_WIDTH
	dbw BANK(Route23_BlockData), Route23_BlockData
	dbw BANK(Route23_MapScriptHeader), Route23_MapScriptHeader
	dw Route23_MapEventHeader

	db 0 ; connections
; 0x957bc

SproutTower1F_SecondMapHeader: ; 0x957bc
	db $0 ; border block
	db SPROUT_TOWER_1F_HEIGHT, SPROUT_TOWER_1F_WIDTH
	dbw BANK(SproutTower1F_BlockData), SproutTower1F_BlockData
	dbw BANK(SproutTower1F_MapScriptHeader), SproutTower1F_MapScriptHeader
	dw SproutTower1F_MapEventHeader

	db 0 ; connections
; 0x957c8

SproutTower2F_SecondMapHeader: ; 0x957c8
	db $0 ; border block
	db SPROUT_TOWER_2F_HEIGHT, SPROUT_TOWER_2F_WIDTH
	dbw BANK(SproutTower2F_BlockData), SproutTower2F_BlockData
	dbw BANK(SproutTower2F_MapScriptHeader), SproutTower2F_MapScriptHeader
	dw SproutTower2F_MapEventHeader

	db 0 ; connections
; 0x957d4

SproutTower3F_SecondMapHeader: ; 0x957d4
	db $0 ; border block
	db SPROUT_TOWER_3F_HEIGHT, SPROUT_TOWER_3F_WIDTH
	dbw BANK(SproutTower3F_BlockData), SproutTower3F_BlockData
	dbw BANK(SproutTower3F_MapScriptHeader), SproutTower3F_MapScriptHeader
	dw SproutTower3F_MapEventHeader

	db 0 ; connections
; 0x957e0

TinTower1F_SecondMapHeader: ; 0x957e0
	db $0 ; border block
	db TIN_TOWER_1F_HEIGHT, TIN_TOWER_1F_WIDTH
	dbw BANK(TinTower1F_BlockData), TinTower1F_BlockData
	dbw BANK(TinTower1F_MapScriptHeader), TinTower1F_MapScriptHeader
	dw TinTower1F_MapEventHeader

	db 0 ; connections
; 0x957ec

TinTower2F_SecondMapHeader: ; 0x957ec
	db $0 ; border block
	db TIN_TOWER_2F_HEIGHT, TIN_TOWER_2F_WIDTH
	dbw BANK(TinTower2F_BlockData), TinTower2F_BlockData
	dbw BANK(TinTower2F_MapScriptHeader), TinTower2F_MapScriptHeader
	dw TinTower2F_MapEventHeader

	db 0 ; connections
; 0x957f8

TinTower3F_SecondMapHeader: ; 0x957f8
	db $0 ; border block
	db TIN_TOWER_3F_HEIGHT, TIN_TOWER_3F_WIDTH
	dbw BANK(TinTower3F_BlockData), TinTower3F_BlockData
	dbw BANK(TinTower3F_MapScriptHeader), TinTower3F_MapScriptHeader
	dw TinTower3F_MapEventHeader

	db 0 ; connections
; 0x95804

TinTower4F_SecondMapHeader: ; 0x95804
	db $0 ; border block
	db TIN_TOWER_4F_HEIGHT, TIN_TOWER_4F_WIDTH
	dbw BANK(TinTower4F_BlockData), TinTower4F_BlockData
	dbw BANK(TinTower4F_MapScriptHeader), TinTower4F_MapScriptHeader
	dw TinTower4F_MapEventHeader

	db 0 ; connections
; 0x95810

TinTower5F_SecondMapHeader: ; 0x95810
	db $0 ; border block
	db TIN_TOWER_5F_HEIGHT, TIN_TOWER_5F_WIDTH
	dbw BANK(TinTower5F_BlockData), TinTower5F_BlockData
	dbw BANK(TinTower5F_MapScriptHeader), TinTower5F_MapScriptHeader
	dw TinTower5F_MapEventHeader

	db 0 ; connections
; 0x9581c

TinTower6F_SecondMapHeader: ; 0x9581c
	db $0 ; border block
	db TIN_TOWER_6F_HEIGHT, TIN_TOWER_6F_WIDTH
	dbw BANK(TinTower6F_BlockData), TinTower6F_BlockData
	dbw BANK(TinTower6F_MapScriptHeader), TinTower6F_MapScriptHeader
	dw TinTower6F_MapEventHeader

	db 0 ; connections
; 0x95828

TinTower7F_SecondMapHeader: ; 0x95828
	db $0 ; border block
	db TIN_TOWER_7F_HEIGHT, TIN_TOWER_7F_WIDTH
	dbw BANK(TinTower7F_BlockData), TinTower7F_BlockData
	dbw BANK(TinTower7F_MapScriptHeader), TinTower7F_MapScriptHeader
	dw TinTower7F_MapEventHeader

	db 0 ; connections
; 0x95834

TinTower8F_SecondMapHeader: ; 0x95834
	db $0 ; border block
	db TIN_TOWER_8F_HEIGHT, TIN_TOWER_8F_WIDTH
	dbw BANK(TinTower8F_BlockData), TinTower8F_BlockData
	dbw BANK(TinTower8F_MapScriptHeader), TinTower8F_MapScriptHeader
	dw TinTower8F_MapEventHeader

	db 0 ; connections
; 0x95840

TinTower9F_SecondMapHeader: ; 0x95840
	db $0 ; border block
	db TIN_TOWER_9F_HEIGHT, TIN_TOWER_9F_WIDTH
	dbw BANK(TinTower9F_BlockData), TinTower9F_BlockData
	dbw BANK(TinTower9F_MapScriptHeader), TinTower9F_MapScriptHeader
	dw TinTower9F_MapEventHeader

	db 0 ; connections
; 0x9584c

BurnedTower1F_SecondMapHeader: ; 0x9584c
	db $0 ; border block
	db BURNED_TOWER_1F_HEIGHT, BURNED_TOWER_1F_WIDTH
	dbw BANK(BurnedTower1F_BlockData), BurnedTower1F_BlockData
	dbw BANK(BurnedTower1F_MapScriptHeader), BurnedTower1F_MapScriptHeader
	dw BurnedTower1F_MapEventHeader

	db 0 ; connections
; 0x95858

BurnedTowerB1F_SecondMapHeader: ; 0x95858
	db $9 ; border block
	db BURNED_TOWER_B1F_HEIGHT, BURNED_TOWER_B1F_WIDTH
	dbw BANK(BurnedTowerB1F_BlockData), BurnedTowerB1F_BlockData
	dbw BANK(BurnedTowerB1F_MapScriptHeader), BurnedTowerB1F_MapScriptHeader
	dw BurnedTowerB1F_MapEventHeader

	db 0 ; connections
; 0x95864

NationalPark_SecondMapHeader: ; 0x95864
	db $0 ; border block
	db NATIONAL_PARK_HEIGHT, NATIONAL_PARK_WIDTH
	dbw BANK(NationalPark_BlockData), NationalPark_BlockData
	dbw BANK(NationalPark_MapScriptHeader), NationalPark_MapScriptHeader
	dw NationalPark_MapEventHeader

	db 0 ; connections
; 0x95870

NationalParkBugContest_SecondMapHeader: ; 0x95870
	db $0 ; border block
	db NATIONAL_PARK_BUG_CONTEST_HEIGHT, NATIONAL_PARK_BUG_CONTEST_WIDTH
	dbw BANK(NationalPark_BlockData), NationalPark_BlockData
	dbw BANK(NationalParkBugContest_MapScriptHeader), NationalParkBugContest_MapScriptHeader
	dw NationalParkBugContest_MapEventHeader

	db 0 ; connections
; 0x9587c

RadioTower1F_SecondMapHeader: ; 0x9587c
	db $0 ; border block
	db RADIO_TOWER_1F_HEIGHT, RADIO_TOWER_1F_WIDTH
	dbw BANK(RadioTower1F_BlockData), RadioTower1F_BlockData
	dbw BANK(RadioTower1F_MapScriptHeader), RadioTower1F_MapScriptHeader
	dw RadioTower1F_MapEventHeader

	db 0 ; connections
; 0x95888

RadioTower2F_SecondMapHeader: ; 0x95888
	db $0 ; border block
	db RADIO_TOWER_2F_HEIGHT, RADIO_TOWER_2F_WIDTH
	dbw BANK(RadioTower2F_BlockData), RadioTower2F_BlockData
	dbw BANK(RadioTower2F_MapScriptHeader), RadioTower2F_MapScriptHeader
	dw RadioTower2F_MapEventHeader

	db 0 ; connections
; 0x95894

RadioTower3F_SecondMapHeader: ; 0x95894
	db $0 ; border block
	db RADIO_TOWER_3F_HEIGHT, RADIO_TOWER_3F_WIDTH
	dbw BANK(RadioTower3F_BlockData), RadioTower3F_BlockData
	dbw BANK(RadioTower3F_MapScriptHeader), RadioTower3F_MapScriptHeader
	dw RadioTower3F_MapEventHeader

	db 0 ; connections
; 0x958a0

RadioTower4F_SecondMapHeader: ; 0x958a0
	db $0 ; border block
	db RADIO_TOWER_4F_HEIGHT, RADIO_TOWER_4F_WIDTH
	dbw BANK(RadioTower4F_BlockData), RadioTower4F_BlockData
	dbw BANK(RadioTower4F_MapScriptHeader), RadioTower4F_MapScriptHeader
	dw RadioTower4F_MapEventHeader

	db 0 ; connections
; 0x958ac

RadioTower5F_SecondMapHeader: ; 0x958ac
	db $0 ; border block
	db RADIO_TOWER_5F_HEIGHT, RADIO_TOWER_5F_WIDTH
	dbw BANK(RadioTower5F_BlockData), RadioTower5F_BlockData
	dbw BANK(RadioTower5F_MapScriptHeader), RadioTower5F_MapScriptHeader
	dw RadioTower5F_MapEventHeader

	db 0 ; connections
; 0x958b8

RuinsofAlphOutside_SecondMapHeader: ; 0x958b8
	db $5 ; border block
	db RUINS_OF_ALPH_OUTSIDE_HEIGHT, RUINS_OF_ALPH_OUTSIDE_WIDTH
	dbw BANK(RuinsofAlphOutside_BlockData), RuinsofAlphOutside_BlockData
	dbw BANK(RuinsofAlphOutside_MapScriptHeader), RuinsofAlphOutside_MapScriptHeader
	dw RuinsofAlphOutside_MapEventHeader

	db 0 ; connections
; 0x958c4

RuinsofAlphHoOhChamber_SecondMapHeader: ; 0x958c4
	db $0 ; border block
	db RUINS_OF_ALPH_HO_OH_CHAMBER_HEIGHT, RUINS_OF_ALPH_HO_OH_CHAMBER_WIDTH
	dbw BANK(RuinsofAlphHoOhChamber_BlockData), RuinsofAlphHoOhChamber_BlockData
	dbw BANK(RuinsofAlphHoOhChamber_MapScriptHeader), RuinsofAlphHoOhChamber_MapScriptHeader
	dw RuinsofAlphHoOhChamber_MapEventHeader

	db 0 ; connections
; 0x958d0

RuinsofAlphKabutoChamber_SecondMapHeader:: ; 0x958d0
	db $0 ; border block
	db RUINS_OF_ALPH_KABUTO_CHAMBER_HEIGHT, RUINS_OF_ALPH_KABUTO_CHAMBER_WIDTH
	dbw BANK(RuinsofAlphHoOhChamber_BlockData), RuinsofAlphHoOhChamber_BlockData
	dbw BANK(RuinsofAlphKabutoChamber_MapScriptHeader), RuinsofAlphKabutoChamber_MapScriptHeader
	dw RuinsofAlphKabutoChamber_MapEventHeader

	db 0 ; connections
; 0x958dc

RuinsofAlphOmanyteChamber_SecondMapHeader: ; 0x958dc
	db $0 ; border block
	db RUINS_OF_ALPH_OMANYTE_CHAMBER_HEIGHT, RUINS_OF_ALPH_OMANYTE_CHAMBER_WIDTH
	dbw BANK(RuinsofAlphHoOhChamber_BlockData), RuinsofAlphHoOhChamber_BlockData
	dbw BANK(RuinsofAlphOmanyteChamber_MapScriptHeader), RuinsofAlphOmanyteChamber_MapScriptHeader
	dw RuinsofAlphOmanyteChamber_MapEventHeader

	db 0 ; connections
; 0x958e8

RuinsofAlphAerodactylChamber_SecondMapHeader:: ; 0x958e8
	db $0 ; border block
	db RUINS_OF_ALPH_AERODACTYL_CHAMBER_HEIGHT, RUINS_OF_ALPH_AERODACTYL_CHAMBER_WIDTH
	dbw BANK(RuinsofAlphHoOhChamber_BlockData), RuinsofAlphHoOhChamber_BlockData
	dbw BANK(RuinsofAlphAerodactylChamber_MapScriptHeader), RuinsofAlphAerodactylChamber_MapScriptHeader
	dw RuinsofAlphAerodactylChamber_MapEventHeader

	db 0 ; connections
; 0x958f4

RuinsofAlphInnerChamber_SecondMapHeader: ; 0x958f4
	db $0 ; border block
	db RUINS_OF_ALPH_INNER_CHAMBER_HEIGHT, RUINS_OF_ALPH_INNER_CHAMBER_WIDTH
	dbw BANK(RuinsofAlphInnerChamber_BlockData), RuinsofAlphInnerChamber_BlockData
	dbw BANK(RuinsofAlphInnerChamber_MapScriptHeader), RuinsofAlphInnerChamber_MapScriptHeader
	dw RuinsofAlphInnerChamber_MapEventHeader

	db 0 ; connections
; 0x95900

RuinsofAlphResearchCenter_SecondMapHeader: ; 0x95900
	db $0 ; border block
	db RUINS_OF_ALPH_RESEARCH_CENTER_HEIGHT, RUINS_OF_ALPH_RESEARCH_CENTER_WIDTH
	dbw BANK(RuinsofAlphResearchCenter_BlockData), RuinsofAlphResearchCenter_BlockData
	dbw BANK(RuinsofAlphResearchCenter_MapScriptHeader), RuinsofAlphResearchCenter_MapScriptHeader
	dw RuinsofAlphResearchCenter_MapEventHeader

	db 0 ; connections
; 0x9590c

RuinsofAlphHoOhItemRoom_SecondMapHeader: ; 0x9590c
	db $0 ; border block
	db RUINS_OF_ALPH_HO_OH_ITEM_ROOM_HEIGHT, RUINS_OF_ALPH_HO_OH_ITEM_ROOM_WIDTH
	dbw BANK(RuinsofAlphHoOhItemRoom_BlockData), RuinsofAlphHoOhItemRoom_BlockData
	dbw BANK(RuinsofAlphHoOhItemRoom_MapScriptHeader), RuinsofAlphHoOhItemRoom_MapScriptHeader
	dw RuinsofAlphHoOhItemRoom_MapEventHeader

	db 0 ; connections
; 0x95918

RuinsofAlphKabutoItemRoom_SecondMapHeader: ; 0x95918
	db $0 ; border block
	db RUINS_OF_ALPH_KABUTO_ITEM_ROOM_HEIGHT, RUINS_OF_ALPH_KABUTO_ITEM_ROOM_WIDTH
	dbw BANK(RuinsofAlphHoOhItemRoom_BlockData), RuinsofAlphHoOhItemRoom_BlockData
	dbw BANK(RuinsofAlphKabutoItemRoom_MapScriptHeader), RuinsofAlphKabutoItemRoom_MapScriptHeader
	dw RuinsofAlphKabutoItemRoom_MapEventHeader

	db 0 ; connections
; 0x95924

RuinsofAlphOmanyteItemRoom_SecondMapHeader: ; 0x95924
	db $0 ; border block
	db RUINS_OF_ALPH_OMANYTE_ITEM_ROOM_HEIGHT, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM_WIDTH
	dbw BANK(RuinsofAlphHoOhItemRoom_BlockData), RuinsofAlphHoOhItemRoom_BlockData
	dbw BANK(RuinsofAlphOmanyteItemRoom_MapScriptHeader), RuinsofAlphOmanyteItemRoom_MapScriptHeader
	dw RuinsofAlphOmanyteItemRoom_MapEventHeader

	db 0 ; connections
; 0x95930

RuinsofAlphAerodactylItemRoom_SecondMapHeader: ; 0x95930
	db $0 ; border block
	db RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM_HEIGHT, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM_WIDTH
	dbw BANK(RuinsofAlphHoOhItemRoom_BlockData), RuinsofAlphHoOhItemRoom_BlockData
	dbw BANK(RuinsofAlphAerodactylItemRoom_MapScriptHeader), RuinsofAlphAerodactylItemRoom_MapScriptHeader
	dw RuinsofAlphAerodactylItemRoom_MapEventHeader

	db 0 ; connections
; 0x9593c

RuinsofAlphHoOhWordRoom_SecondMapHeader: ; 0x9593c
	db $0 ; border block
	db RUINS_OF_ALPH_HO_OH_WORD_ROOM_HEIGHT, RUINS_OF_ALPH_HO_OH_WORD_ROOM_WIDTH
	dbw BANK(RuinsofAlphHoOhWordRoom_BlockData), RuinsofAlphHoOhWordRoom_BlockData
	dbw BANK(RuinsofAlphHoOhWordRoom_MapScriptHeader), RuinsofAlphHoOhWordRoom_MapScriptHeader
	dw RuinsofAlphHoOhWordRoom_MapEventHeader

	db 0 ; connections
; 0x95948

RuinsofAlphKabutoWordRoom_SecondMapHeader: ; 0x95948
	db $0 ; border block
	db RUINS_OF_ALPH_KABUTO_WORD_ROOM_HEIGHT, RUINS_OF_ALPH_KABUTO_WORD_ROOM_WIDTH
	dbw BANK(RuinsofAlphKabutoWordRoom_BlockData), RuinsofAlphKabutoWordRoom_BlockData
	dbw BANK(RuinsofAlphKabutoWordRoom_MapScriptHeader), RuinsofAlphKabutoWordRoom_MapScriptHeader
	dw RuinsofAlphKabutoWordRoom_MapEventHeader

	db 0 ; connections
; 0x95954

RuinsofAlphOmanyteWordRoom_SecondMapHeader: ; 0x95954
	db $0 ; border block
	db RUINS_OF_ALPH_OMANYTE_WORD_ROOM_HEIGHT, RUINS_OF_ALPH_OMANYTE_WORD_ROOM_WIDTH
	dbw BANK(RuinsofAlphOmanyteWordRoom_BlockData), RuinsofAlphOmanyteWordRoom_BlockData
	dbw BANK(RuinsofAlphOmanyteWordRoom_MapScriptHeader), RuinsofAlphOmanyteWordRoom_MapScriptHeader
	dw RuinsofAlphOmanyteWordRoom_MapEventHeader

	db 0 ; connections
; 0x95960

RuinsofAlphAerodactylWordRoom_SecondMapHeader: ; 0x95960
	db $0 ; border block
	db RUINS_OF_ALPH_AERODACTYL_WORD_ROOM_HEIGHT, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM_WIDTH
	dbw BANK(RuinsofAlphAerodactylWordRoom_BlockData), RuinsofAlphAerodactylWordRoom_BlockData
	dbw BANK(RuinsofAlphAerodactylWordRoom_MapScriptHeader), RuinsofAlphAerodactylWordRoom_MapScriptHeader
	dw RuinsofAlphAerodactylWordRoom_MapEventHeader

	db 0 ; connections
; 0x9596c

UnionCave1F_SecondMapHeader: ; 0x9596c
	db $9 ; border block
	db UNION_CAVE_1F_HEIGHT, UNION_CAVE_1F_WIDTH
	dbw BANK(UnionCave1F_BlockData), UnionCave1F_BlockData
	dbw BANK(UnionCave1F_MapScriptHeader), UnionCave1F_MapScriptHeader
	dw UnionCave1F_MapEventHeader

	db 0 ; connections
; 0x95978

UnionCaveB1F_SecondMapHeader: ; 0x95978
	db $9 ; border block
	db UNION_CAVE_B1F_HEIGHT, UNION_CAVE_B1F_WIDTH
	dbw BANK(UnionCaveB1F_BlockData), UnionCaveB1F_BlockData
	dbw BANK(UnionCaveB1F_MapScriptHeader), UnionCaveB1F_MapScriptHeader
	dw UnionCaveB1F_MapEventHeader

	db 0 ; connections
; 0x95984

UnionCaveB2F_SecondMapHeader: ; 0x95984
	db $9 ; border block
	db UNION_CAVE_B2F_HEIGHT, UNION_CAVE_B2F_WIDTH
	dbw BANK(UnionCaveB2F_BlockData), UnionCaveB2F_BlockData
	dbw BANK(UnionCaveB2F_MapScriptHeader), UnionCaveB2F_MapScriptHeader
	dw UnionCaveB2F_MapEventHeader

	db 0 ; connections
; 0x95990

SlowpokeWellB1F_SecondMapHeader: ; 0x95990
	db $9 ; border block
	db SLOWPOKE_WELL_B1F_HEIGHT, SLOWPOKE_WELL_B1F_WIDTH
	dbw BANK(SlowpokeWellB1F_BlockData), SlowpokeWellB1F_BlockData
	dbw BANK(SlowpokeWellB1F_MapScriptHeader), SlowpokeWellB1F_MapScriptHeader
	dw SlowpokeWellB1F_MapEventHeader

	db 0 ; connections
; 0x9599c

SlowpokeWellB2F_SecondMapHeader: ; 0x9599c
	db $9 ; border block
	db SLOWPOKE_WELL_B2F_HEIGHT, SLOWPOKE_WELL_B2F_WIDTH
	dbw BANK(SlowpokeWellB2F_BlockData), SlowpokeWellB2F_BlockData
	dbw BANK(SlowpokeWellB2F_MapScriptHeader), SlowpokeWellB2F_MapScriptHeader
	dw SlowpokeWellB2F_MapEventHeader

	db 0 ; connections
; 0x959a8

OlivineLighthouse1F_SecondMapHeader: ; 0x959a8
	db $0 ; border block
	db OLIVINE_LIGHTHOUSE_1F_HEIGHT, OLIVINE_LIGHTHOUSE_1F_WIDTH
	dbw BANK(OlivineLighthouse1F_BlockData), OlivineLighthouse1F_BlockData
	dbw BANK(OlivineLighthouse1F_MapScriptHeader), OlivineLighthouse1F_MapScriptHeader
	dw OlivineLighthouse1F_MapEventHeader

	db 0 ; connections
; 0x959b4

OlivineLighthouse2F_SecondMapHeader: ; 0x959b4
	db $0 ; border block
	db OLIVINE_LIGHTHOUSE_2F_HEIGHT, OLIVINE_LIGHTHOUSE_2F_WIDTH
	dbw BANK(OlivineLighthouse2F_BlockData), OlivineLighthouse2F_BlockData
	dbw BANK(OlivineLighthouse2F_MapScriptHeader), OlivineLighthouse2F_MapScriptHeader
	dw OlivineLighthouse2F_MapEventHeader

	db 0 ; connections
; 0x959c0

OlivineLighthouse3F_SecondMapHeader: ; 0x959c0
	db $0 ; border block
	db OLIVINE_LIGHTHOUSE_3F_HEIGHT, OLIVINE_LIGHTHOUSE_3F_WIDTH
	dbw BANK(OlivineLighthouse3F_BlockData), OlivineLighthouse3F_BlockData
	dbw BANK(OlivineLighthouse3F_MapScriptHeader), OlivineLighthouse3F_MapScriptHeader
	dw OlivineLighthouse3F_MapEventHeader

	db 0 ; connections
; 0x959cc

OlivineLighthouse4F_SecondMapHeader: ; 0x959cc
	db $0 ; border block
	db OLIVINE_LIGHTHOUSE_4F_HEIGHT, OLIVINE_LIGHTHOUSE_4F_WIDTH
	dbw BANK(OlivineLighthouse4F_BlockData), OlivineLighthouse4F_BlockData
	dbw BANK(OlivineLighthouse4F_MapScriptHeader), OlivineLighthouse4F_MapScriptHeader
	dw OlivineLighthouse4F_MapEventHeader

	db 0 ; connections
; 0x959d8

OlivineLighthouse5F_SecondMapHeader: ; 0x959d8
	db $0 ; border block
	db OLIVINE_LIGHTHOUSE_5F_HEIGHT, OLIVINE_LIGHTHOUSE_5F_WIDTH
	dbw BANK(OlivineLighthouse5F_BlockData), OlivineLighthouse5F_BlockData
	dbw BANK(OlivineLighthouse5F_MapScriptHeader), OlivineLighthouse5F_MapScriptHeader
	dw OlivineLighthouse5F_MapEventHeader

	db 0 ; connections
; 0x959e4

OlivineLighthouse6F_SecondMapHeader: ; 0x959e4
	db $0 ; border block
	db OLIVINE_LIGHTHOUSE_6F_HEIGHT, OLIVINE_LIGHTHOUSE_6F_WIDTH
	dbw BANK(OlivineLighthouse6F_BlockData), OlivineLighthouse6F_BlockData
	dbw BANK(OlivineLighthouse6F_MapScriptHeader), OlivineLighthouse6F_MapScriptHeader
	dw OlivineLighthouse6F_MapEventHeader

	db 0 ; connections
; 0x959f0

MahoganyMart1F_SecondMapHeader: ; 0x959f0
	db $0 ; border block
	db MAHOGANY_MART_1F_HEIGHT, MAHOGANY_MART_1F_WIDTH
	dbw BANK(MahoganyMart1F_BlockData), MahoganyMart1F_BlockData
	dbw BANK(MahoganyMart1F_MapScriptHeader), MahoganyMart1F_MapScriptHeader
	dw MahoganyMart1F_MapEventHeader

	db 0 ; connections
; 0x959fc

TeamRocketBaseB1F_SecondMapHeader: ; 0x959fc
	db $0 ; border block
	db TEAM_ROCKET_BASE_B1F_HEIGHT, TEAM_ROCKET_BASE_B1F_WIDTH
	dbw BANK(TeamRocketBaseB1F_BlockData), TeamRocketBaseB1F_BlockData
	dbw BANK(TeamRocketBaseB1F_MapScriptHeader), TeamRocketBaseB1F_MapScriptHeader
	dw TeamRocketBaseB1F_MapEventHeader

	db 0 ; connections
; 0x95a08

TeamRocketBaseB2F_SecondMapHeader: ; 0x95a08
	db $0 ; border block
	db TEAM_ROCKET_BASE_B2F_HEIGHT, TEAM_ROCKET_BASE_B2F_WIDTH
	dbw BANK(TeamRocketBaseB2F_BlockData), TeamRocketBaseB2F_BlockData
	dbw BANK(TeamRocketBaseB2F_MapScriptHeader), TeamRocketBaseB2F_MapScriptHeader
	dw TeamRocketBaseB2F_MapEventHeader

	db 0 ; connections
; 0x95a14

TeamRocketBaseB3F_SecondMapHeader: ; 0x95a14
	db $0 ; border block
	db TEAM_ROCKET_BASE_B3F_HEIGHT, TEAM_ROCKET_BASE_B3F_WIDTH
	dbw BANK(TeamRocketBaseB3F_BlockData), TeamRocketBaseB3F_BlockData
	dbw BANK(TeamRocketBaseB3F_MapScriptHeader), TeamRocketBaseB3F_MapScriptHeader
	dw TeamRocketBaseB3F_MapEventHeader

	db 0 ; connections
; 0x95a20

IlexForest_SecondMapHeader: ; 0x95a20
	db $5 ; border block
	db ILEX_FOREST_HEIGHT, ILEX_FOREST_WIDTH
	dbw BANK(IlexForest_BlockData), IlexForest_BlockData
	dbw BANK(IlexForest_MapScriptHeader), IlexForest_MapScriptHeader
	dw IlexForest_MapEventHeader

	db 0 ; connections
; 0x95a2c

WarehouseEntrance_SecondMapHeader: ; 0x95a2c
	db $0 ; border block
	db WAREHOUSE_ENTRANCE_HEIGHT, WAREHOUSE_ENTRANCE_WIDTH
	dbw BANK(WarehouseEntrance_BlockData), WarehouseEntrance_BlockData
	dbw BANK(WarehouseEntrance_MapScriptHeader), WarehouseEntrance_MapScriptHeader
	dw WarehouseEntrance_MapEventHeader

	db 0 ; connections
; 0x95a38

UndergroundPathSwitchRoomEntrances_SecondMapHeader: ; 0x95a38
	db $0 ; border block
	db UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_HEIGHT, UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_WIDTH
	dbw BANK(UndergroundPathSwitchRoomEntrances_BlockData), UndergroundPathSwitchRoomEntrances_BlockData
	dbw BANK(UndergroundPathSwitchRoomEntrances_MapScriptHeader), UndergroundPathSwitchRoomEntrances_MapScriptHeader
	dw UndergroundPathSwitchRoomEntrances_MapEventHeader

	db 0 ; connections
; 0x95a44

GoldenrodDeptStoreB1F_SecondMapHeader: ; 0x95a44
	db $0 ; border block
	db GOLDENROD_DEPT_STORE_B1F_HEIGHT, GOLDENROD_DEPT_STORE_B1F_WIDTH
	dbw BANK(GoldenrodDeptStoreB1F_BlockData), GoldenrodDeptStoreB1F_BlockData
	dbw BANK(GoldenrodDeptStoreB1F_MapScriptHeader), GoldenrodDeptStoreB1F_MapScriptHeader
	dw GoldenrodDeptStoreB1F_MapEventHeader

	db 0 ; connections
; 0x95a50

UndergroundWarehouse_SecondMapHeader: ; 0x95a50
	db $0 ; border block
	db UNDERGROUND_WAREHOUSE_HEIGHT, UNDERGROUND_WAREHOUSE_WIDTH
	dbw BANK(UndergroundWarehouse_BlockData), UndergroundWarehouse_BlockData
	dbw BANK(UndergroundWarehouse_MapScriptHeader), UndergroundWarehouse_MapScriptHeader
	dw UndergroundWarehouse_MapEventHeader

	db 0 ; connections
; 0x95a5c

MountMortar1FOutside_SecondMapHeader: ; 0x95a5c
	db $9 ; border block
	db MOUNT_MORTAR_1F_OUTSIDE_HEIGHT, MOUNT_MORTAR_1F_OUTSIDE_WIDTH
	dbw BANK(MountMortar1FOutside_BlockData), MountMortar1FOutside_BlockData
	dbw BANK(MountMortar1FOutside_MapScriptHeader), MountMortar1FOutside_MapScriptHeader
	dw MountMortar1FOutside_MapEventHeader

	db 0 ; connections
; 0x95a68

MountMortar1FInside_SecondMapHeader: ; 0x95a68
	db $9 ; border block
	db MOUNT_MORTAR_1F_INSIDE_HEIGHT, MOUNT_MORTAR_1F_INSIDE_WIDTH
	dbw BANK(MountMortar1FInside_BlockData), MountMortar1FInside_BlockData
	dbw BANK(MountMortar1FInside_MapScriptHeader), MountMortar1FInside_MapScriptHeader
	dw MountMortar1FInside_MapEventHeader

	db 0 ; connections
; 0x95a74

MountMortar2FInside_SecondMapHeader: ; 0x95a74
	db $9 ; border block
	db MOUNT_MORTAR_2F_INSIDE_HEIGHT, MOUNT_MORTAR_2F_INSIDE_WIDTH
	dbw BANK(MountMortar2FInside_BlockData), MountMortar2FInside_BlockData
	dbw BANK(MountMortar2FInside_MapScriptHeader), MountMortar2FInside_MapScriptHeader
	dw MountMortar2FInside_MapEventHeader

	db 0 ; connections
; 0x95a80

MountMortarB1F_SecondMapHeader: ; 0x95a80
	db $9 ; border block
	db MOUNT_MORTAR_B1F_HEIGHT, MOUNT_MORTAR_B1F_WIDTH
	dbw BANK(MountMortarB1F_BlockData), MountMortarB1F_BlockData
	dbw BANK(MountMortarB1F_MapScriptHeader), MountMortarB1F_MapScriptHeader
	dw MountMortarB1F_MapEventHeader

	db 0 ; connections
; 0x95a8c

IcePath1F_SecondMapHeader: ; 0x95a8c
	db $9 ; border block
	db ICE_PATH_1F_HEIGHT, ICE_PATH_1F_WIDTH
	dbw BANK(IcePath1F_BlockData), IcePath1F_BlockData
	dbw BANK(IcePath1F_MapScriptHeader), IcePath1F_MapScriptHeader
	dw IcePath1F_MapEventHeader

	db 0 ; connections
; 0x95a98

IcePathB1F_SecondMapHeader: ; 0x95a98
	db $19 ; border block
	db ICE_PATH_B1F_HEIGHT, ICE_PATH_B1F_WIDTH
	dbw BANK(IcePathB1F_BlockData), IcePathB1F_BlockData
	dbw BANK(IcePathB1F_MapScriptHeader), IcePathB1F_MapScriptHeader
	dw IcePathB1F_MapEventHeader

	db 0 ; connections
; 0x95aa4

IcePathB2FMahoganySide_SecondMapHeader: ; 0x95aa4
	db $19 ; border block
	db ICE_PATH_B2F_MAHOGANY_SIDE_HEIGHT, ICE_PATH_B2F_MAHOGANY_SIDE_WIDTH
	dbw BANK(IcePathB2FMahoganySide_BlockData), IcePathB2FMahoganySide_BlockData
	dbw BANK(IcePathB2FMahoganySide_MapScriptHeader), IcePathB2FMahoganySide_MapScriptHeader
	dw IcePathB2FMahoganySide_MapEventHeader

	db 0 ; connections
; 0x95ab0

IcePathB2FBlackthornSide_SecondMapHeader: ; 0x95ab0
	db $19 ; border block
	db ICE_PATH_B2F_BLACKTHORN_SIDE_HEIGHT, ICE_PATH_B2F_BLACKTHORN_SIDE_WIDTH
	dbw BANK(IcePathB2FBlackthornSide_BlockData), IcePathB2FBlackthornSide_BlockData
	dbw BANK(IcePathB2FBlackthornSide_MapScriptHeader), IcePathB2FBlackthornSide_MapScriptHeader
	dw IcePathB2FBlackthornSide_MapEventHeader

	db 0 ; connections
; 0x95abc

IcePathB3F_SecondMapHeader: ; 0x95abc
	db $19 ; border block
	db ICE_PATH_B3F_HEIGHT, ICE_PATH_B3F_WIDTH
	dbw BANK(IcePathB3F_BlockData), IcePathB3F_BlockData
	dbw BANK(IcePathB3F_MapScriptHeader), IcePathB3F_MapScriptHeader
	dw IcePathB3F_MapEventHeader

	db 0 ; connections
; 0x95ac8

WhirlIslandNW_SecondMapHeader: ; 0x95ac8
	db $9 ; border block
	db WHIRL_ISLAND_NW_HEIGHT, WHIRL_ISLAND_NW_WIDTH
	dbw BANK(WhirlIslandNW_BlockData), WhirlIslandNW_BlockData
	dbw BANK(WhirlIslandNW_MapScriptHeader), WhirlIslandNW_MapScriptHeader
	dw WhirlIslandNW_MapEventHeader

	db 0 ; connections
; 0x95ad4

WhirlIslandNE_SecondMapHeader: ; 0x95ad4
	db $9 ; border block
	db WHIRL_ISLAND_NE_HEIGHT, WHIRL_ISLAND_NE_WIDTH
	dbw BANK(WhirlIslandNE_BlockData), WhirlIslandNE_BlockData
	dbw BANK(WhirlIslandNE_MapScriptHeader), WhirlIslandNE_MapScriptHeader
	dw WhirlIslandNE_MapEventHeader

	db 0 ; connections
; 0x95ae0

WhirlIslandSW_SecondMapHeader: ; 0x95ae0
	db $9 ; border block
	db WHIRL_ISLAND_SW_HEIGHT, WHIRL_ISLAND_SW_WIDTH
	dbw BANK(WhirlIslandSW_BlockData), WhirlIslandSW_BlockData
	dbw BANK(WhirlIslandSW_MapScriptHeader), WhirlIslandSW_MapScriptHeader
	dw WhirlIslandSW_MapEventHeader

	db 0 ; connections
; 0x95aec

WhirlIslandCave_SecondMapHeader: ; 0x95aec
	db $9 ; border block
	db WHIRL_ISLAND_CAVE_HEIGHT, WHIRL_ISLAND_CAVE_WIDTH
	dbw BANK(WhirlIslandCave_BlockData), WhirlIslandCave_BlockData
	dbw BANK(WhirlIslandCave_MapScriptHeader), WhirlIslandCave_MapScriptHeader
	dw WhirlIslandCave_MapEventHeader

	db 0 ; connections
; 0x95af8

WhirlIslandSE_SecondMapHeader: ; 0x95af8
	db $f ; border block
	db WHIRL_ISLAND_SE_HEIGHT, WHIRL_ISLAND_SE_WIDTH
	dbw BANK(WhirlIslandSE_BlockData), WhirlIslandSE_BlockData
	dbw BANK(WhirlIslandSE_MapScriptHeader), WhirlIslandSE_MapScriptHeader
	dw WhirlIslandSE_MapEventHeader

	db 0 ; connections
; 0x95b04

WhirlIslandB1F_SecondMapHeader: ; 0x95b04
	db $9 ; border block
	db WHIRL_ISLAND_B1F_HEIGHT, WHIRL_ISLAND_B1F_WIDTH
	dbw BANK(WhirlIslandB1F_BlockData), WhirlIslandB1F_BlockData
	dbw BANK(WhirlIslandB1F_MapScriptHeader), WhirlIslandB1F_MapScriptHeader
	dw WhirlIslandB1F_MapEventHeader

	db 0 ; connections
; 0x95b10

WhirlIslandB2F_SecondMapHeader: ; 0x95b10
	db $2e ; border block
	db WHIRL_ISLAND_B2F_HEIGHT, WHIRL_ISLAND_B2F_WIDTH
	dbw BANK(WhirlIslandB2F_BlockData), WhirlIslandB2F_BlockData
	dbw BANK(WhirlIslandB2F_MapScriptHeader), WhirlIslandB2F_MapScriptHeader
	dw WhirlIslandB2F_MapEventHeader

	db 0 ; connections
; 0x95b1c

WhirlIslandLugiaChamber_SecondMapHeader: ; 0x95b1c
	db $f ; border block
	db WHIRL_ISLAND_LUGIA_CHAMBER_HEIGHT, WHIRL_ISLAND_LUGIA_CHAMBER_WIDTH
	dbw BANK(WhirlIslandLugiaChamber_BlockData), WhirlIslandLugiaChamber_BlockData
	dbw BANK(WhirlIslandLugiaChamber_MapScriptHeader), WhirlIslandLugiaChamber_MapScriptHeader
	dw WhirlIslandLugiaChamber_MapEventHeader

	db 0 ; connections
; 0x95b28

SilverCaveRoom1_SecondMapHeader: ; 0x95b28
	db $9 ; border block
	db SILVER_CAVE_ROOM_1_HEIGHT, SILVER_CAVE_ROOM_1_WIDTH
	dbw BANK(SilverCaveRoom1_BlockData), SilverCaveRoom1_BlockData
	dbw BANK(SilverCaveRoom1_MapScriptHeader), SilverCaveRoom1_MapScriptHeader
	dw SilverCaveRoom1_MapEventHeader

	db 0 ; connections
; 0x95b34

SilverCaveRoom2_SecondMapHeader: ; 0x95b34
	db $9 ; border block
	db SILVER_CAVE_ROOM_2_HEIGHT, SILVER_CAVE_ROOM_2_WIDTH
	dbw BANK(SilverCaveRoom2_BlockData), SilverCaveRoom2_BlockData
	dbw BANK(SilverCaveRoom2_MapScriptHeader), SilverCaveRoom2_MapScriptHeader
	dw SilverCaveRoom2_MapEventHeader

	db 0 ; connections
; 0x95b40

SilverCaveRoom3_SecondMapHeader: ; 0x95b40
	db $9 ; border block
	db SILVER_CAVE_ROOM_3_HEIGHT, SILVER_CAVE_ROOM_3_WIDTH
	dbw BANK(SilverCaveRoom3_BlockData), SilverCaveRoom3_BlockData
	dbw BANK(SilverCaveRoom3_MapScriptHeader), SilverCaveRoom3_MapScriptHeader
	dw SilverCaveRoom3_MapEventHeader

	db 0 ; connections
; 0x95b4c

SilverCaveItemRooms_SecondMapHeader: ; 0x95b4c
	db $9 ; border block
	db SILVER_CAVE_ITEM_ROOMS_HEIGHT, SILVER_CAVE_ITEM_ROOMS_WIDTH
	dbw BANK(SilverCaveItemRooms_BlockData), SilverCaveItemRooms_BlockData
	dbw BANK(SilverCaveItemRooms_MapScriptHeader), SilverCaveItemRooms_MapScriptHeader
	dw SilverCaveItemRooms_MapEventHeader

	db 0 ; connections
; 0x95b58

DarkCaveVioletEntrance_SecondMapHeader: ; 0x95b58
	db $9 ; border block
	db DARK_CAVE_VIOLET_ENTRANCE_HEIGHT, DARK_CAVE_VIOLET_ENTRANCE_WIDTH
	dbw BANK(DarkCaveVioletEntrance_BlockData), DarkCaveVioletEntrance_BlockData
	dbw BANK(DarkCaveVioletEntrance_MapScriptHeader), DarkCaveVioletEntrance_MapScriptHeader
	dw DarkCaveVioletEntrance_MapEventHeader

	db 0 ; connections
; 0x95b64

DarkCaveBlackthornEntrance_SecondMapHeader: ; 0x95b64
	db $9 ; border block
	db DARK_CAVE_BLACKTHORN_ENTRANCE_HEIGHT, DARK_CAVE_BLACKTHORN_ENTRANCE_WIDTH
	dbw BANK(DarkCaveBlackthornEntrance_BlockData), DarkCaveBlackthornEntrance_BlockData
	dbw BANK(DarkCaveBlackthornEntrance_MapScriptHeader), DarkCaveBlackthornEntrance_MapScriptHeader
	dw DarkCaveBlackthornEntrance_MapEventHeader

	db 0 ; connections
; 0x95b70

DragonsDen1F_SecondMapHeader: ; 0x95b70
	db $9 ; border block
	db DRAGONS_DEN_1F_HEIGHT, DRAGONS_DEN_1F_WIDTH
	dbw BANK(DragonsDen1F_BlockData), DragonsDen1F_BlockData
	dbw BANK(DragonsDen1F_MapScriptHeader), DragonsDen1F_MapScriptHeader
	dw DragonsDen1F_MapEventHeader

	db 0 ; connections
; 0x95b7c

DragonsDenB1F_SecondMapHeader: ; 0x95b7c
	db $71 ; border block
	db DRAGONS_DEN_B1F_HEIGHT, DRAGONS_DEN_B1F_WIDTH
	dbw BANK(DragonsDenB1F_BlockData), DragonsDenB1F_BlockData
	dbw BANK(DragonsDenB1F_MapScriptHeader), DragonsDenB1F_MapScriptHeader
	dw DragonsDenB1F_MapEventHeader

	db 0 ; connections
; 0x95b88

DragonShrine_SecondMapHeader: ; 0x95b88
	db $0 ; border block
	db DRAGON_SHRINE_HEIGHT, DRAGON_SHRINE_WIDTH
	dbw BANK(DragonShrine_BlockData), DragonShrine_BlockData
	dbw BANK(DragonShrine_MapScriptHeader), DragonShrine_MapScriptHeader
	dw DragonShrine_MapEventHeader

	db 0 ; connections
; 0x95b94

TohjoFalls_SecondMapHeader: ; 0x95b94
	db $9 ; border block
	db TOHJO_FALLS_HEIGHT, TOHJO_FALLS_WIDTH
	dbw BANK(TohjoFalls_BlockData), TohjoFalls_BlockData
	dbw BANK(TohjoFalls_MapScriptHeader), TohjoFalls_MapScriptHeader
	dw TohjoFalls_MapEventHeader

	db 0 ; connections
; 0x95ba0

OlivinePokeCenter1F_SecondMapHeader: ; 0x95ba0
	db $0 ; border block
	db OLIVINE_POKECENTER_1F_HEIGHT, OLIVINE_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(OlivinePokeCenter1F_MapScriptHeader), OlivinePokeCenter1F_MapScriptHeader
	dw OlivinePokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95bac

OlivineGym_SecondMapHeader: ; 0x95bac
	db $0 ; border block
	db OLIVINE_GYM_HEIGHT, OLIVINE_GYM_WIDTH
	dbw BANK(OlivineGym_BlockData), OlivineGym_BlockData
	dbw BANK(OlivineGym_MapScriptHeader), OlivineGym_MapScriptHeader
	dw OlivineGym_MapEventHeader

	db 0 ; connections
; 0x95bb8

OlivineVoltorbHouse_SecondMapHeader: ; 0x95bb8
	db $0 ; border block
	db OLIVINE_VOLTORB_HOUSE_HEIGHT, OLIVINE_VOLTORB_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(OlivineVoltorbHouse_MapScriptHeader), OlivineVoltorbHouse_MapScriptHeader
	dw OlivineVoltorbHouse_MapEventHeader

	db 0 ; connections
; 0x95bc4

OlivineHouseBeta_SecondMapHeader: ; 0x95bc4
	db $0 ; border block
	db OLIVINE_HOUSE_BETA_HEIGHT, OLIVINE_HOUSE_BETA_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(OlivineHouseBeta_MapScriptHeader), OlivineHouseBeta_MapScriptHeader
	dw OlivineHouseBeta_MapEventHeader

	db 0 ; connections
; 0x95bd0

OlivinePunishmentSpeechHouse_SecondMapHeader: ; 0x95bd0
	db $0 ; border block
	db OLIVINE_PUNISHMENT_SPEECH_HOUSE_HEIGHT, OLIVINE_PUNISHMENT_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(OlivinePunishmentSpeechHouse_MapScriptHeader), OlivinePunishmentSpeechHouse_MapScriptHeader
	dw OlivinePunishmentSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x95bdc

OlivineGoodRodHouse_SecondMapHeader: ; 0x95bdc
	db $0 ; border block
	db OLIVINE_GOOD_ROD_HOUSE_HEIGHT, OLIVINE_GOOD_ROD_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(OlivineGoodRodHouse_MapScriptHeader), OlivineGoodRodHouse_MapScriptHeader
	dw OlivineGoodRodHouse_MapEventHeader

	db 0 ; connections
; 0x95be8

OlivineCafe_SecondMapHeader: ; 0x95be8
	db $0 ; border block
	db OLIVINE_CAFE_HEIGHT, OLIVINE_CAFE_WIDTH
	dbw BANK(OlivineCafe_BlockData), OlivineCafe_BlockData
	dbw BANK(OlivineCafe_MapScriptHeader), OlivineCafe_MapScriptHeader
	dw OlivineCafe_MapEventHeader

	db 0 ; connections
; 0x95bf4

OlivineMart_SecondMapHeader: ; 0x95bf4
	db $0 ; border block
	db OLIVINE_MART_HEIGHT, OLIVINE_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(OlivineMart_MapScriptHeader), OlivineMart_MapScriptHeader
	dw OlivineMart_MapEventHeader

	db 0 ; connections
; 0x95c00

Route38EcruteakGate_SecondMapHeader: ; 0x95c00
	db $0 ; border block
	db ROUTE_38_ECRUTEAK_GATE_HEIGHT, ROUTE_38_ECRUTEAK_GATE_WIDTH
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData
	dbw BANK(Route38EcruteakGate_MapScriptHeader), Route38EcruteakGate_MapScriptHeader
	dw Route38EcruteakGate_MapEventHeader

	db 0 ; connections
; 0x95c0c

Route39Barn_SecondMapHeader: ; 0x95c0c
	db $0 ; border block
	db ROUTE_39_BARN_HEIGHT, ROUTE_39_BARN_WIDTH
	dbw BANK(Route39Barn_BlockData), Route39Barn_BlockData
	dbw BANK(Route39Barn_MapScriptHeader), Route39Barn_MapScriptHeader
	dw Route39Barn_MapEventHeader

	db 0 ; connections
; 0x95c18

Route39Farmhouse_SecondMapHeader: ; 0x95c18
	db $0 ; border block
	db ROUTE_39_FARMHOUSE_HEIGHT, ROUTE_39_FARMHOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(Route39Farmhouse_MapScriptHeader), Route39Farmhouse_MapScriptHeader
	dw Route39Farmhouse_MapEventHeader

	db 0 ; connections
; 0x95c24

MahoganyRedGyaradosSpeechHouse_SecondMapHeader: ; 0x95c24
	db $0 ; border block
	db MAHOGANY_RED_GYARADOS_SPEECH_HOUSE_HEIGHT, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(MahoganyRedGyaradosSpeechHouse_MapScriptHeader), MahoganyRedGyaradosSpeechHouse_MapScriptHeader
	dw MahoganyRedGyaradosSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x95c30

MahoganyGym_SecondMapHeader: ; 0x95c30
	db $0 ; border block
	db MAHOGANY_GYM_HEIGHT, MAHOGANY_GYM_WIDTH
	dbw BANK(MahoganyGym_BlockData), MahoganyGym_BlockData
	dbw BANK(MahoganyGym_MapScriptHeader), MahoganyGym_MapScriptHeader
	dw MahoganyGym_MapEventHeader

	db 0 ; connections
; 0x95c3c

MahoganyPokeCenter1F_SecondMapHeader: ; 0x95c3c
	db $0 ; border block
	db MAHOGANY_POKECENTER_1F_HEIGHT, MAHOGANY_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(MahoganyPokeCenter1F_MapScriptHeader), MahoganyPokeCenter1F_MapScriptHeader
	dw MahoganyPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95c48

Route42EcruteakGate_SecondMapHeader: ; 0x95c48
	db $0 ; border block
	db ROUTE_42_ECRUTEAK_GATE_HEIGHT, ROUTE_42_ECRUTEAK_GATE_WIDTH
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData
	dbw BANK(Route42EcruteakGate_MapScriptHeader), Route42EcruteakGate_MapScriptHeader
	dw Route42EcruteakGate_MapEventHeader

	db 0 ; connections
; 0x95c54

DiglettsCave_SecondMapHeader: ; 0x95c54
	db $9 ; border block
	db DIGLETTS_CAVE_HEIGHT, DIGLETTS_CAVE_WIDTH
	dbw BANK(DiglettsCave_BlockData), DiglettsCave_BlockData
	dbw BANK(DiglettsCave_MapScriptHeader), DiglettsCave_MapScriptHeader
	dw DiglettsCave_MapEventHeader

	db 0 ; connections
; 0x95c60

MountMoon_SecondMapHeader: ; 0x95c60
	db $9 ; border block
	db MOUNT_MOON_HEIGHT, MOUNT_MOON_WIDTH
	dbw BANK(MountMoon_BlockData), MountMoon_BlockData
	dbw BANK(MountMoon_MapScriptHeader), MountMoon_MapScriptHeader
	dw MountMoon_MapEventHeader

	db 0 ; connections
; 0x95c6c

Underground_SecondMapHeader: ; 0x95c6c
	db $0 ; border block
	db UNDERGROUND_HEIGHT, UNDERGROUND_WIDTH
	dbw BANK(Underground_BlockData), Underground_BlockData
	dbw BANK(Underground_MapScriptHeader), Underground_MapScriptHeader
	dw Underground_MapEventHeader

	db 0 ; connections
; 0x95c78

RockTunnel1F_SecondMapHeader: ; 0x95c78
	db $9 ; border block
	db ROCK_TUNNEL_1F_HEIGHT, ROCK_TUNNEL_1F_WIDTH
	dbw BANK(RockTunnel1F_BlockData), RockTunnel1F_BlockData
	dbw BANK(RockTunnel1F_MapScriptHeader), RockTunnel1F_MapScriptHeader
	dw RockTunnel1F_MapEventHeader

	db 0 ; connections
; 0x95c84

RockTunnelB1F_SecondMapHeader: ; 0x95c84
	db $9 ; border block
	db ROCK_TUNNEL_B1F_HEIGHT, ROCK_TUNNEL_B1F_WIDTH
	dbw BANK(RockTunnelB1F_BlockData), RockTunnelB1F_BlockData
	dbw BANK(RockTunnelB1F_MapScriptHeader), RockTunnelB1F_MapScriptHeader
	dw RockTunnelB1F_MapEventHeader

	db 0 ; connections
; 0x95c90

SafariZoneFuchsiaGateBeta_SecondMapHeader: ; 0x95c90
	db $0 ; border block
	db SAFARI_ZONE_FUCHSIA_GATE_BETA_HEIGHT, SAFARI_ZONE_FUCHSIA_GATE_BETA_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(SafariZoneFuchsiaGateBeta_MapScriptHeader), SafariZoneFuchsiaGateBeta_MapScriptHeader
	dw SafariZoneFuchsiaGateBeta_MapEventHeader

	db 0 ; connections
; 0x95c9c

SafariZoneBeta_SecondMapHeader: ; 0x95c9c
	db $13 ; border block
	db SAFARI_ZONE_BETA_HEIGHT, SAFARI_ZONE_BETA_WIDTH
	dbw BANK(SafariZoneBeta_BlockData), SafariZoneBeta_BlockData
	dbw BANK(SafariZoneBeta_MapScriptHeader), SafariZoneBeta_MapScriptHeader
	dw SafariZoneBeta_MapEventHeader

	db 0 ; connections
; 0x95ca8

VictoryRoad_SecondMapHeader: ; 0x95ca8
	db $1d ; border block
	db VICTORY_ROAD_HEIGHT, VICTORY_ROAD_WIDTH
	dbw BANK(VictoryRoad_BlockData), VictoryRoad_BlockData
	dbw BANK(VictoryRoad_MapScriptHeader), VictoryRoad_MapScriptHeader
	dw VictoryRoad_MapEventHeader

	db 0 ; connections
; 0x95cb4

EcruteakHouse_SecondMapHeader: ; 0x95cb4
	db $0 ; border block
	db ECRUTEAK_HOUSE_HEIGHT, ECRUTEAK_HOUSE_WIDTH
	dbw BANK(EcruteakHouse_BlockData), EcruteakHouse_BlockData
	dbw BANK(EcruteakHouse_MapScriptHeader), EcruteakHouse_MapScriptHeader
	dw EcruteakHouse_MapEventHeader

	db 0 ; connections
; 0x95cc0

WiseTriosRoom_SecondMapHeader: ; 0x95cc0
	db $0 ; border block
	db WISE_TRIOS_ROOM_HEIGHT, WISE_TRIOS_ROOM_WIDTH
	dbw BANK(WiseTriosRoom_BlockData), WiseTriosRoom_BlockData
	dbw BANK(WiseTriosRoom_MapScriptHeader), WiseTriosRoom_MapScriptHeader
	dw WiseTriosRoom_MapEventHeader

	db 0 ; connections
; 0x95ccc

EcruteakPokeCenter1F_SecondMapHeader: ; 0x95ccc
	db $0 ; border block
	db ECRUTEAK_POKECENTER_1F_HEIGHT, ECRUTEAK_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(EcruteakPokeCenter1F_MapScriptHeader), EcruteakPokeCenter1F_MapScriptHeader
	dw EcruteakPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95cd8

EcruteakLugiaSpeechHouse_SecondMapHeader: ; 0x95cd8
	db $0 ; border block
	db ECRUTEAK_LUGIA_SPEECH_HOUSE_HEIGHT, ECRUTEAK_LUGIA_SPEECH_HOUSE_WIDTH
	dbw BANK(EcruteakLugiaSpeechHouse_BlockData), EcruteakLugiaSpeechHouse_BlockData
	dbw BANK(EcruteakLugiaSpeechHouse_MapScriptHeader), EcruteakLugiaSpeechHouse_MapScriptHeader
	dw EcruteakLugiaSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x95ce4

DanceTheatre_SecondMapHeader: ; 0x95ce4
	db $0 ; border block
	db DANCE_THEATRE_HEIGHT, DANCE_THEATRE_WIDTH
	dbw BANK(DanceTheatre_BlockData), DanceTheatre_BlockData
	dbw BANK(DanceTheatre_MapScriptHeader), DanceTheatre_MapScriptHeader
	dw DanceTheatre_MapEventHeader

	db 0 ; connections
; 0x95cf0

EcruteakMart_SecondMapHeader: ; 0x95cf0
	db $0 ; border block
	db ECRUTEAK_MART_HEIGHT, ECRUTEAK_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(EcruteakMart_MapScriptHeader), EcruteakMart_MapScriptHeader
	dw EcruteakMart_MapEventHeader

	db 0 ; connections
; 0x95cfc

EcruteakGym_SecondMapHeader: ; 0x95cfc
	db $0 ; border block
	db ECRUTEAK_GYM_HEIGHT, ECRUTEAK_GYM_WIDTH
	dbw BANK(EcruteakGym_BlockData), EcruteakGym_BlockData
	dbw BANK(EcruteakGym_MapScriptHeader), EcruteakGym_MapScriptHeader
	dw EcruteakGym_MapEventHeader

	db 0 ; connections
; 0x95d08

EcruteakItemfinderHouse_SecondMapHeader: ; 0x95d08
	db $0 ; border block
	db ECRUTEAK_ITEMFINDER_HOUSE_HEIGHT, ECRUTEAK_ITEMFINDER_HOUSE_WIDTH
	dbw BANK(EcruteakLugiaSpeechHouse_BlockData), EcruteakLugiaSpeechHouse_BlockData
	dbw BANK(EcruteakItemfinderHouse_MapScriptHeader), EcruteakItemfinderHouse_MapScriptHeader
	dw EcruteakItemfinderHouse_MapEventHeader

	db 0 ; connections
; 0x95d14

BlackthornGym1F_SecondMapHeader: ; 0x95d14
	db $0 ; border block
	db BLACKTHORN_GYM_1F_HEIGHT, BLACKTHORN_GYM_1F_WIDTH
	dbw BANK(BlackthornGym1F_BlockData), BlackthornGym1F_BlockData
	dbw BANK(BlackthornGym1F_MapScriptHeader), BlackthornGym1F_MapScriptHeader
	dw BlackthornGym1F_MapEventHeader

	db 0 ; connections
; 0x95d20

BlackthornGym2F_SecondMapHeader: ; 0x95d20
	db $0 ; border block
	db BLACKTHORN_GYM_2F_HEIGHT, BLACKTHORN_GYM_2F_WIDTH
	dbw BANK(BlackthornGym2F_BlockData), BlackthornGym2F_BlockData
	dbw BANK(BlackthornGym2F_MapScriptHeader), BlackthornGym2F_MapScriptHeader
	dw BlackthornGym2F_MapEventHeader

	db 0 ; connections
; 0x95d2c

BlackthornDragonSpeechHouse_SecondMapHeader: ; 0x95d2c
	db $0 ; border block
	db BLACKTHORN_DRAGON_SPEECH_HOUSE_HEIGHT, BLACKTHORN_DRAGON_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(BlackthornDragonSpeechHouse_MapScriptHeader), BlackthornDragonSpeechHouse_MapScriptHeader
	dw BlackthornDragonSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x95d38

BlackthornDodrioTradeHouse_SecondMapHeader: ; 0x95d38
	db $0 ; border block
	db BLACKTHORN_DODRIO_TRADE_HOUSE_HEIGHT, BLACKTHORN_DODRIO_TRADE_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(BlackthornDodrioTradeHouse_MapScriptHeader), BlackthornDodrioTradeHouse_MapScriptHeader
	dw BlackthornDodrioTradeHouse_MapEventHeader

	db 0 ; connections
; 0x95d44

BlackthornMart_SecondMapHeader: ; 0x95d44
	db $0 ; border block
	db BLACKTHORN_MART_HEIGHT, BLACKTHORN_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(BlackthornMart_MapScriptHeader), BlackthornMart_MapScriptHeader
	dw BlackthornMart_MapEventHeader

	db 0 ; connections
; 0x95d50

BlackthornPokeCenter1F_SecondMapHeader: ; 0x95d50
	db $0 ; border block
	db BLACKTHORN_POKECENTER_1F_HEIGHT, BLACKTHORN_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(BlackthornPokeCenter1F_MapScriptHeader), BlackthornPokeCenter1F_MapScriptHeader
	dw BlackthornPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95d5c

MoveDeletersHouse_SecondMapHeader: ; 0x95d5c
	db $0 ; border block
	db MOVE_DELETERS_HOUSE_HEIGHT, MOVE_DELETERS_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(MoveDeletersHouse_MapScriptHeader), MoveDeletersHouse_MapScriptHeader
	dw MoveDeletersHouse_MapEventHeader

	db 0 ; connections
; 0x95d68

CinnabarPokeCenter1F_SecondMapHeader: ; 0x95d68
	db $0 ; border block
	db CINNABAR_POKECENTER_1F_HEIGHT, CINNABAR_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(CinnabarPokeCenter1F_MapScriptHeader), CinnabarPokeCenter1F_MapScriptHeader
	dw CinnabarPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95d74

CinnabarPokeCenter2FBeta_SecondMapHeader: ; 0x95d74
	db $0 ; border block
	db CINNABAR_POKECENTER_2F_BETA_HEIGHT, CINNABAR_POKECENTER_2F_BETA_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(CinnabarPokeCenter2FBeta_MapScriptHeader), CinnabarPokeCenter2FBeta_MapScriptHeader
	dw CinnabarPokeCenter2FBeta_MapEventHeader

	db 0 ; connections
; 0x95d80

Route19FuchsiaGate_SecondMapHeader: ; 0x95d80
	db $0 ; border block
	db ROUTE_19___FUCHSIA_GATE_HEIGHT, ROUTE_19___FUCHSIA_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route19FuchsiaGate_MapScriptHeader), Route19FuchsiaGate_MapScriptHeader
	dw Route19FuchsiaGate_MapEventHeader

	db 0 ; connections
; 0x95d8c

SeafoamGym_SecondMapHeader: ; 0x95d8c
	db $9 ; border block
	db SEAFOAM_GYM_HEIGHT, SEAFOAM_GYM_WIDTH
	dbw BANK(SeafoamGym_BlockData), SeafoamGym_BlockData
	dbw BANK(SeafoamGym_MapScriptHeader), SeafoamGym_MapScriptHeader
	dw SeafoamGym_MapEventHeader

	db 0 ; connections
; 0x95d98

CeruleanGymBadgeSpeechHouse_SecondMapHeader: ; 0x95d98
	db $0 ; border block
	db CERULEAN_GYM_BADGE_SPEECH_HOUSE_HEIGHT, CERULEAN_GYM_BADGE_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(CeruleanGymBadgeSpeechHouse_MapScriptHeader), CeruleanGymBadgeSpeechHouse_MapScriptHeader
	dw CeruleanGymBadgeSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x95da4

CeruleanPoliceStation_SecondMapHeader: ; 0x95da4
	db $0 ; border block
	db CERULEAN_POLICE_STATION_HEIGHT, CERULEAN_POLICE_STATION_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(CeruleanPoliceStation_MapScriptHeader), CeruleanPoliceStation_MapScriptHeader
	dw CeruleanPoliceStation_MapEventHeader

	db 0 ; connections
; 0x95db0

CeruleanTradeSpeechHouse_SecondMapHeader: ; 0x95db0
	db $0 ; border block
	db CERULEAN_TRADE_SPEECH_HOUSE_HEIGHT, CERULEAN_TRADE_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(CeruleanTradeSpeechHouse_MapScriptHeader), CeruleanTradeSpeechHouse_MapScriptHeader
	dw CeruleanTradeSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x95dbc

CeruleanPokeCenter1F_SecondMapHeader: ; 0x95dbc
	db $0 ; border block
	db CERULEAN_POKECENTER_1F_HEIGHT, CERULEAN_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(CeruleanPokeCenter1F_MapScriptHeader), CeruleanPokeCenter1F_MapScriptHeader
	dw CeruleanPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95dc8

CeruleanPokeCenter2FBeta_SecondMapHeader: ; 0x95dc8
	db $0 ; border block
	db CERULEAN_POKECENTER_2F_BETA_HEIGHT, CERULEAN_POKECENTER_2F_BETA_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(CeruleanPokeCenter2FBeta_MapScriptHeader), CeruleanPokeCenter2FBeta_MapScriptHeader
	dw CeruleanPokeCenter2FBeta_MapEventHeader

	db 0 ; connections
; 0x95dd4

CeruleanGym_SecondMapHeader: ; 0x95dd4
	db $0 ; border block
	db CERULEAN_GYM_HEIGHT, CERULEAN_GYM_WIDTH
	dbw BANK(CeruleanGym_BlockData), CeruleanGym_BlockData
	dbw BANK(CeruleanGym_MapScriptHeader), CeruleanGym_MapScriptHeader
	dw CeruleanGym_MapEventHeader

	db 0 ; connections
; 0x95de0

CeruleanMart_SecondMapHeader: ; 0x95de0
	db $0 ; border block
	db CERULEAN_MART_HEIGHT, CERULEAN_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(CeruleanMart_MapScriptHeader), CeruleanMart_MapScriptHeader
	dw CeruleanMart_MapEventHeader

	db 0 ; connections
; 0x95dec

Route10PokeCenter1F_SecondMapHeader: ; 0x95dec
	db $0 ; border block
	db ROUTE_10_POKECENTER_1F_HEIGHT, ROUTE_10_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(Route10PokeCenter1F_MapScriptHeader), Route10PokeCenter1F_MapScriptHeader
	dw Route10PokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95df8

Route10PokeCenter2FBeta_SecondMapHeader: ; 0x95df8
	db $0 ; border block
	db ROUTE_10_POKECENTER_2F_BETA_HEIGHT, ROUTE_10_POKECENTER_2F_BETA_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(Route10PokeCenter2FBeta_MapScriptHeader), Route10PokeCenter2FBeta_MapScriptHeader
	dw Route10PokeCenter2FBeta_MapEventHeader

	db 0 ; connections
; 0x95e04

PowerPlant_SecondMapHeader: ; 0x95e04
	db $0 ; border block
	db POWER_PLANT_HEIGHT, POWER_PLANT_WIDTH
	dbw BANK(PowerPlant_BlockData), PowerPlant_BlockData
	dbw BANK(PowerPlant_MapScriptHeader), PowerPlant_MapScriptHeader
	dw PowerPlant_MapEventHeader

	db 0 ; connections
; 0x95e10

BillsHouse_SecondMapHeader: ; 0x95e10
	db $0 ; border block
	db BILLS_HOUSE_HEIGHT, BILLS_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(BillsHouse_MapScriptHeader), BillsHouse_MapScriptHeader
	dw BillsHouse_MapEventHeader

	db 0 ; connections
; 0x95e1c

AzaleaPokeCenter1F_SecondMapHeader: ; 0x95e1c
	db $0 ; border block
	db AZALEA_POKECENTER_1F_HEIGHT, AZALEA_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(AzaleaPokeCenter1F_MapScriptHeader), AzaleaPokeCenter1F_MapScriptHeader
	dw AzaleaPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95e28

CharcoalKiln_SecondMapHeader: ; 0x95e28
	db $0 ; border block
	db CHARCOAL_KILN_HEIGHT, CHARCOAL_KILN_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(CharcoalKiln_MapScriptHeader), CharcoalKiln_MapScriptHeader
	dw CharcoalKiln_MapEventHeader

	db 0 ; connections
; 0x95e34

AzaleaMart_SecondMapHeader: ; 0x95e34
	db $0 ; border block
	db AZALEA_MART_HEIGHT, AZALEA_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(AzaleaMart_MapScriptHeader), AzaleaMart_MapScriptHeader
	dw AzaleaMart_MapEventHeader

	db 0 ; connections
; 0x95e40

KurtsHouse_SecondMapHeader: ; 0x95e40
	db $0 ; border block
	db KURTS_HOUSE_HEIGHT, KURTS_HOUSE_WIDTH
	dbw BANK(KurtsHouse_BlockData), KurtsHouse_BlockData
	dbw BANK(KurtsHouse_MapScriptHeader), KurtsHouse_MapScriptHeader
	dw KurtsHouse_MapEventHeader

	db 0 ; connections
; 0x95e4c

AzaleaGym_SecondMapHeader: ; 0x95e4c
	db $0 ; border block
	db AZALEA_GYM_HEIGHT, AZALEA_GYM_WIDTH
	dbw BANK(AzaleaGym_BlockData), AzaleaGym_BlockData
	dbw BANK(AzaleaGym_MapScriptHeader), AzaleaGym_MapScriptHeader
	dw AzaleaGym_MapEventHeader

	db 0 ; connections
; 0x95e58

LakeofRageHiddenPowerHouse_SecondMapHeader: ; 0x95e58
	db $0 ; border block
	db LAKE_OF_RAGE_HIDDEN_POWER_HOUSE_HEIGHT, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(LakeofRageHiddenPowerHouse_MapScriptHeader), LakeofRageHiddenPowerHouse_MapScriptHeader
	dw LakeofRageHiddenPowerHouse_MapEventHeader

	db 0 ; connections
; 0x95e64

LakeofRageMagikarpHouse_SecondMapHeader: ; 0x95e64
	db $0 ; border block
	db LAKE_OF_RAGE_MAGIKARP_HOUSE_HEIGHT, LAKE_OF_RAGE_MAGIKARP_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(LakeofRageMagikarpHouse_MapScriptHeader), LakeofRageMagikarpHouse_MapScriptHeader
	dw LakeofRageMagikarpHouse_MapEventHeader

	db 0 ; connections
; 0x95e70

Route43MahoganyGate_SecondMapHeader: ; 0x95e70
	db $0 ; border block
	db ROUTE_43_MAHOGANY_GATE_HEIGHT, ROUTE_43_MAHOGANY_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route43MahoganyGate_MapScriptHeader), Route43MahoganyGate_MapScriptHeader
	dw Route43MahoganyGate_MapEventHeader

	db 0 ; connections
; 0x95e7c

Route43Gate_SecondMapHeader: ; 0x95e7c
	db $0 ; border block
	db ROUTE_43_GATE_HEIGHT, ROUTE_43_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route43Gate_MapScriptHeader), Route43Gate_MapScriptHeader
	dw Route43Gate_MapEventHeader

	db 0 ; connections
; 0x95e88

VioletMart_SecondMapHeader: ; 0x95e88
	db $0 ; border block
	db VIOLET_MART_HEIGHT, VIOLET_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(VioletMart_MapScriptHeader), VioletMart_MapScriptHeader
	dw VioletMart_MapEventHeader

	db 0 ; connections
; 0x95e94

VioletGym_SecondMapHeader: ; 0x95e94
	db $0 ; border block
	db VIOLET_GYM_HEIGHT, VIOLET_GYM_WIDTH
	dbw BANK(VioletGym_BlockData), VioletGym_BlockData
	dbw BANK(VioletGym_MapScriptHeader), VioletGym_MapScriptHeader
	dw VioletGym_MapEventHeader

	db 0 ; connections
; 0x95ea0

EarlsPokemonAcademy_SecondMapHeader: ; 0x95ea0
	db $0 ; border block
	db EARLS_POKEMON_ACADEMY_HEIGHT, EARLS_POKEMON_ACADEMY_WIDTH
	dbw BANK(EarlsPokemonAcademy_BlockData), EarlsPokemonAcademy_BlockData
	dbw BANK(EarlsPokemonAcademy_MapScriptHeader), EarlsPokemonAcademy_MapScriptHeader
	dw EarlsPokemonAcademy_MapEventHeader

	db 0 ; connections
; 0x95eac

VioletNicknameSpeechHouse_SecondMapHeader: ; 0x95eac
	db $0 ; border block
	db VIOLET_NICKNAME_SPEECH_HOUSE_HEIGHT, VIOLET_NICKNAME_SPEECH_HOUSE_WIDTH
	dbw BANK(EcruteakLugiaSpeechHouse_BlockData), EcruteakLugiaSpeechHouse_BlockData
	dbw BANK(VioletNicknameSpeechHouse_MapScriptHeader), VioletNicknameSpeechHouse_MapScriptHeader
	dw VioletNicknameSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x95eb8

VioletPokeCenter1F_SecondMapHeader: ; 0x95eb8
	db $0 ; border block
	db VIOLET_POKECENTER_1F_HEIGHT, VIOLET_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(VioletPokeCenter1F_MapScriptHeader), VioletPokeCenter1F_MapScriptHeader
	dw VioletPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95ec4

VioletOnixTradeHouse_SecondMapHeader: ; 0x95ec4
	db $0 ; border block
	db VIOLET_ONIX_TRADE_HOUSE_HEIGHT, VIOLET_ONIX_TRADE_HOUSE_WIDTH
	dbw BANK(EcruteakLugiaSpeechHouse_BlockData), EcruteakLugiaSpeechHouse_BlockData
	dbw BANK(VioletOnixTradeHouse_MapScriptHeader), VioletOnixTradeHouse_MapScriptHeader
	dw VioletOnixTradeHouse_MapEventHeader

	db 0 ; connections
; 0x95ed0

Route32RuinsofAlphGate_SecondMapHeader: ; 0x95ed0
	db $0 ; border block
	db ROUTE_32_RUINS_OF_ALPH_GATE_HEIGHT, ROUTE_32_RUINS_OF_ALPH_GATE_WIDTH
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData
	dbw BANK(Route32RuinsofAlphGate_MapScriptHeader), Route32RuinsofAlphGate_MapScriptHeader
	dw Route32RuinsofAlphGate_MapEventHeader

	db 0 ; connections
; 0x95edc

Route32PokeCenter1F_SecondMapHeader: ; 0x95edc
	db $0 ; border block
	db ROUTE_32_POKECENTER_1F_HEIGHT, ROUTE_32_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(Route32PokeCenter1F_MapScriptHeader), Route32PokeCenter1F_MapScriptHeader
	dw Route32PokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95ee8

Route35Goldenrodgate_SecondMapHeader: ; 0x95ee8
	db $0 ; border block
	db ROUTE_35_GOLDENROD_GATE_HEIGHT, ROUTE_35_GOLDENROD_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route35Goldenrodgate_MapScriptHeader), Route35Goldenrodgate_MapScriptHeader
	dw Route35Goldenrodgate_MapEventHeader

	db 0 ; connections
; 0x95ef4

Route35NationalParkgate_SecondMapHeader: ; 0x95ef4
	db $0 ; border block
	db ROUTE_35_NATIONAL_PARK_GATE_HEIGHT, ROUTE_35_NATIONAL_PARK_GATE_WIDTH
	dbw BANK(Route35NationalParkgate_BlockData), Route35NationalParkgate_BlockData
	dbw BANK(Route35NationalParkgate_MapScriptHeader), Route35NationalParkgate_MapScriptHeader
	dw Route35NationalParkgate_MapEventHeader

	db 0 ; connections
; 0x95f00

Route36RuinsofAlphgate_SecondMapHeader: ; 0x95f00
	db $0 ; border block
	db ROUTE_36_RUINS_OF_ALPH_GATE_HEIGHT, ROUTE_36_RUINS_OF_ALPH_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route36RuinsofAlphgate_MapScriptHeader), Route36RuinsofAlphgate_MapScriptHeader
	dw Route36RuinsofAlphgate_MapEventHeader

	db 0 ; connections
; 0x95f0c

Route36NationalParkgate_SecondMapHeader: ; 0x95f0c
	db $0 ; border block
	db ROUTE_36_NATIONAL_PARK_GATE_HEIGHT, ROUTE_36_NATIONAL_PARK_GATE_WIDTH
	dbw BANK(Route36NationalParkgate_BlockData), Route36NationalParkgate_BlockData
	dbw BANK(Route36NationalParkgate_MapScriptHeader), Route36NationalParkgate_MapScriptHeader
	dw Route36NationalParkgate_MapEventHeader

	db 0 ; connections
; 0x95f18

GoldenrodGym_SecondMapHeader: ; 0x95f18
	db $0 ; border block
	db GOLDENROD_GYM_HEIGHT, GOLDENROD_GYM_WIDTH
	dbw BANK(GoldenrodGym_BlockData), GoldenrodGym_BlockData
	dbw BANK(GoldenrodGym_MapScriptHeader), GoldenrodGym_MapScriptHeader
	dw GoldenrodGym_MapEventHeader

	db 0 ; connections
; 0x95f24

GoldenrodBikeShop_SecondMapHeader: ; 0x95f24
	db $0 ; border block
	db GOLDENROD_BIKE_SHOP_HEIGHT, GOLDENROD_BIKE_SHOP_WIDTH
	dbw BANK(GoldenrodBikeShop_BlockData), GoldenrodBikeShop_BlockData
	dbw BANK(GoldenrodBikeShop_MapScriptHeader), GoldenrodBikeShop_MapScriptHeader
	dw GoldenrodBikeShop_MapEventHeader

	db 0 ; connections
; 0x95f30

GoldenrodHappinessRater_SecondMapHeader: ; 0x95f30
	db $0 ; border block
	db GOLDENROD_HAPPINESS_RATER_HEIGHT, GOLDENROD_HAPPINESS_RATER_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(GoldenrodHappinessRater_MapScriptHeader), GoldenrodHappinessRater_MapScriptHeader
	dw GoldenrodHappinessRater_MapEventHeader

	db 0 ; connections
; 0x95f3c

GoldenrodBillsHouse_SecondMapHeader: ; 0x95f3c
	db $0 ; border block
	db GOLDENROD_BILLS_HOUSE_HEIGHT, GOLDENROD_BILLS_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(GoldenrodBillsHouse_MapScriptHeader), GoldenrodBillsHouse_MapScriptHeader
	dw GoldenrodBillsHouse_MapEventHeader

	db 0 ; connections
; 0x95f48

GoldenrodMagnetTrainStation_SecondMapHeader: ; 0x95f48
	db $0 ; border block
	db GOLDENROD_MAGNET_TRAIN_STATION_HEIGHT, GOLDENROD_MAGNET_TRAIN_STATION_WIDTH
	dbw BANK(GoldenrodMagnetTrainStation_BlockData), GoldenrodMagnetTrainStation_BlockData
	dbw BANK(GoldenrodMagnetTrainStation_MapScriptHeader), GoldenrodMagnetTrainStation_MapScriptHeader
	dw GoldenrodMagnetTrainStation_MapEventHeader

	db 0 ; connections
; 0x95f54

GoldenrodFlowerShop_SecondMapHeader: ; 0x95f54
	db $0 ; border block
	db GOLDENROD_FLOWER_SHOP_HEIGHT, GOLDENROD_FLOWER_SHOP_WIDTH
	dbw BANK(GoldenrodFlowerShop_BlockData), GoldenrodFlowerShop_BlockData
	dbw BANK(GoldenrodFlowerShop_MapScriptHeader), GoldenrodFlowerShop_MapScriptHeader
	dw GoldenrodFlowerShop_MapEventHeader

	db 0 ; connections
; 0x95f60

GoldenrodPPSpeechHouse_SecondMapHeader: ; 0x95f60
	db $0 ; border block
	db GOLDENROD_PP_SPEECH_HOUSE_HEIGHT, GOLDENROD_PP_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(GoldenrodPPSpeechHouse_MapScriptHeader), GoldenrodPPSpeechHouse_MapScriptHeader
	dw GoldenrodPPSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x95f6c

GoldenrodNameRatersHouse_SecondMapHeader: ; 0x95f6c
	db $0 ; border block
	db GOLDENROD_NAME_RATERS_HOUSE_HEIGHT, GOLDENROD_NAME_RATERS_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(GoldenrodNameRatersHouse_MapScriptHeader), GoldenrodNameRatersHouse_MapScriptHeader
	dw GoldenrodNameRatersHouse_MapEventHeader

	db 0 ; connections
; 0x95f78

GoldenrodDeptStore1F_SecondMapHeader: ; 0x95f78
	db $0 ; border block
	db GOLDENROD_DEPT_STORE_1F_HEIGHT, GOLDENROD_DEPT_STORE_1F_WIDTH
	dbw BANK(GoldenrodDeptStore1F_BlockData), GoldenrodDeptStore1F_BlockData
	dbw BANK(GoldenrodDeptStore1F_MapScriptHeader), GoldenrodDeptStore1F_MapScriptHeader
	dw GoldenrodDeptStore1F_MapEventHeader

	db 0 ; connections
; 0x95f84

GoldenrodDeptStore2F_SecondMapHeader: ; 0x95f84
	db $0 ; border block
	db GOLDENROD_DEPT_STORE_2F_HEIGHT, GOLDENROD_DEPT_STORE_2F_WIDTH
	dbw BANK(GoldenrodDeptStore2F_BlockData), GoldenrodDeptStore2F_BlockData
	dbw BANK(GoldenrodDeptStore2F_MapScriptHeader), GoldenrodDeptStore2F_MapScriptHeader
	dw GoldenrodDeptStore2F_MapEventHeader

	db 0 ; connections
; 0x95f90

GoldenrodDeptStore3F_SecondMapHeader: ; 0x95f90
	db $0 ; border block
	db GOLDENROD_DEPT_STORE_3F_HEIGHT, GOLDENROD_DEPT_STORE_3F_WIDTH
	dbw BANK(GoldenrodDeptStore3F_BlockData), GoldenrodDeptStore3F_BlockData
	dbw BANK(GoldenrodDeptStore3F_MapScriptHeader), GoldenrodDeptStore3F_MapScriptHeader
	dw GoldenrodDeptStore3F_MapEventHeader

	db 0 ; connections
; 0x95f9c

GoldenrodDeptStore4F_SecondMapHeader: ; 0x95f9c
	db $0 ; border block
	db GOLDENROD_DEPT_STORE_4F_HEIGHT, GOLDENROD_DEPT_STORE_4F_WIDTH
	dbw BANK(GoldenrodDeptStore4F_BlockData), GoldenrodDeptStore4F_BlockData
	dbw BANK(GoldenrodDeptStore4F_MapScriptHeader), GoldenrodDeptStore4F_MapScriptHeader
	dw GoldenrodDeptStore4F_MapEventHeader

	db 0 ; connections
; 0x95fa8

GoldenrodDeptStore5F_SecondMapHeader: ; 0x95fa8
	db $0 ; border block
	db GOLDENROD_DEPT_STORE_5F_HEIGHT, GOLDENROD_DEPT_STORE_5F_WIDTH
	dbw BANK(GoldenrodDeptStore5F_BlockData), GoldenrodDeptStore5F_BlockData
	dbw BANK(GoldenrodDeptStore5F_MapScriptHeader), GoldenrodDeptStore5F_MapScriptHeader
	dw GoldenrodDeptStore5F_MapEventHeader

	db 0 ; connections
; 0x95fb4

GoldenrodDeptStore6F_SecondMapHeader: ; 0x95fb4
	db $0 ; border block
	db GOLDENROD_DEPT_STORE_6F_HEIGHT, GOLDENROD_DEPT_STORE_6F_WIDTH
	dbw BANK(GoldenrodDeptStore6F_BlockData), GoldenrodDeptStore6F_BlockData
	dbw BANK(GoldenrodDeptStore6F_MapScriptHeader), GoldenrodDeptStore6F_MapScriptHeader
	dw GoldenrodDeptStore6F_MapEventHeader

	db 0 ; connections
; 0x95fc0

GoldenrodDeptStoreElevator_SecondMapHeader: ; 0x95fc0
	db $0 ; border block
	db GOLDENROD_DEPT_STORE_ELEVATOR_HEIGHT, GOLDENROD_DEPT_STORE_ELEVATOR_WIDTH
	dbw BANK(GoldenrodDeptStoreElevator_BlockData), GoldenrodDeptStoreElevator_BlockData
	dbw BANK(GoldenrodDeptStoreElevator_MapScriptHeader), GoldenrodDeptStoreElevator_MapScriptHeader
	dw GoldenrodDeptStoreElevator_MapEventHeader

	db 0 ; connections
; 0x95fcc

GoldenrodDeptStoreRoof_SecondMapHeader: ; 0x95fcc
	db $24 ; border block
	db GOLDENROD_DEPT_STORE_ROOF_HEIGHT, GOLDENROD_DEPT_STORE_ROOF_WIDTH
	dbw BANK(GoldenrodDeptStoreRoof_BlockData), GoldenrodDeptStoreRoof_BlockData
	dbw BANK(GoldenrodDeptStoreRoof_MapScriptHeader), GoldenrodDeptStoreRoof_MapScriptHeader
	dw GoldenrodDeptStoreRoof_MapEventHeader

	db 0 ; connections
; 0x95fd8

GoldenrodGameCorner_SecondMapHeader: ; 0x95fd8
	db $0 ; border block
	db GOLDENROD_GAME_CORNER_HEIGHT, GOLDENROD_GAME_CORNER_WIDTH
	dbw BANK(GoldenrodGameCorner_BlockData), GoldenrodGameCorner_BlockData
	dbw BANK(GoldenrodGameCorner_MapScriptHeader), GoldenrodGameCorner_MapScriptHeader
	dw GoldenrodGameCorner_MapEventHeader

	db 0 ; connections
; 0x95fe4

GoldenrodPokeCenter1F_SecondMapHeader: ; 0x95fe4
	db $0 ; border block
	db GOLDENROD_POKECENTER_1F_HEIGHT, GOLDENROD_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(GoldenrodPokeCenter1F_MapScriptHeader), GoldenrodPokeCenter1F_MapScriptHeader
	dw GoldenrodPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x95ff0

GoldenrodPokeComCenter2FMobile_SecondMapHeader: ; 0x95ff0
	db $0 ; border block
	db GOLDENROD_POKECOM_CENTER_2F_MOBILE_HEIGHT, GOLDENROD_POKECOM_CENTER_2F_MOBILE_WIDTH
	dbw BANK(GoldenrodPokeComCenter2FMobile_BlockData), GoldenrodPokeComCenter2FMobile_BlockData
	dbw BANK(GoldenrodPokeComCenter2FMobile_MapScriptHeader), GoldenrodPokeComCenter2FMobile_MapScriptHeader
	dw GoldenrodPokeComCenter2FMobile_MapEventHeader

	db 0 ; connections
; 0x95ffc

IlexForestAzaleaGate_SecondMapHeader: ; 0x95ffc
	db $0 ; border block
	db ILEX_FOREST_AZALEA_GATE_HEIGHT, ILEX_FOREST_AZALEA_GATE_WIDTH
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData
	dbw BANK(IlexForestAzaleaGate_MapScriptHeader), IlexForestAzaleaGate_MapScriptHeader
	dw IlexForestAzaleaGate_MapEventHeader

	db 0 ; connections
; 0x96008

Route34IlexForestGate_SecondMapHeader: ; 0x96008
	db $0 ; border block
	db ROUTE_34_ILEX_FOREST_GATE_HEIGHT, ROUTE_34_ILEX_FOREST_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route34IlexForestGate_MapScriptHeader), Route34IlexForestGate_MapScriptHeader
	dw Route34IlexForestGate_MapEventHeader

	db 0 ; connections
; 0x96014

DayCare_SecondMapHeader: ; 0x96014
	db $0 ; border block
	db DAY_CARE_HEIGHT, DAY_CARE_WIDTH
	dbw BANK(DayCare_BlockData), DayCare_BlockData
	dbw BANK(DayCare_MapScriptHeader), DayCare_MapScriptHeader
	dw DayCare_MapEventHeader

	db 0 ; connections
; 0x96020

VermilionHouseFishingSpeechHouse_SecondMapHeader: ; 0x96020
	db $0 ; border block
	db VERMILION_HOUSE_FISHING_SPEECH_HOUSE_HEIGHT, VERMILION_HOUSE_FISHING_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(VermilionHouseFishingSpeechHouse_MapScriptHeader), VermilionHouseFishingSpeechHouse_MapScriptHeader
	dw VermilionHouseFishingSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x9602c

VermilionPokeCenter1F_SecondMapHeader: ; 0x9602c
	db $0 ; border block
	db VERMILION_POKECENTER_1F_HEIGHT, VERMILION_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(VermilionPokeCenter1F_MapScriptHeader), VermilionPokeCenter1F_MapScriptHeader
	dw VermilionPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x96038

VermilionPokeCenter2FBeta_SecondMapHeader: ; 0x96038
	db $0 ; border block
	db VERMILION_POKECENTER_2F_BETA_HEIGHT, VERMILION_POKECENTER_2F_BETA_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(VermilionPokeCenter2FBeta_MapScriptHeader), VermilionPokeCenter2FBeta_MapScriptHeader
	dw VermilionPokeCenter2FBeta_MapEventHeader

	db 0 ; connections
; 0x96044

PokemonFanClub_SecondMapHeader: ; 0x96044
	db $0 ; border block
	db POKEMON_FAN_CLUB_HEIGHT, POKEMON_FAN_CLUB_WIDTH
	dbw BANK(PokemonFanClub_BlockData), PokemonFanClub_BlockData
	dbw BANK(PokemonFanClub_MapScriptHeader), PokemonFanClub_MapScriptHeader
	dw PokemonFanClub_MapEventHeader

	db 0 ; connections
; 0x96050

VermilionMagnetTrainSpeechHouse_SecondMapHeader: ; 0x96050
	db $0 ; border block
	db VERMILION_MAGNET_TRAIN_SPEECH_HOUSE_HEIGHT, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(VermilionMagnetTrainSpeechHouse_MapScriptHeader), VermilionMagnetTrainSpeechHouse_MapScriptHeader
	dw VermilionMagnetTrainSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x9605c

VermilionMart_SecondMapHeader: ; 0x9605c
	db $0 ; border block
	db VERMILION_MART_HEIGHT, VERMILION_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(VermilionMart_MapScriptHeader), VermilionMart_MapScriptHeader
	dw VermilionMart_MapEventHeader

	db 0 ; connections
; 0x96068

VermilionHouseDiglettsCaveSpeechHouse_SecondMapHeader: ; 0x96068
	db $0 ; border block
	db VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE_HEIGHT, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(VermilionHouseDiglettsCaveSpeechHouse_MapScriptHeader), VermilionHouseDiglettsCaveSpeechHouse_MapScriptHeader
	dw VermilionHouseDiglettsCaveSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x96074

VermilionGym_SecondMapHeader: ; 0x96074
	db $0 ; border block
	db VERMILION_GYM_HEIGHT, VERMILION_GYM_WIDTH
	dbw BANK(VermilionGym_BlockData), VermilionGym_BlockData
	dbw BANK(VermilionGym_MapScriptHeader), VermilionGym_MapScriptHeader
	dw VermilionGym_MapEventHeader

	db 0 ; connections
; 0x96080

Route6SaffronGate_SecondMapHeader: ; 0x96080
	db $0 ; border block
	db ROUTE_6_SAFFRON_GATE_HEIGHT, ROUTE_6_SAFFRON_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route6SaffronGate_MapScriptHeader), Route6SaffronGate_MapScriptHeader
	dw Route6SaffronGate_MapEventHeader

	db 0 ; connections
; 0x9608c

Route6UndergroundEntrance_SecondMapHeader: ; 0x9608c
	db $0 ; border block
	db ROUTE_6_UNDERGROUND_ENTRANCE_HEIGHT, ROUTE_6_UNDERGROUND_ENTRANCE_WIDTH
	dbw BANK(Route6UndergroundEntrance_BlockData), Route6UndergroundEntrance_BlockData
	dbw BANK(Route6UndergroundEntrance_MapScriptHeader), Route6UndergroundEntrance_MapScriptHeader
	dw Route6UndergroundEntrance_MapEventHeader

	db 0 ; connections
; 0x96098

RedsHouse1F_SecondMapHeader: ; 0x96098
	db $0 ; border block
	db REDS_HOUSE_1F_HEIGHT, REDS_HOUSE_1F_WIDTH
	dbw BANK(RedsHouse1F_BlockData), RedsHouse1F_BlockData
	dbw BANK(RedsHouse1F_MapScriptHeader), RedsHouse1F_MapScriptHeader
	dw RedsHouse1F_MapEventHeader

	db 0 ; connections
; 0x960a4

RedsHouse2F_SecondMapHeader: ; 0x960a4
	db $0 ; border block
	db REDS_HOUSE_2F_HEIGHT, REDS_HOUSE_2F_WIDTH
	dbw BANK(RedsHouse2F_BlockData), RedsHouse2F_BlockData
	dbw BANK(RedsHouse2F_MapScriptHeader), RedsHouse2F_MapScriptHeader
	dw RedsHouse2F_MapEventHeader

	db 0 ; connections
; 0x960b0

BluesHouse_SecondMapHeader: ; 0x960b0
	db $0 ; border block
	db BLUES_HOUSE_HEIGHT, BLUES_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(BluesHouse_MapScriptHeader), BluesHouse_MapScriptHeader
	dw BluesHouse_MapEventHeader

	db 0 ; connections
; 0x960bc

OaksLab_SecondMapHeader: ; 0x960bc
	db $0 ; border block
	db OAKS_LAB_HEIGHT, OAKS_LAB_WIDTH
	dbw BANK(OaksLab_BlockData), OaksLab_BlockData
	dbw BANK(OaksLab_MapScriptHeader), OaksLab_MapScriptHeader
	dw OaksLab_MapEventHeader

	db 0 ; connections
; 0x960c8

PewterNidoranSpeechHouse_SecondMapHeader: ; 0x960c8
	db $0 ; border block
	db PEWTER_NIDORAN_SPEECH_HOUSE_HEIGHT, PEWTER_NIDORAN_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(PewterNidoranSpeechHouse_MapScriptHeader), PewterNidoranSpeechHouse_MapScriptHeader
	dw PewterNidoranSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x960d4

PewterGym_SecondMapHeader: ; 0x960d4
	db $0 ; border block
	db PEWTER_GYM_HEIGHT, PEWTER_GYM_WIDTH
	dbw BANK(PewterGym_BlockData), PewterGym_BlockData
	dbw BANK(PewterGym_MapScriptHeader), PewterGym_MapScriptHeader
	dw PewterGym_MapEventHeader

	db 0 ; connections
; 0x960e0

PewterMart_SecondMapHeader: ; 0x960e0
	db $0 ; border block
	db PEWTER_MART_HEIGHT, PEWTER_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(PewterMart_MapScriptHeader), PewterMart_MapScriptHeader
	dw PewterMart_MapEventHeader

	db 0 ; connections
; 0x960ec

PewterPokeCenter1F_SecondMapHeader: ; 0x960ec
	db $0 ; border block
	db PEWTER_POKECENTER_1F_HEIGHT, PEWTER_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(PewterPokeCenter1F_MapScriptHeader), PewterPokeCenter1F_MapScriptHeader
	dw PewterPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x960f8

PewterPokeCEnter2FBeta_SecondMapHeader: ; 0x960f8
	db $0 ; border block
	db PEWTER_POKECENTER_2F_BETA_HEIGHT, PEWTER_POKECENTER_2F_BETA_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(PewterPokeCEnter2FBeta_MapScriptHeader), PewterPokeCEnter2FBeta_MapScriptHeader
	dw PewterPokeCEnter2FBeta_MapEventHeader

	db 0 ; connections
; 0x96104

PewterSnoozeSpeechHouse_SecondMapHeader: ; 0x96104
	db $0 ; border block
	db PEWTER_SNOOZE_SPEECH_HOUSE_HEIGHT, PEWTER_SNOOZE_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(PewterSnoozeSpeechHouse_MapScriptHeader), PewterSnoozeSpeechHouse_MapScriptHeader
	dw PewterSnoozeSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x96110

OlivinePort_SecondMapHeader: ; 0x96110
	db $a ; border block
	db OLIVINE_PORT_HEIGHT, OLIVINE_PORT_WIDTH
	dbw BANK(OlivinePort_BlockData), OlivinePort_BlockData
	dbw BANK(OlivinePort_MapScriptHeader), OlivinePort_MapScriptHeader
	dw OlivinePort_MapEventHeader

	db 0 ; connections
; 0x9611c

VermilionPort_SecondMapHeader: ; 0x9611c
	db $a ; border block
	db VERMILION_PORT_HEIGHT, VERMILION_PORT_WIDTH
	dbw BANK(VermilionPort_BlockData), VermilionPort_BlockData
	dbw BANK(VermilionPort_MapScriptHeader), VermilionPort_MapScriptHeader
	dw VermilionPort_MapEventHeader

	db 0 ; connections
; 0x96128

FastShip1F_SecondMapHeader: ; 0x96128
	db $0 ; border block
	db FAST_SHIP_1F_HEIGHT, FAST_SHIP_1F_WIDTH
	dbw BANK(FastShip1F_BlockData), FastShip1F_BlockData
	dbw BANK(FastShip1F_MapScriptHeader), FastShip1F_MapScriptHeader
	dw FastShip1F_MapEventHeader

	db 0 ; connections
; 0x96134

FastShipCabins_NNW_NNE_NE_SecondMapHeader: ; 0x96134
	db $0 ; border block
	db FAST_SHIP_CABINS_NNW_NNE_NE_HEIGHT, FAST_SHIP_CABINS_NNW_NNE_NE_WIDTH
	dbw BANK(FastShipCabins_NNW_NNE_NE_BlockData), FastShipCabins_NNW_NNE_NE_BlockData
	dbw BANK(FastShipCabins_NNW_NNE_NE_MapScriptHeader), FastShipCabins_NNW_NNE_NE_MapScriptHeader
	dw FastShipCabins_NNW_NNE_NE_MapEventHeader

	db 0 ; connections
; 0x96140

FastShipCabins_SW_SSW_NW_SecondMapHeader: ; 0x96140
	db $0 ; border block
	db FAST_SHIP_CABINS_SW_SSW_NW_HEIGHT, FAST_SHIP_CABINS_SW_SSW_NW_WIDTH
	dbw BANK(FastShipCabins_SW_SSW_NW_BlockData), FastShipCabins_SW_SSW_NW_BlockData
	dbw BANK(FastShipCabins_SW_SSW_NW_MapScriptHeader), FastShipCabins_SW_SSW_NW_MapScriptHeader
	dw FastShipCabins_SW_SSW_NW_MapEventHeader

	db 0 ; connections
; 0x9614c

FastShipCabins_SE_SSE_CaptainsCabin_SecondMapHeader: ; 0x9614c
	db $0 ; border block
	db FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_HEIGHT, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_WIDTH
	dbw BANK(FastShipCabins_SE_SSE_CaptainsCabin_BlockData), FastShipCabins_SE_SSE_CaptainsCabin_BlockData
	dbw BANK(FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader), FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader
	dw FastShipCabins_SE_SSE_CaptainsCabin_MapEventHeader

	db 0 ; connections
; 0x96158

FastShipB1F_SecondMapHeader: ; 0x96158
	db $0 ; border block
	db FAST_SHIP_B1F_HEIGHT, FAST_SHIP_B1F_WIDTH
	dbw BANK(FastShipB1F_BlockData), FastShipB1F_BlockData
	dbw BANK(FastShipB1F_MapScriptHeader), FastShipB1F_MapScriptHeader
	dw FastShipB1F_MapEventHeader

	db 0 ; connections
; 0x96164

OlivinePortPassage_SecondMapHeader: ; 0x96164
	db $0 ; border block
	db OLIVINE_PORT_PASSAGE_HEIGHT, OLIVINE_PORT_PASSAGE_WIDTH
	dbw BANK(OlivinePortPassage_BlockData), OlivinePortPassage_BlockData
	dbw BANK(OlivinePortPassage_MapScriptHeader), OlivinePortPassage_MapScriptHeader
	dw OlivinePortPassage_MapEventHeader

	db 0 ; connections
; 0x96170

VermilionPortPassage_SecondMapHeader: ; 0x96170
	db $0 ; border block
	db VERMILION_PORT_PASSAGE_HEIGHT, VERMILION_PORT_PASSAGE_WIDTH
	dbw BANK(OlivinePortPassage_BlockData), OlivinePortPassage_BlockData
	dbw BANK(VermilionPortPassage_MapScriptHeader), VermilionPortPassage_MapScriptHeader
	dw VermilionPortPassage_MapEventHeader

	db 0 ; connections
; 0x9617c

MountMoonSquare_SecondMapHeader: ; 0x9617c
	db $2d ; border block
	db MOUNT_MOON_SQUARE_HEIGHT, MOUNT_MOON_SQUARE_WIDTH
	dbw BANK(MountMoonSquare_BlockData), MountMoonSquare_BlockData
	dbw BANK(MountMoonSquare_MapScriptHeader), MountMoonSquare_MapScriptHeader
	dw MountMoonSquare_MapEventHeader

	db 0 ; connections
; 0x96188

MountMoonGiftShop_SecondMapHeader: ; 0x96188
	db $0 ; border block
	db MOUNT_MOON_GIFT_SHOP_HEIGHT, MOUNT_MOON_GIFT_SHOP_WIDTH
	dbw BANK(MahoganyMart1F_BlockData), MahoganyMart1F_BlockData
	dbw BANK(MountMoonGiftShop_MapScriptHeader), MountMoonGiftShop_MapScriptHeader
	dw MountMoonGiftShop_MapEventHeader

	db 0 ; connections
; 0x96194

TinTowerRoof_SecondMapHeader: ; 0x96194
	db $0 ; border block
	db TIN_TOWER_ROOF_HEIGHT, TIN_TOWER_ROOF_WIDTH
	dbw BANK(TinTowerRoof_BlockData), TinTowerRoof_BlockData
	dbw BANK(TinTowerRoof_MapScriptHeader), TinTowerRoof_MapScriptHeader
	dw TinTowerRoof_MapEventHeader

	db 0 ; connections
; 0x961a0

IndigoPlateauPokeCenter1F_SecondMapHeader: ; 0x961a0
	db $0 ; border block
	db INDIGO_PLATEAU_POKECENTER_1F_HEIGHT, INDIGO_PLATEAU_POKECENTER_1F_WIDTH
	dbw BANK(IndigoPlateauPokeCenter1F_BlockData), IndigoPlateauPokeCenter1F_BlockData
	dbw BANK(IndigoPlateauPokeCenter1F_MapScriptHeader), IndigoPlateauPokeCenter1F_MapScriptHeader
	dw IndigoPlateauPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x961ac

WillsRoom_SecondMapHeader: ; 0x961ac
	db $0 ; border block
	db WILLS_ROOM_HEIGHT, WILLS_ROOM_WIDTH
	dbw BANK(WillsRoom_BlockData), WillsRoom_BlockData
	dbw BANK(WillsRoom_MapScriptHeader), WillsRoom_MapScriptHeader
	dw WillsRoom_MapEventHeader

	db 0 ; connections
; 0x961b8

KogasRoom_SecondMapHeader: ; 0x961b8
	db $0 ; border block
	db KOGAS_ROOM_HEIGHT, KOGAS_ROOM_WIDTH
	dbw BANK(KogasRoom_BlockData), KogasRoom_BlockData
	dbw BANK(KogasRoom_MapScriptHeader), KogasRoom_MapScriptHeader
	dw KogasRoom_MapEventHeader

	db 0 ; connections
; 0x961c4

BrunosRoom_SecondMapHeader: ; 0x961c4
	db $0 ; border block
	db BRUNOS_ROOM_HEIGHT, BRUNOS_ROOM_WIDTH
	dbw BANK(BrunosRoom_BlockData), BrunosRoom_BlockData
	dbw BANK(BrunosRoom_MapScriptHeader), BrunosRoom_MapScriptHeader
	dw BrunosRoom_MapEventHeader

	db 0 ; connections
; 0x961d0

KarensRoom_SecondMapHeader: ; 0x961d0
	db $0 ; border block
	db KARENS_ROOM_HEIGHT, KARENS_ROOM_WIDTH
	dbw BANK(KarensRoom_BlockData), KarensRoom_BlockData
	dbw BANK(KarensRoom_MapScriptHeader), KarensRoom_MapScriptHeader
	dw KarensRoom_MapEventHeader

	db 0 ; connections
; 0x961dc

LancesRoom_SecondMapHeader: ; 0x961dc
	db $0 ; border block
	db LANCES_ROOM_HEIGHT, LANCES_ROOM_WIDTH
	dbw BANK(LancesRoom_BlockData), LancesRoom_BlockData
	dbw BANK(LancesRoom_MapScriptHeader), LancesRoom_MapScriptHeader
	dw LancesRoom_MapEventHeader

	db 0 ; connections
; 0x961e8

HallOfFame_SecondMapHeader: ; 0x961e8
	db $0 ; border block
	db HALL_OF_FAME_HEIGHT, HALL_OF_FAME_WIDTH
	dbw BANK(HallOfFame_BlockData), HallOfFame_BlockData
	dbw BANK(HallOfFame_MapScriptHeader), HallOfFame_MapScriptHeader
	dw HallOfFame_MapEventHeader

	db 0 ; connections
; 0x961f4

FuchsiaMart_SecondMapHeader: ; 0x961f4
	db $0 ; border block
	db FUCHSIA_MART_HEIGHT, FUCHSIA_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(FuchsiaMart_MapScriptHeader), FuchsiaMart_MapScriptHeader
	dw FuchsiaMart_MapEventHeader

	db 0 ; connections
; 0x96200

SafariZoneMainOffice_SecondMapHeader: ; 0x96200
	db $0 ; border block
	db SAFARI_ZONE_MAIN_OFFICE_HEIGHT, SAFARI_ZONE_MAIN_OFFICE_WIDTH
	dbw BANK(OlivineCafe_BlockData), OlivineCafe_BlockData
	dbw BANK(SafariZoneMainOffice_MapScriptHeader), SafariZoneMainOffice_MapScriptHeader
	dw SafariZoneMainOffice_MapEventHeader

	db 0 ; connections
; 0x9620c

FuchsiaGym_SecondMapHeader: ; 0x9620c
	db $0 ; border block
	db FUCHSIA_GYM_HEIGHT, FUCHSIA_GYM_WIDTH
	dbw BANK(FuchsiaGym_BlockData), FuchsiaGym_BlockData
	dbw BANK(FuchsiaGym_MapScriptHeader), FuchsiaGym_MapScriptHeader
	dw FuchsiaGym_MapEventHeader

	db 0 ; connections
; 0x96218

FuchsiaBillSpeechHouse_SecondMapHeader: ; 0x96218
	db $0 ; border block
	db FUCHSIA_BILL_SPEECH_HOUSE_HEIGHT, FUCHSIA_BILL_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(FuchsiaBillSpeechHouse_MapScriptHeader), FuchsiaBillSpeechHouse_MapScriptHeader
	dw FuchsiaBillSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x96224

FuchsiaPokeCenter1F_SecondMapHeader: ; 0x96224
	db $0 ; border block
	db FUCHSIA_POKECENTER_1F_HEIGHT, FUCHSIA_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(FuchsiaPokeCenter1F_MapScriptHeader), FuchsiaPokeCenter1F_MapScriptHeader
	dw FuchsiaPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x96230

FuchsiaPokeCenter2FBeta_SecondMapHeader: ; 0x96230
	db $0 ; border block
	db FUCHSIA_POKECENTER_2F_BETA_HEIGHT, FUCHSIA_POKECENTER_2F_BETA_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(FuchsiaPokeCenter2FBeta_MapScriptHeader), FuchsiaPokeCenter2FBeta_MapScriptHeader
	dw FuchsiaPokeCenter2FBeta_MapEventHeader

	db 0 ; connections
; 0x9623c

SafariZoneWardensHome_SecondMapHeader: ; 0x9623c
	db $0 ; border block
	db SAFARI_ZONE_WARDENS_HOME_HEIGHT, SAFARI_ZONE_WARDENS_HOME_WIDTH
	dbw BANK(PokemonFanClub_BlockData), PokemonFanClub_BlockData
	dbw BANK(SafariZoneWardensHome_MapScriptHeader), SafariZoneWardensHome_MapScriptHeader
	dw SafariZoneWardensHome_MapEventHeader

	db 0 ; connections
; 0x96248

Route15FuchsiaGate_SecondMapHeader: ; 0x96248
	db $0 ; border block
	db ROUTE_15_FUCHSIA_GATE_HEIGHT, ROUTE_15_FUCHSIA_GATE_WIDTH
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData
	dbw BANK(Route15FuchsiaGate_MapScriptHeader), Route15FuchsiaGate_MapScriptHeader
	dw Route15FuchsiaGate_MapEventHeader

	db 0 ; connections
; 0x96254

LavenderPokeCenter1F_SecondMapHeader: ; 0x96254
	db $0 ; border block
	db LAVENDER_POKECENTER_1F_HEIGHT, LAVENDER_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(LavenderPokeCenter1F_MapScriptHeader), LavenderPokeCenter1F_MapScriptHeader
	dw LavenderPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x96260

LavenderPokeCenter2FBeta_SecondMapHeader: ; 0x96260
	db $0 ; border block
	db LAVENDER_POKECENTER_2F_BETA_HEIGHT, LAVENDER_POKECENTER_2F_BETA_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(LavenderPokeCenter2FBeta_MapScriptHeader), LavenderPokeCenter2FBeta_MapScriptHeader
	dw LavenderPokeCenter2FBeta_MapEventHeader

	db 0 ; connections
; 0x9626c

MrFujisHouse_SecondMapHeader: ; 0x9626c
	db $0 ; border block
	db MR_FUJIS_HOUSE_HEIGHT, MR_FUJIS_HOUSE_WIDTH
	dbw BANK(MrFujisHouse_BlockData), MrFujisHouse_BlockData
	dbw BANK(MrFujisHouse_MapScriptHeader), MrFujisHouse_MapScriptHeader
	dw MrFujisHouse_MapEventHeader

	db 0 ; connections
; 0x96278

LavenderTownSpeechHouse_SecondMapHeader: ; 0x96278
	db $0 ; border block
	db LAVENDER_TOWN_SPEECH_HOUSE_HEIGHT, LAVENDER_TOWN_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(LavenderTownSpeechHouse_MapScriptHeader), LavenderTownSpeechHouse_MapScriptHeader
	dw LavenderTownSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x96284

LavenderNameRater_SecondMapHeader: ; 0x96284
	db $0 ; border block
	db LAVENDER_NAME_RATER_HEIGHT, LAVENDER_NAME_RATER_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(LavenderNameRater_MapScriptHeader), LavenderNameRater_MapScriptHeader
	dw LavenderNameRater_MapEventHeader

	db 0 ; connections
; 0x96290

LavenderMart_SecondMapHeader: ; 0x96290
	db $0 ; border block
	db LAVENDER_MART_HEIGHT, LAVENDER_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(LavenderMart_MapScriptHeader), LavenderMart_MapScriptHeader
	dw LavenderMart_MapEventHeader

	db 0 ; connections
; 0x9629c

SoulHouse_SecondMapHeader: ; 0x9629c
	db $0 ; border block
	db SOUL_HOUSE_HEIGHT, SOUL_HOUSE_WIDTH
	dbw BANK(SoulHouse_BlockData), SoulHouse_BlockData
	dbw BANK(SoulHouse_MapScriptHeader), SoulHouse_MapScriptHeader
	dw SoulHouse_MapEventHeader

	db 0 ; connections
; 0x962a8

LavRadioTower1F_SecondMapHeader: ; 0x962a8
	db $0 ; border block
	db LAV_RADIO_TOWER_1F_HEIGHT, LAV_RADIO_TOWER_1F_WIDTH
	dbw BANK(LavRadioTower1F_BlockData), LavRadioTower1F_BlockData
	dbw BANK(LavRadioTower1F_MapScriptHeader), LavRadioTower1F_MapScriptHeader
	dw LavRadioTower1F_MapEventHeader

	db 0 ; connections
; 0x962b4

Route8SaffronGate_SecondMapHeader: ; 0x962b4
	db $0 ; border block
	db ROUTE_8_SAFFRON_GATE_HEIGHT, ROUTE_8_SAFFRON_GATE_WIDTH
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData
	dbw BANK(Route8SaffronGate_MapScriptHeader), Route8SaffronGate_MapScriptHeader
	dw Route8SaffronGate_MapEventHeader

	db 0 ; connections
; 0x962c0

Route12SuperRodHouse_SecondMapHeader: ; 0x962c0
	db $0 ; border block
	db ROUTE_12_SUPER_ROD_HOUSE_HEIGHT, ROUTE_12_SUPER_ROD_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(Route12SuperRodHouse_MapScriptHeader), Route12SuperRodHouse_MapScriptHeader
	dw Route12SuperRodHouse_MapEventHeader

	db 0 ; connections
; 0x962cc

SilverCavePokeCenter1F_SecondMapHeader: ; 0x962cc
	db $0 ; border block
	db SILVER_CAVE_POKECENTER_1F_HEIGHT, SILVER_CAVE_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(SilverCavePokeCenter1F_MapScriptHeader), SilverCavePokeCenter1F_MapScriptHeader
	dw SilverCavePokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x962d8

Route28FamousSpeechHouse_SecondMapHeader: ; 0x962d8
	db $0 ; border block
	db ROUTE_28_FAMOUS_SPEECH_HOUSE_HEIGHT, ROUTE_28_FAMOUS_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(Route28FamousSpeechHouse_MapScriptHeader), Route28FamousSpeechHouse_MapScriptHeader
	dw Route28FamousSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x962e4

PokeCenter2F_SecondMapHeader: ; 0x962e4
	db $0 ; border block
	db POKECENTER_2F_HEIGHT, POKECENTER_2F_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(PokeCenter2F_MapScriptHeader), PokeCenter2F_MapScriptHeader
	dw PokeCenter2F_MapEventHeader

	db 0 ; connections
; 0x962f0

TradeCenter_SecondMapHeader: ; 0x962f0
	db $0 ; border block
	db TRADE_CENTER_HEIGHT, TRADE_CENTER_WIDTH
	dbw BANK(TradeCenter_BlockData), TradeCenter_BlockData
	dbw BANK(TradeCenter_MapScriptHeader), TradeCenter_MapScriptHeader
	dw TradeCenter_MapEventHeader

	db 0 ; connections
; 0x962fc

Colosseum_SecondMapHeader: ; 0x962fc
	db $0 ; border block
	db COLOSSEUM_HEIGHT, COLOSSEUM_WIDTH
	dbw BANK(Colosseum_BlockData), Colosseum_BlockData
	dbw BANK(Colosseum_MapScriptHeader), Colosseum_MapScriptHeader
	dw Colosseum_MapEventHeader

	db 0 ; connections
; 0x96308

TimeCapsule_SecondMapHeader: ; 0x96308
	db $0 ; border block
	db TIME_CAPSULE_HEIGHT, TIME_CAPSULE_WIDTH
	dbw BANK(TradeCenter_BlockData), TradeCenter_BlockData
	dbw BANK(TimeCapsule_MapScriptHeader), TimeCapsule_MapScriptHeader
	dw TimeCapsule_MapEventHeader

	db 0 ; connections
; 0x96314

MobileTradeRoomMobile_SecondMapHeader: ; 0x96314
	db $0 ; border block
	db MOBILE_TRADE_ROOM_MOBILE_HEIGHT, MOBILE_TRADE_ROOM_MOBILE_WIDTH
	dbw BANK(MobileTradeRoomMobile_BlockData), MobileTradeRoomMobile_BlockData
	dbw BANK(MobileTradeRoomMobile_MapScriptHeader), MobileTradeRoomMobile_MapScriptHeader
	dw MobileTradeRoomMobile_MapEventHeader

	db 0 ; connections
; 0x96320

MobileBattleRoom_SecondMapHeader: ; 0x96320
	db $0 ; border block
	db MOBILE_BATTLE_ROOM_HEIGHT, MOBILE_BATTLE_ROOM_WIDTH
	dbw BANK(MobileBattleRoom_BlockData), MobileBattleRoom_BlockData
	dbw BANK(MobileBattleRoom_MapScriptHeader), MobileBattleRoom_MapScriptHeader
	dw MobileBattleRoom_MapEventHeader

	db 0 ; connections
; 0x9632c

CeladonDeptStore1F_SecondMapHeader: ; 0x9632c
	db $0 ; border block
	db CELADON_DEPT_STORE_1F_HEIGHT, CELADON_DEPT_STORE_1F_WIDTH
	dbw BANK(GoldenrodDeptStore1F_BlockData), GoldenrodDeptStore1F_BlockData
	dbw BANK(CeladonDeptStore1F_MapScriptHeader), CeladonDeptStore1F_MapScriptHeader
	dw CeladonDeptStore1F_MapEventHeader

	db 0 ; connections
; 0x96338

CeladonDeptStore2F_SecondMapHeader: ; 0x96338
	db $0 ; border block
	db CELADON_DEPT_STORE_2F_HEIGHT, CELADON_DEPT_STORE_2F_WIDTH
	dbw BANK(GoldenrodDeptStore2F_BlockData), GoldenrodDeptStore2F_BlockData
	dbw BANK(CeladonDeptStore2F_MapScriptHeader), CeladonDeptStore2F_MapScriptHeader
	dw CeladonDeptStore2F_MapEventHeader

	db 0 ; connections
; 0x96344

CeladonDeptStore3F_SecondMapHeader: ; 0x96344
	db $0 ; border block
	db CELADON_DEPT_STORE_3F_HEIGHT, CELADON_DEPT_STORE_3F_WIDTH
	dbw BANK(GoldenrodDeptStore3F_BlockData), GoldenrodDeptStore3F_BlockData
	dbw BANK(CeladonDeptStore3F_MapScriptHeader), CeladonDeptStore3F_MapScriptHeader
	dw CeladonDeptStore3F_MapEventHeader

	db 0 ; connections
; 0x96350

CeladonDeptStore4F_SecondMapHeader: ; 0x96350
	db $0 ; border block
	db CELADON_DEPT_STORE_4F_HEIGHT, CELADON_DEPT_STORE_4F_WIDTH
	dbw BANK(GoldenrodDeptStore4F_BlockData), GoldenrodDeptStore4F_BlockData
	dbw BANK(CeladonDeptStore4F_MapScriptHeader), CeladonDeptStore4F_MapScriptHeader
	dw CeladonDeptStore4F_MapEventHeader

	db 0 ; connections
; 0x9635c

CeladonDeptStore5F_SecondMapHeader: ; 0x9635c
	db $0 ; border block
	db CELADON_DEPT_STORE_5F_HEIGHT, CELADON_DEPT_STORE_5F_WIDTH
	dbw BANK(GoldenrodDeptStore5F_BlockData), GoldenrodDeptStore5F_BlockData
	dbw BANK(CeladonDeptStore5F_MapScriptHeader), CeladonDeptStore5F_MapScriptHeader
	dw CeladonDeptStore5F_MapEventHeader

	db 0 ; connections
; 0x96368

CeladonDeptStore6F_SecondMapHeader: ; 0x96368
	db $0 ; border block
	db CELADON_DEPT_STORE_6F_HEIGHT, CELADON_DEPT_STORE_6F_WIDTH
	dbw BANK(GoldenrodDeptStore6F_BlockData), GoldenrodDeptStore6F_BlockData
	dbw BANK(CeladonDeptStore6F_MapScriptHeader), CeladonDeptStore6F_MapScriptHeader
	dw CeladonDeptStore6F_MapEventHeader

	db 0 ; connections
; 0x96374

CeladonDeptStoreElevator_SecondMapHeader: ; 0x96374
	db $0 ; border block
	db CELADON_DEPT_STORE_ELEVATOR_HEIGHT, CELADON_DEPT_STORE_ELEVATOR_WIDTH
	dbw BANK(GoldenrodDeptStoreElevator_BlockData), GoldenrodDeptStoreElevator_BlockData
	dbw BANK(CeladonDeptStoreElevator_MapScriptHeader), CeladonDeptStoreElevator_MapScriptHeader
	dw CeladonDeptStoreElevator_MapEventHeader

	db 0 ; connections
; 0x96380

CeladonMansion1F_SecondMapHeader: ; 0x96380
	db $0 ; border block
	db CELADON_MANSION_1F_HEIGHT, CELADON_MANSION_1F_WIDTH
	dbw BANK(CeladonMansion1F_BlockData), CeladonMansion1F_BlockData
	dbw BANK(CeladonMansion1F_MapScriptHeader), CeladonMansion1F_MapScriptHeader
	dw CeladonMansion1F_MapEventHeader

	db 0 ; connections
; 0x9638c

CeladonMansion2F_SecondMapHeader: ; 0x9638c
	db $0 ; border block
	db CELADON_MANSION_2F_HEIGHT, CELADON_MANSION_2F_WIDTH
	dbw BANK(CeladonMansion2F_BlockData), CeladonMansion2F_BlockData
	dbw BANK(CeladonMansion2F_MapScriptHeader), CeladonMansion2F_MapScriptHeader
	dw CeladonMansion2F_MapEventHeader

	db 0 ; connections
; 0x96398

CeladonMansion3F_SecondMapHeader: ; 0x96398
	db $0 ; border block
	db CELADON_MANSION_3F_HEIGHT, CELADON_MANSION_3F_WIDTH
	dbw BANK(CeladonMansion3F_BlockData), CeladonMansion3F_BlockData
	dbw BANK(CeladonMansion3F_MapScriptHeader), CeladonMansion3F_MapScriptHeader
	dw CeladonMansion3F_MapEventHeader

	db 0 ; connections
; 0x963a4

CeladonMansionRoof_SecondMapHeader: ; 0x963a4
	db $1 ; border block
	db CELADON_MANSION_ROOF_HEIGHT, CELADON_MANSION_ROOF_WIDTH
	dbw BANK(CeladonMansionRoof_BlockData), CeladonMansionRoof_BlockData
	dbw BANK(CeladonMansionRoof_MapScriptHeader), CeladonMansionRoof_MapScriptHeader
	dw CeladonMansionRoof_MapEventHeader

	db 0 ; connections
; 0x963b0

CeladonMansionRoofHouse_SecondMapHeader: ; 0x963b0
	db $0 ; border block
	db CELADON_MANSION_ROOF_HOUSE_HEIGHT, CELADON_MANSION_ROOF_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(CeladonMansionRoofHouse_MapScriptHeader), CeladonMansionRoofHouse_MapScriptHeader
	dw CeladonMansionRoofHouse_MapEventHeader

	db 0 ; connections
; 0x963bc

CeladonPokeCenter1F_SecondMapHeader: ; 0x963bc
	db $0 ; border block
	db CELADON_POKECENTER_1F_HEIGHT, CELADON_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(CeladonPokeCenter1F_MapScriptHeader), CeladonPokeCenter1F_MapScriptHeader
	dw CeladonPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x963c8

CeladonPokeCenter2FBeta_SecondMapHeader: ; 0x963c8
	db $0 ; border block
	db CELADON_POKECENTER_2F_BETA_HEIGHT, CELADON_POKECENTER_2F_BETA_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(CeladonPokeCenter2FBeta_MapScriptHeader), CeladonPokeCenter2FBeta_MapScriptHeader
	dw CeladonPokeCenter2FBeta_MapEventHeader

	db 0 ; connections
; 0x963d4

CeladonGameCorner_SecondMapHeader: ; 0x963d4
	db $0 ; border block
	db CELADON_GAME_CORNER_HEIGHT, CELADON_GAME_CORNER_WIDTH
	dbw BANK(CeladonGameCorner_BlockData), CeladonGameCorner_BlockData
	dbw BANK(CeladonGameCorner_MapScriptHeader), CeladonGameCorner_MapScriptHeader
	dw CeladonGameCorner_MapEventHeader

	db 0 ; connections
; 0x963e0

CeladonGameCornerPrizeRoom_SecondMapHeader: ; 0x963e0
	db $0 ; border block
	db CELADON_GAME_CORNER_PRIZE_ROOM_HEIGHT, CELADON_GAME_CORNER_PRIZE_ROOM_WIDTH
	dbw BANK(CeladonGameCornerPrizeRoom_BlockData), CeladonGameCornerPrizeRoom_BlockData
	dbw BANK(CeladonGameCornerPrizeRoom_MapScriptHeader), CeladonGameCornerPrizeRoom_MapScriptHeader
	dw CeladonGameCornerPrizeRoom_MapEventHeader

	db 0 ; connections
; 0x963ec

CeladonGym_SecondMapHeader: ; 0x963ec
	db $0 ; border block
	db CELADON_GYM_HEIGHT, CELADON_GYM_WIDTH
	dbw BANK(CeladonGym_BlockData), CeladonGym_BlockData
	dbw BANK(CeladonGym_MapScriptHeader), CeladonGym_MapScriptHeader
	dw CeladonGym_MapEventHeader

	db 0 ; connections
; 0x963f8

CeladonCafe_SecondMapHeader: ; 0x963f8
	db $0 ; border block
	db CELADON_CAFE_HEIGHT, CELADON_CAFE_WIDTH
	dbw BANK(CeladonCafe_BlockData), CeladonCafe_BlockData
	dbw BANK(CeladonCafe_MapScriptHeader), CeladonCafe_MapScriptHeader
	dw CeladonCafe_MapEventHeader

	db 0 ; connections
; 0x96404

Route16FuchsiaSpeechHouse_SecondMapHeader: ; 0x96404
	db $0 ; border block
	db ROUTE_16_FUCHSIA_SPEECH_HOUSE_HEIGHT, ROUTE_16_FUCHSIA_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(Route16FuchsiaSpeechHouse_MapScriptHeader), Route16FuchsiaSpeechHouse_MapScriptHeader
	dw Route16FuchsiaSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x96410

Route16Gate_SecondMapHeader: ; 0x96410
	db $0 ; border block
	db ROUTE_16_GATE_HEIGHT, ROUTE_16_GATE_WIDTH
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData
	dbw BANK(Route16Gate_MapScriptHeader), Route16Gate_MapScriptHeader
	dw Route16Gate_MapEventHeader

	db 0 ; connections
; 0x9641c

Route7SaffronGate_SecondMapHeader: ; 0x9641c
	db $0 ; border block
	db ROUTE_7_SAFFRON_GATE_HEIGHT, ROUTE_7_SAFFRON_GATE_WIDTH
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData
	dbw BANK(Route7SaffronGate_MapScriptHeader), Route7SaffronGate_MapScriptHeader
	dw Route7SaffronGate_MapEventHeader

	db 0 ; connections
; 0x96428

Route1718Gate_SecondMapHeader: ; 0x96428
	db $0 ; border block
	db ROUTE_17_18_GATE_HEIGHT, ROUTE_17_18_GATE_WIDTH
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData
	dbw BANK(Route1718Gate_MapScriptHeader), Route1718Gate_MapScriptHeader
	dw Route1718Gate_MapEventHeader

	db 0 ; connections
; 0x96434

ManiasHouse_SecondMapHeader: ; 0x96434
	db $0 ; border block
	db MANIAS_HOUSE_HEIGHT, MANIAS_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(ManiasHouse_MapScriptHeader), ManiasHouse_MapScriptHeader
	dw ManiasHouse_MapEventHeader

	db 0 ; connections
; 0x96440

CianwoodGym_SecondMapHeader: ; 0x96440
	db $0 ; border block
	db CIANWOOD_GYM_HEIGHT, CIANWOOD_GYM_WIDTH
	dbw BANK(CianwoodGym_BlockData), CianwoodGym_BlockData
	dbw BANK(CianwoodGym_MapScriptHeader), CianwoodGym_MapScriptHeader
	dw CianwoodGym_MapEventHeader

	db 0 ; connections
; 0x9644c

CianwoodPokeCenter1F_SecondMapHeader: ; 0x9644c
	db $0 ; border block
	db CIANWOOD_POKECENTER_1F_HEIGHT, CIANWOOD_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(CianwoodPokeCenter1F_MapScriptHeader), CianwoodPokeCenter1F_MapScriptHeader
	dw CianwoodPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x96458

CianwoodPharmacy_SecondMapHeader: ; 0x96458
	db $0 ; border block
	db CIANWOOD_PHARMACY_HEIGHT, CIANWOOD_PHARMACY_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(CianwoodPharmacy_MapScriptHeader), CianwoodPharmacy_MapScriptHeader
	dw CianwoodPharmacy_MapEventHeader

	db 0 ; connections
; 0x96464

CianwoodCityPhotoStudio_SecondMapHeader: ; 0x96464
	db $0 ; border block
	db CIANWOOD_CITY_PHOTO_STUDIO_HEIGHT, CIANWOOD_CITY_PHOTO_STUDIO_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(CianwoodCityPhotoStudio_MapScriptHeader), CianwoodCityPhotoStudio_MapScriptHeader
	dw CianwoodCityPhotoStudio_MapEventHeader

	db 0 ; connections
; 0x96470

CianwoodLugiaSpeechHouse_SecondMapHeader: ; 0x96470
	db $0 ; border block
	db CIANWOOD_LUGIA_SPEECH_HOUSE_HEIGHT, CIANWOOD_LUGIA_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(CianwoodLugiaSpeechHouse_MapScriptHeader), CianwoodLugiaSpeechHouse_MapScriptHeader
	dw CianwoodLugiaSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x9647c

PokeSeersHouse_SecondMapHeader: ; 0x9647c
	db $0 ; border block
	db POKE_SEERS_HOUSE_HEIGHT, POKE_SEERS_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(PokeSeersHouse_MapScriptHeader), PokeSeersHouse_MapScriptHeader
	dw PokeSeersHouse_MapEventHeader

	db 0 ; connections
; 0x96488

BattleTower1F_SecondMapHeader: ; 0x96488
	db $0 ; border block
	db BATTLE_TOWER_1F_HEIGHT, BATTLE_TOWER_1F_WIDTH
	dbw BANK(BattleTower1F_BlockData), BattleTower1F_BlockData
	dbw BANK(BattleTower1F_MapScriptHeader), BattleTower1F_MapScriptHeader
	dw BattleTower1F_MapEventHeader

	db 0 ; connections
; 0x96494

BattleTowerBattleRoom_SecondMapHeader: ; 0x96494
	db $0 ; border block
	db BATTLE_TOWER_BATTLE_ROOM_HEIGHT, BATTLE_TOWER_BATTLE_ROOM_WIDTH
	dbw BANK(BattleTowerBattleRoom_BlockData), BattleTowerBattleRoom_BlockData
	dbw BANK(BattleTowerBattleRoom_MapScriptHeader), BattleTowerBattleRoom_MapScriptHeader
	dw BattleTowerBattleRoom_MapEventHeader

	db 0 ; connections
; 0x964a0

BattleTowerElevator_SecondMapHeader: ; 0x964a0
	db $0 ; border block
	db BATTLE_TOWER_ELEVATOR_HEIGHT, BATTLE_TOWER_ELEVATOR_WIDTH
	dbw BANK(BattleTowerElevator_BlockData), BattleTowerElevator_BlockData
	dbw BANK(BattleTowerElevator_MapScriptHeader), BattleTowerElevator_MapScriptHeader
	dw BattleTowerElevator_MapEventHeader

	db 0 ; connections
; 0x964ac

BattleTowerHallway_SecondMapHeader: ; 0x964ac
	db $0 ; border block
	db BATTLE_TOWER_HALLWAY_HEIGHT, BATTLE_TOWER_HALLWAY_WIDTH
	dbw BANK(BattleTowerHallway_BlockData), BattleTowerHallway_BlockData
	dbw BANK(BattleTowerHallway_MapScriptHeader), BattleTowerHallway_MapScriptHeader
	dw BattleTowerHallway_MapEventHeader

	db 0 ; connections
; 0x964b8

Route40BattleTowerGate_SecondMapHeader: ; 0x964b8
	db $0 ; border block
	db ROUTE_40_BATTLE_TOWER_GATE_HEIGHT, ROUTE_40_BATTLE_TOWER_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route40BattleTowerGate_MapScriptHeader), Route40BattleTowerGate_MapScriptHeader
	dw Route40BattleTowerGate_MapEventHeader

	db 0 ; connections
; 0x964c4

BattleTowerOutside_SecondMapHeader: ; 0x964c4
	db $5 ; border block
	db BATTLE_TOWER_OUTSIDE_HEIGHT, BATTLE_TOWER_OUTSIDE_WIDTH
	dbw BANK(BattleTowerOutside_BlockData), BattleTowerOutside_BlockData
	dbw BANK(BattleTowerOutside_MapScriptHeader), BattleTowerOutside_MapScriptHeader
	dw BattleTowerOutside_MapEventHeader

	db 0 ; connections
; 0x964d0

ViridianGym_SecondMapHeader: ; 0x964d0
	db $0 ; border block
	db VIRIDIAN_GYM_HEIGHT, VIRIDIAN_GYM_WIDTH
	dbw BANK(ViridianGym_BlockData), ViridianGym_BlockData
	dbw BANK(ViridianGym_MapScriptHeader), ViridianGym_MapScriptHeader
	dw ViridianGym_MapEventHeader

	db 0 ; connections
; 0x964dc

ViridianNicknameSpeechHouse_SecondMapHeader: ; 0x964dc
	db $0 ; border block
	db VIRIDIAN_NICKNAME_SPEECH_HOUSE_HEIGHT, VIRIDIAN_NICKNAME_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(ViridianNicknameSpeechHouse_MapScriptHeader), ViridianNicknameSpeechHouse_MapScriptHeader
	dw ViridianNicknameSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x964e8

TrainerHouse1F_SecondMapHeader: ; 0x964e8
	db $0 ; border block
	db TRAINER_HOUSE_1F_HEIGHT, TRAINER_HOUSE_1F_WIDTH
	dbw BANK(TrainerHouse1F_BlockData), TrainerHouse1F_BlockData
	dbw BANK(TrainerHouse1F_MapScriptHeader), TrainerHouse1F_MapScriptHeader
	dw TrainerHouse1F_MapEventHeader

	db 0 ; connections
; 0x964f4

TrainerHouseB1F_SecondMapHeader: ; 0x964f4
	db $0 ; border block
	db TRAINER_HOUSE_B1F_HEIGHT, TRAINER_HOUSE_B1F_WIDTH
	dbw BANK(TrainerHouseB1F_BlockData), TrainerHouseB1F_BlockData
	dbw BANK(TrainerHouseB1F_MapScriptHeader), TrainerHouseB1F_MapScriptHeader
	dw TrainerHouseB1F_MapEventHeader

	db 0 ; connections
; 0x96500

ViridianMart_SecondMapHeader: ; 0x96500
	db $0 ; border block
	db VIRIDIAN_MART_HEIGHT, VIRIDIAN_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(ViridianMart_MapScriptHeader), ViridianMart_MapScriptHeader
	dw ViridianMart_MapEventHeader

	db 0 ; connections
; 0x9650c

ViridianPokeCenter1F_SecondMapHeader: ; 0x9650c
	db $0 ; border block
	db VIRIDIAN_POKECENTER_1F_HEIGHT, VIRIDIAN_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(ViridianPokeCenter1F_MapScriptHeader), ViridianPokeCenter1F_MapScriptHeader
	dw ViridianPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x96518

ViridianPokeCenter2FBeta_SecondMapHeader: ; 0x96518
	db $0 ; border block
	db VIRIDIAN_POKECENTER_2F_BETA_HEIGHT, VIRIDIAN_POKECENTER_2F_BETA_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(ViridianPokeCenter2FBeta_MapScriptHeader), ViridianPokeCenter2FBeta_MapScriptHeader
	dw ViridianPokeCenter2FBeta_MapEventHeader

	db 0 ; connections
; 0x96524

Route2NuggetSpeechHouse_SecondMapHeader: ; 0x96524
	db $0 ; border block
	db ROUTE_2_NUGGET_SPEECH_HOUSE_HEIGHT, ROUTE_2_NUGGET_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(Route2NuggetSpeechHouse_MapScriptHeader), Route2NuggetSpeechHouse_MapScriptHeader
	dw Route2NuggetSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x96530

Route2Gate_SecondMapHeader: ; 0x96530
	db $0 ; border block
	db ROUTE_2_GATE_HEIGHT, ROUTE_2_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route2Gate_MapScriptHeader), Route2Gate_MapScriptHeader
	dw Route2Gate_MapEventHeader

	db 0 ; connections
; 0x9653c

VictoryRoadGate_SecondMapHeader: ; 0x9653c
	db $0 ; border block
	db VICTORY_ROAD_GATE_HEIGHT, VICTORY_ROAD_GATE_WIDTH
	dbw BANK(VictoryRoadGate_BlockData), VictoryRoadGate_BlockData
	dbw BANK(VictoryRoadGate_MapScriptHeader), VictoryRoadGate_MapScriptHeader
	dw VictoryRoadGate_MapEventHeader

	db 0 ; connections
; 0x96548

ElmsLab_SecondMapHeader: ; 0x96548
	db $0 ; border block
	db ELMS_LAB_HEIGHT, ELMS_LAB_WIDTH
	dbw BANK(ElmsLab_BlockData), ElmsLab_BlockData
	dbw BANK(ElmsLab_MapScriptHeader), ElmsLab_MapScriptHeader
	dw ElmsLab_MapEventHeader

	db 0 ; connections
; 0x96554

KrissHouse1F_SecondMapHeader: ; 0x96554
	db $0 ; border block
	db KRISS_HOUSE_1F_HEIGHT, KRISS_HOUSE_1F_WIDTH
	dbw BANK(KrissHouse1F_BlockData), KrissHouse1F_BlockData
	dbw BANK(KrissHouse1F_MapScriptHeader), KrissHouse1F_MapScriptHeader
	dw KrissHouse1F_MapEventHeader

	db 0 ; connections
; 0x96560

KrissHouse2F_SecondMapHeader: ; 0x96560
	db $0 ; border block
	db KRISS_HOUSE_2F_HEIGHT, KRISS_HOUSE_2F_WIDTH
	dbw BANK(KrissHouse2F_BlockData), KrissHouse2F_BlockData
	dbw BANK(KrissHouse2F_MapScriptHeader), KrissHouse2F_MapScriptHeader
	dw KrissHouse2F_MapEventHeader

	db 0 ; connections
; 0x9656c

KrissNeighborsHouse_SecondMapHeader: ; 0x9656c
	db $0 ; border block
	db KRISS_NEIGHBORS_HOUSE_HEIGHT, KRISS_NEIGHBORS_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(KrissNeighborsHouse_MapScriptHeader), KrissNeighborsHouse_MapScriptHeader
	dw KrissNeighborsHouse_MapEventHeader

	db 0 ; connections
; 0x96578

ElmsHouse_SecondMapHeader: ; 0x96578
	db $0 ; border block
	db ELMS_HOUSE_HEIGHT, ELMS_HOUSE_WIDTH
	dbw BANK(ElmsHouse_BlockData), ElmsHouse_BlockData
	dbw BANK(ElmsHouse_MapScriptHeader), ElmsHouse_MapScriptHeader
	dw ElmsHouse_MapEventHeader

	db 0 ; connections
; 0x96584

Route26HealSpeechHouse_SecondMapHeader: ; 0x96584
	db $0 ; border block
	db ROUTE_26_HEAL_SPEECH_HOUSE_HEIGHT, ROUTE_26_HEAL_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(Route26HealSpeechHouse_MapScriptHeader), Route26HealSpeechHouse_MapScriptHeader
	dw Route26HealSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x96590

Route26DayofWeekSiblingsHouse_SecondMapHeader: ; 0x96590
	db $0 ; border block
	db ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE_HEIGHT, ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(Route26DayofWeekSiblingsHouse_MapScriptHeader), Route26DayofWeekSiblingsHouse_MapScriptHeader
	dw Route26DayofWeekSiblingsHouse_MapEventHeader

	db 0 ; connections
; 0x9659c

Route27SandstormHouse_SecondMapHeader: ; 0x9659c
	db $0 ; border block
	db ROUTE_27_SANDSTORM_HOUSE_HEIGHT, ROUTE_27_SANDSTORM_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(Route27SandstormHouse_MapScriptHeader), Route27SandstormHouse_MapScriptHeader
	dw Route27SandstormHouse_MapEventHeader

	db 0 ; connections
; 0x965a8

Route2946Gate_SecondMapHeader: ; 0x965a8
	db $0 ; border block
	db ROUTE_29_46_GATE_HEIGHT, ROUTE_29_46_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route2946Gate_MapScriptHeader), Route2946Gate_MapScriptHeader
	dw Route2946Gate_MapEventHeader

	db 0 ; connections
; 0x965b4

FightingDojo_SecondMapHeader: ; 0x965b4
	db $0 ; border block
	db FIGHTING_DOJO_HEIGHT, FIGHTING_DOJO_WIDTH
	dbw BANK(FightingDojo_BlockData), FightingDojo_BlockData
	dbw BANK(FightingDojo_MapScriptHeader), FightingDojo_MapScriptHeader
	dw FightingDojo_MapEventHeader

	db 0 ; connections
; 0x965c0

SaffronGym_SecondMapHeader: ; 0x965c0
	db $0 ; border block
	db SAFFRON_GYM_HEIGHT, SAFFRON_GYM_WIDTH
	dbw BANK(SaffronGym_BlockData), SaffronGym_BlockData
	dbw BANK(SaffronGym_MapScriptHeader), SaffronGym_MapScriptHeader
	dw SaffronGym_MapEventHeader

	db 0 ; connections
; 0x965cc

SaffronMart_SecondMapHeader: ; 0x965cc
	db $0 ; border block
	db SAFFRON_MART_HEIGHT, SAFFRON_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(SaffronMart_MapScriptHeader), SaffronMart_MapScriptHeader
	dw SaffronMart_MapEventHeader

	db 0 ; connections
; 0x965d8

SaffronPokeCenter1F_SecondMapHeader: ; 0x965d8
	db $0 ; border block
	db SAFFRON_POKECENTER_1F_HEIGHT, SAFFRON_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(SaffronPokeCenter1F_MapScriptHeader), SaffronPokeCenter1F_MapScriptHeader
	dw SaffronPokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x965e4

SaffronPokeCenter2FBeta_SecondMapHeader: ; 0x965e4
	db $0 ; border block
	db SAFFRON_POKECENTER_2F_BETA_HEIGHT, SAFFRON_POKECENTER_2F_BETA_WIDTH
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData
	dbw BANK(SaffronPokeCenter2FBeta_MapScriptHeader), SaffronPokeCenter2FBeta_MapScriptHeader
	dw SaffronPokeCenter2FBeta_MapEventHeader

	db 0 ; connections
; 0x965f0

MrPsychicsHouse_SecondMapHeader: ; 0x965f0
	db $0 ; border block
	db MR_PSYCHICS_HOUSE_HEIGHT, MR_PSYCHICS_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(MrPsychicsHouse_MapScriptHeader), MrPsychicsHouse_MapScriptHeader
	dw MrPsychicsHouse_MapEventHeader

	db 0 ; connections
; 0x965fc

SaffronTrainStation_SecondMapHeader: ; 0x965fc
	db $0 ; border block
	db SAFFRON_TRAIN_STATION_HEIGHT, SAFFRON_TRAIN_STATION_WIDTH
	dbw BANK(SaffronTrainStation_BlockData), SaffronTrainStation_BlockData
	dbw BANK(SaffronTrainStation_MapScriptHeader), SaffronTrainStation_MapScriptHeader
	dw SaffronTrainStation_MapEventHeader

	db 0 ; connections
; 0x96608

SilphCo1F_SecondMapHeader: ; 0x96608
	db $0 ; border block
	db SILPH_CO_1F_HEIGHT, SILPH_CO_1F_WIDTH
	dbw BANK(SilphCo1F_BlockData), SilphCo1F_BlockData
	dbw BANK(SilphCo1F_MapScriptHeader), SilphCo1F_MapScriptHeader
	dw SilphCo1F_MapEventHeader

	db 0 ; connections
; 0x96614

CopycatsHouse1F_SecondMapHeader: ; 0x96614
	db $0 ; border block
	db COPYCATS_HOUSE_1F_HEIGHT, COPYCATS_HOUSE_1F_WIDTH
	dbw BANK(CopycatsHouse1F_BlockData), CopycatsHouse1F_BlockData
	dbw BANK(CopycatsHouse1F_MapScriptHeader), CopycatsHouse1F_MapScriptHeader
	dw CopycatsHouse1F_MapEventHeader

	db 0 ; connections
; 0x96620

CopycatsHouse2F_SecondMapHeader: ; 0x96620
	db $0 ; border block
	db COPYCATS_HOUSE_2F_HEIGHT, COPYCATS_HOUSE_2F_WIDTH
	dbw BANK(CopycatsHouse2F_BlockData), CopycatsHouse2F_BlockData
	dbw BANK(CopycatsHouse2F_MapScriptHeader), CopycatsHouse2F_MapScriptHeader
	dw CopycatsHouse2F_MapEventHeader

	db 0 ; connections
; 0x9662c

Route5UndergroundEntrance_SecondMapHeader: ; 0x9662c
	db $0 ; border block
	db ROUTE_5_UNDERGROUND_ENTRANCE_HEIGHT, ROUTE_5_UNDERGROUND_ENTRANCE_WIDTH
	dbw BANK(Route6UndergroundEntrance_BlockData), Route6UndergroundEntrance_BlockData
	dbw BANK(Route5UndergroundEntrance_MapScriptHeader), Route5UndergroundEntrance_MapScriptHeader
	dw Route5UndergroundEntrance_MapEventHeader

	db 0 ; connections
; 0x96638

Route5SaffronCityGate_SecondMapHeader: ; 0x96638
	db $0 ; border block
	db ROUTE_5_SAFFRON_CITY_GATE_HEIGHT, ROUTE_5_SAFFRON_CITY_GATE_WIDTH
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData
	dbw BANK(Route5SaffronCityGate_MapScriptHeader), Route5SaffronCityGate_MapScriptHeader
	dw Route5SaffronCityGate_MapEventHeader

	db 0 ; connections
; 0x96644

Route5CleanseTagSpeechHouse_SecondMapHeader: ; 0x96644
	db $0 ; border block
	db ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE_HEIGHT, ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(Route5CleanseTagSpeechHouse_MapScriptHeader), Route5CleanseTagSpeechHouse_MapScriptHeader
	dw Route5CleanseTagSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x96650

CherrygroveMart_SecondMapHeader: ; 0x96650
	db $0 ; border block
	db CHERRYGROVE_MART_HEIGHT, CHERRYGROVE_MART_WIDTH
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData
	dbw BANK(CherrygroveMart_MapScriptHeader), CherrygroveMart_MapScriptHeader
	dw CherrygroveMart_MapEventHeader

	db 0 ; connections
; 0x9665c

CherrygrovePokeCenter1F_SecondMapHeader: ; 0x9665c
	db $0 ; border block
	db CHERRYGROVE_POKECENTER_1F_HEIGHT, CHERRYGROVE_POKECENTER_1F_WIDTH
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData
	dbw BANK(CherrygrovePokeCenter1F_MapScriptHeader), CherrygrovePokeCenter1F_MapScriptHeader
	dw CherrygrovePokeCenter1F_MapEventHeader

	db 0 ; connections
; 0x96668

CherrygroveGymSpeechHouse_SecondMapHeader: ; 0x96668
	db $0 ; border block
	db CHERRYGROVE_GYM_SPEECH_HOUSE_HEIGHT, CHERRYGROVE_GYM_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(CherrygroveGymSpeechHouse_MapScriptHeader), CherrygroveGymSpeechHouse_MapScriptHeader
	dw CherrygroveGymSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x96674

GuideGentsHouse_SecondMapHeader: ; 0x96674
	db $0 ; border block
	db GUIDE_GENTS_HOUSE_HEIGHT, GUIDE_GENTS_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(GuideGentsHouse_MapScriptHeader), GuideGentsHouse_MapScriptHeader
	dw GuideGentsHouse_MapEventHeader

	db 0 ; connections
; 0x96680

CherrygroveEvolutionSpeechHouse_SecondMapHeader: ; 0x96680
	db $0 ; border block
	db CHERRYGROVE_EVOLUTION_SPEECH_HOUSE_HEIGHT, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(CherrygroveEvolutionSpeechHouse_MapScriptHeader), CherrygroveEvolutionSpeechHouse_MapScriptHeader
	dw CherrygroveEvolutionSpeechHouse_MapEventHeader

	db 0 ; connections
; 0x9668c

Route30BerrySpeechHouse_SecondMapHeader: ; 0x9668c
	db $0 ; border block
	db ROUTE_30_BERRY_SPEECH_HOUSE_HEIGHT, ROUTE_30_BERRY_SPEECH_HOUSE_WIDTH
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData
	dbw BANK(Route30BerrySpeechHouse_MapScriptHeader), Route30BerrySpeechHouse_MapScriptHeader
	dw Route30BerrySpeechHouse_MapEventHeader

	db 0 ; connections
; 0x96698

MrPokemonsHouse_SecondMapHeader: ; 0x96698
	db $0 ; border block
	db MR_POKEMONS_HOUSE_HEIGHT, MR_POKEMONS_HOUSE_WIDTH
	dbw BANK(MrPokemonsHouse_BlockData), MrPokemonsHouse_BlockData
	dbw BANK(MrPokemonsHouse_MapScriptHeader), MrPokemonsHouse_MapScriptHeader
	dw MrPokemonsHouse_MapEventHeader

	db 0 ; connections
; 0x966a4

Route31VioletGate_SecondMapHeader: ; 0x966a4
	db $0 ; border block
	db ROUTE_31_VIOLET_GATE_HEIGHT, ROUTE_31_VIOLET_GATE_WIDTH
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData
	dbw BANK(Route31VioletGate_MapScriptHeader), Route31VioletGate_MapScriptHeader
	dw Route31VioletGate_MapEventHeader
	db 0 ; connections
; 0x966b0

