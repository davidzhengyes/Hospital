//Global Variables
ArrayList<Doctor> allDoctors = new ArrayList<Doctor>();
ArrayList<Patient> allPatients = new ArrayList<Patient>();
import g4p_controls.*;
PImage img;



Building building = new Building (4,100,600,800,50);
void setup(){
  //img = loadImage ("yep.jpg");
  size(600,800);
  
 
  
  Patient ss = new Patient (0,0,0, false,false,false,300,700);
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
  
  for(int i = 0; i < allDoctors.size(); i++){ 
    
    //randomly assigning patients to doctors;
    allDoctors.get(i).drawDr();
    if (allDoctors.get(i).currentPatient == null){ //if room is empty
      
      Patient currPat = allPatients.get(int(random(allPatients.size())));
      //pick random patient
      if (currPat.currentDoctor == null){
        currPat.currentDoctor = allDoctors.get(i);
        allDoctors.get(i).currentPatient = currPat;
      //print(allDoctors.get(i).currentPatient.patientX);
      }
    }
  }
  
  
  for (int i=0; i<allPatients.size(); i++){
    //need if here, if patient is not already healed
    allPatients.get(i).drawPa();
    
    allPatients.get(i).timeSinceEntered++;
    
    if (allPatients.get(i).currentDoctor != null){
      
      if (allPatients.get(i).patientY == allPatients.get(i).currentDoctor.yPos){
        //if patient same height as doctor
        if (abs(allPatients.get(i).patientX - allPatients.get(i).currentDoctor.xPos)==15){
          allPatients.get(i).reachedDoctor = true;
        }
        if (allPatients.get(i).patientX < allPatients.get(i).currentDoctor.xPos && allPatients.get(i).reachedDoctor == false){
          allPatients.get(i).patientX++;
        }
        else if (allPatients.get(i).patientX > allPatients.get(i).currentDoctor.xPos && allPatients.get(i).reachedDoctor == false){
          allPatients.get(i).patientX--;
        }
        
        
      }
      else{
        //if not at same height keep going up
        allPatients.get(i).patientY--;
      }
      
    }
    else{
      allPatients.get(i).patientY--;
    }
  }
  
  
}
