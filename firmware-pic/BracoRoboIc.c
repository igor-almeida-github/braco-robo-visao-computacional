#define servo1 PORTC.RC3
#define servo2 PORTD.RD0
#define servo3 PORTD.RD1
#define magnet PORTE.RE0

unsigned int TIMER0HIGHVALUE;
unsigned int TIMER0LOWVALUE;
unsigned int TIMER1HIGHVALUE;
unsigned int TIMER1LOWVALUE;
unsigned int TIMER3HIGHVALUE;
unsigned int TIMER3LOWVALUE;

unsigned int TIMER0HIGHVALUE_auxiliar;
unsigned int TIMER0LOWVALUE_auxiliar;
unsigned int TIMER1HIGHVALUE_auxiliar;
unsigned int TIMER1LOWVALUE_auxiliar;
unsigned int TIMER3HIGHVALUE_auxiliar;
unsigned int TIMER3LOWVALUE_auxiliar;

unsigned char Matlab_Serial_data=1;

float duty1;
float duty2;
float duty3;

float adc1;                                                       // REMOVER_*****************************
float adc2;                                                       // REMOVER_*****************************
float adc3;                                                       // REMOVER_*****************************

float old_position_1=72.66;
float old_position_2=88;
float old_position_3=67.7;


unsigned char disp[10];                                           // REMOVER_*****************************

void interrupt(){
   if (INTCON.TMR0IF){//------------------------------------------// Overflow do timer 0
      if(servo1){                                                 // se o pino do servo estiver em nível lógico alto
         servo1=0;
         // O valor armazenado em TIMER0LOWVALUE define 
         // quanto tempo o pino ficará em estado baixo
         TMR0H=TIMER0LOWVALUE>>8;                                 // inicializa o High byte de TIMER0LOWVALUE no timer 0
         TMR0L=TIMER0LOWVALUE;                                    // inicializa o Low byte de TIMER0LOWVALUE no timer 0
      }
      else {                                                      // se o pino do servo estiver em nível lógico baixo
         servo1=1;
         // O valor armazenado em TIMER0HIGHVALUE define 
         // quanto tempo o pino ficará em estado alto
         TMR0H=TIMER0HIGHVALUE>>8;                                // inicializa o High byte de TIMER0HIGHVALUE no timer 0
         TMR0L=TIMER0HIGHVALUE;                                   // inicializa o Low byte de TIMER0HIGHVALUE no timer 0
      }
      INTCON.TMR0IF=0;
   } //-------------------------------------------------------------------------

   if (PIR1.TMR1IF){//------------------------------------------  // Overflow do timer 1
      if(servo2){                                                 // se o pino do servo estiver em nível lógico alto
         servo2=0;
         // O valor armazenado em TIMER0LOWVALUE define
         // quanto tempo o pino ficará em estado baixo
         TMR1H=TIMER1LOWVALUE>>8;                                 // inicializa o High byte de TIMER0LOWVALUE no timer 0
         TMR1L=TIMER1LOWVALUE;                                    // inicializa o Low byte de TIMER0LOWVALUE no timer 0
      }
      else {                                                      // se o pino do servo estiver em nível lógico baixo
         servo2=1;
         // O valor armazenado em TIMER0HIGHVALUE define
         // quanto tempo o pino ficará em estado alto
         TMR1H=TIMER1HIGHVALUE>>8;                                // inicializa o High byte de TIMER0HIGHVALUE no timer 0
         TMR1L=TIMER1HIGHVALUE;                                   // inicializa o Low byte de TIMER0HIGHVALUE no timer 0
      }
      PIR1.TMR1IF=0;
   } //-------------------------------------------------------------------------
   
   if (PIR2.TMR3IF){//------------------------------------------  // Overflow do timer 3
      if(servo3){                                                 // se o pino do servo estiver em nível lógico alto
         servo3=0;
         // O valor armazenado em TIMER0LOWVALUE define
         // quanto tempo o pino ficará em estado baixo
         TMR3H=TIMER3LOWVALUE>>8;                                 // inicializa o High byte de TIMER0LOWVALUE no timer 0
         TMR3L=TIMER3LOWVALUE;                                    // inicializa o Low byte de TIMER0LOWVALUE no timer 0
      }
      else {                                                      // se o pino do servo estiver em nível lógico baixo
         servo3=1;
         // O valor armazenado em TIMER0HIGHVALUE define
         // quanto tempo o pino ficará em estado alto
         TMR3H=TIMER3HIGHVALUE>>8;                                // inicializa o High byte de TIMER0HIGHVALUE no timer 0
         TMR3L=TIMER3HIGHVALUE;                                   // inicializa o Low byte de TIMER0HIGHVALUE no timer 0
      }
      PIR2.TMR3IF=0;
   } //-------------------------------------------------------------------------

}
void set_servo_1(float angle_1){                                  // recebe o valor do angulo do servo, entre 0 e 180 graus, tipo float
        duty1=0.022+angle_1*0.092/180;
        TIMER0HIGHVALUE_auxiliar=65535-duty1*50000;
        TIMER0LOWVALUE_auxiliar=((65535-TIMER0HIGHVALUE)+15535);
        TIMER0HIGHVALUE=TIMER0HIGHVALUE_auxiliar;
        TIMER0LOWVALUE=TIMER0LOWVALUE_auxiliar;

}

void set_servo_2(float angle_2){                                  // recebe o valor do angulo do servo, entre 0 e 180 graus, tipo float
        duty2=0.022+angle_2*0.092/180;
        TIMER1HIGHVALUE_auxiliar=65535-duty2*50000;
        TIMER1LOWVALUE_auxiliar=((65535-TIMER1HIGHVALUE)+15535);
        TIMER1HIGHVALUE=TIMER1HIGHVALUE_auxiliar;
        TIMER1LOWVALUE=TIMER1LOWVALUE_auxiliar;

}

void set_servo_3(float angle_3){                                  // recebe o valor do angulo do servo, entre 0 e 180 graus, tipo float
        duty3=0.022+angle_3*0.092/180;
        TIMER3HIGHVALUE_auxiliar=65535-duty3*50000;
        TIMER3LOWVALUE_auxiliar=((65535-TIMER3HIGHVALUE)+15535);
        TIMER3HIGHVALUE=TIMER3HIGHVALUE_auxiliar;
        TIMER3LOWVALUE=TIMER3LOWVALUE_auxiliar;

}

void set_arm_Position(float Position_1,float Position_2,float Position_3){      // Posição na qual o braço deve mover-se
     float movimento_1 = Position_1 - old_position_1;
     float movimento_2 = Position_2 - old_position_2;
     float movimento_3 = Position_3 - old_position_3;
     if (abs(movimento_1)> abs(movimento_2)){
        if (abs(movimento_1)> abs(movimento_3)){                  // o 1 é o maior movimento a se fazer
           movimento_2=movimento_2/(abs(movimento_1)*10);
           movimento_3=movimento_3/(abs(movimento_1)*10);
           movimento_1=movimento_1/(abs(movimento_1)*10);
           while(((abs(Position_1-old_position_1))>0.2)){
             old_position_1=old_position_1+movimento_1;
             old_position_2=old_position_2+movimento_2;
             old_position_3=old_position_3+movimento_3;
             set_servo_1(old_position_1);                         // manda o servo para a posição referente a posição 0 de NewPosition
             set_servo_2(old_position_2);                         // manda o servo para a posição referente a posição 1 de NewPosition
             set_servo_3(old_position_3);                         // manda o servo para a posição referente a posição 2 de NewPosition
             delay_ms(4);
          }
        }
        else {                                                    // o 3 é o maior movimento a se fazer
           movimento_1=movimento_1/(abs(movimento_3)*10);
           movimento_2=movimento_2/(abs(movimento_3)*10);
           movimento_3=movimento_3/(abs(movimento_3)*10);
           while(((abs(Position_3-old_position_3))>0.2)){
             old_position_1=old_position_1+movimento_1;
             old_position_2=old_position_2+movimento_2;
             old_position_3=old_position_3+movimento_3;
             set_servo_1(old_position_1);                         // manda o servo para a posição referente a posição 0 de NewPosition
             set_servo_2(old_position_2);                         // manda o servo para a posição referente a posição 1 de NewPosition
             set_servo_3(old_position_3);                         // manda o servo para a posição referente a posição 2 de NewPosition
             delay_ms(4);
          }
        }
     }
     else if (abs(movimento_2)>abs(movimento_3)){                 // o 2 é o maior movimento a se fazer
          movimento_1=movimento_1/(abs(movimento_2)*10);
          movimento_3=movimento_3/(abs(movimento_2)*10);
          movimento_2=movimento_2/(abs(movimento_2)*10);
          while(((abs(Position_2-old_position_2))>0.2)){
             old_position_1=old_position_1+movimento_1;
             old_position_2=old_position_2+movimento_2;
             old_position_3=old_position_3+movimento_3;
             set_servo_1(old_position_1);                         // manda o servo para a posição referente a posição 0 de NewPosition
             set_servo_2(old_position_2);                         // manda o servo para a posição referente a posição 1 de NewPosition
             set_servo_3(old_position_3);                         // manda o servo para a posição referente a posição 2 de NewPosition
             delay_ms(4);
          }
     }
     else {                                                       // o 3 é o maior movimento a se fazer
          movimento_1=movimento_1/(abs(movimento_3)*10);
          movimento_2=movimento_2/(abs(movimento_3)*10);
          movimento_3=movimento_3/(abs(movimento_3)*10);
          while(((abs(Position_3-old_position_3))>0.2)){
             old_position_1=old_position_1+movimento_1;
             old_position_2=old_position_2+movimento_2;
             old_position_3=old_position_3+movimento_3;
             set_servo_1(old_position_1);                         // manda o servo para a posição referente a posição 0 de NewPosition
             set_servo_2(old_position_2);                         // manda o servo para a posição referente a posição 1 de NewPosition
             set_servo_3(old_position_3);                         // manda o servo para a posição referente a posição 2 de NewPosition
             delay_ms(4);
          }
     }
     
    set_servo_1(Position_1);                                      // manda o servo para a posição referente a posição 0 de NewPosition
    set_servo_2(Position_2);                                      // manda o servo para a posição referente a posição 1 de NewPosition
    set_servo_3(Position_3);                                      // manda o servo para a posição referente a posição 2 de NewPosition
    old_position_1=Position_1;
    old_position_2=Position_2;
    old_position_3=Position_3;

}

void main() {
        //declaração de variáveis da main --------------------------------------
        
        // Configurações iniciais ----------------------------------------------

        TRISC.RC3=0;                                              // pino do servo1 é output
        TRISD.RD0=0;                                              // pino do servo2 é output
        TRISD.RD1=0;                                              // pino do servo3 é output
        TRISE.RE0=0;                                              // pino do eletroima
        
        servo1=1;                                                 // pino do servo 1 inicia em nível lógico alto
        servo2=1;                                                 // pino do servo 2 inicia em nível lógico alto
        servo3=1;                                                 // pino do servo 3 inicia em nível lógico alto
        magnet=0;                                                 // eletroima inicia desligado

        ADCON1=0x0C;//an0 an1 an2 analogicas, resto digital //ADCON1=0x0F;                                              // Todas as portas são digitais
        ADCON2=0x80;// resultado justificado a direita
        
        RCSTA<7>=1;                                               // REMOVER_*****************************
        TRISC.RC7=1;                                              // REMOVER_*****************************
        TRISC.RC6=1;                                              // REMOVER_*****************************
        UART1_Init(9600);                                         // REMOVER_*****************************
        Delay_ms(100);                                            // REMOVER_*****************************
        set_arm_Position(72.66,88,67.7);                          // Posição inicial HOME

        //Configuração dos timers ----------------------------------------------
        T0CON=0x00;                                               // timer 0 configurado para 16 bits, prescale 2, parado;
        TMR0H=TIMER0HIGHVALUE>>8;                                 // inicializa o High byte de TIMER0HIGHVALUE no timer 0
        TMR0L=TIMER0HIGHVALUE;                                    // inicializa o Low byte de TIMER0HIGHVALUE no timer 0

        T1CON=0x14;                                               // timer 1 configurado para 16 bits, prescale 2, parado;
        TMR1H=TIMER1HIGHVALUE>>8;                                 // inicializa o High byte de TIMER1HIGHVALUE no timer 1
        TMR1L=TIMER1HIGHVALUE;                                    // inicializa o Low byte de TIMER1HIGHVALUE no timer 1

        T3CON=0x14;                                               // timer 3 configurado para 16 bits, prescale 2, parado;
        TMR3H=TIMER3HIGHVALUE>>8;                                 // inicializa o High byte de TIMER3HIGHVALUE no timer 3
        TMR3L=TIMER3HIGHVALUE;                                    // inicializa o Low byte de TIMER3HIGHVALUE no timer 3

        // Configuração das interrupções  --------------------------------------
        INTCON=0xE0;                                              // habilita as interrupções globais, habilita as interrupções dos perifericos, habilita interrupção pelo overflow do timer 0
        PIE1|=(1<<TMR1IE);                                        // habilita a interrupção do timer 1
        PIE2|=(1<<TMR3IE);                                        // habilita a interrupção do timer 3

        // ---------------------------------------------------------------------
        T0CON.TMR0ON=1;                                           // dispara o timer0
        T1CON.TMR1ON=1;                                           // dispara o timer1
        T3CON.TMR3ON=1;                                           // dispara o timer3
        
        for(;;){//------------------------------------------------// Loop infinito
           
           while((Matlab_Serial_data!='1')&&(Matlab_Serial_data!='2')&&(Matlab_Serial_data!='3')){
               if (UART1_Data_Ready()){                           // Espera chagar dados na serial
                  Matlab_Serial_data = UART1_Read();
               }
           }
           set_arm_Position(72.66,88,67.7);                       // Posição inicial HOME
           set_arm_Position(105,86,160);                          // Posição peça
           magnet=1;
           set_arm_Position(107,83.57,124.8);
           
           if(Matlab_Serial_data=='1'){                           //Se for na primeira caixa
               set_arm_Position(127,58.3,119);
               set_arm_Position(103.2,48.7,138.7);                // Posição da primeira caixa
               magnet=0;
               set_arm_Position(127,58.3,119);
               set_arm_Position(72.66,88,67.7);                   // Posição inicial HOME
           }

           else if(Matlab_Serial_data=='2'){                      //Se for na segunda caixa
               set_arm_Position(122,48,104.8);
               set_arm_Position(88.5,32.7,128);                   // Posição da segunda caixa
               magnet=0;
               Delay_ms(600);
               set_servo_1(77);
               set_servo_3(135);                                   // balança para arruela cair
               Delay_ms(300);
               set_servo_1(88.5);
               set_servo_3(128);
               Delay_ms(300);
               set_arm_Position(122,48,104.8);
               set_arm_Position(72.66,88,67.7);                   // Posição inicial HOME
           }

           else if(Matlab_Serial_data=='3'){                      //Se for na terceira caixa
               set_arm_Position(111.7,45.9,86.3);
               set_arm_Position(96.77,19.7,99);
               set_arm_Position(80.7,6.51,126.86);                // Posição da terceira caixa
               magnet=0;
               set_arm_Position(96.77,19.7,99);
               set_arm_Position(72.66,88,67.7);                   // Posição inicial HOME
           }
           
           Matlab_Serial_data=0;

        }

}