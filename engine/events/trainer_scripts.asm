TalkToTrainerScript::
	faceplayer
	trainerflagaction CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadtemptrainer
	encountermusic
	opentext
	sjump StartBattleWithMapTrainerScript

SeenByTrainerScript::
	loadtemptrainer
	encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovementlasttalked wMovementBuffer
	writeobjectxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	sjump StartBattleWithMapTrainerScript

StartBattleWithMapTrainerScript:
	opentext
	trainertext TRAINERTEXT_SEEN
	waitbutton
	closetext
	loadtemptrainer
	startbattle
	reloadmapafterbattle
	trainerflagaction SET_FLAG
	loadmem wRunningTrainerBattleScript, -1
	scripttalkafter
	end

AlreadyBeatenTrainerScript:
	opentext
	writetext .RebattleText
	yesorno
	iftrue StartBattleWithMapTrainerScript
	closetext
	scripttalkafter
	end

.RebattleText:
	text_far _RebattleText
	text_end