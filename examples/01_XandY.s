.export Main
.segment "CODE"

.proc Main
  jmp intiControl
  rts

intiControl:
  ;Inti Output mem
    lda #1
    sta $20

    ;Send latch to pulse the controller
    sta $4016
    lda #0
    sta $4016
    jmp read_loop
    rts

    ; Read The buttons
read_loop:
    lda $4016
    lsr
    ror $20
    bcc read_loop

    rts

.endproc
