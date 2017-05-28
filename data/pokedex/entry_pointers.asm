GetDexEntryPointer: ; 44333
; return dex entry pointer b:de
	push hl
	ld hl, PokedexDataPointerTable
	ld a, b
	dec a
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	rlca
	rlca
	and $3
	ld hl, .PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld b, [hl]
	pop de
	pop hl
	ret

.PokedexEntryBanks: ; 44351

GLOBAL PokedexEntries1
GLOBAL PokedexEntries2
GLOBAL PokedexEntries3
GLOBAL PokedexEntries4

	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)

GetDexEntryPagePointer: ; 44355
	call GetDexEntryPointer ; b:de
	push hl
	ld h, d
	ld l, e
; skip species name
.loop1
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1
; skip height and weight
rept 4
	inc hl
endr
; if c != 1: skip entry
	dec c
	jr z, .done
; skip entry
.loop2
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop2

.done
	ld d, h
	ld e, l
	pop hl
	ret

PokedexDataPointerTable: ; 0x44378
; Pointers to all the Pokedex entries.

	dw BulbasaurPokedexEntry
	dw IvysaurPokedexEntry
	dw VenusaurPokedexEntry
	dw CharmanderPokedexEntry
	dw CharmeleonPokedexEntry
	dw CharizardPokedexEntry
	dw SquirtlePokedexEntry
	dw WartortlePokedexEntry
	dw BlastoisePokedexEntry
	dw CaterpiePokedexEntry
	dw MetapodPokedexEntry
	dw ButterfreePokedexEntry
	dw WeedlePokedexEntry
	dw KakunaPokedexEntry
	dw BeedrillPokedexEntry
	dw PidgeyPokedexEntry
	dw PidgeottoPokedexEntry
	dw PidgeotPokedexEntry
	dw RattataPokedexEntry
	dw RaticatePokedexEntry
	dw SpearowPokedexEntry
	dw FearowPokedexEntry
	dw EkansPokedexEntry
	dw ArbokPokedexEntry
	dw PikachuPokedexEntry
	dw RaichuPokedexEntry
	dw SandshrewPokedexEntry
	dw SandslashPokedexEntry
	dw NidoranFPokedexEntry
	dw NidorinaPokedexEntry
	dw NidoqueenPokedexEntry
	dw NidoranMPokedexEntry
	dw NidorinoPokedexEntry
	dw NidokingPokedexEntry
	dw ClefairyPokedexEntry
	dw ClefablePokedexEntry
	dw VulpixPokedexEntry
	dw NinetalesPokedexEntry
	dw JigglypuffPokedexEntry
	dw WigglytuffPokedexEntry
	dw ZubatPokedexEntry
	dw GolbatPokedexEntry
	dw OddishPokedexEntry
	dw GloomPokedexEntry
	dw VileplumePokedexEntry
	dw ParasPokedexEntry
	dw ParasectPokedexEntry
	dw VenonatPokedexEntry
	dw VenomothPokedexEntry
	dw DiglettPokedexEntry
	dw DugtrioPokedexEntry
	dw MeowthPokedexEntry
	dw PersianPokedexEntry
	dw PsyduckPokedexEntry
	dw GolduckPokedexEntry
	dw MankeyPokedexEntry
	dw PrimeapePokedexEntry
	dw GrowlithePokedexEntry
	dw ArcaninePokedexEntry
	dw PoliwagPokedexEntry
	dw PoliwhirlPokedexEntry
	dw PoliwrathPokedexEntry
	dw AbraPokedexEntry
	dw KadabraPokedexEntry
	dw AlakazamPokedexEntry
	dw MachopPokedexEntry
	dw MachokePokedexEntry
	dw MachampPokedexEntry
	dw BellsproutPokedexEntry
	dw WeepinbellPokedexEntry
	dw VictreebelPokedexEntry
	dw TentacoolPokedexEntry
	dw TentacruelPokedexEntry
	dw GeodudePokedexEntry
	dw GravelerPokedexEntry
	dw GolemPokedexEntry
	dw PonytaPokedexEntry
	dw RapidashPokedexEntry
	dw SlowpokePokedexEntry
	dw SlowbroPokedexEntry
	dw MagnemitePokedexEntry
	dw MagnetonPokedexEntry
	dw FarfetchDPokedexEntry
	dw DoduoPokedexEntry
	dw DodrioPokedexEntry
	dw SeelPokedexEntry
	dw DewgongPokedexEntry
	dw GrimerPokedexEntry
	dw MukPokedexEntry
	dw ShellderPokedexEntry
	dw CloysterPokedexEntry
	dw GastlyPokedexEntry
	dw HaunterPokedexEntry
	dw GengarPokedexEntry
	dw OnixPokedexEntry
	dw DrowzeePokedexEntry
	dw HypnoPokedexEntry
	dw KrabbyPokedexEntry
	dw KinglerPokedexEntry
	dw VoltorbPokedexEntry
	dw ElectrodePokedexEntry
	dw ExeggcutePokedexEntry
	dw ExeggutorPokedexEntry
	dw CubonePokedexEntry
	dw MarowakPokedexEntry
	dw HitmonleePokedexEntry
	dw HitmonchanPokedexEntry
	dw LickitungPokedexEntry
	dw KoffingPokedexEntry
	dw WeezingPokedexEntry
	dw RhyhornPokedexEntry
	dw RhydonPokedexEntry
	dw ChanseyPokedexEntry
	dw TangelaPokedexEntry
	dw KangaskhanPokedexEntry
	dw HorseaPokedexEntry
	dw SeadraPokedexEntry
	dw GoldeenPokedexEntry
	dw SeakingPokedexEntry
	dw StaryuPokedexEntry
	dw StarmiePokedexEntry
	dw MrMimePokedexEntry
	dw ScytherPokedexEntry
	dw JynxPokedexEntry
	dw ElectabuzzPokedexEntry
	dw MagmarPokedexEntry
	dw PinsirPokedexEntry
	dw TaurosPokedexEntry
	dw MagikarpPokedexEntry
	dw GyaradosPokedexEntry
	dw LaprasPokedexEntry
	dw DittoPokedexEntry
	dw EeveePokedexEntry
	dw VaporeonPokedexEntry
	dw JolteonPokedexEntry
	dw FlareonPokedexEntry
	dw PorygonPokedexEntry
	dw OmanytePokedexEntry
	dw OmastarPokedexEntry
	dw KabutoPokedexEntry
	dw KabutopsPokedexEntry
	dw AerodactylPokedexEntry
	dw SnorlaxPokedexEntry
	dw ArticunoPokedexEntry
	dw ZapdosPokedexEntry
	dw MoltresPokedexEntry
	dw DratiniPokedexEntry
	dw DragonairPokedexEntry
	dw DragonitePokedexEntry
	dw MewtwoPokedexEntry
	dw MewPokedexEntry
	dw ChikoritaPokedexEntry
	dw BayleefPokedexEntry
	dw MeganiumPokedexEntry
	dw CyndaquilPokedexEntry
	dw QuilavaPokedexEntry
	dw TyphlosionPokedexEntry
	dw TotodilePokedexEntry
	dw CroconawPokedexEntry
	dw FeraligatrPokedexEntry
	dw SentretPokedexEntry
	dw FurretPokedexEntry
	dw HoothootPokedexEntry
	dw NoctowlPokedexEntry
	dw LedybaPokedexEntry
	dw LedianPokedexEntry
	dw SpinarakPokedexEntry
	dw AriadosPokedexEntry
	dw CrobatPokedexEntry
	dw ChinchouPokedexEntry
	dw LanturnPokedexEntry
	dw PichuPokedexEntry
	dw CleffaPokedexEntry
	dw IgglybuffPokedexEntry
	dw TogepiPokedexEntry
	dw TogeticPokedexEntry
	dw NatuPokedexEntry
	dw XatuPokedexEntry
	dw MareepPokedexEntry
	dw FlaaffyPokedexEntry
	dw AmpharosPokedexEntry
	dw BellossomPokedexEntry
	dw MarillPokedexEntry
	dw AzumarillPokedexEntry
	dw SudowoodoPokedexEntry
	dw PolitoedPokedexEntry
	dw HoppipPokedexEntry
	dw SkiploomPokedexEntry
	dw JumpluffPokedexEntry
	dw AipomPokedexEntry
	dw SunkernPokedexEntry
	dw SunfloraPokedexEntry
	dw YanmaPokedexEntry
	dw WooperPokedexEntry
	dw QuagsirePokedexEntry
	dw EspeonPokedexEntry
	dw UmbreonPokedexEntry
	dw MurkrowPokedexEntry
	dw SlowkingPokedexEntry
	dw MisdreavusPokedexEntry
	dw UnownPokedexEntry
	dw WobbuffetPokedexEntry
	dw GirafarigPokedexEntry
	dw PinecoPokedexEntry
	dw ForretressPokedexEntry
	dw DunsparcePokedexEntry
	dw GligarPokedexEntry
	dw SteelixPokedexEntry
	dw SnubbullPokedexEntry
	dw GranbullPokedexEntry
	dw QwilfishPokedexEntry
	dw ScizorPokedexEntry
	dw ShucklePokedexEntry
	dw HeracrossPokedexEntry
	dw SneaselPokedexEntry
	dw TeddiursaPokedexEntry
	dw UrsaringPokedexEntry
	dw SlugmaPokedexEntry
	dw MagcargoPokedexEntry
	dw SwinubPokedexEntry
	dw PiloswinePokedexEntry
	dw CorsolaPokedexEntry
	dw RemoraidPokedexEntry
	dw OctilleryPokedexEntry
	dw DelibirdPokedexEntry
	dw MantinePokedexEntry
	dw SkarmoryPokedexEntry
	dw HoundourPokedexEntry
	dw HoundoomPokedexEntry
	dw KingdraPokedexEntry
	dw PhanpyPokedexEntry
	dw DonphanPokedexEntry
	dw Porygon2PokedexEntry
	dw StantlerPokedexEntry
	dw SmearglePokedexEntry
	dw TyroguePokedexEntry
	dw HitmontopPokedexEntry
	dw SmoochumPokedexEntry
	dw ElekidPokedexEntry
	dw MagbyPokedexEntry
	dw MiltankPokedexEntry
	dw BlisseyPokedexEntry
	dw RaikouPokedexEntry
	dw EnteiPokedexEntry
	dw SuicunePokedexEntry
	dw LarvitarPokedexEntry
	dw PupitarPokedexEntry
	dw TyranitarPokedexEntry
	dw LugiaPokedexEntry
	dw HoOhPokedexEntry
	dw CelebiPokedexEntry
