; npctrade struct members (see data/npc_trades.asm)
TRADE_DIALOG  EQU 0
TRADE_GIVEMON EQU 1
TRADE_GETMON  EQU 2
TRADE_NICK    EQU 3
TRADE_DVS     EQU 14
TRADE_ITEM    EQU 16
TRADE_OT_ID   EQU 17
TRADE_OT_NAME EQU 19
TRADE_GENDER  EQU 30
TRADE_PADDING EQU 31

; NPCTrades indexes (see data/npc_trades.asm)
	const_def
	const NPCTRADE_MIKE   ; 0
	const NPCTRADE_KYLE   ; 1
	const NPCTRADE_TIM    ; 2
	const NPCTRADE_EMY    ; 3
	const NPCTRADE_CHRIS  ; 4
	const NPCTRADE_KIM    ; 5
	const NPCTRADE_FOREST ; 6

; trade gender limits
TRADE_EITHER_GENDER EQU 0
TRADE_MALE_ONLY     EQU 1
TRADE_FEMALE_ONLY   EQU 2

; TradeTexts indexes (see engine/npctrade.asm)

; trade dialogs
	const_def
	const TRADE_INTRO
	const TRADE_CANCEL
	const TRADE_WRONG
	const TRADE_COMPLETE
	const TRADE_AFTER

; trade dialog sets
	const_def
	const TRADE_DIALOG_COLLECTOR
	const TRADE_DIALOG_HAPPY
	const TRADE_DIALOG_NEWBIE
	const TRADE_DIALOG_GIRL
