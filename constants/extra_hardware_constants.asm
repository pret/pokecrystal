; Graciously derived from:
; https://gbdev.io/pandocs/
; https://github.com/gbdev/hardware.inc
; http://gameboy.mongenel.com/dmg/asmmemmap.html

INCLUDE "hardware.inc"

DEF WRAM1_Begin EQU $d000
DEF WRAM1_End   EQU $e000

DEF HRAM_Begin  EQU $ff80
DEF HRAM_End    EQU $ffff

; MBC3
DEF MBC3RomBank    EQU rROMB0
DEF MBC3SRamBank   EQU rRAMB
DEF MBC3LatchClock EQU $6000

DEF RTC_S  EQU $08 ; Seconds   0-59 (0-3Bh)
DEF RTC_M  EQU $09 ; Minutes   0-59 (0-3Bh)
DEF RTC_H  EQU $0a ; Hours     0-23 (0-17h)
DEF RTC_DL EQU $0b ; Lower 8 bits of Day Counter (0-FFh)
DEF RTC_DH EQU $0c ; Upper 1 bit of Day Counter, Carry Bit, Halt Flag
                   ; Bit 0  Most significant bit of Day Counter (Bit 8)
                   ; Bit 6  Halt (0=Active, 1=Stop Timer)
                   ; Bit 7  Day Counter Carry Bit (1=Counter Overflow)

; interrupt flags
DEF IE_DEFAULT EQU (1 << IEB_SERIAL) | (1 << IEB_TIMER) | (1 << IEB_STAT) | (1 << IEB_VBLANK)

; BG Map attribute flags
DEF VRAM_BANK_1  EQU 1 << OAM_TILE_BANK ; $08
DEF OBP_NUM      EQU 1 << OAM_OBP_NUM   ; $10
DEF X_FLIP       EQU 1 << OAM_X_FLIP    ; $20
DEF Y_FLIP       EQU 1 << OAM_Y_FLIP    ; $40
DEF PRIORITY     EQU 1 << OAM_PRIORITY  ; $80

; Hardware registers
DEF rNR20                EQU $ff15 ; Channel 2 Sweep register (R/W)
DEF rNR40                EQU $ff1f ; Channel 4 Sweep register (R/W)
DEF LCDC_DEFAULT         EQU (1 << LCDCB_ON) | (1 << LCDCB_WIN9C00) | (1 << LCDCB_WINON) | (1 << LCDCB_OBJON) | (1 << LCDCB_BGON)
DEF LY_VBLANK            EQU 144
DEF rLCDMODE             EQU $ff4c
DEF rBLCK                EQU $ff50
DEF rUNKNOWN1            EQU $ff6c ; (FEh) Bit 0 (Read/Write) - CGB Mode Only
DEF rUNKNOWN2            EQU $ff72 ; (00h) - Bit 0-7 (Read/Write)
DEF rUNKNOWN3            EQU $ff73 ; (00h) - Bit 0-7 (Read/Write)
DEF rUNKNOWN4            EQU $ff74 ; (00h) - Bit 0-7 (Read/Write) - CGB Mode Only
DEF rUNKNOWN5            EQU $ff75 ; (8Fh) - Bit 4-6 (Read/Write)
