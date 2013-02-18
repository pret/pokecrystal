NewBarkTown_SecondMapHeader: ; 0x94dd8
	; border block
	db $5

	; height, width
	db NEW_BARK_TOWN_HEIGHT, NEW_BARK_TOWN_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(NewBarkTown_BlockData), NewBarkTown_BlockData

	; script header (bank-then-pointer)
	dbw BANK(NewBarkTown_MapScriptHeader), NewBarkTown_MapScriptHeader

	; map event header (bank-then-pointer)
	dw NewBarkTown_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Route 29
	db GROUP_ROUTE_29, MAP_ROUTE_29 ; connected map (group, id)
	dw (Route29_BlockData + ROUTE_29_WIDTH - 3) ; strip pointer
	dw $c830 ; strip destination
	db 9, ROUTE_29_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_29_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window

	; EAST to Route 27
	db GROUP_ROUTE_27, MAP_ROUTE_27 ; connected map (group, id)
	dw (Route27_BlockData) ; strip pointer
	dw $c83d ; strip destination
	db 9, ROUTE_27_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_27_WIDTH) ; window
; 0x94dfc

CherrygroveCity_SecondMapHeader: ; 0x94dfc
	; border block
	db $35

	; height, width
	db CHERRYGROVE_CITY_HEIGHT, CHERRYGROVE_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CherrygroveCity_BlockData), CherrygroveCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CherrygroveCity_MapScriptHeader), CherrygroveCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CherrygroveCity_MapEventHeader

	; connections
	db NORTH | EAST

	; NORTH to Route 30
	db GROUP_ROUTE_30, MAP_ROUTE_30 ; connected map (group, id)
	dw (Route30_BlockData + (ROUTE_30_HEIGHT * ROUTE_30_WIDTH) - (ROUTE_30_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_30_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_30_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_30_HEIGHT * 6) + (ROUTE_30_HEIGHT * ROUTE_30_WIDTH))) ; window

	; EAST to Route 29
	db GROUP_ROUTE_29, MAP_ROUTE_29 ; connected map (group, id)
	dw (Route29_BlockData) ; strip pointer
	dw $c865 ; strip destination
	db 9, ROUTE_29_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_29_WIDTH) ; window
; 0x94e20

VioletCity_SecondMapHeader: ; 0x94e20
	; border block
	db $5

	; height, width
	db VIOLET_CITY_HEIGHT, VIOLET_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(VioletCity_BlockData), VioletCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VioletCity_MapScriptHeader), VioletCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VioletCity_MapEventHeader

	; connections
	db SOUTH | WEST | EAST

	; SOUTH to Route 32
	db GROUP_ROUTE_32, MAP_ROUTE_32 ; connected map (group, id)
	dw (Route32_BlockData) ; strip pointer
	dw ($C703 + 256 + ((VIOLET_CITY_HEIGHT + 3) * (VIOLET_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_32_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_32_WIDTH) ; window

	; WEST to Route 36
	db GROUP_ROUTE_36, MAP_ROUTE_36 ; connected map (group, id)
	dw (Route36_BlockData + ROUTE_36_WIDTH - 3) ; strip pointer
	dw $c84e ; strip destination
	db 9, ROUTE_36_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_36_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window

	; EAST to Route 31
	db GROUP_ROUTE_31, MAP_ROUTE_31 ; connected map (group, id)
	dw (Route31_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_31_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_31_WIDTH) ; window
; 0x94e50

AzaleaTown_SecondMapHeader: ; 0x94e50
	; border block
	db $5

	; height, width
	db AZALEA_TOWN_HEIGHT, AZALEA_TOWN_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(AzaleaTown_BlockData), AzaleaTown_BlockData

	; script header (bank-then-pointer)
	dbw BANK(AzaleaTown_MapScriptHeader), AzaleaTown_MapScriptHeader

	; map event header (bank-then-pointer)
	dw AzaleaTown_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Route 34
	db GROUP_ROUTE_34, MAP_ROUTE_34 ; connected map (group, id)
	dw (Route34_BlockData + (((ROUTE_34_HEIGHT - AZALEA_TOWN_HEIGHT) * ROUTE_34_WIDTH) - (ROUTE_34_WIDTH * 3) + (ROUTE_34_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, ROUTE_34_WIDTH ; (connection strip length, connected map width)
	db 36, ((ROUTE_34_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 33
	db GROUP_ROUTE_33, MAP_ROUTE_33 ; connected map (group, id)
	dw (Route33_BlockData) ; strip pointer
	dw $c865 ; strip destination
	db 9, ROUTE_33_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_33_WIDTH) ; window
; 0x94e74

CianwoodCity_SecondMapHeader: ; 0x94e74
	; border block
	db $35

	; height, width
	db CIANWOOD_CITY_HEIGHT, CIANWOOD_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CianwoodCity_BlockData), CianwoodCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CianwoodCity_MapScriptHeader), CianwoodCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CianwoodCity_MapEventHeader

	; connections
	db EAST

	; EAST to Route 41
	db GROUP_ROUTE_41, MAP_ROUTE_41 ; connected map (group, id)
	dw (Route41_BlockData) ; strip pointer
	dw $c851 ; strip destination
	db 27, ROUTE_41_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_41_WIDTH) ; window
; 0x94e8c

GoldenrodCity_SecondMapHeader: ; 0x94e8c
	; border block
	db $35

	; height, width
	db GOLDENROD_CITY_HEIGHT, GOLDENROD_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodCity_BlockData), GoldenrodCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodCity_MapScriptHeader), GoldenrodCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodCity_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Route 35
	db GROUP_ROUTE_35, MAP_ROUTE_35 ; connected map (group, id)
	dw (Route35_BlockData + (ROUTE_35_HEIGHT * ROUTE_35_WIDTH) - (ROUTE_35_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_35_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_35_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_35_HEIGHT * 6) + (ROUTE_35_HEIGHT * ROUTE_35_WIDTH))) ; window

	; SOUTH to Route 34
	db GROUP_ROUTE_34, MAP_ROUTE_34 ; connected map (group, id)
	dw (Route34_BlockData) ; strip pointer
	dw ($C703 + 261 + ((GOLDENROD_CITY_HEIGHT + 3) * (GOLDENROD_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_34_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_34_WIDTH) ; window
; 0x94eb0

OlivineCity_SecondMapHeader: ; 0x94eb0
	; border block
	db $35

	; height, width
	db OLIVINE_CITY_HEIGHT, OLIVINE_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineCity_BlockData), OlivineCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineCity_MapScriptHeader), OlivineCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineCity_MapEventHeader

	; connections
	db NORTH | WEST

	; NORTH to Route 39
	db GROUP_ROUTE_39, MAP_ROUTE_39 ; connected map (group, id)
	dw (Route39_BlockData + (ROUTE_39_HEIGHT * ROUTE_39_WIDTH) - (ROUTE_39_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_39_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_39_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_39_HEIGHT * 6) + (ROUTE_39_HEIGHT * ROUTE_39_WIDTH))) ; window

	; WEST to Route 40
	db GROUP_ROUTE_40, MAP_ROUTE_40 ; connected map (group, id)
	dw (Route40_BlockData + ROUTE_40_WIDTH - 3) ; strip pointer
	dw $c938 ; strip destination
	db 12, ROUTE_40_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_40_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window
; 0x94ed4

EcruteakCity_SecondMapHeader: ; 0x94ed4
	; border block
	db $5

	; height, width
	db ECRUTEAK_CITY_HEIGHT, ECRUTEAK_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(EcruteakCity_BlockData), EcruteakCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(EcruteakCity_MapScriptHeader), EcruteakCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw EcruteakCity_MapEventHeader

	; connections
	db SOUTH | WEST | EAST

	; SOUTH to Route 37
	db GROUP_ROUTE_37, MAP_ROUTE_37 ; connected map (group, id)
	dw (Route37_BlockData) ; strip pointer
	dw ($C703 + 261 + ((ECRUTEAK_CITY_HEIGHT + 3) * (ECRUTEAK_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_37_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_37_WIDTH) ; window

	; WEST to Route 38
	db GROUP_ROUTE_38, MAP_ROUTE_38 ; connected map (group, id)
	dw (Route38_BlockData + ROUTE_38_WIDTH - 3) ; strip pointer
	dw $c8d0 ; strip destination
	db 9, ROUTE_38_WIDTH ; (connection strip length, connected map width)
	db 246, ((ROUTE_38_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Route 42
	db GROUP_ROUTE_42, MAP_ROUTE_42 ; connected map (group, id)
	dw (Route42_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_42_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_42_WIDTH) ; window
; 0x94f04

MahoganyTown_SecondMapHeader: ; 0x94f04
	; border block
	db $71

	; height, width
	db MAHOGANY_TOWN_HEIGHT, MAHOGANY_TOWN_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MahoganyTown_BlockData), MahoganyTown_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MahoganyTown_MapScriptHeader), MahoganyTown_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MahoganyTown_MapEventHeader

	; connections
	db NORTH | WEST | EAST

	; NORTH to Route 43
	db GROUP_ROUTE_43, MAP_ROUTE_43 ; connected map (group, id)
	dw (Route43_BlockData + (ROUTE_43_HEIGHT * ROUTE_43_WIDTH) - (ROUTE_43_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_43_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_43_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_43_HEIGHT * 6) + (ROUTE_43_HEIGHT * ROUTE_43_WIDTH))) ; window

	; WEST to Route 42
	db GROUP_ROUTE_42, MAP_ROUTE_42 ; connected map (group, id)
	dw (Route42_BlockData + ROUTE_42_WIDTH - 3) ; strip pointer
	dw $c830 ; strip destination
	db 9, ROUTE_42_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_42_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window

	; EAST to Route 44
	db GROUP_ROUTE_44, MAP_ROUTE_44 ; connected map (group, id)
	dw (Route44_BlockData) ; strip pointer
	dw $c83d ; strip destination
	db 9, ROUTE_44_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_44_WIDTH) ; window
; 0x94f34

LakeofRage_SecondMapHeader: ; 0x94f34
	; border block
	db $5

	; height, width
	db LAKE_OF_RAGE_HEIGHT, LAKE_OF_RAGE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(LakeofRage_BlockData), LakeofRage_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LakeofRage_MapScriptHeader), LakeofRage_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LakeofRage_MapEventHeader

	; connections
	db SOUTH

	; SOUTH to Route 43
	db GROUP_ROUTE_43, MAP_ROUTE_43 ; connected map (group, id)
	dw (Route43_BlockData) ; strip pointer
	dw ($C703 + 261 + ((LAKE_OF_RAGE_HEIGHT + 3) * (LAKE_OF_RAGE_WIDTH + 6))) ; strip destination
	db 10, ROUTE_43_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_43_WIDTH) ; window
; 0x94f4c

BlackthornCity_SecondMapHeader: ; 0x94f4c
	; border block
	db $71

	; height, width
	db BLACKTHORN_CITY_HEIGHT, BLACKTHORN_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BlackthornCity_BlockData), BlackthornCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BlackthornCity_MapScriptHeader), BlackthornCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BlackthornCity_MapEventHeader

	; connections
	db SOUTH | WEST

	; SOUTH to Route 45
	db GROUP_ROUTE_45, MAP_ROUTE_45 ; connected map (group, id)
	dw (Route45_BlockData) ; strip pointer
	dw ($C703 + 256 + ((BLACKTHORN_CITY_HEIGHT + 3) * (BLACKTHORN_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_45_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_45_WIDTH) ; window

	; WEST to Route 44
	db GROUP_ROUTE_44, MAP_ROUTE_44 ; connected map (group, id)
	dw (Route44_BlockData + ROUTE_44_WIDTH - 3) ; strip pointer
	dw $c938 ; strip destination
	db 9, ROUTE_44_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_44_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window
; 0x94f70

SilverCaveOutside_SecondMapHeader: ; 0x94f70
	; border block
	db $2c

	; height, width
	db SILVER_CAVE_OUTSIDE_HEIGHT, SILVER_CAVE_OUTSIDE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SilverCaveOutside_BlockData), SilverCaveOutside_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SilverCaveOutside_MapScriptHeader), SilverCaveOutside_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SilverCaveOutside_MapEventHeader

	; connections
	db EAST

	; EAST to Route 28
	db GROUP_ROUTE_28, MAP_ROUTE_28 ; connected map (group, id)
	dw (Route28_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_28_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_28_WIDTH) ; window
; 0x94f88

Route26_SecondMapHeader: ; 0x94f88
	; border block
	db $5

	; height, width
	db ROUTE_26_HEIGHT, ROUTE_26_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route26_BlockData), Route26_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route26_MapScriptHeader), Route26_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route26_MapEventHeader

	; connections
	db WEST

	; WEST to Route 27
	db GROUP_ROUTE_27, MAP_ROUTE_27 ; connected map (group, id)
	dw (Route27_BlockData + ROUTE_27_WIDTH - 3) ; strip pointer
	dw $cb00 ; strip destination
	db 9, ROUTE_27_WIDTH ; (connection strip length, connected map width)
	db 166, ((ROUTE_27_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 79) ; window
; 0x94fa0

Route27_SecondMapHeader: ; 0x94fa0
	; border block
	db $35

	; height, width
	db ROUTE_27_HEIGHT, ROUTE_27_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route27_BlockData), Route27_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route27_MapScriptHeader), Route27_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route27_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to New Bark Town
	db GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN ; connected map (group, id)
	dw (NewBarkTown_BlockData + NEW_BARK_TOWN_WIDTH - 3) ; strip pointer
	dw $c88a ; strip destination
	db 9, NEW_BARK_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, ((NEW_BARK_TOWN_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 26
	db GROUP_ROUTE_26, MAP_ROUTE_26 ; connected map (group, id)
	dw (Route26_BlockData + ((ROUTE_26_HEIGHT - 12) * ROUTE_26_WIDTH)) ; strip pointer
	dw $c82b ; strip destination
	db 12, ROUTE_26_WIDTH ; (connection strip length, connected map width)
	db 90, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_26_WIDTH) ; window
; 0x94fc4

Route28_SecondMapHeader: ; 0x94fc4
	; border block
	db $2c

	; height, width
	db ROUTE_28_HEIGHT, ROUTE_28_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route28_BlockData), Route28_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route28_MapScriptHeader), Route28_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route28_MapEventHeader

	; connections
	db WEST

	; WEST to Silver Cave Outside
	db GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE ; connected map (group, id)
	dw (SilverCaveOutside_BlockData + (((SILVER_CAVE_OUTSIDE_HEIGHT - ROUTE_28_HEIGHT) * SILVER_CAVE_OUTSIDE_WIDTH) - (SILVER_CAVE_OUTSIDE_WIDTH * 3) + (SILVER_CAVE_OUTSIDE_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, SILVER_CAVE_OUTSIDE_WIDTH ; (connection strip length, connected map width)
	db 18, ((SILVER_CAVE_OUTSIDE_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x94fdc

Route29_SecondMapHeader: ; 0x94fdc
	; border block
	db $5

	; height, width
	db ROUTE_29_HEIGHT, ROUTE_29_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route29_BlockData), Route29_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route29_MapScriptHeader), Route29_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route29_MapEventHeader

	; connections
	db NORTH | WEST | EAST

	; NORTH to Route 46
	db GROUP_ROUTE_46, MAP_ROUTE_46 ; connected map (group, id)
	dw (Route46_BlockData + (ROUTE_46_HEIGHT * ROUTE_46_WIDTH) - (ROUTE_46_WIDTH * 3)) ; strip pointer
	dw ($C703 + 266) ; strip destination
	db 10, ROUTE_46_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_46_HEIGHT * 2) - 1), 236 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_46_HEIGHT * 6) + (ROUTE_46_HEIGHT * ROUTE_46_WIDTH))) ; window

	; WEST to Cherrygrove City
	db GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY ; connected map (group, id)
	dw (CherrygroveCity_BlockData + CHERRYGROVE_CITY_WIDTH - 3) ; strip pointer
	dw $c86c ; strip destination
	db 9, CHERRYGROVE_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, ((CHERRYGROVE_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to New Bark Town
	db GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN ; connected map (group, id)
	dw (NewBarkTown_BlockData) ; strip pointer
	dw $c88d ; strip destination
	db 9, NEW_BARK_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + NEW_BARK_TOWN_WIDTH) ; window
; 0x9500c

Route30_SecondMapHeader: ; 0x9500c
	; border block
	db $5

	; height, width
	db ROUTE_30_HEIGHT, ROUTE_30_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route30_BlockData), Route30_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route30_MapScriptHeader), Route30_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route30_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Route 31
	db GROUP_ROUTE_31, MAP_ROUTE_31 ; connected map (group, id)
	dw $7288 ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 13, ROUTE_31_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_31_HEIGHT * 2) - 1), 20 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_31_HEIGHT * 6) + (ROUTE_31_HEIGHT * ROUTE_31_WIDTH))) ; window

	; SOUTH to Cherrygrove City
	db GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY ; connected map (group, id)
	dw (CherrygroveCity_BlockData + ((10 - 16 + ROUTE_30_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_30_HEIGHT + 3) * (ROUTE_30_WIDTH + 6))) ; strip destination
	db 16, CHERRYGROVE_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + CHERRYGROVE_CITY_WIDTH) ; window
; 0x95030

Route31_SecondMapHeader: ; 0x95030
	; border block
	db $5

	; height, width
	db ROUTE_31_HEIGHT, ROUTE_31_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route31_BlockData), Route31_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route31_MapScriptHeader), Route31_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route31_MapEventHeader

	; connections
	db SOUTH | WEST

	; SOUTH to Route 30
	db GROUP_ROUTE_30, MAP_ROUTE_30 ; connected map (group, id)
	dw (Route30_BlockData) ; strip pointer
	dw ($C703 + 266 + ((ROUTE_31_HEIGHT + 3) * (ROUTE_31_WIDTH + 6))) ; strip destination
	db 10, ROUTE_30_WIDTH ; (connection strip length, connected map width)
	db 0, 236 ; yoffset, xoffset
	dw ($C807 + ROUTE_30_WIDTH) ; window

	; WEST to Violet City
	db GROUP_VIOLET_CITY, MAP_VIOLET_CITY ; connected map (group, id)
	dw (VioletCity_BlockData + (((VIOLET_CITY_HEIGHT - ROUTE_31_HEIGHT) * VIOLET_CITY_WIDTH) - (VIOLET_CITY_WIDTH * 3) + (VIOLET_CITY_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, VIOLET_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, ((VIOLET_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x95054

Route32_SecondMapHeader: ; 0x95054
	; border block
	db $5

	; height, width
	db ROUTE_32_HEIGHT, ROUTE_32_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route32_BlockData), Route32_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route32_MapScriptHeader), Route32_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route32_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Violet City
	db GROUP_VIOLET_CITY, MAP_VIOLET_CITY ; connected map (group, id)
	dw (VioletCity_BlockData + (VIOLET_CITY_HEIGHT * VIOLET_CITY_WIDTH) - (VIOLET_CITY_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, VIOLET_CITY_WIDTH ; (connection strip length, connected map width)
	db ((VIOLET_CITY_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((VIOLET_CITY_HEIGHT * 6) + (VIOLET_CITY_HEIGHT * VIOLET_CITY_WIDTH))) ; window

	; SOUTH to Route 33
	db GROUP_ROUTE_33, MAP_ROUTE_33 ; connected map (group, id)
	dw (Route33_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_32_HEIGHT + 3) * (ROUTE_32_WIDTH + 6))) ; strip destination
	db 10, ROUTE_33_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_33_WIDTH) ; window
; 0x95078

Route33_SecondMapHeader: ; 0x95078
	; border block
	db $5

	; height, width
	db ROUTE_33_HEIGHT, ROUTE_33_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route33_BlockData), Route33_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route33_MapScriptHeader), Route33_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route33_MapEventHeader

	; connections
	db NORTH | WEST

	; NORTH to Route 32
	db GROUP_ROUTE_32, MAP_ROUTE_32 ; connected map (group, id)
	dw (Route32_BlockData + (ROUTE_32_HEIGHT * ROUTE_32_WIDTH) - (ROUTE_32_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_32_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_32_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_32_HEIGHT * 6) + (ROUTE_32_HEIGHT * ROUTE_32_WIDTH))) ; window

	; WEST to Azalea Town
	db GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN ; connected map (group, id)
	dw (AzaleaTown_BlockData + AZALEA_TOWN_WIDTH - 3) ; strip pointer
	dw $c830 ; strip destination
	db 9, AZALEA_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, ((AZALEA_TOWN_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x9509c

Route34_SecondMapHeader: ; 0x9509c
	; border block
	db $5

	; height, width
	db ROUTE_34_HEIGHT, ROUTE_34_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route34_BlockData), Route34_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route34_MapScriptHeader), Route34_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route34_MapEventHeader

	; connections
	db NORTH | EAST

	; NORTH to Goldenrod City
	db GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY ; connected map (group, id)
	dw (GoldenrodCity_BlockData + GOLDENROD_CITY_WIDTH + 10 + (16 * GOLDENROD_CITY_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, GOLDENROD_CITY_WIDTH ; (connection strip length, connected map width)
	db ((GOLDENROD_CITY_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((GOLDENROD_CITY_HEIGHT * 6) + (GOLDENROD_CITY_HEIGHT * GOLDENROD_CITY_WIDTH))) ; window

	; EAST to Azalea Town
	db GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN ; connected map (group, id)
	dw (AzaleaTown_BlockData) ; strip pointer
	dw $c95d ; strip destination
	db 9, AZALEA_TOWN_WIDTH ; (connection strip length, connected map width)
	db 220, 0 ; yoffset, xoffset
	dw ($C807 + AZALEA_TOWN_WIDTH) ; window
; 0x950c0

Route35_SecondMapHeader: ; 0x950c0
	; border block
	db $5

	; height, width
	db ROUTE_35_HEIGHT, ROUTE_35_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route35_BlockData), Route35_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route35_MapScriptHeader), Route35_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route35_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Route 36
	db GROUP_ROUTE_36, MAP_ROUTE_36 ; connected map (group, id)
	dw (Route36_BlockData + (ROUTE_36_HEIGHT * ROUTE_36_WIDTH) - (ROUTE_36_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, ROUTE_36_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_36_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_36_HEIGHT * 6) + (ROUTE_36_HEIGHT * ROUTE_36_WIDTH))) ; window

	; SOUTH to Goldenrod City
	db GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY ; connected map (group, id)
	dw (GoldenrodCity_BlockData + ((10 - 16 + ROUTE_35_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_35_HEIGHT + 3) * (ROUTE_35_WIDTH + 6))) ; strip destination
	db 16, GOLDENROD_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + GOLDENROD_CITY_WIDTH) ; window
; 0x950e4

Route36_SecondMapHeader: ; 0x950e4
	; border block
	db $5

	; height, width
	db ROUTE_36_HEIGHT, ROUTE_36_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route36_BlockData), Route36_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route36_MapScriptHeader), Route36_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route36_MapEventHeader

	; connections
	db NORTH | SOUTH | EAST

	; NORTH to Route 37
	db GROUP_ROUTE_37, MAP_ROUTE_37 ; connected map (group, id)
	dw (Route37_BlockData + (ROUTE_37_HEIGHT * ROUTE_37_WIDTH) - (ROUTE_37_WIDTH * 3)) ; strip pointer
	dw ($C703 + 266) ; strip destination
	db 10, ROUTE_37_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_37_HEIGHT * 2) - 1), 236 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_37_HEIGHT * 6) + (ROUTE_37_HEIGHT * ROUTE_37_WIDTH))) ; window

	; SOUTH to Route 35
	db GROUP_ROUTE_35, MAP_ROUTE_35 ; connected map (group, id)
	dw (Route35_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_36_HEIGHT + 3) * (ROUTE_36_WIDTH + 6))) ; strip destination
	db 10, ROUTE_35_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_35_WIDTH) ; window

	; EAST to Violet City
	db GROUP_VIOLET_CITY, MAP_VIOLET_CITY ; connected map (group, id)
	dw (VioletCity_BlockData) ; strip pointer
	dw $c88d ; strip destination
	db 12, VIOLET_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + VIOLET_CITY_WIDTH) ; window
; 0x95114

Route37_SecondMapHeader: ; 0x95114
	; border block
	db $5

	; height, width
	db ROUTE_37_HEIGHT, ROUTE_37_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route37_BlockData), Route37_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route37_MapScriptHeader), Route37_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route37_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Ecruteak City
	db GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY ; connected map (group, id)
	dw (EcruteakCity_BlockData + ECRUTEAK_CITY_WIDTH + 10 + (16 * ECRUTEAK_CITY_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, ECRUTEAK_CITY_WIDTH ; (connection strip length, connected map width)
	db ((ECRUTEAK_CITY_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((ECRUTEAK_CITY_HEIGHT * 6) + (ECRUTEAK_CITY_HEIGHT * ECRUTEAK_CITY_WIDTH))) ; window

	; SOUTH to Route 36
	db GROUP_ROUTE_36, MAP_ROUTE_36 ; connected map (group, id)
	dw (Route36_BlockData + ((20 - 16 + ROUTE_37_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_37_HEIGHT + 3) * (ROUTE_37_WIDTH + 6))) ; strip destination
	db 16, ROUTE_36_WIDTH ; (connection strip length, connected map width)
	db 0, 20 ; yoffset, xoffset
	dw ($C807 + ROUTE_36_WIDTH) ; window
; 0x95138

Route38_SecondMapHeader: ; 0x95138
	; border block
	db $5

	; height, width
	db ROUTE_38_HEIGHT, ROUTE_38_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38_BlockData), Route38_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route38_MapScriptHeader), Route38_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route38_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Route 39
	db GROUP_ROUTE_39, MAP_ROUTE_39 ; connected map (group, id)
	dw (Route39_BlockData + ROUTE_39_WIDTH - 3) ; strip pointer
	dw $c84e ; strip destination
	db 12, ROUTE_39_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_39_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Ecruteak City
	db GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY ; connected map (group, id)
	dw (EcruteakCity_BlockData + ((100 - (ECRUTEAK_CITY_WIDTH * 4)) * 2)) ; strip pointer
	dw $c817 ; strip destination
	db 15, ECRUTEAK_CITY_WIDTH ; (connection strip length, connected map width)
	db 10, 0 ; yoffset, xoffset
	dw ($C807 + ECRUTEAK_CITY_WIDTH) ; window
; 0x9515c

Route39_SecondMapHeader: ; 0x9515c
	; border block
	db $5

	; height, width
	db ROUTE_39_HEIGHT, ROUTE_39_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route39_BlockData), Route39_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route39_MapScriptHeader), Route39_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route39_MapEventHeader

	; connections
	db SOUTH | EAST

	; SOUTH to Olivine City
	db GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY ; connected map (group, id)
	dw (OlivineCity_BlockData + ((10 - 16 + ROUTE_39_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_39_HEIGHT + 3) * (ROUTE_39_WIDTH + 6))) ; strip destination
	db 16, OLIVINE_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + OLIVINE_CITY_WIDTH) ; window

	; EAST to Route 38
	db GROUP_ROUTE_38, MAP_ROUTE_38 ; connected map (group, id)
	dw (Route38_BlockData) ; strip pointer
	dw $c83d ; strip destination
	db 9, ROUTE_38_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_38_WIDTH) ; window
; 0x95180

Route40_SecondMapHeader: ; 0x95180
	; border block
	db $35

	; height, width
	db ROUTE_40_HEIGHT, ROUTE_40_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route40_BlockData), Route40_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route40_MapScriptHeader), Route40_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route40_MapEventHeader

	; connections
	db SOUTH | EAST

	; SOUTH to Route 41
	db GROUP_ROUTE_41, MAP_ROUTE_41 ; connected map (group, id)
	dw (Route41_BlockData + (((30 - 13 + ROUTE_40_WIDTH) / 2) - 1)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_40_HEIGHT + 3) * (ROUTE_40_WIDTH + 6))) ; strip destination
	db 13, ROUTE_41_WIDTH ; (connection strip length, connected map width)
	db 0, 30 ; yoffset, xoffset
	dw ($C807 + ROUTE_41_WIDTH) ; window

	; EAST to Olivine City
	db GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY ; connected map (group, id)
	dw (OlivineCity_BlockData + ((OLIVINE_CITY_HEIGHT - 12) * OLIVINE_CITY_WIDTH)) ; strip pointer
	dw $c80d ; strip destination
	db 12, OLIVINE_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + OLIVINE_CITY_WIDTH) ; window
; 0x951a4

Route41_SecondMapHeader: ; 0x951a4
	; border block
	db $35

	; height, width
	db ROUTE_41_HEIGHT, ROUTE_41_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route41_BlockData), Route41_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route41_MapScriptHeader), Route41_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route41_MapEventHeader

	; connections
	db NORTH | WEST

	; NORTH to Route 40
	db GROUP_ROUTE_40, MAP_ROUTE_40 ; connected map (group, id)
	dw (Route40_BlockData + (ROUTE_40_HEIGHT * ROUTE_40_WIDTH) - (ROUTE_40_WIDTH * 3)) ; strip pointer
	dw ($C703 + 271) ; strip destination
	db 10, ROUTE_40_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_40_HEIGHT * 2) - 1), 226 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_40_HEIGHT * 6) + (ROUTE_40_HEIGHT * ROUTE_40_WIDTH))) ; window

	; WEST to Cianwood City
	db GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY ; connected map (group, id)
	dw (CianwoodCity_BlockData + CIANWOOD_CITY_WIDTH - 3) ; strip pointer
	dw $c85d ; strip destination
	db 27, CIANWOOD_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, ((CIANWOOD_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 29) ; window
; 0x951c8

Route42_SecondMapHeader: ; 0x951c8
	; border block
	db $5

	; height, width
	db ROUTE_42_HEIGHT, ROUTE_42_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route42_BlockData), Route42_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route42_MapScriptHeader), Route42_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route42_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Ecruteak City
	db GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY ; connected map (group, id)
	dw (EcruteakCity_BlockData + (((ECRUTEAK_CITY_HEIGHT - ROUTE_42_HEIGHT) * ECRUTEAK_CITY_WIDTH) - (ECRUTEAK_CITY_WIDTH * 3) + (ECRUTEAK_CITY_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, ECRUTEAK_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, ((ECRUTEAK_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Mahogany Town
	db GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN ; connected map (group, id)
	dw (MahoganyTown_BlockData) ; strip pointer
	dw $c88d ; strip destination
	db 9, MAHOGANY_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + MAHOGANY_TOWN_WIDTH) ; window
; 0x951ec

Route43_SecondMapHeader: ; 0x951ec
	; border block
	db $5

	; height, width
	db ROUTE_43_HEIGHT, ROUTE_43_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route43_BlockData), Route43_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route43_MapScriptHeader), Route43_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route43_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Lake of Rage
	db GROUP_LAKE_OF_RAGE, MAP_LAKE_OF_RAGE ; connected map (group, id)
	dw (LakeofRage_BlockData + LAKE_OF_RAGE_WIDTH + 10 + (16 * LAKE_OF_RAGE_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, LAKE_OF_RAGE_WIDTH ; (connection strip length, connected map width)
	db ((LAKE_OF_RAGE_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((LAKE_OF_RAGE_HEIGHT * 6) + (LAKE_OF_RAGE_HEIGHT * LAKE_OF_RAGE_WIDTH))) ; window

	; SOUTH to Mahogany Town
	db GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN ; connected map (group, id)
	dw (MahoganyTown_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_43_HEIGHT + 3) * (ROUTE_43_WIDTH + 6))) ; strip destination
	db 10, MAHOGANY_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + MAHOGANY_TOWN_WIDTH) ; window
; 0x95210

Route44_SecondMapHeader: ; 0x95210
	; border block
	db $71

	; height, width
	db ROUTE_44_HEIGHT, ROUTE_44_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route44_BlockData), Route44_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route44_MapScriptHeader), Route44_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route44_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Mahogany Town
	db GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN ; connected map (group, id)
	dw (MahoganyTown_BlockData + MAHOGANY_TOWN_WIDTH - 3) ; strip pointer
	dw $c86c ; strip destination
	db 9, MAHOGANY_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, ((MAHOGANY_TOWN_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Blackthorn City
	db GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY ; connected map (group, id)
	dw (BlackthornCity_BlockData + ((BLACKTHORN_CITY_HEIGHT - 12) * BLACKTHORN_CITY_WIDTH)) ; strip pointer
	dw $c821 ; strip destination
	db 12, BLACKTHORN_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + BLACKTHORN_CITY_WIDTH) ; window
; 0x95234

Route45_SecondMapHeader: ; 0x95234
	; border block
	db $71

	; height, width
	db ROUTE_45_HEIGHT, ROUTE_45_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route45_BlockData), Route45_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route45_MapScriptHeader), Route45_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route45_MapEventHeader

	; connections
	db NORTH | WEST

	; NORTH to Blackthorn City
	db GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY ; connected map (group, id)
	dw (BlackthornCity_BlockData + (BLACKTHORN_CITY_HEIGHT * BLACKTHORN_CITY_WIDTH) - (BLACKTHORN_CITY_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, BLACKTHORN_CITY_WIDTH ; (connection strip length, connected map width)
	db ((BLACKTHORN_CITY_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((BLACKTHORN_CITY_HEIGHT * 6) + (BLACKTHORN_CITY_HEIGHT * BLACKTHORN_CITY_WIDTH))) ; window

	; WEST to Route 46
	db GROUP_ROUTE_46, MAP_ROUTE_46 ; connected map (group, id)
	dw (Route46_BlockData + ROUTE_46_WIDTH - 3) ; strip pointer
	dw $ca70 ; strip destination
	db 12, ROUTE_46_WIDTH ; (connection strip length, connected map width)
	db 184, ((ROUTE_46_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window
; 0x95258

Route46_SecondMapHeader: ; 0x95258
	; border block
	db $5

	; height, width
	db ROUTE_46_HEIGHT, ROUTE_46_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route46_BlockData), Route46_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route46_MapScriptHeader), Route46_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route46_MapEventHeader

	; connections
	db SOUTH | EAST

	; SOUTH to Route 29
	db GROUP_ROUTE_29, MAP_ROUTE_29 ; connected map (group, id)
	dw (Route29_BlockData + ((20 - 16 + ROUTE_46_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_46_HEIGHT + 3) * (ROUTE_46_WIDTH + 6))) ; strip destination
	db 16, ROUTE_29_WIDTH ; (connection strip length, connected map width)
	db 0, 20 ; yoffset, xoffset
	dw ($C807 + ROUTE_29_WIDTH) ; window

	; EAST to Route 45
	db GROUP_ROUTE_45, MAP_ROUTE_45 ; connected map (group, id)
	dw (Route45_BlockData + ((ROUTE_45_HEIGHT - 12) * ROUTE_45_WIDTH)) ; strip pointer
	dw $c80d ; strip destination
	db 12, ROUTE_45_WIDTH ; (connection strip length, connected map width)
	db 72, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_45_WIDTH) ; window
; 0x9527c

PewterCity_SecondMapHeader: ; 0x9527c
	; border block
	db $f

	; height, width
	db PEWTER_CITY_HEIGHT, PEWTER_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(PewterCity_BlockData), PewterCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PewterCity_MapScriptHeader), PewterCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PewterCity_MapEventHeader

	; connections
	db SOUTH | EAST

	; SOUTH to Route 2
	db GROUP_ROUTE_2, MAP_ROUTE_2 ; connected map (group, id)
	dw (Route2_BlockData) ; strip pointer
	dw ($C703 + 261 + ((PEWTER_CITY_HEIGHT + 3) * (PEWTER_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_2_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_2_WIDTH) ; window

	; EAST to Route 3
	db GROUP_ROUTE_3, MAP_ROUTE_3 ; connected map (group, id)
	dw (Route3_BlockData) ; strip pointer
	dw $c8e7 ; strip destination
	db 9, ROUTE_3_WIDTH ; (connection strip length, connected map width)
	db 246, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_3_WIDTH) ; window
; 0x952a0

Route2_SecondMapHeader: ; 0x952a0
	; border block
	db $f

	; height, width
	db ROUTE_2_HEIGHT, ROUTE_2_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route2_BlockData), Route2_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route2_MapScriptHeader), Route2_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route2_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Pewter City
	db GROUP_PEWTER_CITY, MAP_PEWTER_CITY ; connected map (group, id)
	dw (PewterCity_BlockData + PEWTER_CITY_WIDTH + 10 + (16 * PEWTER_CITY_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, PEWTER_CITY_WIDTH ; (connection strip length, connected map width)
	db ((PEWTER_CITY_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((PEWTER_CITY_HEIGHT * 6) + (PEWTER_CITY_HEIGHT * PEWTER_CITY_WIDTH))) ; window

	; SOUTH to Viridian City
	db GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY ; connected map (group, id)
	dw (ViridianCity_BlockData + ((10 - 16 + ROUTE_2_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_2_HEIGHT + 3) * (ROUTE_2_WIDTH + 6))) ; strip destination
	db 16, VIRIDIAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + VIRIDIAN_CITY_WIDTH) ; window
; 0x952c4

ViridianCity_SecondMapHeader: ; 0x952c4
	; border block
	db $f

	; height, width
	db VIRIDIAN_CITY_HEIGHT, VIRIDIAN_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(ViridianCity_BlockData), ViridianCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(ViridianCity_MapScriptHeader), ViridianCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw ViridianCity_MapEventHeader

	; connections
	db NORTH | SOUTH | WEST

	; NORTH to Route 2
	db GROUP_ROUTE_2, MAP_ROUTE_2 ; connected map (group, id)
	dw (Route2_BlockData + (ROUTE_2_HEIGHT * ROUTE_2_WIDTH) - (ROUTE_2_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_2_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_2_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_2_HEIGHT * 6) + (ROUTE_2_HEIGHT * ROUTE_2_WIDTH))) ; window

	; SOUTH to Route 1
	db GROUP_ROUTE_1, MAP_ROUTE_1 ; connected map (group, id)
	dw (Route1_BlockData) ; strip pointer
	dw ($C703 + 266 + ((VIRIDIAN_CITY_HEIGHT + 3) * (VIRIDIAN_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_1_WIDTH ; (connection strip length, connected map width)
	db 0, 236 ; yoffset, xoffset
	dw ($C807 + ROUTE_1_WIDTH) ; window

	; WEST to Route 22
	db GROUP_ROUTE_22, MAP_ROUTE_22 ; connected map (group, id)
	dw (Route22_BlockData + ROUTE_22_WIDTH - 3) ; strip pointer
	dw $c8b6 ; strip destination
	db 9, ROUTE_22_WIDTH ; (connection strip length, connected map width)
	db 248, ((ROUTE_22_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x952f4

Route22_SecondMapHeader: ; 0x952f4
	; border block
	db $2c

	; height, width
	db ROUTE_22_HEIGHT, ROUTE_22_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route22_BlockData), Route22_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route22_MapScriptHeader), Route22_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route22_MapEventHeader

	; connections
	db EAST

	; EAST to Viridian City
	db GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY ; connected map (group, id)
	dw (ViridianCity_BlockData + 100 - (VIRIDIAN_CITY_WIDTH * 4)) ; strip pointer
	dw $c817 ; strip destination
	db 15, VIRIDIAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 8, 0 ; yoffset, xoffset
	dw ($C807 + VIRIDIAN_CITY_WIDTH) ; window
; 0x9530c

Route1_SecondMapHeader: ; 0x9530c
	; border block
	db $f

	; height, width
	db ROUTE_1_HEIGHT, ROUTE_1_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route1_BlockData), Route1_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route1_MapScriptHeader), Route1_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route1_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Viridian City
	db GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY ; connected map (group, id)
	dw $6d9c ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 13, VIRIDIAN_CITY_WIDTH ; (connection strip length, connected map width)
	db ((VIRIDIAN_CITY_HEIGHT * 2) - 1), 20 ; yoffset, xoffset
	dw ($C801 + ((VIRIDIAN_CITY_HEIGHT * 6) + (VIRIDIAN_CITY_HEIGHT * VIRIDIAN_CITY_WIDTH))) ; window

	; SOUTH to Pallet Town
	db GROUP_PALLET_TOWN, MAP_PALLET_TOWN ; connected map (group, id)
	dw (PalletTown_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_1_HEIGHT + 3) * (ROUTE_1_WIDTH + 6))) ; strip destination
	db 10, PALLET_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + PALLET_TOWN_WIDTH) ; window
; 0x95330

PalletTown_SecondMapHeader: ; 0x95330
	; border block
	db $f

	; height, width
	db PALLET_TOWN_HEIGHT, PALLET_TOWN_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(PalletTown_BlockData), PalletTown_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PalletTown_MapScriptHeader), PalletTown_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PalletTown_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Route 1
	db GROUP_ROUTE_1, MAP_ROUTE_1 ; connected map (group, id)
	dw (Route1_BlockData + (ROUTE_1_HEIGHT * ROUTE_1_WIDTH) - (ROUTE_1_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_1_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_1_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_1_HEIGHT * 6) + (ROUTE_1_HEIGHT * ROUTE_1_WIDTH))) ; window

	; SOUTH to Route 21
	db GROUP_ROUTE_21, MAP_ROUTE_21 ; connected map (group, id)
	dw (Route21_BlockData) ; strip pointer
	dw ($C703 + 256 + ((PALLET_TOWN_HEIGHT + 3) * (PALLET_TOWN_WIDTH + 6))) ; strip destination
	db 10, ROUTE_21_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_21_WIDTH) ; window
; 0x95354

Route21_SecondMapHeader: ; 0x95354
	; border block
	db $43

	; height, width
	db ROUTE_21_HEIGHT, ROUTE_21_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route21_BlockData), Route21_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route21_MapScriptHeader), Route21_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route21_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Pallet Town
	db GROUP_PALLET_TOWN, MAP_PALLET_TOWN ; connected map (group, id)
	dw (PalletTown_BlockData + (PALLET_TOWN_HEIGHT * PALLET_TOWN_WIDTH) - (PALLET_TOWN_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, PALLET_TOWN_WIDTH ; (connection strip length, connected map width)
	db ((PALLET_TOWN_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((PALLET_TOWN_HEIGHT * 6) + (PALLET_TOWN_HEIGHT * PALLET_TOWN_WIDTH))) ; window

	; SOUTH to Cinnabar Island
	db GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND ; connected map (group, id)
	dw (CinnabarIsland_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_21_HEIGHT + 3) * (ROUTE_21_WIDTH + 6))) ; strip destination
	db 10, CINNABAR_ISLAND_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + CINNABAR_ISLAND_WIDTH) ; window
; 0x95378

CinnabarIsland_SecondMapHeader: ; 0x95378
	; border block
	db $43

	; height, width
	db CINNABAR_ISLAND_HEIGHT, CINNABAR_ISLAND_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarIsland_BlockData), CinnabarIsland_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CinnabarIsland_MapScriptHeader), CinnabarIsland_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CinnabarIsland_MapEventHeader

	; connections
	db NORTH | EAST

	; NORTH to Route 21
	db GROUP_ROUTE_21, MAP_ROUTE_21 ; connected map (group, id)
	dw (Route21_BlockData + (ROUTE_21_HEIGHT * ROUTE_21_WIDTH) - (ROUTE_21_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_21_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_21_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_21_HEIGHT * 6) + (ROUTE_21_HEIGHT * ROUTE_21_WIDTH))) ; window

	; EAST to Route 20
	db GROUP_ROUTE_20, MAP_ROUTE_20 ; connected map (group, id)
	dw (Route20_BlockData) ; strip pointer
	dw $c83d ; strip destination
	db 9, ROUTE_20_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_20_WIDTH) ; window
; 0x9539c

Route20_SecondMapHeader: ; 0x9539c
	; border block
	db $43

	; height, width
	db ROUTE_20_HEIGHT, ROUTE_20_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route20_BlockData), Route20_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route20_MapScriptHeader), Route20_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route20_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Cinnabar Island
	db GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND ; connected map (group, id)
	dw (CinnabarIsland_BlockData + CINNABAR_ISLAND_WIDTH - 3) ; strip pointer
	dw $c86c ; strip destination
	db 9, CINNABAR_ISLAND_WIDTH ; (connection strip length, connected map width)
	db 0, ((CINNABAR_ISLAND_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 19
	db GROUP_ROUTE_19, MAP_ROUTE_19 ; connected map (group, id)
	dw (Route19_BlockData + ((ROUTE_19_HEIGHT - 12) * ROUTE_19_WIDTH)) ; strip pointer
	dw $c821 ; strip destination
	db 12, ROUTE_19_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_19_WIDTH) ; window
; 0x953c0

Route19_SecondMapHeader: ; 0x953c0
	; border block
	db $43

	; height, width
	db ROUTE_19_HEIGHT, ROUTE_19_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route19_BlockData), Route19_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route19_MapScriptHeader), Route19_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route19_MapEventHeader

	; connections
	db NORTH | WEST

	; NORTH to Fuchsia City
	db GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY ; connected map (group, id)
	dw (FuchsiaCity_BlockData + (FUCHSIA_CITY_HEIGHT * FUCHSIA_CITY_WIDTH) - (FUCHSIA_CITY_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, FUCHSIA_CITY_WIDTH ; (connection strip length, connected map width)
	db ((FUCHSIA_CITY_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((FUCHSIA_CITY_HEIGHT * 6) + (FUCHSIA_CITY_HEIGHT * FUCHSIA_CITY_WIDTH))) ; window

	; WEST to Route 20
	db GROUP_ROUTE_20, MAP_ROUTE_20 ; connected map (group, id)
	dw (Route20_BlockData + ROUTE_20_WIDTH - 3) ; strip pointer
	dw $c8c0 ; strip destination
	db 9, ROUTE_20_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_20_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window
; 0x953e4

FuchsiaCity_SecondMapHeader: ; 0x953e4
	; border block
	db $f

	; height, width
	db FUCHSIA_CITY_HEIGHT, FUCHSIA_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(FuchsiaCity_BlockData), FuchsiaCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FuchsiaCity_MapScriptHeader), FuchsiaCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FuchsiaCity_MapEventHeader

	; connections
	db SOUTH | WEST | EAST

	; SOUTH to Route 19
	db GROUP_ROUTE_19, MAP_ROUTE_19 ; connected map (group, id)
	dw (Route19_BlockData) ; strip pointer
	dw ($C703 + 256 + ((FUCHSIA_CITY_HEIGHT + 3) * (FUCHSIA_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_19_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_19_WIDTH) ; window

	; WEST to Route 18
	db GROUP_ROUTE_18, MAP_ROUTE_18 ; connected map (group, id)
	dw (Route18_BlockData + ROUTE_18_WIDTH - 3) ; strip pointer
	dw $c904 ; strip destination
	db 9, ROUTE_18_WIDTH ; (connection strip length, connected map width)
	db 242, ((ROUTE_18_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 15
	db GROUP_ROUTE_15, MAP_ROUTE_15 ; connected map (group, id)
	dw (Route15_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_15_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_15_WIDTH) ; window
; 0x95414

Route18_SecondMapHeader: ; 0x95414
	; border block
	db $43

	; height, width
	db ROUTE_18_HEIGHT, ROUTE_18_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route18_BlockData), Route18_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route18_MapScriptHeader), Route18_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route18_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Route 17
	db GROUP_ROUTE_17, MAP_ROUTE_17 ; connected map (group, id)
	dw $7152 ; strip pointer
	dw $c800 ; strip destination
	db 10, ROUTE_17_WIDTH ; (connection strip length, connected map width)
	db 76, ((ROUTE_17_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Fuchsia City
	db GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY ; connected map (group, id)
	dw (FuchsiaCity_BlockData + ((FUCHSIA_CITY_HEIGHT - 14) * FUCHSIA_CITY_WIDTH)) ; strip pointer
	dw $c80d ; strip destination
	db 14, FUCHSIA_CITY_WIDTH ; (connection strip length, connected map width)
	db 14, 0 ; yoffset, xoffset
	dw ($C807 + FUCHSIA_CITY_WIDTH) ; window
; 0x95438

Route17_SecondMapHeader: ; 0x95438
	; border block
	db $43

	; height, width
	db ROUTE_17_HEIGHT, ROUTE_17_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route17_BlockData), Route17_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route17_MapScriptHeader), Route17_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route17_MapEventHeader

	; connections
	db NORTH | EAST

	; NORTH to Route 16
	db GROUP_ROUTE_16, MAP_ROUTE_16 ; connected map (group, id)
	dw (Route16_BlockData + (ROUTE_16_HEIGHT * ROUTE_16_WIDTH) - (ROUTE_16_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_16_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_16_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_16_HEIGHT * 6) + (ROUTE_16_HEIGHT * ROUTE_16_WIDTH))) ; window

	; EAST to Route 18
	db GROUP_ROUTE_18, MAP_ROUTE_18 ; connected map (group, id)
	dw (Route18_BlockData) ; strip pointer
	dw $ca9d ; strip destination
	db 9, ROUTE_18_WIDTH ; (connection strip length, connected map width)
	db 180, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_18_WIDTH) ; window
; 0x9545c

Route16_SecondMapHeader: ; 0x9545c
	; border block
	db $f

	; height, width
	db ROUTE_16_HEIGHT, ROUTE_16_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route16_BlockData), Route16_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route16_MapScriptHeader), Route16_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route16_MapEventHeader

	; connections
	db SOUTH | EAST

	; SOUTH to Route 17
	db GROUP_ROUTE_17, MAP_ROUTE_17 ; connected map (group, id)
	dw (Route17_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_16_HEIGHT + 3) * (ROUTE_16_WIDTH + 6))) ; strip destination
	db 10, ROUTE_17_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_17_WIDTH) ; window

	; EAST to Celadon City
	db GROUP_CELADON_CITY, MAP_CELADON_CITY ; connected map (group, id)
	dw (CeladonCity_BlockData + ((CELADON_CITY_HEIGHT - 12) * CELADON_CITY_WIDTH)) ; strip pointer
	dw $c80d ; strip destination
	db 12, CELADON_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + CELADON_CITY_WIDTH) ; window
; 0x95480

CeladonCity_SecondMapHeader: ; 0x95480
	; border block
	db $f

	; height, width
	db CELADON_CITY_HEIGHT, CELADON_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeladonCity_BlockData), CeladonCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonCity_MapScriptHeader), CeladonCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonCity_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Route 16
	db GROUP_ROUTE_16, MAP_ROUTE_16 ; connected map (group, id)
	dw (Route16_BlockData + ROUTE_16_WIDTH - 3) ; strip pointer
	dw $c938 ; strip destination
	db 9, ROUTE_16_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_16_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 7
	db GROUP_ROUTE_7, MAP_ROUTE_7 ; connected map (group, id)
	dw (Route7_BlockData) ; strip pointer
	dw $c8e7 ; strip destination
	db 9, ROUTE_7_WIDTH ; (connection strip length, connected map width)
	db 246, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_7_WIDTH) ; window
; 0x954a4

Route7_SecondMapHeader: ; 0x954a4
	; border block
	db $f

	; height, width
	db ROUTE_7_HEIGHT, ROUTE_7_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route7_BlockData), Route7_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route7_MapScriptHeader), Route7_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route7_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Celadon City
	db GROUP_CELADON_CITY, MAP_CELADON_CITY ; connected map (group, id)
	dw (CeladonCity_BlockData + 21 + (CELADON_CITY_HEIGHT * 2)) ; strip pointer
	dw $c800 ; strip destination
	db 15, CELADON_CITY_WIDTH ; (connection strip length, connected map width)
	db 10, ((CELADON_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Saffron City
	db GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY ; connected map (group, id)
	dw (SaffronCity_BlockData + ((SAFFRON_CITY_HEIGHT - 12) * SAFFRON_CITY_WIDTH)) ; strip pointer
	dw $c80d ; strip destination
	db 12, SAFFRON_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + SAFFRON_CITY_WIDTH) ; window
; 0x954c8

Route15_SecondMapHeader: ; 0x954c8
	; border block
	db $f

	; height, width
	db ROUTE_15_HEIGHT, ROUTE_15_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route15_BlockData), Route15_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route15_MapScriptHeader), Route15_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route15_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Fuchsia City
	db GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY ; connected map (group, id)
	dw (FuchsiaCity_BlockData + (((FUCHSIA_CITY_HEIGHT - ROUTE_15_HEIGHT) * FUCHSIA_CITY_WIDTH) - (FUCHSIA_CITY_WIDTH * 3) + (FUCHSIA_CITY_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, FUCHSIA_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, ((FUCHSIA_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Route 14
	db GROUP_ROUTE_14, MAP_ROUTE_14 ; connected map (group, id)
	dw (Route14_BlockData + ((ROUTE_14_HEIGHT - 12) * ROUTE_14_WIDTH)) ; strip pointer
	dw $c817 ; strip destination
	db 12, ROUTE_14_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_14_WIDTH) ; window
; 0x954ec

Route14_SecondMapHeader: ; 0x954ec
	; border block
	db $43

	; height, width
	db ROUTE_14_HEIGHT, ROUTE_14_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route14_BlockData), Route14_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route14_MapScriptHeader), Route14_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route14_MapEventHeader

	; connections
	db NORTH | WEST

	; NORTH to Route 13
	db GROUP_ROUTE_13, MAP_ROUTE_13 ; connected map (group, id)
	dw (Route13_BlockData + (ROUTE_13_HEIGHT * ROUTE_13_WIDTH) - (ROUTE_13_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, ROUTE_13_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_13_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_13_HEIGHT * 6) + (ROUTE_13_HEIGHT * ROUTE_13_WIDTH))) ; window

	; WEST to Route 15
	db GROUP_ROUTE_15, MAP_ROUTE_15 ; connected map (group, id)
	dw (Route15_BlockData + ROUTE_15_WIDTH - 3) ; strip pointer
	dw $c8c0 ; strip destination
	db 9, ROUTE_15_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_15_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x95510

Route13_SecondMapHeader: ; 0x95510
	; border block
	db $43

	; height, width
	db ROUTE_13_HEIGHT, ROUTE_13_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route13_BlockData), Route13_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route13_MapScriptHeader), Route13_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route13_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Route 12
	db GROUP_ROUTE_12, MAP_ROUTE_12 ; connected map (group, id)
	dw (Route12_BlockData + (ROUTE_12_HEIGHT * ROUTE_12_WIDTH) - (ROUTE_12_WIDTH * 3)) ; strip pointer
	dw ($C703 + 276) ; strip destination
	db 10, ROUTE_12_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_12_HEIGHT * 2) - 1), 216 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_12_HEIGHT * 6) + (ROUTE_12_HEIGHT * ROUTE_12_WIDTH))) ; window

	; SOUTH to Route 14
	db GROUP_ROUTE_14, MAP_ROUTE_14 ; connected map (group, id)
	dw (Route14_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_13_HEIGHT + 3) * (ROUTE_13_WIDTH + 6))) ; strip destination
	db 10, ROUTE_14_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_14_WIDTH) ; window
; 0x95534

Route12_SecondMapHeader: ; 0x95534
	; border block
	db $43

	; height, width
	db ROUTE_12_HEIGHT, ROUTE_12_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route12_BlockData), Route12_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route12_MapScriptHeader), Route12_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route12_MapEventHeader

	; connections
	db NORTH | SOUTH | WEST

	; NORTH to Lavender Town
	db GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN ; connected map (group, id)
	dw (LavenderTown_BlockData + (LAVENDER_TOWN_HEIGHT * LAVENDER_TOWN_WIDTH) - (LAVENDER_TOWN_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, LAVENDER_TOWN_WIDTH ; (connection strip length, connected map width)
	db ((LAVENDER_TOWN_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((LAVENDER_TOWN_HEIGHT * 6) + (LAVENDER_TOWN_HEIGHT * LAVENDER_TOWN_WIDTH))) ; window

	; SOUTH to Route 13
	db GROUP_ROUTE_13, MAP_ROUTE_13 ; connected map (group, id)
	dw (Route13_BlockData + (((40 - 13 + ROUTE_12_WIDTH) / 2) - 1)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_12_HEIGHT + 3) * (ROUTE_12_WIDTH + 6))) ; strip destination
	db 13, ROUTE_13_WIDTH ; (connection strip length, connected map width)
	db 0, 40 ; yoffset, xoffset
	dw ($C807 + ROUTE_13_WIDTH) ; window

	; WEST to Route 11
	db GROUP_ROUTE_11, MAP_ROUTE_11 ; connected map (group, id)
	dw (Route11_BlockData + ROUTE_11_WIDTH - 3) ; strip pointer
	dw $c8c0 ; strip destination
	db 9, ROUTE_11_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_11_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x95564

Route11_SecondMapHeader: ; 0x95564
	; border block
	db $f

	; height, width
	db ROUTE_11_HEIGHT, ROUTE_11_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route11_BlockData), Route11_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route11_MapScriptHeader), Route11_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route11_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Vermilion City
	db GROUP_VERMILION_CITY, MAP_VERMILION_CITY ; connected map (group, id)
	dw (VermilionCity_BlockData + VERMILION_CITY_WIDTH - 3) ; strip pointer
	dw $c84e ; strip destination
	db 12, VERMILION_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, ((VERMILION_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Route 12
	db GROUP_ROUTE_12, MAP_ROUTE_12 ; connected map (group, id)
	dw (Route12_BlockData + 100 - (ROUTE_12_WIDTH * 4)) ; strip pointer
	dw $c817 ; strip destination
	db 15, ROUTE_12_WIDTH ; (connection strip length, connected map width)
	db 18, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_12_WIDTH) ; window
; 0x95588

LavenderTown_SecondMapHeader: ; 0x95588
	; border block
	db $2c

	; height, width
	db LAVENDER_TOWN_HEIGHT, LAVENDER_TOWN_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(LavenderTown_BlockData), LavenderTown_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LavenderTown_MapScriptHeader), LavenderTown_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LavenderTown_MapEventHeader

	; connections
	db NORTH | SOUTH | WEST

	; NORTH to Route 10 South
	db GROUP_ROUTE_10_SOUTH, MAP_ROUTE_10_SOUTH ; connected map (group, id)
	dw (Route10South_BlockData + (ROUTE_10_SOUTH_HEIGHT * ROUTE_10_SOUTH_WIDTH) - (ROUTE_10_SOUTH_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_10_SOUTH_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_10_SOUTH_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_10_SOUTH_HEIGHT * 6) + (ROUTE_10_SOUTH_HEIGHT * ROUTE_10_SOUTH_WIDTH))) ; window

	; SOUTH to Route 12
	db GROUP_ROUTE_12, MAP_ROUTE_12 ; connected map (group, id)
	dw (Route12_BlockData) ; strip pointer
	dw ($C703 + 256 + ((LAVENDER_TOWN_HEIGHT + 3) * (LAVENDER_TOWN_WIDTH + 6))) ; strip destination
	db 10, ROUTE_12_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_12_WIDTH) ; window

	; WEST to Route 8
	db GROUP_ROUTE_8, MAP_ROUTE_8 ; connected map (group, id)
	dw (Route8_BlockData + ROUTE_8_WIDTH - 3) ; strip pointer
	dw $c830 ; strip destination
	db 9, ROUTE_8_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_8_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x955b8

VermilionCity_SecondMapHeader: ; 0x955b8
	; border block
	db $43

	; height, width
	db VERMILION_CITY_HEIGHT, VERMILION_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(VermilionCity_BlockData), VermilionCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VermilionCity_MapScriptHeader), VermilionCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VermilionCity_MapEventHeader

	; connections
	db NORTH | EAST

	; NORTH to Route 6
	db GROUP_ROUTE_6, MAP_ROUTE_6 ; connected map (group, id)
	dw (Route6_BlockData + (ROUTE_6_HEIGHT * ROUTE_6_WIDTH) - (ROUTE_6_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_6_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_6_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_6_HEIGHT * 6) + (ROUTE_6_HEIGHT * ROUTE_6_WIDTH))) ; window

	; EAST to Route 11
	db GROUP_ROUTE_11, MAP_ROUTE_11 ; connected map (group, id)
	dw (Route11_BlockData) ; strip pointer
	dw $c865 ; strip destination
	db 9, ROUTE_11_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_11_WIDTH) ; window
; 0x955dc

Route6_SecondMapHeader: ; 0x955dc
	; border block
	db $f

	; height, width
	db ROUTE_6_HEIGHT, ROUTE_6_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route6_BlockData), Route6_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route6_MapScriptHeader), Route6_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route6_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Saffron City
	db GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY ; connected map (group, id)
	dw (SaffronCity_BlockData + SAFFRON_CITY_WIDTH + 10 + (16 * SAFFRON_CITY_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, SAFFRON_CITY_WIDTH ; (connection strip length, connected map width)
	db ((SAFFRON_CITY_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((SAFFRON_CITY_HEIGHT * 6) + (SAFFRON_CITY_HEIGHT * SAFFRON_CITY_WIDTH))) ; window

	; SOUTH to Vermilion City
	db GROUP_VERMILION_CITY, MAP_VERMILION_CITY ; connected map (group, id)
	dw (VermilionCity_BlockData + ((10 - 16 + ROUTE_6_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_6_HEIGHT + 3) * (ROUTE_6_WIDTH + 6))) ; strip destination
	db 16, VERMILION_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + VERMILION_CITY_WIDTH) ; window
; 0x95600

SaffronCity_SecondMapHeader: ; 0x95600
	; border block
	db $f

	; height, width
	db SAFFRON_CITY_HEIGHT, SAFFRON_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SaffronCity_BlockData), SaffronCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SaffronCity_MapScriptHeader), SaffronCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SaffronCity_MapEventHeader

	; connections
	db NORTH | SOUTH | WEST | EAST

	; NORTH to Route 5
	db GROUP_ROUTE_5, MAP_ROUTE_5 ; connected map (group, id)
	dw (Route5_BlockData + (ROUTE_5_HEIGHT * ROUTE_5_WIDTH) - (ROUTE_5_WIDTH * 3)) ; strip pointer
	dw ($C703 + 261) ; strip destination
	db 10, ROUTE_5_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_5_HEIGHT * 2) - 1), 246 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_5_HEIGHT * 6) + (ROUTE_5_HEIGHT * ROUTE_5_WIDTH))) ; window

	; SOUTH to Route 6
	db GROUP_ROUTE_6, MAP_ROUTE_6 ; connected map (group, id)
	dw (Route6_BlockData) ; strip pointer
	dw ($C703 + 261 + ((SAFFRON_CITY_HEIGHT + 3) * (SAFFRON_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_6_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_6_WIDTH) ; window

	; WEST to Route 7
	db GROUP_ROUTE_7, MAP_ROUTE_7 ; connected map (group, id)
	dw (Route7_BlockData + ROUTE_7_WIDTH - 3) ; strip pointer
	dw $c938 ; strip destination
	db 9, ROUTE_7_WIDTH ; (connection strip length, connected map width)
	db 238, ((ROUTE_7_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 19) ; window

	; EAST to Route 8
	db GROUP_ROUTE_8, MAP_ROUTE_8 ; connected map (group, id)
	dw (Route8_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_8_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_8_WIDTH) ; window
; 0x9563c

Route5_SecondMapHeader: ; 0x9563c
	; border block
	db $f

	; height, width
	db ROUTE_5_HEIGHT, ROUTE_5_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route5_BlockData), Route5_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route5_MapScriptHeader), Route5_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route5_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Cerulean City
	db GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY ; connected map (group, id)
	dw (CeruleanCity_BlockData + CERULEAN_CITY_WIDTH + 10 + (16 * CERULEAN_CITY_HEIGHT) - 16) ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 16, CERULEAN_CITY_WIDTH ; (connection strip length, connected map width)
	db ((CERULEAN_CITY_HEIGHT * 2) - 1), 10 ; yoffset, xoffset
	dw ($C801 + ((CERULEAN_CITY_HEIGHT * 6) + (CERULEAN_CITY_HEIGHT * CERULEAN_CITY_WIDTH))) ; window

	; SOUTH to Saffron City
	db GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY ; connected map (group, id)
	dw (SaffronCity_BlockData + ((10 - 16 + ROUTE_5_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_5_HEIGHT + 3) * (ROUTE_5_WIDTH + 6))) ; strip destination
	db 16, SAFFRON_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 10 ; yoffset, xoffset
	dw ($C807 + SAFFRON_CITY_WIDTH) ; window
; 0x95660

CeruleanCity_SecondMapHeader: ; 0x95660
	; border block
	db $f

	; height, width
	db CERULEAN_CITY_HEIGHT, CERULEAN_CITY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeruleanCity_BlockData), CeruleanCity_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeruleanCity_MapScriptHeader), CeruleanCity_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeruleanCity_MapEventHeader

	; connections
	db NORTH | SOUTH | WEST | EAST

	; NORTH to Route 24
	db GROUP_ROUTE_24, MAP_ROUTE_24 ; connected map (group, id)
	dw (Route24_BlockData + (ROUTE_24_HEIGHT * ROUTE_24_WIDTH) - (ROUTE_24_WIDTH * 3)) ; strip pointer
	dw ($C703 + 262) ; strip destination
	db 10, ROUTE_24_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_24_HEIGHT * 2) - 1), 244 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_24_HEIGHT * 6) + (ROUTE_24_HEIGHT * ROUTE_24_WIDTH))) ; window

	; SOUTH to Route 5
	db GROUP_ROUTE_5, MAP_ROUTE_5 ; connected map (group, id)
	dw (Route5_BlockData) ; strip pointer
	dw ($C703 + 261 + ((CERULEAN_CITY_HEIGHT + 3) * (CERULEAN_CITY_WIDTH + 6))) ; strip destination
	db 10, ROUTE_5_WIDTH ; (connection strip length, connected map width)
	db 0, 246 ; yoffset, xoffset
	dw ($C807 + ROUTE_5_WIDTH) ; window

	; WEST to Route 4
	db GROUP_ROUTE_4, MAP_ROUTE_4 ; connected map (group, id)
	dw (Route4_BlockData + ROUTE_4_WIDTH - 3) ; strip pointer
	dw $c8d0 ; strip destination
	db 9, ROUTE_4_WIDTH ; (connection strip length, connected map width)
	db 246, ((ROUTE_4_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Route 9
	db GROUP_ROUTE_9, MAP_ROUTE_9 ; connected map (group, id)
	dw (Route9_BlockData) ; strip pointer
	dw $c94f ; strip destination
	db 9, ROUTE_9_WIDTH ; (connection strip length, connected map width)
	db 238, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_9_WIDTH) ; window
; 0x9569c

Route9_SecondMapHeader: ; 0x9569c
	; border block
	db $2c

	; height, width
	db ROUTE_9_HEIGHT, ROUTE_9_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route9_BlockData), Route9_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route9_MapScriptHeader), Route9_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route9_MapEventHeader

	; connections
	db SOUTH | WEST

	; SOUTH to Route 10 North
	db GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH ; connected map (group, id)
	dw (Route10North_BlockData) ; strip pointer
	dw ($C703 + 276 + ((ROUTE_9_HEIGHT + 3) * (ROUTE_9_WIDTH + 6))) ; strip destination
	db 10, ROUTE_10_NORTH_WIDTH ; (connection strip length, connected map width)
	db 0, 216 ; yoffset, xoffset
	dw ($C807 + ROUTE_10_NORTH_WIDTH) ; window

	; WEST to Cerulean City
	db GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY ; connected map (group, id)
	dw (CeruleanCity_BlockData + (((CERULEAN_CITY_HEIGHT - ROUTE_9_HEIGHT) * CERULEAN_CITY_WIDTH) - (CERULEAN_CITY_WIDTH * 3) + (CERULEAN_CITY_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, CERULEAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, ((CERULEAN_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window
; 0x956c0

Route24_SecondMapHeader: ; 0x956c0
	; border block
	db $2c

	; height, width
	db ROUTE_24_HEIGHT, ROUTE_24_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route24_BlockData), Route24_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route24_MapScriptHeader), Route24_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route24_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Route 25
	db GROUP_ROUTE_25, MAP_ROUTE_25 ; connected map (group, id)
	dw (Route25_BlockData + (ROUTE_25_HEIGHT * ROUTE_25_WIDTH) - (ROUTE_25_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 13, ROUTE_25_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_25_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_25_HEIGHT * 6) + (ROUTE_25_HEIGHT * ROUTE_25_WIDTH))) ; window

	; SOUTH to Cerulean City
	db GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY ; connected map (group, id)
	dw (CeruleanCity_BlockData + ((12 - 16 + ROUTE_24_WIDTH) / 2)) ; strip pointer
	dw ($C703 + 253 + ((ROUTE_24_HEIGHT + 3) * (ROUTE_24_WIDTH + 6))) ; strip destination
	db 16, CERULEAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 0, 12 ; yoffset, xoffset
	dw ($C807 + CERULEAN_CITY_WIDTH) ; window
; 0x956e4

Route25_SecondMapHeader: ; 0x956e4
	; border block
	db $2c

	; height, width
	db ROUTE_25_HEIGHT, ROUTE_25_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route25_BlockData), Route25_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route25_MapScriptHeader), Route25_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route25_MapEventHeader

	; connections
	db SOUTH

	; SOUTH to Route 24
	db GROUP_ROUTE_24, MAP_ROUTE_24 ; connected map (group, id)
	dw (Route24_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_25_HEIGHT + 3) * (ROUTE_25_WIDTH + 6))) ; strip destination
	db 10, ROUTE_24_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_24_WIDTH) ; window
; 0x956fc

Route3_SecondMapHeader: ; 0x956fc
	; border block
	db $2c

	; height, width
	db ROUTE_3_HEIGHT, ROUTE_3_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route3_BlockData), Route3_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route3_MapScriptHeader), Route3_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route3_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Pewter City
	db GROUP_PEWTER_CITY, MAP_PEWTER_CITY ; connected map (group, id)
	dw (PewterCity_BlockData + 21 + (PEWTER_CITY_HEIGHT * 2)) ; strip pointer
	dw $c800 ; strip destination
	db 15, PEWTER_CITY_WIDTH ; (connection strip length, connected map width)
	db 10, ((PEWTER_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Route 4
	db GROUP_ROUTE_4, MAP_ROUTE_4 ; connected map (group, id)
	dw (Route4_BlockData) ; strip pointer
	dw $c88d ; strip destination
	db 9, ROUTE_4_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_4_WIDTH) ; window
; 0x95720

Route4_SecondMapHeader: ; 0x95720
	; border block
	db $2c

	; height, width
	db ROUTE_4_HEIGHT, ROUTE_4_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route4_BlockData), Route4_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route4_MapScriptHeader), Route4_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route4_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Route 3
	db GROUP_ROUTE_3, MAP_ROUTE_3 ; connected map (group, id)
	dw (Route3_BlockData + ROUTE_3_WIDTH - 3) ; strip pointer
	dw $c84e ; strip destination
	db 9, ROUTE_3_WIDTH ; (connection strip length, connected map width)
	db 0, ((ROUTE_3_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 59) ; window

	; EAST to Cerulean City
	db GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY ; connected map (group, id)
	dw (CeruleanCity_BlockData + ((100 - (CERULEAN_CITY_WIDTH * 4)) * 2)) ; strip pointer
	dw $c817 ; strip destination
	db 15, CERULEAN_CITY_WIDTH ; (connection strip length, connected map width)
	db 10, 0 ; yoffset, xoffset
	dw ($C807 + CERULEAN_CITY_WIDTH) ; window
; 0x95744

Route8_SecondMapHeader: ; 0x95744
	; border block
	db $2c

	; height, width
	db ROUTE_8_HEIGHT, ROUTE_8_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route8_BlockData), Route8_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route8_MapScriptHeader), Route8_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route8_MapEventHeader

	; connections
	db WEST | EAST

	; WEST to Saffron City
	db GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY ; connected map (group, id)
	dw (SaffronCity_BlockData + (((SAFFRON_CITY_HEIGHT - ROUTE_8_HEIGHT) * SAFFRON_CITY_WIDTH) - (SAFFRON_CITY_WIDTH * 3) + (SAFFRON_CITY_WIDTH - 1) - 2)) ; strip pointer
	dw $c800 ; strip destination
	db 12, SAFFRON_CITY_WIDTH ; (connection strip length, connected map width)
	db 18, ((SAFFRON_CITY_WIDTH * 2) - 1) ; yoffset, xoffset
	dw ($C807 + 39) ; window

	; EAST to Lavender Town
	db GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN ; connected map (group, id)
	dw (LavenderTown_BlockData) ; strip pointer
	dw $c865 ; strip destination
	db 9, LAVENDER_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + LAVENDER_TOWN_WIDTH) ; window
; 0x95768

Route10North_SecondMapHeader: ; 0x95768
	; border block
	db $2c

	; height, width
	db ROUTE_10_NORTH_HEIGHT, ROUTE_10_NORTH_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route10North_BlockData), Route10North_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route10North_MapScriptHeader), Route10North_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route10North_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Route 9
	db GROUP_ROUTE_9, MAP_ROUTE_9 ; connected map (group, id)
	dw $7eae ; strip pointer
	dw ($C703 + 253) ; strip destination
	db 13, ROUTE_9_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_9_HEIGHT * 2) - 1), 40 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_9_HEIGHT * 6) + (ROUTE_9_HEIGHT * ROUTE_9_WIDTH))) ; window

	; SOUTH to Route 10 South
	db GROUP_ROUTE_10_SOUTH, MAP_ROUTE_10_SOUTH ; connected map (group, id)
	dw (Route10South_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_10_NORTH_HEIGHT + 3) * (ROUTE_10_NORTH_WIDTH + 6))) ; strip destination
	db 10, ROUTE_10_SOUTH_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + ROUTE_10_SOUTH_WIDTH) ; window
; 0x9578c

Route10South_SecondMapHeader: ; 0x9578c
	; border block
	db $2c

	; height, width
	db ROUTE_10_SOUTH_HEIGHT, ROUTE_10_SOUTH_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route10South_BlockData), Route10South_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route10South_MapScriptHeader), Route10South_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route10South_MapEventHeader

	; connections
	db NORTH | SOUTH

	; NORTH to Route 10 North
	db GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH ; connected map (group, id)
	dw (Route10North_BlockData + (ROUTE_10_NORTH_HEIGHT * ROUTE_10_NORTH_WIDTH) - (ROUTE_10_NORTH_WIDTH * 3)) ; strip pointer
	dw ($C703 + 256) ; strip destination
	db 10, ROUTE_10_NORTH_WIDTH ; (connection strip length, connected map width)
	db ((ROUTE_10_NORTH_HEIGHT * 2) - 1), 0 ; yoffset, xoffset
	dw ($C801 + ((ROUTE_10_NORTH_HEIGHT * 6) + (ROUTE_10_NORTH_HEIGHT * ROUTE_10_NORTH_WIDTH))) ; window

	; SOUTH to Lavender Town
	db GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN ; connected map (group, id)
	dw (LavenderTown_BlockData) ; strip pointer
	dw ($C703 + 256 + ((ROUTE_10_SOUTH_HEIGHT + 3) * (ROUTE_10_SOUTH_WIDTH + 6))) ; strip destination
	db 10, LAVENDER_TOWN_WIDTH ; (connection strip length, connected map width)
	db 0, 0 ; yoffset, xoffset
	dw ($C807 + LAVENDER_TOWN_WIDTH) ; window
; 0x957b0

Route23_SecondMapHeader: ; 0x957b0
	; border block
	db $f

	; height, width
	db ROUTE_23_HEIGHT, ROUTE_23_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route23_BlockData), Route23_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route23_MapScriptHeader), Route23_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route23_MapEventHeader

	; connections
	db 0
; 0x957bc

SproutTower1F_SecondMapHeader: ; 0x957bc
	; border block
	db $0

	; height, width
	db SPROUT_TOWER_1F_HEIGHT, SPROUT_TOWER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SproutTower1F_BlockData), SproutTower1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SproutTower1F_MapScriptHeader), SproutTower1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SproutTower1F_MapEventHeader

	; connections
	db 0
; 0x957c8

SproutTower2F_SecondMapHeader: ; 0x957c8
	; border block
	db $0

	; height, width
	db SPROUT_TOWER_2F_HEIGHT, SPROUT_TOWER_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SproutTower2F_BlockData), SproutTower2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SproutTower2F_MapScriptHeader), SproutTower2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SproutTower2F_MapEventHeader

	; connections
	db 0
; 0x957d4

SproutTower3F_SecondMapHeader: ; 0x957d4
	; border block
	db $0

	; height, width
	db SPROUT_TOWER_3F_HEIGHT, SPROUT_TOWER_3F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SproutTower3F_BlockData), SproutTower3F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SproutTower3F_MapScriptHeader), SproutTower3F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SproutTower3F_MapEventHeader

	; connections
	db 0
; 0x957e0

TinTower1F_SecondMapHeader: ; 0x957e0
	; border block
	db $0

	; height, width
	db TIN_TOWER_1F_HEIGHT, TIN_TOWER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TinTower1F_BlockData), TinTower1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TinTower1F_MapScriptHeader), TinTower1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TinTower1F_MapEventHeader

	; connections
	db 0
; 0x957ec

TinTower2F_SecondMapHeader: ; 0x957ec
	; border block
	db $0

	; height, width
	db TIN_TOWER_2F_HEIGHT, TIN_TOWER_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TinTower2F_BlockData), TinTower2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TinTower2F_MapScriptHeader), TinTower2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TinTower2F_MapEventHeader

	; connections
	db 0
; 0x957f8

TinTower3F_SecondMapHeader: ; 0x957f8
	; border block
	db $0

	; height, width
	db TIN_TOWER_3F_HEIGHT, TIN_TOWER_3F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TinTower3F_BlockData), TinTower3F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TinTower3F_MapScriptHeader), TinTower3F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TinTower3F_MapEventHeader

	; connections
	db 0
; 0x95804

TinTower4F_SecondMapHeader: ; 0x95804
	; border block
	db $0

	; height, width
	db TIN_TOWER_4F_HEIGHT, TIN_TOWER_4F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TinTower4F_BlockData), TinTower4F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TinTower4F_MapScriptHeader), TinTower4F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TinTower4F_MapEventHeader

	; connections
	db 0
; 0x95810

TinTower5F_SecondMapHeader: ; 0x95810
	; border block
	db $0

	; height, width
	db TIN_TOWER_5F_HEIGHT, TIN_TOWER_5F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TinTower5F_BlockData), TinTower5F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TinTower5F_MapScriptHeader), TinTower5F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TinTower5F_MapEventHeader

	; connections
	db 0
; 0x9581c

TinTower6F_SecondMapHeader: ; 0x9581c
	; border block
	db $0

	; height, width
	db TIN_TOWER_6F_HEIGHT, TIN_TOWER_6F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TinTower6F_BlockData), TinTower6F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TinTower6F_MapScriptHeader), TinTower6F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TinTower6F_MapEventHeader

	; connections
	db 0
; 0x95828

TinTower7F_SecondMapHeader: ; 0x95828
	; border block
	db $0

	; height, width
	db TIN_TOWER_7F_HEIGHT, TIN_TOWER_7F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TinTower7F_BlockData), TinTower7F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TinTower7F_MapScriptHeader), TinTower7F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TinTower7F_MapEventHeader

	; connections
	db 0
; 0x95834

TinTower8F_SecondMapHeader: ; 0x95834
	; border block
	db $0

	; height, width
	db TIN_TOWER_8F_HEIGHT, TIN_TOWER_8F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TinTower8F_BlockData), TinTower8F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TinTower8F_MapScriptHeader), TinTower8F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TinTower8F_MapEventHeader

	; connections
	db 0
; 0x95840

TinTower9F_SecondMapHeader: ; 0x95840
	; border block
	db $0

	; height, width
	db TIN_TOWER_9F_HEIGHT, TIN_TOWER_9F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TinTower9F_BlockData), TinTower9F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TinTower9F_MapScriptHeader), TinTower9F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TinTower9F_MapEventHeader

	; connections
	db 0
; 0x9584c

BurnedTower1F_SecondMapHeader: ; 0x9584c
	; border block
	db $0

	; height, width
	db BURNED_TOWER_1F_HEIGHT, BURNED_TOWER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BurnedTower1F_BlockData), BurnedTower1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BurnedTower1F_MapScriptHeader), BurnedTower1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BurnedTower1F_MapEventHeader

	; connections
	db 0
; 0x95858

BurnedTowerB1F_SecondMapHeader: ; 0x95858
	; border block
	db $9

	; height, width
	db BURNED_TOWER_B1F_HEIGHT, BURNED_TOWER_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BurnedTowerB1F_BlockData), BurnedTowerB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BurnedTowerB1F_MapScriptHeader), BurnedTowerB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BurnedTowerB1F_MapEventHeader

	; connections
	db 0
; 0x95864

NationalPark_SecondMapHeader: ; 0x95864
	; border block
	db $0

	; height, width
	db NATIONAL_PARK_HEIGHT, NATIONAL_PARK_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(NationalPark_BlockData), NationalPark_BlockData

	; script header (bank-then-pointer)
	dbw BANK(NationalPark_MapScriptHeader), NationalPark_MapScriptHeader

	; map event header (bank-then-pointer)
	dw NationalPark_MapEventHeader

	; connections
	db 0
; 0x95870

NationalParkBugContest_SecondMapHeader: ; 0x95870
	; border block
	db $0

	; height, width
	db NATIONAL_PARK_BUG_CONTEST_HEIGHT, NATIONAL_PARK_BUG_CONTEST_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(NationalPark_BlockData), NationalPark_BlockData

	; script header (bank-then-pointer)
	dbw BANK(NationalParkBugContest_MapScriptHeader), NationalParkBugContest_MapScriptHeader

	; map event header (bank-then-pointer)
	dw NationalParkBugContest_MapEventHeader

	; connections
	db 0
; 0x9587c

RadioTower1F_SecondMapHeader: ; 0x9587c
	; border block
	db $0

	; height, width
	db RADIO_TOWER_1F_HEIGHT, RADIO_TOWER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RadioTower1F_BlockData), RadioTower1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RadioTower1F_MapScriptHeader), RadioTower1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RadioTower1F_MapEventHeader

	; connections
	db 0
; 0x95888

RadioTower2F_SecondMapHeader: ; 0x95888
	; border block
	db $0

	; height, width
	db RADIO_TOWER_2F_HEIGHT, RADIO_TOWER_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RadioTower2F_BlockData), RadioTower2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RadioTower2F_MapScriptHeader), RadioTower2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RadioTower2F_MapEventHeader

	; connections
	db 0
; 0x95894

RadioTower3F_SecondMapHeader: ; 0x95894
	; border block
	db $0

	; height, width
	db RADIO_TOWER_3F_HEIGHT, RADIO_TOWER_3F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RadioTower3F_BlockData), RadioTower3F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RadioTower3F_MapScriptHeader), RadioTower3F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RadioTower3F_MapEventHeader

	; connections
	db 0
; 0x958a0

RadioTower4F_SecondMapHeader: ; 0x958a0
	; border block
	db $0

	; height, width
	db RADIO_TOWER_4F_HEIGHT, RADIO_TOWER_4F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RadioTower4F_BlockData), RadioTower4F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RadioTower4F_MapScriptHeader), RadioTower4F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RadioTower4F_MapEventHeader

	; connections
	db 0
; 0x958ac

RadioTower5F_SecondMapHeader: ; 0x958ac
	; border block
	db $0

	; height, width
	db RADIO_TOWER_5F_HEIGHT, RADIO_TOWER_5F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RadioTower5F_BlockData), RadioTower5F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RadioTower5F_MapScriptHeader), RadioTower5F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RadioTower5F_MapEventHeader

	; connections
	db 0
; 0x958b8

RuinsofAlphOutside_SecondMapHeader: ; 0x958b8
	; border block
	db $5

	; height, width
	db RUINS_OF_ALPH_OUTSIDE_HEIGHT, RUINS_OF_ALPH_OUTSIDE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphOutside_BlockData), RuinsofAlphOutside_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphOutside_MapScriptHeader), RuinsofAlphOutside_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphOutside_MapEventHeader

	; connections
	db 0
; 0x958c4

RuinsofAlphHoOhChamber_SecondMapHeader: ; 0x958c4
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_HO_OH_CHAMBER_HEIGHT, RUINS_OF_ALPH_HO_OH_CHAMBER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhChamber_BlockData), RuinsofAlphHoOhChamber_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhChamber_MapScriptHeader), RuinsofAlphHoOhChamber_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphHoOhChamber_MapEventHeader

	; connections
	db 0
; 0x958d0

RuinsofAlphKabutoChamber_SecondMapHeader: ; 0x958d0
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_KABUTO_CHAMBER_HEIGHT, RUINS_OF_ALPH_KABUTO_CHAMBER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhChamber_BlockData), RuinsofAlphHoOhChamber_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphKabutoChamber_MapScriptHeader), RuinsofAlphKabutoChamber_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphKabutoChamber_MapEventHeader

	; connections
	db 0
; 0x958dc

RuinsofAlphOmanyteChamber_SecondMapHeader: ; 0x958dc
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_OMANYTE_CHAMBER_HEIGHT, RUINS_OF_ALPH_OMANYTE_CHAMBER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhChamber_BlockData), RuinsofAlphHoOhChamber_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphOmanyteChamber_MapScriptHeader), RuinsofAlphOmanyteChamber_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphOmanyteChamber_MapEventHeader

	; connections
	db 0
; 0x958e8

RuinsofAlphAerodactylChamber_SecondMapHeader: ; 0x958e8
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_AERODACTYL_CHAMBER_HEIGHT, RUINS_OF_ALPH_AERODACTYL_CHAMBER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhChamber_BlockData), RuinsofAlphHoOhChamber_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphAerodactylChamber_MapScriptHeader), RuinsofAlphAerodactylChamber_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphAerodactylChamber_MapEventHeader

	; connections
	db 0
; 0x958f4

RuinsofAlphInnerChamber_SecondMapHeader: ; 0x958f4
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_INNER_CHAMBER_HEIGHT, RUINS_OF_ALPH_INNER_CHAMBER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphInnerChamber_BlockData), RuinsofAlphInnerChamber_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphInnerChamber_MapScriptHeader), RuinsofAlphInnerChamber_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphInnerChamber_MapEventHeader

	; connections
	db 0
; 0x95900

RuinsofAlphResearchCenter_SecondMapHeader: ; 0x95900
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_RESEARCH_CENTER_HEIGHT, RUINS_OF_ALPH_RESEARCH_CENTER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphResearchCenter_BlockData), RuinsofAlphResearchCenter_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphResearchCenter_MapScriptHeader), RuinsofAlphResearchCenter_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphResearchCenter_MapEventHeader

	; connections
	db 0
; 0x9590c

RuinsofAlphHoOhItemRoom_SecondMapHeader: ; 0x9590c
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_HO_OH_ITEM_ROOM_HEIGHT, RUINS_OF_ALPH_HO_OH_ITEM_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhItemRoom_BlockData), RuinsofAlphHoOhItemRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhItemRoom_MapScriptHeader), RuinsofAlphHoOhItemRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphHoOhItemRoom_MapEventHeader

	; connections
	db 0
; 0x95918

RuinsofAlphKabutoItemRoom_SecondMapHeader: ; 0x95918
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_KABUTO_ITEM_ROOM_HEIGHT, RUINS_OF_ALPH_KABUTO_ITEM_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhItemRoom_BlockData), RuinsofAlphHoOhItemRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphKabutoItemRoom_MapScriptHeader), RuinsofAlphKabutoItemRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphKabutoItemRoom_MapEventHeader

	; connections
	db 0
; 0x95924

RuinsofAlphOmanyteItemRoom_SecondMapHeader: ; 0x95924
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_OMANYTE_ITEM_ROOM_HEIGHT, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhItemRoom_BlockData), RuinsofAlphHoOhItemRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphOmanyteItemRoom_MapScriptHeader), RuinsofAlphOmanyteItemRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphOmanyteItemRoom_MapEventHeader

	; connections
	db 0
; 0x95930

RuinsofAlphAerodactylItemRoom_SecondMapHeader: ; 0x95930
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM_HEIGHT, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhItemRoom_BlockData), RuinsofAlphHoOhItemRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphAerodactylItemRoom_MapScriptHeader), RuinsofAlphAerodactylItemRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphAerodactylItemRoom_MapEventHeader

	; connections
	db 0
; 0x9593c

RuinsofAlphHoOhWordRoom_SecondMapHeader: ; 0x9593c
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_HO_OH_WORD_ROOM_HEIGHT, RUINS_OF_ALPH_HO_OH_WORD_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhWordRoom_BlockData), RuinsofAlphHoOhWordRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphHoOhWordRoom_MapScriptHeader), RuinsofAlphHoOhWordRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphHoOhWordRoom_MapEventHeader

	; connections
	db 0
; 0x95948

RuinsofAlphKabutoWordRoom_SecondMapHeader: ; 0x95948
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_KABUTO_WORD_ROOM_HEIGHT, RUINS_OF_ALPH_KABUTO_WORD_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphKabutoWordRoom_BlockData), RuinsofAlphKabutoWordRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphKabutoWordRoom_MapScriptHeader), RuinsofAlphKabutoWordRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphKabutoWordRoom_MapEventHeader

	; connections
	db 0
; 0x95954

RuinsofAlphOmanyteWordRoom_SecondMapHeader: ; 0x95954
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_OMANYTE_WORD_ROOM_HEIGHT, RUINS_OF_ALPH_OMANYTE_WORD_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphOmanyteWordRoom_BlockData), RuinsofAlphOmanyteWordRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphOmanyteWordRoom_MapScriptHeader), RuinsofAlphOmanyteWordRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphOmanyteWordRoom_MapEventHeader

	; connections
	db 0
; 0x95960

RuinsofAlphAerodactylWordRoom_SecondMapHeader: ; 0x95960
	; border block
	db $0

	; height, width
	db RUINS_OF_ALPH_AERODACTYL_WORD_ROOM_HEIGHT, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RuinsofAlphAerodactylWordRoom_BlockData), RuinsofAlphAerodactylWordRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RuinsofAlphAerodactylWordRoom_MapScriptHeader), RuinsofAlphAerodactylWordRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RuinsofAlphAerodactylWordRoom_MapEventHeader

	; connections
	db 0
; 0x9596c

UnionCave1F_SecondMapHeader: ; 0x9596c
	; border block
	db $9

	; height, width
	db UNION_CAVE_1F_HEIGHT, UNION_CAVE_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(UnionCave1F_BlockData), UnionCave1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(UnionCave1F_MapScriptHeader), UnionCave1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw UnionCave1F_MapEventHeader

	; connections
	db 0
; 0x95978

UnionCaveB1F_SecondMapHeader: ; 0x95978
	; border block
	db $9

	; height, width
	db UNION_CAVE_B1F_HEIGHT, UNION_CAVE_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(UnionCaveB1F_BlockData), UnionCaveB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(UnionCaveB1F_MapScriptHeader), UnionCaveB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw UnionCaveB1F_MapEventHeader

	; connections
	db 0
; 0x95984

UnionCaveB2F_SecondMapHeader: ; 0x95984
	; border block
	db $9

	; height, width
	db UNION_CAVE_B2F_HEIGHT, UNION_CAVE_B2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(UnionCaveB2F_BlockData), UnionCaveB2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(UnionCaveB2F_MapScriptHeader), UnionCaveB2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw UnionCaveB2F_MapEventHeader

	; connections
	db 0
; 0x95990

SlowpokeWellB1F_SecondMapHeader: ; 0x95990
	; border block
	db $9

	; height, width
	db SLOWPOKE_WELL_B1F_HEIGHT, SLOWPOKE_WELL_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SlowpokeWellB1F_BlockData), SlowpokeWellB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SlowpokeWellB1F_MapScriptHeader), SlowpokeWellB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SlowpokeWellB1F_MapEventHeader

	; connections
	db 0
; 0x9599c

SlowpokeWellB2F_SecondMapHeader: ; 0x9599c
	; border block
	db $9

	; height, width
	db SLOWPOKE_WELL_B2F_HEIGHT, SLOWPOKE_WELL_B2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SlowpokeWellB2F_BlockData), SlowpokeWellB2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SlowpokeWellB2F_MapScriptHeader), SlowpokeWellB2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SlowpokeWellB2F_MapEventHeader

	; connections
	db 0
; 0x959a8

OlivineLighthouse1F_SecondMapHeader: ; 0x959a8
	; border block
	db $0

	; height, width
	db OLIVINE_LIGHTHOUSE_1F_HEIGHT, OLIVINE_LIGHTHOUSE_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineLighthouse1F_BlockData), OlivineLighthouse1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineLighthouse1F_MapScriptHeader), OlivineLighthouse1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineLighthouse1F_MapEventHeader

	; connections
	db 0
; 0x959b4

OlivineLighthouse2F_SecondMapHeader: ; 0x959b4
	; border block
	db $0

	; height, width
	db OLIVINE_LIGHTHOUSE_2F_HEIGHT, OLIVINE_LIGHTHOUSE_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineLighthouse2F_BlockData), OlivineLighthouse2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineLighthouse2F_MapScriptHeader), OlivineLighthouse2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineLighthouse2F_MapEventHeader

	; connections
	db 0
; 0x959c0

OlivineLighthouse3F_SecondMapHeader: ; 0x959c0
	; border block
	db $0

	; height, width
	db OLIVINE_LIGHTHOUSE_3F_HEIGHT, OLIVINE_LIGHTHOUSE_3F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineLighthouse3F_BlockData), OlivineLighthouse3F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineLighthouse3F_MapScriptHeader), OlivineLighthouse3F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineLighthouse3F_MapEventHeader

	; connections
	db 0
; 0x959cc

OlivineLighthouse4F_SecondMapHeader: ; 0x959cc
	; border block
	db $0

	; height, width
	db OLIVINE_LIGHTHOUSE_4F_HEIGHT, OLIVINE_LIGHTHOUSE_4F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineLighthouse4F_BlockData), OlivineLighthouse4F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineLighthouse4F_MapScriptHeader), OlivineLighthouse4F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineLighthouse4F_MapEventHeader

	; connections
	db 0
; 0x959d8

OlivineLighthouse5F_SecondMapHeader: ; 0x959d8
	; border block
	db $0

	; height, width
	db OLIVINE_LIGHTHOUSE_5F_HEIGHT, OLIVINE_LIGHTHOUSE_5F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineLighthouse5F_BlockData), OlivineLighthouse5F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineLighthouse5F_MapScriptHeader), OlivineLighthouse5F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineLighthouse5F_MapEventHeader

	; connections
	db 0
; 0x959e4

OlivineLighthouse6F_SecondMapHeader: ; 0x959e4
	; border block
	db $0

	; height, width
	db OLIVINE_LIGHTHOUSE_6F_HEIGHT, OLIVINE_LIGHTHOUSE_6F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineLighthouse6F_BlockData), OlivineLighthouse6F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineLighthouse6F_MapScriptHeader), OlivineLighthouse6F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineLighthouse6F_MapEventHeader

	; connections
	db 0
; 0x959f0

MahoganyMart1F_SecondMapHeader: ; 0x959f0
	; border block
	db $0

	; height, width
	db MAHOGANY_MART_1F_HEIGHT, MAHOGANY_MART_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MahoganyMart1F_BlockData), MahoganyMart1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MahoganyMart1F_MapScriptHeader), MahoganyMart1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MahoganyMart1F_MapEventHeader

	; connections
	db 0
; 0x959fc

TeamRocketBaseB1F_SecondMapHeader: ; 0x959fc
	; border block
	db $0

	; height, width
	db TEAM_ROCKET_BASE_B1F_HEIGHT, TEAM_ROCKET_BASE_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TeamRocketBaseB1F_BlockData), TeamRocketBaseB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TeamRocketBaseB1F_MapScriptHeader), TeamRocketBaseB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TeamRocketBaseB1F_MapEventHeader

	; connections
	db 0
; 0x95a08

TeamRocketBaseB2F_SecondMapHeader: ; 0x95a08
	; border block
	db $0

	; height, width
	db TEAM_ROCKET_BASE_B2F_HEIGHT, TEAM_ROCKET_BASE_B2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TeamRocketBaseB2F_BlockData), TeamRocketBaseB2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TeamRocketBaseB2F_MapScriptHeader), TeamRocketBaseB2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TeamRocketBaseB2F_MapEventHeader

	; connections
	db 0
; 0x95a14

TeamRocketBaseB3F_SecondMapHeader: ; 0x95a14
	; border block
	db $0

	; height, width
	db TEAM_ROCKET_BASE_B3F_HEIGHT, TEAM_ROCKET_BASE_B3F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TeamRocketBaseB3F_BlockData), TeamRocketBaseB3F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TeamRocketBaseB3F_MapScriptHeader), TeamRocketBaseB3F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TeamRocketBaseB3F_MapEventHeader

	; connections
	db 0
; 0x95a20

IlexForest_SecondMapHeader: ; 0x95a20
	; border block
	db $5

	; height, width
	db ILEX_FOREST_HEIGHT, ILEX_FOREST_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(IlexForest_BlockData), IlexForest_BlockData

	; script header (bank-then-pointer)
	dbw BANK(IlexForest_MapScriptHeader), IlexForest_MapScriptHeader

	; map event header (bank-then-pointer)
	dw IlexForest_MapEventHeader

	; connections
	db 0
; 0x95a2c

WarehouseEntrance_SecondMapHeader: ; 0x95a2c
	; border block
	db $0

	; height, width
	db WAREHOUSE_ENTRANCE_HEIGHT, WAREHOUSE_ENTRANCE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WarehouseEntrance_BlockData), WarehouseEntrance_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WarehouseEntrance_MapScriptHeader), WarehouseEntrance_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WarehouseEntrance_MapEventHeader

	; connections
	db 0
; 0x95a38

UndergroundPathSwitchRoomEntrances_SecondMapHeader: ; 0x95a38
	; border block
	db $0

	; height, width
	db UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_HEIGHT, UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(UndergroundPathSwitchRoomEntrances_BlockData), UndergroundPathSwitchRoomEntrances_BlockData

	; script header (bank-then-pointer)
	dbw BANK(UndergroundPathSwitchRoomEntrances_MapScriptHeader), UndergroundPathSwitchRoomEntrances_MapScriptHeader

	; map event header (bank-then-pointer)
	dw UndergroundPathSwitchRoomEntrances_MapEventHeader

	; connections
	db 0
; 0x95a44

GoldenrodDeptStoreB1F_SecondMapHeader: ; 0x95a44
	; border block
	db $0

	; height, width
	db GOLDENROD_DEPT_STORE_B1F_HEIGHT, GOLDENROD_DEPT_STORE_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStoreB1F_BlockData), GoldenrodDeptStoreB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodDeptStoreB1F_MapScriptHeader), GoldenrodDeptStoreB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodDeptStoreB1F_MapEventHeader

	; connections
	db 0
; 0x95a50

UndergroundWarehouse_SecondMapHeader: ; 0x95a50
	; border block
	db $0

	; height, width
	db UNDERGROUND_WAREHOUSE_HEIGHT, UNDERGROUND_WAREHOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(UndergroundWarehouse_BlockData), UndergroundWarehouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(UndergroundWarehouse_MapScriptHeader), UndergroundWarehouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw UndergroundWarehouse_MapEventHeader

	; connections
	db 0
; 0x95a5c

MountMortar1FOutside_SecondMapHeader: ; 0x95a5c
	; border block
	db $9

	; height, width
	db MOUNT_MORTAR_1F_OUTSIDE_HEIGHT, MOUNT_MORTAR_1F_OUTSIDE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MountMortar1FOutside_BlockData), MountMortar1FOutside_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MountMortar1FOutside_MapScriptHeader), MountMortar1FOutside_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MountMortar1FOutside_MapEventHeader

	; connections
	db 0
; 0x95a68

MountMortar1FInside_SecondMapHeader: ; 0x95a68
	; border block
	db $9

	; height, width
	db MOUNT_MORTAR_1F_INSIDE_HEIGHT, MOUNT_MORTAR_1F_INSIDE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MountMortar1FInside_BlockData), MountMortar1FInside_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MountMortar1FInside_MapScriptHeader), MountMortar1FInside_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MountMortar1FInside_MapEventHeader

	; connections
	db 0
; 0x95a74

MountMortar2FInside_SecondMapHeader: ; 0x95a74
	; border block
	db $9

	; height, width
	db MOUNT_MORTAR_2F_INSIDE_HEIGHT, MOUNT_MORTAR_2F_INSIDE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MountMortar2FInside_BlockData), MountMortar2FInside_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MountMortar2FInside_MapScriptHeader), MountMortar2FInside_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MountMortar2FInside_MapEventHeader

	; connections
	db 0
; 0x95a80

MountMortarB1F_SecondMapHeader: ; 0x95a80
	; border block
	db $9

	; height, width
	db MOUNT_MORTAR_B1F_HEIGHT, MOUNT_MORTAR_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MountMortarB1F_BlockData), MountMortarB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MountMortarB1F_MapScriptHeader), MountMortarB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MountMortarB1F_MapEventHeader

	; connections
	db 0
; 0x95a8c

IcePath1F_SecondMapHeader: ; 0x95a8c
	; border block
	db $9

	; height, width
	db ICE_PATH_1F_HEIGHT, ICE_PATH_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(IcePath1F_BlockData), IcePath1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(IcePath1F_MapScriptHeader), IcePath1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw IcePath1F_MapEventHeader

	; connections
	db 0
; 0x95a98

IcePathB1F_SecondMapHeader: ; 0x95a98
	; border block
	db $19

	; height, width
	db ICE_PATH_B1F_HEIGHT, ICE_PATH_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(IcePathB1F_BlockData), IcePathB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(IcePathB1F_MapScriptHeader), IcePathB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw IcePathB1F_MapEventHeader

	; connections
	db 0
; 0x95aa4

IcePathB2FMahoganySide_SecondMapHeader: ; 0x95aa4
	; border block
	db $19

	; height, width
	db ICE_PATH_B2F_MAHOGANY_SIDE_HEIGHT, ICE_PATH_B2F_MAHOGANY_SIDE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(IcePathB2FMahoganySide_BlockData), IcePathB2FMahoganySide_BlockData

	; script header (bank-then-pointer)
	dbw BANK(IcePathB2FMahoganySide_MapScriptHeader), IcePathB2FMahoganySide_MapScriptHeader

	; map event header (bank-then-pointer)
	dw IcePathB2FMahoganySide_MapEventHeader

	; connections
	db 0
; 0x95ab0

IcePathB2FBlackthornSide_SecondMapHeader: ; 0x95ab0
	; border block
	db $19

	; height, width
	db ICE_PATH_B2F_BLACKTHORN_SIDE_HEIGHT, ICE_PATH_B2F_BLACKTHORN_SIDE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(IcePathB2FBlackthornSide_BlockData), IcePathB2FBlackthornSide_BlockData

	; script header (bank-then-pointer)
	dbw BANK(IcePathB2FBlackthornSide_MapScriptHeader), IcePathB2FBlackthornSide_MapScriptHeader

	; map event header (bank-then-pointer)
	dw IcePathB2FBlackthornSide_MapEventHeader

	; connections
	db 0
; 0x95abc

IcePathB3F_SecondMapHeader: ; 0x95abc
	; border block
	db $19

	; height, width
	db ICE_PATH_B3F_HEIGHT, ICE_PATH_B3F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(IcePathB3F_BlockData), IcePathB3F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(IcePathB3F_MapScriptHeader), IcePathB3F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw IcePathB3F_MapEventHeader

	; connections
	db 0
; 0x95ac8

WhirlIslandNW_SecondMapHeader: ; 0x95ac8
	; border block
	db $9

	; height, width
	db WHIRL_ISLAND_NW_HEIGHT, WHIRL_ISLAND_NW_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WhirlIslandNW_BlockData), WhirlIslandNW_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WhirlIslandNW_MapScriptHeader), WhirlIslandNW_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WhirlIslandNW_MapEventHeader

	; connections
	db 0
; 0x95ad4

WhirlIslandNE_SecondMapHeader: ; 0x95ad4
	; border block
	db $9

	; height, width
	db WHIRL_ISLAND_NE_HEIGHT, WHIRL_ISLAND_NE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WhirlIslandNE_BlockData), WhirlIslandNE_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WhirlIslandNE_MapScriptHeader), WhirlIslandNE_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WhirlIslandNE_MapEventHeader

	; connections
	db 0
; 0x95ae0

WhirlIslandSW_SecondMapHeader: ; 0x95ae0
	; border block
	db $9

	; height, width
	db WHIRL_ISLAND_SW_HEIGHT, WHIRL_ISLAND_SW_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WhirlIslandSW_BlockData), WhirlIslandSW_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WhirlIslandSW_MapScriptHeader), WhirlIslandSW_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WhirlIslandSW_MapEventHeader

	; connections
	db 0
; 0x95aec

WhirlIslandCave_SecondMapHeader: ; 0x95aec
	; border block
	db $9

	; height, width
	db WHIRL_ISLAND_CAVE_HEIGHT, WHIRL_ISLAND_CAVE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WhirlIslandCave_BlockData), WhirlIslandCave_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WhirlIslandCave_MapScriptHeader), WhirlIslandCave_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WhirlIslandCave_MapEventHeader

	; connections
	db 0
; 0x95af8

WhirlIslandSE_SecondMapHeader: ; 0x95af8
	; border block
	db $f

	; height, width
	db WHIRL_ISLAND_SE_HEIGHT, WHIRL_ISLAND_SE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WhirlIslandSE_BlockData), WhirlIslandSE_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WhirlIslandSE_MapScriptHeader), WhirlIslandSE_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WhirlIslandSE_MapEventHeader

	; connections
	db 0
; 0x95b04

WhirlIslandB1F_SecondMapHeader: ; 0x95b04
	; border block
	db $9

	; height, width
	db WHIRL_ISLAND_B1F_HEIGHT, WHIRL_ISLAND_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WhirlIslandB1F_BlockData), WhirlIslandB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WhirlIslandB1F_MapScriptHeader), WhirlIslandB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WhirlIslandB1F_MapEventHeader

	; connections
	db 0
; 0x95b10

WhirlIslandB2F_SecondMapHeader: ; 0x95b10
	; border block
	db $2e

	; height, width
	db WHIRL_ISLAND_B2F_HEIGHT, WHIRL_ISLAND_B2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WhirlIslandB2F_BlockData), WhirlIslandB2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WhirlIslandB2F_MapScriptHeader), WhirlIslandB2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WhirlIslandB2F_MapEventHeader

	; connections
	db 0
; 0x95b1c

WhirlIslandLugiaChamber_SecondMapHeader: ; 0x95b1c
	; border block
	db $f

	; height, width
	db WHIRL_ISLAND_LUGIA_CHAMBER_HEIGHT, WHIRL_ISLAND_LUGIA_CHAMBER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WhirlIslandLugiaChamber_BlockData), WhirlIslandLugiaChamber_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WhirlIslandLugiaChamber_MapScriptHeader), WhirlIslandLugiaChamber_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WhirlIslandLugiaChamber_MapEventHeader

	; connections
	db 0
; 0x95b28

SilverCaveRoom1_SecondMapHeader: ; 0x95b28
	; border block
	db $9

	; height, width
	db SILVER_CAVE_ROOM_1_HEIGHT, SILVER_CAVE_ROOM_1_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SilverCaveRoom1_BlockData), SilverCaveRoom1_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SilverCaveRoom1_MapScriptHeader), SilverCaveRoom1_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SilverCaveRoom1_MapEventHeader

	; connections
	db 0
; 0x95b34

SilverCaveRoom2_SecondMapHeader: ; 0x95b34
	; border block
	db $9

	; height, width
	db SILVER_CAVE_ROOM_2_HEIGHT, SILVER_CAVE_ROOM_2_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SilverCaveRoom2_BlockData), SilverCaveRoom2_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SilverCaveRoom2_MapScriptHeader), SilverCaveRoom2_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SilverCaveRoom2_MapEventHeader

	; connections
	db 0
; 0x95b40

SilverCaveRoom3_SecondMapHeader: ; 0x95b40
	; border block
	db $9

	; height, width
	db SILVER_CAVE_ROOM_3_HEIGHT, SILVER_CAVE_ROOM_3_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SilverCaveRoom3_BlockData), SilverCaveRoom3_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SilverCaveRoom3_MapScriptHeader), SilverCaveRoom3_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SilverCaveRoom3_MapEventHeader

	; connections
	db 0
; 0x95b4c

SilverCaveItemRooms_SecondMapHeader: ; 0x95b4c
	; border block
	db $9

	; height, width
	db SILVER_CAVE_ITEM_ROOMS_HEIGHT, SILVER_CAVE_ITEM_ROOMS_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SilverCaveItemRooms_BlockData), SilverCaveItemRooms_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SilverCaveItemRooms_MapScriptHeader), SilverCaveItemRooms_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SilverCaveItemRooms_MapEventHeader

	; connections
	db 0
; 0x95b58

DarkCaveVioletEntrance_SecondMapHeader: ; 0x95b58
	; border block
	db $9

	; height, width
	db DARK_CAVE_VIOLET_ENTRANCE_HEIGHT, DARK_CAVE_VIOLET_ENTRANCE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(DarkCaveVioletEntrance_BlockData), DarkCaveVioletEntrance_BlockData

	; script header (bank-then-pointer)
	dbw BANK(DarkCaveVioletEntrance_MapScriptHeader), DarkCaveVioletEntrance_MapScriptHeader

	; map event header (bank-then-pointer)
	dw DarkCaveVioletEntrance_MapEventHeader

	; connections
	db 0
; 0x95b64

DarkCaveBlackthornEntrance_SecondMapHeader: ; 0x95b64
	; border block
	db $9

	; height, width
	db DARK_CAVE_BLACKTHORN_ENTRANCE_HEIGHT, DARK_CAVE_BLACKTHORN_ENTRANCE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(DarkCaveBlackthornEntrance_BlockData), DarkCaveBlackthornEntrance_BlockData

	; script header (bank-then-pointer)
	dbw BANK(DarkCaveBlackthornEntrance_MapScriptHeader), DarkCaveBlackthornEntrance_MapScriptHeader

	; map event header (bank-then-pointer)
	dw DarkCaveBlackthornEntrance_MapEventHeader

	; connections
	db 0
; 0x95b70

DragonsDen1F_SecondMapHeader: ; 0x95b70
	; border block
	db $9

	; height, width
	db DRAGONS_DEN_1F_HEIGHT, DRAGONS_DEN_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(DragonsDen1F_BlockData), DragonsDen1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(DragonsDen1F_MapScriptHeader), DragonsDen1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw DragonsDen1F_MapEventHeader

	; connections
	db 0
; 0x95b7c

DragonsDenB1F_SecondMapHeader: ; 0x95b7c
	; border block
	db $71

	; height, width
	db DRAGONS_DEN_B1F_HEIGHT, DRAGONS_DEN_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(DragonsDenB1F_BlockData), DragonsDenB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(DragonsDenB1F_MapScriptHeader), DragonsDenB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw DragonsDenB1F_MapEventHeader

	; connections
	db 0
; 0x95b88

DragonShrine_SecondMapHeader: ; 0x95b88
	; border block
	db $0

	; height, width
	db DRAGON_SHRINE_HEIGHT, DRAGON_SHRINE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(DragonShrine_BlockData), DragonShrine_BlockData

	; script header (bank-then-pointer)
	dbw BANK(DragonShrine_MapScriptHeader), DragonShrine_MapScriptHeader

	; map event header (bank-then-pointer)
	dw DragonShrine_MapEventHeader

	; connections
	db 0
; 0x95b94

TohjoFalls_SecondMapHeader: ; 0x95b94
	; border block
	db $9

	; height, width
	db TOHJO_FALLS_HEIGHT, TOHJO_FALLS_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TohjoFalls_BlockData), TohjoFalls_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TohjoFalls_MapScriptHeader), TohjoFalls_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TohjoFalls_MapEventHeader

	; connections
	db 0
; 0x95ba0

OlivinePokeCenter1F_SecondMapHeader: ; 0x95ba0
	; border block
	db $0

	; height, width
	db OLIVINE_POKECENTER_1F_HEIGHT, OLIVINE_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_MapScriptHeader), OlivinePokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivinePokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95bac

OlivineGym_SecondMapHeader: ; 0x95bac
	; border block
	db $0

	; height, width
	db OLIVINE_GYM_HEIGHT, OLIVINE_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineGym_BlockData), OlivineGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineGym_MapScriptHeader), OlivineGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineGym_MapEventHeader

	; connections
	db 0
; 0x95bb8

OlivineVoltorbHouse_SecondMapHeader: ; 0x95bb8
	; border block
	db $0

	; height, width
	db OLIVINE_VOLTORB_HOUSE_HEIGHT, OLIVINE_VOLTORB_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_MapScriptHeader), OlivineVoltorbHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineVoltorbHouse_MapEventHeader

	; connections
	db 0
; 0x95bc4

OlivineHouseBeta_SecondMapHeader: ; 0x95bc4
	; border block
	db $0

	; height, width
	db OLIVINE_HOUSE_BETA_HEIGHT, OLIVINE_HOUSE_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineHouseBeta_MapScriptHeader), OlivineHouseBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineHouseBeta_MapEventHeader

	; connections
	db 0
; 0x95bd0

OlivinePunishmentSpeechHouse_SecondMapHeader: ; 0x95bd0
	; border block
	db $0

	; height, width
	db OLIVINE_PUNISHMENT_SPEECH_HOUSE_HEIGHT, OLIVINE_PUNISHMENT_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivinePunishmentSpeechHouse_MapScriptHeader), OlivinePunishmentSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivinePunishmentSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x95bdc

OlivineGoodRodHouse_SecondMapHeader: ; 0x95bdc
	; border block
	db $0

	; height, width
	db OLIVINE_GOOD_ROD_HOUSE_HEIGHT, OLIVINE_GOOD_ROD_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineGoodRodHouse_MapScriptHeader), OlivineGoodRodHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineGoodRodHouse_MapEventHeader

	; connections
	db 0
; 0x95be8

OlivineCafe_SecondMapHeader: ; 0x95be8
	; border block
	db $0

	; height, width
	db OLIVINE_CAFE_HEIGHT, OLIVINE_CAFE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineCafe_BlockData), OlivineCafe_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineCafe_MapScriptHeader), OlivineCafe_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineCafe_MapEventHeader

	; connections
	db 0
; 0x95bf4

OlivineMart_SecondMapHeader: ; 0x95bf4
	; border block
	db $0

	; height, width
	db OLIVINE_MART_HEIGHT, OLIVINE_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivineMart_MapScriptHeader), OlivineMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivineMart_MapEventHeader

	; connections
	db 0
; 0x95c00

Route38EcruteakGate_SecondMapHeader: ; 0x95c00
	; border block
	db $0

	; height, width
	db ROUTE_38_ECRUTEAK_GATE_HEIGHT, ROUTE_38_ECRUTEAK_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_MapScriptHeader), Route38EcruteakGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route38EcruteakGate_MapEventHeader

	; connections
	db 0
; 0x95c0c

Route39Barn_SecondMapHeader: ; 0x95c0c
	; border block
	db $0

	; height, width
	db ROUTE_39_BARN_HEIGHT, ROUTE_39_BARN_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route39Barn_BlockData), Route39Barn_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route39Barn_MapScriptHeader), Route39Barn_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route39Barn_MapEventHeader

	; connections
	db 0
; 0x95c18

Route39Farmhouse_SecondMapHeader: ; 0x95c18
	; border block
	db $0

	; height, width
	db ROUTE_39_FARMHOUSE_HEIGHT, ROUTE_39_FARMHOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route39Farmhouse_MapScriptHeader), Route39Farmhouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route39Farmhouse_MapEventHeader

	; connections
	db 0
; 0x95c24

MahoganyRedGyaradosSpeechHouse_SecondMapHeader: ; 0x95c24
	; border block
	db $0

	; height, width
	db MAHOGANY_RED_GYARADOS_SPEECH_HOUSE_HEIGHT, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MahoganyRedGyaradosSpeechHouse_MapScriptHeader), MahoganyRedGyaradosSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MahoganyRedGyaradosSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x95c30

MahoganyGym_SecondMapHeader: ; 0x95c30
	; border block
	db $0

	; height, width
	db MAHOGANY_GYM_HEIGHT, MAHOGANY_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MahoganyGym_BlockData), MahoganyGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MahoganyGym_MapScriptHeader), MahoganyGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MahoganyGym_MapEventHeader

	; connections
	db 0
; 0x95c3c

MahoganyPokeCenter1F_SecondMapHeader: ; 0x95c3c
	; border block
	db $0

	; height, width
	db MAHOGANY_POKECENTER_1F_HEIGHT, MAHOGANY_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MahoganyPokeCenter1F_MapScriptHeader), MahoganyPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MahoganyPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95c48

Route42EcruteakGate_SecondMapHeader: ; 0x95c48
	; border block
	db $0

	; height, width
	db ROUTE_42_ECRUTEAK_GATE_HEIGHT, ROUTE_42_ECRUTEAK_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route42EcruteakGate_MapScriptHeader), Route42EcruteakGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route42EcruteakGate_MapEventHeader

	; connections
	db 0
; 0x95c54

DiglettsCave_SecondMapHeader: ; 0x95c54
	; border block
	db $9

	; height, width
	db DIGLETTS_CAVE_HEIGHT, DIGLETTS_CAVE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(DiglettsCave_BlockData), DiglettsCave_BlockData

	; script header (bank-then-pointer)
	dbw BANK(DiglettsCave_MapScriptHeader), DiglettsCave_MapScriptHeader

	; map event header (bank-then-pointer)
	dw DiglettsCave_MapEventHeader

	; connections
	db 0
; 0x95c60

MountMoon_SecondMapHeader: ; 0x95c60
	; border block
	db $9

	; height, width
	db MOUNT_MOON_HEIGHT, MOUNT_MOON_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MountMoon_BlockData), MountMoon_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MountMoon_MapScriptHeader), MountMoon_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MountMoon_MapEventHeader

	; connections
	db 0
; 0x95c6c

Underground_SecondMapHeader: ; 0x95c6c
	; border block
	db $0

	; height, width
	db UNDERGROUND_HEIGHT, UNDERGROUND_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Underground_BlockData), Underground_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Underground_MapScriptHeader), Underground_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Underground_MapEventHeader

	; connections
	db 0
; 0x95c78

RockTunnel1F_SecondMapHeader: ; 0x95c78
	; border block
	db $9

	; height, width
	db ROCK_TUNNEL_1F_HEIGHT, ROCK_TUNNEL_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RockTunnel1F_BlockData), RockTunnel1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RockTunnel1F_MapScriptHeader), RockTunnel1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RockTunnel1F_MapEventHeader

	; connections
	db 0
; 0x95c84

RockTunnelB1F_SecondMapHeader: ; 0x95c84
	; border block
	db $9

	; height, width
	db ROCK_TUNNEL_B1F_HEIGHT, ROCK_TUNNEL_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RockTunnelB1F_BlockData), RockTunnelB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RockTunnelB1F_MapScriptHeader), RockTunnelB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RockTunnelB1F_MapEventHeader

	; connections
	db 0
; 0x95c90

SafariZoneFuchsiaGateBeta_SecondMapHeader: ; 0x95c90
	; border block
	db $0

	; height, width
	db SAFARI_ZONE_FUCHSIA_GATE_BETA_HEIGHT, SAFARI_ZONE_FUCHSIA_GATE_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_MapScriptHeader), SafariZoneFuchsiaGateBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SafariZoneFuchsiaGateBeta_MapEventHeader

	; connections
	db 0
; 0x95c9c

SafariZoneBeta_SecondMapHeader: ; 0x95c9c
	; border block
	db $13

	; height, width
	db SAFARI_ZONE_BETA_HEIGHT, SAFARI_ZONE_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneBeta_BlockData), SafariZoneBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SafariZoneBeta_MapScriptHeader), SafariZoneBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SafariZoneBeta_MapEventHeader

	; connections
	db 0
; 0x95ca8

VictoryRoad_SecondMapHeader: ; 0x95ca8
	; border block
	db $1d

	; height, width
	db VICTORY_ROAD_HEIGHT, VICTORY_ROAD_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(VictoryRoad_BlockData), VictoryRoad_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VictoryRoad_MapScriptHeader), VictoryRoad_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VictoryRoad_MapEventHeader

	; connections
	db 0
; 0x95cb4

EcruteakHouse_SecondMapHeader: ; 0x95cb4
	; border block
	db $0

	; height, width
	db ECRUTEAK_HOUSE_HEIGHT, ECRUTEAK_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(EcruteakHouse_BlockData), EcruteakHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(EcruteakHouse_MapScriptHeader), EcruteakHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw EcruteakHouse_MapEventHeader

	; connections
	db 0
; 0x95cc0

WiseTriosRoom_SecondMapHeader: ; 0x95cc0
	; border block
	db $0

	; height, width
	db WISE_TRIOS_ROOM_HEIGHT, WISE_TRIOS_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WiseTriosRoom_BlockData), WiseTriosRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WiseTriosRoom_MapScriptHeader), WiseTriosRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WiseTriosRoom_MapEventHeader

	; connections
	db 0
; 0x95ccc

EcruteakPokeCenter1F_SecondMapHeader: ; 0x95ccc
	; border block
	db $0

	; height, width
	db ECRUTEAK_POKECENTER_1F_HEIGHT, ECRUTEAK_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(EcruteakPokeCenter1F_MapScriptHeader), EcruteakPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw EcruteakPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95cd8

EcruteakLugiaSpeechHouse_SecondMapHeader: ; 0x95cd8
	; border block
	db $0

	; height, width
	db ECRUTEAK_LUGIA_SPEECH_HOUSE_HEIGHT, ECRUTEAK_LUGIA_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(EcruteakLugiaSpeechHouse_BlockData), EcruteakLugiaSpeechHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(EcruteakLugiaSpeechHouse_MapScriptHeader), EcruteakLugiaSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw EcruteakLugiaSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x95ce4

DanceTheatre_SecondMapHeader: ; 0x95ce4
	; border block
	db $0

	; height, width
	db DANCE_THEATRE_HEIGHT, DANCE_THEATRE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(DanceTheatre_BlockData), DanceTheatre_BlockData

	; script header (bank-then-pointer)
	dbw BANK(DanceTheatre_MapScriptHeader), DanceTheatre_MapScriptHeader

	; map event header (bank-then-pointer)
	dw DanceTheatre_MapEventHeader

	; connections
	db 0
; 0x95cf0

EcruteakMart_SecondMapHeader: ; 0x95cf0
	; border block
	db $0

	; height, width
	db ECRUTEAK_MART_HEIGHT, ECRUTEAK_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(EcruteakMart_MapScriptHeader), EcruteakMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw EcruteakMart_MapEventHeader

	; connections
	db 0
; 0x95cfc

EcruteakGym_SecondMapHeader: ; 0x95cfc
	; border block
	db $0

	; height, width
	db ECRUTEAK_GYM_HEIGHT, ECRUTEAK_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(EcruteakGym_BlockData), EcruteakGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(EcruteakGym_MapScriptHeader), EcruteakGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw EcruteakGym_MapEventHeader

	; connections
	db 0
; 0x95d08

EcruteakItemfinderHouse_SecondMapHeader: ; 0x95d08
	; border block
	db $0

	; height, width
	db ECRUTEAK_ITEMFINDER_HOUSE_HEIGHT, ECRUTEAK_ITEMFINDER_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(EcruteakLugiaSpeechHouse_BlockData), EcruteakLugiaSpeechHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(EcruteakItemfinderHouse_MapScriptHeader), EcruteakItemfinderHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw EcruteakItemfinderHouse_MapEventHeader

	; connections
	db 0
; 0x95d14

BlackthornGym1F_SecondMapHeader: ; 0x95d14
	; border block
	db $0

	; height, width
	db BLACKTHORN_GYM_1F_HEIGHT, BLACKTHORN_GYM_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BlackthornGym1F_BlockData), BlackthornGym1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BlackthornGym1F_MapScriptHeader), BlackthornGym1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BlackthornGym1F_MapEventHeader

	; connections
	db 0
; 0x95d20

BlackthornGym2F_SecondMapHeader: ; 0x95d20
	; border block
	db $0

	; height, width
	db BLACKTHORN_GYM_2F_HEIGHT, BLACKTHORN_GYM_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BlackthornGym2F_BlockData), BlackthornGym2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BlackthornGym2F_MapScriptHeader), BlackthornGym2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BlackthornGym2F_MapEventHeader

	; connections
	db 0
; 0x95d2c

BlackthornDragonSpeechHouse_SecondMapHeader: ; 0x95d2c
	; border block
	db $0

	; height, width
	db BLACKTHORN_DRAGON_SPEECH_HOUSE_HEIGHT, BLACKTHORN_DRAGON_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BlackthornDragonSpeechHouse_MapScriptHeader), BlackthornDragonSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BlackthornDragonSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x95d38

BlackthornDodrioTradeHouse_SecondMapHeader: ; 0x95d38
	; border block
	db $0

	; height, width
	db BLACKTHORN_DODRIO_TRADE_HOUSE_HEIGHT, BLACKTHORN_DODRIO_TRADE_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BlackthornDodrioTradeHouse_MapScriptHeader), BlackthornDodrioTradeHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BlackthornDodrioTradeHouse_MapEventHeader

	; connections
	db 0
; 0x95d44

BlackthornMart_SecondMapHeader: ; 0x95d44
	; border block
	db $0

	; height, width
	db BLACKTHORN_MART_HEIGHT, BLACKTHORN_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BlackthornMart_MapScriptHeader), BlackthornMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BlackthornMart_MapEventHeader

	; connections
	db 0
; 0x95d50

BlackthornPokeCenter1F_SecondMapHeader: ; 0x95d50
	; border block
	db $0

	; height, width
	db BLACKTHORN_POKECENTER_1F_HEIGHT, BLACKTHORN_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BlackthornPokeCenter1F_MapScriptHeader), BlackthornPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BlackthornPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95d5c

MoveDeletersHouse_SecondMapHeader: ; 0x95d5c
	; border block
	db $0

	; height, width
	db MOVE_DELETERS_HOUSE_HEIGHT, MOVE_DELETERS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MoveDeletersHouse_MapScriptHeader), MoveDeletersHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MoveDeletersHouse_MapEventHeader

	; connections
	db 0
; 0x95d68

CinnabarPokeCenter1F_SecondMapHeader: ; 0x95d68
	; border block
	db $0

	; height, width
	db CINNABAR_POKECENTER_1F_HEIGHT, CINNABAR_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter1F_MapScriptHeader), CinnabarPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CinnabarPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95d74

CinnabarPokeCenter2FBeta_SecondMapHeader: ; 0x95d74
	; border block
	db $0

	; height, width
	db CINNABAR_POKECENTER_2F_BETA_HEIGHT, CINNABAR_POKECENTER_2F_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_MapScriptHeader), CinnabarPokeCenter2FBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CinnabarPokeCenter2FBeta_MapEventHeader

	; connections
	db 0
; 0x95d80

Route19FuchsiaGate_SecondMapHeader: ; 0x95d80
	; border block
	db $0

	; height, width
	db ROUTE_19___FUCHSIA_GATE_HEIGHT, ROUTE_19___FUCHSIA_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route19FuchsiaGate_MapScriptHeader), Route19FuchsiaGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route19FuchsiaGate_MapEventHeader

	; connections
	db 0
; 0x95d8c

SeafoamGym_SecondMapHeader: ; 0x95d8c
	; border block
	db $9

	; height, width
	db SEAFOAM_GYM_HEIGHT, SEAFOAM_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SeafoamGym_BlockData), SeafoamGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SeafoamGym_MapScriptHeader), SeafoamGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SeafoamGym_MapEventHeader

	; connections
	db 0
; 0x95d98

CeruleanGymBadgeSpeechHouse_SecondMapHeader: ; 0x95d98
	; border block
	db $0

	; height, width
	db CERULEAN_GYM_BADGE_SPEECH_HOUSE_HEIGHT, CERULEAN_GYM_BADGE_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeruleanGymBadgeSpeechHouse_MapScriptHeader), CeruleanGymBadgeSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeruleanGymBadgeSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x95da4

CeruleanPoliceStation_SecondMapHeader: ; 0x95da4
	; border block
	db $0

	; height, width
	db CERULEAN_POLICE_STATION_HEIGHT, CERULEAN_POLICE_STATION_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeruleanPoliceStation_MapScriptHeader), CeruleanPoliceStation_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeruleanPoliceStation_MapEventHeader

	; connections
	db 0
; 0x95db0

CeruleanTradeSpeechHouse_SecondMapHeader: ; 0x95db0
	; border block
	db $0

	; height, width
	db CERULEAN_TRADE_SPEECH_HOUSE_HEIGHT, CERULEAN_TRADE_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeruleanTradeSpeechHouse_MapScriptHeader), CeruleanTradeSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeruleanTradeSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x95dbc

CeruleanPokeCenter1F_SecondMapHeader: ; 0x95dbc
	; border block
	db $0

	; height, width
	db CERULEAN_POKECENTER_1F_HEIGHT, CERULEAN_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeruleanPokeCenter1F_MapScriptHeader), CeruleanPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeruleanPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95dc8

CeruleanPokeCenter2FBeta_SecondMapHeader: ; 0x95dc8
	; border block
	db $0

	; height, width
	db CERULEAN_POKECENTER_2F_BETA_HEIGHT, CERULEAN_POKECENTER_2F_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeruleanPokeCenter2FBeta_MapScriptHeader), CeruleanPokeCenter2FBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeruleanPokeCenter2FBeta_MapEventHeader

	; connections
	db 0
; 0x95dd4

CeruleanGym_SecondMapHeader: ; 0x95dd4
	; border block
	db $0

	; height, width
	db CERULEAN_GYM_HEIGHT, CERULEAN_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeruleanGym_BlockData), CeruleanGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeruleanGym_MapScriptHeader), CeruleanGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeruleanGym_MapEventHeader

	; connections
	db 0
; 0x95de0

CeruleanMart_SecondMapHeader: ; 0x95de0
	; border block
	db $0

	; height, width
	db CERULEAN_MART_HEIGHT, CERULEAN_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeruleanMart_MapScriptHeader), CeruleanMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeruleanMart_MapEventHeader

	; connections
	db 0
; 0x95dec

Route10PokeCenter1F_SecondMapHeader: ; 0x95dec
	; border block
	db $0

	; height, width
	db ROUTE_10_POKECENTER_1F_HEIGHT, ROUTE_10_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route10PokeCenter1F_MapScriptHeader), Route10PokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route10PokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95df8

Route10PokeCenter2FBeta_SecondMapHeader: ; 0x95df8
	; border block
	db $0

	; height, width
	db ROUTE_10_POKECENTER_2F_BETA_HEIGHT, ROUTE_10_POKECENTER_2F_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route10PokeCenter2FBeta_MapScriptHeader), Route10PokeCenter2FBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route10PokeCenter2FBeta_MapEventHeader

	; connections
	db 0
; 0x95e04

PowerPlant_SecondMapHeader: ; 0x95e04
	; border block
	db $0

	; height, width
	db POWER_PLANT_HEIGHT, POWER_PLANT_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(PowerPlant_BlockData), PowerPlant_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PowerPlant_MapScriptHeader), PowerPlant_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PowerPlant_MapEventHeader

	; connections
	db 0
; 0x95e10

BillsHouse_SecondMapHeader: ; 0x95e10
	; border block
	db $0

	; height, width
	db BILLS_HOUSE_HEIGHT, BILLS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BillsHouse_MapScriptHeader), BillsHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BillsHouse_MapEventHeader

	; connections
	db 0
; 0x95e1c

AzaleaPokeCenter1F_SecondMapHeader: ; 0x95e1c
	; border block
	db $0

	; height, width
	db AZALEA_POKECENTER_1F_HEIGHT, AZALEA_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(AzaleaPokeCenter1F_MapScriptHeader), AzaleaPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw AzaleaPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95e28

CharcoalKiln_SecondMapHeader: ; 0x95e28
	; border block
	db $0

	; height, width
	db CHARCOAL_KILN_HEIGHT, CHARCOAL_KILN_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CharcoalKiln_MapScriptHeader), CharcoalKiln_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CharcoalKiln_MapEventHeader

	; connections
	db 0
; 0x95e34

AzaleaMart_SecondMapHeader: ; 0x95e34
	; border block
	db $0

	; height, width
	db AZALEA_MART_HEIGHT, AZALEA_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(AzaleaMart_MapScriptHeader), AzaleaMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw AzaleaMart_MapEventHeader

	; connections
	db 0
; 0x95e40

KurtsHouse_SecondMapHeader: ; 0x95e40
	; border block
	db $0

	; height, width
	db KURTS_HOUSE_HEIGHT, KURTS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(KurtsHouse_BlockData), KurtsHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(KurtsHouse_MapScriptHeader), KurtsHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw KurtsHouse_MapEventHeader

	; connections
	db 0
; 0x95e4c

AzaleaGym_SecondMapHeader: ; 0x95e4c
	; border block
	db $0

	; height, width
	db AZALEA_GYM_HEIGHT, AZALEA_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(AzaleaGym_BlockData), AzaleaGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(AzaleaGym_MapScriptHeader), AzaleaGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw AzaleaGym_MapEventHeader

	; connections
	db 0
; 0x95e58

LakeofRageHiddenPowerHouse_SecondMapHeader: ; 0x95e58
	; border block
	db $0

	; height, width
	db LAKE_OF_RAGE_HIDDEN_POWER_HOUSE_HEIGHT, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LakeofRageHiddenPowerHouse_MapScriptHeader), LakeofRageHiddenPowerHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LakeofRageHiddenPowerHouse_MapEventHeader

	; connections
	db 0
; 0x95e64

LakeofRageMagikarpHouse_SecondMapHeader: ; 0x95e64
	; border block
	db $0

	; height, width
	db LAKE_OF_RAGE_MAGIKARP_HOUSE_HEIGHT, LAKE_OF_RAGE_MAGIKARP_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LakeofRageMagikarpHouse_MapScriptHeader), LakeofRageMagikarpHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LakeofRageMagikarpHouse_MapEventHeader

	; connections
	db 0
; 0x95e70

Route43MahoganyGate_SecondMapHeader: ; 0x95e70
	; border block
	db $0

	; height, width
	db ROUTE_43_MAHOGANY_GATE_HEIGHT, ROUTE_43_MAHOGANY_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route43MahoganyGate_MapScriptHeader), Route43MahoganyGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route43MahoganyGate_MapEventHeader

	; connections
	db 0
; 0x95e7c

Route43Gate_SecondMapHeader: ; 0x95e7c
	; border block
	db $0

	; height, width
	db ROUTE_43_GATE_HEIGHT, ROUTE_43_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route43Gate_MapScriptHeader), Route43Gate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route43Gate_MapEventHeader

	; connections
	db 0
; 0x95e88

VioletMart_SecondMapHeader: ; 0x95e88
	; border block
	db $0

	; height, width
	db VIOLET_MART_HEIGHT, VIOLET_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VioletMart_MapScriptHeader), VioletMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VioletMart_MapEventHeader

	; connections
	db 0
; 0x95e94

VioletGym_SecondMapHeader: ; 0x95e94
	; border block
	db $0

	; height, width
	db VIOLET_GYM_HEIGHT, VIOLET_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(VioletGym_BlockData), VioletGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VioletGym_MapScriptHeader), VioletGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VioletGym_MapEventHeader

	; connections
	db 0
; 0x95ea0

EarlsPokemonAcademy_SecondMapHeader: ; 0x95ea0
	; border block
	db $0

	; height, width
	db EARLS_POKEMON_ACADEMY_HEIGHT, EARLS_POKEMON_ACADEMY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(EarlsPokemonAcademy_BlockData), EarlsPokemonAcademy_BlockData

	; script header (bank-then-pointer)
	dbw BANK(EarlsPokemonAcademy_MapScriptHeader), EarlsPokemonAcademy_MapScriptHeader

	; map event header (bank-then-pointer)
	dw EarlsPokemonAcademy_MapEventHeader

	; connections
	db 0
; 0x95eac

VioletNicknameSpeechHouse_SecondMapHeader: ; 0x95eac
	; border block
	db $0

	; height, width
	db VIOLET_NICKNAME_SPEECH_HOUSE_HEIGHT, VIOLET_NICKNAME_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(EcruteakLugiaSpeechHouse_BlockData), EcruteakLugiaSpeechHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VioletNicknameSpeechHouse_MapScriptHeader), VioletNicknameSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VioletNicknameSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x95eb8

VioletPokeCenter1F_SecondMapHeader: ; 0x95eb8
	; border block
	db $0

	; height, width
	db VIOLET_POKECENTER_1F_HEIGHT, VIOLET_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VioletPokeCenter1F_MapScriptHeader), VioletPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VioletPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95ec4

VioletOnixTradeHouse_SecondMapHeader: ; 0x95ec4
	; border block
	db $0

	; height, width
	db VIOLET_ONIX_TRADE_HOUSE_HEIGHT, VIOLET_ONIX_TRADE_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(EcruteakLugiaSpeechHouse_BlockData), EcruteakLugiaSpeechHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VioletOnixTradeHouse_MapScriptHeader), VioletOnixTradeHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VioletOnixTradeHouse_MapEventHeader

	; connections
	db 0
; 0x95ed0

Route32RuinsofAlphGate_SecondMapHeader: ; 0x95ed0
	; border block
	db $0

	; height, width
	db ROUTE_32_RUINS_OF_ALPH_GATE_HEIGHT, ROUTE_32_RUINS_OF_ALPH_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route32RuinsofAlphGate_MapScriptHeader), Route32RuinsofAlphGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route32RuinsofAlphGate_MapEventHeader

	; connections
	db 0
; 0x95edc

Route32PokeCenter1F_SecondMapHeader: ; 0x95edc
	; border block
	db $0

	; height, width
	db ROUTE_32_POKECENTER_1F_HEIGHT, ROUTE_32_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route32PokeCenter1F_MapScriptHeader), Route32PokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route32PokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95ee8

Route35Goldenrodgate_SecondMapHeader: ; 0x95ee8
	; border block
	db $0

	; height, width
	db ROUTE_35_GOLDENROD_GATE_HEIGHT, ROUTE_35_GOLDENROD_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route35Goldenrodgate_MapScriptHeader), Route35Goldenrodgate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route35Goldenrodgate_MapEventHeader

	; connections
	db 0
; 0x95ef4

Route35NationalParkgate_SecondMapHeader: ; 0x95ef4
	; border block
	db $0

	; height, width
	db ROUTE_35_NATIONAL_PARK_GATE_HEIGHT, ROUTE_35_NATIONAL_PARK_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route35NationalParkgate_BlockData), Route35NationalParkgate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route35NationalParkgate_MapScriptHeader), Route35NationalParkgate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route35NationalParkgate_MapEventHeader

	; connections
	db 0
; 0x95f00

Route36RuinsofAlphgate_SecondMapHeader: ; 0x95f00
	; border block
	db $0

	; height, width
	db ROUTE_36_RUINS_OF_ALPH_GATE_HEIGHT, ROUTE_36_RUINS_OF_ALPH_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route36RuinsofAlphgate_MapScriptHeader), Route36RuinsofAlphgate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route36RuinsofAlphgate_MapEventHeader

	; connections
	db 0
; 0x95f0c

Route36NationalParkgate_SecondMapHeader: ; 0x95f0c
	; border block
	db $0

	; height, width
	db ROUTE_36_NATIONAL_PARK_GATE_HEIGHT, ROUTE_36_NATIONAL_PARK_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route36NationalParkgate_BlockData), Route36NationalParkgate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route36NationalParkgate_MapScriptHeader), Route36NationalParkgate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route36NationalParkgate_MapEventHeader

	; connections
	db 0
; 0x95f18

GoldenrodGym_SecondMapHeader: ; 0x95f18
	; border block
	db $0

	; height, width
	db GOLDENROD_GYM_HEIGHT, GOLDENROD_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodGym_BlockData), GoldenrodGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodGym_MapScriptHeader), GoldenrodGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodGym_MapEventHeader

	; connections
	db 0
; 0x95f24

GoldenrodBikeShop_SecondMapHeader: ; 0x95f24
	; border block
	db $0

	; height, width
	db GOLDENROD_BIKE_SHOP_HEIGHT, GOLDENROD_BIKE_SHOP_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodBikeShop_BlockData), GoldenrodBikeShop_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodBikeShop_MapScriptHeader), GoldenrodBikeShop_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodBikeShop_MapEventHeader

	; connections
	db 0
; 0x95f30

GoldenrodHappinessRater_SecondMapHeader: ; 0x95f30
	; border block
	db $0

	; height, width
	db GOLDENROD_HAPPINESS_RATER_HEIGHT, GOLDENROD_HAPPINESS_RATER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodHappinessRater_MapScriptHeader), GoldenrodHappinessRater_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodHappinessRater_MapEventHeader

	; connections
	db 0
; 0x95f3c

GoldenrodBillsHouse_SecondMapHeader: ; 0x95f3c
	; border block
	db $0

	; height, width
	db GOLDENROD_BILLS_HOUSE_HEIGHT, GOLDENROD_BILLS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodBillsHouse_MapScriptHeader), GoldenrodBillsHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodBillsHouse_MapEventHeader

	; connections
	db 0
; 0x95f48

GoldenrodMagnetTrainStation_SecondMapHeader: ; 0x95f48
	; border block
	db $0

	; height, width
	db GOLDENROD_MAGNET_TRAIN_STATION_HEIGHT, GOLDENROD_MAGNET_TRAIN_STATION_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodMagnetTrainStation_BlockData), GoldenrodMagnetTrainStation_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodMagnetTrainStation_MapScriptHeader), GoldenrodMagnetTrainStation_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodMagnetTrainStation_MapEventHeader

	; connections
	db 0
; 0x95f54

GoldenrodFlowerShop_SecondMapHeader: ; 0x95f54
	; border block
	db $0

	; height, width
	db GOLDENROD_FLOWER_SHOP_HEIGHT, GOLDENROD_FLOWER_SHOP_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodFlowerShop_BlockData), GoldenrodFlowerShop_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodFlowerShop_MapScriptHeader), GoldenrodFlowerShop_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodFlowerShop_MapEventHeader

	; connections
	db 0
; 0x95f60

GoldenrodPPSpeechHouse_SecondMapHeader: ; 0x95f60
	; border block
	db $0

	; height, width
	db GOLDENROD_PP_SPEECH_HOUSE_HEIGHT, GOLDENROD_PP_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodPPSpeechHouse_MapScriptHeader), GoldenrodPPSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodPPSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x95f6c

GoldenrodNameRatersHouse_SecondMapHeader: ; 0x95f6c
	; border block
	db $0

	; height, width
	db GOLDENROD_NAME_RATERS_HOUSE_HEIGHT, GOLDENROD_NAME_RATERS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodNameRatersHouse_MapScriptHeader), GoldenrodNameRatersHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodNameRatersHouse_MapEventHeader

	; connections
	db 0
; 0x95f78

GoldenrodDeptStore1F_SecondMapHeader: ; 0x95f78
	; border block
	db $0

	; height, width
	db GOLDENROD_DEPT_STORE_1F_HEIGHT, GOLDENROD_DEPT_STORE_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore1F_BlockData), GoldenrodDeptStore1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore1F_MapScriptHeader), GoldenrodDeptStore1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodDeptStore1F_MapEventHeader

	; connections
	db 0
; 0x95f84

GoldenrodDeptStore2F_SecondMapHeader: ; 0x95f84
	; border block
	db $0

	; height, width
	db GOLDENROD_DEPT_STORE_2F_HEIGHT, GOLDENROD_DEPT_STORE_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore2F_BlockData), GoldenrodDeptStore2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore2F_MapScriptHeader), GoldenrodDeptStore2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodDeptStore2F_MapEventHeader

	; connections
	db 0
; 0x95f90

GoldenrodDeptStore3F_SecondMapHeader: ; 0x95f90
	; border block
	db $0

	; height, width
	db GOLDENROD_DEPT_STORE_3F_HEIGHT, GOLDENROD_DEPT_STORE_3F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore3F_BlockData), GoldenrodDeptStore3F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore3F_MapScriptHeader), GoldenrodDeptStore3F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodDeptStore3F_MapEventHeader

	; connections
	db 0
; 0x95f9c

GoldenrodDeptStore4F_SecondMapHeader: ; 0x95f9c
	; border block
	db $0

	; height, width
	db GOLDENROD_DEPT_STORE_4F_HEIGHT, GOLDENROD_DEPT_STORE_4F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore4F_BlockData), GoldenrodDeptStore4F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore4F_MapScriptHeader), GoldenrodDeptStore4F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodDeptStore4F_MapEventHeader

	; connections
	db 0
; 0x95fa8

GoldenrodDeptStore5F_SecondMapHeader: ; 0x95fa8
	; border block
	db $0

	; height, width
	db GOLDENROD_DEPT_STORE_5F_HEIGHT, GOLDENROD_DEPT_STORE_5F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore5F_BlockData), GoldenrodDeptStore5F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore5F_MapScriptHeader), GoldenrodDeptStore5F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodDeptStore5F_MapEventHeader

	; connections
	db 0
; 0x95fb4

GoldenrodDeptStore6F_SecondMapHeader: ; 0x95fb4
	; border block
	db $0

	; height, width
	db GOLDENROD_DEPT_STORE_6F_HEIGHT, GOLDENROD_DEPT_STORE_6F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore6F_BlockData), GoldenrodDeptStore6F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore6F_MapScriptHeader), GoldenrodDeptStore6F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodDeptStore6F_MapEventHeader

	; connections
	db 0
; 0x95fc0

GoldenrodDeptStoreElevator_SecondMapHeader: ; 0x95fc0
	; border block
	db $0

	; height, width
	db GOLDENROD_DEPT_STORE_ELEVATOR_HEIGHT, GOLDENROD_DEPT_STORE_ELEVATOR_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStoreElevator_BlockData), GoldenrodDeptStoreElevator_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodDeptStoreElevator_MapScriptHeader), GoldenrodDeptStoreElevator_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodDeptStoreElevator_MapEventHeader

	; connections
	db 0
; 0x95fcc

GoldenrodDeptStoreRoof_SecondMapHeader: ; 0x95fcc
	; border block
	db $24

	; height, width
	db GOLDENROD_DEPT_STORE_ROOF_HEIGHT, GOLDENROD_DEPT_STORE_ROOF_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStoreRoof_BlockData), GoldenrodDeptStoreRoof_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodDeptStoreRoof_MapScriptHeader), GoldenrodDeptStoreRoof_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodDeptStoreRoof_MapEventHeader

	; connections
	db 0
; 0x95fd8

GoldenrodGameCorner_SecondMapHeader: ; 0x95fd8
	; border block
	db $0

	; height, width
	db GOLDENROD_GAME_CORNER_HEIGHT, GOLDENROD_GAME_CORNER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodGameCorner_BlockData), GoldenrodGameCorner_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodGameCorner_MapScriptHeader), GoldenrodGameCorner_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodGameCorner_MapEventHeader

	; connections
	db 0
; 0x95fe4

GoldenrodPokeCenter1F_SecondMapHeader: ; 0x95fe4
	; border block
	db $0

	; height, width
	db GOLDENROD_POKECENTER_1F_HEIGHT, GOLDENROD_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodPokeCenter1F_MapScriptHeader), GoldenrodPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x95ff0

GoldenrodPokeComCenter2FMobile_SecondMapHeader: ; 0x95ff0
	; border block
	db $0

	; height, width
	db GOLDENROD_POKECOM_CENTER_2F_MOBILE_HEIGHT, GOLDENROD_POKECOM_CENTER_2F_MOBILE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodPokeComCenter2FMobile_BlockData), GoldenrodPokeComCenter2FMobile_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GoldenrodPokeComCenter2FMobile_MapScriptHeader), GoldenrodPokeComCenter2FMobile_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GoldenrodPokeComCenter2FMobile_MapEventHeader

	; connections
	db 0
; 0x95ffc

IlexForestAzaleaGate_SecondMapHeader: ; 0x95ffc
	; border block
	db $0

	; height, width
	db ILEX_FOREST_AZALEA_GATE_HEIGHT, ILEX_FOREST_AZALEA_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(IlexForestAzaleaGate_MapScriptHeader), IlexForestAzaleaGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw IlexForestAzaleaGate_MapEventHeader

	; connections
	db 0
; 0x96008

Route34IlexForestGate_SecondMapHeader: ; 0x96008
	; border block
	db $0

	; height, width
	db ROUTE_34_ILEX_FOREST_GATE_HEIGHT, ROUTE_34_ILEX_FOREST_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route34IlexForestGate_MapScriptHeader), Route34IlexForestGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route34IlexForestGate_MapEventHeader

	; connections
	db 0
; 0x96014

DayCare_SecondMapHeader: ; 0x96014
	; border block
	db $0

	; height, width
	db DAY_CARE_HEIGHT, DAY_CARE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(DayCare_BlockData), DayCare_BlockData

	; script header (bank-then-pointer)
	dbw BANK(DayCare_MapScriptHeader), DayCare_MapScriptHeader

	; map event header (bank-then-pointer)
	dw DayCare_MapEventHeader

	; connections
	db 0
; 0x96020

VermilionHouseFishingSpeechHouse_SecondMapHeader: ; 0x96020
	; border block
	db $0

	; height, width
	db VERMILION_HOUSE_FISHING_SPEECH_HOUSE_HEIGHT, VERMILION_HOUSE_FISHING_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VermilionHouseFishingSpeechHouse_MapScriptHeader), VermilionHouseFishingSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VermilionHouseFishingSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x9602c

VermilionPokeCenter1F_SecondMapHeader: ; 0x9602c
	; border block
	db $0

	; height, width
	db VERMILION_POKECENTER_1F_HEIGHT, VERMILION_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VermilionPokeCenter1F_MapScriptHeader), VermilionPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VermilionPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x96038

VermilionPokeCenter2FBeta_SecondMapHeader: ; 0x96038
	; border block
	db $0

	; height, width
	db VERMILION_POKECENTER_2F_BETA_HEIGHT, VERMILION_POKECENTER_2F_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VermilionPokeCenter2FBeta_MapScriptHeader), VermilionPokeCenter2FBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VermilionPokeCenter2FBeta_MapEventHeader

	; connections
	db 0
; 0x96044

PokemonFanClub_SecondMapHeader: ; 0x96044
	; border block
	db $0

	; height, width
	db POKEMON_FAN_CLUB_HEIGHT, POKEMON_FAN_CLUB_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(PokemonFanClub_BlockData), PokemonFanClub_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PokemonFanClub_MapScriptHeader), PokemonFanClub_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PokemonFanClub_MapEventHeader

	; connections
	db 0
; 0x96050

VermilionMagnetTrainSpeechHouse_SecondMapHeader: ; 0x96050
	; border block
	db $0

	; height, width
	db VERMILION_MAGNET_TRAIN_SPEECH_HOUSE_HEIGHT, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VermilionMagnetTrainSpeechHouse_MapScriptHeader), VermilionMagnetTrainSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VermilionMagnetTrainSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x9605c

VermilionMart_SecondMapHeader: ; 0x9605c
	; border block
	db $0

	; height, width
	db VERMILION_MART_HEIGHT, VERMILION_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VermilionMart_MapScriptHeader), VermilionMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VermilionMart_MapEventHeader

	; connections
	db 0
; 0x96068

VermilionHouseDiglettsCaveSpeechHouse_SecondMapHeader: ; 0x96068
	; border block
	db $0

	; height, width
	db VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE_HEIGHT, VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VermilionHouseDiglettsCaveSpeechHouse_MapScriptHeader), VermilionHouseDiglettsCaveSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VermilionHouseDiglettsCaveSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x96074

VermilionGym_SecondMapHeader: ; 0x96074
	; border block
	db $0

	; height, width
	db VERMILION_GYM_HEIGHT, VERMILION_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(VermilionGym_BlockData), VermilionGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VermilionGym_MapScriptHeader), VermilionGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VermilionGym_MapEventHeader

	; connections
	db 0
; 0x96080

Route6SaffronGate_SecondMapHeader: ; 0x96080
	; border block
	db $0

	; height, width
	db ROUTE_6_SAFFRON_GATE_HEIGHT, ROUTE_6_SAFFRON_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route6SaffronGate_MapScriptHeader), Route6SaffronGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route6SaffronGate_MapEventHeader

	; connections
	db 0
; 0x9608c

Route6UndergroundEntrance_SecondMapHeader: ; 0x9608c
	; border block
	db $0

	; height, width
	db ROUTE_6_UNDERGROUND_ENTRANCE_HEIGHT, ROUTE_6_UNDERGROUND_ENTRANCE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route6UndergroundEntrance_BlockData), Route6UndergroundEntrance_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route6UndergroundEntrance_MapScriptHeader), Route6UndergroundEntrance_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route6UndergroundEntrance_MapEventHeader

	; connections
	db 0
; 0x96098

RedsHouse1F_SecondMapHeader: ; 0x96098
	; border block
	db $0

	; height, width
	db REDS_HOUSE_1F_HEIGHT, REDS_HOUSE_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RedsHouse1F_BlockData), RedsHouse1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RedsHouse1F_MapScriptHeader), RedsHouse1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RedsHouse1F_MapEventHeader

	; connections
	db 0
; 0x960a4

RedsHouse2F_SecondMapHeader: ; 0x960a4
	; border block
	db $0

	; height, width
	db REDS_HOUSE_2F_HEIGHT, REDS_HOUSE_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(RedsHouse2F_BlockData), RedsHouse2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(RedsHouse2F_MapScriptHeader), RedsHouse2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw RedsHouse2F_MapEventHeader

	; connections
	db 0
; 0x960b0

BluesHouse_SecondMapHeader: ; 0x960b0
	; border block
	db $0

	; height, width
	db BLUES_HOUSE_HEIGHT, BLUES_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BluesHouse_MapScriptHeader), BluesHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BluesHouse_MapEventHeader

	; connections
	db 0
; 0x960bc

OaksLab_SecondMapHeader: ; 0x960bc
	; border block
	db $0

	; height, width
	db OAKS_LAB_HEIGHT, OAKS_LAB_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OaksLab_BlockData), OaksLab_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OaksLab_MapScriptHeader), OaksLab_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OaksLab_MapEventHeader

	; connections
	db 0
; 0x960c8

PewterNidoranSpeechHouse_SecondMapHeader: ; 0x960c8
	; border block
	db $0

	; height, width
	db PEWTER_NIDORAN_SPEECH_HOUSE_HEIGHT, PEWTER_NIDORAN_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PewterNidoranSpeechHouse_MapScriptHeader), PewterNidoranSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PewterNidoranSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x960d4

PewterGym_SecondMapHeader: ; 0x960d4
	; border block
	db $0

	; height, width
	db PEWTER_GYM_HEIGHT, PEWTER_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(PewterGym_BlockData), PewterGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PewterGym_MapScriptHeader), PewterGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PewterGym_MapEventHeader

	; connections
	db 0
; 0x960e0

PewterMart_SecondMapHeader: ; 0x960e0
	; border block
	db $0

	; height, width
	db PEWTER_MART_HEIGHT, PEWTER_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PewterMart_MapScriptHeader), PewterMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PewterMart_MapEventHeader

	; connections
	db 0
; 0x960ec

PewterPokeCenter1F_SecondMapHeader: ; 0x960ec
	; border block
	db $0

	; height, width
	db PEWTER_POKECENTER_1F_HEIGHT, PEWTER_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PewterPokeCenter1F_MapScriptHeader), PewterPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PewterPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x960f8

PewterPokeCEnter2FBeta_SecondMapHeader: ; 0x960f8
	; border block
	db $0

	; height, width
	db PEWTER_POKECENTER_2F_BETA_HEIGHT, PEWTER_POKECENTER_2F_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PewterPokeCEnter2FBeta_MapScriptHeader), PewterPokeCEnter2FBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PewterPokeCEnter2FBeta_MapEventHeader

	; connections
	db 0
; 0x96104

PewterSnoozeSpeechHouse_SecondMapHeader: ; 0x96104
	; border block
	db $0

	; height, width
	db PEWTER_SNOOZE_SPEECH_HOUSE_HEIGHT, PEWTER_SNOOZE_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PewterSnoozeSpeechHouse_MapScriptHeader), PewterSnoozeSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PewterSnoozeSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x96110

OlivinePort_SecondMapHeader: ; 0x96110
	; border block
	db $a

	; height, width
	db OLIVINE_PORT_HEIGHT, OLIVINE_PORT_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePort_BlockData), OlivinePort_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivinePort_MapScriptHeader), OlivinePort_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivinePort_MapEventHeader

	; connections
	db 0
; 0x9611c

VermilionPort_SecondMapHeader: ; 0x9611c
	; border block
	db $a

	; height, width
	db VERMILION_PORT_HEIGHT, VERMILION_PORT_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(VermilionPort_BlockData), VermilionPort_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VermilionPort_MapScriptHeader), VermilionPort_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VermilionPort_MapEventHeader

	; connections
	db 0
; 0x96128

FastShip1F_SecondMapHeader: ; 0x96128
	; border block
	db $0

	; height, width
	db FAST_SHIP_1F_HEIGHT, FAST_SHIP_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(FastShip1F_BlockData), FastShip1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FastShip1F_MapScriptHeader), FastShip1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FastShip1F_MapEventHeader

	; connections
	db 0
; 0x96134

FastShipCabins_NNW_NNE_NE_SecondMapHeader: ; 0x96134
	; border block
	db $0

	; height, width
	db FAST_SHIP_CABINS_NNW_NNE_NE_HEIGHT, FAST_SHIP_CABINS_NNW_NNE_NE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(FastShipCabins_NNW_NNE_NE_BlockData), FastShipCabins_NNW_NNE_NE_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FastShipCabins_NNW_NNE_NE_MapScriptHeader), FastShipCabins_NNW_NNE_NE_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FastShipCabins_NNW_NNE_NE_MapEventHeader

	; connections
	db 0
; 0x96140

FastShipCabins_SW_SSW_NW_SecondMapHeader: ; 0x96140
	; border block
	db $0

	; height, width
	db FAST_SHIP_CABINS_SW_SSW_NW_HEIGHT, FAST_SHIP_CABINS_SW_SSW_NW_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(FastShipCabins_SW_SSW_NW_BlockData), FastShipCabins_SW_SSW_NW_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FastShipCabins_SW_SSW_NW_MapScriptHeader), FastShipCabins_SW_SSW_NW_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FastShipCabins_SW_SSW_NW_MapEventHeader

	; connections
	db 0
; 0x9614c

FastShipCabins_SE_SSE_CaptainsCabin_SecondMapHeader: ; 0x9614c
	; border block
	db $0

	; height, width
	db FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_HEIGHT, FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(FastShipCabins_SE_SSE_CaptainsCabin_BlockData), FastShipCabins_SE_SSE_CaptainsCabin_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader), FastShipCabins_SE_SSE_CaptainsCabin_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FastShipCabins_SE_SSE_CaptainsCabin_MapEventHeader

	; connections
	db 0
; 0x96158

FastShipB1F_SecondMapHeader: ; 0x96158
	; border block
	db $0

	; height, width
	db FAST_SHIP_B1F_HEIGHT, FAST_SHIP_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(FastShipB1F_BlockData), FastShipB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FastShipB1F_MapScriptHeader), FastShipB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FastShipB1F_MapEventHeader

	; connections
	db 0
; 0x96164

OlivinePortPassage_SecondMapHeader: ; 0x96164
	; border block
	db $0

	; height, width
	db OLIVINE_PORT_PASSAGE_HEIGHT, OLIVINE_PORT_PASSAGE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePortPassage_BlockData), OlivinePortPassage_BlockData

	; script header (bank-then-pointer)
	dbw BANK(OlivinePortPassage_MapScriptHeader), OlivinePortPassage_MapScriptHeader

	; map event header (bank-then-pointer)
	dw OlivinePortPassage_MapEventHeader

	; connections
	db 0
; 0x96170

VermilionPortPassage_SecondMapHeader: ; 0x96170
	; border block
	db $0

	; height, width
	db VERMILION_PORT_PASSAGE_HEIGHT, VERMILION_PORT_PASSAGE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePortPassage_BlockData), OlivinePortPassage_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VermilionPortPassage_MapScriptHeader), VermilionPortPassage_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VermilionPortPassage_MapEventHeader

	; connections
	db 0
; 0x9617c

MountMoonSquare_SecondMapHeader: ; 0x9617c
	; border block
	db $2d

	; height, width
	db MOUNT_MOON_SQUARE_HEIGHT, MOUNT_MOON_SQUARE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MountMoonSquare_BlockData), MountMoonSquare_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MountMoonSquare_MapScriptHeader), MountMoonSquare_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MountMoonSquare_MapEventHeader

	; connections
	db 0
; 0x96188

MountMoonGiftShop_SecondMapHeader: ; 0x96188
	; border block
	db $0

	; height, width
	db MOUNT_MOON_GIFT_SHOP_HEIGHT, MOUNT_MOON_GIFT_SHOP_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MahoganyMart1F_BlockData), MahoganyMart1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MountMoonGiftShop_MapScriptHeader), MountMoonGiftShop_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MountMoonGiftShop_MapEventHeader

	; connections
	db 0
; 0x96194

TinTowerRoof_SecondMapHeader: ; 0x96194
	; border block
	db $0

	; height, width
	db TIN_TOWER_ROOF_HEIGHT, TIN_TOWER_ROOF_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TinTowerRoof_BlockData), TinTowerRoof_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TinTowerRoof_MapScriptHeader), TinTowerRoof_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TinTowerRoof_MapEventHeader

	; connections
	db 0
; 0x961a0

IndigoPlateauPokeCenter1F_SecondMapHeader: ; 0x961a0
	; border block
	db $0

	; height, width
	db INDIGO_PLATEAU_POKECENTER_1F_HEIGHT, INDIGO_PLATEAU_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(IndigoPlateauPokeCenter1F_BlockData), IndigoPlateauPokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(IndigoPlateauPokeCenter1F_MapScriptHeader), IndigoPlateauPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw IndigoPlateauPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x961ac

WillsRoom_SecondMapHeader: ; 0x961ac
	; border block
	db $0

	; height, width
	db WILLS_ROOM_HEIGHT, WILLS_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(WillsRoom_BlockData), WillsRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(WillsRoom_MapScriptHeader), WillsRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw WillsRoom_MapEventHeader

	; connections
	db 0
; 0x961b8

KogasRoom_SecondMapHeader: ; 0x961b8
	; border block
	db $0

	; height, width
	db KOGAS_ROOM_HEIGHT, KOGAS_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(KogasRoom_BlockData), KogasRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(KogasRoom_MapScriptHeader), KogasRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw KogasRoom_MapEventHeader

	; connections
	db 0
; 0x961c4

BrunosRoom_SecondMapHeader: ; 0x961c4
	; border block
	db $0

	; height, width
	db BRUNOS_ROOM_HEIGHT, BRUNOS_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BrunosRoom_BlockData), BrunosRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BrunosRoom_MapScriptHeader), BrunosRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BrunosRoom_MapEventHeader

	; connections
	db 0
; 0x961d0

KarensRoom_SecondMapHeader: ; 0x961d0
	; border block
	db $0

	; height, width
	db KARENS_ROOM_HEIGHT, KARENS_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(KarensRoom_BlockData), KarensRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(KarensRoom_MapScriptHeader), KarensRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw KarensRoom_MapEventHeader

	; connections
	db 0
; 0x961dc

LancesRoom_SecondMapHeader: ; 0x961dc
	; border block
	db $0

	; height, width
	db LANCES_ROOM_HEIGHT, LANCES_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(LancesRoom_BlockData), LancesRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LancesRoom_MapScriptHeader), LancesRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LancesRoom_MapEventHeader

	; connections
	db 0
; 0x961e8

HallOfFame_SecondMapHeader: ; 0x961e8
	; border block
	db $0

	; height, width
	db HALL_OF_FAME_HEIGHT, HALL_OF_FAME_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(HallOfFame_BlockData), HallOfFame_BlockData

	; script header (bank-then-pointer)
	dbw BANK(HallOfFame_MapScriptHeader), HallOfFame_MapScriptHeader

	; map event header (bank-then-pointer)
	dw HallOfFame_MapEventHeader

	; connections
	db 0
; 0x961f4

FuchsiaMart_SecondMapHeader: ; 0x961f4
	; border block
	db $0

	; height, width
	db FUCHSIA_MART_HEIGHT, FUCHSIA_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FuchsiaMart_MapScriptHeader), FuchsiaMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FuchsiaMart_MapEventHeader

	; connections
	db 0
; 0x96200

SafariZoneMainOffice_SecondMapHeader: ; 0x96200
	; border block
	db $0

	; height, width
	db SAFARI_ZONE_MAIN_OFFICE_HEIGHT, SAFARI_ZONE_MAIN_OFFICE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineCafe_BlockData), OlivineCafe_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SafariZoneMainOffice_MapScriptHeader), SafariZoneMainOffice_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SafariZoneMainOffice_MapEventHeader

	; connections
	db 0
; 0x9620c

FuchsiaGym_SecondMapHeader: ; 0x9620c
	; border block
	db $0

	; height, width
	db FUCHSIA_GYM_HEIGHT, FUCHSIA_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(FuchsiaGym_BlockData), FuchsiaGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FuchsiaGym_MapScriptHeader), FuchsiaGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FuchsiaGym_MapEventHeader

	; connections
	db 0
; 0x96218

FuchsiaBillSpeechHouse_SecondMapHeader: ; 0x96218
	; border block
	db $0

	; height, width
	db FUCHSIA_BILL_SPEECH_HOUSE_HEIGHT, FUCHSIA_BILL_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FuchsiaBillSpeechHouse_MapScriptHeader), FuchsiaBillSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FuchsiaBillSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x96224

FuchsiaPokeCenter1F_SecondMapHeader: ; 0x96224
	; border block
	db $0

	; height, width
	db FUCHSIA_POKECENTER_1F_HEIGHT, FUCHSIA_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FuchsiaPokeCenter1F_MapScriptHeader), FuchsiaPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FuchsiaPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x96230

FuchsiaPokeCenter2FBeta_SecondMapHeader: ; 0x96230
	; border block
	db $0

	; height, width
	db FUCHSIA_POKECENTER_2F_BETA_HEIGHT, FUCHSIA_POKECENTER_2F_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FuchsiaPokeCenter2FBeta_MapScriptHeader), FuchsiaPokeCenter2FBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FuchsiaPokeCenter2FBeta_MapEventHeader

	; connections
	db 0
; 0x9623c

SafariZoneWardensHome_SecondMapHeader: ; 0x9623c
	; border block
	db $0

	; height, width
	db SAFARI_ZONE_WARDENS_HOME_HEIGHT, SAFARI_ZONE_WARDENS_HOME_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(PokemonFanClub_BlockData), PokemonFanClub_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SafariZoneWardensHome_MapScriptHeader), SafariZoneWardensHome_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SafariZoneWardensHome_MapEventHeader

	; connections
	db 0
; 0x96248

Route15FuchsiaGate_SecondMapHeader: ; 0x96248
	; border block
	db $0

	; height, width
	db ROUTE_15_FUCHSIA_GATE_HEIGHT, ROUTE_15_FUCHSIA_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route15FuchsiaGate_MapScriptHeader), Route15FuchsiaGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route15FuchsiaGate_MapEventHeader

	; connections
	db 0
; 0x96254

LavenderPokeCenter1F_SecondMapHeader: ; 0x96254
	; border block
	db $0

	; height, width
	db LAVENDER_POKECENTER_1F_HEIGHT, LAVENDER_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LavenderPokeCenter1F_MapScriptHeader), LavenderPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LavenderPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x96260

LavenderPokeCenter2FBeta_SecondMapHeader: ; 0x96260
	; border block
	db $0

	; height, width
	db LAVENDER_POKECENTER_2F_BETA_HEIGHT, LAVENDER_POKECENTER_2F_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LavenderPokeCenter2FBeta_MapScriptHeader), LavenderPokeCenter2FBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LavenderPokeCenter2FBeta_MapEventHeader

	; connections
	db 0
; 0x9626c

MrFujisHouse_SecondMapHeader: ; 0x9626c
	; border block
	db $0

	; height, width
	db MR_FUJIS_HOUSE_HEIGHT, MR_FUJIS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MrFujisHouse_BlockData), MrFujisHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MrFujisHouse_MapScriptHeader), MrFujisHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MrFujisHouse_MapEventHeader

	; connections
	db 0
; 0x96278

LavenderTownSpeechHouse_SecondMapHeader: ; 0x96278
	; border block
	db $0

	; height, width
	db LAVENDER_TOWN_SPEECH_HOUSE_HEIGHT, LAVENDER_TOWN_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LavenderTownSpeechHouse_MapScriptHeader), LavenderTownSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LavenderTownSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x96284

LavenderNameRater_SecondMapHeader: ; 0x96284
	; border block
	db $0

	; height, width
	db LAVENDER_NAME_RATER_HEIGHT, LAVENDER_NAME_RATER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LavenderNameRater_MapScriptHeader), LavenderNameRater_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LavenderNameRater_MapEventHeader

	; connections
	db 0
; 0x96290

LavenderMart_SecondMapHeader: ; 0x96290
	; border block
	db $0

	; height, width
	db LAVENDER_MART_HEIGHT, LAVENDER_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LavenderMart_MapScriptHeader), LavenderMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LavenderMart_MapEventHeader

	; connections
	db 0
; 0x9629c

SoulHouse_SecondMapHeader: ; 0x9629c
	; border block
	db $0

	; height, width
	db SOUL_HOUSE_HEIGHT, SOUL_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SoulHouse_BlockData), SoulHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SoulHouse_MapScriptHeader), SoulHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SoulHouse_MapEventHeader

	; connections
	db 0
; 0x962a8

LavRadioTower1F_SecondMapHeader: ; 0x962a8
	; border block
	db $0

	; height, width
	db LAV_RADIO_TOWER_1F_HEIGHT, LAV_RADIO_TOWER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(LavRadioTower1F_BlockData), LavRadioTower1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(LavRadioTower1F_MapScriptHeader), LavRadioTower1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw LavRadioTower1F_MapEventHeader

	; connections
	db 0
; 0x962b4

Route8SaffronGate_SecondMapHeader: ; 0x962b4
	; border block
	db $0

	; height, width
	db ROUTE_8_SAFFRON_GATE_HEIGHT, ROUTE_8_SAFFRON_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route8SaffronGate_MapScriptHeader), Route8SaffronGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route8SaffronGate_MapEventHeader

	; connections
	db 0
; 0x962c0

Route12SuperRodHouse_SecondMapHeader: ; 0x962c0
	; border block
	db $0

	; height, width
	db ROUTE_12_SUPER_ROD_HOUSE_HEIGHT, ROUTE_12_SUPER_ROD_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route12SuperRodHouse_MapScriptHeader), Route12SuperRodHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route12SuperRodHouse_MapEventHeader

	; connections
	db 0
; 0x962cc

SilverCavePokeCenter1F_SecondMapHeader: ; 0x962cc
	; border block
	db $0

	; height, width
	db SILVER_CAVE_POKECENTER_1F_HEIGHT, SILVER_CAVE_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SilverCavePokeCenter1F_MapScriptHeader), SilverCavePokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SilverCavePokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x962d8

Route28FamousSpeechHouse_SecondMapHeader: ; 0x962d8
	; border block
	db $0

	; height, width
	db ROUTE_28_FAMOUS_SPEECH_HOUSE_HEIGHT, ROUTE_28_FAMOUS_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route28FamousSpeechHouse_MapScriptHeader), Route28FamousSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route28FamousSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x962e4

PokeCenter2F_SecondMapHeader: ; 0x962e4
	; border block
	db $0

	; height, width
	db POKECENTER_2F_HEIGHT, POKECENTER_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PokeCenter2F_MapScriptHeader), PokeCenter2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PokeCenter2F_MapEventHeader

	; connections
	db 0
; 0x962f0

TradeCenter_SecondMapHeader: ; 0x962f0
	; border block
	db $0

	; height, width
	db TRADE_CENTER_HEIGHT, TRADE_CENTER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TradeCenter_BlockData), TradeCenter_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TradeCenter_MapScriptHeader), TradeCenter_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TradeCenter_MapEventHeader

	; connections
	db 0
; 0x962fc

Colosseum_SecondMapHeader: ; 0x962fc
	; border block
	db $0

	; height, width
	db COLOSSEUM_HEIGHT, COLOSSEUM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Colosseum_BlockData), Colosseum_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Colosseum_MapScriptHeader), Colosseum_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Colosseum_MapEventHeader

	; connections
	db 0
; 0x96308

TimeCapsule_SecondMapHeader: ; 0x96308
	; border block
	db $0

	; height, width
	db TIME_CAPSULE_HEIGHT, TIME_CAPSULE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TradeCenter_BlockData), TradeCenter_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TimeCapsule_MapScriptHeader), TimeCapsule_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TimeCapsule_MapEventHeader

	; connections
	db 0
; 0x96314

MobileTradeRoomMobile_SecondMapHeader: ; 0x96314
	; border block
	db $0

	; height, width
	db MOBILE_TRADE_ROOM_MOBILE_HEIGHT, MOBILE_TRADE_ROOM_MOBILE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MobileTradeRoomMobile_BlockData), MobileTradeRoomMobile_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MobileTradeRoomMobile_MapScriptHeader), MobileTradeRoomMobile_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MobileTradeRoomMobile_MapEventHeader

	; connections
	db 0
; 0x96320

MobileBattleRoom_SecondMapHeader: ; 0x96320
	; border block
	db $0

	; height, width
	db MOBILE_BATTLE_ROOM_HEIGHT, MOBILE_BATTLE_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MobileBattleRoom_BlockData), MobileBattleRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MobileBattleRoom_MapScriptHeader), MobileBattleRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MobileBattleRoom_MapEventHeader

	; connections
	db 0
; 0x9632c

CeladonDeptStore1F_SecondMapHeader: ; 0x9632c
	; border block
	db $0

	; height, width
	db CELADON_DEPT_STORE_1F_HEIGHT, CELADON_DEPT_STORE_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore1F_BlockData), GoldenrodDeptStore1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonDeptStore1F_MapScriptHeader), CeladonDeptStore1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonDeptStore1F_MapEventHeader

	; connections
	db 0
; 0x96338

CeladonDeptStore2F_SecondMapHeader: ; 0x96338
	; border block
	db $0

	; height, width
	db CELADON_DEPT_STORE_2F_HEIGHT, CELADON_DEPT_STORE_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore2F_BlockData), GoldenrodDeptStore2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonDeptStore2F_MapScriptHeader), CeladonDeptStore2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonDeptStore2F_MapEventHeader

	; connections
	db 0
; 0x96344

CeladonDeptStore3F_SecondMapHeader: ; 0x96344
	; border block
	db $0

	; height, width
	db CELADON_DEPT_STORE_3F_HEIGHT, CELADON_DEPT_STORE_3F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore3F_BlockData), GoldenrodDeptStore3F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonDeptStore3F_MapScriptHeader), CeladonDeptStore3F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonDeptStore3F_MapEventHeader

	; connections
	db 0
; 0x96350

CeladonDeptStore4F_SecondMapHeader: ; 0x96350
	; border block
	db $0

	; height, width
	db CELADON_DEPT_STORE_4F_HEIGHT, CELADON_DEPT_STORE_4F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore4F_BlockData), GoldenrodDeptStore4F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonDeptStore4F_MapScriptHeader), CeladonDeptStore4F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonDeptStore4F_MapEventHeader

	; connections
	db 0
; 0x9635c

CeladonDeptStore5F_SecondMapHeader: ; 0x9635c
	; border block
	db $0

	; height, width
	db CELADON_DEPT_STORE_5F_HEIGHT, CELADON_DEPT_STORE_5F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore5F_BlockData), GoldenrodDeptStore5F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonDeptStore5F_MapScriptHeader), CeladonDeptStore5F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonDeptStore5F_MapEventHeader

	; connections
	db 0
; 0x96368

CeladonDeptStore6F_SecondMapHeader: ; 0x96368
	; border block
	db $0

	; height, width
	db CELADON_DEPT_STORE_6F_HEIGHT, CELADON_DEPT_STORE_6F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStore6F_BlockData), GoldenrodDeptStore6F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonDeptStore6F_MapScriptHeader), CeladonDeptStore6F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonDeptStore6F_MapEventHeader

	; connections
	db 0
; 0x96374

CeladonDeptStoreElevator_SecondMapHeader: ; 0x96374
	; border block
	db $0

	; height, width
	db CELADON_DEPT_STORE_ELEVATOR_HEIGHT, CELADON_DEPT_STORE_ELEVATOR_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(GoldenrodDeptStoreElevator_BlockData), GoldenrodDeptStoreElevator_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonDeptStoreElevator_MapScriptHeader), CeladonDeptStoreElevator_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonDeptStoreElevator_MapEventHeader

	; connections
	db 0
; 0x96380

CeladonMansion1F_SecondMapHeader: ; 0x96380
	; border block
	db $0

	; height, width
	db CELADON_MANSION_1F_HEIGHT, CELADON_MANSION_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeladonMansion1F_BlockData), CeladonMansion1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonMansion1F_MapScriptHeader), CeladonMansion1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonMansion1F_MapEventHeader

	; connections
	db 0
; 0x9638c

CeladonMansion2F_SecondMapHeader: ; 0x9638c
	; border block
	db $0

	; height, width
	db CELADON_MANSION_2F_HEIGHT, CELADON_MANSION_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeladonMansion2F_BlockData), CeladonMansion2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonMansion2F_MapScriptHeader), CeladonMansion2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonMansion2F_MapEventHeader

	; connections
	db 0
; 0x96398

CeladonMansion3F_SecondMapHeader: ; 0x96398
	; border block
	db $0

	; height, width
	db CELADON_MANSION_3F_HEIGHT, CELADON_MANSION_3F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeladonMansion3F_BlockData), CeladonMansion3F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonMansion3F_MapScriptHeader), CeladonMansion3F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonMansion3F_MapEventHeader

	; connections
	db 0
; 0x963a4

CeladonMansionRoof_SecondMapHeader: ; 0x963a4
	; border block
	db $1

	; height, width
	db CELADON_MANSION_ROOF_HEIGHT, CELADON_MANSION_ROOF_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeladonMansionRoof_BlockData), CeladonMansionRoof_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonMansionRoof_MapScriptHeader), CeladonMansionRoof_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonMansionRoof_MapEventHeader

	; connections
	db 0
; 0x963b0

CeladonMansionRoofHouse_SecondMapHeader: ; 0x963b0
	; border block
	db $0

	; height, width
	db CELADON_MANSION_ROOF_HOUSE_HEIGHT, CELADON_MANSION_ROOF_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonMansionRoofHouse_MapScriptHeader), CeladonMansionRoofHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonMansionRoofHouse_MapEventHeader

	; connections
	db 0
; 0x963bc

CeladonPokeCenter1F_SecondMapHeader: ; 0x963bc
	; border block
	db $0

	; height, width
	db CELADON_POKECENTER_1F_HEIGHT, CELADON_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonPokeCenter1F_MapScriptHeader), CeladonPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x963c8

CeladonPokeCenter2FBeta_SecondMapHeader: ; 0x963c8
	; border block
	db $0

	; height, width
	db CELADON_POKECENTER_2F_BETA_HEIGHT, CELADON_POKECENTER_2F_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonPokeCenter2FBeta_MapScriptHeader), CeladonPokeCenter2FBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonPokeCenter2FBeta_MapEventHeader

	; connections
	db 0
; 0x963d4

CeladonGameCorner_SecondMapHeader: ; 0x963d4
	; border block
	db $0

	; height, width
	db CELADON_GAME_CORNER_HEIGHT, CELADON_GAME_CORNER_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeladonGameCorner_BlockData), CeladonGameCorner_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonGameCorner_MapScriptHeader), CeladonGameCorner_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonGameCorner_MapEventHeader

	; connections
	db 0
; 0x963e0

CeladonGameCornerPrizeRoom_SecondMapHeader: ; 0x963e0
	; border block
	db $0

	; height, width
	db CELADON_GAME_CORNER_PRIZE_ROOM_HEIGHT, CELADON_GAME_CORNER_PRIZE_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeladonGameCornerPrizeRoom_BlockData), CeladonGameCornerPrizeRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonGameCornerPrizeRoom_MapScriptHeader), CeladonGameCornerPrizeRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonGameCornerPrizeRoom_MapEventHeader

	; connections
	db 0
; 0x963ec

CeladonGym_SecondMapHeader: ; 0x963ec
	; border block
	db $0

	; height, width
	db CELADON_GYM_HEIGHT, CELADON_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeladonGym_BlockData), CeladonGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonGym_MapScriptHeader), CeladonGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonGym_MapEventHeader

	; connections
	db 0
; 0x963f8

CeladonCafe_SecondMapHeader: ; 0x963f8
	; border block
	db $0

	; height, width
	db CELADON_CAFE_HEIGHT, CELADON_CAFE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CeladonCafe_BlockData), CeladonCafe_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CeladonCafe_MapScriptHeader), CeladonCafe_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CeladonCafe_MapEventHeader

	; connections
	db 0
; 0x96404

Route16FuchsiaSpeechHouse_SecondMapHeader: ; 0x96404
	; border block
	db $0

	; height, width
	db ROUTE_16_FUCHSIA_SPEECH_HOUSE_HEIGHT, ROUTE_16_FUCHSIA_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route16FuchsiaSpeechHouse_MapScriptHeader), Route16FuchsiaSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route16FuchsiaSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x96410

Route16Gate_SecondMapHeader: ; 0x96410
	; border block
	db $0

	; height, width
	db ROUTE_16_GATE_HEIGHT, ROUTE_16_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route16Gate_MapScriptHeader), Route16Gate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route16Gate_MapEventHeader

	; connections
	db 0
; 0x9641c

Route7SaffronGate_SecondMapHeader: ; 0x9641c
	; border block
	db $0

	; height, width
	db ROUTE_7_SAFFRON_GATE_HEIGHT, ROUTE_7_SAFFRON_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route7SaffronGate_MapScriptHeader), Route7SaffronGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route7SaffronGate_MapEventHeader

	; connections
	db 0
; 0x96428

Route1718Gate_SecondMapHeader: ; 0x96428
	; border block
	db $0

	; height, width
	db ROUTE_17_18_GATE_HEIGHT, ROUTE_17_18_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route1718Gate_MapScriptHeader), Route1718Gate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route1718Gate_MapEventHeader

	; connections
	db 0
; 0x96434

ManiasHouse_SecondMapHeader: ; 0x96434
	; border block
	db $0

	; height, width
	db MANIAS_HOUSE_HEIGHT, MANIAS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(ManiasHouse_MapScriptHeader), ManiasHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw ManiasHouse_MapEventHeader

	; connections
	db 0
; 0x96440

CianwoodGym_SecondMapHeader: ; 0x96440
	; border block
	db $0

	; height, width
	db CIANWOOD_GYM_HEIGHT, CIANWOOD_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CianwoodGym_BlockData), CianwoodGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CianwoodGym_MapScriptHeader), CianwoodGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CianwoodGym_MapEventHeader

	; connections
	db 0
; 0x9644c

CianwoodPokeCenter1F_SecondMapHeader: ; 0x9644c
	; border block
	db $0

	; height, width
	db CIANWOOD_POKECENTER_1F_HEIGHT, CIANWOOD_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CianwoodPokeCenter1F_MapScriptHeader), CianwoodPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CianwoodPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x96458

CianwoodPharmacy_SecondMapHeader: ; 0x96458
	; border block
	db $0

	; height, width
	db CIANWOOD_PHARMACY_HEIGHT, CIANWOOD_PHARMACY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CianwoodPharmacy_MapScriptHeader), CianwoodPharmacy_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CianwoodPharmacy_MapEventHeader

	; connections
	db 0
; 0x96464

CianwoodCityPhotoStudio_SecondMapHeader: ; 0x96464
	; border block
	db $0

	; height, width
	db CIANWOOD_CITY_PHOTO_STUDIO_HEIGHT, CIANWOOD_CITY_PHOTO_STUDIO_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CianwoodCityPhotoStudio_MapScriptHeader), CianwoodCityPhotoStudio_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CianwoodCityPhotoStudio_MapEventHeader

	; connections
	db 0
; 0x96470

CianwoodLugiaSpeechHouse_SecondMapHeader: ; 0x96470
	; border block
	db $0

	; height, width
	db CIANWOOD_LUGIA_SPEECH_HOUSE_HEIGHT, CIANWOOD_LUGIA_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CianwoodLugiaSpeechHouse_MapScriptHeader), CianwoodLugiaSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CianwoodLugiaSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x9647c

PokeSeersHouse_SecondMapHeader: ; 0x9647c
	; border block
	db $0

	; height, width
	db POKE_SEERS_HOUSE_HEIGHT, POKE_SEERS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(PokeSeersHouse_MapScriptHeader), PokeSeersHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw PokeSeersHouse_MapEventHeader

	; connections
	db 0
; 0x96488

BattleTower1F_SecondMapHeader: ; 0x96488
	; border block
	db $0

	; height, width
	db BATTLE_TOWER_1F_HEIGHT, BATTLE_TOWER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BattleTower1F_BlockData), BattleTower1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BattleTower1F_MapScriptHeader), BattleTower1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BattleTower1F_MapEventHeader

	; connections
	db 0
; 0x96494

BattleTowerBattleRoom_SecondMapHeader: ; 0x96494
	; border block
	db $0

	; height, width
	db BATTLE_TOWER_BATTLE_ROOM_HEIGHT, BATTLE_TOWER_BATTLE_ROOM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BattleTowerBattleRoom_BlockData), BattleTowerBattleRoom_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BattleTowerBattleRoom_MapScriptHeader), BattleTowerBattleRoom_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BattleTowerBattleRoom_MapEventHeader

	; connections
	db 0
; 0x964a0

BattleTowerElevator_SecondMapHeader: ; 0x964a0
	; border block
	db $0

	; height, width
	db BATTLE_TOWER_ELEVATOR_HEIGHT, BATTLE_TOWER_ELEVATOR_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BattleTowerElevator_BlockData), BattleTowerElevator_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BattleTowerElevator_MapScriptHeader), BattleTowerElevator_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BattleTowerElevator_MapEventHeader

	; connections
	db 0
; 0x964ac

BattleTowerHallway_SecondMapHeader: ; 0x964ac
	; border block
	db $0

	; height, width
	db BATTLE_TOWER_HALLWAY_HEIGHT, BATTLE_TOWER_HALLWAY_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BattleTowerHallway_BlockData), BattleTowerHallway_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BattleTowerHallway_MapScriptHeader), BattleTowerHallway_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BattleTowerHallway_MapEventHeader

	; connections
	db 0
; 0x964b8

Route40BattleTowerGate_SecondMapHeader: ; 0x964b8
	; border block
	db $0

	; height, width
	db ROUTE_40_BATTLE_TOWER_GATE_HEIGHT, ROUTE_40_BATTLE_TOWER_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route40BattleTowerGate_MapScriptHeader), Route40BattleTowerGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route40BattleTowerGate_MapEventHeader

	; connections
	db 0
; 0x964c4

BattleTowerOutside_SecondMapHeader: ; 0x964c4
	; border block
	db $5

	; height, width
	db BATTLE_TOWER_OUTSIDE_HEIGHT, BATTLE_TOWER_OUTSIDE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(BattleTowerOutside_BlockData), BattleTowerOutside_BlockData

	; script header (bank-then-pointer)
	dbw BANK(BattleTowerOutside_MapScriptHeader), BattleTowerOutside_MapScriptHeader

	; map event header (bank-then-pointer)
	dw BattleTowerOutside_MapEventHeader

	; connections
	db 0
; 0x964d0

ViridianGym_SecondMapHeader: ; 0x964d0
	; border block
	db $0

	; height, width
	db VIRIDIAN_GYM_HEIGHT, VIRIDIAN_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(ViridianGym_BlockData), ViridianGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(ViridianGym_MapScriptHeader), ViridianGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw ViridianGym_MapEventHeader

	; connections
	db 0
; 0x964dc

ViridianNicknameSpeechHouse_SecondMapHeader: ; 0x964dc
	; border block
	db $0

	; height, width
	db VIRIDIAN_NICKNAME_SPEECH_HOUSE_HEIGHT, VIRIDIAN_NICKNAME_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(ViridianNicknameSpeechHouse_MapScriptHeader), ViridianNicknameSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw ViridianNicknameSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x964e8

TrainerHouse1F_SecondMapHeader: ; 0x964e8
	; border block
	db $0

	; height, width
	db TRAINER_HOUSE_1F_HEIGHT, TRAINER_HOUSE_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TrainerHouse1F_BlockData), TrainerHouse1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TrainerHouse1F_MapScriptHeader), TrainerHouse1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TrainerHouse1F_MapEventHeader

	; connections
	db 0
; 0x964f4

TrainerHouseB1F_SecondMapHeader: ; 0x964f4
	; border block
	db $0

	; height, width
	db TRAINER_HOUSE_B1F_HEIGHT, TRAINER_HOUSE_B1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(TrainerHouseB1F_BlockData), TrainerHouseB1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(TrainerHouseB1F_MapScriptHeader), TrainerHouseB1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw TrainerHouseB1F_MapEventHeader

	; connections
	db 0
; 0x96500

ViridianMart_SecondMapHeader: ; 0x96500
	; border block
	db $0

	; height, width
	db VIRIDIAN_MART_HEIGHT, VIRIDIAN_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(ViridianMart_MapScriptHeader), ViridianMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw ViridianMart_MapEventHeader

	; connections
	db 0
; 0x9650c

ViridianPokeCenter1F_SecondMapHeader: ; 0x9650c
	; border block
	db $0

	; height, width
	db VIRIDIAN_POKECENTER_1F_HEIGHT, VIRIDIAN_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(ViridianPokeCenter1F_MapScriptHeader), ViridianPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw ViridianPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x96518

ViridianPokeCenter2FBeta_SecondMapHeader: ; 0x96518
	; border block
	db $0

	; height, width
	db VIRIDIAN_POKECENTER_2F_BETA_HEIGHT, VIRIDIAN_POKECENTER_2F_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(ViridianPokeCenter2FBeta_MapScriptHeader), ViridianPokeCenter2FBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw ViridianPokeCenter2FBeta_MapEventHeader

	; connections
	db 0
; 0x96524

Route2NuggetSpeechHouse_SecondMapHeader: ; 0x96524
	; border block
	db $0

	; height, width
	db ROUTE_2_NUGGET_SPEECH_HOUSE_HEIGHT, ROUTE_2_NUGGET_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route2NuggetSpeechHouse_MapScriptHeader), Route2NuggetSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route2NuggetSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x96530

Route2Gate_SecondMapHeader: ; 0x96530
	; border block
	db $0

	; height, width
	db ROUTE_2_GATE_HEIGHT, ROUTE_2_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route2Gate_MapScriptHeader), Route2Gate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route2Gate_MapEventHeader

	; connections
	db 0
; 0x9653c

VictoryRoadGate_SecondMapHeader: ; 0x9653c
	; border block
	db $0

	; height, width
	db VICTORY_ROAD_GATE_HEIGHT, VICTORY_ROAD_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(VictoryRoadGate_BlockData), VictoryRoadGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(VictoryRoadGate_MapScriptHeader), VictoryRoadGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw VictoryRoadGate_MapEventHeader

	; connections
	db 0
; 0x96548

ElmsLab_SecondMapHeader: ; 0x96548
	; border block
	db $0

	; height, width
	db ELMS_LAB_HEIGHT, ELMS_LAB_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(ElmsLab_BlockData), ElmsLab_BlockData

	; script header (bank-then-pointer)
	dbw BANK(ElmsLab_MapScriptHeader), ElmsLab_MapScriptHeader

	; map event header (bank-then-pointer)
	dw ElmsLab_MapEventHeader

	; connections
	db 0
; 0x96554

KrissHouse1F_SecondMapHeader: ; 0x96554
	; border block
	db $0

	; height, width
	db KRISS_HOUSE_1F_HEIGHT, KRISS_HOUSE_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(KrissHouse1F_BlockData), KrissHouse1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(KrissHouse1F_MapScriptHeader), KrissHouse1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw KrissHouse1F_MapEventHeader

	; connections
	db 0
; 0x96560

KrissHouse2F_SecondMapHeader: ; 0x96560
	; border block
	db $0

	; height, width
	db KRISS_HOUSE_2F_HEIGHT, KRISS_HOUSE_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(KrissHouse2F_BlockData), KrissHouse2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(KrissHouse2F_MapScriptHeader), KrissHouse2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw KrissHouse2F_MapEventHeader

	; connections
	db 0
; 0x9656c

KrissNeighborsHouse_SecondMapHeader: ; 0x9656c
	; border block
	db $0

	; height, width
	db KRISS_NEIGHBORS_HOUSE_HEIGHT, KRISS_NEIGHBORS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(KrissNeighborsHouse_MapScriptHeader), KrissNeighborsHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw KrissNeighborsHouse_MapEventHeader

	; connections
	db 0
; 0x96578

ElmsHouse_SecondMapHeader: ; 0x96578
	; border block
	db $0

	; height, width
	db ELMS_HOUSE_HEIGHT, ELMS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(ElmsHouse_BlockData), ElmsHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(ElmsHouse_MapScriptHeader), ElmsHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw ElmsHouse_MapEventHeader

	; connections
	db 0
; 0x96584

Route26HealSpeechHouse_SecondMapHeader: ; 0x96584
	; border block
	db $0

	; height, width
	db ROUTE_26_HEAL_SPEECH_HOUSE_HEIGHT, ROUTE_26_HEAL_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route26HealSpeechHouse_MapScriptHeader), Route26HealSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route26HealSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x96590

Route26DayofWeekSiblingsHouse_SecondMapHeader: ; 0x96590
	; border block
	db $0

	; height, width
	db ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE_HEIGHT, ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route26DayofWeekSiblingsHouse_MapScriptHeader), Route26DayofWeekSiblingsHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route26DayofWeekSiblingsHouse_MapEventHeader

	; connections
	db 0
; 0x9659c

Route27SandstormHouse_SecondMapHeader: ; 0x9659c
	; border block
	db $0

	; height, width
	db ROUTE_27_SANDSTORM_HOUSE_HEIGHT, ROUTE_27_SANDSTORM_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route27SandstormHouse_MapScriptHeader), Route27SandstormHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route27SandstormHouse_MapEventHeader

	; connections
	db 0
; 0x965a8

Route2946Gate_SecondMapHeader: ; 0x965a8
	; border block
	db $0

	; height, width
	db ROUTE_29_46_GATE_HEIGHT, ROUTE_29_46_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route2946Gate_MapScriptHeader), Route2946Gate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route2946Gate_MapEventHeader

	; connections
	db 0
; 0x965b4

FightingDojo_SecondMapHeader: ; 0x965b4
	; border block
	db $0

	; height, width
	db FIGHTING_DOJO_HEIGHT, FIGHTING_DOJO_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(FightingDojo_BlockData), FightingDojo_BlockData

	; script header (bank-then-pointer)
	dbw BANK(FightingDojo_MapScriptHeader), FightingDojo_MapScriptHeader

	; map event header (bank-then-pointer)
	dw FightingDojo_MapEventHeader

	; connections
	db 0
; 0x965c0

SaffronGym_SecondMapHeader: ; 0x965c0
	; border block
	db $0

	; height, width
	db SAFFRON_GYM_HEIGHT, SAFFRON_GYM_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SaffronGym_BlockData), SaffronGym_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SaffronGym_MapScriptHeader), SaffronGym_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SaffronGym_MapEventHeader

	; connections
	db 0
; 0x965cc

SaffronMart_SecondMapHeader: ; 0x965cc
	; border block
	db $0

	; height, width
	db SAFFRON_MART_HEIGHT, SAFFRON_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SaffronMart_MapScriptHeader), SaffronMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SaffronMart_MapEventHeader

	; connections
	db 0
; 0x965d8

SaffronPokeCenter1F_SecondMapHeader: ; 0x965d8
	; border block
	db $0

	; height, width
	db SAFFRON_POKECENTER_1F_HEIGHT, SAFFRON_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SaffronPokeCenter1F_MapScriptHeader), SaffronPokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SaffronPokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x965e4

SaffronPokeCenter2FBeta_SecondMapHeader: ; 0x965e4
	; border block
	db $0

	; height, width
	db SAFFRON_POKECENTER_2F_BETA_HEIGHT, SAFFRON_POKECENTER_2F_BETA_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CinnabarPokeCenter2FBeta_BlockData), CinnabarPokeCenter2FBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SaffronPokeCenter2FBeta_MapScriptHeader), SaffronPokeCenter2FBeta_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SaffronPokeCenter2FBeta_MapEventHeader

	; connections
	db 0
; 0x965f0

MrPsychicsHouse_SecondMapHeader: ; 0x965f0
	; border block
	db $0

	; height, width
	db MR_PSYCHICS_HOUSE_HEIGHT, MR_PSYCHICS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MrPsychicsHouse_MapScriptHeader), MrPsychicsHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MrPsychicsHouse_MapEventHeader

	; connections
	db 0
; 0x965fc

SaffronTrainStation_SecondMapHeader: ; 0x965fc
	; border block
	db $0

	; height, width
	db SAFFRON_TRAIN_STATION_HEIGHT, SAFFRON_TRAIN_STATION_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SaffronTrainStation_BlockData), SaffronTrainStation_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SaffronTrainStation_MapScriptHeader), SaffronTrainStation_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SaffronTrainStation_MapEventHeader

	; connections
	db 0
; 0x96608

SilphCo1F_SecondMapHeader: ; 0x96608
	; border block
	db $0

	; height, width
	db SILPH_CO_1F_HEIGHT, SILPH_CO_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SilphCo1F_BlockData), SilphCo1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(SilphCo1F_MapScriptHeader), SilphCo1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw SilphCo1F_MapEventHeader

	; connections
	db 0
; 0x96614

CopycatsHouse1F_SecondMapHeader: ; 0x96614
	; border block
	db $0

	; height, width
	db COPYCATS_HOUSE_1F_HEIGHT, COPYCATS_HOUSE_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CopycatsHouse1F_BlockData), CopycatsHouse1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CopycatsHouse1F_MapScriptHeader), CopycatsHouse1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CopycatsHouse1F_MapEventHeader

	; connections
	db 0
; 0x96620

CopycatsHouse2F_SecondMapHeader: ; 0x96620
	; border block
	db $0

	; height, width
	db COPYCATS_HOUSE_2F_HEIGHT, COPYCATS_HOUSE_2F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(CopycatsHouse2F_BlockData), CopycatsHouse2F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CopycatsHouse2F_MapScriptHeader), CopycatsHouse2F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CopycatsHouse2F_MapEventHeader

	; connections
	db 0
; 0x9662c

Route5UndergroundEntrance_SecondMapHeader: ; 0x9662c
	; border block
	db $0

	; height, width
	db ROUTE_5_UNDERGROUND_ENTRANCE_HEIGHT, ROUTE_5_UNDERGROUND_ENTRANCE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route6UndergroundEntrance_BlockData), Route6UndergroundEntrance_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route5UndergroundEntrance_MapScriptHeader), Route5UndergroundEntrance_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route5UndergroundEntrance_MapEventHeader

	; connections
	db 0
; 0x96638

Route5SaffronCityGate_SecondMapHeader: ; 0x96638
	; border block
	db $0

	; height, width
	db ROUTE_5_SAFFRON_CITY_GATE_HEIGHT, ROUTE_5_SAFFRON_CITY_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(SafariZoneFuchsiaGateBeta_BlockData), SafariZoneFuchsiaGateBeta_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route5SaffronCityGate_MapScriptHeader), Route5SaffronCityGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route5SaffronCityGate_MapEventHeader

	; connections
	db 0
; 0x96644

Route5CleanseTagSpeechHouse_SecondMapHeader: ; 0x96644
	; border block
	db $0

	; height, width
	db ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE_HEIGHT, ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route5CleanseTagSpeechHouse_MapScriptHeader), Route5CleanseTagSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route5CleanseTagSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x96650

CherrygroveMart_SecondMapHeader: ; 0x96650
	; border block
	db $0

	; height, width
	db CHERRYGROVE_MART_HEIGHT, CHERRYGROVE_MART_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineMart_BlockData), OlivineMart_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CherrygroveMart_MapScriptHeader), CherrygroveMart_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CherrygroveMart_MapEventHeader

	; connections
	db 0
; 0x9665c

CherrygrovePokeCenter1F_SecondMapHeader: ; 0x9665c
	; border block
	db $0

	; height, width
	db CHERRYGROVE_POKECENTER_1F_HEIGHT, CHERRYGROVE_POKECENTER_1F_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivinePokeCenter1F_BlockData), OlivinePokeCenter1F_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CherrygrovePokeCenter1F_MapScriptHeader), CherrygrovePokeCenter1F_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CherrygrovePokeCenter1F_MapEventHeader

	; connections
	db 0
; 0x96668

CherrygroveGymSpeechHouse_SecondMapHeader: ; 0x96668
	; border block
	db $0

	; height, width
	db CHERRYGROVE_GYM_SPEECH_HOUSE_HEIGHT, CHERRYGROVE_GYM_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CherrygroveGymSpeechHouse_MapScriptHeader), CherrygroveGymSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CherrygroveGymSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x96674

GuideGentsHouse_SecondMapHeader: ; 0x96674
	; border block
	db $0

	; height, width
	db GUIDE_GENTS_HOUSE_HEIGHT, GUIDE_GENTS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(GuideGentsHouse_MapScriptHeader), GuideGentsHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw GuideGentsHouse_MapEventHeader

	; connections
	db 0
; 0x96680

CherrygroveEvolutionSpeechHouse_SecondMapHeader: ; 0x96680
	; border block
	db $0

	; height, width
	db CHERRYGROVE_EVOLUTION_SPEECH_HOUSE_HEIGHT, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(CherrygroveEvolutionSpeechHouse_MapScriptHeader), CherrygroveEvolutionSpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw CherrygroveEvolutionSpeechHouse_MapEventHeader

	; connections
	db 0
; 0x9668c

Route30BerrySpeechHouse_SecondMapHeader: ; 0x9668c
	; border block
	db $0

	; height, width
	db ROUTE_30_BERRY_SPEECH_HOUSE_HEIGHT, ROUTE_30_BERRY_SPEECH_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(OlivineVoltorbHouse_BlockData), OlivineVoltorbHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route30BerrySpeechHouse_MapScriptHeader), Route30BerrySpeechHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route30BerrySpeechHouse_MapEventHeader

	; connections
	db 0
; 0x96698

MrPokemonsHouse_SecondMapHeader: ; 0x96698
	; border block
	db $0

	; height, width
	db MR_POKEMONS_HOUSE_HEIGHT, MR_POKEMONS_HOUSE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(MrPokemonsHouse_BlockData), MrPokemonsHouse_BlockData

	; script header (bank-then-pointer)
	dbw BANK(MrPokemonsHouse_MapScriptHeader), MrPokemonsHouse_MapScriptHeader

	; map event header (bank-then-pointer)
	dw MrPokemonsHouse_MapEventHeader

	; connections
	db 0
; 0x966a4

Route31VioletGate_SecondMapHeader: ; 0x966a4
	; border block
	db $0

	; height, width
	db ROUTE_31_VIOLET_GATE_HEIGHT, ROUTE_31_VIOLET_GATE_WIDTH

	; blockdata (bank-then-pointer)
	dbw BANK(Route38EcruteakGate_BlockData), Route38EcruteakGate_BlockData

	; script header (bank-then-pointer)
	dbw BANK(Route31VioletGate_MapScriptHeader), Route31VioletGate_MapScriptHeader

	; map event header (bank-then-pointer)
	dw Route31VioletGate_MapEventHeader

	; connections
	db 0
; 0x966b0

