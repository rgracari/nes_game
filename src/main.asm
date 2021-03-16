;;;;;;;;;; ASSEMBLY DIRECTIVES

  ; 1x bank = 8KB
  .inesprg 1    ; 1x 16KB PRG / bank 0 & 1
  .ineschr 1    ; 1x 8KB CHR  / bank 2
  .inesmap 0    ; no mapper
  .inesmir 1    ; background mirroring

  ; PPU Ports
PPUCTRL   = $2000
PPUMASK   = $2001
PPUSTATUS = $2002
OAMADDR   = $2003
OAMDATA   = $2004
PPUSCROLL = $2005
PPUADDR   = $2006
PPUDATA   = $2007

;;;;;;;;;; END ASSEMBLY DIRECTIVES


;;;;;;;;;; PRG ROM DATA

  .bank 0
  .org $C000
RESET:
  .include "reset.asm"

NMI:
  .include "draw.asm"

;;;;;;;;;; END PRG ROM DATA


;;;;;;;;;; COLOR PALETTE

  ; We store the palette color data in the PGR ROM and we will
  ; store for each vblank to palette color data.
  ; $E000 address is arbitrary and temporary.

  .bank 1
  .org $E000 
PaletteColors: 
  .db $0F,$31,$32,$33,$0F,$35,$36,$37,$0F,$39,$3A,$3B,$0F,$3D,$3E,$0F
  .db $0F,$1C,$15,$14,$0F,$02,$38,$3C,$0F,$1C,$15,$14,$0F,$02,$38,$3C

;;;;;;;;;; END COLOR PALETTE


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