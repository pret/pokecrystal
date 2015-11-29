command: macro
	enum \1_command
if def(command_macro)
purge command_macro
endc
command_macro equs "\n\1: macro\n\tdb \1_command"
endm

short_command: macro
	enum \1_command
\1 equs "db \1_command"
endm
