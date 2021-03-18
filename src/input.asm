HandleControls:
  LDA controls1
  AND  #BUTTON_LEFT
  BEQ LeftNotPressed
  DEC player1y
LeftNotPressed:

  LDA controls1
  AND  #BUTTON_RIGHT
  BEQ RightNotPressed
  INC player1y
RightNotPressed:

  LDA controls1
  AND  #BUTTON_UP
  BEQ UpNotPressed
  DEC player1x
UpNotPressed:

  LDA controls1
  AND  #BUTTON_DOWN
  BEQ DownNotPressed
  INC player1x
DownNotPressed:

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