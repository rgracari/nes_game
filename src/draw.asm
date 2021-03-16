;;;; Sprite Direct Memory Access
;;;; transfer from CPU memory $0200 to PPU sprite memory
  LDA #$00
  STA $2003     ; setting the low byte $00 first
  LDA #$02
  STA $4014     ; the hight byte 
                ; and the transfer will automaticly start

;;;; return from the interrupt
  RTI       