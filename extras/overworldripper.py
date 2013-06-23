import gfx

def rip_sprites_from_bank(bank, offset=0):
    """
    Rips sprites from specified bank.

    Sprites are 4x4.
    """
    file_handler = open("../gfx/overworld/bank" + str(hex(bank))[2:] + ".asm", "w")
    for sprite in range(0 + offset, 256 + offset):
        filename = "../gfx/overworld/" + str(sprite).zfill(3) + ".2bpp"
        gfx.get_uncompressed_gfx((bank * 0x4000 + ((sprite - offset) * 4 * 0x10)), 4, filename)
        gfx.to_png(filename)
        file_handler.write("INCBIN \"" + filename[3:] + "\"\n")
    file_handler.close()

rip_sprites_from_bank(0x30)
rip_sprites_from_bank(0x31, offset=256)
