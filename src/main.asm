;;;;;;;;;; ASSEMBLY DIRECTIVES

  ; 1 bank = 8KB
  .inesprg 1    ; 1x 16KB PRG / bank 0 & 1
  .ineschr 1    ; 1x 8KB CHR  / bank 2
  .inesmap 0    ; no mapper
  .inesmir 1    ; background mirroring

;;;;;;;;;; END ASSEMBLY DIRECTIVES


;;;;;;;;;; PRG ROM DATA

  .bank 0
  .org $C000
RESET:
  .include "reset.asm"

NMI:
  RTI

;;;;;;;;;; END PRG ROM DATA


;;;;;;;;;; VECTORS SETUP

  .bank 1
  .org $FFFA    ; Must start at $FFFA
  .dw NMI       ; Vblank vector
  .dw RESET     ; Reset vector
  .dw 0         ; IRQ vector

;;;;;;;;;; END VECTORS SETUP


;;;;;;;;;; CHR DATA

  .bank 2
  .org $0000
  .incbin "graphic.chr"

;;;;;;;;;; END CHR DATA