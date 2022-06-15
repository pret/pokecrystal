; Graciously derived from:
; https://gbdev.io/pandocs/
; https://github.com/gbdev/hardware.inc
; http://gameboy.mongenel.com/dmg/asmmemmap.html

INCLUDE "constants/hardware.inc"

; MBC3
DEF MBC3LatchClock EQU $6000

DEF RTC_S  EQU $08 ; Seconds   0-59 (0-3Bh)
DEF RTC_M  EQU $09 ; Minutes   0-59 (0-3Bh)
DEF RTC_H  EQU $0a ; Hours     0-23 (0-17h)
DEF RTC_DL EQU $0b ; Lower 8 bits of Day Counter (0-FFh)
DEF RTC_DH EQU $0c ; Upper 1 bit of Day Counter, Carry Bit, Halt Flag
                   ; Bit 0  Most significant bit of Day Counter (Bit 8)
                   ; Bit 6  Halt (0=Active, 1=Stop Timer)
                   ; Bit 7  Day Counter Carry Bit (1=Counter Overflow)

; Hardware registers
DEF rNR20                EQU $ff15 ; Channel 2 Sweep register (R/W)
DEF rNR40                EQU $ff1f ; Channel 4 Sweep register (R/W)
DEF rLCDMODE             EQU $ff4c
DEF rBLCK                EQU $ff50
DEF rUNKNOWN1            EQU $ff6c ; (FEh) Bit 0 (Read/Write) - CGB Mode Only
DEF rUNKNOWN2            EQU $ff72 ; (00h) - Bit 0-7 (Read/Write)
DEF rUNKNOWN3            EQU $ff73 ; (00h) - Bit 0-7 (Read/Write)
DEF rUNKNOWN4            EQU $ff74 ; (00h) - Bit 0-7 (Read/Write) - CGB Mode Only
DEF rUNKNOWN5            EQU $ff75 ; (8Fh) - Bit 4-6 (Read/Write)
