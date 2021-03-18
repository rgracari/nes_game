DrawPlayer:
  ; test if the draw is called

  LDA player1x
  STA $0200
  STA $0200+4
  ADC #$07
  STA $0200+8
  STA $0200+12

  LDA player1y
  STA $0203
  STA $0203+8
  ADC #$08
  STA $0203+4
  STA $0203+12

  LDA player2x
  STA $0210
  STA $0210+4
  ADC #$07
  STA $0210+8
  STA $0210+12

  LDA player2y
  STA $0213
  STA $0213+8
  ADC #$08
  STA $0213+4
  STA $0213+12

  RTS