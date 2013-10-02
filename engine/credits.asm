SATOSHI_TAJIRI       EQU 00
JUNICHI_MASUDA       EQU 01
TETSUYA_WATANABE     EQU 02
SHIGEKI_MORIMOTO     EQU 03
SOUSUKE_TAMADA       EQU 04
TAKENORI_OOTA        EQU 05
KEN_SUGIMORI         EQU 06
MOTOFUMI_FUJIWARA    EQU 07
ATSUKO_NISHIDA       EQU 08
MUNEO_SAITO          EQU 09
SATOSHI_OOTA         EQU 10
RENA_YOSHIKAWA       EQU 11
JUN_OKUTANI          EQU 12
HIRONOBU_YOSHIDA     EQU 13
ASUKA_IWASHITA       EQU 14
GO_ICHINOSE          EQU 15
MORIKAZU_AOKI        EQU 16
KOHJI_NISHINO        EQU 17
KENJI_MATSUSHIMA     EQU 18
TOSHINOBU_MATSUMIYA  EQU 19
SATORU_IWATA         EQU 20
NOBUHIRO_SEYA        EQU 21
KAZUHITO_SEKINE      EQU 22
TETSUJI_OOTA         EQU 23
NCL_SUPER_MARIO_CLUB EQU 24
SARUGAKUCHO          EQU 25
AKITO_MORI           EQU 26
TAKAHIRO_HARADA      EQU 27
TOHRU_HASHIMOTO      EQU 28
NOBORU_MATSUMOTO     EQU 29
TAKEHIRO_IZUSHI      EQU 30
TAKASHI_KAWAGUCHI    EQU 31
TSUNEKAZU_ISHIHARA   EQU 32
HIROSHI_YAMAUCHI     EQU 33
KENJI_SAIKI          EQU 34
ATSUSHI_TADA         EQU 35
NAOKO_KAWAKAMI       EQU 36
HIROYUKI_ZINNAI      EQU 37
KUNIMI_KAWAMURA      EQU 38
HISASHI_SOGABE       EQU 39
KEITA_KAGAYA         EQU 40
YOSHINORI_MATSUDA    EQU 41
HITOMI_SATO          EQU 42
TORU_OSAWA           EQU 43
TAKAO_OHARA          EQU 44
YUICHIRO_ITO         EQU 45
TAKAO_SHIMIZU        EQU 46
PLANNING             EQU 47
KEITA_NAKAMURA       EQU 48
HIROTAKA_UEMURA      EQU 49
HIROAKI_TAMURA       EQU 50
NORIAKI_SAKAGUCHI    EQU 51
MIYUKI_SATO          EQU 52
GAKUZI_NOMOTO        EQU 53
AI_MASHIMA           EQU 54
MIKIHIRO_ISHIKAWA    EQU 55
HIDEYUKI_HASHIMOTO   EQU 56
SATOSHI_YAMATO       EQU 57
SHIGERU_MIYAMOTO     EQU 58
GAIL_TILDEN          EQU 59
NOB_OGASAWARA        EQU 60
SETH_MCMAHILL        EQU 61
HIROTO_ALEXANDER     EQU 62
TERESA_LILLYGREN     EQU 63
THOMAS_HERTZOG       EQU 64
ERIK_JOHNSON         EQU 65
HIRO_NAKAMURA        EQU 66
TERUKI_MURAKAWA      EQU 67
KAZUYOSHI_OSAWA      EQU 68
KIMIKO_NAKAMICHI     EQU 69
END                  EQU 70
CREDITS_UNKNOWN      EQU 71
STAFF                EQU 72
DIRECTOR             EQU 73
CODIRECTOR           EQU 74
PROGRAMMERS          EQU 75
GRAPHICS_DIRECTOR    EQU 76
MONSTER_DESIGN       EQU 77
GRAPHICS_DESIGN      EQU 78
MUSIC                EQU 79
SOUND_EFFECTS        EQU 80
GAME_DESIGN          EQU 81
GAME_SCENARIO        EQU 82
TOOL_PROGRAMMING     EQU 83
PARAMETRIC_DESIGN    EQU 84
SCRIPT_DESIGN        EQU 85
MAP_DATA_DESIGN      EQU 86
MAP_DESIGN           EQU 87
PRODUCT_TESTING      EQU 88
SPECIAL_THANKS       EQU 89
PRODUCERS            EQU 90
EXECUTIVE_PRODUCER   EQU 91
POKEMON_ANIMATION    EQU 92
POKEDEX_TEXT         EQU 93
MOBILE_PRJ_LEADER    EQU 94
MOBILE_SYSTEM_AD     EQU 95
MOBILE_STADIUM_DIR   EQU 96
COORDINATION         EQU 97
COPYRIGHT            EQU 98
US_VERSION_STAFF     EQU 99
US_COORDINATION      EQU 100
TEXT_TRANSLATION     EQU 101
PAAD_TESTING         EQU 102

CREDITS_THEEND       EQU $f9
CREDITS_WAIT2        EQU $fa
CREDITS_MUSIC        EQU $fb
CREDITS_CLEAR        EQU $fc
CREDITS_SCENE        EQU $fd
CREDITS_WAIT         EQU $fe


ParseCredits: ; 1099aa
	ld hl, $cf63
	bit 7, [hl]
	jp nz, .done
	
; Wait until the timer has run out to parse the next command.
	ld hl, CreditsTimer
	ld a, [hl]
	and a
	jr z, .parse
	
; One tick has passed.
	dec [hl]
	jp .done
	
.parse
; First, let's clear the current text display,
; starting from line 5.
	xor a
	ld [$ffd4], a
	hlcoord 0, 5
	ld bc, 20 * 12
	ld a, " "
	call ByteFill
	
; Then read the script.
	
.loop
	call .get
	
; Commands:
	cp $ff
	jp z, .end
	cp CREDITS_WAIT
	jr z, .wait
	cp CREDITS_SCENE
	jr z, .scene
	cp CREDITS_CLEAR
	jr z, .clear
	cp CREDITS_MUSIC
	jr z, .music
	cp CREDITS_WAIT2
	jr z, .wait2
	cp CREDITS_THEEND
	jr z, .theend
	
; If it's not a command, it's a string identifier.
	
	push af
	ld e, a
	ld d, 0
	ld hl, CreditsStrings
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop af
	
; Strings spanning multiple lines have special cases.
	
	cp COPYRIGHT
	jr z, .copyright
	
	cp STAFF
	jr c, .staff
	
; The rest start from line 6.

	hlcoord 0, 6
	jr .print
	
.copyright
	hlcoord 2, 6
	jr .print
	
.staff
	hlcoord 0, 6
	
.print
; Print strings spaced every two lines.
	call .get
	ld bc, 20 * 2
	call AddNTimes
	call PlaceString
	jr .loop
	
.theend
; Display "The End" graphic.
	call $5c11
	jr .loop
	
.scene
; Update the scene number and corresponding palette.
	call .get
	ld [$cf65], a ; scene
	xor a
	ld [$cf64], a ; frame
	call GetCreditsPalette
	call $32f9 ; update hw pal registers
	jr .loop
	
.clear
; Clear the banner.
	ld a, $ff
	ld [$cf64], a ; frame
	jr .loop
	
.music
; Play the credits music.
	ld de, MUSIC_CREDITS
	push de
	ld de, MUSIC_NONE
	call StartMusic
	call DelayFrame
	pop de
	call StartMusic
	jp .loop
	
.wait2
; Wait for some amount of ticks.
	call .get
	ld [CreditsTimer], a
	jr .done
	
.wait
; Wait for some amount of ticks, and do something else.
	call .get
	ld [CreditsTimer], a
	
	xor a
	ld [$ffd5], a
	ld a, 1
	ld [$ffd4], a
	
.done
	jp $5951
	
.end
; Stop execution.
	ld hl, $cf63
	set 7, [hl]
	ld a, $20
	ld [$c2a7], a
	ld a, $5c
	ld [$c2a9], a
	ld a, $00
	ld [$c2aa], a
	ret

.get
; Get byte CreditsPos from CreditsScript
	push hl
	push de
	ld a, [CreditsPos]
	ld e, a
	ld a, [CreditsPos+1]
	ld d, a
	ld hl, CreditsScript
	add hl, de
	
	inc de
	ld a, e
	ld [CreditsPos], a
	ld a, d
	ld [CreditsPos+1], a
	ld a, [hl]
	pop de
	pop hl
	ret
; 109a95


; known jump sources: 1098ac (42:58ac)
Function109a95: ; 109a95 (42:5a95)
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld a, $c
	ld [hBGMapAddress], a ; $ff00+$d6
	ld a, $28
	ld hl, TileMap ; $c4a0 (aliases: SpritesEnd)
	ld bc, $168
	call ByteFill
	ld a, $7f
	ld hl, $c4f0
	ld bc, $118
	call ByteFill
	ld hl, $c4f0
	ld a, $24
	call Function109b1d
	ld hl, $c5f4
	ld a, $20
	call Function109b1d
	ld hl, AttrMap ; $cdd9
	ld bc, $50
	xor a
	call ByteFill
	ld hl, $ce29
	ld bc, $14
	ld a, $1
	call ByteFill
	ld hl, $ce3d
	ld bc, $f0
	ld a, $2
	call ByteFill
	ld hl, $cf2d
	ld bc, $14
	ld a, $1
	call ByteFill
	call Function3200
	xor a
	ld [hBGMapMode], a ; $ff00+$d4
	ld [hBGMapAddress], a ; $ff00+$d6
	ld hl, TileMap ; $c4a0 (aliases: SpritesEnd)
	call Function109aff
	call Function3200
	ret

; known jump sources: 109af8 (42:5af8)
Function109aff: ; 109aff (42:5aff)
	ld b, $5
.asm_109b01
	push hl
	ld de, $11
	ld c, $4
	xor a
.asm_109b08
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	add hl, de
	dec c
	jr nz, .asm_109b08
	pop hl
	inc hl
	inc hl
	inc hl
	inc hl
	dec b
	jr nz, .asm_109b01
	ret

; known jump sources: 109ab7 (42:5ab7), 109abf (42:5abf)
Function109b1d: ; 109b1d (42:5b1d)
	ld c, $5
.asm_109b1f
	push af
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	pop af
	dec c
	jr nz, .asm_109b1f
	ret

GetCreditsPalette: ; 109b2c
	call .GetPalAddress
	
	push hl
	ld a, 0
	call .UpdatePals
	pop hl
	ret
	
.GetPalAddress
; Each set of palette data is 24 bytes long.
	ld a, [$cf65] ; scene
	and 3
	add a
	add a ; * 8
	add a
	ld e, a
	ld d, 0
	ld hl, .CreditsPalettes
	add hl, de
	add hl, de ; * 3
	add hl, de
	ret
	
.UpdatePals
; Update the first three colors in both palette buffers.
	
	push af
	push hl
	add $00 ; lo($d000)
	ld e, a
	ld a, 0
	adc $d0 ; hi($d000)
	ld d, a
	ld bc, 24
	call CopyBytes
	
	pop hl
	pop af
	add $80 ; lo($d080)
	ld e, a
	ld a, 0
	adc $d0 ; hi($d080)
	ld d, a
	ld bc, 24
	call CopyBytes
	ret


.CreditsPalettes
INCBIN "baserom.gbc",$109b6a,$18 ; pichu.pal
INCBIN "baserom.gbc",$109b82,$18 ; smoochum.pal
INCBIN "baserom.gbc",$109b9a,$18 ; ditto.pal
INCBIN "baserom.gbc",$109bb2,$18 ; igglybuff.pal
; 109bca

; known jump sources: 10989e (42:589e), 109964 (42:5964)
Function109bca: ; 109bca (42:5bca)
	ld hl, $cf64
	ld a, [hl]
	cp $ff
	jr z, .asm_109bed
	and $3
	ld e, a
	inc a
	and $3
	ld [hl], a
	ld a, [$cf65]
	and $3
	add a
	add a
	add e
	add a
	ld e, a
	ld d, $0
	ld hl, $5bf1
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
.asm_109bed
	ld hl, $ca00
	ret
; 109bf1 (42:5bf1)

INCBIN "baserom.gbc",$109bf1,$109c11 - $109bf1

; known jump sources: 109a1b (42:5a1b)
Function109c11: ; 109c11 (42:5c11)
	ld a, $40
	ld hl, $c55a
	call Function109c1c
	ld hl, $c56e

; known jump sources: 109c16 (42:5c16)
Function109c1c: ; 109c1c (42:5c1c)
	ld c, $8
.asm_109c1e
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_109c1e
	ret
; 109c24 (42:5c24)


CreditsGFX:
INCBIN "gfx/credits/border.2bpp"
INCBIN "gfx/credits/pichu.2bpp"
INCBIN "gfx/credits/smoochum.2bpp"
INCBIN "gfx/credits/ditto.2bpp"
INCBIN "gfx/credits/igglybuff.2bpp"


CreditsScript: ; 10acb4

; Clear the banner.
	db CREDITS_CLEAR

; Pokemon Crystal Version Staff
	db                STAFF, 01
	db CREDITS_WAIT, 08

; Play the credits music.
	db CREDITS_MUSIC

	db CREDITS_WAIT2, 10

	db CREDITS_WAIT, 01

; Update the banner.
	db CREDITS_SCENE, 00 ; Pichu

	db             DIRECTOR, 01
	db       SATOSHI_TAJIRI, 02
	db CREDITS_WAIT, 12

	db           CODIRECTOR, 01
	db       JUNICHI_MASUDA, 02
	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 00
	db       SOUSUKE_TAMADA, 01
	db       HISASHI_SOGABE, 02
	db         KEITA_KAGAYA, 03
	db    YOSHINORI_MATSUDA, 04
	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 00
	db     SHIGEKI_MORIMOTO, 01
	db     TETSUYA_WATANABE, 02
	db        TAKENORI_OOTA, 03
	db CREDITS_WAIT, 12

	db    GRAPHICS_DIRECTOR, 01
	db         KEN_SUGIMORI, 02
	db CREDITS_WAIT, 12

	db       MONSTER_DESIGN, 00
	db         KEN_SUGIMORI, 01
	db    MOTOFUMI_FUJIWARA, 02
	db     SHIGEKI_MORIMOTO, 03
	db     HIRONOBU_YOSHIDA, 04
	db         SATOSHI_OOTA, 05
	db CREDITS_WAIT, 12

	db       MONSTER_DESIGN, 00
	db       ATSUKO_NISHIDA, 01
	db          MUNEO_SAITO, 02
	db       RENA_YOSHIKAWA, 03
	db CREDITS_WAIT, 12

	db    POKEMON_ANIMATION, 01
	db     HIRONOBU_YOSHIDA, 02
	db          JUN_OKUTANI, 03
	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 01

; Update the banner.
	db CREDITS_SCENE, 01 ; Smoochum

	db      GRAPHICS_DESIGN, 00
	db     HIRONOBU_YOSHIDA, 01
	db          JUN_OKUTANI, 02
	db       ASUKA_IWASHITA, 03
	db     TETSUYA_WATANABE, 04
	db CREDITS_WAIT, 12

	db                MUSIC, 00
	db       JUNICHI_MASUDA, 01
	db        MORIKAZU_AOKI, 02
	db          GO_ICHINOSE, 03
	db CREDITS_WAIT, 12

	db        SOUND_EFFECTS, 00
	db        MORIKAZU_AOKI, 01
	db       JUNICHI_MASUDA, 02
	db     TETSUYA_WATANABE, 03
	db CREDITS_WAIT, 12

	db          GAME_DESIGN, 00
	db       JUNICHI_MASUDA, 01
	db     SHIGEKI_MORIMOTO, 02
	db        KOHJI_NISHINO, 03
	db CREDITS_WAIT, 12

	db          GAME_DESIGN, 00
	db         TETSUJI_OOTA, 01
	db          HITOMI_SATO, 02
	db     KENJI_MATSUSHIMA, 03
	db CREDITS_WAIT, 12

	db        GAME_SCENARIO, 00
	db       JUNICHI_MASUDA, 01
	db        KOHJI_NISHINO, 02
	db  TOSHINOBU_MATSUMIYA, 03
	db     KENJI_MATSUSHIMA, 04
	db CREDITS_WAIT, 12

	db         POKEDEX_TEXT, 01
	db  TOSHINOBU_MATSUMIYA, 02
	db CREDITS_WAIT, 12

	db     TOOL_PROGRAMMING, 01
	db       SOUSUKE_TAMADA, 02
	db        TAKENORI_OOTA, 03
	db CREDITS_WAIT, 12

	db    PARAMETRIC_DESIGN, 01
	db        KOHJI_NISHINO, 02
	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 01

; Update the banner.
	db CREDITS_SCENE, 02 ; Ditto

	db        SCRIPT_DESIGN, 01
	db         TETSUJI_OOTA, 02
	db        NOBUHIRO_SEYA, 03
	db CREDITS_WAIT, 12

	db      MAP_DATA_DESIGN, 01
	db         TETSUJI_OOTA, 02
	db      KAZUHITO_SEKINE, 03
	db CREDITS_WAIT, 12

	db           MAP_DESIGN, 00
	db         TETSUJI_OOTA, 01
	db        KOHJI_NISHINO, 02
	db        NOBUHIRO_SEYA, 03
	db CREDITS_WAIT, 12

	db         COORDINATION, 01
	db      HIROYUKI_ZINNAI, 02
	db CREDITS_WAIT, 12

	db            PRODUCERS, 00
	db         SATORU_IWATA, 01
	db       SATOSHI_YAMATO, 02
	db     SHIGERU_MIYAMOTO, 03
	db CREDITS_WAIT, 12

	db            PRODUCERS, 01
	db   TSUNEKAZU_ISHIHARA, 02
	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 01

; Update the banner.
	db CREDITS_SCENE, 03 ; Igglybuff

	db     US_VERSION_STAFF, 02
	db CREDITS_WAIT, 09

	db      US_COORDINATION, 01
	db          GAIL_TILDEN, 02
	db        HIRO_NAKAMURA, 03
	db CREDITS_WAIT, 12

	db      US_COORDINATION, 01
	db       JUNICHI_MASUDA, 02
	db        SETH_MCMAHILL, 03
	db CREDITS_WAIT, 12

	db      US_COORDINATION, 01
	db     HIROTO_ALEXANDER, 02
	db     TERESA_LILLYGREN, 03
	db CREDITS_WAIT, 12

	db     TEXT_TRANSLATION, 01
	db        NOB_OGASAWARA, 02
	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 01
	db      TERUKI_MURAKAWA, 02
	db      KAZUYOSHI_OSAWA, 03
	db CREDITS_WAIT, 12

	db         PAAD_TESTING, 01
	db       THOMAS_HERTZOG, 02
	db         ERIK_JOHNSON, 03
	db CREDITS_WAIT, 12

	db      PRODUCT_TESTING, 00
	db             PLANNING, 01
	db CREDITS_WAIT, 12

	db      PRODUCT_TESTING, 00
	db       KEITA_NAKAMURA, 01
	db      HIROTAKA_UEMURA, 02
	db       HIROAKI_TAMURA, 03
	db    NORIAKI_SAKAGUCHI, 04
	db CREDITS_WAIT, 12

	db      PRODUCT_TESTING, 00
	db NCL_SUPER_MARIO_CLUB, 01
	db          KENJI_SAIKI, 02
	db         ATSUSHI_TADA, 03
	db          MIYUKI_SATO, 04
	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 00
	db     KIMIKO_NAKAMICHI, 01
	db           AKITO_MORI, 02
	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 00
	db        GAKUZI_NOMOTO, 01
	db           AI_MASHIMA, 02
	db      KUNIMI_KAWAMURA, 03
	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 00
	db    MIKIHIRO_ISHIKAWA, 01
	db   HIDEYUKI_HASHIMOTO, 02
	db CREDITS_WAIT, 12

	db   EXECUTIVE_PRODUCER, 01
	db     HIROSHI_YAMAUCHI, 02
	db CREDITS_WAIT, 12

	db            COPYRIGHT, 01
	db CREDITS_WAIT, 09

; Display "The End" graphic.
	db CREDITS_THEEND

	db CREDITS_WAIT, 20

	db $ff ; end
; 10ae13


CreditsStrings:
	dw .SatoshiTajiri
	dw .JunichiMasuda
	dw .TetsuyaWatanabe
	dw .ShigekiMorimoto
	dw .SousukeTamada
	dw .TakenoriOota
	dw .KenSugimori
	dw .MotofumiFujiwara
	dw .AtsukoNishida
	dw .MuneoSaito
	dw .SatoshiOota
	dw .RenaYoshikawa
	dw .JunOkutani
	dw .HironobuYoshida
	dw .AsukaIwashita
	dw .GoIchinose
	dw .MorikazuAoki
	dw .KohjiNishino
	dw .KenjiMatsushima
	dw .ToshinobuMatsumiya
	dw .SatoruIwata
	dw .NobuhiroSeya
	dw .KazuhitoSekine
	dw .TetsujiOota
	dw .NclSuperMarioClub
	dw .Sarugakucho
	dw .AkitoMori
	dw .TakahiroHarada
	dw .TohruHashimoto
	dw .NoboruMatsumoto
	dw .TakehiroIzushi
	dw .TakashiKawaguchi
	dw .TsunekazuIshihara
	dw .HiroshiYamauchi
	dw .KenjiSaiki
	dw .AtsushiTada
	dw .NaokoKawakami
	dw .HiroyukiZinnai
	dw .KunimiKawamura
	dw .HisashiSogabe
	dw .KeitaKagaya
	dw .YoshinoriMatsuda
	dw .HitomiSato
	dw .ToruOsawa
	dw .TakaoOhara
	dw .YuichiroIto
	dw .TakaoShimizu
	dw .Planning
	dw .KeitaNakamura
	dw .HirotakaUemura
	dw .HiroakiTamura
	dw .NoriakiSakaguchi
	dw .MiyukiSato
	dw .GakuziNomoto
	dw .AiMashima
	dw .MikihiroIshikawa
	dw .HideyukiHashimoto
	dw .SatoshiYamato
	dw .ShigeruMiyamoto
	dw .GailTilden
	dw .NobOgasawara
	dw .SethMcMahill
	dw .HirotoAlexander
	dw .TeresaLillygren
	dw .ThomasHertzog
	dw .ErikJohnson
	dw .HiroNakamura
	dw .TerukiMurakawa
	dw .KazuyoshiOsawa
	dw .KimikoNakamichi
	dw .End
	dw .Unknown
	dw .Staff
	dw .Director
	dw .CoDirector
	dw .Programmers
	dw .GraphicsDirector
	dw .MonsterDesign
	dw .GraphicsDesign
	dw .Music
	dw .SoundEffects
	dw .GameDesign
	dw .GameScenario
	dw .ToolProgramming
	dw .ParametricDesign
	dw .ScriptDesign
	dw .MapDataDesign
	dw .MapDesign
	dw .ProductTesting
	dw .SpecialThanks
	dw .Producers
	dw .ExecutiveProducer
	dw .PokemonAnimation
	dw .PokedexText
	dw .MobilePrjLeader
	dw .MobileSystemAd
	dw .MobileStadiumDir
	dw .Coordination
	dw .Copyright
	dw .UsVersionStaff
	dw .UsCoordination
	dw .TextTranslation
	dw .PaadTesting

.SatoshiTajiri:       db "   SATOSHI TAJIRI@"         ; "たじり さとし@"
.JunichiMasuda:       db "   JUNICHI MASUDA@"         ; "ますだ じゅんいち@"
.TetsuyaWatanabe:     db "  TETSUYA WATANABE@"        ; "わたなべ てつや@"
.ShigekiMorimoto:     db "  SHIGEKI MORIMOTO@"        ; "もりもと しげき@"
.SousukeTamada:       db "   SOUSUKE TAMADA@"         ; "たまだ そうすけ@"
.TakenoriOota:        db "   TAKENORI OOTA@"          ; "おおた たけのり@"
.KenSugimori:         db "    KEN SUGIMORI@"          ; "すぎもり けん@"
.MotofumiFujiwara:    db " MOTOFUMI FUJIWARA@"        ; "ふじわら もとふみ@"
.AtsukoNishida:       db "   ATSUKO NISHIDA@"         ; "にしだ あつこ@"
.MuneoSaito:          db "    MUNEO SAITO@"           ; "さいとう むねお@"
.SatoshiOota:         db "    SATOSHI OOTA@"          ; "おおた さとし@"
.RenaYoshikawa:       db "   RENA YOSHIKAWA@"         ; "よしかわ れな@"
.JunOkutani:          db "    JUN OKUTANI@"           ; "おくたに じゅん@"
.HironobuYoshida:     db "  HIRONOBU YOSHIDA@"        ; "よしだ ひろのぶ@"
.AsukaIwashita:       db "   ASUKA IWASHITA@"         ; "いわした あすか@"
.GoIchinose:          db "    GO ICHINOSE@"           ; "いちのせ ごう@"
.MorikazuAoki:        db "   MORIKAZU AOKI@"          ; "あおき もりかず@"
.KohjiNishino:        db "   KOHJI NISHINO@"          ; "にしの こうじ@"
.KenjiMatsushima:     db "  KENJI MATSUSHIMA@"        ; "まつしま けんじ@"
.ToshinobuMatsumiya:  db "TOSHINOBU MATSUMIYA@"       ; "まつみや としのぶ@"
.SatoruIwata:         db "    SATORU IWATA@"          ; "いわた さとる@"
.NobuhiroSeya:        db "   NOBUHIRO SEYA@"          ; "せや のぶひろ@"
.KazuhitoSekine:      db "  KAZUHITO SEKINE@"         ; "せきね かずひと@"
.TetsujiOota:         db "    TETSUJI OOTA@"          ; "おおた てつじ@"
.NclSuperMarioClub:   db "NCL SUPER MARIO CLUB@"      ; "スーパーマりォクラブ@"
.Sarugakucho:         db "    SARUGAKUCHO@"           ; "さるがくちょう@"
.AkitoMori:           db "     AKITO MORI@"           ; "もり あきと@"
.TakahiroHarada:      db "  TAKAHIRO HARADA@"         ; "はらだ たかひろ@"
.TohruHashimoto:      db "  TOHRU HASHIMOTO@"         ; "はしもと とおる@"
.NoboruMatsumoto:     db "  NOBORU MATSUMOTO@"        ; "まつもと のぼる@"
.TakehiroIzushi:      db "  TAKEHIRO IZUSHI@"         ; "いずし たけひろ@"
.TakashiKawaguchi:    db " TAKASHI KAWAGUCHI@"        ; "かわぐち たかし@"
.TsunekazuIshihara:   db " TSUNEKAZU ISHIHARA@"       ; "いしはら つねかず@"
.HiroshiYamauchi:     db "  HIROSHI YAMAUCHI@"        ; "やまうち ひろし@"
.KenjiSaiki:          db "    KENJI SAIKI@"           ; "さいき けんじ@"
.AtsushiTada:         db "    ATSUSHI TADA@"          ; "ただ あつし@"
.NaokoKawakami:       db "   NAOKO KAWAKAMI@"         ; "かわかみ なおこ@"
.HiroyukiZinnai:      db "  HIROYUKI ZINNAI@"         ; "じんない ひろゆき@"
.KunimiKawamura:      db "  KUNIMI KAWAMURA@"         ; "かわむら くにみ@"
.HisashiSogabe:       db "   HISASHI SOGABE@"         ; "そがべ ひさし@"
.KeitaKagaya:         db "    KEITA KAGAYA@"          ; "かがや けいた@"
.YoshinoriMatsuda:    db " YOSHINORI MATSUDA@"        ; "まつだ よしのり@"
.HitomiSato:          db "    HITOMI SATO@"           ; "さとう ひとみ@"
.ToruOsawa:           db "     TORU OSAWA@"           ; "おおさわ とおる@"
.TakaoOhara:          db "    TAKAO OHARA@"           ; "おおはら たかお@"
.YuichiroIto:         db "    YUICHIRO ITO@"          ; "いとう ゆういちろう@"
.TakaoShimizu:        db "   TAKAO SHIMIZU@"          ; "しみず たかお@"
.Planning:            db " SPECIAL PRODUCTION", $4e
                      db "      PLANNING", $4e        ; "きかくかいはつぶ@"
                      db " & DEVELOPMENT DEPT.@"
.KeitaNakamura:       db "   KEITA NAKAMURA@"         ; "なかむら けいた@"
.HirotakaUemura:      db "  HIROTAKA UEMURA@"         ; "うえむら ひろたか@"
.HiroakiTamura:       db "   HIROAKI TAMURA@"         ; "たむら ひろあき@"
.NoriakiSakaguchi:    db " NORIAKI SAKAGUCHI@"        ; "さかぐち のりあき@"
.MiyukiSato:          db "    MIYUKI SATO@"           ; "さとう みゆき@"
.GakuziNomoto:        db "   GAKUZI NOMOTO@"          ; "のもと がくじ@"
.AiMashima:           db "     AI MASHIMA@"           ; "ましま あい@"
.MikihiroIshikawa:    db " MIKIHIRO ISHIKAWA@"        ; "いしかわ みきひろ@"
.HideyukiHashimoto:   db " HIDEYUKI HASHIMOTO@"       ; "はしもと ひでゆき@"
.SatoshiYamato:       db "   SATOSHI YAMATO@"         ; "やまと さとし@"
.ShigeruMiyamoto:     db "  SHIGERU MIYAMOTO@"        ; "みやもと しげる@"
.End:                 db "        END@"               ; "おしまい@"
.Unknown:             db "      ????????@"            ; "????????@"
.GailTilden:          db "    GAIL TILDEN@"
.NobOgasawara:        db "   NOB OGASAWARA@"
.SethMcMahill:        db "   SETH McMAHILL@"
.HirotoAlexander:     db "  HIROTO ALEXANDER@"
.TeresaLillygren:     db "  TERESA LILLYGREN@"
.ThomasHertzog:       db "   THOMAS HERTZOG@"
.ErikJohnson:         db "    ERIK JOHNSON@"
.HiroNakamura:        db "   HIRO NAKAMURA@"
.TerukiMurakawa:      db "  TERUKI MURAKAWA@"
.KazuyoshiOsawa:      db "  KAZUYOSHI OSAWA@"
.KimikoNakamichi:     db "  KIMIKO NAKAMICHI@"
.Staff:               db "      #MON", $4e            ; "ポケットモンスター", $4e
                      db "  CRYSTAL VERSION", $4e     ; "  クりスタル バージョン", $4e
                      db "       STAFF@"              ; "    スタッフ@"
.Director:            db "      DIRECTOR@"            ; "エグゼクティブ ディレクター@"
.CoDirector:          db "    CO-DIRECTOR@"           ; "ディレクター@"
.Programmers:         db "    PROGRAMMERS@"           ; "プログラム@"
.GraphicsDirector:    db " GRAPHICS DIRECTOR@"        ; "グラフィック ディレクター@"
.MonsterDesign:       db "   MONSTER DESIGN@"         ; "# デザイン@"
.GraphicsDesign:      db "  GRAPHICS DESIGN@"         ; "グラフィック デザイン@"
.Music:               db "       MUSIC@"              ; "おんがく@"
.SoundEffects:        db "   SOUND EFFECTS@"          ; "サウンド エフ→クト@"
.GameDesign:          db "    GAME DESIGN@"           ; "ゲームデザイン@"
.GameScenario:        db "   GAME SCENARIO@"          ; "シナりォ@"
.ToolProgramming:     db "  TOOL PROGRAMMING@"        ; "ツール プログラム@"
.ParametricDesign:    db " PARAMETRIC DESIGN@"        ; "パラメーター せってい@"
.ScriptDesign:        db "   SCRIPT DESIGN@"          ; "スクりプト せってい@"
.MapDataDesign:       db "  MAP DATA DESIGN@"         ; "マップデータ せってい@"
.MapDesign:           db "     MAP DESIGN@"           ; "マップ デザイン@"
.ProductTesting:      db "  PRODUCT TESTING@"         ; "デバッグプレイ@"
.SpecialThanks:       db "   SPECIAL THANKS@"         ; "スぺシャルサンクス@"
.Producers:           db "     PRODUCERS@"            ; "プロデューサー@"
.ExecutiveProducer:   db " EXECUTIVE PRODUCER@"       ; "エグゼクティブ プロデューサー@"
.PokemonAnimation:    db " #MON ANIMATION@"           ; "# アニメーション@"
.PokedexText:         db "    #DEX TEXT@"             ; "ずかん テキスト@"
.MobilePrjLeader:     db " MOBILE PRJ. LEADER@"       ; "モバイルプロジ→クト りーダー@"
.MobileSystemAd:      db " MOBILE SYSTEM AD.@"        ; "モバイル システムアドバイザー@"
.MobileStadiumDir:    db "MOBILE STADIUM DIR.@"       ; "モバイルスタジアム ディレクター@"
.Coordination:        db "    COORDINATION@"          ; "コーディネーター@"
.UsVersionStaff:      db "  US VERSION STAFF@"
.UsCoordination:      db "  US COORDINATION@"
.TextTranslation:     db "  TEXT TRANSLATION@"
.PaadTesting:         db "    PAAD TESTING@"

.Copyright:
;  (C) 1  9  9  5 - 2  0  0  1     N  i  n  t  e  n  d  o
db $60,$61,$62,$63,$64,$65,$66, $67, $68, $69, $6a, $6b, $6c, $4e
;  (C) 1  9  9  5 - 2  0  0  1    C  r  e  a  t  u  r  e  s      i  n  c .
db $60,$61,$62,$63,$64,$65,$66, $6d, $6e, $6f, $70, $71, $72,  $7a, $7b, $7c, $4e
;  (C) 1  9  9  5 - 2  0  0  1  G   A   M   E   F   R   E   A   K     i  n  c .
db $60,$61,$62,$63,$64,$65,$66, $73, $74, $75, $76, $77, $78, $79,  $7a, $7b, $7c, "@"

