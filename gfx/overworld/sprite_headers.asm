; Format:
;	Address
;	Length, Bank
;	Type, Palette

ChrisSprite: ; 14736
	dw ChrisSpriteGFX
	db $3 * $40, BANK(ChrisSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 1473c

ChrisBikeSprite: ; 1473c
	dw ChrisBikeSpriteGFX
	db $3 * $40, BANK(ChrisBikeSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 14742

GameboyKidSprite: ; 14742
	dw GameboyKidSpriteGFX
	db $3 * $40, BANK(GameboyKidSpriteGFX)
	db STANDING_SPRITE, PAL_OW_GREEN
; 14748

SilverSprite: ; 14748
	dw SilverSpriteGFX
	db $3 * $40, BANK(SilverSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 1474e

OakSprite: ; 1474e
	dw OakSpriteGFX
	db $3 * $40, BANK(OakSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 14754

RedSprite: ; 14754
	dw RedSpriteGFX
	db $3 * $40, BANK(RedSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 1475a

BlueSprite: ; 1475a
	dw BlueSpriteGFX
	db $3 * $40, BANK(BlueSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 14760

BillSprite: ; 14760
	dw BillSpriteGFX
	db $3 * $40, BANK(BillSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 14766

ElderSprite: ; 14766
	dw ElderSpriteGFX
	db $3 * $40, BANK(ElderSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 1476c

JanineSprite: ; 1476c
	dw JanineSpriteGFX
	db $3 * $40, BANK(JanineSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 14772

KurtSprite: ; 14772
	dw KurtSpriteGFX
	db $3 * $40, BANK(KurtSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 14778

MomSprite: ; 14778
	dw MomSpriteGFX
	db $3 * $40, BANK(MomSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 1477e

BlaineSprite: ; 1477e
	dw BlaineSpriteGFX
	db $3 * $40, BANK(BlaineSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 14784

RedsMomSprite: ; 14784
	dw RedsMomSpriteGFX
	db $3 * $40, BANK(RedsMomSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 1478a

DaisySprite: ; 1478a
	dw DaisySpriteGFX
	db $3 * $40, BANK(DaisySpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14790

ElmSprite: ; 14790
	dw ElmSpriteGFX
	db $3 * $40, BANK(ElmSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 14796

WillSprite: ; 14796
	dw WillSpriteGFX
	db $3 * $40, BANK(WillSpriteGFX)
	db STANDING_SPRITE, PAL_OW_RED
; 1479c

FalknerSprite: ; 1479c
	dw FalknerSpriteGFX
	db $3 * $40, BANK(FalknerSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 147a2

WhitneySprite: ; 147a2
	dw WhitneySpriteGFX
	db $3 * $40, BANK(WhitneySpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 147a8

BugsySprite: ; 147a8
	dw BugsySpriteGFX
	db $3 * $40, BANK(BugsySpriteGFX)
	db WALKING_SPRITE, PAL_OW_GREEN
; 147ae

MortySprite: ; 147ae
	dw MortySpriteGFX
	db $3 * $40, BANK(MortySpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 147b4

ChuckSprite: ; 147b4
	dw ChuckSpriteGFX
	db $3 * $40, BANK(ChuckSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 147ba

JasmineSprite: ; 147ba
	dw JasmineSpriteGFX
	db $3 * $40, BANK(JasmineSpriteGFX)
	db WALKING_SPRITE, PAL_OW_GREEN
; 147c0

PryceSprite: ; 147c0
	dw PryceSpriteGFX
	db $3 * $40, BANK(PryceSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 147c6

ClairSprite: ; 147c6
	dw ClairSpriteGFX
	db $3 * $40, BANK(ClairSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 147cc

BrockSprite: ; 147cc
	dw BrockSpriteGFX
	db $3 * $40, BANK(BrockSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 147d2

KarenSprite: ; 147d2
	dw KarenSpriteGFX
	db $3 * $40, BANK(KarenSpriteGFX)
	db STANDING_SPRITE, PAL_OW_BLUE
; 147d8

BrunoSprite: ; 147d8
	dw BrunoSpriteGFX
	db $3 * $40, BANK(BrunoSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 147de

MistySprite: ; 147de
	dw MistySpriteGFX
	db $3 * $40, BANK(MistySpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 147e4

LanceSprite: ; 147e4
	dw LanceSpriteGFX
	db $3 * $40, BANK(LanceSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 147ea

SurgeSprite: ; 147ea
	dw SurgeSpriteGFX
	db $3 * $40, BANK(SurgeSpriteGFX)
	db WALKING_SPRITE, PAL_OW_GREEN
; 147f0

ErikaSprite: ; 147f0
	dw ErikaSpriteGFX
	db $3 * $40, BANK(ErikaSpriteGFX)
	db WALKING_SPRITE, PAL_OW_GREEN
; 147f6

KogaSprite: ; 147f6
	dw KogaSpriteGFX
	db $3 * $40, BANK(KogaSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 147fc

SabrinaSprite: ; 147fc
	dw SabrinaSpriteGFX
	db $3 * $40, BANK(SabrinaSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 14802

CooltrainerMSprite: ; 14802
	dw CooltrainerMSpriteGFX
	db $3 * $40, BANK(CooltrainerMSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14808

CooltrainerFSprite: ; 14808
	dw CooltrainerFSpriteGFX
	db $3 * $40, BANK(CooltrainerFSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 1480e

BugCatcherSprite: ; 1480e
	dw BugCatcherSpriteGFX
	db $3 * $40, BANK(BugCatcherSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14814

TwinSprite: ; 14814
	dw TwinSpriteGFX
	db $3 * $40, BANK(TwinSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 1481a

YoungsterSprite: ; 1481a
	dw YoungsterSpriteGFX
	db $3 * $40, BANK(YoungsterSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14820

LassSprite: ; 14820
	dw LassSpriteGFX
	db $3 * $40, BANK(LassSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 14826

TeacherSprite: ; 14826
	dw TeacherSpriteGFX
	db $3 * $40, BANK(TeacherSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 1482c

BuenaSprite: ; 1482c
	dw BuenaSpriteGFX
	db $3 * $40, BANK(BuenaSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14832

SuperNerdSprite: ; 14832
	dw SuperNerdSpriteGFX
	db $3 * $40, BANK(SuperNerdSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14838

RockerSprite: ; 14838
	dw RockerSpriteGFX
	db $3 * $40, BANK(RockerSpriteGFX)
	db WALKING_SPRITE, PAL_OW_GREEN
; 1483e

PokefanMSprite: ; 1483e
	dw PokefanMSpriteGFX
	db $3 * $40, BANK(PokefanMSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 14844

PokefanFSprite: ; 14844
	dw PokefanFSpriteGFX
	db $3 * $40, BANK(PokefanFSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 1484a

GrampsSprite: ; 1484a
	dw GrampsSpriteGFX
	db $3 * $40, BANK(GrampsSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 14850

GrannySprite: ; 14850
	dw GrannySpriteGFX
	db $3 * $40, BANK(GrannySpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 14856

SwimmerGuySprite: ; 14856
	dw SwimmerGuySpriteGFX
	db $3 * $40, BANK(SwimmerGuySpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 1485c

SwimmerGirlSprite: ; 1485c
	dw SwimmerGirlSpriteGFX
	db $3 * $40, BANK(SwimmerGirlSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14862

BigSnorlaxSprite: ; 14862
	dw BigSnorlaxSpriteGFX
	db $3 * $40, BANK(BigSnorlaxSpriteGFX)
	db STANDING_SPRITE, PAL_OW_BLUE
; 14868

SurfingPikachuSprite: ; 14868
	dw SurfingPikachuSpriteGFX
	db $3 * $40, BANK(SurfingPikachuSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 1486e

RocketSprite: ; 1486e
	dw RocketSpriteGFX
	db $3 * $40, BANK(RocketSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 14874

RocketGirlSprite: ; 14874
	dw RocketGirlSpriteGFX
	db $3 * $40, BANK(RocketGirlSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 1487a

NurseSprite: ; 1487a
	dw NurseSpriteGFX
	db $3 * $40, BANK(NurseSpriteGFX)
	db STANDING_SPRITE, PAL_OW_RED
; 14880

LinkReceptionistSprite: ; 14880
	dw LinkReceptionistSpriteGFX
	db $3 * $40, BANK(LinkReceptionistSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 14886

ClerkSprite: ; 14886
	dw ClerkSpriteGFX
	db $3 * $40, BANK(ClerkSpriteGFX)
	db WALKING_SPRITE, PAL_OW_GREEN
; 1488c

FisherSprite: ; 1488c
	dw FisherSpriteGFX
	db $3 * $40, BANK(FisherSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14892

FishingGuruSprite: ; 14892
	dw FishingGuruSpriteGFX
	db $3 * $40, BANK(FishingGuruSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14898

ScientistSprite: ; 14898
	dw ScientistSpriteGFX
	db $3 * $40, BANK(ScientistSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 1489e

KimonoGirlSprite: ; 1489e
	dw KimonoGirlSpriteGFX
	db $3 * $40, BANK(KimonoGirlSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 148a4

SageSprite: ; 148a4
	dw SageSpriteGFX
	db $3 * $40, BANK(SageSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 148aa

UnusedGuySprite: ; 148aa
	dw UnusedGuySpriteGFX
	db $3 * $40, BANK(UnusedGuySpriteGFX)
	db STANDING_SPRITE, PAL_OW_RED
; 148b0

GentlemanSprite: ; 148b0
	dw GentlemanSpriteGFX
	db $3 * $40, BANK(GentlemanSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 148b6

BlackBeltSprite: ; 148b6
	dw BlackBeltSpriteGFX
	db $3 * $40, BANK(BlackBeltSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 148bc

ReceptionistSprite: ; 148bc
	dw ReceptionistSpriteGFX
	db $3 * $40, BANK(ReceptionistSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 148c2

OfficerSprite: ; 148c2
	dw OfficerSpriteGFX
	db $3 * $40, BANK(OfficerSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 148c8

CalSprite: ; 148c8
	dw CalSpriteGFX
	db $3 * $40, BANK(CalSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 148ce

SlowpokeSprite: ; 148ce
	dw SlowpokeSpriteGFX
	db $1 * $40, BANK(SlowpokeSpriteGFX)
	db STILL_SPRITE, PAL_OW_RED
; 148d4

CaptainSprite: ; 148d4
	dw CaptainSpriteGFX
	db $3 * $40, BANK(CaptainSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 148da

BigLaprasSprite: ; 148da
	dw BigLaprasSpriteGFX
	db $3 * $40, BANK(BigLaprasSpriteGFX)
	db STANDING_SPRITE, PAL_OW_BLUE
; 148e0

GymGuySprite: ; 148e0
	dw GymGuySpriteGFX
	db $3 * $40, BANK(GymGuySpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 148e6

SailorSprite: ; 148e6
	dw SailorSpriteGFX
	db $3 * $40, BANK(SailorSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 148ec

BikerSprite: ; 148ec
	dw BikerSpriteGFX
	db $3 * $40, BANK(BikerSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BROWN
; 148f2

PharmacistSprite: ; 148f2
	dw PharmacistSpriteGFX
	db $3 * $40, BANK(PharmacistSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 148f8

MonsterSprite: ; 148f8
	dw MonsterSpriteGFX
	db $3 * $40, BANK(MonsterSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 148fe

FairySprite: ; 148fe
	dw FairySpriteGFX
	db $3 * $40, BANK(FairySpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 14904

BirdSprite: ; 14904
	dw BirdSpriteGFX
	db $3 * $40, BANK(BirdSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 1490a

DragonSprite: ; 1490a
	dw DragonSpriteGFX
	db $3 * $40, BANK(DragonSpriteGFX)
	db WALKING_SPRITE, PAL_OW_RED
; 14910

BigOnixSprite: ; 14910
	dw BigOnixSpriteGFX
	db $3 * $40, BANK(BigOnixSpriteGFX)
	db STANDING_SPRITE, PAL_OW_BROWN
; 14916

N64Sprite: ; 14916
	dw N64SpriteGFX
	db $1 * $40, BANK(N64SpriteGFX)
	db STILL_SPRITE, PAL_OW_BROWN
; 1491c

SudowoodoSprite: ; 1491c
	dw SudowoodoSpriteGFX
	db $3 * $40, BANK(SudowoodoSpriteGFX)
	db STANDING_SPRITE, PAL_OW_GREEN
; 14922

SurfSprite: ; 14922
	dw SurfSpriteGFX
	db $3 * $40, BANK(SurfSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14928

PokeBallSprite: ; 14928
	dw PokeBallSpriteGFX
	db $1 * $40, BANK(PokeBallSpriteGFX)
	db STILL_SPRITE, PAL_OW_RED
; 1492e

PokedexSprite: ; 1492e
	dw PokedexSpriteGFX
	db $1 * $40, BANK(PokedexSpriteGFX)
	db STILL_SPRITE, PAL_OW_BROWN
; 14934

PaperSprite: ; 14934
	dw PaperSpriteGFX
	db $1 * $40, BANK(PaperSpriteGFX)
	db STILL_SPRITE, PAL_OW_BLUE
; 1493a

VirtualBoySprite: ; 1493a
	dw VirtualBoySpriteGFX
	db $1 * $40, BANK(VirtualBoySpriteGFX)
	db STILL_SPRITE, PAL_OW_RED
; 14940

OldLinkReceptionistSprite: ; 14940
	dw OldLinkReceptionistSpriteGFX
	db $3 * $40, BANK(OldLinkReceptionistSpriteGFX)
	db STANDING_SPRITE, PAL_OW_RED
; 14946

RockSprite: ; 14946
	dw RockSpriteGFX
	db $1 * $40, BANK(RockSpriteGFX)
	db STILL_SPRITE, PAL_OW_ROCK
; 1494c

BoulderSprite: ; 1494c
	dw BoulderSpriteGFX
	db $1 * $40, BANK(BoulderSpriteGFX)
	db STILL_SPRITE, PAL_OW_ROCK
; 14952

SnesSprite: ; 14952
	dw SnesSpriteGFX
	db $1 * $40, BANK(SnesSpriteGFX)
	db STILL_SPRITE, PAL_OW_BLUE
; 14958

FamicomSprite: ; 14958
	dw FamicomSpriteGFX
	db $1 * $40, BANK(FamicomSpriteGFX)
	db STILL_SPRITE, PAL_OW_RED
; 1495e

FruitTreeSprite: ; 1495e
	dw FruitTreeSpriteGFX
	db $1 * $40, BANK(FruitTreeSpriteGFX)
	db STILL_SPRITE, PAL_OW_TREE
; 14964

GoldTrophySprite: ; 14964
	dw GoldTrophySpriteGFX
	db $1 * $40, BANK(GoldTrophySpriteGFX)
	db STILL_SPRITE, PAL_OW_BROWN
; 1496a

SilverTrophySprite: ; 1496a
	dw SilverTrophySpriteGFX
	db $1 * $40, BANK(SilverTrophySpriteGFX)
	db STILL_SPRITE, PAL_OW_SILVER
; 14970

KrisSprite: ; 14970
	dw KrisSpriteGFX
	db $3 * $40, BANK(KrisSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 14976

KrisBikeSprite: ; 14976
	dw KrisBikeSpriteGFX
	db $3 * $40, BANK(KrisBikeSpriteGFX)
	db WALKING_SPRITE, PAL_OW_BLUE
; 1497c

KurtOutsideSprite: ; 1497c
	dw KurtOutsideSpriteGFX
	db $3 * $40, BANK(KurtOutsideSpriteGFX)
	db STANDING_SPRITE, PAL_OW_BROWN
; 14982

SuicuneSprite: ; 14982
	dw SuicuneSpriteGFX
	db $1 * $40, BANK(SuicuneSpriteGFX)
	db STILL_SPRITE, PAL_OW_BLUE
; 14988

EnteiSprite: ; 14988
	dw EnteiSpriteGFX
	db $1 * $40, BANK(EnteiSpriteGFX)
	db STILL_SPRITE, PAL_OW_RED
; 1498e

RaikouSprite: ; 1498e
	dw RaikouSpriteGFX
	db $1 * $40, BANK(RaikouSpriteGFX)
	db STILL_SPRITE, PAL_OW_RED
; 14994

StandingYoungsterSprite: ; 14994
	dw StandingYoungsterSpriteGFX
	db $3 * $40, BANK(StandingYoungsterSpriteGFX)
	db STANDING_SPRITE, PAL_OW_BLUE
; 1499a
