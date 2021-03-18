HandleControl1:
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

HandleControl2:
  LDA controls2
  AND  #BUTTON_LEFT
  BEQ LeftNotPressed2
  DEC player2y
LeftNotPressed2:

  LDA controls2
  AND  #BUTTON_RIGHT
  BEQ RightNotPressed2
  INC player2y
RightNotPressed2:

  LDA controls2
  AND  #BUTTON_UP
  BEQ UpNotPressed2
  DEC player2x
UpNotPressed2:

  LDA controls2
  AND  #BUTTON_DOWN
  BEQ DownNotPressed2
  INC player2x
DownNotPressed2:
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