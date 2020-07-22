VarActionTable:
; entries correspond to VAR_* constants
	; RETVAR_STRBUF2: copy [de] to wStringBuffer2
	; RETVAR_ADDR_DE: return address in de
	; RETVAR_EXECUTE: call function
	dwb wStringBuffer2,                 RETVAR_STRBUF2
	dwb wPartyCount,                    RETVAR_STRBUF2
	dwb Var_BattleResult,               RETVAR_EXECUTE
	dwb wBattleType,                    RETVAR_ADDR_DE
	dwb wTimeOfDay,                     RETVAR_STRBUF2
	dwb Var_CountCaughtMons,            RETVAR_EXECUTE
	dwb Var_CountSeenMons,              RETVAR_EXECUTE
	dwb Var_CountBadges,                RETVAR_EXECUTE
	dwb wPlayerState,                   RETVAR_ADDR_DE
	dwb Var_PlayerFacing,               RETVAR_EXECUTE
	dwb hHours,                         RETVAR_STRBUF2
	dwb Var_DayOfWeek,                  RETVAR_EXECUTE
	dwb wMapGroup,                      RETVAR_STRBUF2
	dwb wMapNumber,                     RETVAR_STRBUF2
	dwb Var_UnownCaught,                RETVAR_EXECUTE
	dwb wEnvironment,                   RETVAR_STRBUF2
	dwb Var_BoxFreeSpace,               RETVAR_EXECUTE
	dwb wBugContestMinsRemaining,       RETVAR_STRBUF2
	dwb wXCoord,                        RETVAR_STRBUF2
	dwb wYCoord,                        RETVAR_STRBUF2
	dwb wSpecialPhoneCallID,            RETVAR_STRBUF2
	dwb wNrOfBeatenBattleTowerTrainers, RETVAR_STRBUF2
	dwb wKurtApricornQuantity,          RETVAR_STRBUF2
	dwb wCurCaller,                     RETVAR_ADDR_DE
	dwb wBlueCardBalance,               RETVAR_ADDR_DE
	dwb wBuenasPassword,                RETVAR_ADDR_DE
	dwb wKenjiBreakTimer,               RETVAR_STRBUF2
	dwb NULL,                           RETVAR_STRBUF2
