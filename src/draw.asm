DrawPlayer:
  ; test if the draw is called
  LDA #$FB
  STA test2

  LDA player1x
  STA $0200

  LDA player1y
  STA $0203

  RTS