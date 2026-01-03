InitCrystalData:
	ld a, $1
	ld [wPlayerPrefecture], a
	xor a
	ld [wPlayerAge], a
	ld [wPlayerGender], a
	ld [wWildEncounterType], a
	ld [wStarterRandomization], a
	ld [wRandomStarter1], a
	ld [wRandomStarter2], a
	ld [wRandomStarter3], a
	ld [wPlayerPostalCode], a
	ld [wPlayerPostalCode+1], a
	ld [wPlayerPostalCode+2], a
	ld [wPlayerPostalCode+3], a
	ld [wd002], a
	ld [wd003], a
	ld a, [wCrystalFlags]
	res 0, a ; ???
	ld [wCrystalFlags], a
	ld a, [wCrystalFlags]
	res 1, a ; ???
	ld [wCrystalFlags], a
	ret

INCLUDE "mobile/mobile_12.asm"

InitGender:
	call InitGenderScreen
	call InitCrystalData ; Initialize Crystal data here, only during gender selection
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	ld hl, AreYouABoyOrAreYouAGirlText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	ld [wPlayerGender], a
	ld c, 10
	call DelayFrames
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 4, 12, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	db 2 ; items
	db "Boy@"
	db "Girl@"

AreYouABoyOrAreYouAGirlText:
	text_far _AreYouABoyOrAreYouAGirlText
	text_end

InitWildEncounterType:
	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	ld hl, WildEncounterTypeText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	ld [wWildEncounterType], a
	ld c, 10
	call DelayFrames
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 16, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	db 2 ; items
	db "STANDARD@"
	db "RANDOMIZED@"

WildEncounterTypeText:
	text_far _WildEncounterTypeText
	text_end

InitStarterRandomization:
	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	ld hl, StarterRandomizationText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	ld [wStarterRandomization], a
	; If randomization is selected, generate the three random starters
	and a
	jr z, .standard_starters
	call GenerateRandomStarters
.standard_starters
	ld c, 10
	call DelayFrames
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 16, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	db 2 ; items
	db "STANDARD@"
	db "RANDOMIZED@"

StarterRandomizationText:
	text_far _StarterRandomizationText
	text_end

GenerateRandomStarters:
; Generate three unique random Pokemon species (1-251)
; Store them in wRandomStarter1, wRandomStarter2, wRandomStarter3
	
.generate_first
	call Random
	and a
	jr z, .generate_first ; avoid 0
	cp NUM_POKEMON + 1
	jr nc, .generate_first ; avoid > 251
	ld [wRandomStarter1], a
	
.generate_second
	call Random
	and a
	jr z, .generate_second ; avoid 0
	cp NUM_POKEMON + 1
	jr nc, .generate_second ; avoid > 251
	ld b, a
	ld a, [wRandomStarter1]
	cp b
	jr z, .generate_second ; same as first, try again
	ld a, b
	ld [wRandomStarter2], a
	
.generate_third
	call Random
	and a
	jr z, .generate_third ; avoid 0
	cp NUM_POKEMON + 1
	jr nc, .generate_third ; avoid > 251
	ld b, a
	ld a, [wRandomStarter1]
	cp b
	jr z, .generate_third ; same as first, try again
	ld a, [wRandomStarter2]
	cp b
	jr z, .generate_third ; same as second, try again
	ld a, b
	ld [wRandomStarter3], a
	ret

InitGenderScreen:
	ld a, $10
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld c, 8
	call DelayFrames
	call ClearBGPalettes
	; Removed InitCrystalData call from here - it's now only called in InitGender
	call LoadFontsExtra
	hlcoord 0, 0
	ld bc, SCREEN_AREA
	ld a, $0
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_AREA
	xor a
	call ByteFill
	ret

LoadGenderScreenPal:
	ld hl, .Palette
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ret

.Palette:
INCLUDE "gfx/new_game/gender_screen.pal"

LoadGenderScreenLightBlueTile:
	ld de, .LightBlueTile
	ld hl, vTiles2 tile $00
	lb bc, BANK(.LightBlueTile), 1
	call Get2bpp
	ret

.LightBlueTile:
INCBIN "gfx/new_game/gender_screen.2bpp"
