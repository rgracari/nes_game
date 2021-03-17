;;;; Sprite Direct Memory Access
;;;; transfer from CPU memory $0200 to PPU sprite memory
TransferSpriteDMA:
  LDA #$00      ; setting the low byte $00 first
  STA $2003     
  LDA #$02      ; the hight byte 
  STA $4014     ; and the transfer will automaticly start
                
;;;; Clean up the PPU and be ready for the next interrupt
  LDA #%10010000    ; activate the NMI
  STA PPUCTRL

  LDA #%00011110    ; activate sprite rendering
  STA PPUMASK

;;;; Tell the PPU to not applied any bacground scrolling
  LDA #$00
  STA PPUSCROLL
  STA PPUSCROLL