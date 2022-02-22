vc_hook: MACRO
    if DEF(_CRYSTALVC)
        .VC_\1::
    endc
ENDM


vc_patch: MACRO
    if DEF(_CRYSTALVC)
	.VC\1::
    endc
ENDM


vc_assert: MACRO
    if DEF(_CRYSTALVC)
	assert \1, \2
    endc
ENDM
