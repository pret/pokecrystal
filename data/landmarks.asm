landmark: MACRO
; x, y, name
	db \1, \2
	dw \3
ENDM

Landmarks: ; 0x1ca8c3
; entries correspond to constants/landmark_constants.asm
	landmark   0,   0, SpecialMapName
	landmark 148, 116, NewBarkTownName
	landmark 136, 116, Route29Name
	landmark 108, 116, CherrygroveCityName
	landmark 108,  96, Route30Name
	landmark 104,  76, Route31Name
	landmark  92,  76, VioletCityName
	landmark  93,  74, SproutTowerName
	landmark  92, 108, Route32Name
	landmark  84,  92, RuinsOfAlphName
	landmark  92, 140, UnionCaveName
	landmark  90, 140, Route33Name
	landmark  76, 140, AzaleaTownName
	landmark  78, 138, SlowpokeWellName
	landmark  60, 136, IlexForestName
	landmark  60, 128, Route34Name
	landmark  60, 108, GoldenrodCityName
	landmark  58, 108, RadioTowerName
	landmark  60,  92, Route35Name
	landmark  60,  76, NationalParkName
	landmark  72,  76, Route36Name
	landmark  76,  68, Route37Name
	landmark  76,  60, EcruteakCityName
	landmark  78,  58, TinTowerName
	landmark  74,  58, BurnedTowerName
	landmark  60,  60, Route38Name
	landmark  44,  64, Route39Name
	landmark  44,  76, OlivineCityName
	landmark  46,  78, LighthouseName
	landmark  36,  72, BattleTowerName
	landmark  36,  80, Route40Name
	landmark  36, 108, WhirlIslandsName
	landmark  36, 116, Route41Name
	landmark  28, 116, CianwoodCityName
	landmark 100,  60, Route42Name
	landmark  92,  60, MtMortarName
	landmark 116,  60, MahoganyTownName
	landmark 116,  52, Route43Name
	landmark 116,  44, LakeOfRageName
	landmark 128,  60, Route44Name
	landmark 138,  54, IcePathName
	landmark 140,  60, BlackthornCityName
	landmark 140,  52, DragonsDenName
	landmark 140,  80, Route45Name
	landmark 120,  88, DarkCaveName
	landmark 132, 104, Route46Name
	landmark 156,  84, SilverCaveName
	landmark  60, 124, PalletTownName
	landmark  60, 108, Route1Name
	landmark  60,  92, ViridianCityName
	landmark  60,  80, Route2Name
	landmark  60,  68, PewterCityName
	landmark  72,  68, Route3Name
	landmark  84,  68, MtMoonName
	landmark  96,  68, Route4Name
	landmark 108,  68, CeruleanCityName
	landmark 108,  60, Route24Name
	landmark 116,  52, Route25Name
	landmark 108,  76, Route5Name
	landmark 116,  92, UndergroundName
	landmark 108,  92, Route6Name
	landmark 108, 100, VermilionCityName
	landmark  96,  76, DiglettsCaveName
	landmark  96,  84, Route7Name
	landmark 124,  84, Route8Name
	landmark 124,  68, Route9Name
	landmark 140,  68, RockTunnelName
	landmark 140,  72, Route10Name
	landmark 140,  76, PowerPlantName
	landmark 140,  84, LavenderTownName
	landmark 148,  84, LavRadioTowerName
	landmark  84,  84, CeladonCityName
	landmark 108,  84, SaffronCityName
	landmark 124, 100, Route11Name
	landmark 140,  96, Route12Name
	landmark 132, 116, Route13Name
	landmark 124, 128, Route14Name
	landmark 112, 132, Route15Name
	landmark  76,  84, Route16Name
	landmark  76, 108, Route17Name
	landmark  88, 132, Route18Name
	landmark 100, 132, FuchsiaCityName
	landmark 100, 144, Route19Name
	landmark  84, 148, Route20Name
	landmark  76, 148, SeafoamIslandsName
	landmark  60, 148, CinnabarIslandName
	landmark  60, 136, Route21Name
	landmark  44,  84, Route22Name
	landmark  36,  68, VictoryRoadName
	landmark  36,  60, Route23Name
	landmark  36,  52, IndigoPlateauName
	landmark  36, 108, Route26Name
	landmark  28, 116, Route27Name
	landmark  20, 116, TohjoFallsName
	landmark  28,  84, Route28Name
	landmark 148, 132, FastShipName
; 0x1caa43

NewBarkTownName:     db "NEW BARK¯TOWN@"
CherrygroveCityName: db "CHERRYGROVE¯CITY@"
VioletCityName:      db "VIOLET CITY@"
AzaleaTownName:      db "AZALEA TOWN@"
GoldenrodCityName:   db "GOLDENROD¯CITY@"
EcruteakCityName:    db "ECRUTEAK¯CITY@"
OlivineCityName:     db "OLIVINE¯CITY@"
CianwoodCityName:    db "CIANWOOD¯CITY@"
MahoganyTownName:    db "MAHOGANY¯TOWN@"
BlackthornCityName:  db "BLACKTHORN¯CITY@"
LakeOfRageName:      db "LAKE OF¯RAGE@"
SilverCaveName:      db "SILVER CAVE@"
SproutTowerName:     db "SPROUT¯TOWER@"
RuinsOfAlphName:     db "RUINS¯OF ALPH@"
UnionCaveName:       db "UNION CAVE@"
SlowpokeWellName:    db "SLOWPOKE¯WELL@"
RadioTowerName:      db "RADIO TOWER@"
PowerPlantName:      db "POWER PLANT@"
NationalParkName:    db "NATIONAL¯PARK@"
TinTowerName:        db "TIN TOWER@"
LighthouseName:      db "LIGHTHOUSE@"
WhirlIslandsName:    db "WHIRL¯ISLANDS@"
MtMortarName:        db "MT.MORTAR@"
DragonsDenName:      db "DRAGON'S¯DEN@"
IcePathName:         db "ICE PATH@"
NotApplicableName:   db "N/A@"
PalletTownName:      db "PALLET TOWN@"
ViridianCityName:    db "VIRIDIAN¯CITY@"
PewterCityName:      db "PEWTER CITY@"
CeruleanCityName:    db "CERULEAN¯CITY@"
LavenderTownName:    db "LAVENDER¯TOWN@"
VermilionCityName:   db "VERMILION¯CITY@"
CeladonCityName:     db "CELADON¯CITY@"
SaffronCityName:     db "SAFFRON¯CITY@"
FuchsiaCityName:     db "FUCHSIA¯CITY@"
CinnabarIslandName:  db "CINNABAR¯ISLAND@"
IndigoPlateauName:   db "INDIGO¯PLATEAU@"
VictoryRoadName:     db "VICTORY¯ROAD@"
MtMoonName:          db "MT.MOON@"
RockTunnelName:      db "ROCK TUNNEL@"
LavRadioTowerName:   db "LAV¯RADIO TOWER@"
SilphCoName:         db "SILPH CO.@"
SafariZoneName:      db "SAFARI ZONE@"
SeafoamIslandsName:  db "SEAFOAM¯ISLANDS@"
PokemonMansionName:  db "#MON¯MANSION@"
CeruleanCaveName:    db "CERULEAN¯CAVE@"
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
DarkCaveName:        db "DARK CAVE@"
IlexForestName:      db "ILEX¯FOREST@"
BurnedTowerName:     db "BURNED¯TOWER@"
FastShipName:        db "FAST SHIP@"
ViridianForestName:  db "VIRIDIAN¯FOREST@"
DiglettsCaveName:    db "DIGLETT'S¯CAVE@"
TohjoFallsName:      db "TOHJO FALLS@"
UndergroundName:     db "UNDERGROUND@"
BattleTowerName:     db "BATTLE¯TOWER@"
SpecialMapName:      db "SPECIAL@"
