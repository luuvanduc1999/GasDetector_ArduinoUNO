int mq2=9;
int button=10; 
int ledcb=11;
int ledbm=12;
int coichip=13;
int num=0;
void setup()  {
  pinMode (mq2, INPUT_PULLUP); //PIN DIGITAL IN TU CAM BIEN MQ2
  pinMode (button, INPUT_PULLUP); //PIN TU NUT NHANcanh bao bao dong
  pinMode(coichip, OUTPUT); //PIN OUT coi chip
  pinMode(ledbm, OUTPUT); // PIN OUT DEN BAO NGUON
  pinMode(ledcb, OUTPUT); //PIN out den canh bao

void beep(int delayms, int tones) {
  analogWrite(coichip, tones);    // Phat ra coi chip xung co gia tri tones PWM
  delay(delayms);          // Ngung mot luc
  analogWrite(coichip, 0);       // Dung  coi chip lai }

void loop()  { 
  if (digitalRead(button)==LOW) {
      if (num==0) num=1; else num=0;
      delay(200);  }
  if (num==1) {
    digitalWrite (ledbm, HIGH); //BAO MACH DANG HOAT DONG 
    while (digitalRead (mq2) == 0) { //Neu Dout cua MQ2 con bang 0 thi dang co khi gas
      digitalWrite (ledbm, LOW); //Tat den bao mach
      digitalWrite (ledcb, HIGH);  //Lam sang den canh bao
      beep(3000, 500); //Cho coi chip phat am thanh
      digitalWrite (ledcb, LOW); //Tat den canh bao 
    }
    digitalWrite (ledbm, HIGH); //BAO MACH DANG HOAT DONG
  } 
  else  digitalWrite (ledbm, LOW); //Tat den bao 
}
