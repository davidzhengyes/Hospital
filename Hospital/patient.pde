class Patient {
  int timeSinceEntered; 
  int treatmentTime;
  
  float injurySeverity;
  color patientColor;
  
  boolean isDead;
  boolean isHealthy;
  boolean isSeated;
  
  float patientX;
  float patientY;
  
  Doctor currentDoctor;
  
   //constructor
  Patient(int tSE, int tT, float iS, boolean iD, boolean iH, boolean ss, float pX, float pY) {
    this.timeSinceEntered = tSE;  
    this.treatmentTime = tT;
    this.injurySeverity = iS; //please limit between 0 & 100
    this.isDead = iD;   
    this.isHealthy = iH;
    this.isSeated = ss;
    this.patientX = pX;
    this.patientY = pY;
    
    this.currentDoctor = null;
    
    if (injurySeverity<=50){
      this.patientColor = color(injurySeverity/50.0*255,255,0);
    }
    else{
      this.patientColor = color(255, (100-injurySeverity)/50.0*255,0);
    }
  }
  
  void drawPa(){
    fill(patientColor);
    circle(patientX,patientY,15);
  }

}
