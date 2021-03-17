;;;; First wait for vblank to make sure PPU is ready
vblankwait: 
  BIT PPUSTATUS
  BPL vblankwait
  RTS

  .include "draw.asm"

  .include "input.asm"
