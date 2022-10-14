SECTION "bank1", ROMX

INCLUDE "engine/link/place_waiting_text.asm"
INCLUDE "engine/gfx/load_push_oam.asm"
INCLUDE "engine/overworld/map_objects.asm"
INCLUDE "engine/menus/intro_menu.asm"
INCLUDE "engine/overworld/init_map.asm"
INCLUDE "engine/pokemon/learn.asm"
INCLUDE "engine/pokemon/correct_nick_errors.asm"
INCLUDE "engine/math/math.asm"
INCLUDE "data/items/attributes.asm"
INCLUDE "engine/overworld/npc_movement.asm"
INCLUDE "engine/events/happiness_egg.asm"
INCLUDE "engine/events/shuckle.asm"
INCLUDE "engine/events/haircut.asm"


SECTION "bank2", ROMX

INCLUDE "engine/overworld/player_object.asm"
INCLUDE "engine/math/sine.asm"
INCLUDE "engine/predef.asm"
INCLUDE "engine/gfx/color.asm"


SECTION "bank3", ROMX

INCLUDE "engine/events/checktime.asm"
INCLUDE "engine/events/specials.asm"
INCLUDE "engine/math/print_num.asm"
INCLUDE "engine/pokemon/health.asm"
INCLUDE "engine/events/overworld.asm"
INCLUDE "engine/items/items.asm"
INCLUDE "engine/overworld/player_step.asm"
INCLUDE "engine/battle/anim_hp_bar.asm"
INCLUDE "engine/pokemon/move_mon.asm"
INCLUDE "engine/pokemon/breedmon_level_growth.asm"
INCLUDE "engine/events/bug_contest/caught_mon.asm"
INCLUDE "engine/items/item_effects.asm"
INCLUDE "engine/battle_anims/pokeball_wobble.asm"
INCLUDE "engine/pokemon/knows_move.asm"


SECTION "bank4", ROMX

INCLUDE "engine/items/pack.asm"
INCLUDE "engine/overworld/time.asm"
INCLUDE "engine/items/tmhm2.asm"
INCLUDE "engine/menus/naming_screen.asm"
INCLUDE "engine/events/misc_scripts.asm"
INCLUDE "engine/events/heal_machine_anim.asm"
INCLUDE "engine/events/whiteout.asm"
INCLUDE "engine/events/forced_movement.asm"
INCLUDE "engine/events/itemfinder.asm"
INCLUDE "engine/menus/start_menu.asm"
INCLUDE "engine/pokemon/mon_menu.asm"
INCLUDE "engine/overworld/select_menu.asm"
INCLUDE "engine/events/elevator.asm"
INCLUDE "engine/events/bug_contest/contest.asm"
INCLUDE "engine/events/repel.asm"
INCLUDE "engine/events/hidden_item.asm"
INCLUDE "engine/events/std_collision.asm"
INCLUDE "engine/events/bug_contest/judging.asm"
INCLUDE "engine/events/pokerus/apply_pokerus_tick.asm"
INCLUDE "engine/events/bug_contest/contest_2.asm"
INCLUDE "engine/pokemon/correct_party_errors.asm"
INCLUDE "engine/math/get_square_root.asm"


SECTION "bank5", ROMX

INCLUDE "engine/rtc/rtc.asm"
INCLUDE "engine/overworld/overworld.asm"
INCLUDE "engine/overworld/tile_events.asm"
INCLUDE "engine/menus/save.asm"
INCLUDE "engine/overworld/spawn_points.asm"
INCLUDE "engine/overworld/map_setup.asm"
INCLUDE "engine/events/pokecenter_pc.asm"
INCLUDE "engine/items/mart.asm"
INCLUDE "engine/events/money.asm"
INCLUDE "data/items/marts.asm"
INCLUDE "engine/events/mom.asm"
INCLUDE "engine/events/daycare.asm"
INCLUDE "engine/events/print_unown.asm"
INCLUDE "engine/events/print_photo.asm"
INCLUDE "engine/pokemon/breeding.asm"


SECTION "Roofs", ROMX

INCLUDE "engine/tilesets/mapgroup_roofs.asm"


SECTION "Clock Reset", ROMX

INCLUDE "engine/rtc/restart_clock.asm"


SECTION "bank9", ROMX

INCLUDE "data/text_buffers.asm"
INCLUDE "engine/menus/menu.asm"
INCLUDE "engine/items/update_item_description.asm"
INCLUDE "engine/events/pokepic.asm"
INCLUDE "engine/overworld/map_objects_2.asm"
INCLUDE "engine/menus/scrolling_menu.asm"
INCLUDE "engine/items/switch_items.asm"
INCLUDE "engine/menus/menu_2.asm"
INCLUDE "engine/pokemon/mon_submenu.asm"
INCLUDE "engine/battle/menu.asm"
INCLUDE "engine/items/buy_sell_toss.asm"
INCLUDE "engine/menus/trainer_card.asm"
INCLUDE "engine/events/prof_oaks_pc.asm"
INCLUDE "engine/overworld/decorations.asm"
INCLUDE "engine/pokemon/level_up_happiness.asm"
INCLUDE "engine/battle/read_trainer_dvs.asm"
INCLUDE "engine/battle/returntobattle_useball.asm"
INCLUDE "engine/battle/consume_held_item.asm"
INCLUDE "data/moves/effects.asm"
INCLUDE "engine/events/kurt_selectquantity_interpretjoypad.asm"


SECTION "bankA", ROMX

INCLUDE "engine/link/link.asm"
INCLUDE "engine/overworld/wildmons.asm"
INCLUDE "engine/battle/link_result.asm"


SECTION "bankB", ROMX

INCLUDE "engine/battle/trainer_huds.asm"
INCLUDE "data/trainers/class_names.asm"
INCLUDE "engine/battle/ai/redundant.asm"
INCLUDE "engine/events/move_deleter.asm"
INCLUDE "engine/link/mystery_gift_2.asm"
INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/pokemon/print_move_description.asm"
INCLUDE "engine/events/pokerus/pokerus.asm"
INCLUDE "engine/battle/start_battle.asm"
INCLUDE "engine/gfx/place_graphic.asm"


SECTION "Effect Commands", ROMX

INCLUDE "engine/battle/effect_commands.asm"


SECTION "Enemy Trainers", ROMX

INCLUDE "engine/battle/ai/items.asm"
INCLUDE "engine/battle/ai/scoring.asm"
INCLUDE "engine/battle/read_trainer_attributes.asm"
INCLUDE "engine/battle/read_trainer_party.asm"


SECTION "Battle Core", ROMX

INCLUDE "engine/battle/core.asm"
INCLUDE "data/battle/effect_command_pointers.asm"


SECTION "bank10", ROMX

INCLUDE "engine/pokedex/pokedex.asm"
INCLUDE "data/moves/moves.asm"
INCLUDE "engine/pokemon/evolve.asm"


SECTION "bank11", ROMX

INCLUDE "engine/events/fruit_trees.asm"
INCLUDE "engine/battle/ai/move.asm"
INCLUDE "engine/pokedex/pokedex_2.asm"
INCLUDE "engine/pokemon/mail.asm"


SECTION "Crystal Features 1", ROMX

INCLUDE "engine/menus/init_gender.asm"
INCLUDE "engine/items/pack_kris.asm"
INCLUDE "engine/events/move_tutor.asm"
INCLUDE "engine/gfx/crystal_layouts.asm"
INCLUDE "engine/events/celebi.asm"
INCLUDE "engine/menus/main_menu.asm"
INCLUDE "mobile/mobile_menu.asm"
INCLUDE "engine/pokemon/search_owned.asm"
INCLUDE "mobile/mobile_12_2.asm"
INCLUDE "engine/events/buena_menu.asm"


SECTION "bank13", ROMX

INCLUDE "engine/tilesets/map_palettes.asm"
INCLUDE "gfx/tileset_palette_maps.asm"
INCLUDE "data/collision/collision_permissions.asm"
INCLUDE "engine/menus/empty_sram.asm"
INCLUDE "engine/menus/savemenu_copytilemapatonce.asm"
INCLUDE "engine/events/checksave.asm"
INCLUDE "data/maps/scenes.asm"
INCLUDE "engine/overworld/load_map_part.asm"
INCLUDE "engine/phone/phonering_copytilemapatonce.asm"


SECTION "bank13_2", ROMX

INCLUDE "engine/link/link_2.asm"
INCLUDE "engine/rtc/reset_password.asm"
INCLUDE "engine/menus/delete_save.asm"
INCLUDE "data/tilesets.asm"
INCLUDE "engine/smallflag.asm"
INCLUDE "engine/gfx/trademon_frontpic.asm"
INCLUDE "engine/events/pokerus/check_pokerus.asm"
INCLUDE "engine/events/lucky_number.asm"
INCLUDE "engine/pokemon/caught_data.asm"
INCLUDE "engine/pokemon/search_party.asm"
INCLUDE "engine/pokemon/stats_screen.asm"
INCLUDE "engine/events/catch_tutorial.asm"
INCLUDE "engine/movie/evolution_animation.asm"
INCLUDE "engine/movie/init_hof_credits.asm"
INCLUDE "engine/events/battle_tower/get_trainer_class.asm"
INCLUDE "engine/battle/sliding_intro.asm"
INCLUDE "mobile/print_opp_message.asm"
INCLUDE "engine/battle/check_battle_scene.asm"
INCLUDE "engine/movie/gbc_only.asm"
INCLUDE "engine/events/poke_seer.asm"


SECTION "bank14", ROMX

INCLUDE "engine/pokemon/party_menu.asm"
INCLUDE "engine/events/poisonstep.asm"
INCLUDE "engine/events/sweet_scent.asm"
INCLUDE "engine/events/squirtbottle.asm"
INCLUDE "engine/events/card_key.asm"
INCLUDE "engine/events/basement_key.asm"
INCLUDE "engine/events/sacred_ash.asm"
INCLUDE "engine/pokemon/tempmon.asm"
INCLUDE "engine/pokemon/types.asm"
INCLUDE "engine/battle/getgen1trainerclassname.asm"
INCLUDE "engine/pokemon/mon_stats.asm"
INCLUDE "engine/link/init_list.asm"
INCLUDE "engine/pokemon/experience.asm"
INCLUDE "engine/pokemon/switchpartymons.asm"
INCLUDE "engine/gfx/load_pics.asm"
INCLUDE "data/pokemon/base_stats.asm"
INCLUDE "data/pokemon/names.asm"
INCLUDE "data/pokemon/unused_pic_banks.asm"


SECTION "Crystal Phone Text", ROMX

INCLUDE "data/phone/text/irwin_caller.asm"
INCLUDE "data/phone/text/arnie_caller.asm"
INCLUDE "data/phone/text/alan_caller.asm"
INCLUDE "data/phone/text/dana_caller.asm"
INCLUDE "data/phone/text/chad_caller.asm"
INCLUDE "data/phone/text/derek_caller.asm"
INCLUDE "data/phone/text/tully_caller.asm"
INCLUDE "data/phone/text/brent_caller.asm"
INCLUDE "data/phone/text/tiffany_caller.asm"
INCLUDE "data/phone/text/vance_caller.asm"
INCLUDE "data/phone/text/wilton_caller.asm"
INCLUDE "data/phone/text/kenji_caller.asm"
INCLUDE "data/phone/text/parry_caller.asm"
INCLUDE "data/phone/text/erin_caller.asm"


SECTION "bank20", ROMX

INCLUDE "engine/overworld/player_movement.asm"
INCLUDE "engine/events/engine_flags.asm"
INCLUDE "engine/overworld/variables.asm"
INCLUDE "data/text/battle.asm"
INCLUDE "engine/debug/color_picker.asm"


SECTION "bank21", ROMX

INCLUDE "engine/printer/printer_serial.asm"
INCLUDE "engine/printer/printer.asm"
INCLUDE "gfx/battle_anims.asm"
INCLUDE "engine/events/halloffame.asm"


SECTION "Crystal Features 2", ROMX

INCLUDE "engine/events/kurt.asm"
INCLUDE "engine/gfx/player_gfx.asm"
INCLUDE "mobile/mobile_22.asm"
INCLUDE "engine/events/unown_walls.asm"
INCLUDE "engine/events/buena.asm"
INCLUDE "engine/events/dratini.asm"
INCLUDE "engine/events/battle_tower/rules.asm"
INCLUDE "mobile/mobile_22_2.asm"


SECTION "bank23", ROMX

INCLUDE "engine/tilesets/timeofday_pals.asm"
INCLUDE "engine/battle/battle_transition.asm"
INCLUDE "engine/events/field_moves.asm"
INCLUDE "engine/events/magnet_train.asm"
INCLUDE "engine/battle/battlestart_copytilemapatonce.asm"
INCLUDE "engine/gfx/sprites.asm"
INCLUDE "engine/gfx/mon_icons.asm"


SECTION "bank24", ROMX

INCLUDE "engine/phone/phone.asm"
INCLUDE "engine/rtc/timeset.asm"
INCLUDE "engine/pokegear/pokegear.asm"
INCLUDE "engine/events/fish.asm"
INCLUDE "engine/games/slot_machine.asm"


SECTION "Phone Scripts 1", ROMX

INCLUDE "engine/phone/scripts/generic_caller.asm"
INCLUDE "engine/phone/scripts/jack_gossip.asm"
INCLUDE "engine/phone/scripts/liz_gossip.asm"
INCLUDE "engine/phone/scripts/chad_gossip.asm"
INCLUDE "engine/phone/scripts/brent_gossip.asm"
INCLUDE "engine/phone/scripts/irwin_gossip.asm"
INCLUDE "engine/phone/scripts/hangups.asm"
INCLUDE "engine/phone/scripts/reminders.asm"
INCLUDE "engine/phone/scripts/hangups_2.asm"
INCLUDE "engine/phone/scripts/reminders_2.asm"
INCLUDE "engine/phone/scripts/bike_shop.asm"
INCLUDE "engine/phone/scripts/buena.asm"


SECTION "Phone Text", ROMX

INCLUDE "data/phone/text/anthony_overworld.asm"
INCLUDE "data/phone/text/todd_overworld.asm"
INCLUDE "data/phone/text/gina_overworld.asm"
INCLUDE "data/phone/text/irwin_overworld.asm"
INCLUDE "data/phone/text/arnie_overworld.asm"
INCLUDE "data/phone/text/alan_overworld.asm"
INCLUDE "data/phone/text/dana_overworld.asm"
INCLUDE "data/phone/text/chad_overworld.asm"
INCLUDE "data/phone/text/derek_overworld.asm"
INCLUDE "data/phone/text/tully_overworld.asm"
INCLUDE "data/phone/text/brent_overworld.asm"
INCLUDE "data/phone/text/tiffany_overworld.asm"
INCLUDE "data/phone/text/vance_overworld.asm"
INCLUDE "data/phone/text/wilton_overworld.asm"
INCLUDE "data/phone/text/kenji_overworld.asm"
INCLUDE "data/phone/text/parry_overworld.asm"
INCLUDE "data/phone/text/erin_overworld.asm"


SECTION "bank2E", ROMX

INCLUDE "engine/events/map_name_sign.asm"
INCLUDE "engine/events/checkforhiddenitems.asm"
INCLUDE "engine/events/treemons.asm"
INCLUDE "engine/events/fishing_gfx.asm"
INCLUDE "engine/pokegear/radio.asm"
INCLUDE "engine/pokemon/mail_2.asm"


SECTION "Phone Scripts 2", ROMX

INCLUDE "engine/events/std_scripts.asm"
INCLUDE "engine/phone/scripts/unused.asm"
INCLUDE "engine/phone/scripts/mom.asm"
INCLUDE "engine/phone/scripts/bill.asm"
INCLUDE "engine/phone/scripts/elm.asm"
INCLUDE "engine/phone/scripts/jack.asm"
INCLUDE "engine/phone/scripts/beverly.asm"
INCLUDE "engine/phone/scripts/huey.asm"
INCLUDE "engine/phone/scripts/gaven.asm"
INCLUDE "engine/phone/scripts/beth.asm"
INCLUDE "engine/phone/scripts/jose.asm"
INCLUDE "engine/phone/scripts/reena.asm"
INCLUDE "engine/phone/scripts/joey.asm"
INCLUDE "engine/phone/scripts/wade.asm"
INCLUDE "engine/phone/scripts/ralph.asm"
INCLUDE "engine/phone/scripts/liz.asm"
INCLUDE "engine/phone/scripts/anthony.asm"
INCLUDE "engine/phone/scripts/todd.asm"
INCLUDE "engine/phone/scripts/gina.asm"
INCLUDE "engine/phone/scripts/irwin.asm"
INCLUDE "engine/phone/scripts/arnie.asm"
INCLUDE "engine/phone/scripts/alan.asm"
INCLUDE "engine/phone/scripts/dana.asm"
INCLUDE "engine/phone/scripts/chad.asm"
INCLUDE "engine/phone/scripts/derek.asm"
INCLUDE "engine/phone/scripts/tully.asm"
INCLUDE "engine/phone/scripts/brent.asm"
INCLUDE "engine/phone/scripts/tiffany.asm"
INCLUDE "engine/phone/scripts/vance.asm"
INCLUDE "engine/phone/scripts/wilton.asm"
INCLUDE "engine/phone/scripts/kenji.asm"
INCLUDE "engine/phone/scripts/parry.asm"
INCLUDE "engine/phone/scripts/erin.asm"
INCLUDE "engine/phone/scripts/generic_callee.asm"
INCLUDE "engine/events/trainer_scripts.asm"


SECTION "bank32", ROMX

INCLUDE "engine/battle_anims/bg_effects.asm"
INCLUDE "data/moves/animations.asm"
INCLUDE "engine/events/poisonstep_pals.asm"


SECTION "Move Animations", ROMX

INCLUDE "engine/events/bug_contest/display_stats.asm"
INCLUDE "engine/battle_anims/anim_commands.asm"
INCLUDE "engine/battle_anims/core.asm"
INCLUDE "engine/battle_anims/functions.asm"
INCLUDE "engine/battle_anims/helpers.asm"


SECTION "Pic Animations 1", ROMX

INCLUDE "engine/gfx/pic_animation.asm"
INCLUDE "gfx/pokemon/anim_pointers.asm"
INCLUDE "gfx/pokemon/anims.asm"
INCLUDE "gfx/pokemon/idle_pointers.asm"
INCLUDE "gfx/pokemon/idles.asm"
INCLUDE "gfx/pokemon/unown_anim_pointers.asm"
INCLUDE "gfx/pokemon/unown_anims.asm"
INCLUDE "gfx/pokemon/unown_idle_pointers.asm"
INCLUDE "gfx/pokemon/unown_idles.asm"
INCLUDE "gfx/pokemon/bitmask_pointers.asm"
INCLUDE "gfx/pokemon/bitmasks.asm"
INCLUDE "gfx/pokemon/unown_bitmask_pointers.asm"
INCLUDE "gfx/pokemon/unown_bitmasks.asm"


SECTION "Pic Animations 2", ROMX

INCLUDE "gfx/pokemon/frame_pointers.asm"
INCLUDE "gfx/pokemon/kanto_frames.asm"


SECTION "Pic Animations 3", ROMX

INCLUDE "gfx/pokemon/johto_frames.asm"
INCLUDE "gfx/pokemon/unown_frame_pointers.asm"
INCLUDE "gfx/pokemon/unown_frames.asm"


SECTION "bank38", ROMX

INCLUDE "engine/events/print_unown_2.asm"
INCLUDE "engine/games/card_flip.asm"
INCLUDE "engine/games/unown_puzzle.asm"
INCLUDE "engine/games/memory_game.asm"


SECTION "bank39", ROMX

INCLUDE "engine/menus/options_menu.asm"
INCLUDE "engine/movie/splash.asm"
INCLUDE "engine/movie/intro.asm"


SECTION "bank3E", ROMX

INCLUDE "engine/gfx/load_font.asm"
INCLUDE "engine/link/time_capsule.asm"
INCLUDE "engine/events/name_rater.asm"
INCLUDE "engine/events/play_slow_cry.asm"
INCLUDE "engine/pokedex/new_pokedex_entry.asm"
INCLUDE "engine/link/time_capsule_2.asm"
INCLUDE "engine/pokedex/unown_dex.asm"
INCLUDE "engine/events/magikarp.asm"
INCLUDE "engine/battle/hidden_power.asm"
INCLUDE "engine/battle/misc.asm"


SECTION "bank3F", ROMX

INCLUDE "engine/tilesets/tileset_anims.asm"
INCLUDE "engine/events/npc_trade.asm"
INCLUDE "engine/events/mom_phone.asm"


SECTION "mobile40", ROMX

INCLUDE "mobile/mobile_40.asm"


SECTION "bank41", ROMX

INCLUDE "engine/gfx/dma_transfer.asm"
INCLUDE "gfx/emotes.asm"
INCLUDE "engine/overworld/warp_connection.asm"
INCLUDE "engine/link/mystery_gift.asm"
INCLUDE "engine/battle/used_move_text.asm"
INCLUDE "mobile/mobile_41.asm"
INCLUDE "engine/gfx/load_overworld_font.asm"


SECTION "mobile42", ROMX

INCLUDE "mobile/mobile_42.asm"


SECTION "Title", ROMX

INCLUDE "engine/movie/unused_title.asm"
INCLUDE "engine/movie/title.asm"


SECTION "mobile45", ROMX

INCLUDE "mobile/mobile_45_sprite_engine.asm"
INCLUDE "mobile/mobile_45_2.asm"
INCLUDE "mobile/mobile_45_stadium.asm"


SECTION "mobile46", ROMX

INCLUDE "mobile/mobile_46.asm"


SECTION "Battle Tower", ROMX

INCLUDE "engine/events/battle_tower/trainer_text.asm"


SECTION "bank5B", ROMX

INCLUDE "mobile/mobile_5b.asm"
INCLUDE "engine/link/link_trade.asm"


SECTION "mobile5C", ROMX

INCLUDE "mobile/mobile_5c.asm"


SECTION "Crystal Phone Text 2", ROMX

INCLUDE "data/phone/text/bike_shop.asm"
INCLUDE "data/phone/text/jack_caller.asm"
INCLUDE "data/phone/text/beverly_caller.asm"
INCLUDE "data/phone/text/huey_caller.asm"
INCLUDE "data/phone/text/gaven_caller.asm"
INCLUDE "data/phone/text/beth_caller.asm"
INCLUDE "data/phone/text/jose_caller.asm"
INCLUDE "data/phone/text/reena_caller.asm"
INCLUDE "data/phone/text/joey_caller.asm"
INCLUDE "data/phone/text/wade_caller.asm"
INCLUDE "data/phone/text/ralph_caller.asm"
INCLUDE "data/phone/text/liz_caller.asm"
INCLUDE "data/phone/text/anthony_caller.asm"
INCLUDE "data/phone/text/todd_caller.asm"
INCLUDE "data/phone/text/gina_caller.asm"


SECTION "UpdateBattleHUDs", ROMX

INCLUDE "engine/battle/update_battle_huds.asm"


SECTION "mobile5E", ROMX

INCLUDE "mobile/mobile_5e.asm"


SECTION "mobile5F", ROMX

INCLUDE "mobile/mobile_5f.asm"


SECTION "Phone Text 2", ROMX

INCLUDE "data/text/std_text.asm"
INCLUDE "data/phone/text/jack_overworld.asm"
INCLUDE "data/phone/text/beverly_overworld.asm"
INCLUDE "data/phone/text/huey_overworld.asm"
INCLUDE "data/phone/text/gaven_overworld.asm"
INCLUDE "data/phone/text/beth_overworld.asm"
INCLUDE "data/phone/text/jose_overworld.asm"
INCLUDE "data/phone/text/reena_overworld.asm"
INCLUDE "data/phone/text/joey_overworld.asm"
INCLUDE "data/phone/text/wade_overworld.asm"
INCLUDE "data/phone/text/ralph_overworld.asm"
INCLUDE "data/phone/text/liz_overworld.asm"


SECTION "Special Phone Text", ROMX

INCLUDE "data/phone/text/mom.asm"
INCLUDE "data/phone/text/bill.asm"
INCLUDE "data/phone/text/elm.asm"
INCLUDE "data/phone/text/jack_callee.asm"
INCLUDE "data/phone/text/beverly_callee.asm"
INCLUDE "data/phone/text/huey_callee.asm"
INCLUDE "data/phone/text/unknown_callee.asm"
INCLUDE "data/phone/text/gaven_callee.asm"
INCLUDE "data/phone/text/beth_callee.asm"
INCLUDE "data/phone/text/jose_callee.asm"
INCLUDE "data/phone/text/reena_callee.asm"
INCLUDE "data/phone/text/joey_callee.asm"
INCLUDE "data/phone/text/wade_callee.asm"
INCLUDE "data/phone/text/ralph_callee.asm"
INCLUDE "data/phone/text/liz_callee.asm"
INCLUDE "data/phone/text/anthony_callee.asm"
INCLUDE "data/phone/text/todd_callee.asm"
INCLUDE "data/phone/text/gina_callee.asm"
INCLUDE "data/phone/text/irwin_callee.asm"
INCLUDE "data/phone/text/arnie_callee.asm"
INCLUDE "data/phone/text/alan_callee.asm"
INCLUDE "data/phone/text/dana_callee.asm"
INCLUDE "data/phone/text/chad_callee.asm"
INCLUDE "data/phone/text/derek_callee.asm"
INCLUDE "data/phone/text/tully_callee.asm"
INCLUDE "data/phone/text/brent_callee.asm"
INCLUDE "data/phone/text/tiffany_callee.asm"
INCLUDE "data/phone/text/vance_callee.asm"
INCLUDE "data/phone/text/wilton_callee.asm"
INCLUDE "data/phone/text/kenji_callee.asm"
INCLUDE "data/phone/text/parry_callee.asm"
INCLUDE "data/phone/text/erin_callee.asm"
INCLUDE "data/phone/text/unused.asm"


SECTION "Miscellaneous Text", ROMX

INCLUDE "data/items/names.asm"
INCLUDE "engine/items/print_item_description.asm"
INCLUDE "data/moves/names.asm"
INCLUDE "engine/overworld/landmarks.asm"


SECTION "Print Party", ROMX

INCLUDE "engine/printer/print_party.asm"


SECTION "bank77", ROMX

INCLUDE "engine/rtc/print_hours_mins.asm"
INCLUDE "engine/events/diploma.asm"
INCLUDE "engine/pokedex/pokedex_3.asm"
INCLUDE "engine/events/catch_tutorial_input.asm"
INCLUDE "engine/pokegear/townmap_convertlinebreakcharacters.asm"


SECTION "European Mail", ROMX

INCLUDE "engine/pokemon/european_mail.asm"


SECTION "Debug Room", ROMX

if DEF(_DEBUG)
INCLUDE "engine/debug/debug_room.asm"
endc


SECTION "Battle Tower Text", ROMX

INCLUDE "data/battle_tower/trainer_text.asm"


SECTION "Battle Tower Trainer Data", ROMX

INCLUDE "data/battle_tower/unknown.asm"


SECTION "Mobile News Data", ROMX

INCLUDE "mobile/news/news.asm"


SECTION "Crystal Events", ROMX

INCLUDE "engine/events/battle_tower/load_trainer.asm"
INCLUDE "engine/events/odd_egg.asm"


SECTION "Newbox", ROMX

INCLUDE "engine/pc/bills_pc.asm"
INCLUDE "engine/pc/bills_pc_ui.asm"


SECTION "Prism tilemap copy functions", ROMX

INCLUDE "engine/gfx/copy_tilemap_at_once.asm"


SECTION "VWF", ROMX

INCLUDE "engine/gfx/vwf.asm"


SECTION "Stadium 2 Checksums", ROMX[$7DE0], BANK[$7F]

; The end of the ROM is taken up by checksums of the content, apparently used
; by Pokémon Stadium 2 due to the checksums' "N64PS3" header. (In Japan,
; Pokémon Stadium Gold and Silver was the third Stadium release for N64.)
; This SECTION reserves space for those checksums.
; If it is removed, also remove the "tools/stadium" command in the Makefile.

	ds $220
