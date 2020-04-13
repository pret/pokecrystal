if !DEF(__RGBDS_MINOR__)
	fail "pokecrystal requires rgbds 0.4.0 or newer."
endc
if __RGBDS_MAJOR__ <= 0 && __RGBDS_MINOR__ < 4
	fail "pokecrystal requires rgbds 0.4.0 or newer."
endc
