# Pic Animations

Defined in [macros/scripts/gfx_anims.asm](/macros/scripts/gfx_anims.asm).

Pic animations are assembled in 3 parts:

- Top-level animations:
   - `frame` *#*, *duration*: Frame 0 is the original pic (no change)
   - `setrepeat` *#*: Sets the number of times to repeat
   - `dorepeat` *#*: Repeats from command *#* (starting from 0)
   - `end`

- Bitmasks:
  Layered over the pic to designate affected tiles

- Frame definitions:
  first byte is the bitmask used for this frame  
  following bytes are tile ids mapped to each bit in the mask

Animation data is in these files:

- [gfx/pokemon/anims.asm](/gfx/pokemon/anims.asm):
  Main animations (played everywhere)

- [gfx/pokemon/extras.asm](/gfx/pokemon/extras.asm):
  Extra animations, appended to the main animation.  
  Used in the status screen (blinking, tail wags etc.)

- [gfx/pokemon/unown_anims.asm](/gfx/pokemon/unown_anims.asm) and [gfx/pokemon/unown_extras.asm](/gfx/pokemon/unown_extras.asm):
  Unown has its own animation data despite having an entry in the main tables.
