INCLUDE "includes.asm"


SECTION "bank1", ROMX

INCLUDE "engine/routines/placewaitingtext.asm"
INCLUDE "engine/routines/loadpushoam.asm"
INCLUDE "engine/map_objects.asm"
INCLUDE "engine/intro_menu.asm"
INCLUDE "engine/init_map.asm"
INCLUDE "engine/learn.asm"
INCLUDE "engine/routines/checknickerrors.asm"
INCLUDE "engine/math.asm"
INCLUDE "data/items/item_attributes.asm"
INCLUDE "engine/npc_movement.asm"
INCLUDE "event/happiness_egg.asm"
INCLUDE "event/special.asm"


SECTION "bank2", ROMX

INCLUDE "engine/player_object.asm"
INCLUDE "engine/routines/sine.asm"
INCLUDE "engine/predef.asm"
INCLUDE "engine/color.asm"


SECTION "bank3", ROMX

INCLUDE "engine/routines/checktime.asm"
INCLUDE "engine/specials.asm"
INCLUDE "engine/printnum.asm"
INCLUDE "engine/health.asm"
INCLUDE "event/overworld.asm"
INCLUDE "engine/items.asm"
INCLUDE "engine/player_step.asm"
INCLUDE "engine/anim_hp_bar.asm"
INCLUDE "engine/move_mon.asm"
INCLUDE "engine/billspctop.asm"
INCLUDE "engine/routines/getbreedmonlevelgrowth.asm"
INCLUDE "event/bug_contest/caught_mon.asm"
INCLUDE "engine/item_effects.asm"
INCLUDE "engine/routines/getpokeballwobble.asm"
INCLUDE "engine/routines/knowsmove.asm"


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
INCLUDE "engine/pokerus/apply_pokerus_tick.asm"
INCLUDE "event/bug_contest/contest_2.asm"
INCLUDE "engine/routines/correcterrorsinplayerparty.asm"
INCLUDE "engine/routines/getsquareroot.asm"


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


SECTION "Roofs", ROMX

INCLUDE "tilesets/roofs.asm"


SECTION "Clock Reset", ROMX

INCLUDE "engine/clock_reset.asm"


SECTION "bank9", ROMX

INCLUDE "data/text_buffers.asm"
INCLUDE "engine/menu.asm"
INCLUDE "engine/routines/updateitemdescription.asm"
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
INCLUDE "engine/routines/leveluphappinessmod.asm"
INCLUDE "data/trainers/trainer_dvs.asm"
INCLUDE "engine/routines/returntobattle_useball.asm"
INCLUDE "engine/routines/consumehelditem.asm"
INCLUDE "battle/moves/move_effects_pointers.asm"
INCLUDE "battle/moves/move_effects.asm"
INCLUDE "engine/routines/kurt_selectquantity_interpretjoypad.asm"


SECTION "bankA", ROMX

INCLUDE "engine/link.asm"
INCLUDE "engine/wildmons.asm"
INCLUDE "battle/link_result.asm"

ChrisBackpic: ; 2ba1a
INCBIN "gfx/player/chris_back.2bpp.lz"

DudeBackpic: ; 2bbaa
INCBIN "gfx/battle/dude.2bpp.lz"


SECTION "bankB", ROMX

INCLUDE "battle/trainer_huds.asm"
INCLUDE "data/trainers/trainer_class_names.asm"
INCLUDE "battle/ai/redundant.asm"
INCLUDE "event/move_deleter.asm"
INCLUDE "engine/mystery_gift_2.asm"
INCLUDE "engine/tmhm2.asm"
INCLUDE "battle/moves/move_descriptions.asm"
INCLUDE "engine/pokerus/pokerus.asm"
INCLUDE "engine/start_battle.asm"
INCLUDE "engine/routines/placegraphic.asm"


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
INCLUDE "engine/routines/drawkrispackgfx.asm"
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

; unreferenced
; 0x4ce05
rept 26
	db $06
endr
; 0x4ce1f

INCLUDE "data/collision_permissions.asm"
INCLUDE "engine/routines/emptyallsrambanks.asm"
INCLUDE "engine/routines/savemenu_copytilemapatonce.asm"
INCLUDE "engine/routines/checksave.asm"
INCLUDE "data/maps/map_scenes.asm"
INCLUDE "engine/routines/loadmappart.asm"
INCLUDE "engine/routines/phonering_copytilemapatonce.asm"

Shrink1Pic: ; 4d249
INCBIN "gfx/shrink/shrink1.2bpp.lz"

Shrink2Pic: ; 4d2d9
INCBIN "gfx/shrink/shrink2.2bpp.lz"

INCLUDE "engine/link_2.asm"
INCLUDE "engine/delete_save_change_clock.asm"
INCLUDE "tilesets/tilesets.asm"
INCLUDE "engine/routines/flagpredef.asm"
INCLUDE "engine/routines/trademonfrontpic.asm"
INCLUDE "engine/pokerus/check_pokerus.asm"
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
INCLUDE "engine/routines/checkbattlescene.asm"
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
INCLUDE "engine/routines/initlist.asm"
INCLUDE "engine/experience.asm"
INCLUDE "engine/routines/switchpartymons.asm"
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
INCLUDE "engine/routines/battlestart_copytilemapatonce.asm"
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
INCLUDE "engine/routines/playslowcry.asm"
INCLUDE "engine/routines/newpokedexentry.asm"
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

INCLUDE "engine/routines/updatebattlehuds.asm"


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

INCLUDE "engine/routines/printhoursmins.asm"
INCLUDE "engine/diploma.asm"
INCLUDE "engine/pokedex_3.asm"
INCLUDE "event/catch_tutorial_input.asm"
INCLUDE "engine/routines/townmap_convertlinebreakcharacters.asm"

PokegearGFX: ; 1de2e4
INCBIN "gfx/pokegear/pokegear.2bpp.lz"

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
