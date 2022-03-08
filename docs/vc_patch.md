# Nintendo 2DS/3DS Virtual Console Patch

The Nintendo Virtual Console for the 2DS and 3DS can play Game Boy Color ROMs bundled into a `.cia` (CTR Importable Archive) file. Creating a `.cia` file for a `.gbc` ROM file is outside the scope of this project.

An optional file bundled in the `.cia` archive is a `.patch` file with the same name as the `.gbc` file, used to determine when and under what conditions to enable certain Virtual Console functionalities, such as the Wireless Link capabilities. It also allows arbitrary content in the ROM to be modified, such as for disabling the Game Boy Printer features of Pokémon Crystal.


## Build pokecrystalvc.patch

To build **pokecrystalvc.patch**:

```bash
make crystalvc
```

This will also create two ROM files, **pokecrystal11.gbc** and **pokecrystalvc.gbc**. The pokecrystalvc.gbc file has the patches already applied to it. Do not use this file; rename pokecrystalvc.patch to **pokecrystal11.patch** and bundle it together with pokecrystal11.gbc in a `.cia` file.


## vc/pokecrystalvc.constants.asm

The `.constants.asm` file is used to create a `.constants.sym` file. Typical `.sym` files only list the values of *labels* (ROM banks and addresses); this file is used to list *constants* that are needed by the patch template. Any constants that the patch template needs must be explicitly printed here with the `vc_const` macro.


## vc/pokecrystalvc.patch.template

The `.patch.template` file is used to create the `.patch` file. Many numeric values in the `.patch` file are derived from the values of labels, constants, and ROM content; these values are abstracted into *commands* that get evaluated by `tools/make_patch` and turned into their actual values.


## tools/make_patch.c

The program used to convert a `.patch.template` into a `.patch` file.

To convert `vc.patch.template` into `vc.patch`:

```bash
tools/make_patch labels.sym constants.sym patched.gbc original.gbc vc.patch.template vc.patch
```

For example, this is what `make crystalvc` uses:

```bash
tools/make_patch pokecrystalvc.sym vc/pokecrystalvc.constants.sym pokecrystalvc.gbc pokecrystal11.gbc vc/pokecrystalvc.patch.template pokecrystalvc.patch
```


## Patch template syntax

**Comments** start at a semicolon "`;`" and continue until the end of the line. They are output as-is, without interpreting commands.

**Patch names** are contained in "`[`" brackets "`]`". They are output as-is, without interpreting commands.

Patch names also set the **current patch label**. This is the label starting with "`.VC_`" followed by the patch name, with any invalid characters (not letters "`A-Z`", digits "`0-9`", underscore "`_`", at sign "`@`", or hash "`#`") converted to underscores "`_`". For example, the patch name "`[fight begin]`" corresponds to the patch label "`.VC_fight_begin`".

**Commands** are contained in "`{`" braces "`}`". They are not output themselves, but may produce their own output when interpreted.

Commands are interpreted with a series of arguments, separated by whitespace (spaces, tabs, or newlines). Leading and trailing whitespace is ignored; for example, "`{  hex  @  4  }`" is interpreted the same as "`{hex @ 4}`".

**Arguments** evaluate to numeric values. They may be any of the following:

- Literal numbers in base 10 (e.g. "`42`"), 16 (e.g. "`0x2a`"), or octal (e.g. "`052`").
- Comparison operators: "`==`" is 0, "`>`" is 2, "`<`" is 1, "`>=`" is 3, "`<=`" is 4, "`!=`" is 5, and "`||`" is 0x11.
- Symbol names from the two `.sym` files provided to `make_patch` may evaluate as their address, or their absolute offset in the ROM, depending on the command. They may also be followed by a plus sign "`+`" and a literal number that gets added to the value.
- "`@`" evaluates as the address or absolute offset of the current patch label.

Any other characters are output as-is.


## Patch template commands

### `patch` or `PATCH`

Seeks the patched ROM contents between the current patch label, and the label which is the current patch label plus "`_End`". Outputs the bytes between those labels as a hexadecimal number "<code>0x<i>V</i></code>" if there is only one byte <code><i>V</i></code>, or as a *value series* "<code>a<i>N</i>:<i>V1</i> <i>V2</i> [...] <i>VN</i></code>" for multiple bytes.

An optional argument is an *offset* to add to the current patch label before gathering the contents between it and the end label.

As "`patch`", the byte values use lowercase for hexadecimal digits A-F; as "`PATCH`", they use uppercase.

For example, if "`{patch}`" outputs "`a2:ab cd`", then "`{PATCH 1}`" outputs "`0xCD`".


### `dws` or `DWS`

Outputs the alternating low and high bytes of its arguments as a value series. Unlike "`patch`", a space is output after the colon preceding the values.

As "`dws`", the values use lowercase; as "`DWS`", they use uppercase.

For example, "`{dws 1 2 0xabcd}`" outputs "`a6: 01 00 02 00 cd ab`".


### `db` or `DB`

Outputs its argument as a single-byte value series. Like "`patch`", no space is output after the colon preceding the value.

As "`db`", the value uses lowercase; as "`DB`", it uses uppercase.

For example, "`{DB 0xef}`" outputs "`a1:EF`".


### `hex`, `HEX`, `Hex`, `HEx`, `hEX`, or `heX`

Outputs its first argument as a hexadecimal number. An optional second argument is the minimum length in digits; values shorter than it will be padded with leading zeros.

As "`hex`", the value uses lowercase; as "`HEX`", it uses uppercase. The other variations are for inconsistent casing: "`Hex`" prints the last three digits in lowercase and the rest uppercase; "`HEx`" prints the last two digits in lowercase and the rest uppercase; "`hEX`" prints the last three digits in uppercase and the rest lowercase; and "`heX`" prints the last two digits in uppercase and the rest lowercase.

For example, "`{Hex 0xabcd 5}`" outputs "`0x0Abcd`".