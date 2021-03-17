  .rsset $0000  ;;start variables at ram location 0
buttons1  .rs 1  ; .rs 1 means reserve one byte of space
buttons2  .rs 1  ; ball horizontal position
ballup    .rs 1  ; 1 = ball moving up

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