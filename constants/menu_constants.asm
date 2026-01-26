; MenuHeader flags
	const_def
	shift_const MENU_RESTORE_TILES  ; 0
	const_skip 2
	shift_const MENU_NO_CLICK_SFX   ; 3
	shift_const MENU_SPRITE_ANIMS   ; 4
	shift_const MENU_UNUSED         ; 5
	shift_const MENU_BACKUP_TILES   ; 6
	shift_const MENU_BACKUP_TILES_2 ; 7

; VerticalMenu/DoNthMenu/SetUpMenu/_2DMenu MenuData flags
; Per flag the comment specifies which menus actually implement it
	const_def
	shift_const STATICMENU_DISABLE_B         ; 0 ; VerticalMenu/_2DMenu
	shift_const STATICMENU_ENABLE_SELECT     ; 1 ; VerticalMenu/_2DMenu
	shift_const STATICMENU_ENABLE_LEFT_RIGHT ; 2 ; DoNthMenu/SetUpMenu
	shift_const STATICMENU_ENABLE_START      ; 3 ; DoNthMenu/SetUpMenu
	shift_const STATICMENU_PLACE_TITLE       ; 4 ; VerticalMenu
	shift_const STATICMENU_WRAP              ; 5 ; All
	shift_const STATICMENU_NO_TOP_SPACING    ; 6 ; VerticalMenu/_2DMenu
	shift_const STATICMENU_CURSOR            ; 7 ; VerticalMenu/_2DMenu

; ScrollingMenu MenuData flags
	const_def
	shift_const SCROLLINGMENU_CALL_FUNCTION1_CANCEL    ; 0
	shift_const SCROLLINGMENU_CALL_FUNCTION3_NO_SWITCH ; 1
	shift_const SCROLLINGMENU_ENABLE_RIGHT             ; 2
	shift_const SCROLLINGMENU_ENABLE_LEFT              ; 3
	shift_const SCROLLINGMENU_DISPLAY_ARROWS           ; 4
	shift_const SCROLLINGMENU_ENABLE_FUNCTION3         ; 5
	shift_const SCROLLINGMENU_ENABLE_START             ; 6
	shift_const SCROLLINGMENU_ENABLE_SELECT            ; 7

; ScrollingMenu items structure format
	const_def 1
	const SCROLLINGMENU_ITEMS_NORMAL   ; 1
	const SCROLLINGMENU_ITEMS_QUANTITY ; 2

; _2DMenu more flags
	const_def
	shift_const _2DMENU_EXIT_RIGHT            ; 0
	shift_const _2DMENU_EXIT_LEFT             ; 1
	shift_const _2DMENU_EXIT_UP               ; 2
	shift_const _2DMENU_EXIT_DOWN             ; 3
	shift_const _2DMENU_WRAP_LEFT_RIGHT       ; 4
	shift_const _2DMENU_WRAP_UP_DOWN          ; 5
	shift_const _2DMENU_ENABLE_SPRITE_ANIMS   ; 6
	shift_const _2DMENU_DISABLE_JOYPAD_FILTER ; 7

; _2DMenu more flags 2
	const_def
	const_skip 7
	shift_const _2DMENU_EXITING ; 7

; MonMenuOptions indexes (see data/mon_menu.asm)
; used by PokemonActionSubmenu (see engine/pokemon/mon_menu.asm)
	const_def 1
	; moves
	const MONMENUITEM_CUT        ; 1
	const MONMENUITEM_FLY        ; 2
	const MONMENUITEM_SURF       ; 3
	const MONMENUITEM_STRENGTH   ; 4
	const MONMENUITEM_WATERFALL  ; 5
	const MONMENUITEM_FLASH      ; 6
	const MONMENUITEM_WHIRLPOOL  ; 7
	const MONMENUITEM_DIG        ; 8
	const MONMENUITEM_TELEPORT   ; 9
	const MONMENUITEM_SOFTBOILED ; 10
	const MONMENUITEM_HEADBUTT   ; 11
	const MONMENUITEM_ROCKSMASH  ; 12
	const MONMENUITEM_MILKDRINK  ; 13
	const MONMENUITEM_SWEETSCENT ; 14
	; options
	const MONMENUITEM_STATS      ; 15
	const MONMENUITEM_SWITCH     ; 16
	const MONMENUITEM_ITEM       ; 17
	const MONMENUITEM_CANCEL     ; 18
	const MONMENUITEM_MOVE       ; 19
	const MONMENUITEM_MAIL       ; 20
	const MONMENUITEM_ERROR      ; 21
DEF NUM_MONMENUITEMS EQU const_value - 1

; MonMenuOptions categories
DEF MONMENU_FIELD_MOVE EQU 0
DEF MONMENU_MENUOPTION EQU 1

DEF NUM_MONMENU_ITEMS EQU 8

; start/select menu return values
DEF HMENURETURN_SCRIPT EQU %10000000
DEF HMENURETURN_ASM    EQU %11111111

; PartyMenuQualityPointers indexes (see data/party_menu_qualities.asm)
	const_def
	const PARTYMENUACTION_CHOOSE_POKEMON
	const PARTYMENUACTION_HEALING_ITEM
	const PARTYMENUACTION_SWITCH
	const PARTYMENUACTION_TEACH_TMHM
	const PARTYMENUACTION_MOVE
	const PARTYMENUACTION_EVO_STONE
	const PARTYMENUACTION_GIVE_MON
	const PARTYMENUACTION_GIVE_MON_FEMALE ; unused
	const PARTYMENUACTION_GIVE_ITEM
	const PARTYMENUACTION_MOBILE ; mobile
DEF NUM_PARTYMENUACTIONS EQU const_value
; PrintPartyMenuActionText arguments (see engine/pokemon/party_menu.asm)
	const_next $f0
	const PARTYMENUTEXT_HEAL_PSN
	const PARTYMENUTEXT_HEAL_BRN
	const PARTYMENUTEXT_HEAL_FRZ
	const PARTYMENUTEXT_HEAL_SLP
	const PARTYMENUTEXT_HEAL_PAR
	const PARTYMENUTEXT_HEAL_HP
	const PARTYMENUTEXT_HEAL_ALL
	const PARTYMENUTEXT_REVIVE
	const PARTYMENUTEXT_LEVEL_UP
	const PARTYMENUTEXT_HEAL_CONFUSION

; Naming types (see engine/menus/naming_screen.asm)
	const_def
	const NAME_MON
	const NAME_PLAYER
	const NAME_RIVAL
	const NAME_MOM
	const NAME_BOX
	const NAME_FRIEND
	const NAME_6 ; duplicate of NAME_MON
	const NAME_7 ; duplicate of NAME_MON
DEF NUM_NAMING_SCREEN_TYPES EQU const_value
