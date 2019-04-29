SECTION "main.asm@ChrisBackpic", ROMX
ChrisBackpic:
INCBIN "gfx/player/chris_back.2bpp.lz"

SECTION "main.asm@DudeBackpic", ROMX
DudeBackpic:
INCBIN "gfx/battle/dude.2bpp.lz"

SECTION "main.asm@Shrink1Pic", ROMX
Shrink1Pic:
INCBIN "gfx/new_game/shrink1.2bpp.lz"

SECTION "main.asm@Shrink2Pic", ROMX
Shrink2Pic:
INCBIN "gfx/new_game/shrink2.2bpp.lz"

SECTION "main.asm@UnknownEggPic", ROMX
UnknownEggPic::
; Another egg pic. This is shifted up a few pixels.
INCBIN "gfx/unknown/unknown_egg.2bpp.lz"

SECTION "main.asm@KrisBackpic", ROMX
KrisBackpic:
INCBIN "gfx/player/kris_back.2bpp"

SECTION "main.asm@TheEndGFX", ROMX
TheEndGFX::
INCBIN "gfx/credits/theend.2bpp"

SECTION "main.asm@FontInversed", ROMX
FontInversed:
INCBIN "gfx/font/font_inversed.1bpp"

SECTION "main.asm@CopyrightGFX", ROMX
CopyrightGFX::
INCBIN "gfx/splash/copyright.2bpp"

SECTION "main.asm@IntroLogoGFX", ROMX
IntroLogoGFX:
INCBIN "gfx/intro/logo.2bpp.lz"

SECTION "main.asm@UnownFont", ROMX
UnownFont:
INCBIN "gfx/font/unown_font.2bpp"

SECTION "main.asm@PokegearGFX", ROMX
PokegearGFX:
INCBIN "gfx/pokegear/pokegear.2bpp.lz"


; This section is read by external programs/tools,
;   and is as such expected to be at the end of the ROM.
SECTION "main.asm@Mobile Stadium 2", ROMX[$7de0], BANK[$7f]

if DEF(_CRYSTAL_AU)
INCBIN "mobile/stadium/stadium2_au.bin"
elif DEF(_CRYSTAL11)
INCBIN "mobile/stadium/stadium2_11.bin"
else
INCBIN "mobile/stadium/stadium2.bin"
endc
