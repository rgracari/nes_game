GameUpdate:
  ; Load the state of the game (initial Intro)
  LDA gamestate

  ; Go branch to the corresponding state
  CMP #GAMESTATE_INTRO
  BEQ GamteStateIntro

  CMP #GAMESTATE_GAME
  BEQ GameStateGame

GameUpdateDone:
  JSR DrawPlayer

  RTI

GamteStateIntro:
  JSR HandleControls

  JMP GameUpdateDone

GameStateGame:

  JMP GameUpdateDone