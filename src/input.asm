HandleControls:
  LDA controls1
  AND  #%00000010
  BEQ RightDone

  DEC player1y

RightDone:
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
  ROL controls1
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
  ROL controls2
  DEX
  BNE ReadControllerLoop2
  RTS