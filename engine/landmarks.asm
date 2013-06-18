GetLandmarkCoords: ; 0x1ca896
; given a landmark id in e, return the y coord in d, and the x coord in e.
	push hl
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Landmarks
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret


GetLandmarkName: ; 0x1ca8a5
; given a landmark id in e, copy its name to $d073.
	push hl
	push de
	push bc
	ld l, e
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, Landmarks + 2 ; skip the coordinates, we only want the string
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $d073
	ld c, 18
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop bc
	pop de
	pop hl
	ret

Landmarks: ; 0x1ca8c3
;db x coord, y coord
;dw pointer to name 
	db 0,0
	dw SpecialMapString

	db 148,116
	dw NewBarkString

	db 136,116
	dw Route29String

	db 108,116
	dw CherrygroveString

	db 108,96
	dw Route30String

	db 104,76
	dw Route31String

	db 92,76
	dw VioletString

	db 93,74
	dw SproutString

	db 92,108
	dw Route32String

	db 84,92
	dw RuinsString

	db 92,140
	dw UnionString

	db 90,140
	dw Route33String

	db 76,140
	dw AzaleaString

	db 78,138
	dw WellString

	db 60,136
	dw IlexString

	db 60,128
	dw Route34String

	db 60,108
	dw GoldenrodString

	db 58,108
	dw RadioTowerString

	db 60,92
	dw Route35String

	db 60,76
	dw ParkString

	db 72,76
	dw Route36String

	db 76,68
	dw Route37String

	db 76,60
	dw EcruteakString

	db 78,58
	dw TinString

	db 74,58
	dw BurnedTowerString

	db 60,60
	dw Route38String

	db 44,64
	dw Route39String

	db 44,76
	dw OlivineString

	db 46,78
	dw LighthouseString

	db 36,72
	dw BattleTowerString

	db 36,80
	dw Route40String

	db 36,108
	dw WhirlString

	db 36,116
	dw Route41String

	db 28,116
	dw CianwoodString

	db 100,60
	dw Route42String

	db 92,60
	dw MortarString

	db 116,60
	dw MahoganyString

	db 116,52
	dw Route43String

	db 116,44
	dw LakeString

	db 128,60
	dw Route44String

	db 138,54
	dw PathString

	db 140,60
	dw BlackthornString

	db 140,52
	dw DenString

	db 140,80
	dw Route45String

	db 120,88
	dw DarkString

	db 132,104
	dw Route46String

	db 156,84
	dw SilverCaveString

	db 60,124
	dw PalletString

	db 60,108
	dw Route1String

	db 60,92
	dw ViridianString

	db 60,80
	dw Route2String

	db 60,68
	dw PewterString

	db 72,68
	dw Route3String

	db 84,68
	dw MoonString

	db 96,68
	dw Route4String

	db 108,68
	dw CeruleanString

	db 108,60
	dw Route24String

	db 116,52
	dw Route25String

	db 108,76
	dw Route5String

	db 116,92
	dw UndergroundString

	db 108,92
	dw Route6String

	db 108,100
	dw VermilionString

	db 96,76
	dw DiglettsCaveString

	db 96,84
	dw Route7String

	db 124,84
	dw Route8String

	db 124,68
	dw Route9String

	db 140,68
	dw TunnelString

	db 140,72
	dw Route10String

	db 140,76
	dw PlantString

	db 140,84
	dw LavenderString

	db 148,84
	dw LavTowerString

	db 84,84
	dw CeladonString

	db 108,84
	dw SaffronString

	db 124,100
	dw Route11String

	db 140,96
	dw Route12String

	db 132,116
	dw Route13String

	db 124,128
	dw Route14String

	db 112,132
	dw Route15String

	db 76,84
	dw Route16String

	db 76,108
	dw Route17String

	db 88,132
	dw Route18String

	db 100,132
	dw FuchsiaString

	db 100,144
	dw Route19String

	db 84,148
	dw Route20String

	db 76,148
	dw SeafoamString

	db 60,148
	dw CinnabarString

	db 60,136
	dw Route21String

	db 44,84
	dw Route22String

	db 36,68
	dw RoadString

	db 36,60
	dw Route23String

	db 36,52
	dw IndigoString

	db 36,108
	dw Route26String

	db 28,116
	dw Route27String

	db 20,116
	dw FallsString

	db 28,84
	dw Route28String

	db 148,132
	dw AquaString

NewBarkString:
	db "NEW BARK",$1F,"TOWN@"
CherrygroveString:
	db "CHERRYGROVE",$1F,"CITY@"
VioletString:
	db "VIOLET CITY@"
AzaleaString:
	db "AZALEA TOWN@"
GoldenrodString:
	db "GOLDENROD",$1F,"CITY@"
EcruteakString:
	db "ECRUTEAK",$1F,"CITY@"
OlivineString:
	db "OLIVINE",$1F,"CITY@"
CianwoodString:
	db "CIANWOOD",$1F,"CITY@"
MahoganyString:
	db "MAHOGANY",$1F,"TOWN@"
BlackthornString:
	db "BLACKTHORN",$1F,"CITY@"
LakeString:
	db "LAKE OF",$1F,"RAGE@"
SilverCaveString:
	db "SILVER CAVE@"
SproutString:
	db "SPROUT",$1F,"TOWER@"
RuinsString:
	db "RUINS",$1F,"OF ALPH@"
UnionString:
	db "UNION CAVE@"
WellString:
	db "SLOWPOKE",$1F,"WELL@"
RadioTowerString:
	db "RADIO TOWER@"
PlantString:
	db "POWER PLANT@"
ParkString:
	db "NATIONAL",$1F,"PARK@"
TinString:
	db "TIN TOWER@"
LighthouseString:
	db "LIGHTHOUSE@"
WhirlString:
	db "WHIRL",$1F,"ISLANDS@"
MortarString:
	db "MT.MORTAR@"
DenString:
	db "DRAGON'S",$1F,"DEN@"
PathString:
	db "ICE PATH@"
NotApplicableString:
	db "N/A@"
PalletString:
	db "PALLET TOWN@"
ViridianString:
	db "VIRIDIAN",$1F,"CITY@"
PewterString:
	db "PEWTER CITY@"
CeruleanString:
	db "CERULEAN",$1F,"CITY@"
LavenderString:
	db "LAVENDER",$1F,"TOWN@"
VermilionString:
	db "VERMILION",$1F,"CITY@"
CeladonString:
	db "CELADON",$1F,"CITY@"
SaffronString:
	db "SAFFRON",$1F,"CITY@"
FuchsiaString:
	db "FUCHSIA",$1F,"CITY@"
CinnabarString:
	db "CINNABAR",$1F,"ISLAND@"
IndigoString:
	db "INDIGO",$1F,"PLATEAU@"
RoadString:
	db "VICTORY",$1F,"ROAD@"
MoonString:
	db "MT.MOON@"
TunnelString:
	db "ROCK TUNNEL@"
LavTowerString:
	db "LAV",$1F,"RADIO TOWER@"
SilphString:
	db "SILPH CO.@"
ZoneString:
	db "SAFARI ZONE@"
SeafoamString:
	db "SEAFOAM",$1F,"ISLANDS@"
MansionString:
	db "#MON",$1F,"MANSION@"
DungeonString:
	db "CERULEAN",$1F,"CAVE@"
Route1String:
	db "ROUTE 1@"
Route2String:
	db "ROUTE 2@"
Route3String:
	db "ROUTE 3@"
Route4String:
	db "ROUTE 4@"
Route5String:
	db "ROUTE 5@"
Route6String:
	db "ROUTE 6@"
Route7String:
	db "ROUTE 7@"
Route8String:
	db "ROUTE 8@"
Route9String:
	db "ROUTE 9@"
Route10String:
	db "ROUTE 10@"
Route11String:
	db "ROUTE 11@"
Route12String:
	db "ROUTE 12@"
Route13String:
	db "ROUTE 13@"
Route14String:
	db "ROUTE 14@"
Route15String:
	db "ROUTE 15@"
Route16String:
	db "ROUTE 16@"
Route17String:
	db "ROUTE 17@"
Route18String:
	db "ROUTE 18@"
Route19String:
	db "ROUTE 19@"
Route20String:
	db "ROUTE 20@"
Route21String:
	db "ROUTE 21@"
Route22String:
	db "ROUTE 22@"
Route23String:
	db "ROUTE 23@"
Route24String:
	db "ROUTE 24@"
Route25String:
	db "ROUTE 25@"
Route26String:
	db "ROUTE 26@"
Route27String:
	db "ROUTE 27@"
Route28String:
	db "ROUTE 28@"
Route29String:
	db "ROUTE 29@"
Route30String:
	db "ROUTE 30@"
Route31String:
	db "ROUTE 31@"
Route32String:
	db "ROUTE 32@"
Route33String:
	db "ROUTE 33@"
Route34String:
	db "ROUTE 34@"
Route35String:
	db "ROUTE 35@"
Route36String:
	db "ROUTE 36@"
Route37String:
	db "ROUTE 37@"
Route38String:
	db "ROUTE 38@"
Route39String:
	db "ROUTE 39@"
Route40String:
	db "ROUTE 40@"
Route41String:
	db "ROUTE 41@"
Route42String:
	db "ROUTE 42@"
Route43String:
	db "ROUTE 43@"
Route44String:
	db "ROUTE 44@"
Route45String:
	db "ROUTE 45@"
Route46String:
	db "ROUTE 46@"
DarkString:
	db "DARK CAVE@"
IlexString:
	db "ILEX",$1F,"FOREST@"
BurnedTowerString:
	db "BURNED",$1F,"TOWER@"
AquaString:
	db "FAST SHIP@"
ViridianForestString:
	db "VIRIDIAN",$1F,"FOREST@"
DiglettsCaveString:
	db "DIGLETT'S",$1F,"CAVE@"
FallsString:
	db "TOHJO FALLS@"
UndergroundString:
	db "UNDERGROUND@"
BattleTowerString:
	db "BATTLE",$1F,"TOWER@"
SpecialMapString:
	db "SPECIAL@"

