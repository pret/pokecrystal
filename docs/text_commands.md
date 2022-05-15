# Text Commands

Defined in [macros/scripts/text.asm](https://github.com/pret/pokecrystal/blob/master/macros/scripts/text.asm) and [home/text.asm:TextCommands](https://github.com/pret/pokecrystal/blob/master/home/text.asm).


## `$00`: `text_start`

Start writing text until `"@"`. The text can use [control characters](#control-characters).


## `$01`: <code>text_ram <i>address</i></code>

Write text from a RAM address.


## `$02`: <code>text_bcd <i>address</i>, <i>flags</i></code>

Write [BCD][bcd] from an address, typically RAM.

[bcd]: https://en.wikipedia.org/wiki/Binary-coded_decimal


## `$03`: <code>text_move <i>address</i></code>

Move to a new tile.


## `$04`: <code>text_box <i>address</i>, <i>height</i>, <i>width</i></code>

Draw a box.


## `$05`: `text_low`

Write text at (1, 16).


## `$06`: `text_promptbutton`

Wait for button press; show arrow.


## `$07`: `text_scroll`

Pushes text up two lines and sets the `bc` cursor to the border tile below the
first character column of the text box.


## `$08`: `text_asm`

Start interpreting assembly code.


## `$09`: <code>text_decimal <i>address</i>, <i>bytes</i>, <i>digits</i></code>

Read *bytes* bytes from *address* and print them as a *digits*-digit number.


## `$0A`: `text_pause`

Pause for 30 frames unless A or B is pressed.


## `$0B`: `sound_dex_fanfare_50_79`

Play `SFX_DEX_FANFARE_50_79`.


## `$0C`: <code>text_dots <i>n</i></code>

Print *n* `"…"`s, pausing for 10 frames after each; interrupt if A or B is pressed.


## `$0D`: `text_waitbutton`

Wait for button press; don't show arrow.


## `$0E`: `sound_dex_fanfare_20_49`

Play `SFX_DEX_FANFARE_20_49`.


## `$0F`: `sound_item`

Play `SFX_ITEM`.


## `$10`: `sound_caught_mon`

Play `SFX_CAUGHT_MON`.


## `$11`: `sound_dex_fanfare_80_109`

Play `SFX_DEX_FANFARE_80_109`.


## `$12`: `sound_fanfare`

Play `SFX_FANFARE`.


## `$13`: `sound_slot_machine_start`

Play `SFX_SLOT_MACHINE_START`.


## `$14`: <code>text_buffer <i>id</i></code>

Write text from one of the following addresses (listed in [data/text_buffers.asm](https://github.com/pret/pokecrystal/blob/master/data/text_buffers.asm)):

0. `wStringBuffer3`
1. `wStringBuffer4`
2. `wStringBuffer5`
3. `wStringBuffer2`
4. `wStringBuffer1`
5. `wEnemyMonNickname`
6. `wBattleMonNickname`


## `$15`: `text_today`

Print the weekday.


## `$16`: <code>text_far <i>address</i></code>

Write text from a different bank.


## `$50`: `text_end`

Stops processing text commands.


# Control characters

These get interpreted in the context of printing regular text. Macros exist to conveniently place the control characters.


## `$00`: <code>text <i>text</i></code>

Start writing text until `"@"`. (Not actually a control character, but shorter than `text_start` followed by `db`.)


## `$4E`, `"<NEXT>"`: <code>next <i>text</i></code>

Move a line down.


## `$4F`, `"<LINE>"`: <code>line <i>text</i></code>

Start writing at the bottom line.


## `$50`, `"@"`: <code>page <i>text</i></code>

Start a new Pokédex page.


## `$51`, `"<PARA>"`: <code>para <i>text</i></code>

Start a new paragraph.


## `$55`, `"<CONT>"`: <code>cont <i>text</i></code>

Scroll to the next line.


## `$57`, `"<DONE>"`: `done`

End a text box.


## `$58`, `"<PROMPT>"`: `prompt`

Prompt the player to end a text box (initiating some other event).
