MACRO landmark
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	table_width 4, Landmarks
	landmark  -8, -16, SpecialMapName
	landmark 140, 100, NewBarkTownName
	landmark 128, 100, Route29Name
	landmark 100, 100, CherrygroveCityName
	landmark 100,  80, Route30Name
	landmark  96,  60, Route31Name
	landmark  84,  60, VioletCityName
	landmark  85,  58, SproutTowerName
	landmark  84,  92, Route32Name
	landmark  76,  76, RuinsOfAlphName
	landmark  84, 124, UnionCaveName
	landmark  82, 124, Route33Name
	landmark  68, 124, AzaleaTownName
	landmark  70, 122, SlowpokeWellName
	landmark  52, 120, IlexForestName
	landmark  52, 112, Route34Name
	landmark  52,  92, GoldenrodCityName
	landmark  50,  92, RadioTowerName
	landmark  52,  76, Route35Name
	landmark  52,  60, NationalParkName
	landmark  64,  60, Route36Name
	landmark  68,  52, Route37Name
	landmark  68,  44, EcruteakCityName
	landmark  70,  42, TinTowerName
	landmark  66,  42, BurnedTowerName
	landmark  52,  44, Route38Name
	landmark  36,  48, Route39Name
	landmark  36,  60, OlivineCityName
	landmark  38,  62, LighthouseName
	landmark  28,  56, BattleTowerName
	landmark  28,  64, Route40Name
	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route41Name
	landmark  20, 100, CianwoodCityName
	landmark  92,  44, Route42Name
	landmark  84,  44, MtMortarName
	landmark 108,  44, MahoganyTownName
	landmark 108,  36, Route43Name
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route44Name
	landmark 130,  38, IcePathName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route45Name
	landmark 112,  72, DarkCaveName
	landmark 124,  88, Route46Name
	landmark 148,  68, SilverCaveName
	assert_table_length KANTO_LANDMARK
	landmark  52, 108, PalletTownName
	landmark  52,  92, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  64, Route2Name
	landmark  52,  52, PewterCityName
	landmark  64,  52, Route3Name
	landmark  76,  52, MtMoonName
	landmark  88,  52, Route4Name
	landmark 100,  52, CeruleanCityName
	landmark 100,  44, Route24Name
	landmark 108,  36, Route25Name
	landmark 100,  60, Route5Name
	landmark 108,  76, UndergroundName
	landmark 100,  76, Route6Name
	landmark 100,  84, VermilionCityName
	landmark  88,  60, DiglettsCaveName
	landmark  88,  68, Route7Name
	landmark 116,  68, Route8Name
	landmark 116,  52, Route9Name
	landmark 132,  52, RockTunnelName
	landmark 132,  56, Route10Name
	landmark 132,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark  76,  68, CeladonCityName
	landmark 100,  68, SaffronCityName
	landmark 116,  84, Route11Name
	landmark 132,  80, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 112, Route14Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  92, 128, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  52, 120, Route21Name
	landmark  36,  68, Route22Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  44, Route23Name
	landmark  28,  36, IndigoPlateauName
	landmark  28,  92, Route26Name
	landmark  20, 100, Route27Name
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route28Name
	landmark 140, 116, FastShipName
	assert_table_length NUM_LANDMARKS

NewBarkTownName:     db "BOURG<BSP>GEON@"
CherrygroveCityName: db "VILLE<BSP>GRIOTTE@"
VioletCityName:      db "MAUVILLE@"
AzaleaTownName:      db "ECORCIA@"
GoldenrodCityName:   db "DOUBLON<1E>VILLE@"
EcruteakCityName:    db "ROSALIA@"
OlivineCityName:     db "OLIVILLE@"
CianwoodCityName:    db "IRISIA@"
MahoganyTownName:    db "ACAJOU@"
BlackthornCityName:  db "EBENELLE@"
LakeOfRageName:      db "LAC<BSP>COLERE@"
SilverCaveName:      db "GROTTE<BSP>ARGENTEE@"
SproutTowerName:     db "TOUR<BSP>CHETIFLOR@"
RuinsOfAlphName:     db "RUINES<BSP>D'ALPHA@"
UnionCaveName:       db "CAVES<BSP>JUMELLES@"
SlowpokeWellName:    db "PUITS<BSP>RAMOLOSS@"
RadioTowerName:      db "TOUR RADIO@"
PowerPlantName:      db "CENTRALE@"
NationalParkName:    db "PARC<BSP>NATUREL@"
TinTowerName:        db "TOUR<BSP>FERRAILLE@"
LighthouseName:      db "PHARE@"
WhirlIslandsName:    db "TOURB'<BSP>ILES@"
MtMortarName:        db "MONT<BSP>CREUSET@"
DragonsDenName:      db "ANTRE DU<BSP>DRAGON@"
IcePathName:         db "ROUTE<BSP>DE GLACE@"
NotApplicableName:   db "...@" ; unreferenced ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PalletTownName:      db "BOURG<BSP>PALETTE@"
ViridianCityName:    db "JADIELLE@"
PewterCityName:      db "ARGENTA@"
CeruleanCityName:    db "AZURIA@"
LavenderTownName:    db "LAVANVILLE@"
VermilionCityName:   db "CARMIN<BSP>SUR MER@"
CeladonCityName:     db "CELADOPOLE@"
SaffronCityName:     db "SAFRANIA@"
FuchsiaCityName:     db "PARMANIE@"
CinnabarIslandName:  db "CRAMOIS'<WBR>ILE@"
IndigoPlateauName:   db "PLATEAU<BSP>INDIGO@"
VictoryRoadName:     db "ROUTE<BSP>VICTOIRE@"
MtMoonName:          db "MONT<BSP>SELENITE@"
RockTunnelName:      db "GROTTE@"
LavRadioTowerName:   db "TOUR RADIO<BSP>LAVAN.@"
SilphCoName:         db "SYLPHE SARL@" ; unreferenced
SafariZoneName:      db "PARC SAFARI@" ; unreferenced
SeafoamIslandsName:  db "ILES<BSP>ECUME@"
PokemonMansionName:  db "MANOIR<BSP>#MON@" ; unreferenced
CeruleanCaveName:    db "CAVERNE<BSP>AZUREE@" ; unreferenced
Route1Name:          db "ROUTE 1@"
Route2Name:          db "ROUTE 2@"
Route3Name:          db "ROUTE 3@"
Route4Name:          db "ROUTE 4@"
Route5Name:          db "ROUTE 5@"
Route6Name:          db "ROUTE 6@"
Route7Name:          db "ROUTE 7@"
Route8Name:          db "ROUTE 8@"
Route9Name:          db "ROUTE 9@"
Route10Name:         db "ROUTE 10@"
Route11Name:         db "ROUTE 11@"
Route12Name:         db "ROUTE 12@"
Route13Name:         db "ROUTE 13@"
Route14Name:         db "ROUTE 14@"
Route15Name:         db "ROUTE 15@"
Route16Name:         db "ROUTE 16@"
Route17Name:         db "ROUTE 17@"
Route18Name:         db "ROUTE 18@"
Route19Name:         db "ROUTE 19@"
Route20Name:         db "ROUTE 20@"
Route21Name:         db "ROUTE 21@"
Route22Name:         db "ROUTE 22@"
Route23Name:         db "ROUTE 23@"
Route24Name:         db "ROUTE 24@"
Route25Name:         db "ROUTE 25@"
Route26Name:         db "ROUTE 26@"
Route27Name:         db "ROUTE 27@"
Route28Name:         db "ROUTE 28@"
Route29Name:         db "ROUTE 29@"
Route30Name:         db "ROUTE 30@"
Route31Name:         db "ROUTE 31@"
Route32Name:         db "ROUTE 32@"
Route33Name:         db "ROUTE 33@"
Route34Name:         db "ROUTE 34@"
Route35Name:         db "ROUTE 35@"
Route36Name:         db "ROUTE 36@"
Route37Name:         db "ROUTE 37@"
Route38Name:         db "ROUTE 38@"
Route39Name:         db "ROUTE 39@"
Route40Name:         db "ROUTE 40@"
Route41Name:         db "ROUTE 41@"
Route42Name:         db "ROUTE 42@"
Route43Name:         db "ROUTE 43@"
Route44Name:         db "ROUTE 44@"
Route45Name:         db "ROUTE 45@"
Route46Name:         db "ROUTE 46@"
DarkCaveName:        db "ANTRE NOIRE@"
IlexForestName:      db "BOIS AUX<BSP>CHENES@"
BurnedTowerName:     db "TOUR<BSP>CENDREE@"
FastShipName:        db "BATEAU<BSP>EXPRESS@"
ViridianForestName:  db "FORET<BSP>DE JADE@" ; unreferenced
DiglettsCaveName:    db "CAVE<BSP>TAUPIQUEUR@"
TohjoFallsName:      db "CHUTES<BSP>TOHJO@"
UndergroundName:     db "SOUTERRAIN@"
BattleTowerName:     db "TOUR DE<BSP>COMBAT@"
SpecialMapName:      db "SPECIAL@"
