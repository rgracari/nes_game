;;;; Render first
  .include "render.asm"

;;;; Read controls
  JSR ReadController1
  JSR ReadController2

;;;; Engine
  .include "update.asm"
