.export Main
.segment "CODE"

.proc Main
  ; Start by loading the value 5 into both the X and Y registers
  ldx #$ff
  ldy #$00
  dey
  inx

  rts
.endproc
