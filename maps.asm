INCLUDE "includes.asm"


SECTION "Map Headers", ROMX, BANK[MAP_HEADERS]

INCLUDE "maps/map_headers.asm"
INCLUDE "maps/second_map_headers.asm"



SECTION "Map Blockdata 1", ROMX, BANK[MAPS_1]

INCLUDE "maps/blockdata_1.asm"


SECTION "Map Blockdata 2", ROMX, BANK[MAPS_2]

INCLUDE "maps/blockdata_2.asm"


SECTION "Map Blockdata 3", ROMX, BANK[MAPS_3]

INCLUDE "maps/blockdata_3.asm"



SECTION "Map Scripts 1", ROMX, BANK[MAP_SCRIPTS_1]

INCLUDE "maps/goldenrodcity/GoldenrodGym.asm"
INCLUDE "maps/goldenrodcity/GoldenrodBikeShop.asm"
INCLUDE "maps/goldenrodcity/GoldenrodHappinessRater.asm"
INCLUDE "maps/goldenrodcity/GoldenrodBillsHouse.asm"
INCLUDE "maps/goldenrodcity/GoldenrodMagnetTrainStation.asm"
INCLUDE "maps/goldenrodcity/GoldenrodFlowerShop.asm"
INCLUDE "maps/goldenrodcity/GoldenrodPPSpeechHouse.asm"
INCLUDE "maps/goldenrodcity/GoldenrodNameRater.asm"
INCLUDE "maps/goldenrodcity/deptstore/GoldenrodDeptStore1F.asm"
INCLUDE "maps/goldenrodcity/deptstore/GoldenrodDeptStore2F.asm"
INCLUDE "maps/goldenrodcity/deptstore/GoldenrodDeptStore3F.asm"
INCLUDE "maps/goldenrodcity/deptstore/GoldenrodDeptStore4F.asm"
INCLUDE "maps/goldenrodcity/deptstore/GoldenrodDeptStore5F.asm"
INCLUDE "maps/goldenrodcity/deptstore/GoldenrodDeptStore6F.asm"
INCLUDE "maps/goldenrodcity/deptstore/GoldenrodDeptStoreElevator.asm"
INCLUDE "maps/goldenrodcity/deptstore/GoldenrodDeptStoreRoof.asm"
INCLUDE "maps/goldenrodcity/GoldenrodGameCorner.asm"


SECTION "Map Scripts 2", ROMX, BANK[MAP_SCRIPTS_2]

INCLUDE "maps/ruinsofalph/RuinsofAlphOutside.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphHoOhChamber.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphKabutoChamber.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphOmanyteChamber.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphAerodactylChamber.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphInnerChamber.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphResearchCenter.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphHoOhItemRoom.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphKabutoItemRoom.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphOmanyteItemRoom.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphAerodactylItemRoom.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphHoOhWordRoom.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphKabutoWordRoom.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphOmanyteWordRoom.asm"
INCLUDE "maps/ruinsofalph/RuinsofAlphAerodactylWordRoom.asm"
INCLUDE "maps/caves/unioncave/UnionCave1F.asm"
INCLUDE "maps/caves/unioncave/UnionCaveB1F.asm"
INCLUDE "maps/caves/unioncave/UnionCaveB2F.asm"
INCLUDE "maps/azaleatown/slowpokewell/SlowpokeWellB1F.asm"
INCLUDE "maps/azaleatown/slowpokewell/SlowpokeWellB2F.asm"
INCLUDE "maps/olivinecity/lighthouse/OlivineLighthouse1F.asm"
INCLUDE "maps/olivinecity/lighthouse/OlivineLighthouse2F.asm"
INCLUDE "maps/olivinecity/lighthouse/OlivineLighthouse3F.asm"
INCLUDE "maps/olivinecity/lighthouse/OlivineLighthouse4F.asm"


SECTION "Map Scripts 3", ROMX, BANK[MAP_SCRIPTS_3]

INCLUDE "maps/nationalpark/NationalPark.asm"
INCLUDE "maps/nationalpark/NationalParkBugContest.asm"
INCLUDE "maps/goldenrodcity/radiotower/RadioTower1F.asm"
INCLUDE "maps/goldenrodcity/radiotower/RadioTower2F.asm"
INCLUDE "maps/goldenrodcity/radiotower/RadioTower3F.asm"
INCLUDE "maps/goldenrodcity/radiotower/RadioTower4F.asm"


SECTION "Map Scripts 4", ROMX, BANK[MAP_SCRIPTS_4]

INCLUDE "maps/goldenrodcity/radiotower/RadioTower5F.asm"
INCLUDE "maps/olivinecity/lighthouse/OlivineLighthouse5F.asm"
INCLUDE "maps/olivinecity/lighthouse/OlivineLighthouse6F.asm"
INCLUDE "maps/goldenrodcity/GoldenrodPokeCenter1F.asm"
INCLUDE "maps/goldenrodcity/GoldenrodPokeComCenter2FMobile.asm"
INCLUDE "maps/gates/IlexForestAzaleaGate.asm"
INCLUDE "maps/gates/Route34IlexForestGate.asm"
INCLUDE "maps/johtoroutes/route34/DayCare.asm"


SECTION "Map Scripts 5", ROMX, BANK[MAP_SCRIPTS_5]

INCLUDE "maps/kantoroutes/route11/Route11.asm"
INCLUDE "maps/violetcity/VioletMart.asm"
INCLUDE "maps/violetcity/VioletGym.asm"
INCLUDE "maps/violetcity/EarlsPokemonAcademy.asm"
INCLUDE "maps/violetcity/VioletNicknameSpeechHouse.asm"
INCLUDE "maps/violetcity/VioletPokeCenter1F.asm"
INCLUDE "maps/violetcity/VioletOnixTradeHouse.asm"
INCLUDE "maps/gates/Route32RuinsofAlphGate.asm"
INCLUDE "maps/johtoroutes/route32/Route32PokeCenter1F.asm"
INCLUDE "maps/gates/Route35Goldenrodgate.asm"
INCLUDE "maps/nationalpark/Route35NationalParkgate.asm"
INCLUDE "maps/gates/Route36RuinsofAlphgate.asm"
INCLUDE "maps/nationalpark/Route36NationalParkgate.asm"


SECTION "Map Scripts 6", ROMX, BANK[MAP_SCRIPTS_6]

INCLUDE "maps/kantoroutes/route8/Route8.asm"
INCLUDE "maps/mahoganytown/MahoganyMart1F.asm"
INCLUDE "maps/mahoganytown/teamrocketbase/TeamRocketBaseB1F.asm"
INCLUDE "maps/mahoganytown/teamrocketbase/TeamRocketBaseB2F.asm"
INCLUDE "maps/mahoganytown/teamrocketbase/TeamRocketBaseB3F.asm"
INCLUDE "maps/ilexforest/IlexForest.asm"


SECTION "Map Scripts 7", ROMX, BANK[MAP_SCRIPTS_7]

INCLUDE "maps/lakeofrage/LakeofRage.asm"
INCLUDE "maps/celadoncity/deptstore/CeladonDeptStore1F.asm"
INCLUDE "maps/celadoncity/deptstore/CeladonDeptStore2F.asm"
INCLUDE "maps/celadoncity/deptstore/CeladonDeptStore3F.asm"
INCLUDE "maps/celadoncity/deptstore/CeladonDeptStore4F.asm"
INCLUDE "maps/celadoncity/deptstore/CeladonDeptStore5F.asm"
INCLUDE "maps/celadoncity/deptstore/CeladonDeptStore6F.asm"
INCLUDE "maps/celadoncity/deptstore/CeladonDeptStoreElevator.asm"
INCLUDE "maps/celadoncity/mansion/CeladonMansion1F.asm"
INCLUDE "maps/celadoncity/mansion/CeladonMansion2F.asm"
INCLUDE "maps/celadoncity/mansion/CeladonMansion3F.asm"
INCLUDE "maps/celadoncity/mansion/CeladonMansionRoof.asm"
INCLUDE "maps/celadoncity/mansion/CeladonMansionRoofHouse.asm"
INCLUDE "maps/celadoncity/CeladonPokeCenter1F.asm"
INCLUDE "maps/celadoncity/unused/CeladonPokeCenter2FBeta.asm"
INCLUDE "maps/celadoncity/CeladonGameCorner.asm"
INCLUDE "maps/celadoncity/CeladonGameCornerPrizeRoom.asm"
INCLUDE "maps/celadoncity/CeladonGym.asm"
INCLUDE "maps/celadoncity/CeladonCafe.asm"
INCLUDE "maps/kantoroutes/route16/Route16FuchsiaSpeechHouse.asm"
INCLUDE "maps/gates/Route16Gate.asm"
INCLUDE "maps/gates/Route7SaffronGate.asm"
INCLUDE "maps/gates/Route1718Gate.asm"


SECTION "Map Scripts 8", ROMX, BANK[MAP_SCRIPTS_8]

INCLUDE "maps/caves/DiglettsCave.asm"
INCLUDE "maps/caves/mountmoon/MountMoon.asm"
INCLUDE "maps/kantoroutes/underground/UndergroundPath.asm"
INCLUDE "maps/caves/rocktunnel/RockTunnel1F.asm"
INCLUDE "maps/caves/rocktunnel/RockTunnelB1F.asm"
INCLUDE "maps/safarizone/SafariZoneFuchsiaGateBeta.asm"
INCLUDE "maps/safarizone/SafariZoneBeta.asm"
INCLUDE "maps/caves/victoryroad/VictoryRoad.asm"
INCLUDE "maps/olivinecity/OlivinePort.asm"
INCLUDE "maps/vermilioncity/VermilionPort.asm"
INCLUDE "maps/fastship/FastShip1F.asm"
INCLUDE "maps/fastship/FastShipCabins_NNW_NNE_NE.asm"
INCLUDE "maps/fastship/FastShipCabins_SW_SSW_NW.asm"
INCLUDE "maps/fastship/FastShipCabins_SE_SSE_CaptainsCabin.asm"
INCLUDE "maps/fastship/FastShipB1F.asm"
INCLUDE "maps/olivinecity/OlivinePortPassage.asm"
INCLUDE "maps/vermilioncity/VermilionPortPassage.asm"
INCLUDE "maps/caves/mountmoon/MountMoonSquare.asm"
INCLUDE "maps/caves/mountmoon/MountMoonGiftShop.asm"
INCLUDE "maps/ecruteakcity/tintower/TinTowerRoof.asm"


SECTION "Map Scripts 9", ROMX, BANK[MAP_SCRIPTS_9]

INCLUDE "maps/johtoroutes/route34/Route34.asm"
INCLUDE "maps/newbarktown/ElmsLab.asm"
INCLUDE "maps/newbarktown/KrissHouse1F.asm"
INCLUDE "maps/newbarktown/KrissHouse2F.asm"
INCLUDE "maps/newbarktown/KrissNeighborsHouse.asm"
INCLUDE "maps/newbarktown/ElmsHouse.asm"
INCLUDE "maps/kantoroutes/route26/Route26HealSpeechHouse.asm"
INCLUDE "maps/kantoroutes/route26/Route26DayofWeekSiblingsHouse.asm"
INCLUDE "maps/kantoroutes/route27/Route27SandstormHouse.asm"
INCLUDE "maps/gates/Route2946Gate.asm"


SECTION "Map Scripts 10", ROMX, BANK[MAP_SCRIPTS_10]

INCLUDE "maps/kantoroutes/route22/Route22.asm"
INCLUDE "maps/goldenrodcity/underground/GoldenrodUnderground.asm"
INCLUDE "maps/goldenrodcity/underground/UndergroundSwitchRoomEntrances.asm"
INCLUDE "maps/goldenrodcity/deptstore/GoldenrodDeptStoreB1F.asm"
INCLUDE "maps/goldenrodcity/underground/UndergroundWarehouse.asm"
INCLUDE "maps/caves/mountmortar/MountMortar1FOutside.asm"
INCLUDE "maps/caves/mountmortar/MountMortar1FInside.asm"
INCLUDE "maps/caves/mountmortar/MountMortar2FInside.asm"
INCLUDE "maps/caves/mountmortar/MountMortarB1F.asm"
INCLUDE "maps/caves/icepath/IcePath1F.asm"
INCLUDE "maps/caves/icepath/IcePathB1F.asm"
INCLUDE "maps/caves/icepath/IcePathB2FMahoganySide.asm"
INCLUDE "maps/caves/icepath/IcePathB2FBlackthornSide.asm"
INCLUDE "maps/caves/icepath/IcePathB3F.asm"
INCLUDE "maps/lavendertown/LavenderPokeCenter1F.asm"
INCLUDE "maps/lavendertown/unused/LavenderPokeCenter2FBeta.asm"
INCLUDE "maps/lavendertown/MrFujisHouse.asm"
INCLUDE "maps/lavendertown/LavenderTownSpeechHouse.asm"
INCLUDE "maps/lavendertown/LavenderNameRater.asm"
INCLUDE "maps/lavendertown/LavenderMart.asm"
INCLUDE "maps/lavendertown/SoulHouse.asm"
INCLUDE "maps/lavendertown/LavRadioTower1F.asm"
INCLUDE "maps/gates/Route8SaffronGate.asm"
INCLUDE "maps/kantoroutes/route12/Route12SuperRodHouse.asm"


SECTION "Map Scripts 11", ROMX, BANK[MAP_SCRIPTS_11]

INCLUDE "maps/ecruteakcity/EcruteakHouse.asm"
INCLUDE "maps/ecruteakcity/WiseTriosRoom.asm"
INCLUDE "maps/ecruteakcity/EcruteakPokeCenter1F.asm"
INCLUDE "maps/ecruteakcity/EcruteakLugiaSpeechHouse.asm"
INCLUDE "maps/ecruteakcity/DanceTheatre.asm"
INCLUDE "maps/ecruteakcity/EcruteakMart.asm"
INCLUDE "maps/ecruteakcity/EcruteakGym.asm"
INCLUDE "maps/ecruteakcity/EcruteakItemfinderHouse.asm"
INCLUDE "maps/viridiancity/ViridianGym.asm"
INCLUDE "maps/viridiancity/ViridianNicknameSpeechHouse.asm"
INCLUDE "maps/trainerhouse/TrainerHouse1F.asm"
INCLUDE "maps/trainerhouse/TrainerHouseB1F.asm"
INCLUDE "maps/viridiancity/ViridianMart.asm"
INCLUDE "maps/viridiancity/ViridianPokeCenter1F.asm"
INCLUDE "maps/viridiancity/unused/ViridianPokeCenter2FBeta.asm"
INCLUDE "maps/kantoroutes/route2/Route2NuggetSpeechHouse.asm"
INCLUDE "maps/gates/Route2Gate.asm"
INCLUDE "maps/caves/victoryroad/VictoryRoadGate.asm"


SECTION "Map Scripts 12", ROMX, BANK[MAP_SCRIPTS_12]

INCLUDE "maps/olivinecity/OlivinePokeCenter1F.asm"
INCLUDE "maps/olivinecity/OlivineGym.asm"
INCLUDE "maps/olivinecity/OlivineTimsHouse.asm"
INCLUDE "maps/olivinecity/unused/OlivineHouseBeta.asm"
INCLUDE "maps/olivinecity/OlivinePunishmentSpeechHouse.asm"
INCLUDE "maps/olivinecity/OlivineGoodRodHouse.asm"
INCLUDE "maps/olivinecity/OlivineCafe.asm"
INCLUDE "maps/olivinecity/OlivineMart.asm"
INCLUDE "maps/gates/Route38EcruteakGate.asm"
INCLUDE "maps/johtoroutes/route39/Route39Barn.asm"
INCLUDE "maps/johtoroutes/route39/Route39Farmhouse.asm"
INCLUDE "maps/cianwoodcity/ManiasHouse.asm"
INCLUDE "maps/cianwoodcity/CianwoodGym.asm"
INCLUDE "maps/cianwoodcity/CianwoodPokeCenter1F.asm"
INCLUDE "maps/cianwoodcity/CianwoodPharmacy.asm"
INCLUDE "maps/cianwoodcity/CianwoodCityPhotoStudio.asm"
INCLUDE "maps/cianwoodcity/CianwoodLugiaSpeechHouse.asm"
INCLUDE "maps/cianwoodcity/PokeSeersHouse.asm"
INCLUDE "maps/battletower/BattleTower1F.asm"
INCLUDE "maps/battletower/BattleTowerBattleRoom.asm"
INCLUDE "maps/battletower/BattleTowerElevator.asm"
INCLUDE "maps/battletower/BattleTowerHallway.asm"
INCLUDE "maps/gates/Route40BattleTowerGate.asm"
INCLUDE "maps/battletower/BattleTowerOutside.asm"


SECTION "Map Scripts 13", ROMX, BANK[MAP_SCRIPTS_13]

INCLUDE "maps/indigoplateau/IndigoPlateauPokeCenter1F.asm"
INCLUDE "maps/indigoplateau/WillsRoom.asm"
INCLUDE "maps/indigoplateau/KogasRoom.asm"
INCLUDE "maps/indigoplateau/BrunosRoom.asm"
INCLUDE "maps/indigoplateau/KarensRoom.asm"
INCLUDE "maps/indigoplateau/LancesRoom.asm"
INCLUDE "maps/indigoplateau/HallOfFame.asm"


SECTION "Map Scripts 14", ROMX, BANK[MAP_SCRIPTS_14]

INCLUDE "maps/ceruleancity/CeruleanCity.asm"
INCLUDE "maps/violetcity/sprouttower/SproutTower1F.asm"
INCLUDE "maps/violetcity/sprouttower/SproutTower2F.asm"
INCLUDE "maps/violetcity/sprouttower/SproutTower3F.asm"
INCLUDE "maps/ecruteakcity/tintower/TinTower1F.asm"
INCLUDE "maps/ecruteakcity/tintower/TinTower2F.asm"
INCLUDE "maps/ecruteakcity/tintower/TinTower3F.asm"
INCLUDE "maps/ecruteakcity/tintower/TinTower4F.asm"
INCLUDE "maps/ecruteakcity/tintower/TinTower5F.asm"
INCLUDE "maps/ecruteakcity/tintower/TinTower6F.asm"
INCLUDE "maps/ecruteakcity/tintower/TinTower7F.asm"
INCLUDE "maps/ecruteakcity/tintower/TinTower8F.asm"
INCLUDE "maps/ecruteakcity/tintower/TinTower9F.asm"
INCLUDE "maps/ecruteakcity/BurnedTower1F.asm"
INCLUDE "maps/ecruteakcity/BurnedTowerB1F.asm"


SECTION "Map Scripts 15", ROMX, BANK[MAP_SCRIPTS_15]

INCLUDE "maps/ceruleancity/CeruleanGymBadgeSpeechHouse.asm"
INCLUDE "maps/ceruleancity/CeruleanPoliceStation.asm"
INCLUDE "maps/ceruleancity/CeruleanTradeSpeechHouse.asm"
INCLUDE "maps/ceruleancity/CeruleanPokeCenter1F.asm"
INCLUDE "maps/ceruleancity/unused/CeruleanPokeCenter2FBeta.asm"
INCLUDE "maps/ceruleancity/CeruleanGym.asm"
INCLUDE "maps/ceruleancity/CeruleanMart.asm"
INCLUDE "maps/kantoroutes/route10/Route10PokeCenter1F.asm"
INCLUDE "maps/kantoroutes/route10/unused/Route10PokeCenter2FBeta.asm"
INCLUDE "maps/kantoroutes/route10/PowerPlant.asm"
INCLUDE "maps/kantoroutes/route25/BillsHouse.asm"
INCLUDE "maps/saffroncity/FightingDojo.asm"
INCLUDE "maps/saffroncity/SaffronGym.asm"
INCLUDE "maps/saffroncity/SaffronMart.asm"
INCLUDE "maps/saffroncity/SaffronPokeCenter1F.asm"
INCLUDE "maps/saffroncity/unused/SaffronPokeCenter2FBeta.asm"
INCLUDE "maps/saffroncity/MrPsychicsHouse.asm"
INCLUDE "maps/saffroncity/SaffronTrainStation.asm"
INCLUDE "maps/saffroncity/SilphCo1F.asm"
INCLUDE "maps/saffroncity/CopycatsHouse1F.asm"
INCLUDE "maps/saffroncity/CopycatsHouse2F.asm"
INCLUDE "maps/kantoroutes/underground/Route5UndergroundPathEntrance.asm"
INCLUDE "maps/gates/Route5SaffronCityGate.asm"
INCLUDE "maps/kantoroutes/route5/Route5CleanseTagSpeechHouse.asm"


SECTION "Map Scripts 16", ROMX, BANK[MAP_SCRIPTS_16]

INCLUDE "maps/pewtercity/PewterCity.asm"
INCLUDE "maps/whirlislands/WhirlIslandNW.asm"
INCLUDE "maps/whirlislands/WhirlIslandNE.asm"
INCLUDE "maps/whirlislands/WhirlIslandSW.asm"
INCLUDE "maps/whirlislands/WhirlIslandCave.asm"
INCLUDE "maps/whirlislands/WhirlIslandSE.asm"
INCLUDE "maps/whirlislands/WhirlIslandB1F.asm"
INCLUDE "maps/whirlislands/WhirlIslandB2F.asm"
INCLUDE "maps/whirlislands/WhirlIslandLugiaChamber.asm"
INCLUDE "maps/caves/mtsilver/SilverCaveRoom1.asm"
INCLUDE "maps/caves/mtsilver/SilverCaveRoom2.asm"
INCLUDE "maps/caves/mtsilver/SilverCaveRoom3.asm"
INCLUDE "maps/caves/mtsilver/SilverCaveItemRooms.asm"
INCLUDE "maps/caves/darkcave/DarkCaveVioletEntrance.asm"
INCLUDE "maps/caves/darkcave/DarkCaveBlackthornEntrance.asm"
INCLUDE "maps/blackthorncity/dragonsden/DragonsDen1F.asm"
INCLUDE "maps/blackthorncity/dragonsden/DragonsDenB1F.asm"
INCLUDE "maps/blackthorncity/dragonsden/DragonShrine.asm"
INCLUDE "maps/kantoroutes/route27/TohjoFalls.asm"
INCLUDE "maps/azaleatown/AzaleaPokeCenter1F.asm"
INCLUDE "maps/azaleatown/CharcoalKiln.asm"
INCLUDE "maps/azaleatown/AzaleaMart.asm"
INCLUDE "maps/azaleatown/KurtsHouse.asm"
INCLUDE "maps/azaleatown/AzaleaGym.asm"


SECTION "Map Scripts 17", ROMX, BANK[MAP_SCRIPTS_17]

INCLUDE "maps/mahoganytown/MahoganyTown.asm"
INCLUDE "maps/johtoroutes/route32/Route32.asm"
INCLUDE "maps/vermilioncity/VermilionHouseFishingSpeechHouse.asm"
INCLUDE "maps/vermilioncity/VermilionPokeCenter1F.asm"
INCLUDE "maps/vermilioncity/unused/VermilionPokeCenter2FBeta.asm"
INCLUDE "maps/saffroncity/PokemonFanClub.asm"
INCLUDE "maps/vermilioncity/VermilionMagnetTrainSpeechHouse.asm"
INCLUDE "maps/vermilioncity/VermilionMart.asm"
INCLUDE "maps/vermilioncity/VermilionHouseDiglettsCaveSpeechHouse.asm"
INCLUDE "maps/vermilioncity/VermilionGym.asm"
INCLUDE "maps/gates/Route6SaffronGate.asm"
INCLUDE "maps/kantoroutes/underground/Route6UndergroundPathEntrance.asm"
INCLUDE "maps/shared/PokeCenter2F.asm"
INCLUDE "maps/shared/TradeCenter.asm"
INCLUDE "maps/shared/Colosseum.asm"
INCLUDE "maps/shared/TimeCapsule.asm"
INCLUDE "maps/mobile/MobileTradeRoomMobile.asm"
INCLUDE "maps/mobile/MobileBattleRoom.asm"


SECTION "Map Scripts 18", ROMX, BANK[MAP_SCRIPTS_18]

INCLUDE "maps/johtoroutes/route36/Route36.asm"
INCLUDE "maps/fuchsiacity/FuchsiaCity.asm"
INCLUDE "maps/blackthorncity/BlackthornGym1F.asm"
INCLUDE "maps/blackthorncity/BlackthornGym2F.asm"
INCLUDE "maps/blackthorncity/BlackthornDragonSpeechHouse.asm"
INCLUDE "maps/blackthorncity/BlackthornEmysHouse.asm"
INCLUDE "maps/blackthorncity/BlackthornMart.asm"
INCLUDE "maps/blackthorncity/BlackthornPokeCenter1F.asm"
INCLUDE "maps/blackthorncity/MoveDeletersHouse.asm"
INCLUDE "maps/fuchsiacity/FuchsiaMart.asm"
INCLUDE "maps/safarizone/SafariZoneMainOffice.asm"
INCLUDE "maps/fuchsiacity/FuchsiaGym.asm"
INCLUDE "maps/fuchsiacity/FuchsiaBillSpeechHouse.asm"
INCLUDE "maps/fuchsiacity/FuchsiaPokeCenter1F.asm"
INCLUDE "maps/fuchsiacity/unused/FuchsiaPokeCenter2FBeta.asm"
INCLUDE "maps/safarizone/SafariZoneWardensHome.asm"
INCLUDE "maps/gates/Route15FuchsiaGate.asm"
INCLUDE "maps/cherrygrovecity/CherrygroveMart.asm"
INCLUDE "maps/cherrygrovecity/CherrygrovePokeCenter1F.asm"
INCLUDE "maps/cherrygrovecity/CherrygroveGymSpeechHouse.asm"
INCLUDE "maps/cherrygrovecity/GuideGentsHouse.asm"
INCLUDE "maps/cherrygrovecity/CherrygroveEvolutionSpeechHouse.asm"
INCLUDE "maps/johtoroutes/route30/Route30BerrySpeechHouse.asm"
INCLUDE "maps/johtoroutes/route30/MrPokemonsHouse.asm"
INCLUDE "maps/gates/Route31VioletGate.asm"


SECTION "Map Scripts 19", ROMX, BANK[MAP_SCRIPTS_19]

INCLUDE "maps/azaleatown/AzaleaTown.asm"
INCLUDE "maps/goldenrodcity/GoldenrodCity.asm"
INCLUDE "maps/saffroncity/SaffronCity.asm"
INCLUDE "maps/mahoganytown/MahoganyRedGyaradosSpeechHouse.asm"
INCLUDE "maps/mahoganytown/MahoganyGym.asm"
INCLUDE "maps/mahoganytown/MahoganyPokeCenter1F.asm"
INCLUDE "maps/gates/Route42EcruteakGate.asm"
INCLUDE "maps/lakeofrage/LakeofRageHiddenPowerHouse.asm"
INCLUDE "maps/lakeofrage/LakeofRageMagikarpHouse.asm"
INCLUDE "maps/gates/Route43MahoganyGate.asm"
INCLUDE "maps/gates/Route43Gate.asm"
INCLUDE "maps/pallettown/RedsHouse1F.asm"
INCLUDE "maps/pallettown/RedsHouse2F.asm"
INCLUDE "maps/pallettown/BluesHouse.asm"
INCLUDE "maps/pallettown/OaksLab.asm"


SECTION "Map Scripts 20", ROMX, BANK[MAP_SCRIPTS_20]

INCLUDE "maps/cherrygrovecity/CherrygroveCity.asm"
INCLUDE "maps/johtoroutes/route35/Route35.asm"
INCLUDE "maps/johtoroutes/route43/Route43.asm"
INCLUDE "maps/johtoroutes/route44/Route44.asm"
INCLUDE "maps/johtoroutes/route45/Route45.asm"
INCLUDE "maps/kantoroutes/route19/Route19.asm"
INCLUDE "maps/kantoroutes/route25/Route25.asm"


SECTION "Map Scripts 21", ROMX, BANK[MAP_SCRIPTS_21]

INCLUDE "maps/cianwoodcity/CianwoodCity.asm"
INCLUDE "maps/kantoroutes/route27/Route27.asm"
INCLUDE "maps/johtoroutes/route29/Route29.asm"
INCLUDE "maps/johtoroutes/route30/Route30.asm"
INCLUDE "maps/johtoroutes/route38/Route38.asm"
INCLUDE "maps/kantoroutes/route13/Route13.asm"
INCLUDE "maps/pewtercity/PewterNidoranSpeechHouse.asm"
INCLUDE "maps/pewtercity/PewterGym.asm"
INCLUDE "maps/pewtercity/PewterMart.asm"
INCLUDE "maps/pewtercity/PewterPokeCenter1F.asm"
INCLUDE "maps/pewtercity/unused/PewterPokeCEnter2FBeta.asm"
INCLUDE "maps/pewtercity/PewterSnoozeSpeechHouse.asm"


SECTION "Map Scripts 22", ROMX, BANK[MAP_SCRIPTS_22]

INCLUDE "maps/ecruteakcity/EcruteakCity.asm"
INCLUDE "maps/blackthorncity/BlackthornCity.asm"
INCLUDE "maps/kantoroutes/route26/Route26.asm"
INCLUDE "maps/kantoroutes/route28/Route28.asm"
INCLUDE "maps/johtoroutes/route31/Route31.asm"
INCLUDE "maps/johtoroutes/route39/Route39.asm"
INCLUDE "maps/johtoroutes/route40/Route40.asm"
INCLUDE "maps/johtoroutes/route41/Route41.asm"
INCLUDE "maps/kantoroutes/route12/Route12.asm"


SECTION "Map Scripts 23", ROMX, BANK[MAP_SCRIPTS_23]

INCLUDE "maps/newbarktown/NewBarkTown.asm"
INCLUDE "maps/violetcity/VioletCity.asm"
INCLUDE "maps/olivinecity/OlivineCity.asm"
INCLUDE "maps/johtoroutes/route37/Route37.asm"
INCLUDE "maps/johtoroutes/route42/Route42.asm"
INCLUDE "maps/johtoroutes/route46/Route46.asm"
INCLUDE "maps/viridiancity/ViridianCity.asm"
INCLUDE "maps/celadoncity/CeladonCity.asm"
INCLUDE "maps/kantoroutes/route15/Route15.asm"
INCLUDE "maps/vermilioncity/VermilionCity.asm"
INCLUDE "maps/kantoroutes/route9/Route9.asm"
INCLUDE "maps/cinnabarisland/CinnabarPokeCenter1F.asm"
INCLUDE "maps/cinnabarisland/unused/CinnabarPokeCenter2FBeta.asm"
INCLUDE "maps/gates/Route19FuchsiaGate.asm"
INCLUDE "maps/seafoamislands/SeafoamGym.asm"


SECTION "Map Scripts 24", ROMX, BANK[MAP_SCRIPTS_24]

INCLUDE "maps/johtoroutes/route33/Route33.asm"
INCLUDE "maps/kantoroutes/route2/Route2.asm"
INCLUDE "maps/kantoroutes/route1/Route1.asm"
INCLUDE "maps/pallettown/PalletTown.asm"
INCLUDE "maps/kantoroutes/route21/Route21.asm"
INCLUDE "maps/cinnabarisland/CinnabarIsland.asm"
INCLUDE "maps/kantoroutes/route20/Route20.asm"
INCLUDE "maps/kantoroutes/route18/Route18.asm"
INCLUDE "maps/kantoroutes/route17/Route17.asm"
INCLUDE "maps/kantoroutes/route16/Route16.asm"
INCLUDE "maps/kantoroutes/route7/Route7.asm"
INCLUDE "maps/kantoroutes/route14/Route14.asm"
INCLUDE "maps/lavendertown/LavenderTown.asm"
INCLUDE "maps/kantoroutes/route6/Route6.asm"
INCLUDE "maps/kantoroutes/route5/Route5.asm"
INCLUDE "maps/kantoroutes/route24/Route24.asm"
INCLUDE "maps/kantoroutes/route3/Route3.asm"
INCLUDE "maps/kantoroutes/route4/Route4.asm"
INCLUDE "maps/kantoroutes/route10/Route10South.asm"
INCLUDE "maps/kantoroutes/route23/Route23.asm"
INCLUDE "maps/caves/mtsilver/SilverCavePokeCenter1F.asm"
INCLUDE "maps/kantoroutes/route28/Route28FamousSpeechHouse.asm"


SECTION "Map Scripts 25", ROMX, BANK[MAP_SCRIPTS_25]

INCLUDE "maps/caves/mtsilver/SilverCaveOutside.asm"
INCLUDE "maps/kantoroutes/route10/Route10North.asm"
