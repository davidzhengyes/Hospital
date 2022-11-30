class Doctor {
 //fields
 float doctorSkill;
 float doctorSpeed;
 color doctorColor;
 
 //constructor
 Doctor(float dsk, float dsp){
   this.doctorSkill = dsk;
   this.doctorSpeed = dsp;
   this.doctorColor = color(0, 0, 255);
 }
 
 
 //methods 
 void healPatient(Patient p){
  //p.injurySeverity += 1;
 }
 
 void drawDr(){
   fill(doctorColor);
   circle(x, y, 15);
 }
 
 
}
