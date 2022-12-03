//Global Variables
ArrayList<Doctor> allDoctors = new ArrayList<Doctor>();
ArrayList<Patient> allPatients = new ArrayList<Patient>();
import g4p_controls.*;
PImage img;



Building building = new Building (4,100,600,800,50);
void setup(){
  //img = loadImage ("yep.jpg");
  size(600,800);
  
 
  
  Patient ss = new Patient (0,0,99, false,false,false,300,700);
  allPatients.add(ss);
  
  createGUI();
  building.createBuilding();

}


void draw(){
  
  if (frameCount%20==0){
    Patient newPatient = new Patient (0,0,int(random(1,100)), false,false,false,300,800);
    allPatients.add(newPatient);
  }
  //println(allPatients.get(0).currentDoctor);
  background(210);
  building.drawBuilding();
  
  for(Doctor doctor:allDoctors){ 
    
    //randomly assigning patients to doctors;
    doctor.drawDr();
    if (doctor.currentPatient == null){ //if room is empty
      
      Patient currPat = allPatients.get(int(random(allPatients.size())));
      //pick random patient
      if (currPat.currentDoctor == null){
        currPat.currentDoctor = doctor;
        doctor.currentPatient = currPat;
      //print(doctor.currentPatient.patientX);
      }
    }
    
    else{
      if (doctor.currentPatient.reachedDoctor){
        doctor.healPatient();
      }
    }
  }
  
  
  for (Patient patient:allPatients){
    patient.updateColor();
    if(patient.isHealthy == false){//need if here, if patient is not already healed
    patient.drawPa();
    
    patient.timeSinceEntered++;
    
    if (patient.currentDoctor != null){
      
      if (patient.patientY == patient.currentDoctor.yPos){
        //if patient same height as doctor
        if (abs(patient.patientX - patient.currentDoctor.xPos)==15){
          patient.reachedDoctor = true;
        }
        if (patient.patientX < patient.currentDoctor.xPos && patient.reachedDoctor == false){
          patient.patientX++;
        }
        else if (patient.patientX > patient.currentDoctor.xPos && patient.reachedDoctor == false){
          patient.patientX--;
        }
        
        
      }
      else{
        //if not at same height keep going up
        patient.patientY--;
      }
      
    }
    else{
      patient.patientY--;
    }
  }
  else if(patient.isHealthy == true){
    patient.drawPa();
    if (patient.patientX != building.pathWidth/2 + building.xWidth){
      if (patient.patientX < patient.currentDoctor.xPos && patient.reachedDoctor == true){
        patient.patientX--;
      }
      else if (patient.patientX > patient.currentDoctor.xPos && patient.reachedDoctor == true){
        patient.patientX++;
      }
    }
    else{
     patient.patientY--; 
    }
  }
  }
  
  
}
