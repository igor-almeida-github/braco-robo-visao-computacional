
_interrupt:

;BracoRoboIc.c,37 :: 		void interrupt(){
;BracoRoboIc.c,38 :: 		if (INTCON.TMR0IF){//------------------------------------------// Overflow do timer 0
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;BracoRoboIc.c,39 :: 		if(servo1){                                                 // se o pino do servo estiver em nível lógico alto
	BTFSS       PORTC+0, 3 
	GOTO        L_interrupt1
;BracoRoboIc.c,40 :: 		servo1=0;
	BCF         PORTC+0, 3 
;BracoRoboIc.c,43 :: 		TMR0H=TIMER0LOWVALUE>>8;                                 // inicializa o High byte de TIMER0LOWVALUE no timer 0
	MOVF        _TIMER0LOWVALUE+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR0H+0 
;BracoRoboIc.c,44 :: 		TMR0L=TIMER0LOWVALUE;                                    // inicializa o Low byte de TIMER0LOWVALUE no timer 0
	MOVF        _TIMER0LOWVALUE+0, 0 
	MOVWF       TMR0L+0 
;BracoRoboIc.c,45 :: 		}
	GOTO        L_interrupt2
L_interrupt1:
;BracoRoboIc.c,47 :: 		servo1=1;
	BSF         PORTC+0, 3 
;BracoRoboIc.c,50 :: 		TMR0H=TIMER0HIGHVALUE>>8;                                // inicializa o High byte de TIMER0HIGHVALUE no timer 0
	MOVF        _TIMER0HIGHVALUE+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR0H+0 
;BracoRoboIc.c,51 :: 		TMR0L=TIMER0HIGHVALUE;                                   // inicializa o Low byte de TIMER0HIGHVALUE no timer 0
	MOVF        _TIMER0HIGHVALUE+0, 0 
	MOVWF       TMR0L+0 
;BracoRoboIc.c,52 :: 		}
L_interrupt2:
;BracoRoboIc.c,53 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;BracoRoboIc.c,54 :: 		} //-------------------------------------------------------------------------
L_interrupt0:
;BracoRoboIc.c,56 :: 		if (PIR1.TMR1IF){//------------------------------------------  // Overflow do timer 1
	BTFSS       PIR1+0, 0 
	GOTO        L_interrupt3
;BracoRoboIc.c,57 :: 		if(servo2){                                                 // se o pino do servo estiver em nível lógico alto
	BTFSS       PORTD+0, 0 
	GOTO        L_interrupt4
;BracoRoboIc.c,58 :: 		servo2=0;
	BCF         PORTD+0, 0 
;BracoRoboIc.c,61 :: 		TMR1H=TIMER1LOWVALUE>>8;                                 // inicializa o High byte de TIMER0LOWVALUE no timer 0
	MOVF        _TIMER1LOWVALUE+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR1H+0 
;BracoRoboIc.c,62 :: 		TMR1L=TIMER1LOWVALUE;                                    // inicializa o Low byte de TIMER0LOWVALUE no timer 0
	MOVF        _TIMER1LOWVALUE+0, 0 
	MOVWF       TMR1L+0 
;BracoRoboIc.c,63 :: 		}
	GOTO        L_interrupt5
L_interrupt4:
;BracoRoboIc.c,65 :: 		servo2=1;
	BSF         PORTD+0, 0 
;BracoRoboIc.c,68 :: 		TMR1H=TIMER1HIGHVALUE>>8;                                // inicializa o High byte de TIMER0HIGHVALUE no timer 0
	MOVF        _TIMER1HIGHVALUE+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR1H+0 
;BracoRoboIc.c,69 :: 		TMR1L=TIMER1HIGHVALUE;                                   // inicializa o Low byte de TIMER0HIGHVALUE no timer 0
	MOVF        _TIMER1HIGHVALUE+0, 0 
	MOVWF       TMR1L+0 
;BracoRoboIc.c,70 :: 		}
L_interrupt5:
;BracoRoboIc.c,71 :: 		PIR1.TMR1IF=0;
	BCF         PIR1+0, 0 
;BracoRoboIc.c,72 :: 		} //-------------------------------------------------------------------------
L_interrupt3:
;BracoRoboIc.c,74 :: 		if (PIR2.TMR3IF){//------------------------------------------  // Overflow do timer 3
	BTFSS       PIR2+0, 1 
	GOTO        L_interrupt6
;BracoRoboIc.c,75 :: 		if(servo3){                                                 // se o pino do servo estiver em nível lógico alto
	BTFSS       PORTD+0, 1 
	GOTO        L_interrupt7
;BracoRoboIc.c,76 :: 		servo3=0;
	BCF         PORTD+0, 1 
;BracoRoboIc.c,79 :: 		TMR3H=TIMER3LOWVALUE>>8;                                 // inicializa o High byte de TIMER0LOWVALUE no timer 0
	MOVF        _TIMER3LOWVALUE+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR3H+0 
;BracoRoboIc.c,80 :: 		TMR3L=TIMER3LOWVALUE;                                    // inicializa o Low byte de TIMER0LOWVALUE no timer 0
	MOVF        _TIMER3LOWVALUE+0, 0 
	MOVWF       TMR3L+0 
;BracoRoboIc.c,81 :: 		}
	GOTO        L_interrupt8
L_interrupt7:
;BracoRoboIc.c,83 :: 		servo3=1;
	BSF         PORTD+0, 1 
;BracoRoboIc.c,86 :: 		TMR3H=TIMER3HIGHVALUE>>8;                                // inicializa o High byte de TIMER0HIGHVALUE no timer 0
	MOVF        _TIMER3HIGHVALUE+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR3H+0 
;BracoRoboIc.c,87 :: 		TMR3L=TIMER3HIGHVALUE;                                   // inicializa o Low byte de TIMER0HIGHVALUE no timer 0
	MOVF        _TIMER3HIGHVALUE+0, 0 
	MOVWF       TMR3L+0 
;BracoRoboIc.c,88 :: 		}
L_interrupt8:
;BracoRoboIc.c,89 :: 		PIR2.TMR3IF=0;
	BCF         PIR2+0, 1 
;BracoRoboIc.c,90 :: 		} //-------------------------------------------------------------------------
L_interrupt6:
;BracoRoboIc.c,92 :: 		}
L_end_interrupt:
L__interrupt46:
	RETFIE      1
; end of _interrupt

_set_servo_1:

;BracoRoboIc.c,93 :: 		void set_servo_1(float angle_1){                                  // recebe o valor do angulo do servo, entre 0 e 180 graus, tipo float
;BracoRoboIc.c,94 :: 		duty1=0.022+angle_1*0.092/180;
	MOVF        FARG_set_servo_1_angle_1+0, 0 
	MOVWF       R0 
	MOVF        FARG_set_servo_1_angle_1+1, 0 
	MOVWF       R1 
	MOVF        FARG_set_servo_1_angle_1+2, 0 
	MOVWF       R2 
	MOVF        FARG_set_servo_1_angle_1+3, 0 
	MOVWF       R3 
	MOVLW       127
	MOVWF       R4 
	MOVLW       106
	MOVWF       R5 
	MOVLW       60
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       88
	MOVWF       R4 
	MOVLW       57
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _duty1+0 
	MOVF        R1, 0 
	MOVWF       _duty1+1 
	MOVF        R2, 0 
	MOVWF       _duty1+2 
	MOVF        R3, 0 
	MOVWF       _duty1+3 
;BracoRoboIc.c,95 :: 		TIMER0HIGHVALUE_auxiliar=65535-duty1*50000;
	MOVLW       0
	MOVWF       R4 
	MOVLW       80
	MOVWF       R5 
	MOVLW       67
	MOVWF       R6 
	MOVLW       142
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       255
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       142
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _TIMER0HIGHVALUE_auxiliar+0 
	MOVF        R1, 0 
	MOVWF       _TIMER0HIGHVALUE_auxiliar+1 
;BracoRoboIc.c,96 :: 		TIMER0LOWVALUE_auxiliar=((65535-TIMER0HIGHVALUE)+15535);
	MOVF        _TIMER0HIGHVALUE+0, 0 
	SUBLW       255
	MOVWF       R2 
	MOVF        _TIMER0HIGHVALUE+1, 0 
	MOVWF       R3 
	MOVLW       255
	SUBFWB      R3, 1 
	MOVLW       175
	ADDWF       R2, 1 
	MOVLW       60
	ADDWFC      R3, 1 
	MOVF        R2, 0 
	MOVWF       _TIMER0LOWVALUE_auxiliar+0 
	MOVF        R3, 0 
	MOVWF       _TIMER0LOWVALUE_auxiliar+1 
;BracoRoboIc.c,97 :: 		TIMER0HIGHVALUE=TIMER0HIGHVALUE_auxiliar;
	MOVF        R0, 0 
	MOVWF       _TIMER0HIGHVALUE+0 
	MOVF        R1, 0 
	MOVWF       _TIMER0HIGHVALUE+1 
;BracoRoboIc.c,98 :: 		TIMER0LOWVALUE=TIMER0LOWVALUE_auxiliar;
	MOVF        R2, 0 
	MOVWF       _TIMER0LOWVALUE+0 
	MOVF        R3, 0 
	MOVWF       _TIMER0LOWVALUE+1 
;BracoRoboIc.c,100 :: 		}
L_end_set_servo_1:
	RETURN      0
; end of _set_servo_1

_set_servo_2:

;BracoRoboIc.c,102 :: 		void set_servo_2(float angle_2){                                  // recebe o valor do angulo do servo, entre 0 e 180 graus, tipo float
;BracoRoboIc.c,103 :: 		duty2=0.022+angle_2*0.092/180;
	MOVF        FARG_set_servo_2_angle_2+0, 0 
	MOVWF       R0 
	MOVF        FARG_set_servo_2_angle_2+1, 0 
	MOVWF       R1 
	MOVF        FARG_set_servo_2_angle_2+2, 0 
	MOVWF       R2 
	MOVF        FARG_set_servo_2_angle_2+3, 0 
	MOVWF       R3 
	MOVLW       127
	MOVWF       R4 
	MOVLW       106
	MOVWF       R5 
	MOVLW       60
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       88
	MOVWF       R4 
	MOVLW       57
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _duty2+0 
	MOVF        R1, 0 
	MOVWF       _duty2+1 
	MOVF        R2, 0 
	MOVWF       _duty2+2 
	MOVF        R3, 0 
	MOVWF       _duty2+3 
;BracoRoboIc.c,104 :: 		TIMER1HIGHVALUE_auxiliar=65535-duty2*50000;
	MOVLW       0
	MOVWF       R4 
	MOVLW       80
	MOVWF       R5 
	MOVLW       67
	MOVWF       R6 
	MOVLW       142
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       255
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       142
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _TIMER1HIGHVALUE_auxiliar+0 
	MOVF        R1, 0 
	MOVWF       _TIMER1HIGHVALUE_auxiliar+1 
;BracoRoboIc.c,105 :: 		TIMER1LOWVALUE_auxiliar=((65535-TIMER1HIGHVALUE)+15535);
	MOVF        _TIMER1HIGHVALUE+0, 0 
	SUBLW       255
	MOVWF       R2 
	MOVF        _TIMER1HIGHVALUE+1, 0 
	MOVWF       R3 
	MOVLW       255
	SUBFWB      R3, 1 
	MOVLW       175
	ADDWF       R2, 1 
	MOVLW       60
	ADDWFC      R3, 1 
	MOVF        R2, 0 
	MOVWF       _TIMER1LOWVALUE_auxiliar+0 
	MOVF        R3, 0 
	MOVWF       _TIMER1LOWVALUE_auxiliar+1 
;BracoRoboIc.c,106 :: 		TIMER1HIGHVALUE=TIMER1HIGHVALUE_auxiliar;
	MOVF        R0, 0 
	MOVWF       _TIMER1HIGHVALUE+0 
	MOVF        R1, 0 
	MOVWF       _TIMER1HIGHVALUE+1 
;BracoRoboIc.c,107 :: 		TIMER1LOWVALUE=TIMER1LOWVALUE_auxiliar;
	MOVF        R2, 0 
	MOVWF       _TIMER1LOWVALUE+0 
	MOVF        R3, 0 
	MOVWF       _TIMER1LOWVALUE+1 
;BracoRoboIc.c,109 :: 		}
L_end_set_servo_2:
	RETURN      0
; end of _set_servo_2

_set_servo_3:

;BracoRoboIc.c,111 :: 		void set_servo_3(float angle_3){                                  // recebe o valor do angulo do servo, entre 0 e 180 graus, tipo float
;BracoRoboIc.c,112 :: 		duty3=0.022+angle_3*0.092/180;
	MOVF        FARG_set_servo_3_angle_3+0, 0 
	MOVWF       R0 
	MOVF        FARG_set_servo_3_angle_3+1, 0 
	MOVWF       R1 
	MOVF        FARG_set_servo_3_angle_3+2, 0 
	MOVWF       R2 
	MOVF        FARG_set_servo_3_angle_3+3, 0 
	MOVWF       R3 
	MOVLW       127
	MOVWF       R4 
	MOVLW       106
	MOVWF       R5 
	MOVLW       60
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       88
	MOVWF       R4 
	MOVLW       57
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _duty3+0 
	MOVF        R1, 0 
	MOVWF       _duty3+1 
	MOVF        R2, 0 
	MOVWF       _duty3+2 
	MOVF        R3, 0 
	MOVWF       _duty3+3 
;BracoRoboIc.c,113 :: 		TIMER3HIGHVALUE_auxiliar=65535-duty3*50000;
	MOVLW       0
	MOVWF       R4 
	MOVLW       80
	MOVWF       R5 
	MOVLW       67
	MOVWF       R6 
	MOVLW       142
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       255
	MOVWF       R1 
	MOVLW       127
	MOVWF       R2 
	MOVLW       142
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _TIMER3HIGHVALUE_auxiliar+0 
	MOVF        R1, 0 
	MOVWF       _TIMER3HIGHVALUE_auxiliar+1 
;BracoRoboIc.c,114 :: 		TIMER3LOWVALUE_auxiliar=((65535-TIMER3HIGHVALUE)+15535);
	MOVF        _TIMER3HIGHVALUE+0, 0 
	SUBLW       255
	MOVWF       R2 
	MOVF        _TIMER3HIGHVALUE+1, 0 
	MOVWF       R3 
	MOVLW       255
	SUBFWB      R3, 1 
	MOVLW       175
	ADDWF       R2, 1 
	MOVLW       60
	ADDWFC      R3, 1 
	MOVF        R2, 0 
	MOVWF       _TIMER3LOWVALUE_auxiliar+0 
	MOVF        R3, 0 
	MOVWF       _TIMER3LOWVALUE_auxiliar+1 
;BracoRoboIc.c,115 :: 		TIMER3HIGHVALUE=TIMER3HIGHVALUE_auxiliar;
	MOVF        R0, 0 
	MOVWF       _TIMER3HIGHVALUE+0 
	MOVF        R1, 0 
	MOVWF       _TIMER3HIGHVALUE+1 
;BracoRoboIc.c,116 :: 		TIMER3LOWVALUE=TIMER3LOWVALUE_auxiliar;
	MOVF        R2, 0 
	MOVWF       _TIMER3LOWVALUE+0 
	MOVF        R3, 0 
	MOVWF       _TIMER3LOWVALUE+1 
;BracoRoboIc.c,118 :: 		}
L_end_set_servo_3:
	RETURN      0
; end of _set_servo_3

_set_arm_Position:

;BracoRoboIc.c,120 :: 		void set_arm_Position(float Position_1,float Position_2,float Position_3){      // Posição na qual o braço deve mover-se
;BracoRoboIc.c,121 :: 		float movimento_1 = Position_1 - old_position_1;
	MOVF        _old_position_1+0, 0 
	MOVWF       R4 
	MOVF        _old_position_1+1, 0 
	MOVWF       R5 
	MOVF        _old_position_1+2, 0 
	MOVWF       R6 
	MOVF        _old_position_1+3, 0 
	MOVWF       R7 
	MOVF        FARG_set_arm_Position_Position_1+0, 0 
	MOVWF       R0 
	MOVF        FARG_set_arm_Position_Position_1+1, 0 
	MOVWF       R1 
	MOVF        FARG_set_arm_Position_Position_1+2, 0 
	MOVWF       R2 
	MOVF        FARG_set_arm_Position_Position_1+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__set_arm_Position+0 
	MOVF        R1, 0 
	MOVWF       FLOC__set_arm_Position+1 
	MOVF        R2, 0 
	MOVWF       FLOC__set_arm_Position+2 
	MOVF        R3, 0 
	MOVWF       FLOC__set_arm_Position+3 
	MOVF        FLOC__set_arm_Position+0, 0 
	MOVWF       set_arm_Position_movimento_1_L0+0 
	MOVF        FLOC__set_arm_Position+1, 0 
	MOVWF       set_arm_Position_movimento_1_L0+1 
	MOVF        FLOC__set_arm_Position+2, 0 
	MOVWF       set_arm_Position_movimento_1_L0+2 
	MOVF        FLOC__set_arm_Position+3, 0 
	MOVWF       set_arm_Position_movimento_1_L0+3 
;BracoRoboIc.c,122 :: 		float movimento_2 = Position_2 - old_position_2;
	MOVF        _old_position_2+0, 0 
	MOVWF       R4 
	MOVF        _old_position_2+1, 0 
	MOVWF       R5 
	MOVF        _old_position_2+2, 0 
	MOVWF       R6 
	MOVF        _old_position_2+3, 0 
	MOVWF       R7 
	MOVF        FARG_set_arm_Position_Position_2+0, 0 
	MOVWF       R0 
	MOVF        FARG_set_arm_Position_Position_2+1, 0 
	MOVWF       R1 
	MOVF        FARG_set_arm_Position_Position_2+2, 0 
	MOVWF       R2 
	MOVF        FARG_set_arm_Position_Position_2+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_2_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_2_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_2_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_2_L0+3 
;BracoRoboIc.c,123 :: 		float movimento_3 = Position_3 - old_position_3;
	MOVF        _old_position_3+0, 0 
	MOVWF       R4 
	MOVF        _old_position_3+1, 0 
	MOVWF       R5 
	MOVF        _old_position_3+2, 0 
	MOVWF       R6 
	MOVF        _old_position_3+3, 0 
	MOVWF       R7 
	MOVF        FARG_set_arm_Position_Position_3+0, 0 
	MOVWF       R0 
	MOVF        FARG_set_arm_Position_Position_3+1, 0 
	MOVWF       R1 
	MOVF        FARG_set_arm_Position_Position_3+2, 0 
	MOVWF       R2 
	MOVF        FARG_set_arm_Position_Position_3+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_3_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_3_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_3_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_3_L0+3 
;BracoRoboIc.c,124 :: 		if (abs(movimento_1)> abs(movimento_2)){
	MOVF        FLOC__set_arm_Position+0, 0 
	MOVWF       R0 
	MOVF        FLOC__set_arm_Position+1, 0 
	MOVWF       R1 
	MOVF        FLOC__set_arm_Position+2, 0 
	MOVWF       R2 
	MOVF        FLOC__set_arm_Position+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__set_arm_Position+0 
	MOVF        R1, 0 
	MOVWF       FLOC__set_arm_Position+1 
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       128
	XORWF       R1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       FLOC__set_arm_Position+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__set_arm_Position51
	MOVF        FLOC__set_arm_Position+0, 0 
	SUBWF       R0, 0 
L__set_arm_Position51:
	BTFSC       STATUS+0, 0 
	GOTO        L_set_arm_Position9
;BracoRoboIc.c,125 :: 		if (abs(movimento_1)> abs(movimento_3)){                  // o 1 é o maior movimento a se fazer
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__set_arm_Position+0 
	MOVF        R1, 0 
	MOVWF       FLOC__set_arm_Position+1 
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       128
	XORWF       R1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       FLOC__set_arm_Position+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__set_arm_Position52
	MOVF        FLOC__set_arm_Position+0, 0 
	SUBWF       R0, 0 
L__set_arm_Position52:
	BTFSC       STATUS+0, 0 
	GOTO        L_set_arm_Position10
;BracoRoboIc.c,126 :: 		movimento_2=movimento_2/(abs(movimento_1)*10);
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_2_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_2_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_2_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_2_L0+3 
;BracoRoboIc.c,127 :: 		movimento_3=movimento_3/(abs(movimento_1)*10);
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_3_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_3_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_3_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_3_L0+3 
;BracoRoboIc.c,128 :: 		movimento_1=movimento_1/(abs(movimento_1)*10);
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_1_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_1_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_1_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_1_L0+3 
;BracoRoboIc.c,129 :: 		while(((abs(Position_1-old_position_1))>0.2)){
L_set_arm_Position11:
	MOVF        _old_position_1+0, 0 
	MOVWF       R4 
	MOVF        _old_position_1+1, 0 
	MOVWF       R5 
	MOVF        _old_position_1+2, 0 
	MOVWF       R6 
	MOVF        _old_position_1+3, 0 
	MOVWF       R7 
	MOVF        FARG_set_arm_Position_Position_1+0, 0 
	MOVWF       R0 
	MOVF        FARG_set_arm_Position_Position_1+1, 0 
	MOVWF       R1 
	MOVF        FARG_set_arm_Position_Position_1+2, 0 
	MOVWF       R2 
	MOVF        FARG_set_arm_Position_Position_1+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       205
	MOVWF       R0 
	MOVLW       204
	MOVWF       R1 
	MOVLW       76
	MOVWF       R2 
	MOVLW       124
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_set_arm_Position12
;BracoRoboIc.c,130 :: 		old_position_1=old_position_1+movimento_1;
	MOVF        _old_position_1+0, 0 
	MOVWF       R0 
	MOVF        _old_position_1+1, 0 
	MOVWF       R1 
	MOVF        _old_position_1+2, 0 
	MOVWF       R2 
	MOVF        _old_position_1+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__set_arm_Position+0 
	MOVF        R1, 0 
	MOVWF       FLOC__set_arm_Position+1 
	MOVF        R2, 0 
	MOVWF       FLOC__set_arm_Position+2 
	MOVF        R3, 0 
	MOVWF       FLOC__set_arm_Position+3 
	MOVF        FLOC__set_arm_Position+0, 0 
	MOVWF       _old_position_1+0 
	MOVF        FLOC__set_arm_Position+1, 0 
	MOVWF       _old_position_1+1 
	MOVF        FLOC__set_arm_Position+2, 0 
	MOVWF       _old_position_1+2 
	MOVF        FLOC__set_arm_Position+3, 0 
	MOVWF       _old_position_1+3 
;BracoRoboIc.c,131 :: 		old_position_2=old_position_2+movimento_2;
	MOVF        _old_position_2+0, 0 
	MOVWF       R0 
	MOVF        _old_position_2+1, 0 
	MOVWF       R1 
	MOVF        _old_position_2+2, 0 
	MOVWF       R2 
	MOVF        _old_position_2+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _old_position_2+0 
	MOVF        R1, 0 
	MOVWF       _old_position_2+1 
	MOVF        R2, 0 
	MOVWF       _old_position_2+2 
	MOVF        R3, 0 
	MOVWF       _old_position_2+3 
;BracoRoboIc.c,132 :: 		old_position_3=old_position_3+movimento_3;
	MOVF        _old_position_3+0, 0 
	MOVWF       R0 
	MOVF        _old_position_3+1, 0 
	MOVWF       R1 
	MOVF        _old_position_3+2, 0 
	MOVWF       R2 
	MOVF        _old_position_3+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _old_position_3+0 
	MOVF        R1, 0 
	MOVWF       _old_position_3+1 
	MOVF        R2, 0 
	MOVWF       _old_position_3+2 
	MOVF        R3, 0 
	MOVWF       _old_position_3+3 
;BracoRoboIc.c,133 :: 		set_servo_1(old_position_1);                         // manda o servo para a posição referente a posição 0 de NewPosition
	MOVF        FLOC__set_arm_Position+0, 0 
	MOVWF       FARG_set_servo_1_angle_1+0 
	MOVF        FLOC__set_arm_Position+1, 0 
	MOVWF       FARG_set_servo_1_angle_1+1 
	MOVF        FLOC__set_arm_Position+2, 0 
	MOVWF       FARG_set_servo_1_angle_1+2 
	MOVF        FLOC__set_arm_Position+3, 0 
	MOVWF       FARG_set_servo_1_angle_1+3 
	CALL        _set_servo_1+0, 0
;BracoRoboIc.c,134 :: 		set_servo_2(old_position_2);                         // manda o servo para a posição referente a posição 1 de NewPosition
	MOVF        _old_position_2+0, 0 
	MOVWF       FARG_set_servo_2_angle_2+0 
	MOVF        _old_position_2+1, 0 
	MOVWF       FARG_set_servo_2_angle_2+1 
	MOVF        _old_position_2+2, 0 
	MOVWF       FARG_set_servo_2_angle_2+2 
	MOVF        _old_position_2+3, 0 
	MOVWF       FARG_set_servo_2_angle_2+3 
	CALL        _set_servo_2+0, 0
;BracoRoboIc.c,135 :: 		set_servo_3(old_position_3);                         // manda o servo para a posição referente a posição 2 de NewPosition
	MOVF        _old_position_3+0, 0 
	MOVWF       FARG_set_servo_3_angle_3+0 
	MOVF        _old_position_3+1, 0 
	MOVWF       FARG_set_servo_3_angle_3+1 
	MOVF        _old_position_3+2, 0 
	MOVWF       FARG_set_servo_3_angle_3+2 
	MOVF        _old_position_3+3, 0 
	MOVWF       FARG_set_servo_3_angle_3+3 
	CALL        _set_servo_3+0, 0
;BracoRoboIc.c,136 :: 		delay_ms(4);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_set_arm_Position13:
	DECFSZ      R13, 1, 1
	BRA         L_set_arm_Position13
	DECFSZ      R12, 1, 1
	BRA         L_set_arm_Position13
	NOP
;BracoRoboIc.c,137 :: 		}
	GOTO        L_set_arm_Position11
L_set_arm_Position12:
;BracoRoboIc.c,138 :: 		}
	GOTO        L_set_arm_Position14
L_set_arm_Position10:
;BracoRoboIc.c,140 :: 		movimento_1=movimento_1/(abs(movimento_3)*10);
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_1_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_1_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_1_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_1_L0+3 
;BracoRoboIc.c,141 :: 		movimento_2=movimento_2/(abs(movimento_3)*10);
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_2_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_2_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_2_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_2_L0+3 
;BracoRoboIc.c,142 :: 		movimento_3=movimento_3/(abs(movimento_3)*10);
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_3_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_3_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_3_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_3_L0+3 
;BracoRoboIc.c,143 :: 		while(((abs(Position_3-old_position_3))>0.2)){
L_set_arm_Position15:
	MOVF        _old_position_3+0, 0 
	MOVWF       R4 
	MOVF        _old_position_3+1, 0 
	MOVWF       R5 
	MOVF        _old_position_3+2, 0 
	MOVWF       R6 
	MOVF        _old_position_3+3, 0 
	MOVWF       R7 
	MOVF        FARG_set_arm_Position_Position_3+0, 0 
	MOVWF       R0 
	MOVF        FARG_set_arm_Position_Position_3+1, 0 
	MOVWF       R1 
	MOVF        FARG_set_arm_Position_Position_3+2, 0 
	MOVWF       R2 
	MOVF        FARG_set_arm_Position_Position_3+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       205
	MOVWF       R0 
	MOVLW       204
	MOVWF       R1 
	MOVLW       76
	MOVWF       R2 
	MOVLW       124
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_set_arm_Position16
;BracoRoboIc.c,144 :: 		old_position_1=old_position_1+movimento_1;
	MOVF        _old_position_1+0, 0 
	MOVWF       R0 
	MOVF        _old_position_1+1, 0 
	MOVWF       R1 
	MOVF        _old_position_1+2, 0 
	MOVWF       R2 
	MOVF        _old_position_1+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__set_arm_Position+0 
	MOVF        R1, 0 
	MOVWF       FLOC__set_arm_Position+1 
	MOVF        R2, 0 
	MOVWF       FLOC__set_arm_Position+2 
	MOVF        R3, 0 
	MOVWF       FLOC__set_arm_Position+3 
	MOVF        FLOC__set_arm_Position+0, 0 
	MOVWF       _old_position_1+0 
	MOVF        FLOC__set_arm_Position+1, 0 
	MOVWF       _old_position_1+1 
	MOVF        FLOC__set_arm_Position+2, 0 
	MOVWF       _old_position_1+2 
	MOVF        FLOC__set_arm_Position+3, 0 
	MOVWF       _old_position_1+3 
;BracoRoboIc.c,145 :: 		old_position_2=old_position_2+movimento_2;
	MOVF        _old_position_2+0, 0 
	MOVWF       R0 
	MOVF        _old_position_2+1, 0 
	MOVWF       R1 
	MOVF        _old_position_2+2, 0 
	MOVWF       R2 
	MOVF        _old_position_2+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _old_position_2+0 
	MOVF        R1, 0 
	MOVWF       _old_position_2+1 
	MOVF        R2, 0 
	MOVWF       _old_position_2+2 
	MOVF        R3, 0 
	MOVWF       _old_position_2+3 
;BracoRoboIc.c,146 :: 		old_position_3=old_position_3+movimento_3;
	MOVF        _old_position_3+0, 0 
	MOVWF       R0 
	MOVF        _old_position_3+1, 0 
	MOVWF       R1 
	MOVF        _old_position_3+2, 0 
	MOVWF       R2 
	MOVF        _old_position_3+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _old_position_3+0 
	MOVF        R1, 0 
	MOVWF       _old_position_3+1 
	MOVF        R2, 0 
	MOVWF       _old_position_3+2 
	MOVF        R3, 0 
	MOVWF       _old_position_3+3 
;BracoRoboIc.c,147 :: 		set_servo_1(old_position_1);                         // manda o servo para a posição referente a posição 0 de NewPosition
	MOVF        FLOC__set_arm_Position+0, 0 
	MOVWF       FARG_set_servo_1_angle_1+0 
	MOVF        FLOC__set_arm_Position+1, 0 
	MOVWF       FARG_set_servo_1_angle_1+1 
	MOVF        FLOC__set_arm_Position+2, 0 
	MOVWF       FARG_set_servo_1_angle_1+2 
	MOVF        FLOC__set_arm_Position+3, 0 
	MOVWF       FARG_set_servo_1_angle_1+3 
	CALL        _set_servo_1+0, 0
;BracoRoboIc.c,148 :: 		set_servo_2(old_position_2);                         // manda o servo para a posição referente a posição 1 de NewPosition
	MOVF        _old_position_2+0, 0 
	MOVWF       FARG_set_servo_2_angle_2+0 
	MOVF        _old_position_2+1, 0 
	MOVWF       FARG_set_servo_2_angle_2+1 
	MOVF        _old_position_2+2, 0 
	MOVWF       FARG_set_servo_2_angle_2+2 
	MOVF        _old_position_2+3, 0 
	MOVWF       FARG_set_servo_2_angle_2+3 
	CALL        _set_servo_2+0, 0
;BracoRoboIc.c,149 :: 		set_servo_3(old_position_3);                         // manda o servo para a posição referente a posição 2 de NewPosition
	MOVF        _old_position_3+0, 0 
	MOVWF       FARG_set_servo_3_angle_3+0 
	MOVF        _old_position_3+1, 0 
	MOVWF       FARG_set_servo_3_angle_3+1 
	MOVF        _old_position_3+2, 0 
	MOVWF       FARG_set_servo_3_angle_3+2 
	MOVF        _old_position_3+3, 0 
	MOVWF       FARG_set_servo_3_angle_3+3 
	CALL        _set_servo_3+0, 0
;BracoRoboIc.c,150 :: 		delay_ms(4);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_set_arm_Position17:
	DECFSZ      R13, 1, 1
	BRA         L_set_arm_Position17
	DECFSZ      R12, 1, 1
	BRA         L_set_arm_Position17
	NOP
;BracoRoboIc.c,151 :: 		}
	GOTO        L_set_arm_Position15
L_set_arm_Position16:
;BracoRoboIc.c,152 :: 		}
L_set_arm_Position14:
;BracoRoboIc.c,153 :: 		}
	GOTO        L_set_arm_Position18
L_set_arm_Position9:
;BracoRoboIc.c,154 :: 		else if (abs(movimento_2)>abs(movimento_3)){                 // o 2 é o maior movimento a se fazer
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__set_arm_Position+0 
	MOVF        R1, 0 
	MOVWF       FLOC__set_arm_Position+1 
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       128
	XORWF       R1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       FLOC__set_arm_Position+1, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__set_arm_Position53
	MOVF        FLOC__set_arm_Position+0, 0 
	SUBWF       R0, 0 
L__set_arm_Position53:
	BTFSC       STATUS+0, 0 
	GOTO        L_set_arm_Position19
;BracoRoboIc.c,155 :: 		movimento_1=movimento_1/(abs(movimento_2)*10);
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_1_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_1_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_1_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_1_L0+3 
;BracoRoboIc.c,156 :: 		movimento_3=movimento_3/(abs(movimento_2)*10);
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_3_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_3_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_3_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_3_L0+3 
;BracoRoboIc.c,157 :: 		movimento_2=movimento_2/(abs(movimento_2)*10);
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_2_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_2_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_2_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_2_L0+3 
;BracoRoboIc.c,158 :: 		while(((abs(Position_2-old_position_2))>0.2)){
L_set_arm_Position20:
	MOVF        _old_position_2+0, 0 
	MOVWF       R4 
	MOVF        _old_position_2+1, 0 
	MOVWF       R5 
	MOVF        _old_position_2+2, 0 
	MOVWF       R6 
	MOVF        _old_position_2+3, 0 
	MOVWF       R7 
	MOVF        FARG_set_arm_Position_Position_2+0, 0 
	MOVWF       R0 
	MOVF        FARG_set_arm_Position_Position_2+1, 0 
	MOVWF       R1 
	MOVF        FARG_set_arm_Position_Position_2+2, 0 
	MOVWF       R2 
	MOVF        FARG_set_arm_Position_Position_2+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       205
	MOVWF       R0 
	MOVLW       204
	MOVWF       R1 
	MOVLW       76
	MOVWF       R2 
	MOVLW       124
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_set_arm_Position21
;BracoRoboIc.c,159 :: 		old_position_1=old_position_1+movimento_1;
	MOVF        _old_position_1+0, 0 
	MOVWF       R0 
	MOVF        _old_position_1+1, 0 
	MOVWF       R1 
	MOVF        _old_position_1+2, 0 
	MOVWF       R2 
	MOVF        _old_position_1+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__set_arm_Position+0 
	MOVF        R1, 0 
	MOVWF       FLOC__set_arm_Position+1 
	MOVF        R2, 0 
	MOVWF       FLOC__set_arm_Position+2 
	MOVF        R3, 0 
	MOVWF       FLOC__set_arm_Position+3 
	MOVF        FLOC__set_arm_Position+0, 0 
	MOVWF       _old_position_1+0 
	MOVF        FLOC__set_arm_Position+1, 0 
	MOVWF       _old_position_1+1 
	MOVF        FLOC__set_arm_Position+2, 0 
	MOVWF       _old_position_1+2 
	MOVF        FLOC__set_arm_Position+3, 0 
	MOVWF       _old_position_1+3 
;BracoRoboIc.c,160 :: 		old_position_2=old_position_2+movimento_2;
	MOVF        _old_position_2+0, 0 
	MOVWF       R0 
	MOVF        _old_position_2+1, 0 
	MOVWF       R1 
	MOVF        _old_position_2+2, 0 
	MOVWF       R2 
	MOVF        _old_position_2+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _old_position_2+0 
	MOVF        R1, 0 
	MOVWF       _old_position_2+1 
	MOVF        R2, 0 
	MOVWF       _old_position_2+2 
	MOVF        R3, 0 
	MOVWF       _old_position_2+3 
;BracoRoboIc.c,161 :: 		old_position_3=old_position_3+movimento_3;
	MOVF        _old_position_3+0, 0 
	MOVWF       R0 
	MOVF        _old_position_3+1, 0 
	MOVWF       R1 
	MOVF        _old_position_3+2, 0 
	MOVWF       R2 
	MOVF        _old_position_3+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _old_position_3+0 
	MOVF        R1, 0 
	MOVWF       _old_position_3+1 
	MOVF        R2, 0 
	MOVWF       _old_position_3+2 
	MOVF        R3, 0 
	MOVWF       _old_position_3+3 
;BracoRoboIc.c,162 :: 		set_servo_1(old_position_1);                         // manda o servo para a posição referente a posição 0 de NewPosition
	MOVF        FLOC__set_arm_Position+0, 0 
	MOVWF       FARG_set_servo_1_angle_1+0 
	MOVF        FLOC__set_arm_Position+1, 0 
	MOVWF       FARG_set_servo_1_angle_1+1 
	MOVF        FLOC__set_arm_Position+2, 0 
	MOVWF       FARG_set_servo_1_angle_1+2 
	MOVF        FLOC__set_arm_Position+3, 0 
	MOVWF       FARG_set_servo_1_angle_1+3 
	CALL        _set_servo_1+0, 0
;BracoRoboIc.c,163 :: 		set_servo_2(old_position_2);                         // manda o servo para a posição referente a posição 1 de NewPosition
	MOVF        _old_position_2+0, 0 
	MOVWF       FARG_set_servo_2_angle_2+0 
	MOVF        _old_position_2+1, 0 
	MOVWF       FARG_set_servo_2_angle_2+1 
	MOVF        _old_position_2+2, 0 
	MOVWF       FARG_set_servo_2_angle_2+2 
	MOVF        _old_position_2+3, 0 
	MOVWF       FARG_set_servo_2_angle_2+3 
	CALL        _set_servo_2+0, 0
;BracoRoboIc.c,164 :: 		set_servo_3(old_position_3);                         // manda o servo para a posição referente a posição 2 de NewPosition
	MOVF        _old_position_3+0, 0 
	MOVWF       FARG_set_servo_3_angle_3+0 
	MOVF        _old_position_3+1, 0 
	MOVWF       FARG_set_servo_3_angle_3+1 
	MOVF        _old_position_3+2, 0 
	MOVWF       FARG_set_servo_3_angle_3+2 
	MOVF        _old_position_3+3, 0 
	MOVWF       FARG_set_servo_3_angle_3+3 
	CALL        _set_servo_3+0, 0
;BracoRoboIc.c,165 :: 		delay_ms(4);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_set_arm_Position22:
	DECFSZ      R13, 1, 1
	BRA         L_set_arm_Position22
	DECFSZ      R12, 1, 1
	BRA         L_set_arm_Position22
	NOP
;BracoRoboIc.c,166 :: 		}
	GOTO        L_set_arm_Position20
L_set_arm_Position21:
;BracoRoboIc.c,167 :: 		}
	GOTO        L_set_arm_Position23
L_set_arm_Position19:
;BracoRoboIc.c,169 :: 		movimento_1=movimento_1/(abs(movimento_3)*10);
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_1_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_1_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_1_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_1_L0+3 
;BracoRoboIc.c,170 :: 		movimento_2=movimento_2/(abs(movimento_3)*10);
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_2_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_2_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_2_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_2_L0+3 
;BracoRoboIc.c,171 :: 		movimento_3=movimento_3/(abs(movimento_3)*10);
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R0 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R1 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R2 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       set_arm_Position_movimento_3_L0+0 
	MOVF        R1, 0 
	MOVWF       set_arm_Position_movimento_3_L0+1 
	MOVF        R2, 0 
	MOVWF       set_arm_Position_movimento_3_L0+2 
	MOVF        R3, 0 
	MOVWF       set_arm_Position_movimento_3_L0+3 
;BracoRoboIc.c,172 :: 		while(((abs(Position_3-old_position_3))>0.2)){
L_set_arm_Position24:
	MOVF        _old_position_3+0, 0 
	MOVWF       R4 
	MOVF        _old_position_3+1, 0 
	MOVWF       R5 
	MOVF        _old_position_3+2, 0 
	MOVWF       R6 
	MOVF        _old_position_3+3, 0 
	MOVWF       R7 
	MOVF        FARG_set_arm_Position_Position_3+0, 0 
	MOVWF       R0 
	MOVF        FARG_set_arm_Position_Position_3+1, 0 
	MOVWF       R1 
	MOVF        FARG_set_arm_Position_Position_3+2, 0 
	MOVWF       R2 
	MOVF        FARG_set_arm_Position_Position_3+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_abs_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_abs_a+1 
	CALL        _abs+0, 0
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       205
	MOVWF       R0 
	MOVLW       204
	MOVWF       R1 
	MOVLW       76
	MOVWF       R2 
	MOVLW       124
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_set_arm_Position25
;BracoRoboIc.c,173 :: 		old_position_1=old_position_1+movimento_1;
	MOVF        _old_position_1+0, 0 
	MOVWF       R0 
	MOVF        _old_position_1+1, 0 
	MOVWF       R1 
	MOVF        _old_position_1+2, 0 
	MOVWF       R2 
	MOVF        _old_position_1+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_1_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_1_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_1_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_1_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__set_arm_Position+0 
	MOVF        R1, 0 
	MOVWF       FLOC__set_arm_Position+1 
	MOVF        R2, 0 
	MOVWF       FLOC__set_arm_Position+2 
	MOVF        R3, 0 
	MOVWF       FLOC__set_arm_Position+3 
	MOVF        FLOC__set_arm_Position+0, 0 
	MOVWF       _old_position_1+0 
	MOVF        FLOC__set_arm_Position+1, 0 
	MOVWF       _old_position_1+1 
	MOVF        FLOC__set_arm_Position+2, 0 
	MOVWF       _old_position_1+2 
	MOVF        FLOC__set_arm_Position+3, 0 
	MOVWF       _old_position_1+3 
;BracoRoboIc.c,174 :: 		old_position_2=old_position_2+movimento_2;
	MOVF        _old_position_2+0, 0 
	MOVWF       R0 
	MOVF        _old_position_2+1, 0 
	MOVWF       R1 
	MOVF        _old_position_2+2, 0 
	MOVWF       R2 
	MOVF        _old_position_2+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_2_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_2_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_2_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_2_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _old_position_2+0 
	MOVF        R1, 0 
	MOVWF       _old_position_2+1 
	MOVF        R2, 0 
	MOVWF       _old_position_2+2 
	MOVF        R3, 0 
	MOVWF       _old_position_2+3 
;BracoRoboIc.c,175 :: 		old_position_3=old_position_3+movimento_3;
	MOVF        _old_position_3+0, 0 
	MOVWF       R0 
	MOVF        _old_position_3+1, 0 
	MOVWF       R1 
	MOVF        _old_position_3+2, 0 
	MOVWF       R2 
	MOVF        _old_position_3+3, 0 
	MOVWF       R3 
	MOVF        set_arm_Position_movimento_3_L0+0, 0 
	MOVWF       R4 
	MOVF        set_arm_Position_movimento_3_L0+1, 0 
	MOVWF       R5 
	MOVF        set_arm_Position_movimento_3_L0+2, 0 
	MOVWF       R6 
	MOVF        set_arm_Position_movimento_3_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _old_position_3+0 
	MOVF        R1, 0 
	MOVWF       _old_position_3+1 
	MOVF        R2, 0 
	MOVWF       _old_position_3+2 
	MOVF        R3, 0 
	MOVWF       _old_position_3+3 
;BracoRoboIc.c,176 :: 		set_servo_1(old_position_1);                         // manda o servo para a posição referente a posição 0 de NewPosition
	MOVF        FLOC__set_arm_Position+0, 0 
	MOVWF       FARG_set_servo_1_angle_1+0 
	MOVF        FLOC__set_arm_Position+1, 0 
	MOVWF       FARG_set_servo_1_angle_1+1 
	MOVF        FLOC__set_arm_Position+2, 0 
	MOVWF       FARG_set_servo_1_angle_1+2 
	MOVF        FLOC__set_arm_Position+3, 0 
	MOVWF       FARG_set_servo_1_angle_1+3 
	CALL        _set_servo_1+0, 0
;BracoRoboIc.c,177 :: 		set_servo_2(old_position_2);                         // manda o servo para a posição referente a posição 1 de NewPosition
	MOVF        _old_position_2+0, 0 
	MOVWF       FARG_set_servo_2_angle_2+0 
	MOVF        _old_position_2+1, 0 
	MOVWF       FARG_set_servo_2_angle_2+1 
	MOVF        _old_position_2+2, 0 
	MOVWF       FARG_set_servo_2_angle_2+2 
	MOVF        _old_position_2+3, 0 
	MOVWF       FARG_set_servo_2_angle_2+3 
	CALL        _set_servo_2+0, 0
;BracoRoboIc.c,178 :: 		set_servo_3(old_position_3);                         // manda o servo para a posição referente a posição 2 de NewPosition
	MOVF        _old_position_3+0, 0 
	MOVWF       FARG_set_servo_3_angle_3+0 
	MOVF        _old_position_3+1, 0 
	MOVWF       FARG_set_servo_3_angle_3+1 
	MOVF        _old_position_3+2, 0 
	MOVWF       FARG_set_servo_3_angle_3+2 
	MOVF        _old_position_3+3, 0 
	MOVWF       FARG_set_servo_3_angle_3+3 
	CALL        _set_servo_3+0, 0
;BracoRoboIc.c,179 :: 		delay_ms(4);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_set_arm_Position26:
	DECFSZ      R13, 1, 1
	BRA         L_set_arm_Position26
	DECFSZ      R12, 1, 1
	BRA         L_set_arm_Position26
	NOP
;BracoRoboIc.c,180 :: 		}
	GOTO        L_set_arm_Position24
L_set_arm_Position25:
;BracoRoboIc.c,181 :: 		}
L_set_arm_Position23:
L_set_arm_Position18:
;BracoRoboIc.c,183 :: 		set_servo_1(Position_1);                                      // manda o servo para a posição referente a posição 0 de NewPosition
	MOVF        FARG_set_arm_Position_Position_1+0, 0 
	MOVWF       FARG_set_servo_1_angle_1+0 
	MOVF        FARG_set_arm_Position_Position_1+1, 0 
	MOVWF       FARG_set_servo_1_angle_1+1 
	MOVF        FARG_set_arm_Position_Position_1+2, 0 
	MOVWF       FARG_set_servo_1_angle_1+2 
	MOVF        FARG_set_arm_Position_Position_1+3, 0 
	MOVWF       FARG_set_servo_1_angle_1+3 
	CALL        _set_servo_1+0, 0
;BracoRoboIc.c,184 :: 		set_servo_2(Position_2);                                      // manda o servo para a posição referente a posição 1 de NewPosition
	MOVF        FARG_set_arm_Position_Position_2+0, 0 
	MOVWF       FARG_set_servo_2_angle_2+0 
	MOVF        FARG_set_arm_Position_Position_2+1, 0 
	MOVWF       FARG_set_servo_2_angle_2+1 
	MOVF        FARG_set_arm_Position_Position_2+2, 0 
	MOVWF       FARG_set_servo_2_angle_2+2 
	MOVF        FARG_set_arm_Position_Position_2+3, 0 
	MOVWF       FARG_set_servo_2_angle_2+3 
	CALL        _set_servo_2+0, 0
;BracoRoboIc.c,185 :: 		set_servo_3(Position_3);                                      // manda o servo para a posição referente a posição 2 de NewPosition
	MOVF        FARG_set_arm_Position_Position_3+0, 0 
	MOVWF       FARG_set_servo_3_angle_3+0 
	MOVF        FARG_set_arm_Position_Position_3+1, 0 
	MOVWF       FARG_set_servo_3_angle_3+1 
	MOVF        FARG_set_arm_Position_Position_3+2, 0 
	MOVWF       FARG_set_servo_3_angle_3+2 
	MOVF        FARG_set_arm_Position_Position_3+3, 0 
	MOVWF       FARG_set_servo_3_angle_3+3 
	CALL        _set_servo_3+0, 0
;BracoRoboIc.c,186 :: 		old_position_1=Position_1;
	MOVF        FARG_set_arm_Position_Position_1+0, 0 
	MOVWF       _old_position_1+0 
	MOVF        FARG_set_arm_Position_Position_1+1, 0 
	MOVWF       _old_position_1+1 
	MOVF        FARG_set_arm_Position_Position_1+2, 0 
	MOVWF       _old_position_1+2 
	MOVF        FARG_set_arm_Position_Position_1+3, 0 
	MOVWF       _old_position_1+3 
;BracoRoboIc.c,187 :: 		old_position_2=Position_2;
	MOVF        FARG_set_arm_Position_Position_2+0, 0 
	MOVWF       _old_position_2+0 
	MOVF        FARG_set_arm_Position_Position_2+1, 0 
	MOVWF       _old_position_2+1 
	MOVF        FARG_set_arm_Position_Position_2+2, 0 
	MOVWF       _old_position_2+2 
	MOVF        FARG_set_arm_Position_Position_2+3, 0 
	MOVWF       _old_position_2+3 
;BracoRoboIc.c,188 :: 		old_position_3=Position_3;
	MOVF        FARG_set_arm_Position_Position_3+0, 0 
	MOVWF       _old_position_3+0 
	MOVF        FARG_set_arm_Position_Position_3+1, 0 
	MOVWF       _old_position_3+1 
	MOVF        FARG_set_arm_Position_Position_3+2, 0 
	MOVWF       _old_position_3+2 
	MOVF        FARG_set_arm_Position_Position_3+3, 0 
	MOVWF       _old_position_3+3 
;BracoRoboIc.c,190 :: 		}
L_end_set_arm_Position:
	RETURN      0
; end of _set_arm_Position

_main:

;BracoRoboIc.c,192 :: 		void main() {
;BracoRoboIc.c,197 :: 		TRISC.RC3=0;                                              // pino do servo1 é output
	BCF         TRISC+0, 3 
;BracoRoboIc.c,198 :: 		TRISD.RD0=0;                                              // pino do servo2 é output
	BCF         TRISD+0, 0 
;BracoRoboIc.c,199 :: 		TRISD.RD1=0;                                              // pino do servo3 é output
	BCF         TRISD+0, 1 
;BracoRoboIc.c,200 :: 		TRISE.RE0=0;                                              // pino do eletroima
	BCF         TRISE+0, 0 
;BracoRoboIc.c,202 :: 		servo1=1;                                                 // pino do servo 1 inicia em nível lógico alto
	BSF         PORTC+0, 3 
;BracoRoboIc.c,203 :: 		servo2=1;                                                 // pino do servo 2 inicia em nível lógico alto
	BSF         PORTD+0, 0 
;BracoRoboIc.c,204 :: 		servo3=1;                                                 // pino do servo 3 inicia em nível lógico alto
	BSF         PORTD+0, 1 
;BracoRoboIc.c,205 :: 		magnet=0;                                                 // eletroima inicia desligado
	BCF         PORTE+0, 0 
;BracoRoboIc.c,207 :: 		ADCON1=0x0C;//an0 an1 an2 analogicas, resto digital //ADCON1=0x0F;                                              // Todas as portas são digitais
	MOVLW       12
	MOVWF       ADCON1+0 
;BracoRoboIc.c,208 :: 		ADCON2=0x80;// resultado justificado a direita
	MOVLW       128
	MOVWF       ADCON2+0 
;BracoRoboIc.c,211 :: 		TRISC.RC7=1;                                              // REMOVER_*****************************
	BSF         TRISC+0, 7 
;BracoRoboIc.c,212 :: 		TRISC.RC6=1;                                              // REMOVER_*****************************
	BSF         TRISC+0, 6 
;BracoRoboIc.c,213 :: 		UART1_Init(9600);                                         // REMOVER_*****************************
	BSF         BAUDCON+0, 3, 0
	MOVLW       2
	MOVWF       SPBRGH+0 
	MOVLW       8
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;BracoRoboIc.c,214 :: 		Delay_ms(100);                                            // REMOVER_*****************************
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
	NOP
	NOP
;BracoRoboIc.c,215 :: 		set_arm_Position(72.66,88,67.7);                          // Posição inicial HOME
	MOVLW       236
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       81
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       17
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       48
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       7
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,218 :: 		T0CON=0x00;                                               // timer 0 configurado para 16 bits, prescale 2, parado;
	CLRF        T0CON+0 
;BracoRoboIc.c,219 :: 		TMR0H=TIMER0HIGHVALUE>>8;                                 // inicializa o High byte de TIMER0HIGHVALUE no timer 0
	MOVF        _TIMER0HIGHVALUE+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR0H+0 
;BracoRoboIc.c,220 :: 		TMR0L=TIMER0HIGHVALUE;                                    // inicializa o Low byte de TIMER0HIGHVALUE no timer 0
	MOVF        _TIMER0HIGHVALUE+0, 0 
	MOVWF       TMR0L+0 
;BracoRoboIc.c,222 :: 		T1CON=0x14;                                               // timer 1 configurado para 16 bits, prescale 2, parado;
	MOVLW       20
	MOVWF       T1CON+0 
;BracoRoboIc.c,223 :: 		TMR1H=TIMER1HIGHVALUE>>8;                                 // inicializa o High byte de TIMER1HIGHVALUE no timer 1
	MOVF        _TIMER1HIGHVALUE+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR1H+0 
;BracoRoboIc.c,224 :: 		TMR1L=TIMER1HIGHVALUE;                                    // inicializa o Low byte de TIMER1HIGHVALUE no timer 1
	MOVF        _TIMER1HIGHVALUE+0, 0 
	MOVWF       TMR1L+0 
;BracoRoboIc.c,226 :: 		T3CON=0x14;                                               // timer 3 configurado para 16 bits, prescale 2, parado;
	MOVLW       20
	MOVWF       T3CON+0 
;BracoRoboIc.c,227 :: 		TMR3H=TIMER3HIGHVALUE>>8;                                 // inicializa o High byte de TIMER3HIGHVALUE no timer 3
	MOVF        _TIMER3HIGHVALUE+1, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       TMR3H+0 
;BracoRoboIc.c,228 :: 		TMR3L=TIMER3HIGHVALUE;                                    // inicializa o Low byte de TIMER3HIGHVALUE no timer 3
	MOVF        _TIMER3HIGHVALUE+0, 0 
	MOVWF       TMR3L+0 
;BracoRoboIc.c,231 :: 		INTCON=0xE0;                                              // habilita as interrupções globais, habilita as interrupções dos perifericos, habilita interrupção pelo overflow do timer 0
	MOVLW       224
	MOVWF       INTCON+0 
;BracoRoboIc.c,232 :: 		PIE1|=(1<<TMR1IE);                                        // habilita a interrupção do timer 1
	BSF         PIE1+0, 0 
;BracoRoboIc.c,233 :: 		PIE2|=(1<<TMR3IE);                                        // habilita a interrupção do timer 3
	BSF         PIE2+0, 1 
;BracoRoboIc.c,236 :: 		T0CON.TMR0ON=1;                                           // dispara o timer0
	BSF         T0CON+0, 7 
;BracoRoboIc.c,237 :: 		T1CON.TMR1ON=1;                                           // dispara o timer1
	BSF         T1CON+0, 0 
;BracoRoboIc.c,238 :: 		T3CON.TMR3ON=1;                                           // dispara o timer3
	BSF         T3CON+0, 0 
;BracoRoboIc.c,240 :: 		for(;;){//------------------------------------------------// Loop infinito
L_main28:
;BracoRoboIc.c,242 :: 		while((Matlab_Serial_data!='1')&&(Matlab_Serial_data!='2')&&(Matlab_Serial_data!='3')){
L_main31:
	MOVF        _Matlab_Serial_data+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_main32
	MOVF        _Matlab_Serial_data+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_main32
	MOVF        _Matlab_Serial_data+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_main32
L__main44:
;BracoRoboIc.c,243 :: 		if (UART1_Data_Ready()){                           // Espera chagar dados na serial
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main35
;BracoRoboIc.c,244 :: 		Matlab_Serial_data = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Matlab_Serial_data+0 
;BracoRoboIc.c,245 :: 		}
L_main35:
;BracoRoboIc.c,246 :: 		}
	GOTO        L_main31
L_main32:
;BracoRoboIc.c,247 :: 		set_arm_Position(72.66,88,67.7);                       // Posição inicial HOME
	MOVLW       236
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       81
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       17
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       48
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       7
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,248 :: 		set_arm_Position(105,86,160);                          // Posição peça
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       82
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       44
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       32
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       134
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,249 :: 		magnet=1;
	BSF         PORTE+0, 0 
;BracoRoboIc.c,250 :: 		set_arm_Position(107,83.57,124.8);
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       86
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       215
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       35
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       39
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       154
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       153
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       121
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,252 :: 		if(Matlab_Serial_data=='1'){                           //Se for na primeira caixa
	MOVF        _Matlab_Serial_data+0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main36
;BracoRoboIc.c,253 :: 		set_arm_Position(127,58.3,119);
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       126
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       51
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       51
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       105
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       132
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       110
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,254 :: 		set_arm_Position(103.2,48.7,138.7);                // Posição da primeira caixa
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       78
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       205
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       204
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       66
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       132
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       51
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       179
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       10
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       134
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,255 :: 		magnet=0;
	BCF         PORTE+0, 0 
;BracoRoboIc.c,256 :: 		set_arm_Position(127,58.3,119);
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       126
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       51
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       51
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       105
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       132
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       110
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,257 :: 		set_arm_Position(72.66,88,67.7);                   // Posição inicial HOME
	MOVLW       236
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       81
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       17
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       48
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       7
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,258 :: 		}
	GOTO        L_main37
L_main36:
;BracoRoboIc.c,260 :: 		else if(Matlab_Serial_data=='2'){                      //Se for na segunda caixa
	MOVF        _Matlab_Serial_data+0, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
;BracoRoboIc.c,261 :: 		set_arm_Position(122,48,104.8);
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       116
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       64
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       132
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       154
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       153
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       81
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,262 :: 		set_arm_Position(88.5,32.7,128);                   // Posição da segunda caixa
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       49
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       205
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       204
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       2
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       132
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       134
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,263 :: 		magnet=0;
	BCF         PORTE+0, 0 
;BracoRoboIc.c,264 :: 		Delay_ms(600);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main39:
	DECFSZ      R13, 1, 1
	BRA         L_main39
	DECFSZ      R12, 1, 1
	BRA         L_main39
	DECFSZ      R11, 1, 1
	BRA         L_main39
	NOP
	NOP
;BracoRoboIc.c,265 :: 		set_servo_1(77);
	MOVLW       0
	MOVWF       FARG_set_servo_1_angle_1+0 
	MOVLW       0
	MOVWF       FARG_set_servo_1_angle_1+1 
	MOVLW       26
	MOVWF       FARG_set_servo_1_angle_1+2 
	MOVLW       133
	MOVWF       FARG_set_servo_1_angle_1+3 
	CALL        _set_servo_1+0, 0
;BracoRoboIc.c,266 :: 		set_servo_3(135);                                   // balança para arruela cair
	MOVLW       0
	MOVWF       FARG_set_servo_3_angle_3+0 
	MOVLW       0
	MOVWF       FARG_set_servo_3_angle_3+1 
	MOVLW       7
	MOVWF       FARG_set_servo_3_angle_3+2 
	MOVLW       134
	MOVWF       FARG_set_servo_3_angle_3+3 
	CALL        _set_servo_3+0, 0
;BracoRoboIc.c,267 :: 		Delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_main40:
	DECFSZ      R13, 1, 1
	BRA         L_main40
	DECFSZ      R12, 1, 1
	BRA         L_main40
	DECFSZ      R11, 1, 1
	BRA         L_main40
	NOP
	NOP
;BracoRoboIc.c,268 :: 		set_servo_1(88.5);
	MOVLW       0
	MOVWF       FARG_set_servo_1_angle_1+0 
	MOVLW       0
	MOVWF       FARG_set_servo_1_angle_1+1 
	MOVLW       49
	MOVWF       FARG_set_servo_1_angle_1+2 
	MOVLW       133
	MOVWF       FARG_set_servo_1_angle_1+3 
	CALL        _set_servo_1+0, 0
;BracoRoboIc.c,269 :: 		set_servo_3(128);
	MOVLW       0
	MOVWF       FARG_set_servo_3_angle_3+0 
	MOVLW       0
	MOVWF       FARG_set_servo_3_angle_3+1 
	MOVLW       0
	MOVWF       FARG_set_servo_3_angle_3+2 
	MOVLW       134
	MOVWF       FARG_set_servo_3_angle_3+3 
	CALL        _set_servo_3+0, 0
;BracoRoboIc.c,270 :: 		Delay_ms(300);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_main41:
	DECFSZ      R13, 1, 1
	BRA         L_main41
	DECFSZ      R12, 1, 1
	BRA         L_main41
	DECFSZ      R11, 1, 1
	BRA         L_main41
	NOP
	NOP
;BracoRoboIc.c,271 :: 		set_arm_Position(122,48,104.8);
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       116
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       64
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       132
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       154
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       153
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       81
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,272 :: 		set_arm_Position(72.66,88,67.7);                   // Posição inicial HOME
	MOVLW       236
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       81
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       17
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       48
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       7
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,273 :: 		}
	GOTO        L_main42
L_main38:
;BracoRoboIc.c,275 :: 		else if(Matlab_Serial_data=='3'){                      //Se for na terceira caixa
	MOVF        _Matlab_Serial_data+0, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_main43
;BracoRoboIc.c,276 :: 		set_arm_Position(111.7,45.9,86.3);
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       95
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       154
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       153
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       55
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       132
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       154
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       153
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       44
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,277 :: 		set_arm_Position(96.77,19.7,99);
	MOVLW       61
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       138
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       65
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       154
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       153
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       29
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       131
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       70
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,278 :: 		set_arm_Position(80.7,6.51,126.86);                // Posição da terceira caixa
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       33
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       236
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       81
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       80
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       129
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       82
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       184
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       125
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,279 :: 		magnet=0;
	BCF         PORTE+0, 0 
;BracoRoboIc.c,280 :: 		set_arm_Position(96.77,19.7,99);
	MOVLW       61
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       138
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       65
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       154
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       153
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       29
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       131
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       70
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,281 :: 		set_arm_Position(72.66,88,67.7);                   // Posição inicial HOME
	MOVLW       236
	MOVWF       FARG_set_arm_Position_Position_1+0 
	MOVLW       81
	MOVWF       FARG_set_arm_Position_Position_1+1 
	MOVLW       17
	MOVWF       FARG_set_arm_Position_Position_1+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_1+3 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+0 
	MOVLW       0
	MOVWF       FARG_set_arm_Position_Position_2+1 
	MOVLW       48
	MOVWF       FARG_set_arm_Position_Position_2+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_2+3 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_3+0 
	MOVLW       102
	MOVWF       FARG_set_arm_Position_Position_3+1 
	MOVLW       7
	MOVWF       FARG_set_arm_Position_Position_3+2 
	MOVLW       133
	MOVWF       FARG_set_arm_Position_Position_3+3 
	CALL        _set_arm_Position+0, 0
;BracoRoboIc.c,282 :: 		}
L_main43:
L_main42:
L_main37:
;BracoRoboIc.c,284 :: 		Matlab_Serial_data=0;
	CLRF        _Matlab_Serial_data+0 
;BracoRoboIc.c,286 :: 		}
	GOTO        L_main28
;BracoRoboIc.c,288 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
