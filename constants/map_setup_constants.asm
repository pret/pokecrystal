; hMapEntryMethod values
; MapSetupScripts indexes (see data/maps/setup_scripts.asm)
	const_def $f1
	const MAPSETUP_WARP       ; f1
	const MAPSETUP_CONTINUE   ; f2
	const MAPSETUP_RELOADMAP  ; f3
	const MAPSETUP_TELEPORT   ; f4
	const MAPSETUP_DOOR       ; f5
	const MAPSETUP_FALL       ; f6
	const MAPSETUP_CONNECTION ; f7
	const MAPSETUP_LINKRETURN ; f8
	const MAPSETUP_TRAIN      ; f9
	const MAPSETUP_SUBMENU    ; fa
	const MAPSETUP_BADWARP    ; fb
	const MAPSETUP_FLY        ; fc
DEF NUM_MAPSETUP_SCRIPTS EQU const_value - $f1

; callback types
	const_def 1
	const MAPCALLBACK_TILES
	const MAPCALLBACK_OBJECTS
	const MAPCALLBACK_CMDQUEUE
	const MAPCALLBACK_SPRITES
	const MAPCALLBACK_NEWMAP
