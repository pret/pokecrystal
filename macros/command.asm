; Creates a command macro.
; Also exposes a <name>_command constant that can be used for explicit comparison.
; rgbasm can't close on a trailing macro, so the new macro has to be invoked manually.
; Usage:
; 	command example
; 	command_macro
; 	db \1 ; this is just a regular macro
; 	endm
command: macro
	enum \1_command
if def(command_macro)
purge command_macro
endc
command_macro equs "\n\1: macro\n\tdb \1_command"
endm

; Creates a command macro with no parameters. This is surprisingly common.
; Only meant for command sets with no parameters at all.
short_command: macro
	enum \1_command
\1 equs "db \1_command"
endm
