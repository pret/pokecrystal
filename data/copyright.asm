; This file is INCLUDEd twice in different ROM banks:
; once for CreditsStringsPointers.Copyright (see data/credits_strings.asm),
; and once for CopyrightString (see engine/menus/intro_menu.asm).

	db   $60                               ; ©
	db   $61, $62, $63, $64, $65, $66      ; 1995-2001
	db   $67, $68, $69, $6a, $6b, $6c      ; Nintendo
	next $60                               ; ©
	db   $61, $62, $63, $64, $65, $66      ; 1995-2001
	db   $6d, $6e, $6f, $70, $71, $72      ; Creatures
	db   $7a, $7b, $7c                     ; inc.
	next $60                               ; ©
	db   $61, $62, $63, $64, $65, $66      ; 1995-2001
	db   $73, $74, $75, $76, $77, $78, $79 ; GAME FREAK
	db   $7a, $7b, $7c                     ; inc.
	db   "@"
