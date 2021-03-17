  .rsset $0000  ;;start variables at ram location 0
gamestate .rs 1  ; state of the game (intro / game / over)
buttons1  .rs 1  ; controller 1 input state
buttons2  .rs 1  ; controller 2 input state

  ; Game Constants
GAMESTATE_INTRO = $40
GAMESTATE_GAME = $41
GAMESTATE_OVER = $42

  ; PPU Ports
PPUCTRL   = $2000
PPUMASK   = $2001
PPUSTATUS = $2002
OAMADDR   = $2003
OAMDATA   = $2004
PPUSCROLL = $2005
PPUADDR   = $2006
PPUDATA   = $2007

  ; Controllers Ports
CONTROL1 = $4016
CONTROL2 = $4017