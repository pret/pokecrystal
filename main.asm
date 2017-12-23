INCLUDE "includes.asm"


SECTION "bank1", ROMX

PlaceWaitingText:: ; 4000
	hlcoord 3, 10
	ld b, 1
	ld c, 11

	ld a, [wBattleMode]
	and a
	jr z, .notinbattle

	call TextBox
	jr .proceed

.notinbattle
	predef Predef_LinkTextbox

.proceed
	hlcoord 4, 11
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames

.Waiting: ; 4025
	db "Waiting...!@"

LoadPushOAM:: ; 4031
	ld c, hPushOAM - $ff00
	ld b, PushOAMEnd - PushOAM
	ld hl, PushOAM
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	ret

PushOAM: ; 403f
	ld a, Sprites / $100
	ld [rDMA], a
	ld a, (SpritesEnd - Sprites) / 4 ; 40
.loop
	dec a
	jr nz, .loop
	ret
PushOAMEnd

INCLUDE "engine/map_objects.asm"
INCLUDE "engine/intro_menu.asm"
INCLUDE "engine/init_map.asm"
INCLUDE "engine/learn.asm"
INCLUDE "engine/check_nick_errors.asm"
INCLUDE "engine/math.asm"
INCLUDE "data/items/item_attributes.asm"
INCLUDE "engine/npc_movement.asm"
INCLUDE "event/happiness_egg.asm"
INCLUDE "event/special.asm"


SECTION "bank2", ROMX

INCLUDE "engine/player_object.asm"
INCLUDE "engine/sine.asm"
INCLUDE "engine/predef.asm"
INCLUDE "engine/color.asm"


SECTION "bank3", ROMX

INCLUDE "engine/check_time.asm"
INCLUDE "engine/specials.asm"
INCLUDE "engine/printnum.asm"
INCLUDE "engine/health.asm"
INCLUDE "event/overworld.asm"
INCLUDE "engine/items.asm"
INCLUDE "engine/player_step.asm"
INCLUDE "engine/anim_hp_bar.asm"
INCLUDE "engine/move_mon.asm"
INCLUDE "engine/billspctop.asm"
INCLUDE "engine/get_breedmon_growth.asm"
INCLUDE "event/bug_contest/caught_mon.asm"
INCLUDE "engine/item_effects.asm"
INCLUDE "engine/knows_move.asm"


SECTION "bank4", ROMX

INCLUDE "engine/pack.asm"
INCLUDE "engine/time.asm"
INCLUDE "engine/tmhm.asm"
INCLUDE "engine/namingscreen.asm"
INCLUDE "event/misc_scripts.asm"
INCLUDE "event/heal_machine_anim.asm"
INCLUDE "event/whiteout.asm"
INCLUDE "event/forced_movement.asm"
INCLUDE "event/itemfinder.asm"
INCLUDE "engine/start_menu.asm"
INCLUDE "engine/select_menu.asm"
INCLUDE "event/elevator.asm"
INCLUDE "event/bug_contest/contest.asm"
INCLUDE "event/misc_scripts_2.asm"
INCLUDE "event/std_collision.asm"
INCLUDE "event/bug_contest/judging.asm"
INCLUDE "engine/pokerus_tick.asm"
INCLUDE "event/bug_contest/contest_2.asm"
INCLUDE "engine/unused_correct_party.asm"
INCLUDE "engine/square_root.asm"


SECTION "bank5", ROMX

INCLUDE "engine/rtc.asm"
INCLUDE "engine/overworld.asm"
INCLUDE "engine/tile_events.asm"
INCLUDE "engine/save.asm"
INCLUDE "engine/spawn_points.asm"
INCLUDE "engine/map_setup.asm"
INCLUDE "engine/pokecenter_pc.asm"
INCLUDE "engine/mart.asm"
INCLUDE "engine/money.asm"
INCLUDE "data/items/marts.asm"
INCLUDE "event/mom.asm"
INCLUDE "event/daycare.asm"
INCLUDE "event/print_unown.asm"
INCLUDE "event/print_photo.asm"
INCLUDE "engine/breeding.asm"
INCLUDE "tilesets/data.asm"


SECTION "Clock Reset", ROMX

INCLUDE "engine/clock_reset.asm"


SECTION "bank9", ROMX

INCLUDE "data/text_buffers.asm"
INCLUDE "engine/menu.asm"

UpdateItemDescription: ; 0x244c3
	ld a, [MenuSelection]
	ld [CurSpecies], a
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call TextBox
	ld a, [MenuSelection]
	cp -1
	ret z
	decoord 1, 14
	callba PrintItemDescription
	ret

INCLUDE "engine/pokepic.asm"
INCLUDE "engine/map_objects_2.asm"
INCLUDE "engine/scrolling_menu.asm"
INCLUDE "engine/switch_items.asm"
INCLUDE "engine/menu_2.asm"
INCLUDE "engine/mon_menu.asm"
INCLUDE "battle/menu.asm"
INCLUDE "engine/buy_sell_toss.asm"
INCLUDE "engine/trainer_card.asm"
INCLUDE "engine/prof_oaks_pc.asm"
INCLUDE "engine/decorations.asm"

LevelUpHappinessMod: ; 2709e
	ld a, [CurPartyMon]
	ld hl, PartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and $7f
	ld d, a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp d
	ld c, HAPPINESS_GAINLEVEL
	jr nz, .ok
	ld c, HAPPINESS_GAINLEVELATHOME

.ok
	callab ChangeHappiness
	ret

INCLUDE "data/trainers/trainer_dvs.asm"

_ReturnToBattle_UseBall: ; 2715c
	call ClearBGPalettes
	call ClearTileMap
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .gettutorialbackpic
	callba GetMonBackpic
	jr .continue

.gettutorialbackpic
	callba GetTrainerBackpic
.continue
	callba GetMonFrontpic
	callba _LoadBattleFontsHPBar
	call GetMemSGBLayout
	call CloseWindow
	call LoadStandardMenuDataHeader
	call WaitBGMap
	jp SetPalettes

INCLUDE "engine/consume_held_item.asm"
INCLUDE "battle/moves/move_effects_pointers.asm"
INCLUDE "battle/moves/move_effects.asm"

Kurt_SelectQuantity_InterpretJoypad: ; 27a28
	call BuySellToss_InterpretJoypad
	ld b, a
	ret


SECTION "bankA", ROMX

INCLUDE "engine/link.asm"
INCLUDE "engine/wildmons.asm"
INCLUDE "battle/link_result.asm"
INCLUDE "engine/player_gfx_2.asm"


SECTION "bankB", ROMX

INCLUDE "battle/trainer_huds.asm"
INCLUDE "data/trainers/trainer_class_names.asm"
INCLUDE "battle/ai/redundant.asm"
INCLUDE "event/move_deleter.asm"
INCLUDE "engine/mystery_gift_2.asm"
INCLUDE "engine/tmhm2.asm"
INCLUDE "battle/moves/move_descriptions.asm"
INCLUDE "engine/pokerus.asm"
INCLUDE "engine/start_battle.asm"
INCLUDE "engine/place_graphics.asm"


SECTION "Effect Commands", ROMX

INCLUDE "battle/effect_commands.asm"


SECTION "Enemy Trainers", ROMX

INCLUDE "battle/ai/items.asm"
INCLUDE "battle/ai/scoring.asm"
INCLUDE "engine/read_trainer_attributes.asm"
INCLUDE "data/trainers/trainer_attributes.asm"
INCLUDE "engine/read_trainer_party.asm"
INCLUDE "data/trainers/party_pointers.asm"
INCLUDE "data/trainers/parties.asm"


SECTION "Battle Core", ROMX

INCLUDE "battle/core.asm"
INCLUDE "battle/effect_command_pointers.asm"


SECTION "bank10", ROMX

INCLUDE "engine/pokedex.asm"
INCLUDE "battle/moves/moves.asm"
INCLUDE "engine/evolve.asm"


SECTION "bank11", ROMX

INCLUDE "engine/fruit_trees.asm"
INCLUDE "battle/ai/move.asm"
INCLUDE "engine/pokedex_2.asm"
INCLUDE "data/pokemon/dex_entry_pointers.asm"
INCLUDE "engine/mail.asm"


SECTION "Crystal Unique", ROMX

INCLUDE "engine/init_gender.asm"
INCLUDE "engine/pack_f.asm"
INCLUDE "event/move_tutor.asm"
INCLUDE "engine/crystal_colors.asm"
INCLUDE "event/celebi.asm"
INCLUDE "engine/main_menu.asm"
INCLUDE "mobile/mobile_menu.asm"
INCLUDE "engine/search.asm"
INCLUDE "mobile/mobile_12_2.asm"
INCLUDE "event/buena_menu.asm"


SECTION "bank13", ROMX

INCLUDE "engine/map_palettes.asm"
INCLUDE "tilesets/palette_maps.asm"

Unknown_4ce05: ; unreferenced
rept 26
	db $06
endr
; 0x4ce1f

INCLUDE "data/collision_permissions.asm"
INCLUDE "engine/empty_sram.asm"

SaveMenu_LoadEDTile: ; 4cf45 (13:4f45)
	ld a, [hCGB]
	and a
	jp z, WaitBGMap

; The following is a modified version of LoadEDTile.
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
.WaitLY:
	ld a, [rLY]
	cp $60
	jr c, .WaitLY

	di
	ld a, 1 ; BANK(VBGMap2)
	ld [rVBK], a
	hlcoord 0, 0, AttrMap
	call .LoadEDTile
	ld a, 0 ; BANK(VBGMap0)
	ld [rVBK], a
	hlcoord 0, 0
	call .LoadEDTile
.WaitLY2:
	ld a, [rLY]
	cp $60
	jr c, .WaitLY2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret

.LoadEDTile: ; 4cf80 (13:4f80)
	ld [hSPBuffer], sp ; $ffd9
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	ld b, 1 << 1
	ld c, rSTAT % $100

.loop
rept SCREEN_WIDTH / 2
	pop de
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, $20 - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

CheckSave:: ; 4cffe
	ld a, BANK(sCheckValue1) ; BANK(sCheckValue2)
	call GetSRAMBank
	ld a, [sCheckValue1]
	ld b, a
	ld a, [sCheckValue2]
	ld c, a
	call CloseSRAM
	ld a, b
	cp SAVE_CHECK_VALUE_1
	jr nz, .ok
	ld a, c
	cp SAVE_CHECK_VALUE_2
	jr nz, .ok
	ld c, $1
	ret

.ok
	ld c, $0
	ret

INCLUDE "data/maps/map_triggers.asm"

_LoadMapPart:: ; 4d15b
	ld hl, wMisc
	ld a, [wMetatileStandingY]
	and a
	jr z, .top_row
	ld bc, WMISC_WIDTH * 2
	add hl, bc

.top_row
	ld a, [wMetatileStandingX]
	and a
	jr z, .left_column
	inc hl
	inc hl

.left_column
	decoord 0, 0
	ld b, SCREEN_HEIGHT
.loop
	ld c, SCREEN_WIDTH
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ld a, l
	add 4
	ld l, a
	jr nc, .carry
	inc h

.carry
	dec b
	jr nz, .loop
	ret

PhoneRing_LoadEDTile: ; 4d188
	ld a, [hCGB]
	and a
	jp z, WaitBGMap
	ld a, [wSpriteUpdatesEnabled]
	cp $0
	jp z, WaitBGMap

; What follows is a modified version of LoadEDTile.
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
.wait
	ld a, [rLY]
	cp $8f
	jr c, .wait

	di
	ld a, 1 ; BANK(VBGMap2)
	ld [rVBK], a
	hlcoord 0, 0, AttrMap
	call .LoadEDTile
	ld a, 0 ; BANK(VBGMap0)
	ld [rVBK], a
	hlcoord 0, 0
	call .LoadEDTile
.wait2
	ld a, [rLY]
	cp $8f
	jr c, .wait2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret

.LoadEDTile: ; 4d1cb
	ld [hSPBuffer], sp
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	ld b, 1 << 1 ; not in v/hblank
	ld c, rSTAT % $100

.loop
rept SCREEN_WIDTH / 2
	pop de
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, $20 - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

Shrink1Pic: ; 4d249
INCBIN "gfx/shrink/shrink1.2bpp.lz"

Shrink2Pic: ; 4d2d9
INCBIN "gfx/shrink/shrink2.2bpp.lz"

LinkMonStatsScreen: ; 4d319
	ld a, [wMenuCursorY]
	dec a
	ld [CurPartyMon], a
	call LowVolume
	predef StatsScreenInit
	ld a, [CurPartyMon]
	inc a
	ld [wMenuCursorY], a
	call ClearScreen
	call ClearBGPalettes
	call MaxVolume
	callba LoadTradeScreenBorder
	callba Link_WaitBGMap
	callba InitTradeSpeciesList
	callba SetTradeRoomBGPals
	call WaitBGMap2
	ret

Link_WaitBGMap: ; 4d354
	call WaitBGMap
	call WaitBGMap2
	ret

LinkTextbox2: ; 4d35b
	ld h, d
	ld l, e
	push bc
	push hl
	call .PlaceBorder
	pop hl
	pop bc
	ld de, AttrMap - TileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, $7
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret

.PlaceBorder: ; 4d37e
	push hl
	ld a, $76
	ld [hli], a
	inc a
	call .PlaceRow
	inc a
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, "┌"
	ld [hli], a
	ld a, " "
	call .PlaceRow
	ld [hl], "─"
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, "┐"
	ld [hli], a
	ld a, "│"
	call .PlaceRow
	ld [hl], "└"
	ret

.PlaceRow: ; 4d3ab
	ld d, c
.row_loop
	ld [hli], a
	dec d
	jr nz, .row_loop
	ret

INCLUDE "engine/delete_save_change_clock.asm"
INCLUDE "tilesets/tileset_headers.asm"
INCLUDE "engine/flag_predef.asm"
INCLUDE "engine/trademon_frontpic.asm"

CheckPokerus: ; 4d860
; Return carry if a monster in your party has Pokerus

; Get number of monsters to iterate over
	ld a, [PartyCount]
	and a
	jr z, .NoPokerus
	ld b, a
; Check each monster in the party for Pokerus
	ld hl, PartyMon1PokerusStatus
	ld de, PARTYMON_STRUCT_LENGTH
.Check:
	ld a, [hl]
	and $0f ; only the bottom nybble is used
	jr nz, .HasPokerus
; Next PartyMon
	add hl, de
	dec b
	jr nz, .Check
.NoPokerus:
	and a
	ret
.HasPokerus:
	scf
	ret

INCLUDE "event/lucky_number.asm"
INCLUDE "engine/caught_data.asm"
INCLUDE "engine/search2.asm"
INCLUDE "engine/stats_screen.asm"
INCLUDE "event/catch_tutorial.asm"
INCLUDE "engine/evolution_animation.asm"
INCLUDE "engine/init_hof_credits.asm"
INCLUDE "mobile/get_trainer_class.asm"
INCLUDE "battle/sliding_intro.asm"
INCLUDE "mobile/print_opp_message.asm"
INCLUDE "engine/check_battle_scene.asm"
INCLUDE "engine/gbc_only.asm"
INCLUDE "event/poke_seer.asm"


SECTION "bank14", ROMX

INCLUDE "engine/party_menu.asm"
INCLUDE "event/poisonstep.asm"
INCLUDE "event/sweet_scent.asm"
INCLUDE "event/squirtbottle.asm"
INCLUDE "event/card_key.asm"
INCLUDE "event/basement_key.asm"
INCLUDE "event/sacred_ash.asm"
INCLUDE "engine/tempmon.asm"
INCLUDE "text/types.asm"
INCLUDE "text/unused_gen_1_trainers.asm"
INCLUDE "engine/mon_stats.asm"
INCLUDE "engine/init_list.asm"
INCLUDE "engine/experience.asm"
INCLUDE "engine/switch_party_mons.asm"
INCLUDE "gfx/load_pics.asm"
INCLUDE "engine/move_mon_wo_mail.asm"
INCLUDE "data/pokemon/base_stats.asm"
INCLUDE "data/pokemon/pokemon_names.asm"

Unknown_53d84: ; unreferenced
	db $1a, $15
	db $33, $16
	db $4b, $17
	db $62, $18
	db $79, $19
	db $90, $1a
	db $a8, $1b
	db $c4, $1c
	db $e0, $1d
	db $f6, $1e
	db $ff, $1f
	db $ff, $20

UnknownEggPic:: ; 53d9c
; Another egg pic. This is shifted up a few pixels.
INCBIN "gfx/unknown/unknown_egg.2bpp.lz"


SECTION "Crystal Phone Text", ROMX

INCLUDE "text/phone/extra.asm"


SECTION "bank20", ROMX

INCLUDE "engine/player_movement.asm"
INCLUDE "engine/engine_flags.asm"
INCLUDE "engine/variables.asm"
INCLUDE "text/battle.asm"
INCLUDE "engine/debug.asm"


SECTION "bank21", ROMX

INCLUDE "engine/printer.asm"
INCLUDE "battle/anim_gfx.asm"
INCLUDE "event/halloffame.asm"


SECTION "bank22", ROMX

INCLUDE "event/kurt.asm"
INCLUDE "engine/player_gfx.asm"
INCLUDE "mobile/mobile_22.asm"
INCLUDE "event/unown.asm"
INCLUDE "event/buena.asm"
INCLUDE "event/dratini.asm"
INCLUDE "event/battle_tower.asm"
INCLUDE "mobile/mobile_22_2.asm"


SECTION "bank23", ROMX

INCLUDE "engine/timeofdaypals.asm"
INCLUDE "engine/battle_transition.asm"
INCLUDE "event/field_moves.asm"
INCLUDE "event/magnet_train.asm"

BattleStart_LoadEDTile: ; 8cf4f
	call CGBOnly_LoadEDTile
	ret

INCLUDE "engine/sprites.asm"
INCLUDE "engine/mon_icons.asm"


SECTION "bank24", ROMX

INCLUDE "engine/phone/phone.asm"
INCLUDE "engine/timeset.asm"
INCLUDE "engine/pokegear.asm"
INCLUDE "engine/fish.asm"
INCLUDE "engine/slot_machine.asm"


SECTION "Phone Engine", ROMX

INCLUDE "engine/phone/phone_callers.asm"
INCLUDE "engine/phone/phone_gossip.asm"
INCLUDE "engine/phone/buenas_password.asm"


SECTION "Phone Text", ROMX

INCLUDE "text/phone/anthony_overworld.asm"
INCLUDE "text/phone/todd_overworld.asm"
INCLUDE "text/phone/gina_overworld.asm"
INCLUDE "text/phone/irwin_overworld.asm"
INCLUDE "text/phone/arnie_overworld.asm"
INCLUDE "text/phone/alan_overworld.asm"
INCLUDE "text/phone/dana_overworld.asm"
INCLUDE "text/phone/chad_overworld.asm"
INCLUDE "text/phone/derek_overworld.asm"
INCLUDE "text/phone/tully_overworld.asm"
INCLUDE "text/phone/brent_overworld.asm"
INCLUDE "text/phone/tiffany_overworld.asm"
INCLUDE "text/phone/vance_overworld.asm"
INCLUDE "text/phone/wilton_overworld.asm"
INCLUDE "text/phone/kenji_overworld.asm"
INCLUDE "text/phone/parry_overworld.asm"
INCLUDE "text/phone/erin_overworld.asm"


SECTION "bank2E", ROMX

INCLUDE "engine/events_3.asm"
INCLUDE "engine/radio.asm"
INCLUDE "gfx/mail.asm"


SECTION "bank2F", ROMX

INCLUDE "engine/std_scripts.asm"
INCLUDE "engine/phone/phone_scripts.asm"
INCLUDE "engine/phone/generic_calls.asm"
INCLUDE "engine/trainer_scripts.asm"


SECTION "bank32", ROMX

INCLUDE "battle/bg_effects.asm"
INCLUDE "battle/anims.asm"
INCLUDE "event/poisonstep_pals.asm"

TheEndGFX:: ; cbd2e
INCBIN "gfx/credits/theend.2bpp"


SECTION "bank33", ROMX

INCLUDE "event/bug_contest/display_stats.asm"
INCLUDE "battle/anim_commands.asm"
INCLUDE "battle/anim_objects.asm"


SECTION "Pic Animations 1", ROMX

INCLUDE "gfx/pics/animation.asm"
INCLUDE "gfx/pics/anim_pointers.asm"
INCLUDE "gfx/pics/anims.asm"
INCLUDE "gfx/pics/extra_pointers.asm"
INCLUDE "gfx/pics/extras.asm"
INCLUDE "gfx/pics/unown_anim_pointers.asm"
INCLUDE "gfx/pics/unown_anims.asm"
INCLUDE "gfx/pics/unown_extra_pointers.asm"
INCLUDE "gfx/pics/unown_extras.asm"
INCLUDE "gfx/pics/bitmask_pointers.asm"
INCLUDE "gfx/pics/bitmasks.asm"
INCLUDE "gfx/pics/unown_bitmask_pointers.asm"
INCLUDE "gfx/pics/unown_bitmasks.asm"


SECTION "Pic Animations 2", ROMX

INCLUDE "gfx/pics/frame_pointers.asm"
INCLUDE "gfx/pics/kanto_frames.asm"


SECTION "Font Inversed", ROMX

FontInversed:
INCBIN "gfx/font/font_inversed.1bpp"


SECTION "Pic Animations 3", ROMX

INCLUDE "gfx/pics/johto_frames.asm"
INCLUDE "gfx/pics/unown_frame_pointers.asm"
INCLUDE "gfx/pics/unown_frames.asm"


SECTION "bank38", ROMX

INCLUDE "event/print_unown_2.asm"

Unknown_e00ed:
; Graphics for an unused Game Corner
; game were meant to be here.

ret_e00ed: ; e00ed (38:40ed)
; How many coins?
	ret

INCLUDE "engine/card_flip.asm"
INCLUDE "engine/unown_puzzle.asm"
INCLUDE "engine/dummy_game.asm"
INCLUDE "engine/billspc.asm"


SECTION "bank39", ROMX

CopyrightGFX:: ; e4000
INCBIN "gfx/splash/copyright.2bpp"

INCLUDE "engine/options_menu.asm"
INCLUDE "engine/crystal_intro.asm"


SECTION "bank3E", ROMX

INCLUDE "gfx/font.asm"
INCLUDE "engine/time_capsule.asm"
INCLUDE "event/name_rater.asm"
INCLUDE "engine/play_slow_cry.asm"
INCLUDE "engine/new_pokedex_entry.asm"
INCLUDE "engine/time_capsule_2.asm"
INCLUDE "engine/unown_dex.asm"
INCLUDE "event/magikarp.asm"
INCLUDE "battle/hidden_power.asm"
INCLUDE "battle/misc.asm"


SECTION "bank3F", ROMX

INCLUDE "tilesets/animations.asm"
INCLUDE "engine/npctrade.asm"
INCLUDE "event/mom_phone.asm"


INCLUDE "mobile/mobile_40.asm"


SECTION "bank41", ROMX

INCLUDE "engine/dma_transfer.asm"
INCLUDE "gfx/emotes.asm"
INCLUDE "engine/warp_connection.asm"
INCLUDE "engine/mystery_gift.asm"
INCLUDE "battle/used_move_text.asm"
INCLUDE "mobile/mobile_41.asm"
INCLUDE "gfx/overworld_font.asm"


SECTION "mobile_42", ROMX

INCLUDE "mobile/mobile_42.asm"


SECTION "Intro Logo", ROMX

IntroLogoGFX: ; 109407
INCBIN "gfx/intro/logo.2bpp.lz"


SECTION "bank43", ROMX

INCLUDE "engine/unused_title.asm"
INCLUDE "engine/title.asm"


INCLUDE "mobile/mobile_45.asm"


INCLUDE "mobile/mobile_46.asm"


SECTION "battle_tower_47", ROMX

INCLUDE "mobile/battle_tower_47.asm"


SECTION "bank5B", ROMX

INCLUDE "mobile/mobile_5b.asm"
INCLUDE "engine/link_trade.asm"


SECTION "mobile_5c", ROMX

INCLUDE "mobile/mobile_5c.asm"


SECTION "Crystal Phone Text 2", ROMX

INCLUDE "text/phone/extra2.asm"


SECTION "bank5E", ROMX

_UpdateBattleHUDs:
	callba DrawPlayerHUD
	ld hl, PlayerHPPal
	call SetHPPal
	callba DrawEnemyHUD
	ld hl, EnemyHPPal
	call SetHPPal
	callba FinishBattleAnim
	ret


SECTION "mobile_5e", ROMX

INCLUDE "mobile/mobile_5e.asm"


SECTION "bank5F", ROMX

INCLUDE "mobile/mobile_5f.asm"


SECTION "Common Text 1", ROMX

INCLUDE "text/stdtext.asm"
INCLUDE "text/phone/jack_overworld.asm"
INCLUDE "text/phone/beverly_overworld.asm"
INCLUDE "text/phone/huey_overworld.asm"
INCLUDE "text/phone/gaven_overworld.asm"
INCLUDE "text/phone/beth_overworld.asm"
INCLUDE "text/phone/jose_overworld.asm"
INCLUDE "text/phone/reena_overworld.asm"
INCLUDE "text/phone/joey_overworld.asm"
INCLUDE "text/phone/wade_overworld.asm"
INCLUDE "text/phone/ralph_overworld.asm"
INCLUDE "text/phone/liz_overworld.asm"


SECTION "Special Phone Text", ROMX

INCLUDE "text/phone/mom.asm"
INCLUDE "text/phone/bill.asm"
INCLUDE "text/phone/elm.asm"
INCLUDE "text/phone/trainers1.asm"


SECTION "bank72", ROMX

INCLUDE "data/items/item_names.asm"
INCLUDE "data/items/item_descriptions.asm"
INCLUDE "battle/move_names.asm"
INCLUDE "engine/landmarks.asm"


SECTION "bank77", ROMX

UnownFont: ; 1dc000
INCBIN "gfx/font/unown_font.2bpp"

INCLUDE "engine/print_party.asm"


SECTION "bank77_2", ROMX

INCLUDE "engine/printhoursmins.asm"
INCLUDE "engine/diploma.asm"
INCLUDE "engine/pokedex_3.asm"
INCLUDE "event/catch_tutorial_input.asm"
INCLUDE "engine/pokegear_2.asm"
INCLUDE "engine/european_mail.asm"


SECTION "Battle Tower Text", ROMX

INCLUDE "text/battle_tower.asm"


SECTION "Battle Tower Trainer Data", ROMX

INCLUDE "data/battle_tower_2.asm"


SECTION "Mobile News Data", ROMX

INCLUDE "mobile/news/news.asm"


SECTION "bank7E", ROMX

INCLUDE "engine/battle_tower.asm"
INCLUDE "engine/odd_eggs.asm"


SECTION "bank7F", ROMX


SECTION "Mobile Stadium 2", ROMX

IF DEF(CRYSTAL11)
INCBIN "mobile/stadium/stadium2_2.bin"
ELSE
INCBIN "mobile/stadium/stadium2_1.bin"
ENDC
