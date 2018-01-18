# Text Commands

Defined in [macros/scripts/text.asm](/macros/scripts/text.asm) and [home/text.asm:TextCommands](/home/text.asm).


## `$00`: <code>text <i>text</i></code>

Start writing text until `"@"`.


## `$4E`: <code>next <i>text</i></code>

Move a line down.


## `$4F`: <code>line <i>text</i></code>

Start writing at the bottom line.


## `$50`: <code>page <i>text</i></code>

Start a new Pokédex page.


## `$51`: <code>para <i>text</i></code>

Start a new paragraph.


## `$55`: <code>cont <i>text</i></code>

Scroll to the next line.


## `$57`: `done`

End a text box.


## `$58`: `prompt`

Prompt the player to end a text box (initiating some other event).


## `$01`: <code>text_from_ram <i>address</i></code>

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


## `$06`: `text_waitbutton`

Wait for button press; show arrow.


## `$07`: `text_scroll`

Pushes text up two lines and sets the `bc` cursor to the border tile below the
first character column of the text box.


## `$08`: `start_asm`

Start interpreting assembly code.


## `$09`: <code>deciram <i>address</i>, <i>bytes</i>, <i>digits</i></code>

Read *bytes* bytes from *address* and print them as a *digits*-digit number.


## `$0A`: `interpret_data`

Exit.


## `$0B`: `sound_dex_fanfare_50_79`

Play `SFX_DEX_FANFARE_50_79`.


## `$0C`: <code>limited_interpret_data <i>n</i></code>

Print *n* `"…"`s.


## `$0D`: `link_wait_button`

Wait for button press; show arrow.


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

Write text from one of the following addresses (listed in [data/text_buffers.asm](/data/text_buffers.asm)):

0. `StringBuffer3`
1. `StringBuffer4`
2. `StringBuffer5`
3. `StringBuffer2`
4. `StringBuffer1`
5. `EnemyMonNick`
6. `BattleMonNick`


## `$15`: `current_day`

Print the weekday.


## `$16`: <code>text_jump <i>address</i></code>

Write text from a different bank.


## `$00`: `text_start`

Start writing regular text again after a special command.
