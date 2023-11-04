.export Control
.export CheckControl
.segment "CODE"
Pressing = $21

.proc Control

  jsr intiControl
  lda $20
  sta $21
  rts

intiControl:
  ;Inti Output mem
    lda #1

    ;Send latch to pulse the controller
    sta $4016
    lda #0
    sta $4016
    ldx #0
    jmp read_loop

read_loop:

    lda $4016
    lsr
    ror $20
    inx
    cpx #8
    bne read_loop

    rts

.endproc

.proc CheckControl
    ldy #0
    ldx #%10000000
    stx $20
    Check:
    iny
    lda Pressing
    and $20
    cmp $20
    bne :+
    sta $21,Y
:
    lsr $20
    cpy #8
    bne Check
    rts


.endproc
