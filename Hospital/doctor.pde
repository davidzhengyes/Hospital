class Doctor {
 //fields
 float doctorSkill;
 float doctorSpeed;
 color doctorColor;
 int xPos;
 int yPos;
 
 //constructor
 Doctor(int x, int y){
   this.doctorSkill = 1;
   this.doctorSpeed = 1;
   this.doctorColor = color(0, 0, 255);
   this.xPos = x;
   this.yPos = y;
 }
 
 
 //methods 
 void healPatient(Patient p){
  //p.injurySeverity += 1;
 }
 
 void drawDr(){
   fill(doctorColor);
   circle(this.xPos, this.yPos, 15);
   noStroke();
 }
 
 
}
