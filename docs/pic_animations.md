# Pic Animations

Defined in [macros/scripts/pic_anims.asm](https://github.com/pret/pokecrystal/blob/master/macros/scripts/pic_anims.asm).

Pic animations are assembled in 3 parts:

- Top-level animations:
   - <code>frame <i>N</i>, <i>duration</i></code>: Frame #0 is the original pic (no change)
   - <code>setrepeat <i>N</i></code>: Sets the number of times to repeat
   - <code>dorepeat <i>I</i></code>: Repeats from command #<i>I</i> (with the first command being #0)
   - `endanim`

- Bitmasks:
  Layered over the pic to designate affected tiles

- Frame definitions:
  first byte is the bitmask used for this frame  
  following bytes are tile ids mapped to each bit in the mask

Animation data is in these files:

- [gfx/pokemon/anims.asm](https://github.com/pret/pokecrystal/blob/master/gfx/pokemon/anims.asm):
  Main animations (played everywhere)

- [gfx/pokemon/idles.asm](https://github.com/pret/pokecrystal/blob/master/gfx/pokemon/idles.asm):
  Idle animations, appended to the main animation.  
  Used in the status screen (blinking, tail wags etc.)

- [gfx/pokemon/unown_anims.asm](https://github.com/pret/pokecrystal/blob/master/gfx/pokemon/unown_anims.asm) and [gfx/pokemon/unown_idles.asm](https://github.com/pret/pokecrystal/blob/master/gfx/pokemon/unown_idles.asm):
  Unown has its own animation data despite having an entry in the main tables.
