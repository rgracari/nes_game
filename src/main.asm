;;;;;;;;;; ASSEMBLY DIRECTIVES

  ; 1x bank = 8KB
  .inesprg 1    ; 1x 16KB PRG / bank 0 & 1
  .ineschr 1    ; 1x 8KB CHR  / bank 2
  .inesmap 0    ; no mapper
  .inesmir 1    ; background mirroring

  ;;;; Include all of the constants
  .include "constant.asm"

;;;;;;;;;; END ASSEMBLY DIRECTIVES


;;;;;;;;;; PRG ROM DATA

  .bank 0
  .org $C000
  .include "func.asm"

RESET:
  .include "reset.asm"

NMI:
  .include "update.asm"

;;;;;;;;;; END PRG ROM DATA


;;;;;;;;;; STORE DATA

  ; We store the palette color data in the PGR ROM and we will
  ; store for each vblank to palette color data.
  ; $E000 address is arbitrary and temporary.

  .bank 1
  .org $E000 
PaletteColors: 
  .db $0F,$1C,$2B,$39,$0F,$06,$15,$36,$0F,$39,$3A,$3B,$0F,$3D,$3E,$0F
  .db $0F,$13,$16,$36,$0F,$02,$38,$3C,$0F,$1C,$15,$14,$0F,$02,$38,$3C

SpritesData:
     ;vert tile attr horiz
  .db $80, $00, $00, $80   ;sprite 0
  .db $80, $01, $00, $88   ;sprite 1
  .db $88, $10, $00, $80   ;sprite 2
  .db $88, $11, $00, $88   ;sprite 3

BackgroundNametable:
  .db $00,$01,$02,$03,$04,$05,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ;;row 1
  .db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ;;all sky

  .db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ;;row 2
  .db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ;;all sky

  .db $00,$00,$00,$00,$45,$45,$00,$00,$45,$45,$45,$45,$45,$45,$00,$00  ;;row 3
  .db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$53,$54,$00,$00  ;;some brick tops

  .db $00,$00,$00,$00,$47,$47,$00,$00,$47,$47,$47,$47,$47,$47,$00,$00  ;;row 4
  .db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$55,$56,$00,$00  ;;brick bottoms

AttributeTable:
  .db %00000001, %00000100, %00000000, %00000101, %00000000, %00000000, %00000101, %00000000

;;;;;;;;;; END STORE DATA


;;;;;;;;;; VECTORS SETUP

  .org $FFFA    ; Must start at $FFFA
  .dw NMI       ; Vblank vector
  .dw RESET     ; Reset vector
  .dw 0         ; IRQ vector

;;;;;;;;;; END VECTORS SETUP


;;;;;;;;;; CHR DATA

  ; All the graphical data, all the tiles of 8x8 pixel.
  ; 4KB for the background and 4KB for the sprites 

  .bank 2
  .org $0000
  .incbin "graphic.chr"

;;;;;;;;;; END CHR DATA