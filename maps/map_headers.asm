MapGroupPointers: ; 0x94000
; pointers to the first map header of each map group
	dw MapGroup1
	dw MapGroup2
	dw MapGroup3
	dw MapGroup4
	dw MapGroup5
	dw MapGroup6
	dw MapGroup7
	dw MapGroup8
	dw MapGroup9
	dw MapGroup10
	dw MapGroup11
	dw MapGroup12
	dw MapGroup13
	dw MapGroup14
	dw MapGroup15
	dw MapGroup16
	dw MapGroup17
	dw MapGroup18
	dw MapGroup19
	dw MapGroup20
	dw MapGroup21
	dw MapGroup22
	dw MapGroup23
	dw MapGroup24
	dw MapGroup25
	dw MapGroup26


MapGroup1:

OlivinePokeCenter1F_MapHeader: ; 0x94034
	; bank, tileset, permission
	db BANK(OlivinePokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw OlivinePokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_POKEMON_CENTER, 1, 1
; had to increase the final size by 1
; had to convert 0x->$ (duh..)
; 0x9403d

OlivineGym_MapHeader: ; 0x9403d
	; bank, tileset, permission
	db BANK(OlivineGym_SecondMapHeader), $12, 3

	; second map header
	dw OlivineGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_GYM, 17, 1
; 0x94046

OlivineVoltorbHouse_MapHeader: ; 0x94046
	; bank, tileset, permission
	db BANK(OlivineVoltorbHouse_SecondMapHeader), $5, 3

	; second map header
	dw OlivineVoltorbHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x9404f

OlivineHouseBeta_MapHeader: ; 0x9404f
	; bank, tileset, permission
	db BANK(OlivineHouseBeta_SecondMapHeader), $5, 3

	; second map header
	dw OlivineHouseBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x94058

OlivinePunishmentSpeechHouse_MapHeader: ; 0x94058
	; bank, tileset, permission
	db BANK(OlivinePunishmentSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw OlivinePunishmentSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x94061

OlivineGoodRodHouse_MapHeader: ; 0x94061
	; bank, tileset, permission
	db BANK(OlivineGoodRodHouse_SecondMapHeader), $5, 3

	; second map header
	dw OlivineGoodRodHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x9406a

OlivineCafe_MapHeader: ; 0x9406a
	; bank, tileset, permission
	db BANK(OlivineCafe_SecondMapHeader), $e, 3

	; second map header
	dw OlivineCafe_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x94073

OlivineMart_MapHeader: ; 0x94073
	; bank, tileset, permission
	db BANK(OlivineMart_SecondMapHeader), $c, 3

	; second map header
	dw OlivineMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x9407c

Route38EcruteakGate_MapHeader: ; 0x9407c
	; bank, tileset, permission
	db BANK(Route38EcruteakGate_SecondMapHeader), $8, 6

	; second map header
	dw Route38EcruteakGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_38, MUSIC_ROUTE_37, 1, 1
; 0x94085

Route39Barn_MapHeader: ; 0x94085
	; bank, tileset, permission
	db BANK(Route39Barn_SecondMapHeader), $10, 3

	; second map header
	dw Route39Barn_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_39, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x9408e

Route39Farmhouse_MapHeader: ; 0x9408e
	; bank, tileset, permission
	db BANK(Route39Farmhouse_SecondMapHeader), $5, 3

	; second map header
	dw Route39Farmhouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_39, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x94097

Route38_MapHeader: ; 0x94097
	; bank, tileset, permission
	db BANK(Route38_SecondMapHeader), $1, 2

	; second map header
	dw Route38_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_38, MUSIC_ROUTE_37, 0, 1
; 0x940a0

Route39_MapHeader: ; 0x940a0
	; bank, tileset, permission
	db BANK(Route39_SecondMapHeader), $1, 2

	; second map header
	dw Route39_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_39, MUSIC_ROUTE_37, 0, 1
; 0x940a9

OlivineCity_MapHeader: ; 0x940a9
	; bank, tileset, permission
	db BANK(OlivineCity_SecondMapHeader), $1, 1

	; second map header
	dw OlivineCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 1
; 0x940b2


MapGroup2:

MahoganyRedGyaradosSpeechHouse_MapHeader: ; 0x940b2
	; bank, tileset, permission
	db BANK(MahoganyRedGyaradosSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw MahoganyRedGyaradosSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MAHOGANY_TOWN, MUSIC_CHERRYGROVE_CITY, 1, 1
; 0x940bb

MahoganyGym_MapHeader: ; 0x940bb
	; bank, tileset, permission
	db BANK(MahoganyGym_SecondMapHeader), $f, 3

	; second map header
	dw MahoganyGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MAHOGANY_TOWN, MUSIC_GYM, 17, 1
; 0x940c4

MahoganyPokeCenter1F_MapHeader: ; 0x940c4
	; bank, tileset, permission
	db BANK(MahoganyPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw MahoganyPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MAHOGANY_TOWN, MUSIC_POKEMON_CENTER, 1, 1
; 0x940cd

Route42EcruteakGate_MapHeader: ; 0x940cd
	; bank, tileset, permission
	db BANK(Route42EcruteakGate_SecondMapHeader), $8, 6

	; second map header
	dw Route42EcruteakGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_42, MUSIC_LAKE_OF_RAGE, 1, 1
; 0x940d6

Route42_MapHeader: ; 0x940d6
	; bank, tileset, permission
	db BANK(Route42_SecondMapHeader), $1, 2

	; second map header
	dw Route42_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_42, MUSIC_LAKE_OF_RAGE, 0, 3
; 0x940df

Route44_MapHeader: ; 0x940df
	; bank, tileset, permission
	db BANK(Route44_SecondMapHeader), $1, 2

	; second map header
	dw Route44_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_44, MUSIC_LAKE_OF_RAGE, 0, 4
; 0x940e8

MahoganyTown_MapHeader: ; 0x940e8
	; bank, tileset, permission
	db BANK(MahoganyTown_SecondMapHeader), $1, 1

	; second map header
	dw MahoganyTown_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MAHOGANY_TOWN, MUSIC_CHERRYGROVE_CITY, 0, 1
; 0x940f1


MapGroup3:

SproutTower1F_MapHeader: ; 0x940f1
	; bank, tileset, permission
	db BANK(SproutTower1F_SecondMapHeader), $17, 7

	; second map header
	dw SproutTower1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SPROUT_TOWER, MUSIC_SPROUT_TOWER, 1, 1
; 0x940fa

SproutTower2F_MapHeader: ; 0x940fa
	; bank, tileset, permission
	db BANK(SproutTower2F_SecondMapHeader), $17, 7

	; second map header
	dw SproutTower2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SPROUT_TOWER, MUSIC_SPROUT_TOWER, 1, 1
; 0x94103

SproutTower3F_MapHeader: ; 0x94103
	; bank, tileset, permission
	db BANK(SproutTower3F_SecondMapHeader), $17, 7

	; second map header
	dw SproutTower3F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SPROUT_TOWER, MUSIC_SPROUT_TOWER, 1, 1
; 0x9410c

TinTower1F_MapHeader: ; 0x9410c
	; bank, tileset, permission
	db BANK(TinTower1F_SecondMapHeader), $17, 7

	; second map header
	dw TinTower1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
; 0x94115

TinTower2F_MapHeader: ; 0x94115
	; bank, tileset, permission
	db BANK(TinTower2F_SecondMapHeader), $17, 7

	; second map header
	dw TinTower2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
; 0x9411e

TinTower3F_MapHeader: ; 0x9411e
	; bank, tileset, permission
	db BANK(TinTower3F_SecondMapHeader), $17, 7

	; second map header
	dw TinTower3F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
; 0x94127

TinTower4F_MapHeader: ; 0x94127
	; bank, tileset, permission
	db BANK(TinTower4F_SecondMapHeader), $17, 7

	; second map header
	dw TinTower4F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
; 0x94130

TinTower5F_MapHeader: ; 0x94130
	; bank, tileset, permission
	db BANK(TinTower5F_SecondMapHeader), $17, 7

	; second map header
	dw TinTower5F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
; 0x94139

TinTower6F_MapHeader: ; 0x94139
	; bank, tileset, permission
	db BANK(TinTower6F_SecondMapHeader), $17, 7

	; second map header
	dw TinTower6F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
; 0x94142

TinTower7F_MapHeader: ; 0x94142
	; bank, tileset, permission
	db BANK(TinTower7F_SecondMapHeader), $17, 7

	; second map header
	dw TinTower7F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
; 0x9414b

TinTower8F_MapHeader: ; 0x9414b
	; bank, tileset, permission
	db BANK(TinTower8F_SecondMapHeader), $17, 7

	; second map header
	dw TinTower8F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
; 0x94154

TinTower9F_MapHeader: ; 0x94154
	; bank, tileset, permission
	db BANK(TinTower9F_SecondMapHeader), $17, 7

	; second map header
	dw TinTower9F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TIN_TOWER, MUSIC_TIN_TOWER, 1, 1
; 0x9415d

BurnedTower1F_MapHeader: ; 0x9415d
	; bank, tileset, permission
	db BANK(BurnedTower1F_SecondMapHeader), $17, 7

	; second map header
	dw BurnedTower1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BURNED_TOWER, MUSIC_BURNED_TOWER, 18, 1
; 0x94166

BurnedTowerB1F_MapHeader: ; 0x94166
	; bank, tileset, permission
	db BANK(BurnedTowerB1F_SecondMapHeader), $18, 4

	; second map header
	dw BurnedTowerB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BURNED_TOWER, MUSIC_BURNED_TOWER, 18, 1
; 0x9416f

NationalPark_MapHeader: ; 0x9416f
	; bank, tileset, permission
	db BANK(NationalPark_SecondMapHeader), $19, 2

	; second map header
	dw NationalPark_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db NATIONAL_PARK, MUSIC_NATIONAL_PARK, 0, 1
; 0x94178

NationalParkBugContest_MapHeader: ; 0x94178
	; bank, tileset, permission
	db BANK(NationalParkBugContest_SecondMapHeader), $19, 2

	; second map header
	dw NationalParkBugContest_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db NATIONAL_PARK, MUSIC_BUG_CATCHING_CONTEST, 0, 1
; 0x94181

RadioTower1F_MapHeader: ; 0x94181
	; bank, tileset, permission
	db BANK(RadioTower1F_SecondMapHeader), $1b, 3

	; second map header
	dw RadioTower1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 17, 1
; 0x9418a

RadioTower2F_MapHeader: ; 0x9418a
	; bank, tileset, permission
	db BANK(RadioTower2F_SecondMapHeader), $1b, 3

	; second map header
	dw RadioTower2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 17, 1
; 0x94193

RadioTower3F_MapHeader: ; 0x94193
	; bank, tileset, permission
	db BANK(RadioTower3F_SecondMapHeader), $1b, 3

	; second map header
	dw RadioTower3F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 17, 1
; 0x9419c

RadioTower4F_MapHeader: ; 0x9419c
	; bank, tileset, permission
	db BANK(RadioTower4F_SecondMapHeader), $1b, 3

	; second map header
	dw RadioTower4F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 17, 1
; 0x941a5

RadioTower5F_MapHeader: ; 0x941a5
	; bank, tileset, permission
	db BANK(RadioTower5F_SecondMapHeader), $1b, 3

	; second map header
	dw RadioTower5F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RADIO_TOWER, 1<<7 | MUSIC_GOLDENROD_CITY, 17, 1
; 0x941ae

RuinsofAlphOutside_MapHeader: ; 0x941ae
	; bank, tileset, permission
	db BANK(RuinsofAlphOutside_SecondMapHeader), $1, 2

	; second map header
	dw RuinsofAlphOutside_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 0, 4
; 0x941b7

RuinsofAlphHoOhChamber_MapHeader: ; 0x941b7
	; bank, tileset, permission
	db BANK(RuinsofAlphHoOhChamber_SecondMapHeader), $1a, 7

	; second map header
	dw RuinsofAlphHoOhChamber_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x941c0

RuinsofAlphKabutoChamber_MapHeader: ; 0x941c0
	; bank, tileset, permission
	db BANK(RuinsofAlphKabutoChamber_SecondMapHeader), $1a, 7

	; second map header
	dw RuinsofAlphKabutoChamber_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x941c9

RuinsofAlphOmanyteChamber_MapHeader: ; 0x941c9
	; bank, tileset, permission
	db BANK(RuinsofAlphOmanyteChamber_SecondMapHeader), $1a, 7

	; second map header
	dw RuinsofAlphOmanyteChamber_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x941d2

RuinsofAlphAerodactylChamber_MapHeader: ; 0x941d2
	; bank, tileset, permission
	db BANK(RuinsofAlphAerodactylChamber_SecondMapHeader), $1a, 7

	; second map header
	dw RuinsofAlphAerodactylChamber_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x941db

RuinsofAlphInnerChamber_MapHeader: ; 0x941db
	; bank, tileset, permission
	db BANK(RuinsofAlphInnerChamber_SecondMapHeader), $1a, 7

	; second map header
	dw RuinsofAlphInnerChamber_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_RUINS_OF_ALPH_INTERIOR, 17, 1
; 0x941e4

RuinsofAlphResearchCenter_MapHeader: ; 0x941e4
	; bank, tileset, permission
	db BANK(RuinsofAlphResearchCenter_SecondMapHeader), $b, 3

	; second map header
	dw RuinsofAlphResearchCenter_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 1, 1
; 0x941ed

RuinsofAlphHoOhItemRoom_MapHeader: ; 0x941ed
	; bank, tileset, permission
	db BANK(RuinsofAlphHoOhItemRoom_SecondMapHeader), $1a, 7

	; second map header
	dw RuinsofAlphHoOhItemRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x941f6

RuinsofAlphKabutoItemRoom_MapHeader: ; 0x941f6
	; bank, tileset, permission
	db BANK(RuinsofAlphKabutoItemRoom_SecondMapHeader), $1a, 7

	; second map header
	dw RuinsofAlphKabutoItemRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x941ff

RuinsofAlphOmanyteItemRoom_MapHeader: ; 0x941ff
	; bank, tileset, permission
	db BANK(RuinsofAlphOmanyteItemRoom_SecondMapHeader), $1a, 7

	; second map header
	dw RuinsofAlphOmanyteItemRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x94208

RuinsofAlphAerodactylItemRoom_MapHeader: ; 0x94208
	; bank, tileset, permission
	db BANK(RuinsofAlphAerodactylItemRoom_SecondMapHeader), $1a, 7

	; second map header
	dw RuinsofAlphAerodactylItemRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x94211

RuinsofAlphHoOhWordRoom_MapHeader: ; 0x94211
	; bank, tileset, permission
	db BANK(RuinsofAlphHoOhWordRoom_SecondMapHeader), $21, 7

	; second map header
	dw RuinsofAlphHoOhWordRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x9421a

RuinsofAlphKabutoWordRoom_MapHeader: ; 0x9421a
	; bank, tileset, permission
	db BANK(RuinsofAlphKabutoWordRoom_SecondMapHeader), $22, 7

	; second map header
	dw RuinsofAlphKabutoWordRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x94223

RuinsofAlphOmanyteWordRoom_MapHeader: ; 0x94223
	; bank, tileset, permission
	db BANK(RuinsofAlphOmanyteWordRoom_SecondMapHeader), $23, 7

	; second map header
	dw RuinsofAlphOmanyteWordRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x9422c

RuinsofAlphAerodactylWordRoom_MapHeader: ; 0x9422c
	; bank, tileset, permission
	db BANK(RuinsofAlphAerodactylWordRoom_SecondMapHeader), $24, 7

	; second map header
	dw RuinsofAlphAerodactylWordRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db RUINS_OF_ALPH, MUSIC_UNION_CAVE, 17, 1
; 0x94235

UnionCave1F_MapHeader: ; 0x94235
	; bank, tileset, permission
	db BANK(UnionCave1F_SecondMapHeader), $18, 4

	; second map header
	dw UnionCave1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db UNION_CAVE, MUSIC_UNION_CAVE, 18, 3
; 0x9423e

UnionCaveB1F_MapHeader: ; 0x9423e
	; bank, tileset, permission
	db BANK(UnionCaveB1F_SecondMapHeader), $18, 4

	; second map header
	dw UnionCaveB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db UNION_CAVE, MUSIC_UNION_CAVE, 18, 3
; 0x94247

UnionCaveB2F_MapHeader: ; 0x94247
	; bank, tileset, permission
	db BANK(UnionCaveB2F_SecondMapHeader), $18, 4

	; second map header
	dw UnionCaveB2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db UNION_CAVE, MUSIC_UNION_CAVE, 18, 1
; 0x94250

SlowpokeWellB1F_MapHeader: ; 0x94250
	; bank, tileset, permission
	db BANK(SlowpokeWellB1F_SecondMapHeader), $18, 4

	; second map header
	dw SlowpokeWellB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SLOWPOKE_WELL, MUSIC_DARK_CAVE, 18, 3
; 0x94259

SlowpokeWellB2F_MapHeader: ; 0x94259
	; bank, tileset, permission
	db BANK(SlowpokeWellB2F_SecondMapHeader), $18, 4

	; second map header
	dw SlowpokeWellB2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SLOWPOKE_WELL, MUSIC_DARK_CAVE, 18, 3
; 0x94262

OlivineLighthouse1F_MapHeader: ; 0x94262
	; bank, tileset, permission
	db BANK(OlivineLighthouse1F_SecondMapHeader), $13, 7

	; second map header
	dw OlivineLighthouse1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LIGHTHOUSE, MUSIC_LIGHTHOUSE, 1, 1
; 0x9426b

OlivineLighthouse2F_MapHeader: ; 0x9426b
	; bank, tileset, permission
	db BANK(OlivineLighthouse2F_SecondMapHeader), $13, 7

	; second map header
	dw OlivineLighthouse2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LIGHTHOUSE, MUSIC_LIGHTHOUSE, 1, 1
; 0x94274

OlivineLighthouse3F_MapHeader: ; 0x94274
	; bank, tileset, permission
	db BANK(OlivineLighthouse3F_SecondMapHeader), $13, 7

	; second map header
	dw OlivineLighthouse3F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LIGHTHOUSE, MUSIC_LIGHTHOUSE, 1, 1
; 0x9427d

OlivineLighthouse4F_MapHeader: ; 0x9427d
	; bank, tileset, permission
	db BANK(OlivineLighthouse4F_SecondMapHeader), $13, 7

	; second map header
	dw OlivineLighthouse4F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LIGHTHOUSE, MUSIC_LIGHTHOUSE, 1, 1
; 0x94286

OlivineLighthouse5F_MapHeader: ; 0x94286
	; bank, tileset, permission
	db BANK(OlivineLighthouse5F_SecondMapHeader), $13, 7

	; second map header
	dw OlivineLighthouse5F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LIGHTHOUSE, MUSIC_LIGHTHOUSE, 1, 1
; 0x9428f

OlivineLighthouse6F_MapHeader: ; 0x9428f
	; bank, tileset, permission
	db BANK(OlivineLighthouse6F_SecondMapHeader), $13, 7

	; second map header
	dw OlivineLighthouse6F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LIGHTHOUSE, MUSIC_VIOLET_CITY, 1, 1
; 0x94298

MahoganyMart1F_MapHeader: ; 0x94298
	; bank, tileset, permission
	db BANK(MahoganyMart1F_SecondMapHeader), $10, 3

	; second map header
	dw MahoganyMart1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MAHOGANY_TOWN, MUSIC_MAHOGANY_MART, 17, 1
; 0x942a1

TeamRocketBaseB1F_MapHeader: ; 0x942a1
	; bank, tileset, permission
	db BANK(TeamRocketBaseB1F_SecondMapHeader), $1c, 7

	; second map header
	dw TeamRocketBaseB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MAHOGANY_TOWN, MUSIC_ROCKET_HIDEOUT, 17, 1
; 0x942aa

TeamRocketBaseB2F_MapHeader: ; 0x942aa
	; bank, tileset, permission
	db BANK(TeamRocketBaseB2F_SecondMapHeader), $b, 7

	; second map header
	dw TeamRocketBaseB2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MAHOGANY_TOWN, MUSIC_ROCKET_HIDEOUT, 17, 1
; 0x942b3

TeamRocketBaseB3F_MapHeader: ; 0x942b3
	; bank, tileset, permission
	db BANK(TeamRocketBaseB3F_SecondMapHeader), $b, 7

	; second map header
	dw TeamRocketBaseB3F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MAHOGANY_TOWN, MUSIC_ROCKET_HIDEOUT, 17, 1
; 0x942bc

IlexForest_MapHeader: ; 0x942bc
	; bank, tileset, permission
	db BANK(IlexForest_SecondMapHeader), $1f, 4

	; second map header
	dw IlexForest_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ILEX_FOREST, MUSIC_UNION_CAVE, 2, 4
; 0x942c5

WarehouseEntrance_MapHeader: ; 0x942c5
	; bank, tileset, permission
	db BANK(WarehouseEntrance_SecondMapHeader), $8, 7

	; second map header
	dw WarehouseEntrance_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_UNION_CAVE, 17, 1
; 0x942ce

UndergroundPathSwitchRoomEntrances_MapHeader: ; 0x942ce
	; bank, tileset, permission
	db BANK(UndergroundPathSwitchRoomEntrances_SecondMapHeader), $f, 7

	; second map header
	dw UndergroundPathSwitchRoomEntrances_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_UNION_CAVE, 17, 1
; 0x942d7

GoldenrodDeptStoreB1F_MapHeader: ; 0x942d7
	; bank, tileset, permission
	db BANK(GoldenrodDeptStoreB1F_SecondMapHeader), $1c, 7

	; second map header
	dw GoldenrodDeptStoreB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 17, 1
; 0x942e0

UndergroundWarehouse_MapHeader: ; 0x942e0
	; bank, tileset, permission
	db BANK(UndergroundWarehouse_SecondMapHeader), $1c, 7

	; second map header
	dw UndergroundWarehouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_UNION_CAVE, 17, 1
; 0x942e9

MountMortar1FOutside_MapHeader: ; 0x942e9
	; bank, tileset, permission
	db BANK(MountMortar1FOutside_SecondMapHeader), $1e, 4

	; second map header
	dw MountMortar1FOutside_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MT_MORTAR, MUSIC_UNION_CAVE, 18, 3
; 0x942f2

MountMortar1FInside_MapHeader: ; 0x942f2
	; bank, tileset, permission
	db BANK(MountMortar1FInside_SecondMapHeader), $1e, 4

	; second map header
	dw MountMortar1FInside_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MT_MORTAR, MUSIC_UNION_CAVE, 18, 3
; 0x942fb

MountMortar2FInside_MapHeader: ; 0x942fb
	; bank, tileset, permission
	db BANK(MountMortar2FInside_SecondMapHeader), $1e, 4

	; second map header
	dw MountMortar2FInside_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MT_MORTAR, MUSIC_UNION_CAVE, 18, 3
; 0x94304

MountMortarB1F_MapHeader: ; 0x94304
	; bank, tileset, permission
	db BANK(MountMortarB1F_SecondMapHeader), $1e, 4

	; second map header
	dw MountMortarB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MT_MORTAR, MUSIC_UNION_CAVE, 18, 3
; 0x9430d

IcePath1F_MapHeader: ; 0x9430d
	; bank, tileset, permission
	db BANK(IcePath1F_SecondMapHeader), $1d, 4

	; second map header
	dw IcePath1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ICE_PATH, MUSIC_DARK_CAVE, 18, 5
; 0x94316

IcePathB1F_MapHeader: ; 0x94316
	; bank, tileset, permission
	db BANK(IcePathB1F_SecondMapHeader), $1d, 4

	; second map header
	dw IcePathB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ICE_PATH, MUSIC_DARK_CAVE, 18, 5
; 0x9431f

IcePathB2FMahoganySide_MapHeader: ; 0x9431f
	; bank, tileset, permission
	db BANK(IcePathB2FMahoganySide_SecondMapHeader), $1d, 4

	; second map header
	dw IcePathB2FMahoganySide_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ICE_PATH, MUSIC_DARK_CAVE, 18, 5
; 0x94328

IcePathB2FBlackthornSide_MapHeader: ; 0x94328
	; bank, tileset, permission
	db BANK(IcePathB2FBlackthornSide_SecondMapHeader), $1d, 4

	; second map header
	dw IcePathB2FBlackthornSide_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ICE_PATH, MUSIC_DARK_CAVE, 18, 5
; 0x94331

IcePathB3F_MapHeader: ; 0x94331
	; bank, tileset, permission
	db BANK(IcePathB3F_SecondMapHeader), $1d, 4

	; second map header
	dw IcePathB3F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ICE_PATH, MUSIC_DARK_CAVE, 18, 5
; 0x9433a

WhirlIslandNW_MapHeader: ; 0x9433a
	; bank, tileset, permission
	db BANK(WhirlIslandNW_SecondMapHeader), $1e, 4

	; second map header
	dw WhirlIslandNW_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
; 0x94343

WhirlIslandNE_MapHeader: ; 0x94343
	; bank, tileset, permission
	db BANK(WhirlIslandNE_SecondMapHeader), $1e, 4

	; second map header
	dw WhirlIslandNE_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
; 0x9434c

WhirlIslandSW_MapHeader: ; 0x9434c
	; bank, tileset, permission
	db BANK(WhirlIslandSW_SecondMapHeader), $1e, 4

	; second map header
	dw WhirlIslandSW_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
; 0x94355

WhirlIslandCave_MapHeader: ; 0x94355
	; bank, tileset, permission
	db BANK(WhirlIslandCave_SecondMapHeader), $1e, 4

	; second map header
	dw WhirlIslandCave_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
; 0x9435e

WhirlIslandSE_MapHeader: ; 0x9435e
	; bank, tileset, permission
	db BANK(WhirlIslandSE_SecondMapHeader), $1e, 4

	; second map header
	dw WhirlIslandSE_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
; 0x94367

WhirlIslandB1F_MapHeader: ; 0x94367
	; bank, tileset, permission
	db BANK(WhirlIslandB1F_SecondMapHeader), $1e, 4

	; second map header
	dw WhirlIslandB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
; 0x94370

WhirlIslandB2F_MapHeader: ; 0x94370
	; bank, tileset, permission
	db BANK(WhirlIslandB2F_SecondMapHeader), $1e, 4

	; second map header
	dw WhirlIslandB2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
; 0x94379

WhirlIslandLugiaChamber_MapHeader: ; 0x94379
	; bank, tileset, permission
	db BANK(WhirlIslandLugiaChamber_SecondMapHeader), $1e, 4

	; second map header
	dw WhirlIslandLugiaChamber_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db WHIRL_ISLANDS, MUSIC_UNION_CAVE, 20, 10
; 0x94382

SilverCaveRoom1_MapHeader: ; 0x94382
	; bank, tileset, permission
	db BANK(SilverCaveRoom1_SecondMapHeader), $1e, 4

	; second map header
	dw SilverCaveRoom1_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SILVER_CAVE, MUSIC_LIGHTHOUSE, 20, 3
; 0x9438b

SilverCaveRoom2_MapHeader: ; 0x9438b
	; bank, tileset, permission
	db BANK(SilverCaveRoom2_SecondMapHeader), $18, 4

	; second map header
	dw SilverCaveRoom2_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SILVER_CAVE, MUSIC_LIGHTHOUSE, 18, 3
; 0x94394

SilverCaveRoom3_MapHeader: ; 0x94394
	; bank, tileset, permission
	db BANK(SilverCaveRoom3_SecondMapHeader), $18, 4

	; second map header
	dw SilverCaveRoom3_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SILVER_CAVE, MUSIC_LIGHTHOUSE, 17, 3
; 0x9439d

SilverCaveItemRooms_MapHeader: ; 0x9439d
	; bank, tileset, permission
	db BANK(SilverCaveItemRooms_SecondMapHeader), $18, 4

	; second map header
	dw SilverCaveItemRooms_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SILVER_CAVE, MUSIC_LIGHTHOUSE, 18, 3
; 0x943a6

DarkCaveVioletEntrance_MapHeader: ; 0x943a6
	; bank, tileset, permission
	db BANK(DarkCaveVioletEntrance_SecondMapHeader), $1e, 4

	; second map header
	dw DarkCaveVioletEntrance_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db DARK_CAVE, MUSIC_DARK_CAVE, 20, 3
; 0x943af

DarkCaveBlackthornEntrance_MapHeader: ; 0x943af
	; bank, tileset, permission
	db BANK(DarkCaveBlackthornEntrance_SecondMapHeader), $1e, 4

	; second map header
	dw DarkCaveBlackthornEntrance_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db DARK_CAVE, MUSIC_DARK_CAVE, 20, 3
; 0x943b8

DragonsDen1F_MapHeader: ; 0x943b8
	; bank, tileset, permission
	db BANK(DragonsDen1F_SecondMapHeader), $18, 4

	; second map header
	dw DragonsDen1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db DRAGONS_DEN, MUSIC_DRAGONS_DEN, 18, 5
; 0x943c1

DragonsDenB1F_MapHeader: ; 0x943c1
	; bank, tileset, permission
	db BANK(DragonsDenB1F_SecondMapHeader), $1, 4

	; second map header
	dw DragonsDenB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db DRAGONS_DEN, MUSIC_DRAGONS_DEN, 18, 5
; 0x943ca

DragonShrine_MapHeader: ; 0x943ca
	; bank, tileset, permission
	db BANK(DragonShrine_SecondMapHeader), $a, 3

	; second map header
	dw DragonShrine_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db DRAGONS_DEN, MUSIC_DRAGONS_DEN, 18, 1
; 0x943d3

TohjoFalls_MapHeader: ; 0x943d3
	; bank, tileset, permission
	db BANK(TohjoFalls_SecondMapHeader), $18, 4

	; second map header
	dw TohjoFalls_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TOHJO_FALLS, MUSIC_UNION_CAVE, 18, 3
; 0x943dc

DiglettsCave_MapHeader: ; 0x943dc
	; bank, tileset, permission
	db BANK(DiglettsCave_SecondMapHeader), $18, 4

	; second map header
	dw DiglettsCave_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db DIGLETTS_CAVE, MUSIC_MT_MOON, 18, 1
; 0x943e5

MountMoon_MapHeader: ; 0x943e5
	; bank, tileset, permission
	db BANK(MountMoon_SecondMapHeader), $18, 4

	; second map header
	dw MountMoon_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MT_MOON, MUSIC_MT_MOON, 18, 1
; 0x943ee

Underground_MapHeader: ; 0x943ee
	; bank, tileset, permission
	db BANK(Underground_SecondMapHeader), $1c, 6

	; second map header
	dw Underground_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db UNDERGROUND, MUSIC_MT_MOON, 2, 1
; 0x943f7

RockTunnel1F_MapHeader: ; 0x943f7
	; bank, tileset, permission
	db BANK(RockTunnel1F_SecondMapHeader), $1e, 4

	; second map header
	dw RockTunnel1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROCK_TUNNEL, MUSIC_MT_MOON, 20, 1
; 0x94400

RockTunnelB1F_MapHeader: ; 0x94400
	; bank, tileset, permission
	db BANK(RockTunnelB1F_SecondMapHeader), $1e, 4

	; second map header
	dw RockTunnelB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROCK_TUNNEL, MUSIC_MT_MOON, 20, 1
; 0x94409

SafariZoneFuchsiaGateBeta_MapHeader: ; 0x94409
	; bank, tileset, permission
	db BANK(SafariZoneFuchsiaGateBeta_SecondMapHeader), $8, 3

	; second map header
	dw SafariZoneFuchsiaGateBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FUCHSIA_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94412

SafariZoneBeta_MapHeader: ; 0x94412
	; bank, tileset, permission
	db BANK(SafariZoneBeta_SecondMapHeader), $19, 4

	; second map header
	dw SafariZoneBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FUCHSIA_CITY, MUSIC_EVOLUTION, 0, 1
; 0x9441b

VictoryRoad_MapHeader: ; 0x9441b
	; bank, tileset, permission
	db BANK(VictoryRoad_SecondMapHeader), $18, 4

	; second map header
	dw VictoryRoad_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VICTORY_ROAD, MUSIC_VICTORY_ROAD, 18, 1
; 0x94424


MapGroup4:

EcruteakHouse_MapHeader: ; 0x94424
	; bank, tileset, permission
	db BANK(EcruteakHouse_SecondMapHeader), $17, 3

	; second map header
	dw EcruteakHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x9442d

WiseTriosRoom_MapHeader: ; 0x9442d
	; bank, tileset, permission
	db BANK(WiseTriosRoom_SecondMapHeader), $10, 3

	; second map header
	dw WiseTriosRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 17, 1
; 0x94436

EcruteakPokeCenter1F_MapHeader: ; 0x94436
	; bank, tileset, permission
	db BANK(EcruteakPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw EcruteakPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ECRUTEAK_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x9443f

EcruteakLugiaSpeechHouse_MapHeader: ; 0x9443f
	; bank, tileset, permission
	db BANK(EcruteakLugiaSpeechHouse_SecondMapHeader), $10, 3

	; second map header
	dw EcruteakLugiaSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x94448

DanceTheatre_MapHeader: ; 0x94448
	; bank, tileset, permission
	db BANK(DanceTheatre_SecondMapHeader), $10, 3

	; second map header
	dw DanceTheatre_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ECRUTEAK_CITY, MUSIC_DANCING_HALL, 1, 1
; 0x94451

EcruteakMart_MapHeader: ; 0x94451
	; bank, tileset, permission
	db BANK(EcruteakMart_SecondMapHeader), $c, 3

	; second map header
	dw EcruteakMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x9445a

EcruteakGym_MapHeader: ; 0x9445a
	; bank, tileset, permission
	db BANK(EcruteakGym_SecondMapHeader), $17, 3

	; second map header
	dw EcruteakGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ECRUTEAK_CITY, MUSIC_GYM, 17, 1
; 0x94463

EcruteakItemfinderHouse_MapHeader: ; 0x94463
	; bank, tileset, permission
	db BANK(EcruteakItemfinderHouse_SecondMapHeader), $10, 3

	; second map header
	dw EcruteakItemfinderHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x9446c

EcruteakCity_MapHeader: ; 0x9446c
	; bank, tileset, permission
	db BANK(EcruteakCity_SecondMapHeader), $1, 1

	; second map header
	dw EcruteakCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ECRUTEAK_CITY, MUSIC_ECRUTEAK_CITY, 0, 4
; 0x94475


MapGroup5:

BlackthornGym1F_MapHeader: ; 0x94475
	; bank, tileset, permission
	db BANK(BlackthornGym1F_SecondMapHeader), $f, 3

	; second map header
	dw BlackthornGym1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BLACKTHORN_CITY, MUSIC_GYM, 17, 1
; 0x9447e

BlackthornGym2F_MapHeader: ; 0x9447e
	; bank, tileset, permission
	db BANK(BlackthornGym2F_SecondMapHeader), $f, 3

	; second map header
	dw BlackthornGym2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BLACKTHORN_CITY, MUSIC_GYM, 17, 1
; 0x94487

BlackthornDragonSpeechHouse_MapHeader: ; 0x94487
	; bank, tileset, permission
	db BANK(BlackthornDragonSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw BlackthornDragonSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 1, 1
; 0x94490

BlackthornDodrioTradeHouse_MapHeader: ; 0x94490
	; bank, tileset, permission
	db BANK(BlackthornDodrioTradeHouse_SecondMapHeader), $5, 3

	; second map header
	dw BlackthornDodrioTradeHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 1, 1
; 0x94499

BlackthornMart_MapHeader: ; 0x94499
	; bank, tileset, permission
	db BANK(BlackthornMart_SecondMapHeader), $c, 3

	; second map header
	dw BlackthornMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 1, 1
; 0x944a2

BlackthornPokeCenter1F_MapHeader: ; 0x944a2
	; bank, tileset, permission
	db BANK(BlackthornPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw BlackthornPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BLACKTHORN_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x944ab

MoveDeletersHouse_MapHeader: ; 0x944ab
	; bank, tileset, permission
	db BANK(MoveDeletersHouse_SecondMapHeader), $5, 3

	; second map header
	dw MoveDeletersHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 1, 1
; 0x944b4

Route45_MapHeader: ; 0x944b4
	; bank, tileset, permission
	db BANK(Route45_SecondMapHeader), $1, 2

	; second map header
	dw Route45_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_45, MUSIC_ROUTE_36, 0, 9
; 0x944bd

Route46_MapHeader: ; 0x944bd
	; bank, tileset, permission
	db BANK(Route46_SecondMapHeader), $1, 2

	; second map header
	dw Route46_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_46, MUSIC_ROUTE_36, 0, 1
; 0x944c6

BlackthornCity_MapHeader: ; 0x944c6
	; bank, tileset, permission
	db BANK(BlackthornCity_SecondMapHeader), $1, 1

	; second map header
	dw BlackthornCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BLACKTHORN_CITY, MUSIC_AZALEA_TOWN, 0, 4
; 0x944cf


MapGroup6:

CinnabarPokeCenter1F_MapHeader: ; 0x944cf
	; bank, tileset, permission
	db BANK(CinnabarPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw CinnabarPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CINNABAR_ISLAND, MUSIC_POKEMON_CENTER, 1, 1
; 0x944d8

CinnabarPokeCenter2FBeta_MapHeader: ; 0x944d8
	; bank, tileset, permission
	db BANK(CinnabarPokeCenter2FBeta_SecondMapHeader), $7, 3

	; second map header
	dw CinnabarPokeCenter2FBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CINNABAR_ISLAND, MUSIC_POKEMON_CENTER, 1, 1
; 0x944e1

Route19FuchsiaGate_MapHeader: ; 0x944e1
	; bank, tileset, permission
	db BANK(Route19FuchsiaGate_SecondMapHeader), $8, 6

	; second map header
	dw Route19FuchsiaGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_19, MUSIC_ROUTE_3, 1, 1
; 0x944ea

SeafoamGym_MapHeader: ; 0x944ea
	; bank, tileset, permission
	db BANK(SeafoamGym_SecondMapHeader), $18, 3

	; second map header
	dw SeafoamGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SEAFOAM_ISLANDS, MUSIC_GYM, 17, 1
; 0x944f3

Route19_MapHeader: ; 0x944f3
	; bank, tileset, permission
	db BANK(Route19_SecondMapHeader), $3, 2

	; second map header
	dw Route19_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_19, MUSIC_ROUTE_3, 0, 1
; 0x944fc

Route20_MapHeader: ; 0x944fc
	; bank, tileset, permission
	db BANK(Route20_SecondMapHeader), $3, 2

	; second map header
	dw Route20_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_20, MUSIC_ROUTE_3, 0, 2
; 0x94505

Route21_MapHeader: ; 0x94505
	; bank, tileset, permission
	db BANK(Route21_SecondMapHeader), $3, 2

	; second map header
	dw Route21_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_21, MUSIC_ROUTE_3, 0, 2
; 0x9450e

CinnabarIsland_MapHeader: ; 0x9450e
	; bank, tileset, permission
	db BANK(CinnabarIsland_SecondMapHeader), $3, 1

	; second map header
	dw CinnabarIsland_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CINNABAR_ISLAND, MUSIC_VIRIDIAN_CITY, 0, 2
; 0x94517


MapGroup7:

CeruleanGymBadgeSpeechHouse_MapHeader: ; 0x94517
	; bank, tileset, permission
	db BANK(CeruleanGymBadgeSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw CeruleanGymBadgeSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94520

CeruleanPoliceStation_MapHeader: ; 0x94520
	; bank, tileset, permission
	db BANK(CeruleanPoliceStation_SecondMapHeader), $5, 3

	; second map header
	dw CeruleanPoliceStation_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94529

CeruleanTradeSpeechHouse_MapHeader: ; 0x94529
	; bank, tileset, permission
	db BANK(CeruleanTradeSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw CeruleanTradeSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94532

CeruleanPokeCenter1F_MapHeader: ; 0x94532
	; bank, tileset, permission
	db BANK(CeruleanPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw CeruleanPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CERULEAN_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x9453b

CeruleanPokeCenter2FBeta_MapHeader: ; 0x9453b
	; bank, tileset, permission
	db BANK(CeruleanPokeCenter2FBeta_SecondMapHeader), $7, 3

	; second map header
	dw CeruleanPokeCenter2FBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CERULEAN_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x94544

CeruleanGym_MapHeader: ; 0x94544
	; bank, tileset, permission
	db BANK(CeruleanGym_SecondMapHeader), $9, 3

	; second map header
	dw CeruleanGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CERULEAN_CITY, MUSIC_GYM, 17, 0
; 0x9454d

CeruleanMart_MapHeader: ; 0x9454d
	; bank, tileset, permission
	db BANK(CeruleanMart_SecondMapHeader), $c, 3

	; second map header
	dw CeruleanMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94556

Route10PokeCenter1F_MapHeader: ; 0x94556
	; bank, tileset, permission
	db BANK(Route10PokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw Route10PokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_10, MUSIC_POKEMON_CENTER, 1, 1
; 0x9455f

Route10PokeCenter2FBeta_MapHeader: ; 0x9455f
	; bank, tileset, permission
	db BANK(Route10PokeCenter2FBeta_SecondMapHeader), $7, 3

	; second map header
	dw Route10PokeCenter2FBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_10, MUSIC_POKEMON_CENTER, 1, 1
; 0x94568

PowerPlant_MapHeader: ; 0x94568
	; bank, tileset, permission
	db BANK(PowerPlant_SecondMapHeader), $b, 3

	; second map header
	dw PowerPlant_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db POWER_PLANT, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94571

BillsHouse_MapHeader: ; 0x94571
	; bank, tileset, permission
	db BANK(BillsHouse_SecondMapHeader), $5, 3

	; second map header
	dw BillsHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_25, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x9457a

Route4_MapHeader: ; 0x9457a
	; bank, tileset, permission
	db BANK(Route4_SecondMapHeader), $3, 2

	; second map header
	dw Route4_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_4, MUSIC_ROUTE_3, 0, 0
; 0x94583

Route9_MapHeader: ; 0x94583
	; bank, tileset, permission
	db BANK(Route9_SecondMapHeader), $3, 2

	; second map header
	dw Route9_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_9, MUSIC_ROUTE_3, 0, 3
; 0x9458c

Route10North_MapHeader: ; 0x9458c
	; bank, tileset, permission
	db BANK(Route10North_SecondMapHeader), $3, 2

	; second map header
	dw Route10North_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_10, MUSIC_ROUTE_3, 0, 3
; 0x94595

Route24_MapHeader: ; 0x94595
	; bank, tileset, permission
	db BANK(Route24_SecondMapHeader), $3, 2

	; second map header
	dw Route24_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_24, MUSIC_ROUTE_3, 0, 3
; 0x9459e

Route25_MapHeader: ; 0x9459e
	; bank, tileset, permission
	db BANK(Route25_SecondMapHeader), $3, 2

	; second map header
	dw Route25_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_25, MUSIC_ROUTE_3, 0, 3
; 0x945a7

CeruleanCity_MapHeader: ; 0x945a7
	; bank, tileset, permission
	db BANK(CeruleanCity_SecondMapHeader), $3, 1

	; second map header
	dw CeruleanCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CERULEAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 0
; 0x945b0


MapGroup8:

AzaleaPokeCenter1F_MapHeader: ; 0x945b0
	; bank, tileset, permission
	db BANK(AzaleaPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw AzaleaPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db AZALEA_TOWN, MUSIC_POKEMON_CENTER, 1, 1
; 0x945b9

CharcoalKiln_MapHeader: ; 0x945b9
	; bank, tileset, permission
	db BANK(CharcoalKiln_SecondMapHeader), $5, 3

	; second map header
	dw CharcoalKiln_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db AZALEA_TOWN, MUSIC_AZALEA_TOWN, 1, 1
; 0x945c2

AzaleaMart_MapHeader: ; 0x945c2
	; bank, tileset, permission
	db BANK(AzaleaMart_SecondMapHeader), $c, 3

	; second map header
	dw AzaleaMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db AZALEA_TOWN, MUSIC_AZALEA_TOWN, 1, 1
; 0x945cb

KurtsHouse_MapHeader: ; 0x945cb
	; bank, tileset, permission
	db BANK(KurtsHouse_SecondMapHeader), $10, 3

	; second map header
	dw KurtsHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db AZALEA_TOWN, MUSIC_AZALEA_TOWN, 1, 1
; 0x945d4

AzaleaGym_MapHeader: ; 0x945d4
	; bank, tileset, permission
	db BANK(AzaleaGym_SecondMapHeader), $f, 3

	; second map header
	dw AzaleaGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db AZALEA_TOWN, MUSIC_GYM, 17, 1
; 0x945dd

Route33_MapHeader: ; 0x945dd
	; bank, tileset, permission
	db BANK(Route33_SecondMapHeader), $2, 2

	; second map header
	dw Route33_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_33, MUSIC_ROUTE_30, 0, 1
; 0x945e6

AzaleaTown_MapHeader: ; 0x945e6
	; bank, tileset, permission
	db BANK(AzaleaTown_SecondMapHeader), $2, 1

	; second map header
	dw AzaleaTown_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db AZALEA_TOWN, MUSIC_AZALEA_TOWN, 0, 1
; 0x945ef


MapGroup9:

LakeofRageHiddenPowerHouse_MapHeader: ; 0x945ef
	; bank, tileset, permission
	db BANK(LakeofRageHiddenPowerHouse_SecondMapHeader), $5, 3

	; second map header
	dw LakeofRageHiddenPowerHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAKE_OF_RAGE, MUSIC_LAKE_OF_RAGE, 1, 1
; 0x945f8

LakeofRageMagikarpHouse_MapHeader: ; 0x945f8
	; bank, tileset, permission
	db BANK(LakeofRageMagikarpHouse_SecondMapHeader), $5, 3

	; second map header
	dw LakeofRageMagikarpHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAKE_OF_RAGE, MUSIC_LAKE_OF_RAGE, 1, 1
; 0x94601

Route43MahoganyGate_MapHeader: ; 0x94601
	; bank, tileset, permission
	db BANK(Route43MahoganyGate_SecondMapHeader), $8, 6

	; second map header
	dw Route43MahoganyGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_43, MUSIC_LAKE_OF_RAGE, 1, 1
; 0x9460a

Route43Gate_MapHeader: ; 0x9460a
	; bank, tileset, permission
	db BANK(Route43Gate_SecondMapHeader), $8, 6

	; second map header
	dw Route43Gate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_43, MUSIC_LAKE_OF_RAGE, 1, 1
; 0x94613

Route43_MapHeader: ; 0x94613
	; bank, tileset, permission
	db BANK(Route43_SecondMapHeader), $1, 2

	; second map header
	dw Route43_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_43, MUSIC_LAKE_OF_RAGE, 0, 4
; 0x9461c

LakeofRage_MapHeader: ; 0x9461c
	; bank, tileset, permission
	db BANK(LakeofRage_SecondMapHeader), $1, 1

	; second map header
	dw LakeofRage_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAKE_OF_RAGE, MUSIC_LAKE_OF_RAGE, 0, 8
; 0x94625


MapGroup10:

Route32_MapHeader: ; 0x94625
	; bank, tileset, permission
	db BANK(Route32_SecondMapHeader), $1, 2

	; second map header
	dw Route32_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_32, MUSIC_ROUTE_30, 0, 11
; 0x9462e

Route35_MapHeader: ; 0x9462e
	; bank, tileset, permission
	db BANK(Route35_SecondMapHeader), $1, 2

	; second map header
	dw Route35_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_35, MUSIC_ROUTE_36, 0, 4
; 0x94637

Route36_MapHeader: ; 0x94637
	; bank, tileset, permission
	db BANK(Route36_SecondMapHeader), $1, 2

	; second map header
	dw Route36_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_36, MUSIC_ROUTE_36, 0, 1
; 0x94640

Route37_MapHeader: ; 0x94640
	; bank, tileset, permission
	db BANK(Route37_SecondMapHeader), $1, 2

	; second map header
	dw Route37_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_37, MUSIC_ROUTE_36, 0, 1
; 0x94649

VioletCity_MapHeader: ; 0x94649
	; bank, tileset, permission
	db BANK(VioletCity_SecondMapHeader), $1, 1

	; second map header
	dw VioletCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIOLET_CITY, MUSIC_VIOLET_CITY, 0, 4
; 0x94652

VioletMart_MapHeader: ; 0x94652
	; bank, tileset, permission
	db BANK(VioletMart_SecondMapHeader), $c, 3

	; second map header
	dw VioletMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIOLET_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x9465b

VioletGym_MapHeader: ; 0x9465b
	; bank, tileset, permission
	db BANK(VioletGym_SecondMapHeader), $f, 3

	; second map header
	dw VioletGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIOLET_CITY, MUSIC_GYM, 17, 1
; 0x94664

EarlsPokemonAcademy_MapHeader: ; 0x94664
	; bank, tileset, permission
	db BANK(EarlsPokemonAcademy_SecondMapHeader), $a, 3

	; second map header
	dw EarlsPokemonAcademy_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIOLET_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x9466d

VioletNicknameSpeechHouse_MapHeader: ; 0x9466d
	; bank, tileset, permission
	db BANK(VioletNicknameSpeechHouse_SecondMapHeader), $10, 3

	; second map header
	dw VioletNicknameSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIOLET_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x94676

VioletPokeCenter1F_MapHeader: ; 0x94676
	; bank, tileset, permission
	db BANK(VioletPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw VioletPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIOLET_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x9467f

VioletOnixTradeHouse_MapHeader: ; 0x9467f
	; bank, tileset, permission
	db BANK(VioletOnixTradeHouse_SecondMapHeader), $10, 3

	; second map header
	dw VioletOnixTradeHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIOLET_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x94688

Route32RuinsofAlphGate_MapHeader: ; 0x94688
	; bank, tileset, permission
	db BANK(Route32RuinsofAlphGate_SecondMapHeader), $8, 6

	; second map header
	dw Route32RuinsofAlphGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_32, MUSIC_ROUTE_30, 1, 1
; 0x94691

Route32PokeCenter1F_MapHeader: ; 0x94691
	; bank, tileset, permission
	db BANK(Route32PokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw Route32PokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_32, MUSIC_POKEMON_CENTER, 1, 1
; 0x9469a

Route35Goldenrodgate_MapHeader: ; 0x9469a
	; bank, tileset, permission
	db BANK(Route35Goldenrodgate_SecondMapHeader), $8, 6

	; second map header
	dw Route35Goldenrodgate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_35, MUSIC_ROUTE_36, 1, 1
; 0x946a3

Route35NationalParkgate_MapHeader: ; 0x946a3
	; bank, tileset, permission
	db BANK(Route35NationalParkgate_SecondMapHeader), $8, 3

	; second map header
	dw Route35NationalParkgate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_35, MUSIC_GOLDENROD_CITY, 1, 1
; 0x946ac

Route36RuinsofAlphgate_MapHeader: ; 0x946ac
	; bank, tileset, permission
	db BANK(Route36RuinsofAlphgate_SecondMapHeader), $8, 6

	; second map header
	dw Route36RuinsofAlphgate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_36, MUSIC_ROUTE_36, 1, 1
; 0x946b5

Route36NationalParkgate_MapHeader: ; 0x946b5
	; bank, tileset, permission
	db BANK(Route36NationalParkgate_SecondMapHeader), $8, 3

	; second map header
	dw Route36NationalParkgate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_36, MUSIC_GOLDENROD_CITY, 1, 1
; 0x946be


MapGroup11:

Route34_MapHeader: ; 0x946be
	; bank, tileset, permission
	db BANK(Route34_SecondMapHeader), $2, 2

	; second map header
	dw Route34_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_34, MUSIC_ROUTE_36, 0, 1
; 0x946c7

GoldenrodCity_MapHeader: ; 0x946c7
	; bank, tileset, permission
	db BANK(GoldenrodCity_SecondMapHeader), $2, 1

	; second map header
	dw GoldenrodCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 0, 1
; 0x946d0

GoldenrodGym_MapHeader: ; 0x946d0
	; bank, tileset, permission
	db BANK(GoldenrodGym_SecondMapHeader), $f, 3

	; second map header
	dw GoldenrodGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GYM, 17, 1
; 0x946d9

GoldenrodBikeShop_MapHeader: ; 0x946d9
	; bank, tileset, permission
	db BANK(GoldenrodBikeShop_SecondMapHeader), $12, 3

	; second map header
	dw GoldenrodBikeShop_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x946e2

GoldenrodHappinessRater_MapHeader: ; 0x946e2
	; bank, tileset, permission
	db BANK(GoldenrodHappinessRater_SecondMapHeader), $5, 3

	; second map header
	dw GoldenrodHappinessRater_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x946eb

GoldenrodBillsHouse_MapHeader: ; 0x946eb
	; bank, tileset, permission
	db BANK(GoldenrodBillsHouse_SecondMapHeader), $5, 3

	; second map header
	dw GoldenrodBillsHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x946f4

GoldenrodMagnetTrainStation_MapHeader: ; 0x946f4
	; bank, tileset, permission
	db BANK(GoldenrodMagnetTrainStation_SecondMapHeader), $11, 3

	; second map header
	dw GoldenrodMagnetTrainStation_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x946fd

GoldenrodFlowerShop_MapHeader: ; 0x946fd
	; bank, tileset, permission
	db BANK(GoldenrodFlowerShop_SecondMapHeader), $5, 3

	; second map header
	dw GoldenrodFlowerShop_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x94706

GoldenrodPPSpeechHouse_MapHeader: ; 0x94706
	; bank, tileset, permission
	db BANK(GoldenrodPPSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw GoldenrodPPSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x9470f

GoldenrodNameRatersHouse_MapHeader: ; 0x9470f
	; bank, tileset, permission
	db BANK(GoldenrodNameRatersHouse_SecondMapHeader), $5, 3

	; second map header
	dw GoldenrodNameRatersHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x94718

GoldenrodDeptStore1F_MapHeader: ; 0x94718
	; bank, tileset, permission
	db BANK(GoldenrodDeptStore1F_SecondMapHeader), $c, 3

	; second map header
	dw GoldenrodDeptStore1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x94721

GoldenrodDeptStore2F_MapHeader: ; 0x94721
	; bank, tileset, permission
	db BANK(GoldenrodDeptStore2F_SecondMapHeader), $c, 3

	; second map header
	dw GoldenrodDeptStore2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x9472a

GoldenrodDeptStore3F_MapHeader: ; 0x9472a
	; bank, tileset, permission
	db BANK(GoldenrodDeptStore3F_SecondMapHeader), $c, 3

	; second map header
	dw GoldenrodDeptStore3F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x94733

GoldenrodDeptStore4F_MapHeader: ; 0x94733
	; bank, tileset, permission
	db BANK(GoldenrodDeptStore4F_SecondMapHeader), $c, 3

	; second map header
	dw GoldenrodDeptStore4F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x9473c

GoldenrodDeptStore5F_MapHeader: ; 0x9473c
	; bank, tileset, permission
	db BANK(GoldenrodDeptStore5F_SecondMapHeader), $c, 3

	; second map header
	dw GoldenrodDeptStore5F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x94745

GoldenrodDeptStore6F_MapHeader: ; 0x94745
	; bank, tileset, permission
	db BANK(GoldenrodDeptStore6F_SecondMapHeader), $c, 3

	; second map header
	dw GoldenrodDeptStore6F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x9474e

GoldenrodDeptStoreElevator_MapHeader: ; 0x9474e
	; bank, tileset, permission
	db BANK(GoldenrodDeptStoreElevator_SecondMapHeader), $c, 3

	; second map header
	dw GoldenrodDeptStoreElevator_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x94757

GoldenrodDeptStoreRoof_MapHeader: ; 0x94757
	; bank, tileset, permission
	db BANK(GoldenrodDeptStoreRoof_SecondMapHeader), $c, 3

	; second map header
	dw GoldenrodDeptStoreRoof_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GOLDENROD_CITY, 1, 1
; 0x94760

GoldenrodGameCorner_MapHeader: ; 0x94760
	; bank, tileset, permission
	db BANK(GoldenrodGameCorner_SecondMapHeader), $e, 3

	; second map header
	dw GoldenrodGameCorner_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_GAME_CORNER, 1, 1
; 0x94769

GoldenrodPokeCenter1F_MapHeader: ; 0x94769
	; bank, tileset, permission
	db BANK(GoldenrodPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw GoldenrodPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x94772

GoldenrodPokeComCenter2FMobile_MapHeader: ; 0x94772
	; bank, tileset, permission
	db BANK(GoldenrodPokeComCenter2FMobile_SecondMapHeader), $15, 3

	; second map header
	dw GoldenrodPokeComCenter2FMobile_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db GOLDENROD_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x9477b

IlexForestAzaleaGate_MapHeader: ; 0x9477b
	; bank, tileset, permission
	db BANK(IlexForestAzaleaGate_SecondMapHeader), $8, 6

	; second map header
	dw IlexForestAzaleaGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_34, MUSIC_ROUTE_36, 1, 1
; 0x94784

Route34IlexForestGate_MapHeader: ; 0x94784
	; bank, tileset, permission
	db BANK(Route34IlexForestGate_SecondMapHeader), $8, 6

	; second map header
	dw Route34IlexForestGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_34, MUSIC_ROUTE_36, 1, 1
; 0x9478d

DayCare_MapHeader: ; 0x9478d
	; bank, tileset, permission
	db BANK(DayCare_SecondMapHeader), $5, 3

	; second map header
	dw DayCare_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_34, MUSIC_AZALEA_TOWN, 1, 1
; 0x94796


MapGroup12:

Route6_MapHeader: ; 0x94796
	; bank, tileset, permission
	db BANK(Route6_SecondMapHeader), $3, 2

	; second map header
	dw Route6_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_6, MUSIC_ROUTE_3, 0, 4
; 0x9479f

Route11_MapHeader: ; 0x9479f
	; bank, tileset, permission
	db BANK(Route11_SecondMapHeader), $3, 2

	; second map header
	dw Route11_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_11, MUSIC_ROUTE_12, 0, 1
; 0x947a8

VermilionCity_MapHeader: ; 0x947a8
	; bank, tileset, permission
	db BANK(VermilionCity_SecondMapHeader), $3, 1

	; second map header
	dw VermilionCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 2
; 0x947b1

VermilionHouseFishingSpeechHouse_MapHeader: ; 0x947b1
	; bank, tileset, permission
	db BANK(VermilionHouseFishingSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw VermilionHouseFishingSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
; 0x947ba

VermilionPokeCenter1F_MapHeader: ; 0x947ba
	; bank, tileset, permission
	db BANK(VermilionPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw VermilionPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x947c3

VermilionPokeCenter2FBeta_MapHeader: ; 0x947c3
	; bank, tileset, permission
	db BANK(VermilionPokeCenter2FBeta_SecondMapHeader), $7, 3

	; second map header
	dw VermilionPokeCenter2FBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
; 0x947cc

PokemonFanClub_MapHeader: ; 0x947cc
	; bank, tileset, permission
	db BANK(PokemonFanClub_SecondMapHeader), $5, 3

	; second map header
	dw PokemonFanClub_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
; 0x947d5

VermilionMagnetTrainSpeechHouse_MapHeader: ; 0x947d5
	; bank, tileset, permission
	db BANK(VermilionMagnetTrainSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw VermilionMagnetTrainSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
; 0x947de

VermilionMart_MapHeader: ; 0x947de
	; bank, tileset, permission
	db BANK(VermilionMart_SecondMapHeader), $c, 3

	; second map header
	dw VermilionMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
; 0x947e7

VermilionHouseDiglettsCaveSpeechHouse_MapHeader: ; 0x947e7
	; bank, tileset, permission
	db BANK(VermilionHouseDiglettsCaveSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw VermilionHouseDiglettsCaveSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
; 0x947f0

VermilionGym_MapHeader: ; 0x947f0
	; bank, tileset, permission
	db BANK(VermilionGym_SecondMapHeader), $e, 3

	; second map header
	dw VermilionGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_GYM, 17, 1
; 0x947f9

Route6SaffronGate_MapHeader: ; 0x947f9
	; bank, tileset, permission
	db BANK(Route6SaffronGate_SecondMapHeader), $8, 6

	; second map header
	dw Route6SaffronGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_6, MUSIC_ROUTE_3, 1, 1
; 0x94802

Route6UndergroundEntrance_MapHeader: ; 0x94802
	; bank, tileset, permission
	db BANK(Route6UndergroundEntrance_SecondMapHeader), $8, 6

	; second map header
	dw Route6UndergroundEntrance_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_6, MUSIC_ROUTE_3, 1, 1
; 0x9480b


MapGroup13:

Route1_MapHeader: ; 0x9480b
	; bank, tileset, permission
	db BANK(Route1_SecondMapHeader), $3, 2

	; second map header
	dw Route1_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_1, MUSIC_ROUTE_1, 0, 1
; 0x94814

PalletTown_MapHeader: ; 0x94814
	; bank, tileset, permission
	db BANK(PalletTown_SecondMapHeader), $3, 1

	; second map header
	dw PalletTown_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PALLET_TOWN, MUSIC_PALLET_TOWN, 0, 2
; 0x9481d

RedsHouse1F_MapHeader: ; 0x9481d
	; bank, tileset, permission
	db BANK(RedsHouse1F_SecondMapHeader), $6, 3

	; second map header
	dw RedsHouse1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PALLET_TOWN, MUSIC_PALLET_TOWN, 1, 1
; 0x94826

RedsHouse2F_MapHeader: ; 0x94826
	; bank, tileset, permission
	db BANK(RedsHouse2F_SecondMapHeader), $6, 3

	; second map header
	dw RedsHouse2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PALLET_TOWN, MUSIC_PALLET_TOWN, 1, 1
; 0x9482f

BluesHouse_MapHeader: ; 0x9482f
	; bank, tileset, permission
	db BANK(BluesHouse_SecondMapHeader), $5, 3

	; second map header
	dw BluesHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PALLET_TOWN, MUSIC_PALLET_TOWN, 1, 1
; 0x94838

OaksLab_MapHeader: ; 0x94838
	; bank, tileset, permission
	db BANK(OaksLab_SecondMapHeader), $a, 3

	; second map header
	dw OaksLab_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PALLET_TOWN, MUSIC_POKEMON_TALK, 1, 1
; 0x94841


MapGroup14:

Route3_MapHeader: ; 0x94841
	; bank, tileset, permission
	db BANK(Route3_SecondMapHeader), $3, 2

	; second map header
	dw Route3_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_3, MUSIC_ROUTE_3, 0, 1
; 0x9484a

PewterCity_MapHeader: ; 0x9484a
	; bank, tileset, permission
	db BANK(PewterCity_SecondMapHeader), $3, 1

	; second map header
	dw PewterCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 0, 1
; 0x94853

PewterNidoranSpeechHouse_MapHeader: ; 0x94853
	; bank, tileset, permission
	db BANK(PewterNidoranSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw PewterNidoranSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x9485c

PewterGym_MapHeader: ; 0x9485c
	; bank, tileset, permission
	db BANK(PewterGym_SecondMapHeader), $17, 3

	; second map header
	dw PewterGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PEWTER_CITY, MUSIC_GYM, 17, 1
; 0x94865

PewterMart_MapHeader: ; 0x94865
	; bank, tileset, permission
	db BANK(PewterMart_SecondMapHeader), $c, 3

	; second map header
	dw PewterMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x9486e

PewterPokeCenter1F_MapHeader: ; 0x9486e
	; bank, tileset, permission
	db BANK(PewterPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw PewterPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PEWTER_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x94877

PewterPokeCEnter2FBeta_MapHeader: ; 0x94877
	; bank, tileset, permission
	db BANK(PewterPokeCEnter2FBeta_SecondMapHeader), $7, 3

	; second map header
	dw PewterPokeCEnter2FBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94880

PewterSnoozeSpeechHouse_MapHeader: ; 0x94880
	; bank, tileset, permission
	db BANK(PewterSnoozeSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw PewterSnoozeSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db PEWTER_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94889


MapGroup15:

OlivinePort_MapHeader: ; 0x94889
	; bank, tileset, permission
	db BANK(OlivinePort_SecondMapHeader), $9, 2

	; second map header
	dw OlivinePort_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_VIOLET_CITY, 0, 2
; 0x94892

VermilionPort_MapHeader: ; 0x94892
	; bank, tileset, permission
	db BANK(VermilionPort_SecondMapHeader), $9, 2

	; second map header
	dw VermilionPort_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_VERMILION_CITY, 0, 2
; 0x9489b

FastShip1F_MapHeader: ; 0x9489b
	; bank, tileset, permission
	db BANK(FastShip1F_SecondMapHeader), $13, 3

	; second map header
	dw FastShip1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FAST_SHIP, MUSIC_SS_AQUA, 1, 1
; 0x948a4

FastShipCabins_NNW_NNE_NE_MapHeader: ; 0x948a4
	; bank, tileset, permission
	db BANK(FastShipCabins_NNW_NNE_NE_SecondMapHeader), $13, 3

	; second map header
	dw FastShipCabins_NNW_NNE_NE_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FAST_SHIP, MUSIC_SS_AQUA, 1, 1
; 0x948ad

FastShipCabins_SW_SSW_NW_MapHeader: ; 0x948ad
	; bank, tileset, permission
	db BANK(FastShipCabins_SW_SSW_NW_SecondMapHeader), $13, 3

	; second map header
	dw FastShipCabins_SW_SSW_NW_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FAST_SHIP, MUSIC_SS_AQUA, 1, 1
; 0x948b6

FastShipCabins_SE_SSE_CaptainsCabin_MapHeader: ; 0x948b6
	; bank, tileset, permission
	db BANK(FastShipCabins_SE_SSE_CaptainsCabin_SecondMapHeader), $13, 3

	; second map header
	dw FastShipCabins_SE_SSE_CaptainsCabin_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FAST_SHIP, MUSIC_SS_AQUA, 1, 1
; 0x948bf

FastShipB1F_MapHeader: ; 0x948bf
	; bank, tileset, permission
	db BANK(FastShipB1F_SecondMapHeader), $13, 3

	; second map header
	dw FastShipB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FAST_SHIP, MUSIC_SS_AQUA, 1, 1
; 0x948c8

OlivinePortPassage_MapHeader: ; 0x948c8
	; bank, tileset, permission
	db BANK(OlivinePortPassage_SecondMapHeader), $1c, 3

	; second map header
	dw OlivinePortPassage_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db OLIVINE_CITY, MUSIC_VIOLET_CITY, 1, 1
; 0x948d1

VermilionPortPassage_MapHeader: ; 0x948d1
	; bank, tileset, permission
	db BANK(VermilionPortPassage_SecondMapHeader), $1c, 3

	; second map header
	dw VermilionPortPassage_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VERMILION_CITY, MUSIC_VERMILION_CITY, 1, 1
; 0x948da

MountMoonSquare_MapHeader: ; 0x948da
	; bank, tileset, permission
	db BANK(MountMoonSquare_SecondMapHeader), $3, 2

	; second map header
	dw MountMoonSquare_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MT_MOON, MUSIC_MT_MOON_SQUARE, 0, 1
; 0x948e3

MountMoonGiftShop_MapHeader: ; 0x948e3
	; bank, tileset, permission
	db BANK(MountMoonGiftShop_SecondMapHeader), $10, 3

	; second map header
	dw MountMoonGiftShop_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db MT_MOON, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x948ec

TinTowerRoof_MapHeader: ; 0x948ec
	; bank, tileset, permission
	db BANK(TinTowerRoof_SecondMapHeader), $17, 2

	; second map header
	dw TinTowerRoof_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db TIN_TOWER, MUSIC_TIN_TOWER, 0, 1
; 0x948f5


MapGroup16:

Route23_MapHeader: ; 0x948f5
	; bank, tileset, permission
	db BANK(Route23_SecondMapHeader), $3, 1

	; second map header
	dw Route23_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_23, MUSIC_INDIGO_PLATEAU, 0, 1
; 0x948fe

IndigoPlateauPokeCenter1F_MapHeader: ; 0x948fe
	; bank, tileset, permission
	db BANK(IndigoPlateauPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw IndigoPlateauPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 1, 1
; 0x94907

WillsRoom_MapHeader: ; 0x94907
	; bank, tileset, permission
	db BANK(WillsRoom_SecondMapHeader), $f, 3

	; second map header
	dw WillsRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 17, 1
; 0x94910

KogasRoom_MapHeader: ; 0x94910
	; bank, tileset, permission
	db BANK(KogasRoom_SecondMapHeader), $f, 3

	; second map header
	dw KogasRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 17, 1
; 0x94919

BrunosRoom_MapHeader: ; 0x94919
	; bank, tileset, permission
	db BANK(BrunosRoom_SecondMapHeader), $f, 3

	; second map header
	dw BrunosRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 17, 1
; 0x94922

KarensRoom_MapHeader: ; 0x94922
	; bank, tileset, permission
	db BANK(KarensRoom_SecondMapHeader), $f, 3

	; second map header
	dw KarensRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 17, 1
; 0x9492b

LancesRoom_MapHeader: ; 0x9492b
	; bank, tileset, permission
	db BANK(LancesRoom_SecondMapHeader), $12, 3

	; second map header
	dw LancesRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db INDIGO_PLATEAU, MUSIC_INDIGO_PLATEAU, 17, 1
; 0x94934

HallOfFame_MapHeader: ; 0x94934
	; bank, tileset, permission
	db BANK(HallOfFame_SecondMapHeader), $1d, 3

	; second map header
	dw HallOfFame_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db INDIGO_PLATEAU, MUSIC_NEW_BARK_TOWN, 17, 1
; 0x9493d


MapGroup17:

Route13_MapHeader: ; 0x9493d
	; bank, tileset, permission
	db BANK(Route13_SecondMapHeader), $3, 2

	; second map header
	dw Route13_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_13, MUSIC_ROUTE_12, 0, 13
; 0x94946

Route14_MapHeader: ; 0x94946
	; bank, tileset, permission
	db BANK(Route14_SecondMapHeader), $3, 2

	; second map header
	dw Route14_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_14, MUSIC_ROUTE_12, 0, 1
; 0x9494f

Route15_MapHeader: ; 0x9494f
	; bank, tileset, permission
	db BANK(Route15_SecondMapHeader), $3, 2

	; second map header
	dw Route15_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_15, MUSIC_ROUTE_12, 0, 1
; 0x94958

Route18_MapHeader: ; 0x94958
	; bank, tileset, permission
	db BANK(Route18_SecondMapHeader), $3, 2

	; second map header
	dw Route18_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_18, MUSIC_ROUTE_3, 0, 1
; 0x94961

FuchsiaCity_MapHeader: ; 0x94961
	; bank, tileset, permission
	db BANK(FuchsiaCity_SecondMapHeader), $3, 1

	; second map header
	dw FuchsiaCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FUCHSIA_CITY, MUSIC_CELADON_CITY, 0, 8
; 0x9496a

FuchsiaMart_MapHeader: ; 0x9496a
	; bank, tileset, permission
	db BANK(FuchsiaMart_SecondMapHeader), $c, 3

	; second map header
	dw FuchsiaMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FUCHSIA_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94973

SafariZoneMainOffice_MapHeader: ; 0x94973
	; bank, tileset, permission
	db BANK(SafariZoneMainOffice_SecondMapHeader), $e, 3

	; second map header
	dw SafariZoneMainOffice_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FUCHSIA_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x9497c

FuchsiaGym_MapHeader: ; 0x9497c
	; bank, tileset, permission
	db BANK(FuchsiaGym_SecondMapHeader), $a, 3

	; second map header
	dw FuchsiaGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FUCHSIA_CITY, MUSIC_GYM, 17, 1
; 0x94985

FuchsiaBillSpeechHouse_MapHeader: ; 0x94985
	; bank, tileset, permission
	db BANK(FuchsiaBillSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw FuchsiaBillSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FUCHSIA_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x9498e

FuchsiaPokeCenter1F_MapHeader: ; 0x9498e
	; bank, tileset, permission
	db BANK(FuchsiaPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw FuchsiaPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FUCHSIA_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x94997

FuchsiaPokeCenter2FBeta_MapHeader: ; 0x94997
	; bank, tileset, permission
	db BANK(FuchsiaPokeCenter2FBeta_SecondMapHeader), $7, 3

	; second map header
	dw FuchsiaPokeCenter2FBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FUCHSIA_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x949a0

SafariZoneWardensHome_MapHeader: ; 0x949a0
	; bank, tileset, permission
	db BANK(SafariZoneWardensHome_SecondMapHeader), $5, 3

	; second map header
	dw SafariZoneWardensHome_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db FUCHSIA_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x949a9

Route15FuchsiaGate_MapHeader: ; 0x949a9
	; bank, tileset, permission
	db BANK(Route15FuchsiaGate_SecondMapHeader), $8, 6

	; second map header
	dw Route15FuchsiaGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_15, MUSIC_ROUTE_12, 1, 1
; 0x949b2


MapGroup18:

Route8_MapHeader: ; 0x949b2
	; bank, tileset, permission
	db BANK(Route8_SecondMapHeader), $3, 2

	; second map header
	dw Route8_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_8, MUSIC_ROUTE_3, 0, 1
; 0x949bb

Route12_MapHeader: ; 0x949bb
	; bank, tileset, permission
	db BANK(Route12_SecondMapHeader), $3, 2

	; second map header
	dw Route12_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_12, MUSIC_ROUTE_12, 0, 13
; 0x949c4

Route10South_MapHeader: ; 0x949c4
	; bank, tileset, permission
	db BANK(Route10South_SecondMapHeader), $3, 2

	; second map header
	dw Route10South_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_10, MUSIC_ROUTE_3, 0, 3
; 0x949cd

LavenderTown_MapHeader: ; 0x949cd
	; bank, tileset, permission
	db BANK(LavenderTown_SecondMapHeader), $3, 1

	; second map header
	dw LavenderTown_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 0, 1
; 0x949d6

LavenderPokeCenter1F_MapHeader: ; 0x949d6
	; bank, tileset, permission
	db BANK(LavenderPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw LavenderPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAVENDER_TOWN, MUSIC_POKEMON_CENTER, 1, 1
; 0x949df

LavenderPokeCenter2FBeta_MapHeader: ; 0x949df
	; bank, tileset, permission
	db BANK(LavenderPokeCenter2FBeta_SecondMapHeader), $7, 3

	; second map header
	dw LavenderPokeCenter2FBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAVENDER_TOWN, MUSIC_POKEMON_CENTER, 1, 1
; 0x949e8

MrFujisHouse_MapHeader: ; 0x949e8
	; bank, tileset, permission
	db BANK(MrFujisHouse_SecondMapHeader), $5, 3

	; second map header
	dw MrFujisHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 1, 1
; 0x949f1

LavenderTownSpeechHouse_MapHeader: ; 0x949f1
	; bank, tileset, permission
	db BANK(LavenderTownSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw LavenderTownSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 1, 1
; 0x949fa

LavenderNameRater_MapHeader: ; 0x949fa
	; bank, tileset, permission
	db BANK(LavenderNameRater_SecondMapHeader), $5, 3

	; second map header
	dw LavenderNameRater_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 1, 1
; 0x94a03

LavenderMart_MapHeader: ; 0x94a03
	; bank, tileset, permission
	db BANK(LavenderMart_SecondMapHeader), $c, 3

	; second map header
	dw LavenderMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 1, 1
; 0x94a0c

SoulHouse_MapHeader: ; 0x94a0c
	; bank, tileset, permission
	db BANK(SoulHouse_SecondMapHeader), $5, 3

	; second map header
	dw SoulHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAVENDER_TOWN, MUSIC_LAVENDER_TOWN, 1, 1
; 0x94a15

LavRadioTower1F_MapHeader: ; 0x94a15
	; bank, tileset, permission
	db BANK(LavRadioTower1F_SecondMapHeader), $1b, 3

	; second map header
	dw LavRadioTower1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db LAV_RADIO_TOWER, MUSIC_LAVENDER_TOWN, 1, 1
; 0x94a1e

Route8SaffronGate_MapHeader: ; 0x94a1e
	; bank, tileset, permission
	db BANK(Route8SaffronGate_SecondMapHeader), $8, 6

	; second map header
	dw Route8SaffronGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_8, MUSIC_ROUTE_3, 1, 1
; 0x94a27

Route12SuperRodHouse_MapHeader: ; 0x94a27
	; bank, tileset, permission
	db BANK(Route12SuperRodHouse_SecondMapHeader), $5, 3

	; second map header
	dw Route12SuperRodHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_12, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94a30


MapGroup19:

Route28_MapHeader: ; 0x94a30
	; bank, tileset, permission
	db BANK(Route28_SecondMapHeader), $3, 2

	; second map header
	dw Route28_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_28, MUSIC_INDIGO_PLATEAU, 0, 4
; 0x94a39

SilverCaveOutside_MapHeader: ; 0x94a39
	; bank, tileset, permission
	db BANK(SilverCaveOutside_SecondMapHeader), $3, 1

	; second map header
	dw SilverCaveOutside_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SILVER_CAVE, MUSIC_INDIGO_PLATEAU, 0, 4
; 0x94a42

SilverCavePokeCenter1F_MapHeader: ; 0x94a42
	; bank, tileset, permission
	db BANK(SilverCavePokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw SilverCavePokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SILVER_CAVE, MUSIC_POKEMON_CENTER, 1, 1
; 0x94a4b

Route28FamousSpeechHouse_MapHeader: ; 0x94a4b
	; bank, tileset, permission
	db BANK(Route28FamousSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw Route28FamousSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_28, MUSIC_AZALEA_TOWN, 1, 1
; 0x94a54


MapGroup20:

PokeCenter2F_MapHeader: ; 0x94a54
	; bank, tileset, permission
	db BANK(PokeCenter2F_SecondMapHeader), $7, 3

	; second map header
	dw PokeCenter2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SPECIAL_MAP, MUSIC_POKEMON_CENTER, 17, 1
; 0x94a5d

TradeCenter_MapHeader: ; 0x94a5d
	; bank, tileset, permission
	db BANK(TradeCenter_SecondMapHeader), $8, 3

	; second map header
	dw TradeCenter_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 17, 1
; 0x94a66

Colosseum_MapHeader: ; 0x94a66
	; bank, tileset, permission
	db BANK(Colosseum_SecondMapHeader), $8, 3

	; second map header
	dw Colosseum_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 17, 1
; 0x94a6f

TimeCapsule_MapHeader: ; 0x94a6f
	; bank, tileset, permission
	db BANK(TimeCapsule_SecondMapHeader), $8, 3

	; second map header
	dw TimeCapsule_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 17, 1
; 0x94a78

MobileTradeRoomMobile_MapHeader: ; 0x94a78
	; bank, tileset, permission
	db BANK(MobileTradeRoomMobile_SecondMapHeader), $d, 3

	; second map header
	dw MobileTradeRoomMobile_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 17, 1
; 0x94a81

MobileBattleRoom_MapHeader: ; 0x94a81
	; bank, tileset, permission
	db BANK(MobileBattleRoom_SecondMapHeader), $d, 3

	; second map header
	dw MobileBattleRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SPECIAL_MAP, MUSIC_CHERRYGROVE_CITY, 17, 1
; 0x94a8a


MapGroup21:

Route7_MapHeader: ; 0x94a8a
	; bank, tileset, permission
	db BANK(Route7_SecondMapHeader), $3, 2

	; second map header
	dw Route7_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_7, MUSIC_ROUTE_3, 0, 1
; 0x94a93

Route16_MapHeader: ; 0x94a93
	; bank, tileset, permission
	db BANK(Route16_SecondMapHeader), $3, 2

	; second map header
	dw Route16_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_16, MUSIC_ROUTE_3, 0, 1
; 0x94a9c

Route17_MapHeader: ; 0x94a9c
	; bank, tileset, permission
	db BANK(Route17_SecondMapHeader), $3, 2

	; second map header
	dw Route17_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_17, MUSIC_ROUTE_3, 0, 0
; 0x94aa5

CeladonCity_MapHeader: ; 0x94aa5
	; bank, tileset, permission
	db BANK(CeladonCity_SecondMapHeader), $3, 1

	; second map header
	dw CeladonCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 0, 0
; 0x94aae

CeladonDeptStore1F_MapHeader: ; 0x94aae
	; bank, tileset, permission
	db BANK(CeladonDeptStore1F_SecondMapHeader), $c, 3

	; second map header
	dw CeladonDeptStore1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94ab7

CeladonDeptStore2F_MapHeader: ; 0x94ab7
	; bank, tileset, permission
	db BANK(CeladonDeptStore2F_SecondMapHeader), $c, 3

	; second map header
	dw CeladonDeptStore2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94ac0

CeladonDeptStore3F_MapHeader: ; 0x94ac0
	; bank, tileset, permission
	db BANK(CeladonDeptStore3F_SecondMapHeader), $c, 3

	; second map header
	dw CeladonDeptStore3F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94ac9

CeladonDeptStore4F_MapHeader: ; 0x94ac9
	; bank, tileset, permission
	db BANK(CeladonDeptStore4F_SecondMapHeader), $c, 3

	; second map header
	dw CeladonDeptStore4F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94ad2

CeladonDeptStore5F_MapHeader: ; 0x94ad2
	; bank, tileset, permission
	db BANK(CeladonDeptStore5F_SecondMapHeader), $c, 3

	; second map header
	dw CeladonDeptStore5F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94adb

CeladonDeptStore6F_MapHeader: ; 0x94adb
	; bank, tileset, permission
	db BANK(CeladonDeptStore6F_SecondMapHeader), $c, 3

	; second map header
	dw CeladonDeptStore6F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94ae4

CeladonDeptStoreElevator_MapHeader: ; 0x94ae4
	; bank, tileset, permission
	db BANK(CeladonDeptStoreElevator_SecondMapHeader), $c, 3

	; second map header
	dw CeladonDeptStoreElevator_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94aed

CeladonMansion1F_MapHeader: ; 0x94aed
	; bank, tileset, permission
	db BANK(CeladonMansion1F_SecondMapHeader), $d, 3

	; second map header
	dw CeladonMansion1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94af6

CeladonMansion2F_MapHeader: ; 0x94af6
	; bank, tileset, permission
	db BANK(CeladonMansion2F_SecondMapHeader), $d, 3

	; second map header
	dw CeladonMansion2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94aff

CeladonMansion3F_MapHeader: ; 0x94aff
	; bank, tileset, permission
	db BANK(CeladonMansion3F_SecondMapHeader), $d, 3

	; second map header
	dw CeladonMansion3F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94b08

CeladonMansionRoof_MapHeader: ; 0x94b08
	; bank, tileset, permission
	db BANK(CeladonMansionRoof_SecondMapHeader), $d, 3

	; second map header
	dw CeladonMansionRoof_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94b11

CeladonMansionRoofHouse_MapHeader: ; 0x94b11
	; bank, tileset, permission
	db BANK(CeladonMansionRoofHouse_SecondMapHeader), $5, 3

	; second map header
	dw CeladonMansionRoofHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94b1a

CeladonPokeCenter1F_MapHeader: ; 0x94b1a
	; bank, tileset, permission
	db BANK(CeladonPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw CeladonPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x94b23

CeladonPokeCenter2FBeta_MapHeader: ; 0x94b23
	; bank, tileset, permission
	db BANK(CeladonPokeCenter2FBeta_SecondMapHeader), $7, 3

	; second map header
	dw CeladonPokeCenter2FBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94b2c

CeladonGameCorner_MapHeader: ; 0x94b2c
	; bank, tileset, permission
	db BANK(CeladonGameCorner_SecondMapHeader), $e, 3

	; second map header
	dw CeladonGameCorner_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_GAME_CORNER, 1, 1
; 0x94b35

CeladonGameCornerPrizeRoom_MapHeader: ; 0x94b35
	; bank, tileset, permission
	db BANK(CeladonGameCornerPrizeRoom_SecondMapHeader), $e, 3

	; second map header
	dw CeladonGameCornerPrizeRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94b3e

CeladonGym_MapHeader: ; 0x94b3e
	; bank, tileset, permission
	db BANK(CeladonGym_SecondMapHeader), $11, 3

	; second map header
	dw CeladonGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_GYM, 17, 1
; 0x94b47

CeladonCafe_MapHeader: ; 0x94b47
	; bank, tileset, permission
	db BANK(CeladonCafe_SecondMapHeader), $e, 3

	; second map header
	dw CeladonCafe_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CELADON_CITY, MUSIC_CELADON_CITY, 1, 1
; 0x94b50

Route16FuchsiaSpeechHouse_MapHeader: ; 0x94b50
	; bank, tileset, permission
	db BANK(Route16FuchsiaSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw Route16FuchsiaSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_16, MUSIC_CELADON_CITY, 1, 1
; 0x94b59

Route16Gate_MapHeader: ; 0x94b59
	; bank, tileset, permission
	db BANK(Route16Gate_SecondMapHeader), $8, 6

	; second map header
	dw Route16Gate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_16, MUSIC_ROUTE_3, 1, 1
; 0x94b62

Route7SaffronGate_MapHeader: ; 0x94b62
	; bank, tileset, permission
	db BANK(Route7SaffronGate_SecondMapHeader), $8, 6

	; second map header
	dw Route7SaffronGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_7, MUSIC_ROUTE_3, 1, 1
; 0x94b6b

Route1718Gate_MapHeader: ; 0x94b6b
	; bank, tileset, permission
	db BANK(Route1718Gate_SecondMapHeader), $8, 6

	; second map header
	dw Route1718Gate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_17, MUSIC_ROUTE_3, 1, 1
; 0x94b74


MapGroup22:

Route40_MapHeader: ; 0x94b74
	; bank, tileset, permission
	db BANK(Route40_SecondMapHeader), $1, 2

	; second map header
	dw Route40_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_40, MUSIC_ROUTE_36, 0, 1
; 0x94b7d

Route41_MapHeader: ; 0x94b7d
	; bank, tileset, permission
	db BANK(Route41_SecondMapHeader), $1, 2

	; second map header
	dw Route41_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_41, MUSIC_ROUTE_36, 0, 2
; 0x94b86

CianwoodCity_MapHeader: ; 0x94b86
	; bank, tileset, permission
	db BANK(CianwoodCity_SecondMapHeader), $1, 1

	; second map header
	dw CianwoodCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 0, 1
; 0x94b8f

ManiasHouse_MapHeader: ; 0x94b8f
	; bank, tileset, permission
	db BANK(ManiasHouse_SecondMapHeader), $5, 3

	; second map header
	dw ManiasHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x94b98

CianwoodGym_MapHeader: ; 0x94b98
	; bank, tileset, permission
	db BANK(CianwoodGym_SecondMapHeader), $17, 3

	; second map header
	dw CianwoodGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CIANWOOD_CITY, MUSIC_GYM, 17, 1
; 0x94ba1

CianwoodPokeCenter1F_MapHeader: ; 0x94ba1
	; bank, tileset, permission
	db BANK(CianwoodPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw CianwoodPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CIANWOOD_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x94baa

CianwoodPharmacy_MapHeader: ; 0x94baa
	; bank, tileset, permission
	db BANK(CianwoodPharmacy_SecondMapHeader), $5, 3

	; second map header
	dw CianwoodPharmacy_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x94bb3

CianwoodCityPhotoStudio_MapHeader: ; 0x94bb3
	; bank, tileset, permission
	db BANK(CianwoodCityPhotoStudio_SecondMapHeader), $5, 3

	; second map header
	dw CianwoodCityPhotoStudio_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x94bbc

CianwoodLugiaSpeechHouse_MapHeader: ; 0x94bbc
	; bank, tileset, permission
	db BANK(CianwoodLugiaSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw CianwoodLugiaSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x94bc5

PokeSeersHouse_MapHeader: ; 0x94bc5
	; bank, tileset, permission
	db BANK(PokeSeersHouse_SecondMapHeader), $5, 3

	; second map header
	dw PokeSeersHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CIANWOOD_CITY, MUSIC_ECRUTEAK_CITY, 1, 1
; 0x94bce

BattleTower1F_MapHeader: ; 0x94bce
	; bank, tileset, permission
	db BANK(BattleTower1F_SecondMapHeader), $16, 3

	; second map header
	dw BattleTower1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BATTLE_TOWER, MUSIC_BATTLE_TOWER_LOBBY, 17, 1
; 0x94bd7

BattleTowerBattleRoom_MapHeader: ; 0x94bd7
	; bank, tileset, permission
	db BANK(BattleTowerBattleRoom_SecondMapHeader), $16, 3

	; second map header
	dw BattleTowerBattleRoom_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, 17, 1
; 0x94be0

BattleTowerElevator_MapHeader: ; 0x94be0
	; bank, tileset, permission
	db BANK(BattleTowerElevator_SecondMapHeader), $16, 3

	; second map header
	dw BattleTowerElevator_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BATTLE_TOWER, MUSIC_NONE, 17, 1
; 0x94be9

BattleTowerHallway_MapHeader: ; 0x94be9
	; bank, tileset, permission
	db BANK(BattleTowerHallway_SecondMapHeader), $16, 3

	; second map header
	dw BattleTowerHallway_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, 17, 1
; 0x94bf2

Route40BattleTowerGate_MapHeader: ; 0x94bf2
	; bank, tileset, permission
	db BANK(Route40BattleTowerGate_SecondMapHeader), $8, 6

	; second map header
	dw Route40BattleTowerGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BATTLE_TOWER, MUSIC_ROUTE_36, 1, 1
; 0x94bfb

BattleTowerOutside_MapHeader: ; 0x94bfb
	; bank, tileset, permission
	db BANK(BattleTowerOutside_SecondMapHeader), $4, 2

	; second map header
	dw BattleTowerOutside_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db BATTLE_TOWER, MUSIC_BATTLE_TOWER_THEME, 0, 1
; 0x94c04


MapGroup23:

Route2_MapHeader: ; 0x94c04
	; bank, tileset, permission
	db BANK(Route2_SecondMapHeader), $3, 2

	; second map header
	dw Route2_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_2, MUSIC_ROUTE_2, 0, 1
; 0x94c0d

Route22_MapHeader: ; 0x94c0d
	; bank, tileset, permission
	db BANK(Route22_SecondMapHeader), $3, 2

	; second map header
	dw Route22_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_22, MUSIC_ROUTE_3, 0, 4
; 0x94c16

ViridianCity_MapHeader: ; 0x94c16
	; bank, tileset, permission
	db BANK(ViridianCity_SecondMapHeader), $3, 1

	; second map header
	dw ViridianCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 0, 4
; 0x94c1f

ViridianGym_MapHeader: ; 0x94c1f
	; bank, tileset, permission
	db BANK(ViridianGym_SecondMapHeader), $11, 3

	; second map header
	dw ViridianGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIRIDIAN_CITY, MUSIC_GYM, 17, 1
; 0x94c28

ViridianNicknameSpeechHouse_MapHeader: ; 0x94c28
	; bank, tileset, permission
	db BANK(ViridianNicknameSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw ViridianNicknameSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94c31

TrainerHouse1F_MapHeader: ; 0x94c31
	; bank, tileset, permission
	db BANK(TrainerHouse1F_SecondMapHeader), $5, 3

	; second map header
	dw TrainerHouse1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94c3a

TrainerHouseB1F_MapHeader: ; 0x94c3a
	; bank, tileset, permission
	db BANK(TrainerHouseB1F_SecondMapHeader), $b, 3

	; second map header
	dw TrainerHouseB1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94c43

ViridianMart_MapHeader: ; 0x94c43
	; bank, tileset, permission
	db BANK(ViridianMart_SecondMapHeader), $c, 3

	; second map header
	dw ViridianMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94c4c

ViridianPokeCenter1F_MapHeader: ; 0x94c4c
	; bank, tileset, permission
	db BANK(ViridianPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw ViridianPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIRIDIAN_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x94c55

ViridianPokeCenter2FBeta_MapHeader: ; 0x94c55
	; bank, tileset, permission
	db BANK(ViridianPokeCenter2FBeta_SecondMapHeader), $7, 3

	; second map header
	dw ViridianPokeCenter2FBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db VIRIDIAN_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94c5e

Route2NuggetSpeechHouse_MapHeader: ; 0x94c5e
	; bank, tileset, permission
	db BANK(Route2NuggetSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw Route2NuggetSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_2, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94c67

Route2Gate_MapHeader: ; 0x94c67
	; bank, tileset, permission
	db BANK(Route2Gate_SecondMapHeader), $8, 6

	; second map header
	dw Route2Gate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_2, MUSIC_ROUTE_2, 1, 1
; 0x94c70

VictoryRoadGate_MapHeader: ; 0x94c70
	; bank, tileset, permission
	db BANK(VictoryRoadGate_SecondMapHeader), $8, 6

	; second map header
	dw VictoryRoadGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_26, MUSIC_INDIGO_PLATEAU, 1, 1
; 0x94c79


MapGroup24:

Route26_MapHeader: ; 0x94c79
	; bank, tileset, permission
	db BANK(Route26_SecondMapHeader), $1, 2

	; second map header
	dw Route26_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_26, MUSIC_ROUTE_26, 0, 2
; 0x94c82

Route27_MapHeader: ; 0x94c82
	; bank, tileset, permission
	db BANK(Route27_SecondMapHeader), $1, 2

	; second map header
	dw Route27_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_27, MUSIC_ROUTE_26, 0, 2
; 0x94c8b

Route29_MapHeader: ; 0x94c8b
	; bank, tileset, permission
	db BANK(Route29_SecondMapHeader), $1, 2

	; second map header
	dw Route29_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_29, MUSIC_ROUTE_29, 0, 1
; 0x94c94

NewBarkTown_MapHeader: ; 0x94c94
	; bank, tileset, permission
	db BANK(NewBarkTown_SecondMapHeader), $1, 1

	; second map header
	dw NewBarkTown_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 0, 2
; 0x94c9d

ElmsLab_MapHeader: ; 0x94c9d
	; bank, tileset, permission
	db BANK(ElmsLab_SecondMapHeader), $a, 3

	; second map header
	dw ElmsLab_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db NEW_BARK_TOWN, MUSIC_PROF_ELM, 1, 1
; 0x94ca6

KrissHouse1F_MapHeader: ; 0x94ca6
	; bank, tileset, permission
	db BANK(KrissHouse1F_SecondMapHeader), $6, 3

	; second map header
	dw KrissHouse1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 1, 1
; 0x94caf

KrissHouse2F_MapHeader: ; 0x94caf
	; bank, tileset, permission
	db BANK(KrissHouse2F_SecondMapHeader), $14, 3

	; second map header
	dw KrissHouse2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 1, 1
; 0x94cb8

KrissNeighborsHouse_MapHeader: ; 0x94cb8
	; bank, tileset, permission
	db BANK(KrissNeighborsHouse_SecondMapHeader), $5, 3

	; second map header
	dw KrissNeighborsHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 1, 1
; 0x94cc1

ElmsHouse_MapHeader: ; 0x94cc1
	; bank, tileset, permission
	db BANK(ElmsHouse_SecondMapHeader), $6, 3

	; second map header
	dw ElmsHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db NEW_BARK_TOWN, MUSIC_NEW_BARK_TOWN, 1, 1
; 0x94cca

Route26HealSpeechHouse_MapHeader: ; 0x94cca
	; bank, tileset, permission
	db BANK(Route26HealSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw Route26HealSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_26, MUSIC_AZALEA_TOWN, 1, 1
; 0x94cd3

Route26DayofWeekSiblingsHouse_MapHeader: ; 0x94cd3
	; bank, tileset, permission
	db BANK(Route26DayofWeekSiblingsHouse_SecondMapHeader), $5, 3

	; second map header
	dw Route26DayofWeekSiblingsHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_26, MUSIC_AZALEA_TOWN, 1, 1
; 0x94cdc

Route27SandstormHouse_MapHeader: ; 0x94cdc
	; bank, tileset, permission
	db BANK(Route27SandstormHouse_SecondMapHeader), $5, 3

	; second map header
	dw Route27SandstormHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_27, MUSIC_AZALEA_TOWN, 1, 1
; 0x94ce5

Route2946Gate_MapHeader: ; 0x94ce5
	; bank, tileset, permission
	db BANK(Route2946Gate_SecondMapHeader), $8, 6

	; second map header
	dw Route2946Gate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_29, MUSIC_ROUTE_29, 1, 1
; 0x94cee


MapGroup25:

Route5_MapHeader: ; 0x94cee
	; bank, tileset, permission
	db BANK(Route5_SecondMapHeader), $3, 2

	; second map header
	dw Route5_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_5, MUSIC_ROUTE_3, 0, 1
; 0x94cf7

SaffronCity_MapHeader: ; 0x94cf7
	; bank, tileset, permission
	db BANK(SaffronCity_SecondMapHeader), $3, 1

	; second map header
	dw SaffronCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 0, 1
; 0x94d00

FightingDojo_MapHeader: ; 0x94d00
	; bank, tileset, permission
	db BANK(FightingDojo_SecondMapHeader), $11, 3

	; second map header
	dw FightingDojo_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94d09

SaffronGym_MapHeader: ; 0x94d09
	; bank, tileset, permission
	db BANK(SaffronGym_SecondMapHeader), $1c, 3

	; second map header
	dw SaffronGym_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_GYM, 17, 1
; 0x94d12

SaffronMart_MapHeader: ; 0x94d12
	; bank, tileset, permission
	db BANK(SaffronMart_SecondMapHeader), $c, 3

	; second map header
	dw SaffronMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94d1b

SaffronPokeCenter1F_MapHeader: ; 0x94d1b
	; bank, tileset, permission
	db BANK(SaffronPokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw SaffronPokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x94d24

SaffronPokeCenter2FBeta_MapHeader: ; 0x94d24
	; bank, tileset, permission
	db BANK(SaffronPokeCenter2FBeta_SecondMapHeader), $7, 3

	; second map header
	dw SaffronPokeCenter2FBeta_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94d2d

MrPsychicsHouse_MapHeader: ; 0x94d2d
	; bank, tileset, permission
	db BANK(MrPsychicsHouse_SecondMapHeader), $5, 3

	; second map header
	dw MrPsychicsHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94d36

SaffronTrainStation_MapHeader: ; 0x94d36
	; bank, tileset, permission
	db BANK(SaffronTrainStation_SecondMapHeader), $11, 3

	; second map header
	dw SaffronTrainStation_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94d3f

SilphCo1F_MapHeader: ; 0x94d3f
	; bank, tileset, permission
	db BANK(SilphCo1F_SecondMapHeader), $b, 3

	; second map header
	dw SilphCo1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94d48

CopycatsHouse1F_MapHeader: ; 0x94d48
	; bank, tileset, permission
	db BANK(CopycatsHouse1F_SecondMapHeader), $6, 3

	; second map header
	dw CopycatsHouse1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94d51

CopycatsHouse2F_MapHeader: ; 0x94d51
	; bank, tileset, permission
	db BANK(CopycatsHouse2F_SecondMapHeader), $6, 3

	; second map header
	dw CopycatsHouse2F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db SAFFRON_CITY, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94d5a

Route5UndergroundEntrance_MapHeader: ; 0x94d5a
	; bank, tileset, permission
	db BANK(Route5UndergroundEntrance_SecondMapHeader), $8, 6

	; second map header
	dw Route5UndergroundEntrance_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_5, MUSIC_ROUTE_3, 1, 1
; 0x94d63

Route5SaffronCityGate_MapHeader: ; 0x94d63
	; bank, tileset, permission
	db BANK(Route5SaffronCityGate_SecondMapHeader), $8, 6

	; second map header
	dw Route5SaffronCityGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_5, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94d6c

Route5CleanseTagSpeechHouse_MapHeader: ; 0x94d6c
	; bank, tileset, permission
	db BANK(Route5CleanseTagSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw Route5CleanseTagSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_5, MUSIC_VIRIDIAN_CITY, 1, 1
; 0x94d75


MapGroup26:

Route30_MapHeader: ; 0x94d75
	; bank, tileset, permission
	db BANK(Route30_SecondMapHeader), $1, 2

	; second map header
	dw Route30_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_30, MUSIC_ROUTE_30, 0, 4
; 0x94d7e

Route31_MapHeader: ; 0x94d7e
	; bank, tileset, permission
	db BANK(Route31_SecondMapHeader), $1, 2

	; second map header
	dw Route31_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_31, MUSIC_ROUTE_30, 0, 4
; 0x94d87

CherrygroveCity_MapHeader: ; 0x94d87
	; bank, tileset, permission
	db BANK(CherrygroveCity_SecondMapHeader), $1, 1

	; second map header
	dw CherrygroveCity_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 0, 1
; 0x94d90

CherrygroveMart_MapHeader: ; 0x94d90
	; bank, tileset, permission
	db BANK(CherrygroveMart_SecondMapHeader), $c, 3

	; second map header
	dw CherrygroveMart_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 1, 1
; 0x94d99

CherrygrovePokeCenter1F_MapHeader: ; 0x94d99
	; bank, tileset, permission
	db BANK(CherrygrovePokeCenter1F_SecondMapHeader), $7, 3

	; second map header
	dw CherrygrovePokeCenter1F_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CHERRYGROVE_CITY, MUSIC_POKEMON_CENTER, 1, 1
; 0x94da2

CherrygroveGymSpeechHouse_MapHeader: ; 0x94da2
	; bank, tileset, permission
	db BANK(CherrygroveGymSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw CherrygroveGymSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 1, 1
; 0x94dab

GuideGentsHouse_MapHeader: ; 0x94dab
	; bank, tileset, permission
	db BANK(GuideGentsHouse_SecondMapHeader), $5, 3

	; second map header
	dw GuideGentsHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 1, 1
; 0x94db4

CherrygroveEvolutionSpeechHouse_MapHeader: ; 0x94db4
	; bank, tileset, permission
	db BANK(CherrygroveEvolutionSpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw CherrygroveEvolutionSpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db CHERRYGROVE_CITY, MUSIC_CHERRYGROVE_CITY, 1, 1
; 0x94dbd

Route30BerrySpeechHouse_MapHeader: ; 0x94dbd
	; bank, tileset, permission
	db BANK(Route30BerrySpeechHouse_SecondMapHeader), $5, 3

	; second map header
	dw Route30BerrySpeechHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_30, MUSIC_CHERRYGROVE_CITY, 1, 1
; 0x94dc6

MrPokemonsHouse_MapHeader: ; 0x94dc6
	; bank, tileset, permission
	db BANK(MrPokemonsHouse_SecondMapHeader), $b, 3

	; second map header
	dw MrPokemonsHouse_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_30, MUSIC_CHERRYGROVE_CITY, 1, 1
; 0x94dcf

Route31VioletGate_MapHeader: ; 0x94dcf
	; bank, tileset, permission
	db BANK(Route31VioletGate_SecondMapHeader), $8, 6

	; second map header
	dw Route31VioletGate_SecondMapHeader

	; location on world map, music, time of day, fishing group
	db ROUTE_31, MUSIC_ROUTE_30, 1, 1
; 0x94dd8


