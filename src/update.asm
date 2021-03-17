;;;; Sprite Direct Memory Access
;;;; transfer from CPU memory $0200 to PPU sprite memory
TransferSpriteDMA:
  LDA #$00      ; setting the low byte $00 first
  STA $2003     
  LDA #$02      ; the hight byte 
  STA $4014     ; and the transfer will automaticly start
                
;;;; Latch Controllers
LatchControllers:
 ; this part is needed to tell the nes to latch
  LDA #$01
  STA CONTROL1
  LDA #$00
  STA CONTROL1

ReadA:
  LDA $4016
  AND #%00000001
  BEQ ReadADone

  LDA $203
  CLC
  ADC #$01
  STA $203
ReadADone:

ReadB:
  LDA $4016
  AND #%00000001
  BEQ ReadBDone

  LDA $203
  SEC
  SBC #$01
  STA $203
ReadBDone:

;;;; Clean up the PPU and be ready for the next interrupt
  LDA #%10010000    ; activate the NMI
  STA PPUCTRL

  LDA #%00011110    ; activate sprite rendering
  STA PPUMASK

;;;; Tell the PPU to not applied any bacground scrolling
  LDA #$00
  STA PPUSCROLL
  STA PPUSCROLL

;;;; return from the interrupt
  RTI       