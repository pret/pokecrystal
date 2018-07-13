	; npctrade struct members (see data/events/npc_trades.asm)
NPCTRADE_DIALOG  EQU  0 ; db
NPCTRADE_GIVEMON EQU  1 ; db
NPCTRADE_GETMON  EQU  2 ; db
NPCTRADE_NICK    EQU  3 ; ds MON_NAME_LENGTH
NPCTRADE_DVS     EQU 14 ; dw
NPCTRADE_ITEM    EQU 16 ; db
NPCTRADE_OT_ID   EQU 17 ; dw
NPCTRADE_OT_NAME EQU 19 ; ds NAME_LENGTH
NPCTRADE_GENDER  EQU 30 ; db
NPCTRADE_PADDING EQU 31 ; db

; NPCTrades indexes (see data/events/npc_trades.asm)
	const_def
	const NPC_TRADE_MIKE   ; 0
	const NPC_TRADE_KYLE   ; 1
	const NPC_TRADE_TIM    ; 2
	const NPC_TRADE_EMY    ; 3
	const NPC_TRADE_CHRIS  ; 4
	const NPC_TRADE_KIM    ; 5
	const NPC_TRADE_FOREST ; 6
NUM_NPC_TRADES EQU const_value

; trade gender limits
	const_def
	const TRADE_GENDER_EITHER
	const TRADE_GENDER_MALE
	const TRADE_GENDER_FEMALE

; TradeTexts indexes (see engine/events/npc_trade.asm)

; trade dialogs
	const_def
	const TRADE_DIALOG_INTRO
	const TRADE_DIALOG_CANCEL
	const TRADE_DIALOG_WRONG
	const TRADE_DIALOG_COMPLETE
	const TRADE_DIALOG_AFTER

; trade dialog sets
	const_def
	const TRADE_DIALOGSET_COLLECTOR
	const TRADE_DIALOGSET_HAPPY
	const TRADE_DIALOGSET_NEWBIE
	const TRADE_DIALOGSET_GIRL
