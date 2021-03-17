;;;; First wait for vblank to make sure PPU is ready
vblankwait: 
  BIT PPUSTATUS
  BPL vblankwait
  RTS

ReadController1:
  LDA #$01
  STA CONTROL1
  LDA #$00
  STA CONTROL1

  LDX #$08
ReadControllerLoop1:
  LDA CONTROL1
  LSR A
  ROL buttons1
  DEX
  BNE ReadControllerLoop1
  RTS

ReadController2:
  LDA #$01
  STA CONTROL1
  LDA #$00
  STA CONTROL1

  LDX #$08
ReadControllerLoop2:
  LDA CONTROL2
  LSR A
  ROL CONTROL2
  DEX
  BNE ReadControllerLoop2
  RTS