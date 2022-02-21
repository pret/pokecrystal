vc_hook: MACRO
    if DEF(_CRYSTALVC)
        .VC_\1::
	if (strcmp("BiographySave_ret", "\1") == 0)
		assert .VC_BiographySave_ret == $4B84, "vc_hook BiographySave_ret is not at address $4B84.\n This hook is hardcoded in the Virtual Console.\n Fix the address or remove it from your code and pokecrystalvc.patch.template"
		assert BANK(@) == $5, "vc_hook BiographySave_ret is not in bank $05.\n This hook is hardcoded in the Virtual Console.\n Fix the address or remove it from your code and pokecrystalvc.patch.template"
	endc
    endc
ENDM

vc_hJoyPressed_assert: MACRO
    if DEF(_CRYSTALVC)
        assert hJoyPressed == $ffa7, "hJoyPressed:: is no longer located at address $ffa7.\n You will need to manually update MemAddress for [print forbid 2], [print forbid 3], and [print forbid 5] in pokecrystalvc.patch.template."
    endc
ENDM
