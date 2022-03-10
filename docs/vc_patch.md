# Nintendo 2DS/3DS Virtual Console Patch

The Nintendo Virtual Console is an emulator on the 2DS and 3DS consoles. It can emulate the Game Boy Color (among other consoles), while applying enhancements or modifications to some games, such as replacing Link Cable functionality with the DS' Wireless Link capabilities, or disabling Game Boy Printer features.

Game-specific enhancements are determined by a `.patch` file corresponding to the `.gbc` ROM file. These files are bundled together in a `.cia` file; creating such a file is outside the scope of this project.


## Build pokecrystal11.patch

To build **pokecrystal11.patch**:

```bash
make crystal11_vc
```

This will also create two ROM files, **pokecrystal11.gbc** and **pokecrystal11_vc.gbc**. The pokecrystal11_vc.gbc file has the patches already applied to it; do *not* use this file! The ROM file and patch file must share the same name, so use pokecrystal11.patch together with pokecrystal11.gbc.


## vc/pokecrystal11.constants.asm

The `.constants.asm` file is used to create a `.constants.sym` file. Typical `.sym` files only list the values of *labels* (ROM banks and addresses); this file is used to list *constants* that are needed by the patch template. Any constants that the patch template needs must be explicitly printed here with the `vc_const` macro.


## vc/pokecrystal11.patch.template

The `.patch.template` file is used to create the `.patch` file. Many numeric values in the `.patch` file are derived from the values of labels, constants, and ROM content; these values are abstracted into *commands* that get evaluated by `tools/make_patch` to output symbolic names as their actual values, formatted to match the original `.patch` file.


## tools/make_patch.c

The program used to convert a `.patch.template` into a `.patch` file.

To convert `vc.patch.template` into `vc.patch`:

```bash
tools/make_patch labels.sym constants.sym patched.gbc original.gbc vc.patch.template vc.patch
```

For example, this is what `make crystalvc` uses:

```bash
tools/make_patch pokecrystal11_vc.sym vc/pokecrystal11.constants.sym pokecrystal11_vc.gbc pokecrystal11.gbc vc/pokecrystal11.patch.template pokecrystal11.patch
```


## Patch template syntax

**Comments** start at a semicolon "`;`" and continue until the end of the line. They are output as-is, without interpreting commands.

**Patch names** are contained in "`[`" brackets "`]`". They are output as-is, without interpreting commands.

Patch names also set the **current patch label**. This is the label starting with "`.VC_`" followed by the patch name, with any invalid characters (not letters "`A-Z`", digits "`0-9`", underscore "`_`", at sign "`@`", or hash "`#`") converted to underscores "`_`". For example, the patch name "`[fight begin]`" corresponds to the patch label "`.VC_fight_begin`".

**Commands** are contained in "`{`" braces "`}`". They are not output themselves, but may produce their own output when interpreted.

Commands are interpreted with a series of arguments, separated by whitespace (spaces, tabs, or newlines). Leading and trailing whitespace is ignored; for example, "`{  hex  @  4  }`" is interpreted the same as "`{hex @ 4}`".

**Arguments** evaluate to numeric values. They may be any of the following:

- Literal numbers in decimal (base 10, e.g. "`42`"), hexadecimal (base 16, e.g. "`0x2a`"), or octal (base 8, e.g. "`052`"). They may start with a plus sign "`+`". Numbers may not be negative.
- Comparison operators: "`==`" is 0, "`>`" is 1, "`<`" is 2, "`>=`" is 3, "`<=`" is 4, "`!=`" is 5, and "`||`" is 0x11.
- Symbol names from the two `.sym` files provided to `make_patch` may evaluate as their bank-relative address, or their absolute offset in the ROM, depending on the command. They may also be followed by a plus sign and a literal number that gets added to the value.
- "`@`" evaluates as the address or absolute offset of the current patch label.

Any other characters are output as-is.


## Patch template commands

### `patch`, `PATCH`, `patch_`, or `PATCH_`

Seeks the patched ROM contents between the current patch label, and the label which is the current patch label plus "`_End`". Outputs the bytes between those labels as a hexadecimal number "<code>0x<i>V</i></code>" for only one byte, or as a *value series* "<code>a<i>N</i>: <i>V1</i> <i>V2</i> [...] <i>VN</i></code>" for multiple bytes.

An optional argument is an *offset* to add to the current patch label before gathering the contents between it and the end label.

If the command name is all lowercase, the byte values use lowercase for hexadecimal digits A-F; if it is all uppercase, they use uppercase. If the command name ends in an underscore, a space is output after the colon preceding the values; if not, then it is not.

For example, if "`{patch}`" outputs "`a3:ab cd ef`", then "`{PATCH_ 1}`" outputs "`a2: CD EF`", and "`{patch 2}`" outputs "`0xef`".

Converting the patch template will print a warning if any differences exist between the original and patched ROMs, which are not covered by "`patch`" commands.


### `dws`, `DWS`, `dws_`, or `DWS_`

Outputs the alternating low and high bytes of its arguments as a value series.

Symbol names or "`@`" are evaluated as their relative address.

If the command name is all lowercase, the byte values use lowercase; if it is all uppercase, they use uppercase. If the command name ends in an underscore, a space is output after the colon; if not, then it is not.

For example, if "`{dws_ 42 0xabcd wCurSpecies}`" outputs "`a6: 2a 00 cd ab 60 cf`", then "`{DWS >= wCurSpecies+3}`" outputs "`a4:04 00 63 CF`".


### `db`, `DB`, `db_`, or `DB_`

Outputs its argument as a single-byte value series.

Symbol names or "`@`" are evaluated as their relative address.

If the command name is all lowercase, the byte value uses lowercase; if it is all uppercase, it uses uppercase. If the command name ends in an underscore, a space is output after the colon; if not, then it is not.

For example, "`{db 0xEF}`" outputs "`a1:ef`", and "`{DB_ 251}`" outputs "`a1: FB`".


### `hex`, `HEX`, `Hex`, `HEx`, `hEX`, or `heX`

Outputs its first argument as a hexadecimal number. An optional second argument is the minimum length in digits; values shorter than it will be padded with leading zeros.

Symbol names or "`@`" are evaluated as their absolute offset.

As "`hex`", the value uses lowercase; as "`HEX`", it uses uppercase. The other variations are for inconsistent casing: "`Hex`" prints the last three digits in lowercase and the rest uppercase; "`HEx`" prints the last two digits in lowercase and the rest uppercase; "`hEX`" prints the last three digits in uppercase and the rest lowercase; and "`heX`" prints the last two digits in uppercase and the rest lowercase.

For example, "`{Hex 0xabcd 5}`" outputs "`0x0Abcd`", and "`{heX 0xaaabb}`" outputs "`0xaaaBB`".
