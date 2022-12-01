class Patient {
  int timeSinceEntered; 
  int treatmentTime;
  
  float injurySeverity;
  color PatientColor;
  
  boolean isDead;
  boolean isHealthy;
  boolean isSeated;
  
  float patientX;
  float patientY;
  
   //constructor
  Patient(int tSE, int tT, float iS, boolean iD, boolean iH, boolean ss, float pX, float pY, color PC) {
    this.timeSinceEntered = tSE;
    this.treatmentTime = tT;
    this.injurySeverity = iS;
    this.isDead = iD;   
    this.isHealthy = iH;
    this.isSeated = ss;
    this.PatientColor = PC;
    this.patientX = pX;
    this.patientY = pY;
  }

}
