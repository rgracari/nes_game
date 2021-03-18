  .rsset $0000  ;;start variables at ram location 0
gamestate   .rs 1  ; state of the game (intro / game / over)
player1x    .rs 1
player1y    .rs 1
controls1   .rs 1  ; controller 1 input state
controls2   .rs 1  ; controller 2 input state
test        .rs 1  ; test var
test2       .rs 1  ; test var

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
OAMDMA    = $4014
PPUSCROLL = $2005
PPUADDR   = $2006
PPUDATA   = $2007

  ; Button Flags
BUTTON_A      = 1 << 7
BUTTON_B      = 1 << 6
BUTTON_SELECT = 1 << 5
BUTTON_START  = 1 << 4
BUTTON_UP     = 1 << 3
BUTTON_DOWN   = 1 << 2
BUTTON_LEFT   = 1 << 1
BUTTON_RIGHT  = 1 << 0

  ; Controllers Ports
CONTROL1 = $4016
CONTROL2 = $4017