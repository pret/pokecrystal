vc_hook: MACRO
    if DEF(_CRYSTALVC)
        .VC_\1::
    endc
ENDM

vc_patch: MACRO
   if DEF(_CRYSTALVC)
        assert !DEF(CURRENT_VC_PATCH), "Already started a vc_patch"
CURRENT_VC_PATCH EQUS "\1"
	.VC_{CURRENT_VC_PATCH}::
    endc
ENDM

vc_patch_end: MACRO
    if DEF(_CRYSTALVC)
        assert DEF(CURRENT_VC_PATCH), "No vc_patch started"
        .VC_End_{CURRENT_VC_PATCH}::
PURGE CURRENT_VC_PATCH
    endc
ENDM

vc_assert: MACRO
    if DEF(_CRYSTALVC)
        assert \#
    endc
ENDM
