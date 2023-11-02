.export Main
.export CheckController
.segment "CODE"

PRESSING = %00000000

.proc Main
    jmp CheckController

.endproc

.proc CheckController
CheckController:
    lda #$01
    sta $4016 ;Strobes to connecter
    ldx #$00
    stx $4016
    jmp ConLoop

ConLoop:
    lda $4016 ; %00000000 if button is pressed
    lsr
    ror PRESSING ;RLDUsSBA
    inx
    cpx #$08
    bne ConLoop
    jmp CheckRight

CheckRight:
    lda #%10000000
    and PRESSING
    beq CheckLeft

CheckLeft:
    lda #%01000000
    and PRESSING
    beq CheckDown

CheckDown:
    lda #%00100000
    and PRESSING
    beq CheckUp

CheckUp:
    lda #%00010000
    and PRESSING
    beq EndControl

EndControl:
    rts

NoButtonPressed:
   lda #255
   sta $05
   sta $06
   rts

ButtonPressed:
   ; Code to handle when a button is not pressed
   lda #32
   sta $05
   sta $06
   rts
.endproc

