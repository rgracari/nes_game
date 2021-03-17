;;;; Render first
  .include "render.asm"

;;;; Read controls
  .include "input.asm"

;;;; Engine
  .include "update.asm"

;;;; return from the NMI interrupt
  RTI