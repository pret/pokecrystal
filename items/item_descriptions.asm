GetItemDescription: ; 0x1c8955
	ld a, [$cf60]
	cp TM_01
	jr c, .nomovedesc ; if not a TM, use a predefined string
	ld [$d106], a
	push de
	callba Function2c7b6
	pop hl
	ld a, [$d265]
	ld [$cf60], a
	ld a, $11
	call Predef
	ret

.nomovedesc
	push de
	ld hl, ItemDescriptions
	ld a, [$cf60]
	dec a
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	jp PlaceString
; 0x1c8987


ItemDescriptions:
	dw MasterBallDesc
	dw UltraBallDesc
	dw BrightpowderDesc
	dw GreatBallDesc
	dw PokeBallDesc
	dw TeruSama1Desc
	dw BicycleDesc
	dw MoonStoneDesc
	dw AntidoteDesc
	dw BurnHealDesc
	dw IceHealDesc
	dw AwakeningDesc
	dw ParlyzHealDesc
	dw FullRestoreDesc
	dw MaxPotionDesc
	dw HyperPotionDesc
	dw SuperPotionDesc
	dw PotionDesc
	dw EscapeRopeDesc
	dw RepelDesc
	dw MaxElixerDesc
	dw FireStoneDesc
	dw ThunderStoneDesc
	dw WaterStoneDesc
	dw TeruSama2Desc
	dw HPUpDesc
	dw ProteinDesc
	dw IronDesc
	dw CarbosDesc
	dw LuckyPunchDesc
	dw CalciumDesc
	dw RareCandyDesc
	dw XAccuracyDesc
	dw LeafStoneDesc
	dw MetalPowderDesc
	dw NuggetDesc
	dw PokeDollDesc
	dw FullHealDesc
	dw ReviveDesc
	dw MaxReviveDesc
	dw GuardSpecDesc
	dw SuperRepelDesc
	dw MaxRepelDesc
	dw DireHitDesc
	dw TeruSama3Desc
	dw FreshWaterDesc
	dw SodaPopDesc
	dw LemonadeDesc
	dw XAttackDesc
	dw TeruSama4Desc
	dw XDefendDesc
	dw XSpeedDesc
	dw XSpecialDesc
	dw CoinCaseDesc
	dw ItemfinderDesc
	dw TeruSama5Desc
	dw ExpShareDesc
	dw OldRodDesc
	dw GoodRodDesc
	dw SilverLeafDesc
	dw SuperRodDesc
	dw PPUpDesc
	dw EtherDesc
	dw MaxEtherDesc
	dw ElixerDesc
	dw RedScaleDesc
	dw SecretPotionDesc
	dw SSTicketDesc
	dw MysteryEggDesc
	dw ClearBellDesc
	dw SilverWingDesc
	dw MoomooMilkDesc
	dw QuickClawDesc
	dw PsnCureBerryDesc
	dw GoldLeafDesc
	dw SoftSandDesc
	dw SharpBeakDesc
	dw PrzCureBerryDesc
	dw BurntBerryDesc
	dw IceBerryDesc
	dw PoisonBarbDesc
	dw KingsRockDesc
	dw BitterBerryDesc
	dw MintBerryDesc
	dw RedApricornDesc
	dw TinyMushroomDesc
	dw BigMushroomDesc
	dw SilverPowderDesc
	dw BluApricornDesc
	dw TeruSama6Desc
	dw AmuletCoinDesc
	dw YlwApricornDesc
	dw GrnApricornDesc
	dw CleanseTagDesc
	dw MysticWaterDesc
	dw TwistedSpoonDesc
	dw WhtApricornDesc
	dw BlackbeltDesc
	dw BlkApricornDesc
	dw TeruSama7Desc
	dw PnkApricornDesc
	dw BlackGlassesDesc
	dw SlowpokeTailDesc
	dw PinkBowDesc
	dw StickDesc
	dw SmokeBallDesc
	dw NeverMeltIceDesc
	dw MagnetDesc
	dw MiracleBerryDesc
	dw PearlDesc
	dw BigPearlDesc
	dw EverStoneDesc
	dw SpellTagDesc
	dw RageCandyBarDesc
	dw GSBallDesc
	dw BlueCardDesc
	dw MiracleSeedDesc
	dw ThickClubDesc
	dw FocusBandDesc
	dw TeruSama8Desc
	dw EnergyPowderDesc
	dw EnergyRootDesc
	dw HealPowderDesc
	dw RevivalHerbDesc
	dw HardStoneDesc
	dw LuckyEggDesc
	dw CardKeyDesc
	dw MachinePartDesc
	dw EggTicketDesc
	dw LostItemDesc
	dw StardustDesc
	dw StarPieceDesc
	dw BasementKeyDesc
	dw PassDesc
	dw TeruSama9Desc
	dw TeruSama10Desc
	dw TeruSama11Desc
	dw CharcoalDesc
	dw BerryJuiceDesc
	dw ScopeLensDesc
	dw TeruSama12Desc
	dw TeruSama13Desc
	dw MetalCoatDesc
	dw DragonFangDesc
	dw TeruSama14Desc
	dw LeftoversDesc
	dw TeruSama15Desc
	dw TeruSama16Desc
	dw TeruSama17Desc
	dw MysteryBerryDesc
	dw DragonScaleDesc
	dw BerserkGeneDesc
	dw TeruSama18Desc
	dw TeruSama19Desc
	dw TeruSama20Desc
	dw SacredAshDesc
	dw HeavyBallDesc
	dw FlowerMailDesc
	dw LevelBallDesc
	dw LureBallDesc
	dw FastBallDesc
	dw TeruSama21Desc
	dw LightBallDesc
	dw FriendBallDesc
	dw MoonBallDesc
	dw LoveBallDesc
	dw NormalBoxDesc
	dw GorgeousBoxDesc
	dw SunStoneDesc
	dw PolkadotBowDesc
	dw TeruSama22Desc
	dw UpGradeDesc
	dw BerryDesc
	dw GoldBerryDesc
	dw SquirtBottleDesc
	dw TeruSama23Desc
	dw ParkBallDesc
	dw RainbowWingDesc
	dw TeruSama24Desc
	dw BrickPieceDesc
	dw SurfMailDesc
	dw LiteBlueMailDesc
	dw PortraitMailDesc
	dw LovelyMailDesc
	dw EonMailDesc
	dw MorphMailDesc
	dw BlueSkyMailDesc
	dw MusicMailDesc
	dw MewMailDesc
	dw TeruSama25Desc
	dw TeruSama26Desc
	dw TeruSama26Desc
	dw TeruSama26Desc
	dw TeruSama26Desc
	dw TeruSama26Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama27Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama28Desc
	dw TeruSama29Desc
	dw TeruSama30Desc
	dw TeruSama31Desc
	dw TeruSama32Desc
	dw TeruSama33Desc

MasterBallDesc:
	db "The best BALL. It",$4E
	db "never misses.@"

UltraBallDesc:
	db "A BALL with a high",$4E
	db "rate of success.@"

BrightpowderDesc:
	db "Lowers the foe's",$4E
	db "accuracy. (HOLD)@"

GreatBallDesc:
	db "A BALL with a de-",$4E
	db "cent success rate.@"

PokeBallDesc:
	db "An item for catch-",$4E
	db "ing #MON.@"

TeruSama1Desc:
	db "?@"

BicycleDesc:
	db "A collapsible bike",$4E
	db "for fast movement.@"

MoonStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

AntidoteDesc:
	db "Cures poisoned",$4E
	db "#MON.@"

BurnHealDesc:
	db "Heals burned",$4E
	db "#MON.@"

IceHealDesc:
	db "Defrosts frozen",$4E
	db "#MON.@"

AwakeningDesc:
	db "Awakens sleeping",$4E
	db "#MON.@"

ParlyzHealDesc:
	db "Heals paralyzed",$4E
	db "#MON.@"

FullRestoreDesc:
	db "Fully restores HP",$4E
	db "& status.@"

MaxPotionDesc:
	db "Fully restores",$4E
	db "#MON HP.@"

HyperPotionDesc:
	db "Restores #MON",$4E
	db "HP by 200.@"

SuperPotionDesc:
	db "Restores #MON",$4E
	db "HP by 50.@"

PotionDesc:
	db "Restores #MON",$4E
	db "HP by 20.@"

EscapeRopeDesc:
	db "Use for escaping",$4E
	db "from caves, etc.@"

RepelDesc:
	db "Repels weak #-",$4E
	db "MON for 100 steps.@"

MaxElixerDesc:
	db "Fully restores the",$4E
	db "PP of one #MON.@"

FireStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

ThunderStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

WaterStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

TeruSama2Desc:
	db "?@"

HPUpDesc:
	db "Raises the HP of",$4E
	db "one #MON.@"

ProteinDesc:
	db "Raises ATTACK of",$4E
	db "one #MON.@"

IronDesc:
	db "Raises DEFENSE of",$4E
	db "one #MON.@"

CarbosDesc:
	db "Raises SPEED of",$4E
	db "one #MON.@"

LuckyPunchDesc:
	db "Ups critical hit",$4E
	db "ratio of CHANSEY.@"

CalciumDesc:
	db "Ups SPECIAL stats",$4E
	db "of one #MON.@"

RareCandyDesc:
	db "Raises level of a",$4E
	db "#MON by one.@"

XAccuracyDesc:
	db "Raises accuracy.",$4E
	db "(1 BTL)@"

LeafStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

MetalPowderDesc:
	db "Raises DEFENSE of",$4E
	db "DITTO. (HOLD)@"

NuggetDesc:
	db "Made of pure gold.",$4E
	db "Sell high.@"

PokeDollDesc:
	db "Use to escape from",$4E
	db "a wild #MON.@"

FullHealDesc:
	db "Eliminates all",$4E
	db "status problems.@"

ReviveDesc:
	db "Restores a fainted",$4E
	db "#MON to 1/2 HP.@"

MaxReviveDesc:
	db "Fully restores a",$4E
	db "fainted #MON.@"

GuardSpecDesc:
	db "Prevents stats",$4E
	db "reduction. (1 BTL)@"

SuperRepelDesc:
	db "Repels weak #-",$4E
	db "MON for 200 steps.@"

MaxRepelDesc:
	db "Repels weak #-",$4E
	db "MON for 250 steps.@"

DireHitDesc:
	db "Ups critical hit",$4E
	db "ratio. (1 BTL)@"

TeruSama3Desc:
	db "?@"

FreshWaterDesc:
	db "Restores #MON",$4E
	db "HP by 50.@"

SodaPopDesc:
	db "Restores #MON",$4E
	db "HP by 60.@"

LemonadeDesc:
	db "Restores #MON",$4E
	db "HP by 80.@"

XAttackDesc:
	db "Raises ATTACK.",$4E
	db "(1 BTL)@"

TeruSama4Desc:
	db "?@"

XDefendDesc:
	db "Raises DEFENSE.",$4E
	db "(1 BTL)@"

XSpeedDesc:
	db "Raises SPEED.",$4E
	db "(1 BTL)@"

XSpecialDesc:
	db "Raises SPECIAL",$4E
	db "ATTACK. (1 BTL)@"

CoinCaseDesc:
	db "Holds up to 9,999",$4E
	db "game coins.@"

ItemfinderDesc:
	db "Checks for unseen",$4E
	db "items in the area.@"

TeruSama5Desc:
	db "?@"

ExpShareDesc:
	db "Shares battle EXP.",$4E
	db "Points. (HOLD)@"

OldRodDesc:
	db "Use by water to",$4E
	db "fish for #MON.@"

GoodRodDesc:
	db "A good ROD for",$4E
	db "catching #MON.@"

SilverLeafDesc:
	db "A strange, silver-",$4E
	db "colored leaf.@"

SuperRodDesc:
	db "The best ROD for",$4E
	db "catching #MON.@"

PPUpDesc:
	db "Raises max PP of",$4E
	db "a selected move.@"

EtherDesc:
	db "Restores PP of one",$4E
	db "move by 10.@"

MaxEtherDesc:
	db "Fully restores PP",$4E
	db "of one move.@"

ElixerDesc:
	db "Restores PP of all",$4E
	db "moves by 10.@"

RedScaleDesc:
	db "A scale from the",$4E
	db "red GYARADOS.@"

SecretPotionDesc:
	db "Fully heals any",$4E
	db "#MON.@"

SSTicketDesc:
	db "A ticket for the",$4E
	db "S.S.AQUA.@"

MysteryEggDesc:
	db "An EGG obtained",$4E
	db "from MR.#MON.@"

ClearBellDesc:
	db "Makes a gentle",$4E
	db "ringing.@"

SilverWingDesc:
	db "A strange, silver-",$4E
	db "colored feather.@"

MoomooMilkDesc:
	db "Restores #MON",$4E
	db "HP by 100.@"

QuickClawDesc:
	db "Raises 1st strike",$4E
	db "ratio. (HOLD)@"

PsnCureBerryDesc:
	db "A self-cure for",$4E
	db "poison. (HOLD)@"

GoldLeafDesc:
	db "A strange, gold-",$4E
	db "colored leaf.@"

SoftSandDesc:
	db "Powers up ground-",$4E
	db "type moves. (HOLD)@"

SharpBeakDesc:
	db "Powers up flying-",$4E
	db "type moves. (HOLD)@"

PrzCureBerryDesc:
	db "A self-cure for",$4E
	db "paralysis. (HOLD)@"

BurntBerryDesc:
	db "A self-cure for",$4E
	db "freezing. (HOLD)@"

IceBerryDesc:
	db "A self-heal for a",$4E
	db "burn. (HOLD)@"

PoisonBarbDesc:
	db "Powers up poison-",$4E
	db "type moves. (HOLD)@"

KingsRockDesc:
	db "May make the foe",$4E
	db "flinch. (HOLD)@"

BitterBerryDesc:
	db "A self-cure for",$4E
	db "confusion. (HOLD)@"

MintBerryDesc:
	db "A self-awakening",$4E
	db "for sleep. (HOLD)@"

RedApricornDesc:
	db "A red APRICORN.@"

TinyMushroomDesc:
	db "An ordinary mush-",$4E
	db "room. Sell low.@"

BigMushroomDesc:
	db "A rare mushroom.",$4E
	db "Sell high.@"

SilverPowderDesc:
	db "Powers up bug-type",$4E
	db "moves. (HOLD)@"

BluApricornDesc:
	db "A blue APRICORN.@"

TeruSama6Desc:
	db "?@"

AmuletCoinDesc:
	db "Doubles monetary",$4E
	db "earnings. (HOLD)@"

YlwApricornDesc:
	db "A yellow APRICORN.@"

GrnApricornDesc:
	db "A green APRICORN.@"

CleanseTagDesc:
	db "Helps repel wild",$4E
	db "#MON. (HOLD)@"

MysticWaterDesc:
	db "Powers up water-",$4E
	db "type moves. (HOLD)@"

TwistedSpoonDesc:
	db "Powers up psychic-",$4E
	db "type moves. (HOLD)@"

WhtApricornDesc:
	db "A white APRICORN.@"

BlackbeltDesc:
	db "Boosts fighting-",$4E
	db "type moves. (HOLD)@"

BlkApricornDesc:
	db "A black APRICORN.",$4E
	db "@"

TeruSama7Desc:
	db "?@"

PnkApricornDesc:
	db "A pink APRICORN.",$4E
	db "@"

BlackGlassesDesc:
	db "Powers up dark-",$4E
	db "type moves. (HOLD)@"

SlowpokeTailDesc:
	db "Very tasty. Sell",$4E
	db "high.@"

PinkBowDesc:
	db "Powers up normal-",$4E
	db "type moves. (HOLD)@"

StickDesc:
	db "An ordinary stick.",$4E
	db "Sell low.@"

SmokeBallDesc:
	db "Escape from wild",$4E
	db "#MON. (HOLD)@"

NeverMeltIceDesc:
	db "Powers up ice-type",$4E
	db "moves. (HOLD)@"

MagnetDesc:
	db "Boosts electric-",$4E
	db "type moves. (HOLD)@"

MiracleBerryDesc:
	db "Cures all status",$4E
	db "problems. (HOLD)@"

PearlDesc:
	db "A beautiful pearl.",$4E
	db "Sell low.@"

BigPearlDesc:
	db "A big, beautiful",$4E
	db "pearl. Sell high.@"

EverStoneDesc:
	db "Stops evolution.",$4E
	db "(HOLD)@"

SpellTagDesc:
	db "Powers up ghost-",$4E
	db "type moves. (HOLD)@"

RageCandyBarDesc:
	db "Restores #MON",$4E
	db "HP by 20.@"

GSBallDesc:
	db "The mysterious",$4E
	db "BALL.@"

BlueCardDesc:
	db "Card to save",$4E
	db "points.@"

MiracleSeedDesc:
	db "Powers up grass-",$4E
	db "type moves. (HOLD)@"

ThickClubDesc:
	db "A bone of some",$4E
	db "sort. Sell low.@"

FocusBandDesc:
	db "May prevent faint-",$4E
	db "ing. (HOLD)@"

TeruSama8Desc:
	db "?@"

EnergyPowderDesc:
	db "Restores #MON",$4E
	db "HP by 50. Bitter.@"

EnergyRootDesc:
	db "Restores #MON",$4E
	db "HP by 200. Bitter.@"

HealPowderDesc:
	db "Cures all status",$4E
	db "problems. Bitter.@"

RevivalHerbDesc:
	db "Revives fainted",$4E
	db "#MON. Bitter.@"

HardStoneDesc:
	db "Powers up rock-",$4E
	db "type moves. (HOLD)@"

LuckyEggDesc:
	db "Earns extra EXP.",$4E
	db "points. (HOLD)@"

CardKeyDesc:
	db "Opens shutters in",$4E
	db "the RADIO TOWER.@"

MachinePartDesc:
	db "A machine part for",$4E
	db "the POWER PLANT.@"

EggTicketDesc:
	db "May use at Golden-",$4E
	db "rod trade corner.@"

LostItemDesc:
	db "The # DOLL lost",$4E
	db "by the COPYCAT.@"

StardustDesc:
	db "Pretty, red sand.",$4E
	db "Sell high.@"

StarPieceDesc:
	db "A hunk of red gem.",$4E
	db "Sell very high.@"

BasementKeyDesc:
	db "Opens doors.@"

PassDesc:
	db "A ticket for the",$4E
	db "MAGNET TRAIN.@"

TeruSama9Desc:
	db "?@"

TeruSama10Desc:
	db "?@"

TeruSama11Desc:
	db "?@"

CharcoalDesc:
	db "Powers up fire-",$4E
	db "type moves. (HOLD)@"

BerryJuiceDesc:
	db "Restores #MON",$4E
	db "HP by 20.@"

ScopeLensDesc:
	db "Raises critical",$4E
	db "hit ratio. (HOLD)@"

TeruSama12Desc:
	db "?@"

TeruSama13Desc:
	db "?@"

MetalCoatDesc:
	db "Powers up steel-",$4E
	db "type moves. (HOLD)@"

DragonFangDesc:
	db "Powers up dragon-",$4E
	db "type moves. (HOLD)@"

TeruSama14Desc:
	db "?@"

LeftoversDesc:
	db "Restores HP during",$4E
	db "battle. (HOLD)@"

TeruSama15Desc:
	db "?@"

TeruSama16Desc:
	db "?@"

TeruSama17Desc:
	db "?@"

MysteryBerryDesc:
	db "A self-restore",$4E
	db "for PP. (HOLD)@"

DragonScaleDesc:
	db "A rare dragon-type",$4E
	db "item.@"

BerserkGeneDesc:
	db "Boosts ATTACK but",$4E
	db "causes confusion.@"

TeruSama18Desc:
	db "?@"

TeruSama19Desc:
	db "?@"

TeruSama20Desc:
	db "?@"

SacredAshDesc:
	db "Fully revives all",$4E
	db "fainted #MON.@"

HeavyBallDesc:
	db "A BALL for catch-",$4E
	db "ing heavy #MON.@"

FlowerMailDesc:
	db "Flower-print MAIL.",$4E
	db "(HOLD)@"

LevelBallDesc:
	db "A BALL for lower-",$4E
	db "level #MON.@"

LureBallDesc:
	db "A BALL for #MON",$4E
	db "hooked by a ROD.@"

FastBallDesc:
	db "A BALL for catch-",$4E
	db "ing fast #MON.@"

TeruSama21Desc:
	db "?@"

LightBallDesc:
	db "An odd, electrical",$4E
	db "orb. (HOLD)@"

FriendBallDesc:
	db "A BALL that makes",$4E
	db "#MON friendly.@"

MoonBallDesc:
	db "A BALL for MOON",$4E
	db "STONE evolvers.@"

LoveBallDesc:
	db "For catching the",$4E
	db "opposite gender.@"

NormalBoxDesc:
	db "Open it and see",$4E
	db "what's inside.@"

GorgeousBoxDesc:
	db "Open it and see",$4E
	db "what's inside.@"

SunStoneDesc:
	db "Evolves certain",$4E
	db "kinds of #MON.@"

PolkadotBowDesc:
	db "Powers up normal-",$4E
	db "type moves. (HOLD)@"

TeruSama22Desc:
	db "?@"

UpGradeDesc:
	db "A mysterious box",$4E
	db "made by SILPH CO.@"

BerryDesc:
	db "A self-restore",$4E
	db "item. (10HP, HOLD)@"

GoldBerryDesc:
	db "A self-restore",$4E
	db "item. (30HP, HOLD)@"

SquirtBottleDesc:
	db "A bottle used for",$4E
	db "watering plants.@"

TeruSama23Desc:
	db "?@"

ParkBallDesc:
	db "The Bug-Catching",$4E
	db "Contest BALL.@"

RainbowWingDesc:
	db "A mystical feather",$4E
	db "of rainbow colors.@"

TeruSama24Desc:
	db "?@"

BrickPieceDesc:
	db "A rare chunk of",$4E
	db "tile.@"

SurfMailDesc:
	db "LAPRAS-print MAIL.",$4E
	db "(HOLD)@"

LiteBlueMailDesc:
	db "DRATINI-print",$4E
	db "MAIL. (HOLD)@"

PortraitMailDesc:
	db "MAIL featuring the",$4E
	db "holder's likeness.@"

LovelyMailDesc:
	db "Heart-print MAIL.",$4E
	db "(HOLD)@"

EonMailDesc:
	db "EEVEE-print MAIL.",$4E
	db "(HOLD)@"

MorphMailDesc:
	db "DITTO-print MAIL.",$4E
	db "(HOLD)@"

BlueSkyMailDesc:
	db "Sky-print MAIL.",$4E
	db "(HOLD)@"

MusicMailDesc:
	db "NATU-print MAIL.",$4E
	db "(HOLD)@"

MewMailDesc:
	db "MEW-print MAIL.",$4E
	db "(HOLD)@"

TeruSama25Desc:
	db "?@"

TeruSama26Desc:
	db "?@"

TeruSama27Desc:
	db "?@"

TeruSama28Desc:
	db "?@"

TeruSama29Desc:
	db "?@"

TeruSama30Desc:
	db "?@"

TeruSama31Desc:
	db "?@"

TeruSama32Desc:
	db "?@"

TeruSama33Desc:
	db "?@"

