anim_obj_gfx: MACRO
; # tiles, label
	db \1
	dba \2
ENDM

AnimObjGFX:
; entries correspond to ANIM_GFX_* constants
	anim_obj_gfx  0, AnimObj00GFX
	anim_obj_gfx 21, AnimObjHitGFX
	anim_obj_gfx  6, AnimObjCutGFX
	anim_obj_gfx  6, AnimObjFireGFX
	anim_obj_gfx 20, AnimObjWaterGFX
	anim_obj_gfx 26, AnimObjLightningGFX
	anim_obj_gfx 18, AnimObjPlantGFX
	anim_obj_gfx 12, AnimObjSmokeGFX
	anim_obj_gfx  9, AnimObjExplosionGFX
	anim_obj_gfx 17, AnimObjRocksGFX
	anim_obj_gfx  6, AnimObjIceGFX
	anim_obj_gfx 10, AnimObjPokeBallGFX
	anim_obj_gfx  9, AnimObjPoisonGFX
	anim_obj_gfx 13, AnimObjBubbleGFX
	anim_obj_gfx 16, AnimObjNoiseGFX
	anim_obj_gfx  2, AnimObjPowderGFX
	anim_obj_gfx 11, AnimObjBeamGFX
	anim_obj_gfx  9, AnimObjSpeedGFX
	anim_obj_gfx  9, AnimObjChargeGFX
	anim_obj_gfx 19, AnimObjWindGFX
	anim_obj_gfx 10, AnimObjWhipGFX
	anim_obj_gfx 12, AnimObjEggGFX
	anim_obj_gfx 18, AnimObjRopeGFX
	anim_obj_gfx 13, AnimObjPsychicGFX
	anim_obj_gfx 10, AnimObjReflectGFX
	anim_obj_gfx 27, AnimObjStatusGFX
	anim_obj_gfx 12, AnimObjSandGFX
	anim_obj_gfx 14, AnimObjWebGFX
	anim_obj_gfx 16, AnimObjHazeGFX
	anim_obj_gfx  7, AnimObjHornGFX
	anim_obj_gfx  8, AnimObjFlowerGFX
	anim_obj_gfx 40, AnimObjMiscGFX
	anim_obj_gfx 36, AnimObjSkyAttackGFX
	anim_obj_gfx 16, AnimObjGlobeGFX
	anim_obj_gfx 48, AnimObjShapesGFX
	anim_obj_gfx 18, AnimObjObjectsGFX
	anim_obj_gfx 38, AnimObjShineGFX
	anim_obj_gfx 35, AnimObjAngelsGFX
	anim_obj_gfx 18, AnimObjWaveGFX
	anim_obj_gfx 24, AnimObjAeroblastGFX
	anim_obj_gfx  1, NULL
	anim_obj_gfx  1, NULL
