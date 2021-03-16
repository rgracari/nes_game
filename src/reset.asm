;;;;;;;; RESET

;;;; Basic 6502 CPU configuration
  SEI          ; disable IRQs
  CLD          ; disable decimal mode
  LDX #$40
  STX $4017    ; disable APU frame IRQ
  LDX #$FF
  TXS          ; Set up stack
  INX          ; now X = 0
  STX $2000    ; disable NMI
  STX $2001    ; disable rendering
  STX $4010    ; disable DMC IRQs

;;;; First wait for vblank to make sure PPU is ready
vblankwait1: 
  BIT $2002
  BPL vblankwait1

;;;; Setting all the 2KB CPU memory to $00 we are making sure its $00 
clrmem:
  LDA #$00
  STA $0000, x
  STA $0100, x
  STA $0200, x
  STA $0400, x
  STA $0500, x
  STA $0600, x
  STA $0700, x
  LDA #$FE
  STA $0300, x
  INX
  BNE clrmem
  
;;;; Second wait for vblank, PPU is ready after this
vblankwait2:      
  BIT $2002
  BPL vblankwait2

;;;; Here we are loading the 2x 16 bytes color palettes
LoadPalettes:
  LDA $2002   ; read the PPU status to reset the latch
  LDA #$3F    ; High byte first
  STA $2006   ; $2006 is used to set the PPU address
  LDA #$00    ; low byte second the PPU is set to $3F00
  STA $2006   ; the PPU auto increment when $2007 is written
  
  LDX #$00    ; we set the x register to $00 for indexing
LoadPalettesLoop:
  LDA PaletteColors, x  ; here x is the index of the PaletteColors
  STA $2007
  INX
  CPX #$20
  BNE LoadPalettesLoop

;;;; TEMP DATA
  LDA #$50
  STA $0200        ; put sprite 0 in center ($80) of screen vert
  STA $0203        ; put sprite 0 in center ($80) of screen horiz
  LDA #$00
  STA $0201        ; tile number = 0
  STA $0202        ; color = 0, no flipping

;;;; Setting up the PPU configuration 
  LDA #%10000000    ; activate the NMI
  STA $2000         ; the PPUCTRL
  LDA #%00010000    ; intensify reds and blues
  STA $2001         ; the PPUMASK

;;;; Loop doing nothing and waiting for the NMI vector
Forever:
  JMP Forever