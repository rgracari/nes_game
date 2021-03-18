;;;;;;;; RESET

;;;; Basic 6502 CPU configuration
  SEI          ; disable IRQs
  CLD          ; disable decimal mode
  LDX #$40
  STX $4017    ; disable APU frame IRQ
  LDX #$FF
  TXS          ; Set up stack
  INX          ; now X = 0
  STX PPUCTRL    ; disable NMI
  STX PPUMASK    ; disable rendering
  STX $4010    ; disable DMC IRQs

;;;; First wait for vblank to make sure PPU is ready
  JSR vblankwait

;;;; Setting all the 2KB CPU memory to $00 we are making sure its $00 
clrmem:
  LDA #$00
  STA $0000, x
  STA $0100, x
  STA $0300, x
  STA $0400, x
  STA $0500, x
  STA $0600, x
  STA $0700, x
  LDA #$FE
  STA $0200, x
  INX
  BNE clrmem
  
;;;; Second wait for vblank, PPU is ready after this
  JSR vblankwait

;;;; Here we are loading the 2x 16 bytes color palettes
LoadPalettes:
  LDA PPUSTATUS   ; read the PPU status to reset the latch
  LDA #$3F    ; High byte first
  STA PPUADDR   ; PPUADDR is used to set the PPU address
  LDA #$00    ; low byte second the PPU is set to $3F00
  STA PPUADDR   ; the PPU auto increment when PPUDATA is written
  
  LDX #$00    ; we set the x register to $00 for indexing
LoadPalettesLoop:
  LDA PaletteColors, x  ; here x is the index of the PaletteColors
  STA PPUDATA
  INX
  CPX #$20
  BNE LoadPalettesLoop

;;;; Initial Sprites
LoadSprites:
  LDX #$00 
LoadSpritesLoop:
  LDA SpritesData, x
  STA $0200, x
  INX
  CPX #$20
  BNE LoadSpritesLoop

;;;; Load background Nametable 0
LoadBackground:
  LDA PPUSTATUS
  LDA #$20
  STA PPUADDR
  LDA #$00
  STA PPUADDR

  LDX #$00
LoadBackgroundLoop:
  LDA BackgroundNametable, x
  STA PPUDATA
  INX
  CPX #$80
  BNE LoadBackgroundLoop 

;;;; Load AttributeTable
LoadAttribute:
  LDA PPUSTATUS     ; Reset the latch
  LDA #$23
  STA PPUADDR
  LDA #$C0
  STA PPUADDR

  LDX #$00
LoadAttributeLoop:
  LDA AttributeTable, x
  STA PPUDATA
  INX
  CPX #$08
  BNE LoadAttributeLoop

;;;; Setting up the PPU configuration 
  LDA #%10010000    ; activate the NMI
  STA PPUCTRL

  LDA #%00011110    ; activate sprite rendering
  STA PPUMASK       ; the PPUMASK

;;;; Game special initialization
  LDA #GAMESTATE_INTRO
  STA gamestate

  LDA #$10
  STA player1x
  STA player1y

  LDA #$80
  STA player2x
  STA player2y

;;;; Loop doing nothing and waiting for the NMI vector
Forever:
  JMP Forever