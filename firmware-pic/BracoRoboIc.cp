#line 1 "C:/Users/igor_/Documents/Microcontroladores/PIC/Mikroc/BracoRoboIc/BracoRoboIc.c"





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

float adc1;
float adc2;
float adc3;

float old_position_1=72.66;
float old_position_2=88;
float old_position_3=67.7;


unsigned char disp[10];

void interrupt(){
 if (INTCON.TMR0IF){
 if( PORTC.RC3 ){
  PORTC.RC3 =0;


 TMR0H=TIMER0LOWVALUE>>8;
 TMR0L=TIMER0LOWVALUE;
 }
 else {
  PORTC.RC3 =1;


 TMR0H=TIMER0HIGHVALUE>>8;
 TMR0L=TIMER0HIGHVALUE;
 }
 INTCON.TMR0IF=0;
 }

 if (PIR1.TMR1IF){
 if( PORTD.RD0 ){
  PORTD.RD0 =0;


 TMR1H=TIMER1LOWVALUE>>8;
 TMR1L=TIMER1LOWVALUE;
 }
 else {
  PORTD.RD0 =1;


 TMR1H=TIMER1HIGHVALUE>>8;
 TMR1L=TIMER1HIGHVALUE;
 }
 PIR1.TMR1IF=0;
 }

 if (PIR2.TMR3IF){
 if( PORTD.RD1 ){
  PORTD.RD1 =0;


 TMR3H=TIMER3LOWVALUE>>8;
 TMR3L=TIMER3LOWVALUE;
 }
 else {
  PORTD.RD1 =1;


 TMR3H=TIMER3HIGHVALUE>>8;
 TMR3L=TIMER3HIGHVALUE;
 }
 PIR2.TMR3IF=0;
 }

}
void set_servo_1(float angle_1){
 duty1=0.022+angle_1*0.092/180;
 TIMER0HIGHVALUE_auxiliar=65535-duty1*50000;
 TIMER0LOWVALUE_auxiliar=((65535-TIMER0HIGHVALUE)+15535);
 TIMER0HIGHVALUE=TIMER0HIGHVALUE_auxiliar;
 TIMER0LOWVALUE=TIMER0LOWVALUE_auxiliar;

}

void set_servo_2(float angle_2){
 duty2=0.022+angle_2*0.092/180;
 TIMER1HIGHVALUE_auxiliar=65535-duty2*50000;
 TIMER1LOWVALUE_auxiliar=((65535-TIMER1HIGHVALUE)+15535);
 TIMER1HIGHVALUE=TIMER1HIGHVALUE_auxiliar;
 TIMER1LOWVALUE=TIMER1LOWVALUE_auxiliar;

}

void set_servo_3(float angle_3){
 duty3=0.022+angle_3*0.092/180;
 TIMER3HIGHVALUE_auxiliar=65535-duty3*50000;
 TIMER3LOWVALUE_auxiliar=((65535-TIMER3HIGHVALUE)+15535);
 TIMER3HIGHVALUE=TIMER3HIGHVALUE_auxiliar;
 TIMER3LOWVALUE=TIMER3LOWVALUE_auxiliar;

}

void set_arm_Position(float Position_1,float Position_2,float Position_3){
 float movimento_1 = Position_1 - old_position_1;
 float movimento_2 = Position_2 - old_position_2;
 float movimento_3 = Position_3 - old_position_3;
 if (abs(movimento_1)> abs(movimento_2)){
 if (abs(movimento_1)> abs(movimento_3)){
 movimento_2=movimento_2/(abs(movimento_1)*10);
 movimento_3=movimento_3/(abs(movimento_1)*10);
 movimento_1=movimento_1/(abs(movimento_1)*10);
 while(((abs(Position_1-old_position_1))>0.2)){
 old_position_1=old_position_1+movimento_1;
 old_position_2=old_position_2+movimento_2;
 old_position_3=old_position_3+movimento_3;
 set_servo_1(old_position_1);
 set_servo_2(old_position_2);
 set_servo_3(old_position_3);
 delay_ms(4);
 }
 }
 else {
 movimento_1=movimento_1/(abs(movimento_3)*10);
 movimento_2=movimento_2/(abs(movimento_3)*10);
 movimento_3=movimento_3/(abs(movimento_3)*10);
 while(((abs(Position_3-old_position_3))>0.2)){
 old_position_1=old_position_1+movimento_1;
 old_position_2=old_position_2+movimento_2;
 old_position_3=old_position_3+movimento_3;
 set_servo_1(old_position_1);
 set_servo_2(old_position_2);
 set_servo_3(old_position_3);
 delay_ms(4);
 }
 }
 }
 else if (abs(movimento_2)>abs(movimento_3)){
 movimento_1=movimento_1/(abs(movimento_2)*10);
 movimento_3=movimento_3/(abs(movimento_2)*10);
 movimento_2=movimento_2/(abs(movimento_2)*10);
 while(((abs(Position_2-old_position_2))>0.2)){
 old_position_1=old_position_1+movimento_1;
 old_position_2=old_position_2+movimento_2;
 old_position_3=old_position_3+movimento_3;
 set_servo_1(old_position_1);
 set_servo_2(old_position_2);
 set_servo_3(old_position_3);
 delay_ms(4);
 }
 }
 else {
 movimento_1=movimento_1/(abs(movimento_3)*10);
 movimento_2=movimento_2/(abs(movimento_3)*10);
 movimento_3=movimento_3/(abs(movimento_3)*10);
 while(((abs(Position_3-old_position_3))>0.2)){
 old_position_1=old_position_1+movimento_1;
 old_position_2=old_position_2+movimento_2;
 old_position_3=old_position_3+movimento_3;
 set_servo_1(old_position_1);
 set_servo_2(old_position_2);
 set_servo_3(old_position_3);
 delay_ms(4);
 }
 }

 set_servo_1(Position_1);
 set_servo_2(Position_2);
 set_servo_3(Position_3);
 old_position_1=Position_1;
 old_position_2=Position_2;
 old_position_3=Position_3;

}

void main() {




 TRISC.RC3=0;
 TRISD.RD0=0;
 TRISD.RD1=0;
 TRISE.RE0=0;

  PORTC.RC3 =1;
  PORTD.RD0 =1;
  PORTD.RD1 =1;
  PORTE.RE0 =0;

 ADCON1=0x0C;
 ADCON2=0x80;

 RCSTA<7>=1;
 TRISC.RC7=1;
 TRISC.RC6=1;
 UART1_Init(9600);
 Delay_ms(100);
 set_arm_Position(72.66,88,67.7);


 T0CON=0x00;
 TMR0H=TIMER0HIGHVALUE>>8;
 TMR0L=TIMER0HIGHVALUE;

 T1CON=0x14;
 TMR1H=TIMER1HIGHVALUE>>8;
 TMR1L=TIMER1HIGHVALUE;

 T3CON=0x14;
 TMR3H=TIMER3HIGHVALUE>>8;
 TMR3L=TIMER3HIGHVALUE;


 INTCON=0xE0;
 PIE1|=(1<<TMR1IE);
 PIE2|=(1<<TMR3IE);


 T0CON.TMR0ON=1;
 T1CON.TMR1ON=1;
 T3CON.TMR3ON=1;

 for(;;){

 while((Matlab_Serial_data!='1')&&(Matlab_Serial_data!='2')&&(Matlab_Serial_data!='3')){
 if (UART1_Data_Ready()){
 Matlab_Serial_data = UART1_Read();
 }
 }
 set_arm_Position(72.66,88,67.7);
 set_arm_Position(105,86,160);
  PORTE.RE0 =1;
 set_arm_Position(107,83.57,124.8);

 if(Matlab_Serial_data=='1'){
 set_arm_Position(127,58.3,119);
 set_arm_Position(103.2,48.7,138.7);
  PORTE.RE0 =0;
 set_arm_Position(127,58.3,119);
 set_arm_Position(72.66,88,67.7);
 }

 else if(Matlab_Serial_data=='2'){
 set_arm_Position(122,48,104.8);
 set_arm_Position(88.5,32.7,128);
  PORTE.RE0 =0;
 Delay_ms(600);
 set_servo_1(77);
 set_servo_3(135);
 Delay_ms(300);
 set_servo_1(88.5);
 set_servo_3(128);
 Delay_ms(300);
 set_arm_Position(122,48,104.8);
 set_arm_Position(72.66,88,67.7);
 }

 else if(Matlab_Serial_data=='3'){
 set_arm_Position(111.7,45.9,86.3);
 set_arm_Position(96.77,19.7,99);
 set_arm_Position(80.7,6.51,126.86);
  PORTE.RE0 =0;
 set_arm_Position(96.77,19.7,99);
 set_arm_Position(72.66,88,67.7);
 }

 Matlab_Serial_data=0;

 }

}
