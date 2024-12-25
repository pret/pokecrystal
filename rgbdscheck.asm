IF !DEF(__RGBDS_MAJOR__) || !DEF(__RGBDS_MINOR__) || !DEF(__RGBDS_PATCH__)
	fail "pokecrystal requires rgbds v0.9.0 or newer."
ENDC
IF __RGBDS_MAJOR__ == 0 && __RGBDS_MINOR__ < 9
	fail "pokecrystal requires rgbds v0.9.0 or newer."
ENDC
